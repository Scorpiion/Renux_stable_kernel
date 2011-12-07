#!/bin/sh

# PowerVR SGX DDK for Embedded Linux - installation script
#
# Copyright	2004-2006 by Imagination Technologies Limited.
#				All rights reserved.  No part of this software, either
#				material or conceptual may be copied or distributed,
#				transmitted, transcribed, stored in a retrieval system
#				or translated into any human or computer language in any
#				form by any means, electronic, mechanical, manual or
#				other-wise, or disclosed to third parties without the
#				express written permission of Imagination Technologies
#				Limited, Unit 8, HomePark Industrial Estate,
#				King's Langley, Hertfordshire, WD4 8LZ, U.K.

# Auto-generated for omap3430_linux from embedded.pj 1.6.16.3977
#

# PVR Consumer services version number
#
PVRVERSION=1.6.16.3977

# Where we record what we did so we can undo it.
#
DDK_INSTALL_LOG=/etc/powervr_ddk_install.log

# basic installation function
# $1=blurb
#
bail()
{
    echo "$1" >&2
    echo "" >&2
    echo "Installation failed" >&2
    exit 1
}

# basic installation function
# $1=fromfile, $2=destfilename, $3=blurb, $4=chmod-flags, $5=chown-flags
#
install_file()
{
	DESTFILE=${DISCIMAGE}$2
	DESTDIR=`dirname $DESTFILE`

	if [ ! -e $1 ]; then
		 	[ -n "$VERBOSE" ] && echo "skipping file $1 -> $2"
		 return
	fi
	
	# Destination directory - make sure it's there and writable
	#
	if [ -d "${DESTDIR}" ]; then
		if [ ! -w "${DESTDIR}" ]; then
			bail "${DESTDIR} is not writable."
		fi
	else
		$DOIT mkdir -p ${DESTDIR} || bail "Couldn't mkdir -p ${DESTDIR}"
		[ -n "$VERBOSE" ] && echo "Created directory `dirname $2`"
	fi

	# Delete the original so that permissions don't persist.
	#
	$DOIT rm -f $DESTFILE

	$DOIT cp -f $1 $DESTFILE || bail "Couldn't copy $1 to $DESTFILE"
	$DOIT chmod $4 ${DESTFILE}
	$DOIT chown $5 ${DESTFILE}

	echo "$3 `basename $1` -> $2"
	$DOIT echo "file $2" >>${DISCIMAGE}${DDK_INSTALL_LOG}
}

# Install a symbolic link
# $1=fromfile, $2=destfilename
#
install_link()
{
	DESTFILE=${DISCIMAGE}$2
	DESTDIR=`dirname $DESTFILE`

	if [ ! -e ${DESTDIR}/$1 ]; then
		 [ -n "$VERBOSE" ] && echo $DOIT "skipping link ${DESTDIR}/$1"
		 return
	fi

	# Destination directory - make sure it's there and writable
	#
	if [ -d "${DESTDIR}" ]; then
		if [ ! -w "${DESTDIR}" ]; then
			bail "${DESTDIR} is not writable."
		fi
	else
		$DOIT mkdir -p ${DESTDIR} || bail "Couldn't mkdir -p ${DESTDIR}"
		[ -n "$VERBOSE" ] && echo "Created directory `dirname $2`"
	fi

	# Delete the original so that permissions don't persist.
	#
	$DOIT rm -f $DESTFILE

	$DOIT ln -s $1 $DESTFILE || bail "Couldn't link $1 to $DESTFILE"
	$DOIT echo "link $2" >>${DISCIMAGE}${DDK_INSTALL_LOG}
	[ -n "$VERBOSE" ] && echo " linked `basename $1` -> $2"
}

