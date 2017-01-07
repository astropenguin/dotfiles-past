#!/bin/bash
# install.sh

set -eu
trap log_error ERR
export PYTHONUNBUFFERED=1

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

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
${DIR_DOTFILES}/brew/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/latex/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/macos/install.sh ${DIR_DOTFILES}
${DIR_DOTFILES}/python/install.sh ${DIR_DOTFILES}

# successfully finished
log_info "successfully finished"
