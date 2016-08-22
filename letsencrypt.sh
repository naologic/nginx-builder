#!/bin/bash

. config.sh


# Install: let's encrypt certbot
apt-get install -y letsencrypt 

function lets_generate() {
    # Run: generate certificate 
    letsencrypt certonly --standalone -d ${NGINX_SERVER_URL} -d www.${NGINX_SERVER_URL}
}
function lets_update() {
    service nginx stop
    letsencrypt renew
    service nginx start
}