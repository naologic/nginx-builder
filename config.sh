#!/bin/bash


# SCRIPT_PATH:: path to current script; VERY important
#declare SCRIPT_PATH=$(eval echo ~${SUDO_USER})"/nginx-builder/"
declare SCRIPT_PATH=$PWD/

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

declare -A VERSION=(['luajit']='2.0.4' ['nginx']='1.11.8' ['pcre']='8.40' ['zlib']='1.2.11' ['openssl']='1.1.0c')
# ./configure default settings
#declare -A DEFAULT_CONFIGURE_PARAMS="--with-debug "
declare -A DEFAULT_CONFIGURE_PARAMS=" "
declare -A DEBUG=true

# Nginx config params
declare NGINX_INSTALL_DEPS
declare NGINX_INSTALL_MODULES
declare NGINX_LUA_MODULES
declare NGINX_CONFIGURE
declare NGINX_CONFIGURE_PARAMS

declare DISTRO_VERSION=$(lsb_release -sr)


# Default: build params
DEFAULT_CONFIGURE_PARAMS+="--prefix=${NGINX_PATH} --sbin-path=sbin/nginx --conf-path=nginx.conf --pid-path=logs/nginx.pid --user=www-data "
DEFAULT_CONFIGURE_PARAMS+="--with-pcre=../pcre --with-zlib=../zlib "
DEFAULT_CONFIGURE_PARAMS+="--with-http_realip_module  --with-http_gzip_static_module --with-stream "
DEFAULT_CONFIGURE_PARAMS+="--with-stream_ssl_preread_module --with-compat "
DEFAULT_CONFIGURE_PARAMS+="--with-file-aio --with-threads --with-http_addition_module --with-http_auth_request_module "
DEFAULT_CONFIGURE_PARAMS+="--with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_random_index_module "
DEFAULT_CONFIGURE_PARAMS+="--with-http_secure_link_module --with-http_slice_module --with-http_ssl_module --with-http_stub_status_module "
DEFAULT_CONFIGURE_PARAMS+="--with-http_sub_module --with-http_v2_module --with-mail --with-mail_ssl_module "
DEFAULT_CONFIGURE_PARAMS+="--with-stream_realip_module --with-stream_ssl_module "

