#!/bin/bash

. app/colors.sh


# run as root only
if [[ $EUID -ne 0 ]] ; then
    run_error "This script must be run with root access"
    exit 1
fi
if [ -z ${ROOT+x} ];  then show_red "Error" "ROOT system variable is not set! Check config.sh";  exit 1; fi
if [ -z ${CACHE+x} ]; then show_red "Error" "CACHE system variable is not set! Check config.sh"; exit 1; fi
if [ -z ${BUILD+x} ]; then show_red "Error" "BUILD system variable is not set! Check config.sh"; exit 1; fi


function download_nginx_module() { # OK
  [ $# -eq 0 ] && { run_error "Usage: install_nginx_module <module>"; exit; }  
  local WORKDIR="${CACHE}nginx_modules/"
  local MODULE=${1}
  
  [ -d "$WORKDIR" ] || mkdir -p $WORKDIR
  cd ${WORKDIR}

  if [ ${NGINX_MODULES[${MODULE}]} ] ; then
    show_blue_bg "Download" "${MODULE}"
    
    if [ -s "${MODULE}.zip" ] ; then
      show_yellow "Cache" "found ${MODULE}.zip. Using from cache" 
      else 
        wget -q --no-check-certificate ${NGINX_MODULES[${MODULE}]} -O "${MODULE}.zip"
    fi
    if [ -s "${MODULE}.zip" ] ; then
      run_ok
    else 
      run_error "Could not fetch ${MODULE}.zip from ${NGINX_MODULES[${MODULE}]}"
    fi
  else 
    run_error "${MODULE} module does not have a download route. Add in lib/nginx_modules.sh or remove ${MODULE} from NGINX_INSTALL_MODULES"
  fi
}
function configure_nginx_module() {
  # get them from cache and put them in work
  [ $# -eq 0 ] && { run_error "Usage: configure_nginx_module <module_name>"; exit; }  
  local WORKDIR="${ROOT}nginx_modules/"
  local CACHEDIR="${CACHE}nginx_modules/"  
  local MODULE=${1}
  
  rm -rf ${WORKDIR}${MODULE}
  [ -d "$WORKDIR${MODULE}" ] || mkdir -p ${WORKDIR}${MODULE}
  [ -d "${CACHEDIR}${MODULE}.zip" ] || download_nginx_module ${MODULE}
  
  show_blue_bg "Unpack" "${MODULE}"

  cd ${WORKDIR}
  unzip -q -o "${CACHEDIR}${MODULE}.zip" -d ${WORKDIR}${MODULE}
  local ROOT_NAME=`find ${MODULE}/* | head -1`
  
  if [ -z ${ROOT_NAME+x} ]; then 
      show_red "Error" "${MODULE} root name is not a dir. Check ${CACHEDIR}${MODULE}.zip"; exit 1; 
    else
      cp -RP ${WORKDIR}${ROOT_NAME}/* ${WORKDIR}${MODULE}
      rm -rf ${WORKDIR}${ROOT_NAME}
      run_ok
  fi
}
function configure_lua_modules() {
  # get them from cache and put them in work
  [ $# -eq 0 ] && { run_error "Usage: configure_lua_modules <module_name>"; exit; }  
  local WORKDIR="${ROOT}nginx_lua_dynamic_modules/"
  local CACHEDIR="${CACHE}nginx_modules/"
  local MODULE=${1}
  
  rm -rf ${WORKDIR}${MODULE} && mkdir -p ${WORKDIR}${MODULE}
  [ -d "${CACHEDIR}${MODULE}.zip" ] || download_nginx_module ${MODULE}
  
  show_blue_bg "Unpack" "${MODULE}"

  cd ${WORKDIR}
  unzip -q -o "${CACHEDIR}${MODULE}.zip" -d ${WORKDIR}${MODULE}
  local ROOT_NAME=`find ${MODULE}/* | head -1`
  
  if [ -z ${ROOT_NAME+x} ]; then 
      show_red "Error" "${MODULE} root name is not a dir. Check ${CACHEDIR}${MODULE}.zip"; exit 1; 
    else
      cp -RP ${WORKDIR}${ROOT_NAME}/* ${WORKDIR}${MODULE}
      rm -rf ${WORKDIR}${ROOT_NAME}
      run_ok
  fi
}

## not tested
## not tested
## not tested
## not tested
function configure_nginx_patches() {
  [ $# -eq 0 ] && { run_error "Usage: configure_nginx_patches <module_name>"; exit; }  
  local WORKDIR="${ROOT}nginx_patches/"
  local MODULE=${1}
  
  [ -d "$WORKDIR${MODULE}" ] || mkdir -p $WORKDIR${MODULE}
  cd ${WORKDIR}

    for file in ${WORKDIR}/* ; do
        run_compile "applying patch $(basename $file)"
        patch -p1 < $file
    done

  run_ok
}

function make_nginx() {
  [ $# -eq 0 ] && { run_error "Usage: make_nginx <default_configuration_params>"; exit; } 

  # Set: vars
  local MAIN_DIR="nginx"
  local WORKDIR="${BUILD}${MAIN_DIR}/"  
  local MODULES="${ROOT}nginx_modules/"
  local FILENAME="nginx-${1}.tar.gz"
  local CONFIGURE_PARAMS=""
  local DEFAULT_PARAMS=${2}
  local MODULE_PARAMS=""

  # clean
  rm -rf ${WORKDIR} && mkdir -p ${WORKDIR}
  # copy fresh nginx source
  cp -PR ${CACHE}${MAIN_DIR} ${BUILD}

  if [ -f "${WORKDIR}configure" ] ; then
      show_green "Found nginx"
    else
      run_error "Cannot find nginx source code in ${WORKDIR}"
      exit 1
  fi 
  cd ${WORKDIR}

  # ./configure all modules 
  for file in ${MODULES}* ; do
      if [ -d "$file" ]
      then
          if [ -f "$file/config" ] ; then 
              local MODULE=$(basename $file)
              # Check: if module has extra things to run and run it(ex: pagespeed)
              # SH: takes 1 param:: path to install to
              if [ -f ${SCRIPT_PATH}app/module_deps/${MODULE}-install.sh ]; then
                  chmod u+x ${SCRIPT_PATH}app/module_deps/${MODULE}-install.sh
                  . ${SCRIPT_PATH}app/module_deps/${MODULE}-install.sh $file/
              fi  
              # Set configure parameters
              CONFIGURE_PARAMS="${CONFIGURE_PARAMS} --add-module=${MODULES}${MODULE}"
              MODULE_PARAMS=""
              else
                  show_red "Error" "${MODULE} is not a nginx compilable module. Maybe just a script?"
          fi
      fi 
    done

  cd ${WORKDIR}
  # make && make install
  ./configure ${DEFAULT_PARAMS}${CONFIGURE_PARAMS}
  make && make install

  run_ok "END"
}

function post_install_nginx() {
    [ $# -eq 0 ] && { run_error "Usage: post_install_nginx <destination>"; exit; } 
    local NGINX=${1}
    local CPUS=$(grep ^processor /proc/cpuinfo | wc -l)

    # Set main nginx config file 
    mkdir -p ${NGINX}sites-enabled/
    mkdir -p ${NGINX}sites-available/
    mkdir -p ${NGINX}conf.d/
    mkdir -p ${NGINX}lua_modules/
    mkdir -p /var/log/nginx #logs

    # Copy lua modules
    rm -rf ${NGINX}lua_modules/* && mkdir -p ${NGINX}lua_modules/
    cp -Rf ${ROOT}nginx_lua_dynamic_modules/* ${NGINX}lua_modules/

    # Copy main config file
    cp -f ${SCRIPT_PATH}config/nginx/* ${NGINX}
    chmod +x ${NGINX}nginx.conf
      # Paths
      sed -i -e "s|\$NGINX_PATH|${NGINX_PATH}|g" ${NGINX}nginx.conf
      # Cores
      sed -i -e "s|\$CPUS|${CPUS}|g" ${NGINX}nginx.conf
      
    
    # Set: a default site
    cp -f ${SCRIPT_PATH}config/nginx/site.conf ${NGINX}sites-enabled/site.conf
    chmod +x ${NGINX}sites-enabled/site.conf
      sed -i -e "s|\$server_name|${NGINX_SERVER_URL}|g" ${NGINX}sites-enabled/site.conf
      sed -i -e "s|\$server_port|${NGINX_SERVER_PORT}|g" ${NGINX}sites-enabled/site.conf
      
    # Set: init file
    cp -f ${SCRIPT_PATH}config/nginx/nginx /etc/init.d/nginx
    chmod +x /etc/init.d/nginx
      # Paths 
        sed -i -e "s|\$REPLACE_NGINX_PATH|${NGINX_PATH}|g" /etc/init.d/nginx
        sed -i -e "s|\$REPLACE_NGINX_USE_PATH|${NGINX_USE_PATH}|g" /etc/init.d/nginx

    if [ $DISTRO_VERSION = "16.04" ] || [ $DISTRO_VERSION = "16.10" ] ; then 
        mkdir -p /usr/lib/systemd/system/
        # Service file for nginx
          cp -f ${SCRIPT_PATH}config/nginx/nginx.service /lib/systemd/system/
          sed -i -e "s|\$NGINX_PATH|${NGINX_PATH}|g" /lib/systemd/system/nginx.service 
        # Restart ctl daemon
         systemctl daemon-reload
    fi
    # if [ $DISTRO_VERSION -eq "15.04" ] || [ $DISTRO_VERSION -eq "15.10" ] ; then

    # fi
    # if [ $DISTRO_VERSION -eq "14.04" ] || [ $DISTRO_VERSION -eq "14.10" ] ; then

    # fi
    
      
    # Install modules (the ones that don't install via include) 
    # TODO:: install lua modules (if needed)

    # Set init.d service
    # TODO:: auto start


    chmod u+x /etc/init.d/nginx
}

function create_installed_file() {
    # Create a config map with all the modules, so I know what's what
    # file start
    printf "# Nginx Build #${NGINX_VERSION_NO}\n\n" > ${NGINX_USE_PATH}INSTALLED.md
    printf "### libraries installed from source\n\n" > ${NGINX_USE_PATH}INSTALLED.md
    # versions
    local VS="";
    for i in "${!VERSION[@]}"
      do
        VS="${VS}$i ${VERSION[$i]}, "
    done
    printf "${VS}" >> ${NGINX_USE_PATH}INSTALLED.md
    # modules installed
    printf "### nginx modules compiled \n\n" >> ${NGINX_USE_PATH}INSTALLED.md
      for i in "${!NGINX_INSTALL_MODULES[@]}"
      do
        printf ${NGINX_INSTALL_MODULES[$i]}':: '${NGINX_MODULES[${NGINX_INSTALL_MODULES[$i]}]}'\n' >> ${NGINX_USE_PATH}INSTALLED.md
    done
    printf "\n\n">> ${NGINX_USE_PATH}INSTALLED.md
    
    # other text? credits
    cat ${SCRIPT_PATH}credits.txt >> ${NGINX_USE_PATH}INSTALLED.md
}

function clean() {
  rm -Rf "${ROOT}brotli"
  rm -Rf "${ROOT}luajit"
  rm -Rf "${ROOT}nginx"
  rm -Rf "${ROOT}nginx_modules"
  rm -Rf "${ROOT}nginx.tar.gz"
  rm -Rf "${NGINX_PATH}"
  rm -Rf "${NGINX_USE_PATH}"

}
