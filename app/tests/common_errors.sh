#!/bin/bash

. config.sh
. app/colors.sh 

# run as root only
if [[ $EUID -ne 0 ]] ; then
    run_error "This script must be run with root access\e[49m"
    exit 1
fi

# test aclocal-1.5
type aclocal-1.5 >/dev/null 2>&1 || { 
    show_yellow "Warning" "aclocal-1.5 not found on your system. Trying to fix now..."
    ./fix/aclocal.sh
}
