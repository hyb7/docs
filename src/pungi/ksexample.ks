# Kickstart file automatically generated by anaconda.

#version=DEVEL
#url --url http://mirrors.kernel.org/fedora/releases/7/Fedora/i386/os
#ks=http://127.0.0.1/ks.cfg
#ks=http://localhost/ks.cfg
url --url http://ftp.usf.edu/pub/fedora/linux/releases/14/Fedora/i386/os
install
cdrom
lang en_US.UTF-8
keyboard us
network --onboot yes --device eth0 --bootproto dhcp --noipv6
timezone --utc America/New_York
rootpw  --iscrypted
$6$s9i1bQbmW4oSWMJc$0oHfSz0b/d90EvHx7cy70RJGIHrP1awzAgL9A3x2tbkyh72P3kN41vssaI3/SJf4Y4qSo6zxc2gZ3srzc4ACX1
selinux --permissive
authconfig --enableshadow --passalgo=sha512 --enablefingerprint
firewall --service=ssh
# The following is the partition information you requested
# Note that any partitions you deleted are not expressed
# here so unless you clear all partitions first, this is
# not guaranteed to work

#I am deleting the old partitions with this
clearpart --all --drives=sda

#I am creating partitions here
#I will create the lvm stuff farther down
part /boot --fstype=ext4 --size=500 --ondisk=sda --asprimary
part pv.5xwrsR-ldgG-FEmM-2Zu5-Jn3O-sx9T-unQUOe --grow --size=500 --ondisk=sda
--asprimary

#Very important to have the two part lines before the lvm stuff
volgroup VG --pesize=32768 pv.5xwrsR-ldgG-FEmM-2Zu5-Jn3O-sx9T-unQUOe
logvol / --fstype=ext4 --name=lv_root --vgname=VG --size=40960
logvol /home --fstype=ext4 --name=lv_home --vgname=VG --size=25600
logvol swap --fstype swap --name=lv_swap --vgname=VG --size=4096

bootloader --location=mbr --driveorder=sda --append="rhgb quiet"

%packages
@admin-tools
#@editors
#@fonts
@gnome-desktop
#@games
#@graphical-internet
#@graphics
@hardware-support
@input-methods
#@java
#@office
#@online-docs
@printing
@sound-and-video
@text-internet
@base-x
xfsprogs
mtools
#gpgme
#openoffice.org-opensymbol-fonts
#gvfs-obexftp
hdparm
#gok
#iok
#vorbis-tools
jack-audio-connection-kit
#ncftp
gdm
%end

# Reboot after installation
reboot
