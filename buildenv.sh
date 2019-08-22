#!/bin/sh

########################################################################
#											                                                 #						   
# Install needed packages to build OpenWrt.                            #
#																	                                     #
########################################################################

AURHELPER="trizen"

sudo pacman -Syy
sudo pacman -Syuu
sudo pacman -S --needed --noconfirm \
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

$AURHELPER -S --needed --noconfirm  \
bcc \
sdcc \
aosp-devel \
lineageos-devel
