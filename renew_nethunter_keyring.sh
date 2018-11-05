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
echo -n "${ylw} done! do you want to apt-get update && apt-get upgrade? (can take a long time! use only if connected to unmetered connection!) ${txtrst}"

read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  apt-get update && apt-get upgrade

else
	echo -n "${ylw} finished update and upgrade! ${txtrst}"
	exit
fi

echo -e "Choose the Nethunter Metapackage you want to Install:"
echo

  LIST_METAPKG=$(echo -e "$(cat nethunter_metapackages)")

  echo "LIST_METAPKG"
  echo
  echo "Select a metapackage"

  echo -n "Enter metapackage and press [ENTER]: "
  read metapackage
  echo

  apt-get install $metapackage

fi
