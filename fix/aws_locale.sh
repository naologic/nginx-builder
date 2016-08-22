#!/bin/bash


export LC_ALL="en_US.UTF-8"
locale-gen "en_US.UTF-8"
dpkg-reconfigure locales