# Tree-based installation function
# $1 = fromdir $2=destdir $3=blurb
#
install_tree()
{
	# Make the destination directory if it's not there
	#
	if [ ! -d ${DISCIMAGE}$2 ]; then
		$DOIT mkdir -p ${DISCIMAGE}$2 || bail "Couldn't mkdir -p ${DISCIMAGE}$2"
	fi
	if [ "$DONTDOIT" ]; then
		echo "### tar -C $1 -cf - . | tar -C ${DISCIMAGE}$2 -x${VERBOSE}f -" 
	else
		tar -C $1 -cf - . | tar -C ${DISCIMAGE}$2 -x${VERBOSE}f -
	fi
	if [ $? = 0 ]; then
		echo "Installed $3 in ${DISCIMAGE}$2"
		$DOIT echo "tree $2" >>${DISCIMAGE}${DDK_INSTALL_LOG}
	else
		echo "Failed copying $3 from $1 to ${DISCIMAGE}$2"
	fi
}

# Uninstall something.
#
uninstall()
{
	if [ ! -f ${DISCIMAGE}${DDK_INSTALL_LOG} ]; then
		echo "Nothing to un-install."
		return;
	fi

	BAD=0
	VERSION=""
	while read type data; do
		case $type in
		version)	# do nothing
			echo "Uninstalling existing version $data"
			VERSION="$data"
			;;
		link|file) 
			if [ -z "$VERSION" ]; then
				BAD=1;
				echo "No version record at head of ${DISCIMAGE}${DDK_INSTALL_LOG}"
			elif ! $DOIT rm -f ${DISCIMAGE}${data}; then
				BAD=1;
			else
				[ -n "$VERBOSE" ] && echo "Deleted $type $data"
			fi
			;;
		tree)		# so far, do nothing
			;;
		esac
	done < ${DISCIMAGE}${DDK_INSTALL_LOG};

	if [ $BAD = 0 ]; then
		echo "Uninstallation completed."
		$DOIT rm -f ${DISCIMAGE}${DDK_INSTALL_LOG}
	else
		echo "Uninstallation failed!!!"
	fi
}

# Help on how to invoke
#
usage()
{
	echo "usage: $0 [options...]"
	echo ""
	echo "Options: -v            verbose mode"
	echo "         -n            dry-run mode"
	echo "         -u            uninstall-only mode"
	echo "         --no-pvr      don't install PowerVR driver components"
	echo "         --no-x        don't install X window system"
	echo "         --no-display  don't install integrated PowerVR display module"
	echo "         --no-bcdevice don't install buffer class device module"
	echo "         --root path   use path as the root of the install file system"
	exit 1
}

