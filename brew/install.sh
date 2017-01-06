#!/bin/bash

set -eu
trap log_error ERR

# log functions
LOG_NAME="[dotfiles.brew]"
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
DIR_BREW="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"

# install formulae, casks, apps with homebrew bundle
log_info "installing formulae, casks, apps"

if log_prompt "execute full installation?"; then
    log_info "--> executing full installation (basic + extra)"
    brew bundle --file=${DIR_BREW}/brewfile_basic --no-upgrade
    brew bundle --file=${DIR_BREW}/brewfile_extra --no-upgrade
else
    log_info "--> executing minimal installation (basic only)"
    brew bundle --file=${DIR_BREW}/brewfile_basic --no-upgrade
fi

# successfully finished
log_info "successfully finished"
