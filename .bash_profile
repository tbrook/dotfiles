
: "${XBDOTDIR:=${HOME}/.xbsh}"
export XBDOTDIR

[[ -f "$XBDOTDIR/.xbshenv" ]] && . "$XBDOTDIR/.xbshenv"


: "${BADOTDIR:=${HOME}/.bash}"
export BADOTDIR


source_f "$XBDOTDIR/.xbshprofile"


source_f ~/.bashrc



# Local variables:
# mode: shell-script
# End:
