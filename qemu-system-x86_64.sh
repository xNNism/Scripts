#!/bin/bash

#////////////////////////////////////////////////////////////////////////////////////#
#																					 #
#  dependencies: qemu, libvirt, bridge-utils, ovmf, vde2, virtio-win,    #
#  ovmf.								 											 #
#																					 #
# [ https://wiki.archlinux.org/index.php/QEMU#Graphics ]							 #
#																					 #
#////////////////////////////////////////////////////////////////////////////////////#


####################################
#////      define paths       /////#
####################################
#	
ISO="/path/to/isofile-x86_64.iso"
VIRTIOISO="/path/to/virtio-win.iso"
HDD1="/dev/sda"
HDD2="/dev/sdb"
CORES="4"
RAM="4G"
BOOT="menu=on" # "-boot menu=on" / "a" / "d"


####################################################
#////    Colorize and add text parameters     /////#
####################################################
	
blk=$(tput setaf 0) # black
red=$(tput setaf 1) # red
grn=$(tput setaf 2) # green
ylw=$(tput setaf 3) # yellow
blu=$(tput setaf 4) # blue
mga=$(tput setaf 5) # magenta
cya=$(tput setaf 6) # cyan
wht=$(tput setaf 7) # white
#
txtbld=$(tput bold) # Bold
bldblk=${txtbld}$(tput setaf 0) # black
bldred=${txtbld}$(tput setaf 1) # red
bldgrn=${txtbld}$(tput setaf 2) # green
bldylw=${txtbld}$(tput setaf 3) # yellow
bldblu=${txtbld}$(tput setaf 4) # blue
bldmga=${txtbld}$(tput setaf 5) # magenta
bldcya=${txtbld}$(tput setaf 6) # cyan
bldwht=${txtbld}$(tput setaf 7) # white
txtrst=$(tput sgr0) # Reset


###################################
#////     prepare system     /////#
###################################
	
sudo modprobe kvm
sudo modprobe kvm_intel


###############################
#////     Start QEMU     /////#
###############################

sudo qemu-system-x86_64   \
-machine type=pc,accel=kvm 	 \
-enable-kvm  	 \
-cpu host   \
-smp cores=$CORES  	 \
-m size=$RAM  	 \
-boot $BOOT   \
-bios /usr/share/OVMF/OVMF_CODE.fd   \
-drive file=$ISO,index=1,media=cdrom,id=cdrom0	   \
-drive file=$VIRTIO,index=2,media=cdrom,id=cdrom1  	 \
-drive file=$BOOTPART,index=4,format=raw,if=none,id=drive-virtio-disk1,cache=none,aio=native	\
-drive file=$ROOTPART,index=5,format=raw,if=none,id=drive-virtio-disk2,cache=none,aio=nativ	\
-device virtio-blk-pci,scsi=off,drive=drive-virtio-disk1,id=virtio-disk1  	\
-device virtio-blk-pci,scsi=off,drive=drive-virtio-disk2,id=virtio-disk2 	 \
-netdev user,id=vmnic 	 \
-device virtio-net,netdev=vmnic	 \
 -vnc :1  	\
 
