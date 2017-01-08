#!/bin/bash
# homebrew/install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.brew]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# check installation
log_info "checking installation"

if ! type brew >/dev/null 2>&1; then
    log_info "--> Homebrew is not installed"
    log_info "finished with no installation"
    exit 0
else
    log_info "--> OK"
fi

# install formulae, casks, apps with homebrew bundle
log_info "installing formulae, casks, apps"

if log_prompt "execute full installation?"; then
    log_info "--> executing full installation (basic + extra)"
    brew bundle --file=${DIR_DOTFILES}/homebrew/brewfile_basic --no-upgrade
    brew bundle --file=${DIR_DOTFILES}/homebrew/brewfile_extra --no-upgrade
else
    log_info "--> executing minimal installation (basic only)"
    brew bundle --file=${DIR_DOTFILES}/homebrew/brewfile_basic --no-upgrade
fi

# successfully finished
log_info "successfully finished"