install_pvr()
{
	$DOIT echo "version 1.6.16.3977" >${DISCIMAGE}${DDK_INSTALL_LOG}
	# Install the standard scripts
	#
	install_file rc.pvr /etc/init.d/rc.pvr "boot script" 0755 0:0

	# Check the kernel module directory is there
	#
	if [ ! -d "${DISCIMAGE}/lib/modules/$(uname -r)" ]; then
		echo ""
		echo "Can't find /lib/modules/$(uname -r) on file system installation root"
		echo -n "There is no kernel module area setup yet. "
		if [ "$from" = target ]; then
			echo "On your build machine you should invoke:"
			echo
			echo " $ cd \$KERNELDIR"
			echo " $ make INSTALL_MOD_PATH=\$DISCIMAGE modules_install"
		else
			echo "You should invoke:"
			echo
			echo " $ cd $KERNELDIR"
			echo " $ make INSTALL_MOD_PATH=$DISCIMAGE modules_install"
		fi
		echo
		exit 1;
	fi

	# Install the standard kernel modules
	# Touch some files that might not exist so that busybox/modprobe don't complain
	#
	
	install_file pvrsrvkm.ko /lib/modules/$(uname -r)/kernel/drivers/char/pvrsrvkm.ko "kernel module" 0644 0:0
	if [ "$host" = 1 ]; then
			grep -v -e "drivers/char/pvrsrvkm.ko" ${DISCIMAGE}/lib/modules/2.6.32/modules.dep >/tmp/modules.$$.tmp
	echo "/lib/modules/$(uname -r)/kernel/drivers/char/pvrsrvkm.ko:" >>/tmp/modules.$$.tmp
	cp /tmp/modules.$$.tmp ${DISCIMAGE}/lib/modules/2.6.32/modules.dep
	fi

if [ -z "$NO_DISPLAYMOD" ]; then
		install_file omaplfb.ko /lib/modules/$(uname -r)/kernel/drivers/char/omaplfb.ko "kernel module" 0644 0:0
	if [ "$host" = 1 ]; then
			grep -v -e "drivers/char/omaplfb.ko" ${DISCIMAGE}/lib/modules/2.6.32/modules.dep >/tmp/modules.$$.tmp
echo "/lib/modules/$(uname -r)/kernel/drivers/char/omaplfb.ko: /lib/modules/$(uname -r)/kernel/drivers/char/pvrsrvkm.ko" >>/tmp/modules.$$.tmp
	cp /tmp/modules.$$.tmp ${DISCIMAGE}/lib/modules/2.6.32/modules.dep
	fi

fi

if [ -z "$NO_BCDEVICE" ]; then
		install_file bc_example.ko /lib/modules/$(uname -r)/kernel/drivers/char/bc_example.ko "kernel module" 0644 0:0
	if [ "$host" = 1 ]; then
			grep -v -e "drivers/char/bc_example.ko" ${DISCIMAGE}/lib/modules/2.6.32/modules.dep >/tmp/modules.$$.tmp
echo "/lib/modules/$(uname -r)/kernel/drivers/char/bc_example.ko: /lib/modules/$(uname -r)/kernel/drivers/char/pvrsrvkm.ko" >>/tmp/modules.$$.tmp
	cp /tmp/modules.$$.tmp ${DISCIMAGE}/lib/modules/2.6.32/modules.dep
	fi

fi


	$DOIT touch ${DISCIMAGE}/lib/modules/modprobe.conf
	$DOIT touch ${DISCIMAGE}/etc/modules.conf
	$DOIT rm -f /tmp/modules.$$.tmp


	# Install the standard libraries
	#
	install_file libGLES_CM.so /usr/lib/libGLES_CM.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libGLES_CM.so.1.1.16.3977 /usr/lib/libGLES_CM.so


	install_file libusc.so /usr/lib/libusc.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libusc.so.1.1.16.3977 /usr/lib/libusc.so

	install_file libGLESv2.so /usr/lib/libGLESv2.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libGLESv2.so.1.1.16.3977 /usr/lib/libGLESv2.so

	install_file libglslcompiler.so /usr/lib/libglslcompiler.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libglslcompiler.so.1.1.16.3977 /usr/lib/libglslcompiler.so

	install_file libOpenVG.so /usr/lib/libOpenVG.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libOpenVG.so.1.1.16.3977 /usr/lib/libOpenVG.so
	install_file libOpenVGU.so /usr/lib/libOpenVGU.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libOpenVGU.so.1.1.16.3977 /usr/lib/libOpenVGU.so

	install_file libIMGegl.so /usr/lib/libIMGegl.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libIMGegl.so.1.1.16.3977 /usr/lib/libIMGegl.so
	install_file libEGL.so /usr/lib/libEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libEGL.so.1.1.16.3977 /usr/lib/libEGL.so
	install_file libpvr2d.so /usr/lib/libpvr2d.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvr2d.so.1.1.16.3977 /usr/lib/libpvr2d.so

	install_file libpvrPVR2D_BLITWSEGL.so /usr/lib/libpvrPVR2D_BLITWSEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvrPVR2D_BLITWSEGL.so.1.1.16.3977 /usr/lib/libpvrPVR2D_BLITWSEGL.so
	install_file libpvrPVR2D_FLIPWSEGL.so /usr/lib/libpvrPVR2D_FLIPWSEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvrPVR2D_FLIPWSEGL.so.1.1.16.3977 /usr/lib/libpvrPVR2D_FLIPWSEGL.so
	install_file libpvrPVR2D_FRONTWSEGL.so /usr/lib/libpvrPVR2D_FRONTWSEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvrPVR2D_FRONTWSEGL.so.1.1.16.3977 /usr/lib/libpvrPVR2D_FRONTWSEGL.so
	install_file libpvrPVR2D_LINUXFBWSEGL.so /usr/lib/libpvrPVR2D_LINUXFBWSEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvrPVR2D_LINUXFBWSEGL.so.1.1.16.3977 /usr/lib/libpvrPVR2D_LINUXFBWSEGL.so

	install_file libpvrPVR2D_X11WSEGL.so /usr/lib/libpvrPVR2D_X11WSEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvrPVR2D_X11WSEGL.so.1.1.16.3977 /usr/lib/libpvrPVR2D_X11WSEGL.so
	install_file libpvrEWS_WSEGL.so /usr/lib/libpvrEWS_WSEGL.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libpvrEWS_WSEGL.so.1.1.16.3977 /usr/lib/libpvrEWS_WSEGL.so

	install_file libsrv_um.so /usr/lib/libsrv_um.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libsrv_um.so.1.1.16.3977 /usr/lib/libsrv_um.so
	install_file libsrv_init.so /usr/lib/libsrv_init.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libsrv_init.so.1.1.16.3977 /usr/lib/libsrv_init.so
	install_file libPVRScopeServices.so /usr/lib/libPVRScopeServices.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libPVRScopeServices.so.1.1.16.3977 /usr/lib/libPVRScopeServices.so





	install_file libews.so /usr/lib/libews.so.1.1.16.3977 "shared library" 0644 0:0
	install_link libews.so.1.1.16.3977 /usr/lib/libews.so

	# Install the standard executables
	#

	install_file pvrsrvinit /usr/local/bin/pvrsrvinit "binary" 0755 0:0
	install_file sgx_init_test /usr/local/bin/sgx_init_test "binary" 0755 0:0


	install_file ews_server /usr/local/bin/ews_server "binary" 0755 0:0

	# Install the standard unittests
	#


	install_file services_test /usr/local/bin/services_test "binary" 0755 0:0
	install_file sgx_blit_test /usr/local/bin/sgx_blit_test "binary" 0755 0:0
	install_file sgx_clipblit_test /usr/local/bin/sgx_clipblit_test "binary" 0755 0:0
	install_file sgx_flip_test /usr/local/bin/sgx_flip_test "binary" 0755 0:0
	install_file sgx_render_flip_test /usr/local/bin/sgx_render_flip_test "binary" 0755 0:0
	install_file pvr2d_test /usr/local/bin/pvr2d_test "binary" 0755 0:0



	install_file gles1test1 /usr/local/bin/gles1test1 "binary" 0755 0:0
	install_file gles1_texture_stream /usr/local/bin/gles1_texture_stream "binary" 0755 0:0

	install_file gles2test1 /usr/local/bin/gles2test1 "binary" 0755 0:0
	install_file glsltest1_vertshader.txt /usr/local/bin/glsltest1_vertshader.txt "shader" 0644 0:0
	install_file glsltest1_fragshaderA.txt /usr/local/bin/glsltest1_fragshaderA.txt "shader" 0644 0:0
	install_file glsltest1_fragshaderB.txt /usr/local/bin/glsltest1_fragshaderB.txt "shader" 0644 0:0
	install_file gles2_texture_stream /usr/local/bin/gles2_texture_stream "binary" 0755 0:0

	install_file ovg_unit_test /usr/local/bin/ovg_unit_test "binary" 0755 0:0
	install_file eglinfo /usr/local/bin/eglinfo "binary" 0755 0:0



	install_file xtest /usr/local/bin/xtest "binary" 0755 0:0

	install_file xgles1test1 /usr/local/bin/xgles1test1 "binary" 0755 0:0
	install_file xmultiegltest /usr/local/bin/xmultiegltest "binary" 0755 0:0

	install_file xgles2test1 /usr/local/bin/xgles2test1 "binary" 0755 0:0

	install_file xovg_unit_test /usr/local/bin/xovg_unit_test "binary" 0755 0:0



	install_file ews_test_gles1 /usr/local/bin/ews_test_gles1 "binary" 0755 0:0

	install_file ews_test_gles2 /usr/local/bin/ews_test_gles2 "binary" 0755 0:0
	install_file ews_test_gles2_main.vert /usr/local/bin/ews_test_gles2_main.vert "shader" 0644 0:0
	install_file ews_test_gles2_main.frag /usr/local/bin/ews_test_gles2_main.frag "shader" 0644 0:0
	install_file ews_test_gles2_pp.vert /usr/local/bin/ews_test_gles2_pp.vert "shader" 0644 0:0
	install_file ews_test_gles2_pp.frag /usr/local/bin/ews_test_gles2_pp.frag "shader" 0644 0:0
	install_file ews_test_swrender /usr/local/bin/ews_test_swrender "binary" 0755 0:0

}

install_X()
{
	# Install X11 server binaries
	#
	for file in ./freedesktop/kdrive//usr/X11R6_SGX/bin/X*; do
		install_file $file /usr/X11R6_SGX/bin/`basename $file` "X11 server" 0755 0:0
	done
	$DOIT rm -f ${DISCIMAGE}/usr/X11R6_SGX/bin/X && $DOIT ln -s ./Xsgx ${DISCIMAGE}/usr/X11R6_SGX/bin/X

	# Install libraries for run-time and developer support
	#
	install_tree ./freedesktop/kdrive//usr/X11R6_SGX/lib /usr/X11R6_SGX/lib "X11 libraries"

	# Install headers for developers
	#
	install_tree ./freedesktop/kdrive//usr/X11R6_SGX/include /usr/X11R6_SGX/include "X11 header files"

	# Install miscellaneous X bits
	#
	if test -d ./freedesktop/kdrive//usr/X11R6_SGX/man ; then
		install_tree ./freedesktop/kdrive//usr/X11R6_SGX/man /usr/X11R6_SGX/man "X11 manual pages"
	fi
	if test -d ./freedesktop/kdrive//usr/X11R6_SGX/share ; then
		install_tree ./freedesktop/kdrive//usr/X11R6_SGX/share /usr/X11R6_SGX/share "X11 miscellaneous files"
	fi

	# Install support packages
	#
	[ -d ./packages/include ] &&
		install_tree ./packages/include /usr/include "support package header files"
	[ -d ./packages/lib ] &&
		install_tree ./packages/lib /usr/lib "support package libraries"
	[ -d ./packages/bin ] &&
		install_tree ./packages/bin /usr/bin "support package binaries"
	[ -d ./packages/share ] &&
		install_tree ./packages/share /usr/share "support package miscellania"

}


# Work out if there are any special instructions.
#
while [ "$1" ]; do
	case "$1" in
	-v|--verbose)
		VERBOSE=v;
		;;
	-r|--root)
		DISCIMAGE=$2;
		shift;
		;;
	-u|--uninstall)
		UNINSTALL=y
		;;
	-n)	DOIT=echo
		;;
	--no-pvr)
		NO_PVR=y
		;;
	--no-x)
		NO_X=y
		;;
	--no-display)
		NO_DISPLAYMOD=y
		;;
	--no-bcdevice)
		NO_BCDEVICE=y
		;;
	-h | --help | *)	
		usage
		;;
	esac
	shift
done

# Find out where we are?  On the target?  On the host?
#
case `uname -m` in
arm*)	host=0;
		from=target;
		DISCIMAGE=/;
		;;
sh*)	host=0;
		from=target;
		DISCIMAGE=/;
		;;
i?86*)	host=1;
		from=host;
		if [ -z "$DISCIMAGE" ]; then	
			echo "DISCIMAGE must be set for installation to be possible." >&2
			exit 1
		fi
		;;
x86_64*)	host=1;
		from=host;
		if [ -z "$DISCIMAGE" ]; then	
			echo "DISCIMAGE must be set for installation to be possible." >&2
			exit 1
		fi
		;;
*)		echo "Don't know host to perform on machine type `uname -m`" >&2;
		exit 1
		;;
esac

if [ ! -d "$DISCIMAGE" ]; then
	echo "$0: $DISCIMAGE does not exist." >&2
	exit 1
fi

echo
echo "Installing PowerVR Consumer/Embedded DDK 1.6.16.3977 on $from"
echo
echo "File system installation root is $DISCIMAGE"
echo

# Uninstall whatever's there already.
#
uninstall
[ -n "$UNINSTALL" ] && exit

#  Now start installing things we want.
#
[ -z "$NO_PVR" ] && install_pvr
[ -z "$NO_X" ] && install_X

# All done...
#
echo 
echo "Installation complete!"
if [ "$host" = 0 ]; then
   echo "You may now reboot your target."
fi
echo
