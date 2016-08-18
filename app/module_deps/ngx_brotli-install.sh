#!/bin/bash


# run as root only
if [[ $EUID -ne 0 ]] ; then
    run_error "This script must be run with root access\e[49m"
    exit 1
fi
[ $# -eq 0 ] && { run_error "Usage: brotli <destination_folder>"; exit; }
if [ -z ${ROOT+x} ];  then show_red "Error" "ROOT system variable is not set! Check config.sh";  exit 1; fi
if [ -z ${CACHE+x} ]; then show_red "Error" "CACHE system variable is not set! Check config.sh"; exit 1; fi
if [ -z ${BUILD+x} ]; then show_red "Error" "BUILD system variable is not set! Check config.sh"; exit 1; fi



function ngx_brotli() {
    local MAIN_DIR="brotli"
    local WORKDIR=${1} #full path
    local CACHEDIR="${CACHE}${MAIN_DIR}/"
    local FILENAME="${VERSION}.tar.gz"

    # Set: vars
    MAIN_DIR="brotli"
    WORKDIR="${CACHE}${MAIN_DIR}/"  


    # if [ -d "${BUILD}${MAIN_DIR}" ] ; then
    #     rm -Rf ${BUILD}${MAIN_DIR}
    # fi
    # # Clear: current install
    # if [ -d "${WORKDIR}" ] ; then
    #     rm -Rf ${WORKDIR}
    # fi
    # # Make: dirs
    # [ -d "$WORKDIR" ] || mkdir ${WORKDIR}
    # # Workspace
    # cd ${CACHE}
    # ##

    # git clone https://github.com/google/brotli.git ${MAIN_DIR}

    # if [ ! -s ${WORKDIR} ] ; then
    #     rm -Rf ${WORKDIR}
    #     run_error "cannot clone to ${WORKDIR}"
    #     exit 1
    # fi
    # cd ${WORKDIR}
    # run_compile "make"
    # python setup.py install
    # make
    # # move to build
    # mkdir -p ${BUILD}${MAIN_DIR}
    # mv -b ${WORKDIR}/* ${BUILD}${MAIN_DIR}

}
ngx_brotli ${1}



##############
##############
# CHANGE THIS TO INSTALL USING A LOCAL FUNCTIONS AND DONT OVERWRITE THE MAIN SHIT
##############
##############


