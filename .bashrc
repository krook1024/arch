#!/bin/bash
HISTSIZE= HISTFILESIZE= # Infinite history.

export PS1="\[\e[35m\]\W\[\e[m\] \[\e[36m\]λ\[\e[m\] "
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" # Load shortcut aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
