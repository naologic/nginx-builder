#!/bin/bash


# SCRIPT_PATH:: path to current script; VERY important
declare -A SCRIPT_PATH="/lab/m0/nginx-perfromance-web/"
# ROOT:: path where all the compiling is done (this is NOT path to installed nginx)
declare -A ROOT="/home/d3x/tests/" #/opt
# NGINX_PATH:: path where nginx will be located. Default is /usr/local/nginx -- don't forget trailing /
declare NGINX_PATH="/usr/local/nginx/"



declare -A CACHE="${ROOT}cache/"
declare -A BUILD="${ROOT}build/" #/srv

declare -A VERSION=(['luajit']='2.0.4' ['nginx']='1.11.3' ['pcre']='8.39' ['zlib']='1.2.8' ['openssl']='1.0.2f')
# ./configure default settings
declare -A DEFAULT_CONFIGURE_PARAMS="--with-debug "
declare -A DEBUG=true

# Nginx config params
declare NGINX_INSTALL_DEPS
declare NGINX_INSTALL_MODULES
declare NGINX_INSTALL_LIBS
declare NGINX_CONFIGURE
declare NGINX_CONFIGURE_PARAMS



# Default: build params
DEFAULT_CONFIGURE_PARAMS+="--sbin-path=${NGINX_PATH}nginx --conf-path=${NGINX_PATH}nginx.conf --pid-path=${NGINX_PATH}nginx.pid "
DEFAULT_CONFIGURE_PARAMS+="--with-pcre=../pcre --with-zlib=../zlib "
DEFAULT_CONFIGURE_PARAMS+="--with-ipv6 --with-http_realip_module  --with-http_gzip_static_module "

