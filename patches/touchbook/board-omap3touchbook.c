/*
 * linux/arch/arm/mach-omap2/board-omap3touchbook.c
 * This file supports the Touch Book v1 (board rev
 * A1/B1/C1), as well as Touch Book v2 or Smart Book
 * (board rev rev D5).
 *
 * linux/arch/arm/mach-omap2/board-omap3touchbook.c
 *
 * Copyright (C) 2009-2010 Always Innovating
 *
 * Modified from mach-omap2/board-omap3beagleboard.c
 *
 * Code: Grégoire Gentil, Tim Yamin
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 */

#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/delay.h>
#include <linux/err.h>
#include <linux/clk.h>
#include <linux/io.h>
#include <linux/leds.h>
#include <linux/gpio.h>
#include <linux/irq.h>
#include <linux/input.h>
#include <linux/gpio_keys.h>

#include <linux/mtd/mtd.h>
#include <linux/mtd/partitions.h>
#include <linux/mtd/nand.h>
#include <plat/mcspi.h>
#include <linux/spi/spi.h>

#include <linux/spi/ads7846.h>
#include <linux/mma7455l.h>
#include <linux/regulator/machine.h>
#include <linux/i2c/twl.h>
#include <linux/i2c/chacha.h>
#include <linux/i2c/bq27x00.h>
#include <linux/i2c-gpio.h>
#include <mach/hardware.h>
#include <asm/mach-types.h>
#include <asm/mach/arch.h>
#include <asm/mach/map.h>
#include <asm/mach/flash.h>

#include <plat/board.h>
#include <plat/common.h>
#include <plat/display.h>
#include <plat/gpmc.h>
#include <plat/nand.h>
#include <plat/usb.h>
#include <plat/timer-gp.h>
#include <plat/clock.h>
#include <plat/omap-pm.h>
#include "mux.h"
#include "hsmmc.h"
#include "pm.h"
#include "omap3-opp.h"
#include <asm/setup.h>
#include <plat/dmtimer.h>
#include <linux/backlight.h>

#define NAND_BLOCK_SIZE		SZ_128K

#define OMAP3_AC_GPIO		136
#define OMAP3_TS_GPIO		162
#define TB_BL_PWM_TIMER		9
#define TB_KILL_POWER_GPIO	168

static unsigned long touchbook_revision;

static struct mtd_partition omap3touchbook_nand_partitions[] = {
	/* All the partition sizes are listed in terms of NAND block size */
	{
		.name		= "X-Loader",
		.offset		= 0,
		.size		= 4 * NAND_BLOCK_SIZE,
		.mask_flags	= MTD_WRITEABLE,	/* force read-only */
	},
	{
		.name		= "U-Boot",
		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x80000 */
		.size		= 15 * NAND_BLOCK_SIZE,
	},
	{
		.name		= "U-Boot Env",
		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x260000 */
		.size		= 1 * NAND_BLOCK_SIZE,
	},
	{
		.name		= "Kernel",
		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x280000 */
		.size		= 32 * NAND_BLOCK_SIZE,
	},
	{
		.name		= "File System",
		.offset		= MTDPART_OFS_APPEND,	/* Offset = 0x680000 */
		.size		= MTDPART_SIZ_FULL,
	},
};

static struct omap_nand_platform_data omap3touchbook_nand_data = {
	.options	= NAND_BUSWIDTH_16,
	.parts		= omap3touchbook_nand_partitions,
	.nr_parts	= ARRAY_SIZE(omap3touchbook_nand_partitions),
	.dma_channel	= -1,		/* disable DMA in OMAP NAND driver */
	.nand_setup	= NULL,
	.dev_ready	= NULL,
};

#include "sdram-micron-mt46h32m32lf-6.h"

static int touchbook_enable_dvi(struct omap_dss_device *dssdev)
{
	if (dssdev->reset_gpio != -1)
		gpio_set_value(dssdev->reset_gpio, 1);

	return 0;
}

static void touchbook_disable_dvi(struct omap_dss_device *dssdev)
{
	if (dssdev->reset_gpio != -1)
		gpio_set_value(dssdev->reset_gpio, 0);
}

static struct omap_dss_device touchbook_dvi_device = {
	.type = OMAP_DISPLAY_TYPE_DPI,
	.name = "dvi",
	.driver_name = "generic_panel",
	.phy.dpi.data_lines = 24,
	.reset_gpio = 176,
	.platform_enable = touchbook_enable_dvi,
	.platform_disable = touchbook_disable_dvi,
};

