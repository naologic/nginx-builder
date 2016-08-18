#!/bin/bash

. config.sh
. app/colors.sh 

# run as root only
if [[ $EUID -ne 0 ]] ; then
    run_error "This script must be run with root access\e[49m"
    exit 1
fi
[ $# -eq 0 ] && { run_error "Usage: install_lua <version>"; exit; }
if [ -z ${ROOT+x} ];  then show_red "Error" "ROOT system variable is not set! Check config.sh";  exit 1; fi
if [ -z ${CACHE+x} ]; then show_red "Error" "CACHE system variable is not set! Check config.sh"; exit 1; fi
if [ -z ${BUILD+x} ]; then show_red "Error" "BUILD system variable is not set! Check config.sh"; exit 1; fi

# Set: vars
MAIN_DIR="luajit/"
WORKDIR="${CACHE}${MAIN_DIR}"  
FILENAME="LuaJIT-${1}.tar.gz"
# Clear: current install
if [ -d "${WORKDIR}" ] ; then
    rm -Rf ${WORKDIR}
fi
# Make: dirs
[ -d "$WORKDIR" ] || mkdir ${WORKDIR}
# Workspace
cd ${WORKDIR}


luajit -v >/dev/null 2>&1 || { 
    show_blue "Install" "LuaJIT from source"
    # Run
    run_install "LuaJIT-${1}:: Lua programming language with JIT compiler"

    if [ ! -s "${CACHE}${FILENAME}" ] ; then
            run_download "${FILENAME}"
            wget -O ${CACHE}${FILENAME} http://luajit.org/download/${FILENAME} &> /dev/null
        else
            show_yellow "Cache" "found ${CACHE}LuaJIT-${1}.tar.gz. Using from cache" 
    fi

    if [ ! -s "${CACHE}${FILENAME}" ] ; then
            rm -Rf ${WORKDIR}
            run_error "${CACHE}LuaJIT-${1}.tar.gz not found"
            exit 1
        else
            show_blue_bg "Unpack" "LuaJIT-${1}.tar.gz"
            tar -xzf "${CACHE}${FILENAME}" -C ${CACHE}
            #mv -b ${CACHE}LuaJIT-${1}/* ${WORKDIR}
            cd ${CACHE}LuaJIT-${1}

            run_compile "make"
            make install PREFIX=/usr/local
            #rm -rf ${CACHE}LuaJIT-${1}.tar.gz ${WORKDIR}LuaJIT-${1}

            run_ok  
    fi
}
show_yellow "Installed" "LuaJIT is already installed on your system"

exit 1;