#!/bin/bash

# run as root only
if [[ $EUID -ne 0 ]] ; then
    echo "This script must be run with root access\e[49m"
    exit 1
fi

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
echo LC_ALL="en_US.UTF-8" >> /etc/environment
locale-gen "en_US.UTF-8"
dpkg-reconfigure locales
