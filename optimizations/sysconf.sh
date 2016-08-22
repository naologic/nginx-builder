#!/bin/bash


# run as root only
if [[ $EUID -ne 0 ]] ; then
    echo "This script must be run with root access\e[49m"
    exit 1
fi

# Optimizing TCP stack for better performance
# Optimizing security to limit nofile params

# USE WITH CAUTION! Check the files


# Append: size of the queue for connections waiting for acceptance /etc/sysctl.conf
# echo "net.core.somaxconn = 65536" >> /etc/sysctl.conf
# echo "net.ipv4.tcp_max_tw_buckets = 1440000" >> /etc/sysctl.conf
# echo "net.ipv4.tcp_fin_timeout 15" >> /etc/sysctl.conf
# echo "net.ipv4.tcp_window_scaling = 1" >> /etc/sysctl.conf
# echo "net.ipv4.tcp_max_syn_backlog = 3240000" >> /etc/sysctl.conf
# Append: File Descriptors
# echo "soft nofile 4096" >> /etc/security/limits.conf
# echo "hard nofile 4096" >> /etc/security/limits.conf