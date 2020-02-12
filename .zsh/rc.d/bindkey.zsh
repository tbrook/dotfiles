
bindkey -e


bindkey -M emacs "^[[A" history-incremental-search-backward
bindkey -M emacs "^[[B" history-incremental-search-forward
bindkey -M emacs "^[[C" forward-word
bindkey -M emacs "^[[D" backward-word

bindkey -M emacs "^[[1;5C" forward-word
bindkey -M emacs "^[[1;5D" backward-word


# Local variables:
# mode: shell-script
# End:
