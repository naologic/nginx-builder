#!/bin/bash

########################
#
#   Use a function in order not to mess up global vars
#
########################



# run as root only
if [[ $EUID -ne 0 ]] ; then
    run_error "This script must be run with root access\e[49m"
    exit 1
fi
[ $# -eq 0 ] && { run_error "Usage: pagespeed <destination_folder>"; exit; }
if [ -z ${ROOT+x} ];  then show_red "Error" "ROOT system variable is not set! Check config.sh";  exit 1; fi
if [ -z ${CACHE+x} ]; then show_red "Error" "CACHE system variable is not set! Check config.sh"; exit 1; fi
if [ -z ${BUILD+x} ]; then show_red "Error" "BUILD system variable is not set! Check config.sh"; exit 1; fi




function ngx_pagespeed() {
    # Set: vars
    local VERSION="1.11.33.3"
    local MAIN_DIR="psol"
    local WORKDIR=${1} #full path
    local CACHEDIR="${CACHE}${MAIN_DIR}/"
    local FILENAME="${VERSION}.tar.gz"


    # Run
    run_install "${MAIN_DIR}:: required by pagespeed plugin"

    if [ ! -s "${CACHE}${FILENAME}" ] ; then
            run_download "${FILENAME}"
            wget -O ${CACHE}${FILENAME} wget https://dl.google.com/dl/page-speed/psol/${FILENAME} &> /dev/null
        else
            show_yellow "Cache" "found ${FILENAME}. Using from cache" 
    fi

    cd ${WORKDIR}
    if [ ! -s "${CACHE}${FILENAME}" ] ; then
            run_error "${CACHE}${FILENAME} not found"
            exit 1
        else
            cd ${WORKDIR}
            show_blue_bg "Unpack" "${FILENAME}"
            tar -xzf "${CACHE}${FILENAME}" -C ${WORKDIR}
            #cp -PR ${WORKDIR}${VERSION}/* ${WORKDIR}${MAIN_DIR}
            run_ok  
    fi
}
apt-get install -y libgoogle-perftools-dev &> /dev/null
ngx_pagespeed ${1}