static struct omap_dss_device *touchbook_dss_devices[] = {
	&touchbook_dvi_device,
};

static struct omap_dss_board_info touchbook_dss_data = {
	.num_devices = ARRAY_SIZE(touchbook_dss_devices),
	.devices = touchbook_dss_devices,
	.default_device = &touchbook_dvi_device,
};

static struct platform_device touchbook_dss_device = {
	.name		= "omapdss",
	.id		= -1,
	.dev            = {
		.platform_data = &touchbook_dss_data,
	},
};

static struct regulator_consumer_supply touchbook_vdac_supply = {
	.supply		= "vdda_dac",
	.dev		= &touchbook_dss_device.dev,
};

static struct regulator_consumer_supply touchbook_vdvi_supply = {
	.supply		= "vdds_dsi",
	.dev		= &touchbook_dss_device.dev,
};

static void __init touchbook_display_init(void)
{
	int r;

	r = gpio_request(touchbook_dvi_device.reset_gpio, "DVI reset");
	if (r < 0) {
		printk(KERN_ERR "Unable to get DVI reset GPIO\n");
		return;
	}

	gpio_direction_output(touchbook_dvi_device.reset_gpio, 0);
}

static struct omap2_hsmmc_info mmc[] = {
	{
		.mmc		= 1,
		.caps		= MMC_CAP_4_BIT_DATA | MMC_CAP_8_BIT_DATA,
		.gpio_wp	= -EINVAL,
	},
	{}	/* Terminator */
};

static struct regulator_consumer_supply touchbook_vmmc1_supply = {
	.supply			= "vmmc",
};

static struct regulator_consumer_supply touchbook_vsim_supply = {
	.supply			= "vmmc_aux",
};

static struct gpio_led gpio_leds[];

static int touchbook_twl_gpio_setup(struct device *dev,
		unsigned gpio, unsigned ngpio)
{
	/* gpio + 0 is "mmc0_cd" (input/IRQ) */
	mmc[0].gpio_cd = gpio + 0;
	omap2_hsmmc_init(mmc);

	/* link regulators to MMC adapters */
	touchbook_vmmc1_supply.dev = mmc[0].dev;
	touchbook_vsim_supply.dev = mmc[0].dev;

	return 0;
}

static struct twl4030_gpio_platform_data touchbook_gpio_data = {
	.gpio_base	= OMAP_MAX_GPIO_LINES,
	.irq_base	= TWL4030_GPIO_IRQ_BASE,
	.irq_end	= TWL4030_GPIO_IRQ_END,
	.use_leds	= true,
	.pullups	= BIT(1),
	.pulldowns	= BIT(2) | BIT(6) | BIT(7) | BIT(8) | BIT(13)
				| BIT(15) | BIT(16) | BIT(17),
	.setup		= touchbook_twl_gpio_setup,
};

/* VMMC1 for MMC1 pins CMD, CLK, DAT0..DAT3 (20 mA, plus card == max 220 mA) */
static struct regulator_init_data touchbook_vmmc1 = {
	.constraints = {
		.min_uV			= 1850000,
		.max_uV			= 3150000,
		.valid_modes_mask	= REGULATOR_MODE_NORMAL
					| REGULATOR_MODE_STANDBY,
		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
					| REGULATOR_CHANGE_MODE
					| REGULATOR_CHANGE_STATUS,
	},
	.num_consumer_supplies	= 1,
	.consumer_supplies	= &touchbook_vmmc1_supply,
};

/* VSIM for MMC1 pins DAT4..DAT7 (2 mA, plus card == max 50 mA) */
static struct regulator_init_data touchbook_vsim = {
	.constraints = {
		.min_uV			= 1800000,
		.max_uV			= 3000000,
		.valid_modes_mask	= REGULATOR_MODE_NORMAL
					| REGULATOR_MODE_STANDBY,
		.valid_ops_mask		= REGULATOR_CHANGE_VOLTAGE
					| REGULATOR_CHANGE_MODE
					| REGULATOR_CHANGE_STATUS,
	},
	.num_consumer_supplies	= 1,
	.consumer_supplies	= &touchbook_vsim_supply,
};

/* VDAC for DSS driving S-Video (8 mA unloaded, max 65 mA) */
static struct regulator_init_data touchbook_vdac = {
	.constraints = {
		.min_uV			= 1800000,
		.max_uV			= 1800000,
		.valid_modes_mask	= REGULATOR_MODE_NORMAL
					| REGULATOR_MODE_STANDBY,
		.valid_ops_mask		= REGULATOR_CHANGE_MODE
					| REGULATOR_CHANGE_STATUS,
	},
	.num_consumer_supplies	= 1,
	.consumer_supplies	= &touchbook_vdac_supply,
};

/* VPLL2 for digital video outputs */
static struct regulator_init_data touchbook_vpll2 = {
	.constraints = {
		.name			= "VDVI",
		.min_uV			= 1800000,
		.max_uV			= 1800000,
		.valid_modes_mask	= REGULATOR_MODE_NORMAL
					| REGULATOR_MODE_STANDBY,
		.valid_ops_mask		= REGULATOR_CHANGE_MODE
					| REGULATOR_CHANGE_STATUS,
	},
	.num_consumer_supplies	= 1,
	.consumer_supplies	= &touchbook_vdvi_supply,
};

static struct twl4030_usb_data touchbook_usb_data = {
	.usb_mode	= T2_USB_MODE_ULPI,
};

static struct twl4030_codec_audio_data touchbook_audio_data = {
	.audio_mclk = 26000000,
};

static struct twl4030_codec_data touchbook_codec_data = {
	.audio_mclk = 26000000,
	.audio = &touchbook_audio_data,
};

static struct twl4030_madc_platform_data touchbook_madc_data = {
	.irq_line	= 1,
};

static struct twl4030_bci_platform_data touchbook_bci_data = {
	.tblsize		= 0,
	.no_backup_battery	= 1,
	.manufacturer		= "Always Innovating",
	.model_name		= "Tablet 6000mAh v1.0",
	.technology		= POWER_SUPPLY_TECHNOLOGY_LIPO,
	.energy_full_design	= 6000,
};

static struct twl4030_platform_data touchbook_twldata = {
	.irq_base	= TWL4030_IRQ_BASE,
	.irq_end	= TWL4030_IRQ_END,

	/* platform_data for children goes here */
	.usb		= &touchbook_usb_data,
	.gpio		= &touchbook_gpio_data,
	.codec		= &touchbook_codec_data,
	.madc		= &touchbook_madc_data,
	.vmmc1		= &touchbook_vmmc1,
	.vsim		= &touchbook_vsim,
	.vdac		= &touchbook_vdac,
	.vpll2		= &touchbook_vpll2,
	.bci		= &touchbook_bci_data,
};

static struct i2c_board_info __initdata touchbook_i2c_boardinfo_1[] = {
	{
		I2C_BOARD_INFO("twl4030", 0x48),
		.flags = I2C_CLIENT_WAKE,
		.irq = INT_34XX_SYS_NIRQ,
		.platform_data = &touchbook_twldata,
	},
};

static struct bq27x00_platform_data touchbook_bq27200_data = {
	.manufacturer		= "Always Innovating",
	.model_name		= "Keyboard 12000mAh v1.0",
	.technology		= POWER_SUPPLY_TECHNOLOGY_LIPO,
	.energy_full_design	= 12000,
};

static struct chacha_platform_data touchbook_chacha_t_data = {
	.gpio		= 155,
	.version	= 3,
	.name		= "Touchscreen Chacha Tablet",
	.minX		= 128,
	.maxX		= 17230,
	.minY		= 55555,
	.maxY		= 65300,
};

static struct i2c_board_info __initdata touchbook_i2c_boardinfo_3[] = {
	{
		I2C_BOARD_INFO("bq27200", 0x55),
		.platform_data = &touchbook_bq27200_data,
	},
 	{
		I2C_BOARD_INFO("chacha", 0x40),
		.irq = OMAP_GPIO_IRQ(155),
		.platform_data = &touchbook_chacha_t_data,
	},
	{
		I2C_BOARD_INFO("ds1307", 0x68),
	},
};

