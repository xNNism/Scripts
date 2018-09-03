#!/bin/sh

########################################################################
#																	   #
# Script to install packages to establish a buildsystem on Archlinux   #
#																	   #
########################################################################

AURHELPER="yaourt"

sudo pacman -Sy
sudo pacman -Syu

sudo pacman -S --needed \
asciidoc \
bash \
bc \
binutils \
bin86 \
boost \
bzip2 \
lib32-flex \
flex \
fastjar \
git \
gcc \
util-linux \
gawk \
gtk2 \
intltool \
zlib \
make \
cdrkit \
ncurses \
openssl \
patch \
perl-extutils-makemaker \
python2 \
rsync \
ruby \
unzip \
wget \
gettext \
libxslt \
libusb \
zlib \
sharutils \
jdk7-openjdk \
b43-fwcutter \
zip \
subversion \
findutils \
time \

$AURHELPER -S --needed --noconfirm \
bcc \
sdcc \
