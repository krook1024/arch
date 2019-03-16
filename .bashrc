#!/bin/bash
HISTSIZE= HISTFILESIZE= # Infinite history.
export PS1="\[\e[34m\]\W\[\e[m\] \[\e[32m\]➜\[\e[m\] "
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
