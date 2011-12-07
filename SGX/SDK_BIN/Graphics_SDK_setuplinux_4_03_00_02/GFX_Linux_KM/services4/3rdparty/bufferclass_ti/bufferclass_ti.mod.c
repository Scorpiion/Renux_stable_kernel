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
	{ 0x6bc3fbc0, "__unregister_chrdev" },
	{ 0x12da5bb2, "__kmalloc" },
	{ 0xff178f6, "__aeabi_idivmod" },
	{ 0xfbc74f64, "__copy_from_user" },
	{ 0x9161fe64, "device_destroy" },
	{ 0x20bd24a5, "__register_chrdev" },
	{ 0xfa2a45e, "__memzero" },
	{ 0xea147363, "printk" },
	{ 0x328a05f1, "strncpy" },
	{ 0x1b1f7f51, "dma_free_coherent" },
	{ 0xfed8b69, "device_create" },
	{ 0x22dfa95, "dma_alloc_coherent" },
	{ 0x7a38ef18, "PVRGetBufferClassJTable" },
	{ 0x37a0cba, "kfree" },
	{ 0x2afe192b, "remap_pfn_range" },
	{ 0x9d669763, "memcpy" },
	{ 0xd23873fc, "class_destroy" },
	{ 0x76b141b6, "__class_create" },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=pvrsrvkm";

