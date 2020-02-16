
: "${XBDOTDIR:=${HOME}/.xbsh}"
export XBDOTDIR

[[ -f "$XBDOTDIR/.xbshenv" ]] && . "$XBDOTDIR/.xbshenv"


[[ -f "$XBDOTDIR/.xbshprofile" ]] && . "$XBDOTDIR/.xbshprofile"


if has anyenv; then
    eval "$(anyenv init - bash)"
fi


: "${BADOTDIR:=${HOME}/.bash}"
export BADOTDIR


[[ -f ~/.bashrc ]] && . ~/.bashrc



# Local variables:
# mode: shell-script
# End:
