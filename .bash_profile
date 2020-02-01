
: "${XBDOTDIR:=${HOME}/.xbsh}"
export XBDOTDIR

[[ -f "$XBDOTDIR/.xbshenv" ]] && . "$XBDOTDIR/.xbshenv"


[[ -f "$XBDOTDIR/.xbshprofile" ]] && . "$XBDOTDIR/.xbshprofile"


: "${BADOTDIR:=${HOME}/.bash}"
export BADOTDIR


[[ -f ~/.bashrc ]] && . ~/.bashrc



# Local variables:
# mode: shell-script
# End:
