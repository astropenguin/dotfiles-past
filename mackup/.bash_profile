# .bash_profile
# =============


# environment variables
# ---------------------
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color


# load .bashrc
# ------------
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


# pyenv (must be located here!)
# -----------------------------
if type pyenv >/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
