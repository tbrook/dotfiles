
: "${DOTPATH:=${HOME}/.dotfiles}"
export DOTPATH


if [[ ! -d "${SOFTWARE_PATH:=${HOME}/software-space}" ]]; then
    SOFTWARE_PATH="${HOME}"
fi

export SOFTWARE_PATH


: "${ZDOTDIR:=${HOME}/.zsh}"
export ZDOTDIR


: "${ZPLUG_HOME:=${HOME}/.zplug}"
export ZPLUG_HOME
