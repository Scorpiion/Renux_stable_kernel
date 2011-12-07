#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);

struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
 .name = KBUILD_MODNAME,
 .init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
 .exit = cleanup_module,
#endif
 .arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0xf004d205, "module_layout" },
	{ 0x12da5bb2, "__kmalloc" },
	{ 0x5934392b, "fb_register_client" },
	{ 0x8949858b, "schedule_work" },
	{ 0xa9af4695, "PVRGetDisplayClassJTable" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xe707d823, "__aeabi_uidiv" },
	{ 0xfa2a45e, "__memzero" },
	{ 0xea147363, "printk" },
	{ 0x328a05f1, "strncpy" },
	{ 0x49a1cb68, "module_put" },
	{ 0x434fa55c, "release_console_sem" },
	{ 0xf174ed48, "acquire_console_sem" },
	{ 0x167fdfc9, "registered_fb" },
	{ 0x40bd8a2d, "fb_set_var" },
	{ 0x69a5a489, "vps_grpx_unregister_isr" },
	{ 0x37a0cba, "kfree" },
	{ 0x9d669763, "memcpy" },
	{ 0x394e59, "vps_grpx_register_isr" },
	{ 0xcc36f32e, "fb_unregister_client" },
	{ 0x6c61ce70, "num_registered_fb" },
	{ 0xfd5bf45d, "fb_blank" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=pvrsrvkm,vpss";

