
-----------------------------------------------------------------------
|                                                                     |
|Aptina MT9P031 (5 megapixel bayer) image sensor linux driver release |
|                                                                     |
-----------------------------------------------------------------------
    Release notes for the Aptina MT9P031 image sensor linux driver.
    This document contains information on how to download the OS, build
    the driver/OS and how to use the sensor. Please read this document
    before posting questions to the drivers@aptina.com e-mail address.


MT9P031 Driver
--------------
    The MT9P031 driver is a Video for Linux 2 (V4L2) driver that is compiled
    into the Beagleboard-xM Linux Angstrom distribution. It is distributed under
    the GNU General Public License agreement which can be obtained from Free Software 
    Foundation, Inc., 675 Mass Ave, Cambridge, MA02139, USA. 


TARGET HARDWARE/SOFTWARE
------------------------
    - Beagleboard-xM Rev B.
    - Linux Angstrom Distribution, kernel release 2.6.32.
    - Leopardboard 365 5M Camera board (Part#:LI-5M03), which uses the Aptina 
      MT9P031 5 megapixel bayer image sensor.


DRIVER SOURCE CODE FILES
------------------------
    Driver files and directory locations are listed below:
    mt9p031.c, Makefile, and Kconfig are located at:
        kernel-2.6.32/drivers/media/video

    mt9p031.h and v4l2-chip-ident.h are located at:
        kernel-2.6.32/include/media

    board-omap3beagle.c and board-omap3beagle-camera.c are located at:
        kernel-2.6.32/arch/arm/mach-omap2


BEAGLEBOARD/ANGSTROM SETUP 
--------------------------
    For general beagleboard setup, please see the following link:
        http://code.google.com/p/beagleboard/wiki/HowToGetAngstromRunning
        
    Many of the Beagleboard/Angstrom files can be found at the following link:
        http://www.angstrom-distribution.org/demo/beagleboard/
    
    The Linux kernel source code tar file 
        beagleboard-validation-linux-beaglebardXM-camwork.tar.gz
    can be found at the following location:
        http://gitorious.org/beagleboard-validation/linux/trees/beaglebardXM-camwork

    Once downloaded, uncompress the file with the following command:
        $tar zxvf beagleboard-validation-linux-beaglebardXM-camwork.tar.gz
    Ignore the error messages if any.

    Download and install the compilation tool chain from:
        http://www.angstrom-distribution.org/toolchains/

    For Intel i686 Linux desktop PC platforms, the tar toolchain file is:
        angstrom-2011.03-i686-linux-armv7a-linux-gnueabi-toolchain.tar.bz2


PREPARING SD-CARD
-----------------
    Download mkcard.sh from:
        http://gitorious.org/beagleboard-validation/scripts/trees/60f43aeb22e5ce799eda06c82e7d36d3f04cf7d2

    Format & partition the sd-card at /dev/sdb 
    (the actual drive mounts listed here may be different on your host system)
        $sudo $Beagleboard/binaries/mkcard.sh /dev/sdb    

    This creates two partitions: /dev/sdb1 and /dev/sdb2, which are FAT32 and ext2 file formats respectively.


LINUX KERNEL CONFIGURATION/COMPILATION
--------------------------------------
    Copy MT9P031 related files into the kernel directories:
        $cp your_mt9p031_driver_directory/board-omap3beagle.c           ./arch/arm/mach-omap2
        $cp your_mt9p031_driver_directory/board-omap3beagle-camera.c    ./arch/arm/mach-omap2
        $cp your_mt9p031_driver_directory/mt9p031.c                     ./drivers/media/video
        $cp your_mt9p031_driver_directory/Makefile                      ./drivers/media/video
        $cp your_mt9p031_driver_directory/Kconfig                       ./drivers/media/video
        $cp your_mt9p031_driver_directory/mt9p031.h                     ./include/media
        $cp your_mt9p031_driver_directory/v4l2-chip-ident.h             ./include/media

    At the root directory of Linux kernel source files, enter the commands:
        $make ARCH=arm CROSS_COMPILE=arm-angstrom-linux-gnueabi- distclean
        $make ARCH=arm CROSS_COMPILE=arm-angstrom-linux-gnueabi- omap3_beagle_cam_defconfig
        $make ARCH=arm CROSS_COMPILE=arm-angstrom-linux-gnueabi- menuconfig

    In menuconfig, enable the MT9P031 driver. The MT9P031 driver configuration is at the
    following location:
        "Device Drivers"-->"Multimedia support"-->"Video capture adapters"-->"Encoders/decoders and other helper chips" 

    Select "MT9P031 support" as either
        <*> mt9p031 support
    so that the driver is part of kernel image, or

        <M> mt9p031 support
    which configures the mt9p031 driver as a loadable module.

    Note: other image sensors (such as the MT9V011 or MT9P012) should be de-selected.

    Enable/Disable MT9P031 driver compilation options that are located in the mt9p031.c file:
        MT9P031_DEBUG - Define this to enable SYSFS sensor register access and debug printk support
            Undefine this for a driver release. 

        MT9P031_HEADBOARD - Define this to use the Aptina Imaging sensor headboard and headboard adapter.
            Undefine this when using the Leopardboard mt9p031 module/sensor board. 
 
    Compile the kernel:
        $make ARCH=arm CROSS_COMPILE=arm-angstrom-linux-gnueabi- uImage

    and compile the mt9p031 driver separately if it is configured as a loadable module
        $make ARCH=arm CROSS_COMPILE=arm-angstrom-linux-gnueabi- modules

    Copy the kernel image to the SD card FAT partition:
        $cp arch/arm/boot/uImage  /media/boot

    Copy the u-boot and x-loader images to the SD card FAT partition:
        $cp MLO /media/boot/
        $cp u-boot.bin /media/boot/

        Prebuilt versions of MLO and u-boot.bin can be downloaded from the following location:
        http://www.angstrom-distribution.org/demo/beagleboard/

    Download the file-system file
    Angstrom-Beagleboard-demo-image-glibc-ipk-2011.1-beagleboard.rootfs.tar.bz2 
    from the following location:
        http://www.angstrom-distribution.org/demo/beagleboard/

    Uncompress the file-system and copy it to the SD card EXT3 partition
        $sudo tar -C /media/Angstrom -xjvf Angstrom-Beagleboard-demo-image-glibc-ipk-2011.1-beagleboard.rootfs.tar.bz2

    Copy the driver to the EXT3 partition if the mt9p031 driver is configured as a loadable module
        $cp drivers/media/video/mt9p031.ko  /media/Anstrom/home/root

    Then umount the card
        $sync; sudo umount /media/*

    Once the kernel and file-system are copied to the SD card, insert the SD card into the Beagleboard and power it on.


BOOT UP BEAGLEBOARD
-------------------
    Follow the standard procedures to boot up the Beagleboard.  If the sensor driver is configured as a loadable module, 
    it needs to be inserted manually:
        #cd /home/root
        #insmod mt9p031.ko


ANGSTROM VIDEO APPLICATION USING THE MT9P031 SENSOR
---------------------------------------------------
    The Angstrom "mplayer" video application can be used for previewing video at various r
    esolutions such as VGA(640x480) or 720p(1280x720):
        $mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0:fps=10 -vo x11
        $mplayer tv:// -tv driver=v4l2:width=1280:height=720:device=/dev/video0:fps=15 -vo x11

    Note: run the following commands from the Angstrom terminal prompt if the mplayer application
    is not installed:
        #opkg install mplayer midori
        #opkg update; opkg install ntpdate


MT9P031 SUPPORTED OUTPUT FRAME SIZES
------------------------------------
    width=640,  height=480
    width=1280, height=720
    width=1280, height=1024
    width=1600, height=1200
    width=1920, height=1080
    width=2048, height=1536
    width=2592, height=1944


MT9P031 SUPPORTED OUTPUT FRAME FORMATS
--------------------------------------
    YUYV(Y-Cb-Y-Cr)
    UYVY(Cb-Y-Cr-Y)


USE MPLAYER TO TAKE SNAPSHOTS
-----------------------------
    To save a JPEG format image to the current directory:
        $mplayer tv:// -tv driver=v4l2:width=640:height=480:device=/dev/video0:fps=10 -vo jpeg


DIRECT ACCESS TO IMAGE SENSOR REGISTERS VIA SYSFS
-------------------------------------------------
    For the following to work, the MT9P031 driver must be compiled with the debugging
    option enabled (i.e., the MT9P031_DEBUG flag is enabled).

    The MT9P031 driver exposes device registers to the user via the SYSFS interface. This
    means device registers can be written/read as though they are files.

    To access sensor registers, navigate to the following system directory:
        $cd /sys/devices/platform/i2c_omap.2/i2c-2/2-0048/

    To adjust the sensor exposure time, write to the exposure_val file.  The exposure range is 
    15000-128000.  The following example writes 33000 to the exposure_val file:
        $echo 33000 > exposure_val

    To read the current exposure value, use the following command:
        $cat exposure_val

    To adjust the sensor global (analog) gain, write to the gain_val file. The global gain
    has a range from from 0-14. The following example writes 4 to the gain_val file:
        $echo 4 > gain_val

    To read the global gain, use the following command:
        $cat gain_val

    For more information, please refer to gain index-table, MT9P031_EV_GAIN_TBL[] available
    in mt9p031.c file.

    The following gives examples of accessing other MT9P031 registers:
    To read the register at address 0x07:
        $echo 0x07 > basic_reg_addr
        $cat basic_reg_val

    To write to the register at address 0x08 with value 0x4:
        $echo 0x08 > basic_reg_addr
        $echo 0x04 > basic_reg_val

    The following are gain/exposure register address and typical settings:
        ---------------------------------------------------------------------
        Registers           Register Address    Typical values
        ---------------------------------------------------------------------
        Green1 Gain             0x2B                0x11-0x51
        Blue Gain               0x2C                0x11-0x51
        Red Gain                0x2D                0x11-0x51
        Green2 Gain             0x2E                0x11-0x51
        Shutter_Width_Low       0x09                0x400-0x1000


LIMITATIONS
-----------
    Preview resolutions less than 640x480 are not supported.
    AE and AWB are disabled by default. AF is not supported.
    The frame rate is fixed for all resolutions.


KNOWN ISSUES
------------
    The debugging feature "SYSFS" is enabled by default.
    The default sensor setting support the Aptina camera adapter card (vs. the Leopard
        Imaging adapter card)
