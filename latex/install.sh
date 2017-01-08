#!/bin/bash
# latex/install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.latex]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# update TeX Live package manager
log_info "updating TeX Live package manager"

sudo tlmgr update --self --all
log_info "--> successfully updated"

# setup Hiragino fonts
log_info "setting up Hiragino fonts"

sudo cjk-gs-integrate --link-texmf --force
sudo mktexlsr
sudo kanji-config-updmap-sys hiragino-elcapitan-pron
log_info "--> successfully set up"

# successfully finished
log_info "successfully finished"
