
hist_file="${SOFTWARE_PATH}/var/.bash_history"

if [[ ! -f "${hist_file}" ]]; then
    hist_file="${HOME}/.bash_history"
fi

export HISTFILE="${hist_file}"


export HISTSIZE=100000000
export HISTFILESIZE=100000000



# Local variables:
# mode: shell-script
# End:
