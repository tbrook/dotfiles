
setopt auto_cd
setopt auto_pushd

setopt list_packed

setopt correct

setopt nolistbeep

# no remove postfix slash of command line
setopt noautoremoveslash


autoload -Uz colors
colors


autoload -Uz bashcompinit
bashcompinit


zstyle ':completion:*' list-colors ''


if [ -x /usr/bin/dircolors ]; then
    # dircolors -p > ~/.dircolors
    # modified ~/.dircolors, add screen.mlterm
    [[ -r ~/.dircolors ]] && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi



# Local variables:
# mode: shell-script
# End:
