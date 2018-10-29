#!/bin/sh

# colors ######################
ylw=$(tput setaf 3) # yellow
txtrst=$(tput sgr0) # Reset
###############################

echo "${ylw} downloading keyring_2018.1_all.deb...${txtrst}"
echo ""
sleep 2
wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.1_all.deb

echo ""
echo "${ylw} Installing new keyring...${txtrst}"
echo ""
sleep 2
dpkg -i kali-archive-keyring_2018.1_all.deb

echo ""
echo -n "${ylw} done! do you want to apt-get update && apt-get upgrade? ${txtrst}"
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  apt-get update && apt-get upgrade

else
	echo -n "${ylw} ..finished ${txtrst}"
	exit
fi

echo ""
echo "${ylw} metapackages to install:.${txtrst}"
echo ""
sleep 2

(kali-linux
kali-linux-all
kali-linux-forensic
kali-linux-full
kali-linux-gpu
kali-linux-pwtools
kali-linux-rfid
kali-linux-sdr
kali-linux-top10
kali-linux-voip
kali-linux-web
kali-linux-wireless
