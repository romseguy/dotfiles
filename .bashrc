# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# LS
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# CUSTOM
set -o ignoreeof

# PATH
## LBIN
export LBIN="$HOME/.local/bin"
export PATH="$LBIN:$PATH"
export LBIN2="$HOME/Desktop/Fonctions/sauvegarder/bin/arch"
export PATH="$LBIN2:$PATH"
## BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ALIASES
alias lvim="$LBIN/lvim"
alias vi=vim

eval "$(starship init bash)"
