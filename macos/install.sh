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

for d in ~/[A-Z]*; do
    if [ -f ${d}/.localized ]; then
        log_info "--> removing ${d}/.localized"
        rm ${d}/.localized
    else
        log_info "--> ${d}/.localized already removed"
    fi
done

log_info "--> successfully removed"

# hide unused directories in home
log_info "hiding unused directories in home"

for d in "Movies" "Music" "Pictures" "Public"; do
    if [ -d ~/${d} ]; then
        log_info "--> hiding ${HOME}/${d}"
        chflags hidden ~/${d}
    else
        log_info "--> ${HOME}/${d} is not found"
    fi
done

log_info "--> successfully hidden"

# successfully finished
log_info "successfully finished"
