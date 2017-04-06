#!/bin/bash

# Check if user is root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Install Dependencies 
apt-get -y install build-essential git libevent-dev libssl-dev libgcrypt11-dev libkrb5-dev libpam0g-dev libwrap0-dev libdb-dev libtdb-dev libmysqlclient-dev avahi-daemon libavahi-client-dev libacl1-dev libldap2-dev libcrack2-dev systemtap-sdt-dev libdbus-1-dev libdbus-glib-1-dev libglib2.0-dev libio-socket-inet6-perl tracker libtracker-sparql-1.0-dev libtracker-miner-1.0-dev

# Grab the files
wget http://prdownloads.sourceforge.net/netatalk/netatalk-3.1.11.tar.gz

# Untar the files
tar -xf netatalk-3.1.11.tar.gz

# Configure everything
cd netatalk-3.1.11
./configure \
        --with-init-style=debian-systemd \
        --without-libevent \
        --without-tdb \
        --with-cracklib \
        --enable-krbV-uam \
        --with-pam-confdir=/etc/pam.d \
        --with-dbus-daemon=/usr/bin/dbus-daemon \
        --with-dbus-sysconf-dir=/etc/dbus-1/system.d \
        --with-tracker-pkgconfig-version=1.0

# Build
make
make install

#clean up
cd
rm -r 
netatalk-3.1.11.tar.gz

# Finishing up
echo "+---------------------------------------------------------------------+"
echo "|                         Congratulation!                             |"
echo "|                      Your install is done.                          |"
echo "|        You can now access HOSTNAME.local from your browser          |"
echo "|                                                                     |"
echo "|                                                                     |"
echo "|                                                                     |"
echo "|                                                                     |"
echo "|                                                                     |"
echo "|            This installer was brought to you buy AllGray            |"
echo "+---------------------------------------------------------------------+"
