#!/bin/bash
# mackup/install.sh

set -eu
trap log_error ERR
export PYTHONUNBUFFERED=1

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.mackup]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# check installation
log_info "checking installation"

if ! type mackup >/dev/null 2>&1; then
    log_info "--> Mackup is not installed"
    log_info "finished with no installation"
    exit 0
else
    log_info "--> OK"
fi

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
ln -fhs ${DIR_DOTFILES}/mackup/.mackup ~/.mackup
ln -fhs ${DIR_DOTFILES}/mackup/.mackup.cfg ~/.mackup.cfg
log_info "--> successfully created"

# execute mackup
log_info "executing mackup"

mackup restore
log_info "--> successfully executed"

# successfully finished
log_info "successfully finished"
