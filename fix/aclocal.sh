#!/bin/bash


# run as root only
if [[ $EUID -ne 0 ]] ; then
    echo -e "\e[1;39m[   \e[31mError\e[39m   ] need root access to run this script\e[0;39m"
    exit 1
fi

function install_automake() {
    [ $# -eq 0 ] && { run_error "Usage: install_automake <version>"; exit; }
    local VERSION=${1}
    wget ftp://ftp.gnu.org/gnu/automake/automake-${VERSION}.tar.gz &> /dev/null
    if [ -f "automake-${VERSION}.tar.gz" ]; then
            tar -xzf automake-${VERSION}.tar.gz
            cd automake-${VERSION}/
            ./configure
            make && make install
            echo -e "\e[1;39m[   \e[1;32mOK\e[39m   ] automake-${VERSION} installed\e[0;39m"

        else
            echo -e "\e[1;39m[   \e[31mError\e[39m   ] cannot fetch file from ftp://ftp.gnu.org/gnu/automake/ \e[0;39m"
            exit 1
    fi
}
install_automake 1.15