static int __init omap3_touchbook_i2c_init(void)
{
	int ret;

	/* Standard TouchBook bus */
	omap_register_i2c_bus(1, 2600, touchbook_i2c_boardinfo_1, ARRAY_SIZE(touchbook_i2c_boardinfo_1));

	/* Additional TouchBook bus */
	omap_register_i2c_bus(3, 100, touchbook_i2c_boardinfo_3, ARRAY_SIZE(touchbook_i2c_boardinfo_3));

	ret = gpio_request(touchbook_chacha_t_data.gpio, "chacha_t");
	if (ret < 0) {
		printk(KERN_ERR "Failed to request GPIO %d for chacha_t IRQ\n", touchbook_chacha_t_data.gpio);
		return 0;
	}
	gpio_direction_input(touchbook_chacha_t_data.gpio);

	return 0;
}

static struct ads7846_platform_data ads7846_config = {
	.x_min			= 100,
	.y_min			= 265,
	.x_max			= 3950,
	.y_max			= 3750,
	.x_plate_ohms		= 40,
	.pressure_max		= 255,
	.debounce_max		= 10,
	.debounce_tol		= 5,
	.debounce_rep		= 1,
	.gpio_pendown		= OMAP3_TS_GPIO,
	.keep_vref_on		= 1,
};

static struct omap2_mcspi_device_config ads7846_mcspi_config = {
	.turbo_mode	= 0,
	.single_channel	= 1,	/* 0: slave, 1: master */
};

static struct spi_board_info omap3_ads7846_spi_board_info[] __initdata = {
	{
		.modalias		= "ads7846",
		.bus_num		= 4,
		.chip_select		= 0,
		.max_speed_hz		= 1500000,
		.controller_data	= &ads7846_mcspi_config,
		.irq			= OMAP_GPIO_IRQ(OMAP3_TS_GPIO),
		.platform_data		= &ads7846_config,
	}
};

static struct gpio_led gpio_leds[] = {
	{
		.name			= "touchbook::usr0",
		.default_trigger	= "heartbeat",
		.gpio			= 150,
	},
	{
		.name			= "touchbook::usr1",
		.default_trigger	= "mmc0",
		.gpio			= 149,
	},
};

static struct gpio_led_platform_data gpio_led_info = {
	.leds		= gpio_leds,
	.num_leds	= ARRAY_SIZE(gpio_leds),
};

static struct platform_device leds_gpio = {
	.name	= "leds-gpio",
	.id	= -1,
	.dev	= {
		.platform_data	= &gpio_led_info,
	},
};

static struct gpio_keys_button gpio_buttons[] = {
	{
		.code			= KEY_BACK,
		.gpio			= 7,
		.desc			= "user",
		.wakeup			= 1,
	},
	{
		.code			= KEY_POWER,
		.gpio			= 183,
		.desc			= "power",
		.wakeup			= 1,
		.active_low		= 1,
	},
};

static struct gpio_keys_platform_data gpio_key_info = {
	.buttons	= gpio_buttons,
	.nbuttons	= ARRAY_SIZE(gpio_buttons),
};

static struct platform_device keys_gpio = {
	.name	= "gpio-keys",
	.id	= -1,
	.dev	= {
		.platform_data	= &gpio_key_info,
	},
};

static void __init touchbook_ads7846_init(void)
{
	if (gpio_request(ads7846_config.gpio_pendown, "ads7846_pen_down")) {
		printk(KERN_ERR "Failed to request GPIO %d for ads7846 pen down IRQ\n", ads7846_config.gpio_pendown);
		return;
	}

	gpio_direction_input(ads7846_config.gpio_pendown);
	omap_set_gpio_debounce(ads7846_config.gpio_pendown, 1);
	omap_set_gpio_debounce_time(ads7846_config.gpio_pendown, 0xa);
}

static struct mma7455l_platform_data touchbook_mma7455l_config = {
	.calibration_x = -4,
	.calibration_y = 28,
	.calibration_z = -28,
	.axis_x = ABS_X,
	.sign_x = 1,
	.axis_y = ABS_Y,
	.sign_y = 1,
	.axis_z = ABS_Z,
	.sign_z = 1,
};

static struct omap2_mcspi_device_config touchbook_mma7455l_mcspi_config = {
	.turbo_mode	= 0,
	.single_channel	= 1,	/* 0: slave, 1: master */
};

static struct spi_board_info __initdata touchbook_spi_board_info_3[] = {
	{
		.modalias		= "mma7455l",
		.bus_num		= 3,
		.chip_select		= 0,
		.max_speed_hz		= 200000,
		.irq			= OMAP_GPIO_IRQ(136),
		.controller_data	= &touchbook_mma7455l_mcspi_config,
		.platform_data		= &touchbook_mma7455l_config,
	}
};

