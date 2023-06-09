#!/bin/sh
# Automation Script for Fresh Install of Raspberry Pi Os Lite (64-bit) on Raspberry Pi 4B (8GB) computer-board.

# map

# 1.

# 1.

# PACKAGES

# Install sudo

apt-get update && apt-get upgrade -y

apt-get install sudo

visudo

OR

usermod -aG sudo mils

# Quit root and login as <user>

# Setup Home directory

echo ""

echo "2/5 - setting up user's home directory"

echo ""

mkdir /home/mils/Production

mkdir /home/mils/Production/Media

mkdir /home/mils/Production/Media/Pictures

mkdir /home/mils/Production/Media/Pictures/Screenshots/

mkdir /home/mils/Production/Downloads

mkdir /home/mils/Production/Downloads/Miscellaneous

mkdir /home/mils/Production/Downloads/Software

mkdir /home/mils/Production/Temporary

mkdir /home/mils/Public

mkdir /home/mils/Bluetooth

echo ""

echo "done"

echo ""

echo "3/5 - installing packages"

sudo apt-get update

sudo apt install

# General

 xorg i3 network-manager-gnome

# General

terminator screenfetch htop

# Work

gimp libreoffice telegram-desktop nautilus xbindkeys scrot feh compton

# System Utility

gparted redshift ntp

# Networking

rsync ssh samba nfs-server nfs-client blueman

# Technical

python3 python3-pip mariadb-server

# Audio

pulseaudio pavucontrol pulseaudio-bluetooth

echo ""

echo "done."

echo ""

echo "4/5 - Creating Mount Points"

echo ""

mkdir /media/mils/Sandisk_128GB

mkdir /media/mils/Sandisk_128GB/Projects

mkdir /media/mils/Sandisk_128GB/Media

echo ""

echo "5/5 - Decrypting & Mounting Sandisk_128GB"

echo ""

sudo cryptsetup luksOpen UUID=19fc5859-994c-440d-af38-cd292796f6ef luks_Sandisk_128GB && sudo mount /dev/mapper/luks_Sandisk_128GB /media/mils/Sandisk_128GB/Projects && sudo mount UUID=93a4b56a-2d13-496e-8665-96cdcb76bda7 /media/mils/Sandisk_128GB/Media

# Restore User Configsa

echo ""

echo "1/2 - Restoring User Configs"

echo ""

cp /home/mils/Production/Projects/Active/HOME\ LINUX/Scripts/Common/System/bashrc/ /home/mils/.bashrc &&

cp /home/mils/Production/Projects/Active/HOME\ LINUX/Scripts/Common/System/i3wm/ /home/mils/.config/i3/config &&

cp /home/mils/Production/Projects/Active/HOME\ LINUX/Scripts/Common/System/fehbg/ /home/mils/.fehbg &&

cp /home/mils/Production/Projects/Active/HOME\ LINUX/Scripts/Common/System/xbindkeysrc/ /home/mils/.xbindkeysrc &&

cp /home/mils/Production/Projects/Active/HOME\ LINUX/Scripts/Common/System/xinitrc/ /home/mils/.xinitrc &&

# Restore Projects

rsync -avh /media/mils/Sandisk_128GB/Projects/ /home/mils/Production/Projects/ &&

echo ""

echo "2/2 - Restoring Projects"

echo ""

# User Permissions

#chown mils -R /home/mils/Production

## =================================

INDEX

Prepare Boot Media using DD

Complete Installation

Boot system and login as root

Login as user

Move /hone to another partition

Install Basic Packages

Enable Networking

System configuration

Install More Packages

# Sync Projects & System Configs from External Media (Sandisk_128GB)

sudo /media/mils/Sandisk_128GB/Projects/Active/HOME\ LINUX/Scripts/Common/Rsync/restore--Sandisk_128GB-projects.sh

#System configuration

Skip GRUB Menu

$ sudo nano /etc/defaults/grub

Set timeout to 0.

Auto Startx after login

$ sudo nano /home/mils/.bash_profile

(start)

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then

startx

fi

(end)

Bind keys on keyboard

xbindkeys --defaults > /home/mils/. xbindkeysrc

Set wallpaper using feh

$ nano /home/mils/.fehbg

$ chown mils -R /home/mils

Login as user, install basic packages

$ sudo apt-get install firmware-realtek xorg i3 network-manager-gnome

# Install More Packages

# Firmware

$ sudo apt-get install firmware-misc-nonfree firmware-linux firmware-linux-free firmware-linux-nonfree amd64-microcode intel-microcode

# General

terminator screenfetch htop 

# Work

gimp libreoffice telegram-desktop nautilus xbindkeys scrot feh compton

# System Utility

gparted redshift

# Networking

rsync ssh samba nfs-server nfs-client blueman ntp

# Technical

python3 python3-pip mariadb-server

# Audio

pulseaudio pavucontrol pulseaudio-bluetooth

#deb http://deb.debian.org/debian/ buster-backports main contrib non-free

#sudo apt --fix-broken install

#sudo apt -t buster-backports install linux-image-amd64

$ sudo update-grub

$ sudo apt autoremove

Then, further configuration for backlight and display DPI.

Create xresource file and input dpi settings as below:

$ nano ~/.Xresources

(start)

Xft.dpi: 128

(end)

Create xinit file and put the entries as 

$ nano ~/.xinitrc

(start)

xrdb -merge ~/.Xresources

exec i3

(end)

xbindkeys --poll-rc

Remove Desktop Environment

tasksel

sudo systemctl get-default

sudo systemctl set-default graphical.target

Wifi Drivers for Debian

Intel

firmware-iwlwifi

-------------------------------------------
