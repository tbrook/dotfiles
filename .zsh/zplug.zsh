
zplug "zplug/zplug"

zplug "$ZDOTDIR/conf.d", from:local

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-syntax-highlighting", defer:2

zplug "zsh-users/zsh-autosuggestions"

zplug "peco/peco", \
as:command, \
from:gh-r, \
frozen:1







