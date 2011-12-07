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
	{ 0x796a78cc, "module_layout" },
	{ 0x12da5bb2, "__kmalloc" },
	{ 0x5934392b, "fb_register_client" },
	{ 0xc633495b, "schedule_work" },
	{ 0x205ec8de, "omap_dispc_register_isr" },
	{ 0xa9af4695, "PVRGetDisplayClassJTable" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xe707d823, "__aeabi_uidiv" },
	{ 0xfa2a45e, "__memzero" },
	{ 0xea147363, "printk" },
	{ 0x328a05f1, "strncpy" },
	{ 0xe37d10ae, "omap_dispc_unregister_isr" },
	{ 0xc39501de, "module_put" },
	{ 0x434fa55c, "release_console_sem" },
	{ 0xf174ed48, "acquire_console_sem" },
	{ 0xf8f25489, "registered_fb" },
	{ 0x37a0cba, "kfree" },
	{ 0x9d669763, "memcpy" },
	{ 0xcc36f32e, "fb_unregister_client" },
	{ 0xefd6cf06, "__aeabi_unwind_cpp_pr0" },
	{ 0x6c61ce70, "num_registered_fb" },
	{ 0x2d26a7b3, "fb_blank" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=pvrsrvkm";


MODULE_INFO(srcversion, "DBD5ADB0EFDFEF6FC208419");
