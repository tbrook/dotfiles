
DOTPATH="/vagrant/src/dotfiles"

: "${DOTPATH:=${HOME}/.dotfiles}"
export DOTPATH


if [[ ! -d "${SOFTWARE_PATH:=${HOME}/software-space}" ]]; then
    SOFTWARE_PATH="${HOME}"
fi

export SOFTWARE_PATH


: "${BADOTDIR:=${HOME}/.bash}"
export BADOTDIR



xbsh_profile="$HOME/.xbsh/.xbshprofile"

if [[ -f $xbsh_profile ]]; then
    . $xbsh_profile
else
    echo "'$xbsh_profile' is not exist." 1>&2
fi


[[ -f ~/.bashrc ]] && . ~/.bashrc



# Local variables:
# mode: shell-script
# End:
