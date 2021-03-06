#!/bin/bash

echo "Start by removing these files (new version will be patched in):"
echo "Renux_linux/drivers/video/omap2/dss/display.c"
echo "Renux_linux/arch/arm/mach-omap2/board-omap3beagle.c"
echo ""
echo "Then press enter.."
read dumy

patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/board-omap3beagle.c.patch 
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/board-omap3beagle-camera.c.patch 
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/Kconfig.patch 
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/Makefile.patch 
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/mt9p031.c.patch 
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/mt9p031.h.patch 
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/v4l2-chip-ident.h.patch 

#patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/display.c.patch
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/display.h.patch
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/mmc-twl4030.c.patch
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/mmc-twl4030.h.patch
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/omap3-opp.h.patch
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/timer-gp.c.patch
patch -p1 < /home/robert/New_Development/Renux_stable_kernel/patches/beagle/LI-5M03/Aptina_Driver_Github/patches/timer-gp.h.patch
