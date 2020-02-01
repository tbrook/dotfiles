
umask 022
set -o emacs


: "${XBDOTDIR:=${HOME}/.xbsh}"
export XBDOTDIR

[[ -f "$XBDOTDIR/.xbshenv" ]] && . "$XBDOTDIR/.xbshenv"


: "${BADOTDIR:=${HOME}/.bash}"
export BADOTDIR


[[ -f /etc/skel/.bashrc ]] && . /etc/skel/.bashrc


if [[ -d "${XBDOTDIR/rc.d:-}" ]]; then
    for file in $XBDOTDIR/rc.d/*.xbsh
    do
	. $file
    done
fi


if [[ -d "${BADOTDIR/rc.d:-}" ]]; then
    for file in $BADOTDIR/rc.d/*.bash
    do
	. $file
    done
fi



# Local variables:
# mode: shell-script
# End:
