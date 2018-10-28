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
