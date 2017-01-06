#!/bin/bash

set -eu
trap log_error ERR

# log functions
LOG_NAME="[dotfiles]"
log_info () { echo -e "\033[33m${LOG_NAME}\033[m $1"; }
log_error () { echo -e "\033[31m${LOG_NAME}\033[m interruped by error"; }

# base directory where this script is located
DIR_DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)"

# URL of homebrew
URL_HOMEBREW=https://raw.githubusercontent.com/Homebrew/install/master/install

# create symlinks
log_info "creating symlinks"

for f in ~/.dotfiles ~/.mackup ~/.mackup.cfg; do
    if [ -f ${f} ]; then
        if [ ! -L ${f} ]; then
            log_info "--> ${f} already exists"
            log_info "--> original one is renamed as ${f}.past"
            mv ${f} ${f}.past
        fi
    fi
done

ln -fhs ${DIR_DOTFILES} ~/.dotfiles
ln -fhs ${DIR_DOTFILES}/home/.mackup ~/.mackup
ln -fhs ${DIR_DOTFILES}/home/.mackup.cfg ~/.mackup.cfg
log_info "--> successfully created"

# install homebrew
log_info "installing homebrew"

if ! type brew >/dev/null 2>&1; then
    /usr/bin/ruby -e "$(curl -fsSL ${URL_HOMEBREW})"
    brew doctor
    log_info "--> successfully installed"
else
    log_info "--> already installed"
fi

# install mackup
log_info "installing mackup"

if ! type mackup >/dev/null 2>&1; then
    brew install mackup
    log_info "--> successfully installed"
else
    log_info "--> already installed"
fi

# execute mackup
log_info "executing mackup"

mackup restore
log_info "--> successfully executed"

# install tools and apps
log_info "installing tools and apps"
${DIR_DOTFILES}/brew/install.sh
${DIR_DOTFILES}/macos/install.sh
${DIR_DOTFILES}/python/install.sh

# successfully finished
log_info "successfully finished"
