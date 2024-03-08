#!/bin/bash
stty erase ^H

red='\e[91m'
green='\e[92m'
yellow='\e[94m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'
_red() { echo -e ${red}$*${none}; }
_green() { echo -e ${green}$*${none}; }
_yellow() { echo -e ${yellow}$*${none}; }
_magenta() { echo -e ${magenta}$*${none}; }
_cyan() { echo -e ${cyan}$*${none}; }

# Root
[[ $(id -u) != 0 ]] && echo -e "\n 请使用 ${red}root ${none}用户运行 ${yellow}~(^_^) ${none}\n" && exit 1
cmd="apt-get"
sys_bit=$(uname -m)
case $sys_bit in
'amd64' | x86_64) ;;
*)
    echo -e " 
	 这个安装脚本仅支持 Ubuntu 16+ / Debian 8+ / CentOS 7+ 
	" && exit 1
    ;;
esac
if [[ $(command -v apt-get) || $(command -v yum) ]] && [[ $(command -v systemctl) ]]; then
    if [[ $(command -v yum) ]]; then
        cmd="yum"
    fi
else
    echo -e " 
	 这个安装脚本仅支持 Ubuntu 16+ / Debian 8+ / CentOS 7+ 
	" && exit 1
fi