static void __init touchbook_mma7455l_init(void)
{
	int ret;
	int touchbook_mma7455l_gpio = 136;

	ret = gpio_request(touchbook_mma7455l_gpio, "mma7455l");
	if (ret < 0) {
		printk(KERN_ERR "Failed to request GPIO %d for mma7455l IRQ\n", touchbook_mma7455l_gpio);
		return;
	}

	gpio_direction_input(touchbook_mma7455l_gpio);
}

static int touchbook_backlight_brightness = 50;
static struct omap_dm_timer *touchbook_backlight_pwm;

static int touchbook_backlight_read(struct backlight_device *bd)
{
	return touchbook_backlight_brightness;
}

static int touchbook_backlight_update(struct backlight_device *bd)
{
	int value = bd->props.brightness;
	touchbook_backlight_brightness = value;

	/* Frequency calculation:
	   - For 200Hz PWM, you want to load -164 (=> -32768Hz / 200Hz).
	   - Minimum duty cycle for the backlight is 15%.
	   - You have (164*0.85) => ~140 levels of brightness.
	*/

	/* Halve input brightness */
	if (!bd->props.boost)
		value /= 2;

	/* For maximum brightness, just stop the timer... */
	if(value != bd->props.max_brightness)
	{
		/* Load the appropriate value for 200Hz PWM */
		u32 period = clk_get_rate(omap_dm_timer_get_fclk(touchbook_backlight_pwm)) / bd->props.pwm_fq;

		/* Minimum duty cycle is 15% */
		u32 minimum = (period * bd->props.min_duty) / 100;
		u32 maximum = (period * 17) / 20;

		/* Work out match value */
		u32 match = (maximum * value) / 100;

		/* Start... */
		omap_dm_timer_set_load(touchbook_backlight_pwm, 1, 0xFFFFFFFF - period - 1);
		omap_dm_timer_set_match(touchbook_backlight_pwm, 1, 0xFFFFFFFF - minimum - match);
		omap_dm_timer_write_counter(touchbook_backlight_pwm, -1);
		omap_dm_timer_start(touchbook_backlight_pwm);
	}
	else
		omap_dm_timer_stop(touchbook_backlight_pwm);


	return 0;
}

static struct backlight_ops touchbook_backlight_properties = {
	.get_brightness = touchbook_backlight_read,
	.update_status = touchbook_backlight_update,
};

static void __init touchbook_backlight_init(void)
{
	static struct backlight_device *bd;
	int touchbook_bl_pwm_timer = 9;
	bd = backlight_device_register("touchbook", NULL, NULL, &touchbook_backlight_properties);

	if(bd)
	{
		touchbook_backlight_pwm = omap_dm_timer_request_specific(touchbook_bl_pwm_timer);
		omap_dm_timer_enable(touchbook_backlight_pwm);
		omap_dm_timer_set_source(touchbook_backlight_pwm, OMAP_TIMER_SRC_SYS_CLK);
		omap_dm_timer_set_pwm(touchbook_backlight_pwm, 1, 1, OMAP_TIMER_TRIGGER_OVERFLOW_AND_COMPARE);

		bd->props.max_brightness = 100;
		bd->props.brightness = touchbook_backlight_brightness;
		bd->props.boost = 0;
		bd->props.min_duty = 15;
		bd->props.pwm_fq = 200;
	}

	touchbook_backlight_update(bd);
}

static void __init touchbook_map_io(void)
{
	omap2_set_globals_343x();
	omap2_map_common_io();
}

#ifdef CONFIG_OMAP_MUX
static struct omap_board_mux board_mux[] __initdata = {
	{ .reg_offset = OMAP_MUX_TERMINATOR },
};
#endif

static void __init omap3_touchbook_init_irq(void)
{
	omap2_init_common_infrastructure();
	omap2_init_common_devices(mt46h32m32lf6_sdrc_params,
				  mt46h32m32lf6_sdrc_params);
	omap_init_irq();
#ifdef CONFIG_OMAP_32K_TIMER
	omap2_gp_clockevent_set_gptimer(12);
#endif
	omap_gpio_init();
}

static struct platform_device *omap3_touchbook_devices[] __initdata = {
	&leds_gpio,
	&keys_gpio,
	&touchbook_dss_device,
};

