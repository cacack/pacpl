#!/bin/bash
#
# This script only installs the required Perl modules.
#
# You will need to install the Ubuntu restricted extras package
# to use MP3.  This can be done using the following steps:
#
# 1) Click on "Add/Remove Programs" in the main menu
# 2) Click on the "Others" category
# 3) Scroll down and check the box next to Ubuntu restricted extras
# 4) Click on "Apply Changes"
#
# For Ubuntu users in Ubuntu Software Center just search for restricted.
#
# After completing the above steps you can install the required encoders
# and decoders using Adept Manager or in a terminal via 'sudo apt-get'
#
# It is suggested (and probably necessary) to complete the above steps
# before installing the below modules.
#
# run this script using: sh mod-install-kubuntu.sh

echo ""
echo ""
echo "Installing required libs and perl modules..."
sleep 3

sudo apt-get install libvorbis-dev \
		     libcddb-perl \
		     libinline-perl \
                     libcddb-get-perl \
                     libaudio-musepack-perl \
                     libaudio-wma-perl \
                     libmp3-tag-perl \
                     libmp4-info-perl \
                     libaudio-flac-header-perl

# Have to install Ogg::Vorbis::Header manually since the bright devs
# over in *buntu world thought Ogg::Vorbis::Header::PurePerl would be
# a "Drop in replacement" for the aformentioned module.  It's not.  Period.
echo ""
echo ""
echo "Manually installing Ogg::Vorbis::Header..."
sleep 3

sudo perl -MCPAN -e 'install Ogg::Vorbis::Header'

# install some default encoders / decoders
echo ""
echo ""
echo "Installing some basic encoding/decoding tools to get you started.."
sleep 3

sudo apt-get install vorbis-tools \
		     lame \
		     twolame \
		     sox \
		     musepack-tools \
		     ffmpeg \
		     mplayer \
		     flac \
		     faac \
		     faad \
		     opus-tools \
		     sndfile-programs \
		     speex \
		     wavpack \
		     aften \
		     perl-doc

echo ""
echo ""
sleep 2
echo "Settign up your repository to be able to install the restricted-extras package..."
sleep 2

sudo apt-get clean
cd /var/lib/apt
sudo mv lists lists.old
sudo mkdir -p lists/partial
sudo apt-get clean
sudo apt-get update

sleep 2
echo ""
echo ""
echo "Now install via apt-get ubuntu-restricted-extras or kubuntu-restricted-extras depending on your flavor"
sleep 5
