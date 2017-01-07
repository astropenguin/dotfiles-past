#!/bin/bash
# brew/install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.brew]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# install formulae, casks, apps with homebrew bundle
log_info "installing formulae, casks, apps"

if log_prompt "execute full installation?"; then
    log_info "--> executing full installation (basic + extra)"
    brew bundle --file=${DIR_DOTFILES}/brew/brewfile_basic --no-upgrade
    brew bundle --file=${DIR_DOTFILES}/brew/brewfile_extra --no-upgrade
else
    log_info "--> executing minimal installation (basic only)"
    brew bundle --file=${DIR_DOTFILES}/brew/brewfile_basic --no-upgrade
fi

# successfully finished
log_info "successfully finished"