static void __init omap3touchbook_flash_init(void)
{
	u8 cs = 0;
	u8 nandcs = GPMC_CS_NUM + 1;

	u32 gpmc_base_add = OMAP34XX_GPMC_VIRT;

	/* find out the chip-select on which NAND exists */
	while (cs < GPMC_CS_NUM) {
		u32 ret = 0;
		ret = gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);

		if ((ret & 0xC00) == 0x800) {
			printk(KERN_INFO "Found NAND on CS%d\n", cs);
			if (nandcs > GPMC_CS_NUM)
				nandcs = cs;
		}
		cs++;
	}

	if (nandcs > GPMC_CS_NUM) {
		printk(KERN_INFO "NAND: Unable to find configuration "
				 "in GPMC\n ");
		return;
	}

	if (nandcs < GPMC_CS_NUM) {
		omap3touchbook_nand_data.cs = nandcs;
		omap3touchbook_nand_data.gpmc_cs_baseaddr = (void *)
			(gpmc_base_add + 0x60 + nandcs * 0x30);
		omap3touchbook_nand_data.gpmc_baseaddr =
						(void *) (gpmc_base_add);

		printk(KERN_INFO "Registering NAND on CS%d\n", nandcs);
		if (gpmc_nand_init(&omap3touchbook_nand_data) < 0)
			printk(KERN_ERR "Unable to register NAND device\n");
	}
}

static const struct ehci_hcd_omap_platform_data ehci_pdata __initconst = {

	.port_mode[0] = EHCI_HCD_OMAP_MODE_UNKNOWN,
	.port_mode[1] = EHCI_HCD_OMAP_MODE_PHY,
	.port_mode[2] = EHCI_HCD_OMAP_MODE_UNKNOWN,

	.phy_reset  = true,
	.reset_gpio_port[0]  = -EINVAL,
	.reset_gpio_port[1]  = 147,
	.reset_gpio_port[2]  = -EINVAL
};

static void omap3_touchbook_poweroff(void)
{
	int r;

	r = gpio_request(TB_KILL_POWER_GPIO, "DVI reset");
	if (r < 0) {
		printk(KERN_ERR "Unable to get kill power GPIO\n");
		return;
	}

	gpio_direction_output(TB_KILL_POWER_GPIO, 0);
}

static int __init early_touchbook_revision(char *p)
{
	if (!p)
		return 0;

	return strict_strtoul(p, 10, &touchbook_revision);
}
early_param("tbr", early_touchbook_revision);

static void __init omap3_touchbook_init(void)
{
	int r;
	struct platform_device *pdev;

	pm_power_off = omap3_touchbook_poweroff;

	omap3_mux_init(board_mux, OMAP_PACKAGE_CBB);
	touchbook_i2c_init();
	platform_add_devices(touchbook_devices, ARRAY_SIZE(touchbook_devices));
	omap_serial_init();

	usb_musb_init();
	usb_ehci_init(&ehci_pdata);
	omap3touchbook_flash_init();

	/* Ensure SDRC pins are mux'd for self-refresh */
	omap_mux_init_signal("sdrc_cke0", OMAP_PIN_OUTPUT);
	omap_mux_init_signal("sdrc_cke1", OMAP_PIN_OUTPUT);

	touchbook_display_init();
	touchbook_backlight_init();

	/* Touchscreen and accelerometer */
	spi_register_board_info(omap3_ads7846_spi_board_info, ARRAY_SIZE(omap3_ads7846_spi_board_info));
	spi_register_board_info(touchbook_spi_board_info_3, ARRAY_SIZE(touchbook_spi_board_info_3));
	touchbook_ads7846_init();
	touchbook_mma7455l_init();

	/* Export AI board revision */
	pdev = platform_device_alloc("touchbook", 0);
	platform_device_add(pdev);
	r = device_create_file(&pdev->dev, &dev_attr_revision);	
}

MACHINE_START(TOUCHBOOK, "OMAP3 touchbook Board")
	/* Maintainer: Gregoire Gentil - http://www.alwaysinnovating.com */
	.boot_params	= 0x80000100,
	.map_io		= omap3_map_io,
	.reserve	= omap_reserve,
	.init_irq	= omap3_touchbook_init_irq,
	.init_machine	= omap3_touchbook_init,
	.timer		= &omap_timer,
MACHINE_END
