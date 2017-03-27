
umask 022
bindkey -e


if [[ -e "${ZPLUG_HOME:-}" ]]; then
    if [[ -f "${ZPLUG_LOADFILE:=${ZDOTDIR}/zplug.zsh}" ]]; then
	export ZPLUG_LOADFILE
    else
	unset ZPLUG_LOADFILE
    fi

    source "$ZPLUG_HOME/init.zsh"

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
        echo
    fi

    zplug load --verbose
fi
