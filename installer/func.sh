#!/bin/bash
# functions.sh

LOG_NAME=${1}

log_info () {
    echo -e "\033[33m${LOG_NAME}\033[m ${1}"
}

log_error () {
    echo -e "\033[31m${LOG_NAME}\033[m interruped by error"
}

log_prompt () {
    while true; do
        echo -ne "\033[33m${LOG_NAME}\033[m ${1} [y/n] " 
        read answer
        case ${answer} in
            [yY]* ) echo "y" && return 0;;
            ""    ) continue;;
            *     ) echo "n" && return 1;;
        esac
    done
}
