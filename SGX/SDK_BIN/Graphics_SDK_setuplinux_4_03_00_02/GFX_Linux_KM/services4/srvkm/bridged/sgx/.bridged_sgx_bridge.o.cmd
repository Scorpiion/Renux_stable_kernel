cmd_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.o := arm-none-linux-gnueabi-gcc -Wp,-MD,/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/.bridged_sgx_bridge.o.d  -nostdinc -isystem /proj/AVME10/mahesh/Graphics/toolchain/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include -I/proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4 -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/hwdefs -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/devices/sgx -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/include -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/ti81xx -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx -DLINUX -DPVR_BUILD_DIR="\"/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM\"" -DPVR_BUILD_DATE="\"Thu March 10 IST 2011\"" -DPVR_BUILD_TYPE="\"debug\"" -DDEBUG -DPVR_HAS_BROKEN_OMAPFB_H -DPVRSRV_MODNAME="\"pvrsrvkm"\" -DSERVICES4 -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199309 -DPVR2D_VALIDATE_INPUT_PARAMS -DDEBUG_LOG_PATH_TRUNCATE=\"\" -DSUPPORT_SRVINIT -DSUPPORT_SGX -DSUPPORT_XWS -DSUPPORT_PERCONTEXT_PB -DDISABLE_SGX_PB_GROW_SHRINK -DDEBUG_LINUX_MEMORY_ALLOCATIONS -DDEBUG_LINUX_MEM_AREAS -DDEBUG_LINUX_MMAP_AREAS -DDEBUG_BRIDGE_KM -DSUPPORT_LINUX_X86_WRITECOMBINE -DTRANSFER_QUEUE -DSYS_USING_INTERRUPTS -DSUPPORT_HW_RECOVERY -DSYS_USING_INTERRUPTS -DSUPPORT_HW_RECOVERY -DPVR_SECURE_HANDLES -DPVR_SECURE_FD_EXPORT -DUSE_PTHREADS -DSUPPORT_SGX_EVENT_OBJECT -DLDM_PLATFORM -DPVR2D_ALT_2DHW -DSUPPORT_SGX_HWPERF -DSUPPORT_SGX_LOW_LATENCY_SCHEDULING -DSUPPORT_SGX_LOW_LATENCY_SCHEDULING -DSUPPORT_LINUX_X86_PAT -DSUPPORT_OMAP3430_OMAPFB3 -DPVR_PDP_LINUX_FB -DPVR_LINUX_USING_WORKQUEUES -DPVR_LINUX_MISR_USING_PRIVATE_WORKQUEUE -DPVR_LINUX_TIMERS_USING_WORKQUEUES -DSYS_CUSTOM_POWERLOCK_WRAP -DSUPPORT_SGX_NEW_STATUS_VALS -DPLAT_TI81xx -DSGX530 -DSUPPORT_SGX530 -DSGX_CORE_REV=125 -fno-strict-aliasing -Wno-pointer-arith -g -O0 -DDLL_METRIC=1  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(bridged_sgx_bridge)"  -D"KBUILD_MODNAME=KBUILD_STR(pvrsrvkm)" -c -o /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/.tmp_bridged_sgx_bridge.o /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.c

deps_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.o := \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.c \
  /proj/AVME10/mahesh/Graphics/toolchain/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include/stddef.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_defs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_types.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_defs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/services.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/servicesext.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/pdumpdefs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/pvr_debug.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/pvr_bridge.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/servicesint.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/ti81xx/sysinfo.h \
  include/linux/ioctl.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/pvrmmap.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/sgx_bridge.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/sgxapi_km.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/hwdefs/sgxdefs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/hwdefs/sgxerrata.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/hwdefs/sgxfeaturedefs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_types.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/hwdefs/sgx530defs.h \
    $(wildcard include/config/mask.h) \
    $(wildcard include/config/shift.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/aeabi.h) \
    $(wildcard include/config/oabi/compat.h) \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/sgxinfo.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/sgxscript.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/sgx_mkif_km.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/pvr_bridge.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/perproc.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/resman.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/handle.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/hash.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/osfunc.h \
  include/linux/hardirq.h \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/bkl.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/irq/time/accounting.h) \
    $(wildcard include/config/no/hz.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/types.h \
  include/asm-generic/int-ll64.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/bitsperlong.h \
  include/asm-generic/bitsperlong.h \
  include/linux/posix_types.h \
  include/linux/stddef.h \
  include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  include/linux/compiler-gcc4.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/posix_types.h \
  include/linux/bitops.h \
    $(wildcard include/config/generic/find/last/bit.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/bitops.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  include/linux/linkage.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/linkage.h \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  include/linux/typecheck.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/irqflags.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
    $(wildcard include/config/arm/thumb.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/hwcap.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  include/asm-generic/cmpxchg-local.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/arch_hweight.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/lock.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/mmu.h) \
  include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  include/linux/prefetch.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/hw_breakpoint.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
  include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/prove/rcu.h) \
  include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/hardirq.h \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /proj/AVME10/mahesh/Graphics/toolchain/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include/stdarg.h \
  include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  include/linux/printk.h \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  include/linux/dynamic_debug.h \
  include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/swab.h \
  include/linux/byteorder/generic.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/irq.h \
  arch/arm/mach-omap2/include/mach/irqs.h \
  arch/arm/plat-omap/include/plat/irqs.h \
    $(wildcard include/config/mach/omap/innovator.h) \
    $(wildcard include/config/twl4030/core.h) \
    $(wildcard include/config/gpio/twl4030.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/fiq.h) \
  arch/arm/plat-omap/include/plat/irqs-44xx.h \
  arch/arm/plat-omap/include/plat/irqs-ti81xx.h \
  arch/arm/mach-omap2/include/mach/hardware.h \
  arch/arm/plat-omap/include/plat/hardware.h \
    $(wildcard include/config/reg/base.h) \
    $(wildcard include/config/arch/omap1.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/sizes.h \
  arch/arm/plat-omap/include/plat/cpu.h \
    $(wildcard include/config/arch/omap730.h) \
    $(wildcard include/config/arch/omap850.h) \
    $(wildcard include/config/arch/omap15xx.h) \
    $(wildcard include/config/arch/omap16xx.h) \
    $(wildcard include/config/arch/omap2.h) \
    $(wildcard include/config/arch/omap2420.h) \
    $(wildcard include/config/arch/omap2430.h) \
    $(wildcard include/config/arch/omap3.h) \
    $(wildcard include/config/arch/omap3430.h) \
    $(wildcard include/config/arch/omap4.h) \
    $(wildcard include/config/arch/ti81xx.h) \
  arch/arm/plat-omap/include/plat/multi.h \
    $(wildcard include/config/arch/omap2plus.h) \
  arch/arm/plat-omap/include/plat/serial.h \
  include/linux/init.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/hotplug.h) \
  arch/arm/plat-omap/include/plat/omap7xx.h \
    $(wildcard include/config/base.h) \
  arch/arm/plat-omap/include/plat/omap1510.h \
  arch/arm/plat-omap/include/plat/omap16xx.h \
  arch/arm/plat-omap/include/plat/omap24xx.h \
  arch/arm/plat-omap/include/plat/omap34xx.h \
  arch/arm/plat-omap/include/plat/omap44xx.h \
  arch/arm/plat-omap/include/plat/ti81xx.h \
  include/linux/irq_cpustat.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/string.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/memory.h \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/zone/dma.h) \
  include/linux/const.h \
  arch/arm/mach-omap2/include/mach/memory.h \
  arch/arm/plat-omap/include/plat/memory.h \
    $(wildcard include/config/fb/omap/consistent/dma/size.h) \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/power.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/pvr_bridge_km.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgx_bridge_km.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/sgxinfo.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxinfokm.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/device.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/ra.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/ti81xx/sysconfig.h \
    $(wildcard include/config/h//.h) \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/include/syscommon.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/servicesint.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/queue.h \
  include/linux/seq_file.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  include/linux/spinlock_types.h \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/debug/spinlock.h) \
  include/linux/spinlock_types_up.h \
  include/linux/rwlock_types.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  include/asm-generic/atomic-long.h \
  include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  include/linux/bitmap.h \
  include/linux/nodemask.h \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/resman.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/ra.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/buffer_manager.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/perproc.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/bridged_pvr_bridge.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/devices/sgx/sgxutils.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/pdump_km.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/pdump_osfunc.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/pdump.h \

/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.o: $(deps_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.o)

$(deps_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx/bridged_sgx_bridge.o):
