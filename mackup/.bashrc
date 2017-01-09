# .bashrc
# =======


# aliases
# -------
alias ls="ls -FG"
alias ll="ls -FGalsh"
alias reload="source ~/.bash_profile"


# terminal cosmetics
# ------------------
cname=`scutil --get ComputerName`

if [ ${cname} = "Woodstock" ]; then
    character="ﾐ'ﾌ"
elif [ ${cname} = "Snoopy" ]; then
    character='@´\`･)'
fi

cY="\[\e[33m\]"
cB="\[\e[34m\]"
cE="\[\e[m\]"

export PS1="${cY}${character} ${cB}[${cE}\!${cB}]${cE}:\W $ "


# homebrew
# --------

# enhancd
source /usr/local/etc/enhancd/init.sh
export ENHANCD_DISABLE_HOME=1
export ENHANCD_DOT_ARG="../"
export ENHANCD_FILTER=fzf

# rmsafe
alias rm="rmsafe"


# Python
# ------

# Anaconda
alias conda-activate="source ~/.pyenv/versions/miniconda3-latest/bin/activate"
alias conda-deactivate="source ~/.pyenv/versions/miniconda3-latest/bin/deactivate"
