cmd_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.o := arm-none-linux-gnueabi-gcc -Wp,-MD,/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/.event.o.d  -nostdinc -isystem /proj/AVME10/mahesh/Graphics/toolchain/arm-2009q1/bin/../lib/gcc/arm-none-linux-gnueabi/4.3.3/include -I/proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include -Iinclude  -include include/generated/autoconf.h -D__KERNEL__ -mlittle-endian -Iarch/arm/mach-omap2/include -Iarch/arm/plat-omap/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -marm -fno-omit-frame-pointer -mapcs -mno-sched-prolog -mabi=aapcs-linux -mno-thumb-interwork -D__LINUX_ARM_ARCH__=7 -march=armv7-a -msoft-float -Uarm -fno-stack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4 -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/hwdefs -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/devices/sgx -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/include -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/ti81xx -I/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/bridged/sgx -DLINUX -DPVR_BUILD_DIR="\"/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM\"" -DPVR_BUILD_DATE="\"Thu March 10 IST 2011\"" -DPVR_BUILD_TYPE="\"debug\"" -DDEBUG -DPVR_HAS_BROKEN_OMAPFB_H -DPVRSRV_MODNAME="\"pvrsrvkm"\" -DSERVICES4 -D_XOPEN_SOURCE=600 -D_POSIX_C_SOURCE=199309 -DPVR2D_VALIDATE_INPUT_PARAMS -DDEBUG_LOG_PATH_TRUNCATE=\"\" -DSUPPORT_SRVINIT -DSUPPORT_SGX -DSUPPORT_XWS -DSUPPORT_PERCONTEXT_PB -DDISABLE_SGX_PB_GROW_SHRINK -DDEBUG_LINUX_MEMORY_ALLOCATIONS -DDEBUG_LINUX_MEM_AREAS -DDEBUG_LINUX_MMAP_AREAS -DDEBUG_BRIDGE_KM -DSUPPORT_LINUX_X86_WRITECOMBINE -DTRANSFER_QUEUE -DSYS_USING_INTERRUPTS -DSUPPORT_HW_RECOVERY -DSYS_USING_INTERRUPTS -DSUPPORT_HW_RECOVERY -DPVR_SECURE_HANDLES -DPVR_SECURE_FD_EXPORT -DUSE_PTHREADS -DSUPPORT_SGX_EVENT_OBJECT -DLDM_PLATFORM -DPVR2D_ALT_2DHW -DSUPPORT_SGX_HWPERF -DSUPPORT_SGX_LOW_LATENCY_SCHEDULING -DSUPPORT_SGX_LOW_LATENCY_SCHEDULING -DSUPPORT_LINUX_X86_PAT -DSUPPORT_OMAP3430_OMAPFB3 -DPVR_PDP_LINUX_FB -DPVR_LINUX_USING_WORKQUEUES -DPVR_LINUX_MISR_USING_PRIVATE_WORKQUEUE -DPVR_LINUX_TIMERS_USING_WORKQUEUES -DSYS_CUSTOM_POWERLOCK_WRAP -DSUPPORT_SGX_NEW_STATUS_VALS -DPLAT_TI81xx -DSGX530 -DSUPPORT_SGX530 -DSGX_CORE_REV=125 -fno-strict-aliasing -Wno-pointer-arith -g -O0 -DDLL_METRIC=1  -DMODULE  -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(event)"  -D"KBUILD_MODNAME=KBUILD_STR(pvrsrvkm)" -c -o /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/.tmp_event.o /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.c

deps_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.o := \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.c \
  include/linux/version.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/io.h \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/mmu.h) \
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
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/byteorder.h \
  include/linux/byteorder/little_endian.h \
  include/linux/swab.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/swab.h \
  include/linux/byteorder/generic.h \
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
    $(wildcard include/config/arch/omap1.h) \
    $(wildcard include/config/arch/omap15xx.h) \
    $(wildcard include/config/fb/omap/consistent/dma/size.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/sizes.h \
  include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/system.h \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/32v6k.h) \
  include/linux/linkage.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/linkage.h \
  include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
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
  arch/arm/mach-omap2/include/mach/io.h \
  arch/arm/plat-omap/include/plat/io.h \
    $(wildcard include/config/arch/omap2420.h) \
    $(wildcard include/config/arch/omap2430.h) \
    $(wildcard include/config/arch/omap3.h) \
    $(wildcard include/config/arch/omap4.h) \
    $(wildcard include/config/arch/ti81xx.h) \
  arch/arm/mach-omap2/include/mach/hardware.h \
  arch/arm/plat-omap/include/plat/hardware.h \
    $(wildcard include/config/reg/base.h) \
  arch/arm/plat-omap/include/plat/cpu.h \
    $(wildcard include/config/arch/omap730.h) \
    $(wildcard include/config/arch/omap850.h) \
    $(wildcard include/config/arch/omap16xx.h) \
    $(wildcard include/config/arch/omap2.h) \
    $(wildcard include/config/arch/omap3430.h) \
  include/linux/bitops.h \
    $(wildcard include/config/generic/find/last/bit.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/bitops.h \
  include/asm-generic/bitops/non-atomic.h \
  include/asm-generic/bitops/fls64.h \
  include/asm-generic/bitops/sched.h \
  include/asm-generic/bitops/hweight.h \
  include/asm-generic/bitops/arch_hweight.h \
  include/asm-generic/bitops/const_hweight.h \
  include/asm-generic/bitops/lock.h \
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
  arch/arm/mach-omap2/include/mach/pci.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v3.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/glue.h \
    $(wildcard include/config/cpu/arm610.h) \
    $(wildcard include/config/cpu/arm710.h) \
    $(wildcard include/config/cpu/abrt/lv4t.h) \
    $(wildcard include/config/cpu/abrt/ev4.h) \
    $(wildcard include/config/cpu/abrt/ev4t.h) \
    $(wildcard include/config/cpu/abrt/ev5tj.h) \
    $(wildcard include/config/cpu/abrt/ev5t.h) \
    $(wildcard include/config/cpu/abrt/ev6.h) \
    $(wildcard include/config/cpu/abrt/ev7.h) \
    $(wildcard include/config/cpu/pabrt/legacy.h) \
    $(wildcard include/config/cpu/pabrt/v6.h) \
    $(wildcard include/config/cpu/pabrt/v7.h) \
  include/asm-generic/getorder.h \
  include/linux/mm.h \
    $(wildcard include/config/sysctl.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/ksm.h) \
    $(wildcard include/config/arch/populates/node/map.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/memory/failure.h) \
  include/linux/errno.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/errno.h \
  include/asm-generic/errno.h \
  include/asm-generic/errno-base.h \
  include/linux/gfp.h \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/debug/vm.h) \
  include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/cgroup/mem/res/ctlr.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/arm/thumbee.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/domain.h \
    $(wildcard include/config/io/36.h) \
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
    $(wildcard include/config/aeabi.h) \
  include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/spinlock/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
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
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  include/linux/stringify.h \
  include/linux/bottom_half.h \
  include/linux/spinlock_types.h \
  include/linux/spinlock_types_up.h \
  include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  include/linux/rwlock_types.h \
  include/linux/spinlock_up.h \
  include/linux/rwlock.h \
  include/linux/spinlock_api_up.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  include/asm-generic/atomic-long.h \
  include/linux/wait.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/current.h \
  include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  include/linux/seqlock.h \
  include/linux/nodemask.h \
  include/linux/bitmap.h \
  include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/string.h \
  include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  include/generated/bounds.h \
  include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
  include/linux/notifier.h \
  include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
  include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  include/linux/rwsem-spinlock.h \
  include/linux/srcu.h \
  include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/book.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  include/linux/pfn.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/percpu.h \
  include/asm-generic/percpu.h \
  include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/topology.h \
  include/asm-generic/topology.h \
  include/linux/mmdebug.h \
    $(wildcard include/config/debug/virtual.h) \
  include/linux/rbtree.h \
  include/linux/prio_tree.h \
  include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/want/page/debug/flags.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mm/owner.h) \
    $(wildcard include/config/mmu/notifier.h) \
  include/linux/auxvec.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/auxvec.h \
  include/linux/completion.h \
  include/linux/page-debug-flags.h \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/page/debug/something/else.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  include/linux/range.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
  include/asm-generic/4level-fixup.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v7.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/cpu-single.h \
  arch/arm/mach-omap2/include/mach/vmalloc.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/pgtable-hwdef.h \
  include/asm-generic/pgtable.h \
  include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/s390.h) \
  include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/slab.h) \
  include/linux/slub_def.h \
    $(wildcard include/config/slub/stats.h) \
    $(wildcard include/config/slub/debug.h) \
    $(wildcard include/config/sysfs.h) \
  include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
  include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  include/linux/math64.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/div64.h \
  include/linux/jiffies.h \
  include/linux/timex.h \
  include/linux/param.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/param.h \
    $(wildcard include/config/hz.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/timex.h \
  arch/arm/mach-omap2/include/mach/timex.h \
  arch/arm/plat-omap/include/plat/timex.h \
    $(wildcard include/config/omap/32k/timer.h) \
    $(wildcard include/config/omap/32k/timer/hz.h) \
  include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects/free.h) \
  include/linux/kobject.h \
  include/linux/sysfs.h \
  include/linux/kobject_ns.h \
  include/linux/kref.h \
  include/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  include/trace/events/kmem.h \
  include/linux/tracepoint.h \
    $(wildcard include/config/tracepoints.h) \
  include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/no/hz.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/preempt/rt.h) \
  include/linux/rcutiny.h \
  include/trace/events/gfpflags.h \
  include/trace/define_trace.h \
    $(wildcard include/config/event/tracing.h) \
  include/linux/vmalloc.h \
  include/linux/delay.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/delay.h \
  include/linux/pci.h \
    $(wildcard include/config/pci/iov.h) \
    $(wildcard include/config/pcieaspm.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/pcie/ecrc.h) \
    $(wildcard include/config/ht/irq.h) \
    $(wildcard include/config/pci/domains.h) \
    $(wildcard include/config/pci/quirks.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/hotplug/pci.h) \
  include/linux/pci_regs.h \
  include/linux/mod_devicetable.h \
  include/linux/ioport.h \
  include/linux/device.h \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  include/linux/klist.h \
  include/linux/module.h \
    $(wildcard include/config/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
  include/linux/stat.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/stat.h \
  include/linux/kmod.h \
  include/linux/elf.h \
  include/linux/elf-em.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/elf.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/user.h \
  include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ppc64.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
  include/trace/events/module.h \
  include/linux/pm.h \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/pm/runtime.h) \
    $(wildcard include/config/pm/ops.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
  include/linux/pm_wakeup.h \
  include/linux/io.h \
    $(wildcard include/config/has/ioport.h) \
  include/linux/irqreturn.h \
  include/linux/pci_ids.h \
  include/linux/pci-dma.h \
  include/linux/dmapool.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/scatterlist.h \
  include/asm-generic/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/need/sg/dma/length.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/pci.h \
    $(wildcard include/config/pci/host/ite8152.h) \
  include/asm-generic/pci-dma-compat.h \
  include/linux/dma-mapping.h \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/have/dma/attrs.h) \
    $(wildcard include/config/need/dma/map/state.h) \
  include/linux/err.h \
  include/linux/dma-attrs.h \
  include/linux/bug.h \
  include/linux/scatterlist.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/dma-mapping.h \
  include/asm-generic/dma-coherent.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/mach/pci.h \
  include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/lockup/detector.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/generic/hardirqs.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/irq/time/accounting.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/cgroup/sched.h) \
  include/linux/capability.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/cputime.h \
  include/asm-generic/cputime.h \
  include/linux/sem.h \
  include/linux/ipc.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/ipcbuf.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/sembuf.h \
  include/linux/signal.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/signal.h \
  include/asm-generic/signal-defs.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/sigcontext.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/siginfo.h \
  include/asm-generic/siginfo.h \
  include/linux/path.h \
  include/linux/pid.h \
  include/linux/proportions.h \
  include/linux/percpu_counter.h \
  include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
  include/linux/rculist.h \
  include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  include/linux/resource.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/resource.h \
  include/asm-generic/resource.h \
  include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
  include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  include/linux/latencytop.h \
  include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/security.h) \
  include/linux/key.h \
  include/linux/sysctl.h \
  include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  include/linux/aio.h \
  include/linux/aio_abi.h \
  include/linux/uio.h \
  include/linux/interrupt.h \
    $(wildcard include/config/generic/irq/probe.h) \
  include/linux/irqnr.h \
  include/linux/hardirq.h \
    $(wildcard include/config/bkl.h) \
  include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/hardirq.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/irq.h \
  arch/arm/mach-omap2/include/mach/irqs.h \
  arch/arm/plat-omap/include/plat/irqs.h \
    $(wildcard include/config/mach/omap/innovator.h) \
    $(wildcard include/config/twl4030/core.h) \
    $(wildcard include/config/gpio/twl4030.h) \
    $(wildcard include/config/fiq.h) \
  arch/arm/plat-omap/include/plat/irqs-44xx.h \
  arch/arm/plat-omap/include/plat/irqs-ti81xx.h \
  include/linux/irq_cpustat.h \
  include/trace/events/irq.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/uaccess.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_types.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_defs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_types.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/services_headers.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/img_defs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/services.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/servicesext.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/pdumpdefs.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/servicesint.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/ti81xx/sysinfo.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/power.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/resman.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/queue.h \
  include/linux/seq_file.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/srvkm.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/kerneldisplay.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/include/syscommon.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/system/ti81xx/sysconfig.h \
    $(wildcard include/config/h//.h) \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/queue.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/power.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/resman.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/ra.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/hash.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/osfunc.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/device.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/ra.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/buffer_manager.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/perproc.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/handle.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/include4/pvr_debug.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/metrics.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/mm.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/include/pvrmmap.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/mmap.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/include/perproc.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/env_data.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/proc.h \
  include/linux/proc_fs.h \
    $(wildcard include/config/proc/devicetree.h) \
    $(wildcard include/config/proc/kcore.h) \
  include/linux/fs.h \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  include/linux/limits.h \
  include/linux/ioctl.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/ioctl.h \
  include/asm-generic/ioctl.h \
  include/linux/blk_types.h \
    $(wildcard include/config/blk/dev/integrity.h) \
  include/linux/kdev_t.h \
  include/linux/dcache.h \
  include/linux/radix-tree.h \
  include/linux/semaphore.h \
  include/linux/fiemap.h \
  include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  include/linux/dqblk_xfs.h \
  include/linux/dqblk_v1.h \
  include/linux/dqblk_v2.h \
  include/linux/dqblk_qtree.h \
  include/linux/nfs_fs_i.h \
  include/linux/nfs.h \
  include/linux/sunrpc/msg_prot.h \
  include/linux/inet.h \
  include/linux/fcntl.h \
  /proj/SGX_Graphics/mahesh/Linux/TI816X-LINUX-PSP-04.00.00.10/src/kernel/linux-04.00.00.10/arch/arm/include/asm/fcntl.h \
  include/asm-generic/fcntl.h \
  include/linux/magic.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/mutex.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/lock.h \
  /proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.h \

/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.o: $(deps_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.o)

$(deps_/proj/SGX_Graphics/mahesh/sgxsdk/Graphics_SDK_4_03_00_02/GFX_Linux_KM/services4/srvkm/env/linux/event.o):
