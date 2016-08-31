#!/bin/bash


# SCRIPT_PATH:: path to current script; VERY important
declare -A SCRIPT_PATH=$(eval echo ~${SUDO_USER})"/nginx-builder/"

# ROOT:: path where all the compiling is done (this is NOT path to installed nginx)
declare -A ROOT=$(eval echo ~${SUDO_USER})"/nginx-build/" #/opt
# NGINX_PATH:: path where nginx will be located. Default is /usr/local/nginx -- don't forget trailing /
declare NGINX_PATH="/usr/local/nginx/"
declare NGINX_USE_PATH="/etc/nginx/"
declare NGINX_VERSION_NO=""
declare NGINX_SERVER_URL="example.com" #
declare NGINX_PROJECT_NAME="example" #
declare NGINX_SERVER_PORT="80" #


declare -A CACHE="${ROOT}cache/"
declare -A BUILD="${ROOT}build/" 

declare -A VERSION=(['luajit']='2.0.4' ['nginx']='1.11.3' ['pcre']='8.39' ['zlib']='1.2.8' ['openssl']='1.0.2f')
# ./configure default settings
declare -A DEFAULT_CONFIGURE_PARAMS="--with-debug "
declare -A DEBUG=true

# Nginx config params
declare NGINX_INSTALL_DEPS
declare NGINX_INSTALL_MODULES
declare NGINX_LUA_MODULES
declare NGINX_CONFIGURE
declare NGINX_CONFIGURE_PARAMS
 


# Default: build params
DEFAULT_CONFIGURE_PARAMS+="--prefix=${NGINX_PATH} --sbin-path=sbin/nginx --conf-path=nginx.conf --pid-path=logs/nginx.pid --user=www-data "
DEFAULT_CONFIGURE_PARAMS+="--with-pcre=../pcre --with-zlib=../zlib "
DEFAULT_CONFIGURE_PARAMS+="--with-ipv6 --with-http_realip_module  --with-http_gzip_static_module --with-stream "

