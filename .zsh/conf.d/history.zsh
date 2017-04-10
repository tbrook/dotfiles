
hist_file="${SOFTWARE_PATH}/var/.zsh_history"

if [[ ! -f "${hist_file}" ]]; then
    hist_file="${HOME}/.zsh_history"
fi

export HISTFILE="${hist_file}"


export HISTSIZE=100000000
export SAVEHIST=100000000


setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


# http://news.mynavi.jp/column/zsh/004/
# http://mollifier.hatenablog.com/entry/20090318/1237302243
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end



# Local variables:
# mode: shell-script
# End:
