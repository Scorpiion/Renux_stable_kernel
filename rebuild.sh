#!/bin/bash -e

unset KERNEL_REL
unset STABLE_PATCH
unset RC_KERNEL
unset RC_PATCH
unset BUILD
unset CC
unset LINUX_GIT
unset LATEST_GIT

unset LOCAL_PATCH_DIR

ARCH=$(uname -m)
CCACHE=ccache

DIR=$PWD

CORES=1
if test "-$ARCH-" = "-x86_64-" || test "-$ARCH-" = "-i686-"
then
 CORES=$(cat /proc/cpuinfo | grep processor | wc -l)
 let CORES=$CORES+1
fi

mkdir -p ${DIR}/deploy/

function git_kernel_torvalds {
  echo "pulling from torvalds kernel.org tree"
  git pull git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master --tags || true
}

function git_kernel_stable {
  echo "fetching from stable kernel.org tree"
  git pull git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git master --tags || true
}

function git_kernel {
if [ "-${LINUX_GIT}-" != "--" ]; then

  if [[ ! -a ${LINUX_GIT}/.git/config ]]; then
    echo "Double check: LINUX_GIT variable in system.sh, i'm not finding a git tree"
    exit
  fi

  cd ${LINUX_GIT}/
    echo "Updating LINUX_GIT tree via: git fetch"
    git fetch
  cd -

  if [[ ! -a ${DIR}/KERNEL/.git/config ]]; then
	rm -rf ${DIR}/KERNEL/ || true
    git clone --shared ${LINUX_GIT} ${DIR}/KERNEL
  fi

  cd ${DIR}/KERNEL/

  git reset --hard
  git checkout master -f
  git pull

  if [ "${RC_PATCH}" ]; then
    git tag | grep v${RC_KERNEL}${RC_PATCH} || git_kernel_torvalds
    git branch -D v${RC_KERNEL}${RC_PATCH}-${BUILD} || true
    if [ ! "${LATEST_GIT}" ] ; then
      git checkout v${RC_KERNEL}${RC_PATCH} -b v${RC_KERNEL}${RC_PATCH}-${BUILD}
    else
      git checkout origin/master -b v${RC_KERNEL}${RC_PATCH}-${BUILD}
    fi
  elif [ "${STABLE_PATCH}" ] ; then
    git tag | grep v${KERNEL_REL}.${STABLE_PATCH} || git_kernel_stable
    git branch -D v${KERNEL_REL}.${STABLE_PATCH}-${BUILD} || true
    if [ ! "${LATEST_GIT}" ] ; then
      git checkout v${KERNEL_REL}.${STABLE_PATCH} -b v${KERNEL_REL}.${STABLE_PATCH}-${BUILD}
    else
      git checkout origin/master -b v${KERNEL_REL}.${STABLE_PATCH}-${BUILD}
    fi
  else
    git tag | grep v${KERNEL_REL} || git_kernel_torvalds
    git branch -D v${KERNEL_REL}-${BUILD} || true
    if [ ! "${LATEST_GIT}" ] ; then
      git checkout v${KERNEL_REL} -b v${KERNEL_REL}-${BUILD}
    else
      git checkout origin/master -b v${KERNEL_REL}-${BUILD}
    fi
  fi

  git describe

  cd ${DIR}/

else
  echo "UPDATED: this script now uses a git repo vs raw *.tar.bz2"
  echo "Update your system.sh file via: meld system.sh system.sh.sample"
  echo "and make sure to clone a git tree and edit the location of LINUX_GIT variable"
  exit
fi
}

function patch_kernel {
  cd ${DIR}/KERNEL
  export DIR BISECT
  /bin/bash -e ${DIR}/patch.sh || { git add . ; exit 1 ; }

  git add .
  if [ "${RC_PATCH}" ]; then
    git commit -a -m ''$RC_KERNEL''$RC_PATCH'-'$BUILD' patchset'
  elif [ "${STABLE_PATCH}" ] ; then
    git commit -a -m ''$KERNEL_REL'.'$STABLE_PATCH'-'$BUILD' patchset'
  else
    git commit -a -m ''$KERNEL_REL'-'$BUILD' patchset'
  fi

#Test Patches:
#exit

  if [ "${LOCAL_PATCH_DIR}" ]; then
    for i in ${LOCAL_PATCH_DIR}/*.patch ; do patch  -s -p1 < $i ; done
    BUILD+='+'
  fi

  cd ${DIR}/
}

function copy_defconfig {
  cd ${DIR}/KERNEL/
  make ARCH=arm CROSS_COMPILE=${CC} distclean
  make ARCH=arm CROSS_COMPILE=${CC} omap2plus_defconfig
  cp .config -v ${DIR}/patches/ref_omap2plus_defconfig
  cp ${DIR}/patches/defconfig -v .config
  cd ${DIR}/
}

function make_menuconfig {
  cd ${DIR}/KERNEL/
  make ARCH=arm CROSS_COMPILE=${CC} menuconfig
  cp .config -v ${DIR}/patches/defconfig
  cd ${DIR}/
}

function make_zImage {
  cd ${DIR}/KERNEL/
  echo "make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE=\"${CCACHE} ${CC}\" CONFIG_DEBUG_SECTION_MISMATCH=y zImage"
  time make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CCACHE} ${CC}" CONFIG_DEBUG_SECTION_MISMATCH=y zImage
  KERNEL_UTS=$(cat ${DIR}/KERNEL/include/generated/utsrelease.h | awk '{print $3}' | sed 's/\"//g' )
  cp arch/arm/boot/zImage ${DIR}/deploy/${KERNEL_UTS}.zImage
  cd ${DIR}/
}

function make_uImage {
  cd ${DIR}/KERNEL/
  echo "make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE=\"${CCACHE} ${CC}\" CONFIG_DEBUG_SECTION_MISMATCH=y uImage"
  time make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CCACHE} ${CC}" CONFIG_DEBUG_SECTION_MISMATCH=y uImage
  KERNEL_UTS=$(cat ${DIR}/KERNEL/include/generated/utsrelease.h | awk '{print $3}' | sed 's/\"//g' )
  cp arch/arm/boot/zImage ${DIR}/deploy/${KERNEL_UTS}.uImage
  cd ${DIR}/
}

function make_modules {
  cd ${DIR}/KERNEL/
  time make -j${CORES} ARCH=arm LOCALVERSION=-${BUILD} CROSS_COMPILE="${CCACHE} ${CC}" CONFIG_DEBUG_SECTION_MISMATCH=y modules

  echo ""
  echo "Building Module Archive"
  echo ""

  rm -rf ${DIR}/deploy/mod &> /dev/null || true
  mkdir -p ${DIR}/deploy/mod
  make ARCH=arm CROSS_COMPILE=${CC} modules_install INSTALL_MOD_PATH=${DIR}/deploy/mod
  echo "Building ${KERNEL_UTS}-modules.tar.gz"
  cd ${DIR}/deploy/mod
  tar czf ../${KERNEL_UTS}-modules.tar.gz *
  cd ${DIR}/
}

function make_headers {
  cd ${DIR}/KERNEL/

  echo ""
  echo "Building Header Archive"
  echo ""

  rm -rf ${DIR}/deploy/headers &> /dev/null || true
  mkdir -p ${DIR}/deploy/headers/usr
  make ARCH=arm CROSS_COMPILE=${CC} headers_install INSTALL_HDR_PATH=${DIR}/deploy/headers/usr
  cd ${DIR}/deploy/headers
  echo "Building ${KERNEL_UTS}-headers.tar.gz"
  tar czf ../${KERNEL_UTS}-headers.tar.gz *
  cd ${DIR}/
}

  /bin/bash -e ${DIR}/tools/host_det.sh || { exit 1 ; }

if [ -e ${DIR}/system.sh ]; then
  . system.sh
  . version.sh

#  git_kernel
#  patch_kernel
#  copy_defconfig
  make_menuconfig
  make_zImage
  make_uImage
  make_modules
#  make_headers
else
  echo "Missing system.sh, please copy system.sh.sample to system.sh and edit as needed"
  echo "cp system.sh.sample system.sh"
  echo "gedit system.sh"
fi

