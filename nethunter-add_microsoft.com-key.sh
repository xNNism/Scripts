#!/bin/sh

exec apt-key adv --keyserver packages.microsoft.com --recv-keys EB3E94ADBE1229CF

echo ""
echo -n "${ylw} Done! Do you want to Update & Upgrade Kali Nethunter? ${txtrst}"
echo -n "${ylw} Warning: This can take a long time! use only if connected to unmetered connection! ${txtrst}"

read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
  apt-get update && apt-get upgrade

else
	echo -n "${ylw} added "packages.microsoft.com" Keys ${txtrst}"
	exit
fi
