
umask 022
set -o emacs


: "${DOTPATH:=${HOME}/.dotfiles}"
export DOTPATH


if [[ ! -d "${SOFTWARE_PATH:=${HOME}/software-space}" ]]; then
    SOFTWARE_PATH="${HOME}"
fi

export SOFTWARE_PATH


: "${BADOTDIR:=${HOME}/.bash}"
export BADOTDIR


[[ -f /etc/skel/.bashrc ]] && . /etc/skel/.bashrc


if [[ -d "${BADOTDIR/rc.d:-}" ]]; then
    for file in $BADOTDIR/rc.d/*.bash
    do
	. $file
    done
fi



# Local variables:
# mode: shell-script
# End:
