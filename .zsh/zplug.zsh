
zplug "zplug/zplug"


if [[ -d "${XBDOTDIR}/rc.d" ]]; then
    zplug "${XBDOTDIR}/rc.d", from:local, use:"*.xbsh"
fi


if [[ -d "${ZDOTDIR}/rc.d" ]]; then
    zplug "${ZDOTDIR}/rc.d", from:local, use:"*.zsh"
fi



zplug "zsh-users/zsh-completions"


zplug "zsh-users/zsh-autosuggestions", defer:3


zplug "zsh-users/zsh-syntax-highlighting", defer:2


zplug "peco/peco", \
as:command, \
from:gh-r, \
frozen:1
