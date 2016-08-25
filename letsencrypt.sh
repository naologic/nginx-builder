#!/bin/bash

. config.sh


# Install: let's encrypt certbot
apt-get install -y letsencrypt 

function lets_generate() {
    # I need port :80
    service nginx stop    
    # Run: generate certificate 
    letsencrypt certonly --standalone -d ${NGINX_SERVER_URL} -d www.${NGINX_SERVER_URL}
}
function lets_update() {
    service nginx stop
    letsencrypt renew
    openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
    service nginx start
}

lets_generate
lets_update
