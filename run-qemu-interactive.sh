#!/bin/bash

###############################################
##     Colorize and add text parameters      ##
###############################################
#
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
##         START SCRIPT          ##
###################################

## DEVICE SELECTION
# LIST_DEVS=$(echo -e "$(ls -l /dev/sd*)")
#
echo
echo
LIST_DEVS=$(echo -e "$(lsblk)")

echo "$LIST_DEVS"
echo
echo -n "${bldylw}# Enter a device to run in QEMU and press [ENTER]...: /dev/ ${txtrst}"
read input
echo

## SELECT BOOTMODE
#
echo
echo "${bldylw}# Boot /dev/$input via UEFI? ${txtrst}${wht}(for UEFI boot OVMF/Tianocore must be installed!) ${txtrst}"
select yn in "UEFI" "BIOS"; do
    case $yn in
        UEFI ) BOOT="--bios /usr/share/OVMF/OVMF_CODE.fd"; break;;
        BIOS ) BOOT=""; break;;
    esac
done

echo
#
sudo qemu-system-x86_64 -machine type=pc,accel=kvm -enable-kvm -cpu host -smp cores=2 \
-m size=2G \
-vga std \
-k de \
$BOOT \
-hda /dev/$input \
