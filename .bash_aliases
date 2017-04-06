
# -*- mode: Shell-script -*-

alias a='alias'


if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -la'
alias la='ls -a'
alias lsa='ls -la | less'
alias lsm='ls -la | more'


alias eng='LANG=C LANGUAGE=C LC_ALL=C'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias his='history'

alias latest='ls -ltr |tail -15'

alias g=git

alias be='bundle exec'

alias iu2e='iconv -f utf-8 -t euc-jp'

alias ag='ag --pager="less -R" -S'
