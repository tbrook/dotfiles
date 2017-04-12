
: "${XBDOTDIR:=${HOME}/.xbsh}"
export XBDOTDIR


[[ -f "$XBDOTDIR/.xbshenv" ]] && . "$XBDOTDIR/.xbshenv"


: "${ZDOTDIR:=${HOME}/.zsh}"
export ZDOTDIR


: "${ZPLUG_HOME:=${HOME}/.zplug}"
export ZPLUG_HOME
