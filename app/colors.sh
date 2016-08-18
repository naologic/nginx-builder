
function run_name() {
  echo -e "\e[1;39m[   \e[1;42mRunning\e[49m   ] ${1}\e[0;39m"
}
function run_ok() {
  echo -e "\e[1;39m[   \e[1;32mOK\e[39m   ] ${1}\e[0;39m"
}
function run_error() {
  echo -e "\e[1;39m[   \e[31mError\e[39m   ] ${1}\e[0;39m"
}
function run_install() {
  echo -e "\e[1;39m[   \e[1;46mInstalling\e[49m   ] ${1}\e[0;39m"
}
function run_compile() {
  echo -e "\e[1;39m[   \e[1;46mCompiling\e[49m   ] ${1}\e[0;39m"
}
function run_download() {
  echo -e "\e[1;39m[   \e[1;46mDownloading\e[49m   ] ${1}\e[0;39m"
}
function run_unpack() {
  echo -e "\e[1;39m[   \e[1;46mUnpacking\e[49m   ] ${1}\e[0;39m"
}
function run_testing() {
  echo -e "\e[1;39m[   \e[1;93mCheck\e[39m   ] ${1}\e[0;39m"
}
function show_option() {
  echo -e "\e[1;39m[   \e[1;46m${1}\e[49m   ] ${2}\e[0;39m"
}
function show_title() {
  echo -e "\e[1;39m----------------------------\e[0;39m"
  echo -e "\e[1;39m\e[1;32m${1}\e[49m \e[0;39m"
  echo -e "\e[1;39m----------------------------\e[0;39m"
}

function show_blue() {
  echo -e "\e[1;49m[   \e[1;44m${1}\e[49m   ] ${2}\e[49m"
}
function show_red() {
  echo -e "\e[1;39m[   \e[31m${1}\e[39m   ] ${2}\e[0;39m"
}
function show_blue_bg() {
  echo -e "\e[1;39m[   \e[1;46m${1}\e[49m   ] ${2}\e[0;39m"
}
function show_yellow() {
  echo -e "\e[1;39m[   \e[1;93m${1}\e[39m   ] ${2}\e[0;39m"
}
function show_green() {
  echo -e "\e[1;39m[   \e[1;32m${1}\e[39m   ] ${2}\e[0;39m"
}
