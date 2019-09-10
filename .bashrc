#!/bin/bash
HISTSIZE= HISTFILESIZE= # Infinite history.
export HISTCONTROL=ignoredups
export PS1="\[\e[33m\]\W\[\e[m\] \[\e[32m\]➜\[\e[m\] "
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
# added by travis gem
[ -f /home/b1/.travis/travis.sh ] && source /home/b1/.travis/travis.sh

source /usr/share/nvm/init-nvm.sh
