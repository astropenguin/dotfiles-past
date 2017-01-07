#!/bin/bash

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.macos]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

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
