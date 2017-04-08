
hist_file="${SOFTWARE_PATH}/var/.zsh_history"

if [[ ! -f "${hist_file}" ]]; then
    hist_file="${HOME}/.zsh_history"
fi

export HISTFILE="${hist_file}"


export HISTSIZE=100000000
export SAVEHIST=100000000


# Local variables:
# mode: shell-script
# End:
