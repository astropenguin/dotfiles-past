#!/bin/bash
# install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# URL of homebrew
URL_HOMEBREW=https://raw.githubusercontent.com/Homebrew/install/master/install

# install homebrew
log_info "installing homebrew"

if ! type brew >/dev/null 2>&1; then
    /usr/bin/ruby -e "$(curl -fsSL ${URL_HOMEBREW})"
    brew doctor
    log_info "--> successfully installed"
else
    log_info "--> already installed"
fi

# install tools and apps
log_info "installing tools and apps"
${DIR_DOTFILES}/homebrew/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/mackup/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/python/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/latex/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/macos/install.sh ${DIR_DOTFILES}

# successfully finished
log_info "successfully finished"
