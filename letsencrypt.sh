#!/bin/bash

. config.sh
. app/colors.sh 

# Install: let's encrypt certbot


#function pre_install() {}
function install() {
    git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
}
function post_install() {
    # I need port :80
    service nginx stop
}
function install_configs() {
    # Run: generate certificate 
    [ ! -f /etc/letsencrypt/renewal/${SRV_URL}.conf ] && {
        /bin/bash /opt/letsencrypt/letsencrypt-auto certonly --standalone -d ${SRV_URL}
        service nginx stop
        openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
        service nginx start
    }
}
function install_services() {
    # install cron
    local CRON="/bin/bash /opt/letsencrypt/letsencrypt-auto renew --force-renewal"
    ( crontab -l | grep -v "$CRON" ; echo "0 0 1 * * ${CRON}" ) | crontab -
}

install
post_install
install_configs
install_services