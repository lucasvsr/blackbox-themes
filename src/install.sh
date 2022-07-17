#!/bin/sh

DIR="$HOME/.blackbox-theme-temp"
BIN="blackbox-theme"
URL="https://raw.githubusercontent.com/lucasvsr/blackbox-themes/main/src/blackbox-theme"

# Regular Colors
Black='\033[0;30m'  # Black
Red='\033[0;31m'    # Red
Green='\033[0;32m'  # Green
Yellow='\033[0;33m' # Yellow
Blue='\033[0;34m'   # Blue
Purple='\033[0;35m' # Purple
Cyan='\033[0;36m'   # Cyan
White='\033[0;37m'  # White

Color_off='\033[0m' # Text Reset

BGreen='\033[1;32m'  # Green

BIRed='\033[1;91m'    # Red

msg() {
    printf '%b\n' "$1" >&2
}

success() {
    msg "${Green}✔ ${Color_off} ${1}${2}"
}

info() {
    msg "${Blue}➭ ${Color_off} ${1}${2}"
}

error() {
    msg "${Red}✘ ${Color_off} ${1}${2}" && return 1
}

warn() {
    msg "${Yellow}⚠ ${Color_off} ${1}${2}"
}

download() {

    local url=$URL
    local dest=$DIR

    mkdir -p $dest

    info "Installing blackbox-theme"

    wget -nv -q $url -O $dest/"$BIN" &&
    success "${BGreen}blackbox-theme ${Color_off}downloaded" || error "Was not possible download blackbox-theme"

}

has_app() {

  command -v "$@" >/dev/null 2>&1

}

mkexec() {

    chmod 777 $1

}

cp_usr_bin() {

    sudo mv $1 /usr/bin/ && rm -rf $(dirname $1)

}

check() {

    if ! has_app "$1" 
    then

        warn "${BIRed}Please, install $1!" && return 1
        
    fi

}

main() {

    local pwd=$(pwd)

    check "wget" &&
    download &&
    mkexec "$DIR/$BIN" &&
    warn "We need sudo permission to continue..."
    cp_usr_bin "$DIR/$BIN" &&
    rm -rf $pwd/install.sh &&
    success "blackbox-themes installed"
    
}

main

