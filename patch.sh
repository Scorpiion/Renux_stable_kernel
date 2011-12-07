#!/bin/bash
# Split out, so build_kernel.sh and build_deb.sh can share..

echo "Starting patch.sh"

function bugs_trivial {
  echo "bugs and trivial stuff"

  #Bisected from 2.6.35 -> 2.6.36 to find this..
  #This commit breaks some lcd monitors..
  #rcn-ee Feb 26, 2011...
  #Still needs more work for 2.6.38, causes:
  #[   14.962829] omapdss DISPC error: GFX_FIFO_UNDERFLOW, disabling GFX
  patch -s -p1 < "$workDir/patches/trivial/0001-Revert-OMAP-DSS2-OMAPFB-swap-front-and-back-porches-.patch"

  patch -s -p1 < "$workDir/patches/trivial/0001-kbuild-deb-pkg-set-host-machine-after-dpkg-gencontro.patch"

  #should fix gcc-4.6 ehci problems..
  patch -s -p1 < "$workDir/patches/trivial/0001-USB-ehci-use-packed-aligned-4-instead-of-removing-th.patch"
}

function sakoman {
  echo "sakoman's patches"

  patch -s -p1 < "$workDir/patches/sakoman/2.6.39/0006-OMAP-DSS2-add-bootarg-for-selecting-svideo-or-compos.patch"
  patch -s -p1 < "$workDir/patches/sakoman/2.6.39/0007-video-add-timings-for-hd720.patch"

  patch -s -p1 < "$workDir/patches/sakoman/2.6.39/0025-omap-mmc-Adjust-dto-to-eliminate-timeout-errors.patch"
  patch -s -p1 < "$workDir/patches/sakoman/2.6.39/0026-OMAP-Overo-Add-support-for-spidev.patch"
}

function musb {
  echo "musb patches"
  patch -s -p1 < "$workDir/patches/musb/0001-default-to-fifo-mode-5-for-old-musb-beagles.patch"
}

function beagle {
  echo "[git] Board Patches for: BeagleBoard"

  patch -s -p1 < "$workDir/patches/arago-project/0001-omap3-Increase-limit-on-bootarg-mpurate.patch"
  patch -s -p1 < "$workDir/patches/display/0001-meego-modedb-add-Toshiba-LTA070B220F-800x480-support.patch"
}

function beagle_LI-5M03 {
  echo "Beagleboard driver and board patches for LI-5M03"
  #patch -s -p1 < $workDir/patches/beagle/LI-5M03/0001-v2-mt9p031-Aptina-Micron-MT9P031-5MP-sensor-driver.patch
#  patch -s -p1 < $workDir/patches/beagle/LI-5M03/0002-v8-2-2-Add-support-for-mt9p031-sensor-in-Beagleboard-XM.patch
#  patch -s -p1 < $workDir/patches/beagle/LI-5M03/0003-drivers-media-fix-dependencies-in-video-mt9p031.patch
#  patch -s -p1 < $workDir/patches/beagle/LI-5M03/0004-mt9p031-Do-not-use-PLL-if-external-frequency-is-the-same-as-target-frequency.patch
#  patch -s -p1 < $workDir/patches/beagle/LI-5M03/0006-add-revision-function.patch

#  patch -p1 -s < $workDir/patches/beagle/LI-5M03/Aptina_Driver/0001-mt9p031-import-driver-from-https-github.com-Aptina-B.patch
#  patch -p1 -s < $workDir/patches/beagle/LI-5M03/Aptina_Driver/0002-board-omap3beagle-li5m03-driver-board-support.patch
#  patch -p1 -s < $workDir/patches/beagle/LI-5M03/Aptina_Driver/0003-board-omap3beagle-import-li5m03-driver-from-https-gi.patch

  echo "Do manual patching... Press enter two times when ready"
  read dummy
  read dummy

}

function dspbridge {
  echo "dspbridge fixes"
}

function omap4 {
  echo "omap4 related patches"
  #drop with 3.0-git16
  #patch -s -p1 < "$workDir/patches/panda/0001-OMAP4-DSS2-add-dss_dss_clk.patch"
  patch -s -p1 < "$workDir/patches/panda/0001-panda-fix-wl12xx-regulator.patch"
}

function sgx {
  echo "merge in ti sgx modules"
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-Merge-TI-3.01.00.02-Kernel-Modules.patch"
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-enable-driver-building.patch"

  #3.01.00.06
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-Merge-TI-3.01.00.06-into-TI-3.01.00.02.patch"

  #3.01.00.07 'the first wget-able release!!'
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-Merge-TI-3.01.00.07-into-TI-3.01.00.06.patch"

  #4.00.00.01 adds ti8168 support, drops bc_cat.c patch
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-Merge-TI-4.00.00.01-into-TI-3.01.00.07.patch"

  #4.03.00.01
  #Note: git am has problems with this patch...
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-Merge-TI-4.03.00.01-into-TI-4.00.00.01.patch"

  #4.03.00.02 (main *.bin drops omap4)
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-Merge-TI-4.03.00.02-into-TI-4.03.00.01.patch"

  #4.03.00.02
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.32-PSP.patch"

  #4.03.00.02 + 2.6.38-merge (2.6.37-git5)
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.38-merge-AUTOCONF_INCLUD.patch"

  #4.03.00.02 + 2.6.38-rc3
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.38-rc3-_console_sem-to-c.patch"

  #4.03.00.01
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.01-add-outer_cache.clean_all.patch"

  #4.03.00.02
  #omap3 doesn't work on omap3630
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-use-omap3630-as-TI_PLATFORM.patch"

  #4.03.00.02 + 2.6.39 (2.6.38-git2)
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.39-rc-SPIN_LOCK_UNLOCKED.patch"

  #4.03.00.02 + 2.6.40 (2.6.39-git11)
  patch -s -p1 < "$workDir/patches/sgx/0001-OMAP3-SGX-TI-4.03.00.02-2.6.40-display.h-to-omapdss..patch"

  #with v3.0-git16
  #drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:324:15: error: ‘OMAP_DSS_UPDATE_AUTO’ undeclared (first use in this function)
  #drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:327:15: error: ‘OMAP_DSS_UPDATE_MANUAL’ undeclared (first use in this function)
  #drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:330:15: error: ‘OMAP_DSS_UPDATE_DISABLED’ undeclared (first use in this function)
  #drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:337:16: error: ‘struct omap_dss_driver’ has no member named ‘set_update_mode’
  #drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.c:312:28: warning: unused variable ‘eDSSMode’
  #make[4]: *** [drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux/omaplfb_linux.o] Error 1
  #make[3]: *** [drivers/staging/omap3-sgx/services4/3rdparty/dc_omapfb3_linux] Error 2
  #make[2]: *** [drivers/staging/omap3-sgx] Error 2
  patch -s -p1 < "$workDir/patches/sgx/0001-Revert-OMAP-DSS2-remove-update_mode-from-omapdss.patch"
}

bugs_trivial

# Patches in git
beagle
beagle_LI-5M03

# External tree's
sakoman
musb

# OMAP4/dvfs still needs more testing..
omap4

# No chance of being pushed ever tree's
sgx

echo "patch.sh ran successful"

