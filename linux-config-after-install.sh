#!/bin/sh

cd ~/Downloads

UBUNTU_VERSION="xenial"

# adding getdeb repository
#sudo add-apt-repository 'deb http://archive.getdeb.net/ubuntu precise-getdeb apps'
#sudo wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -

# adding classic menu repository
#sudo add-apt-repository ppa:diesch/testing

# adding dropbox repository
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E
sudo sh -c 'echo "deb http://linux.dropbox.com/ubuntu/ trusty main" >> /etc/apt/sources.list.d/dropbox.list'

# ubuntu tweak
sudo add-apt-repository ppa:tualatrix/ppa

# insyncte
wget -qO - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.insynchq.com/mint rafaela non-free contrib" >> /etc/apt/sources.list.d/insync.list'

# Unity lens utility
#sudo add-apt-repository ppa:scopes-packagers/ppa

# Oracle Java 7 & 8
sudo -E add-apt-repository ppa:webupd8team/java

# Docker
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get install docker-engine
sudo usermod -aG docker $USER
sudo service docker start
sudo docker run hello-world
sudo systemctl enable docker
# Docker-compose
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` >~/docker-compose
chmod +x ~/docker-compose
sudo mv ~/docker-compose /usr/local/bin/docker-compose
# Docker-compose completition bash
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose > ~/docker-compose
sudo mv ~/docker-compose  /etc/bash_completion.d/docker-compose


# Atom Editor
sudo add-apt-repository ppa:webupd8team/atom

# Brackets Editor
sudo -E add-apt-repository ppa:webupd8team/brackets

# Firefox developer edition
sudo -E add-apt-repository ppa:ubuntu-mozilla-daily/firefox-aurora

# node.js PPA
# sudo -E add-apt-repository ppa:chris-lea/node.js
# curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

#mongo
sudo -E apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# Flash Player
sudo -E apt-add-repository -y ppa:nilarimogard/webupd8

#conky-manager
sudo -E apt-add-repository -y ppa:teejee2008/ppa

# Mediabuntu codec packages
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update

# Digikam
sudo add-apt-repository ppa:philip5/extra

# Kdenlive
sudo add-apt-repository ppa:kdenlive/kdenlive-stable
sudo apt-get update
sudo apt-get install kdenlive swh-plugins dvdauthor libkf5filemetadata-bin libmlt-data

sudo -E apt-get update

############################################

# Linux aux
# curl
sudo apt-get install -y curl

# Oracle Java 7 & 8
#sudo apt-get purge openjdk*
sudo -E apt-get install -y oracle-java7-installer
sudo -E apt-get install oracle-java7-set-default
sudo apt-get install -y oracle-java8-installer

# Netbeans
netbeans="8.1"
wget http://download.netbeans.org/netbeans/$netbeans/final/bundles/netbeans-$netbeans-linux.sh
chmod +x ./netbeans-$netbeans-linux.sh
sudo ./netbeans-$netbeans-linux.sh
rm netbeans-$netbeans-linux.sh

# GitKraken
#wget https://www.gitkraken.com/download/linux-deb
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
sudo dpkg -i gitkraken-amd64.deb
rm gitkraken-amd64.deb

# Virtualbox e Vagrant
# Virtualbox
echo "deb http://download.virtualbox.org/virtualbox/debian $UBUNTU_VERSION contrib" | sudo tee /etc/apt/sources.list.d/vbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install virtualbox-5.0 
sudo apt-get -y install linux-headers-generic build-essential dkms

sudo apt install vagrant
vagrant plugin install vagrant-proxyconf

# Node.js node - recess - gulp - bower - electron
sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo npm install -g npm@latest
sudo npm install -g recess
sudo npm install -g gulp
sudo npm install -g bower
sudo npm install -g electron-prebuilt

# Slack desktop
slack_v="2.1.2"
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-$slack_v-amd64.deb
sudo dpkg -i slack-desktop-$slack_v-amd64.deb
rm slack-desktop-$slack_v-amd64.deb

# Ruby gems - sass compiler
sudo apt-get install rubygems
sudo gem install sass

# Nautilus Open in Terminal
sudo apt-get install nautilus-open-terminal

# Filezilla
sudo apt-get install -y filezilla

# Synaptic
sudo apt-get install -y synaptic

# Apache2 + PHP5 + Mysql + PHPMYAdmin + # Lib-Apache-auth-mysql 
sudo apt-get install -y apache2 php5 php5-cli php5-mcrypt php5-intl php5-xdebug mysql-server libapache2-mod-auth-mysql php5-mysql phpmyadmin

sudo a2enmod rewrite
sudo php5enmod mcrypt

sudo service apache2 restart

#Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Phing
sudo pear channel-discover pear.phing.info
sudo pear install --alldeps phing/phing

# Postgresql 8.4
sudo touch /etc/apt/sources.list.d/pgdg.list
sudo echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -/wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql-8.4 php5-pgsql pgadmin3

# Postgresql user
echo "Change postgres user pwd"
sudo passwd postgres
echo "Lembre de entrar com su postgres e rodar o seguinte comando psql -c \"ALTER USER postgres WITH PASSWORD 'nova_senha'\" -d template1 "

# Pandoc & Texlive
wget https://github.com/jgm/pandoc/releases/download/1.15.0.6/pandoc-1.15.0.6-1-amd64.deb
sudo dpkg -i pandoc-1.15.0.6-1-amd64.deb
rm pandoc-1.15.0.6-1-amd64.deb

sudo apt-get install -y texlive-full texlive-lang-portuguese lmodern

# DBeaver
cd ~/Downloads
wget http://dbeaver.jkiss.org/files/dbeaver_3.4.5_amd64.deb
sudo dpkg -i dbeaver_3.4.5_amd64.deb
rm dbeaver_3.4.5_amd64.deb
#wget http://dbeaver.jkiss.org/files/driver-pack-2.1.0.zip
#sudo unzip driver-pack-2.1.0.zip -d /usr/share/dbeaver/
#rm driver-pack-2.1.0.zip

# mercurial - tortoisehg - mercurial nautilus scripts
#cd ~
#sudo apt-get install mercurial tortoisehg
#mkdir -p ~/.gnome2/nautilus-scripts/
#cd ~/.gnome2/nautilus-scripts/
#hg clone https://bitbucket.org/slashuer/nautilus_mercurial_scripts
#mv nautilus_mercurial_scripts/Mercurial/ .
#rm -R nautilus_mercurial_scripts/
#cd ~

#git
sudo apt-get install -y git

#Editors Atom & Brackets - Firefox dev edition
sudo apt-get install -y brackets atom firefox

# Diff and merge visual tools
sudo apt-get install -y diffuse meld

# Mongodb and Robomonog
sudo apt-get install -y mongodb-org
wget http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb
sudo -E dpkg -i robomongo-0.8.5-x86_64.deb 


# Unity lens Calculator utility
#sudo apt-get install unity-lens-utilities/ unity-scope-calculator

# Mediabuntu
sudo apt-get install ubuntu-restricted-extras non-free-codecs libdvdcss2 faac faad ffmpeg ffmpeg2theora flac icedax id3v2 lame libflac++6 libjpeg-progs libmpeg3-1 mencoder mjpegtools mp3gain mpeg2dec mpeg3-utils mpegdemux mpg123 mpg321 regionset sox uudeview vorbis-tools x264 arj lha p7zip p7zip-full p7zip-rar rar unrar unace-nonfree vlc

# ubuntu tweak
sudo apt-get install ubuntu-tweak -y

# installing classic menu repository
#sudo apt-get install classicmenu-indicator

# installing compizconfig
sudo apt-get install compizconfig-settings-manager

# installing conky
sudo apt-get install conky-all lm-sensors hddtemp
sudo apt-get install conky-manager

# installing dropbox
sudo apt-get install dropbox

# configuring watch users to dropbox
echo 100000 | sudo tee /proc/sys/fs/inotify/max_user_watches

# Keepass2
sudo apt-get install keepass2

# Google Chrome Stable
sudo apt-get install -y google-chrome-stable

# Flash player
sudo apt-get install -y freshplayerplugin

# Gimp
sudo apt-get install -y gimp gimp-data gimp-plugin-registry gimp-data-extras

# Shutter and edition extensions
sudo apt-get install -y shutter libgoo-canvas-perl gnome-web-photo

# Digikam
sudo apt-get install -y digikam kdelibs-bin kdelibs5-data kdelibs5-plugins

# Phatch - image photo batch editor
sudo apt-get install phatch

# insync
sudo apt-get install -y insync insync-nemo

# To compile sources
sudo apt-get install -y build-essential checkinstall cdbs devscripts dh-make fakeroot libxml-parser-perl check avahi-daemon -y

# PPA PURGE
sudo apt-get install -y ppa-purge

# XFCE4 Lightweight X Manager
#sudo apt-get install xfce4

# remove some app that I dont like to use and xfce4 install
sudo apt-get remove -y orage

#############################
# TWEAKS #
#############################

# MS Fonts
sudo -E apt-get install msttcorefonts

# nonfree firmware
sudo -E apt-get -y install linux-firmware-nonfree

#################################################################3
# Disable services from start on boot

# remove apache
#sudo update-rc.d -f apache2 remove

# remove mysql
#sudo update-rc.d -f mysql remove

#remove postgresql
#sudo update-rc.d -f postgresql remove

#remove virtualbox
sudo update-rc.d -f virtualBox remove
