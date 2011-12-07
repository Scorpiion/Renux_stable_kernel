#!/bin/sh

#Navigate to the kernel installation directory
cd $1

#install the kernel modules
make ARCH=arm CROSS_COMPILE=arm-none-linux-gnueabi- INSTALL_MOD_PATH=$2 modules_install

#Now done in target
#add the kernel modules to modules.dep
#grep -v -e "drivers/char/pvrsrvkm.ko" $2/lib/modules/2.6.29-rc3-omap1/modules.dep >/tmp/modules.$$.tmp
#echo "/lib/modules/2.6.29-rc3-omap1/kernel/drivers/char/pvrsrvkm.ko:" >>/tmp/modules.$$.tmp
#cp -rf /tmp/modules.$$.tmp $2/lib/modules/2.6.29-rc3-omap1/modules.dep

#grep -v -e "drivers/char/omaplfb.ko" $2/lib/modules/2.6.29-rc3-omap1/modules.dep >/tmp/modules.$$.tmp
#echo "/lib/modules/2.6.29-rc3-omap1/kernel/drivers/char/omaplfb.ko: /lib/modules/2.6.29-rc3-omap1/kernel/drivers/char/pvrsrvkm.ko" >>/tmp/modules.$$.tmp
#cp -rf /tmp/modules.$$.tmp $2/lib/modules/2.6.29-rc3-omap1/modules.dep
