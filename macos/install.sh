#!/bin/bash
# macos/install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.macos]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# remove localization files
log_info "removing localization files"
log_info "hide unused directories in home"
chflags hidden ~/Applications
chflags hidden ~/Movies
chflags hidden ~/Music
chflags hidden ~/Pictures
chflags hidden ~/Public
for d in ~/[A-Z]*; do
    if [ -f ${d}/.localized ]; then
        log_info "--> removing ${d}/.localized"
        rm ${d}/.localized
    else
        log_info "--> ${d}/.localized already removed"
    fi
done

log_info "--> successfully removed"


# successfully finished
log_info "successfully finished"
