#!/bin/bash
# python/install.sh

set -eu
trap log_error ERR

# base directory
DIR_DOTFILES=${1}

# log functions
LOG_NAME="[dotfiles.python]"
source ${DIR_DOTFILES}/installer/func.sh ${LOG_NAME}

# check execution
if ! log_prompt "execute installation?"; then
    log_info "--> installation skipped"
    exit 0
fi

# check installation
log_info "checking installation"

if ! type pyenv >/dev/null 2>&1; then
    log_info "--> pyenv is not installed"
    log_info "finished with no installation"
    exit 0
else
    log_info "--> OK"
fi

# install conda from miniconda3
log_info "installing conda from miniconda3"

eval "$(pyenv init -)"

if ! pyenv versions | grep miniconda3-latest >/dev/null 2>&1; then
    pyenv install miniconda3-latest
    log_info "--> successfully installed"
else
    log_info "--> already installed"
fi

pyenv global miniconda3-latest

# install Python 2.7
log_info "installing Python 2.7"

if ! pyenv versions | grep python2-default >/dev/null 2>&1; then
    conda create -n python2-default anaconda python=2.7
    log_info "--> successfully installed"
else
    log_info "--> already installed"
fi

# install Python 3.5
log_info "installing Python 3.5"

if ! pyenv versions | grep python3-default >/dev/null 2>&1; then
    conda create -n python3-default anaconda python=3.5
    log_info "--> successfully installed"
else
    log_info "--> already installed"

fi

pyenv global miniconda3-latest/envs/python3-default

# successfully finished
log_info "successfully finished"
