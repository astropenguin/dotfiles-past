#!/bin/bash

set -eu
trap log_error ERR

# log functions
LOG_NAME="[dotfiles.macos]"
log_info () { echo -e "\033[33m${LOG_NAME}\033[m $1"; }
log_error () { echo -e "\033[31m${LOG_NAME}\033[m interruped by error"; }
log_prompt () {
    while true; do
        echo -ne "\033[33m${LOG_NAME}\033[m ${1} [y/n] "
        read answer
        case ${answer} in
            [yY]* ) echo "y" && return 0;;
            ""    ) continue;;
            *     ) echo "n" && return 1;;
        esac
    done
}

# base directory where this script is located
DIR_MACOS="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"

log_info "removing localization files"
rm -f ~/Applications/.localized
rm -f ~/Desktop/.localized
rm -f ~/Documents/.localized
rm -f ~/Downloads/.localized
rm -f ~/Movies/.localized
rm -f ~/Music/.localized
rm -f ~/Pictures/.localized
rm -f ~/Public/.localized

log_info "hide unused directories in home"
chflags hidden ~/Applications
chflags hidden ~/Movies
chflags hidden ~/Music
chflags hidden ~/Pictures
chflags hidden ~/Public

# successfully finished
log_info "successfully finished"
