#!/bin/bash
# atom/install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.atom]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# check execution
if ! log_prompt "execute installation?"; then
    log_info "--> installation skipped"
    exit 0
fi

# check installation
log_info "checking installation"

if ! type atom >/dev/null 2>&1; then
    log_info "--> atom is not installed"
    log_info "finished with no installation"
    exit 0
else
    log_info "--> OK"
fi

# install packages
log_info "installing atom packages"
apm install --packages-file ${DIR_DOTFILES}/atom/packages.txt

# successfully finished
log_info "successfully finished"
