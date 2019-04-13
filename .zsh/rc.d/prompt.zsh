

# 
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors

# PROMPT変数内で変数参照する
setopt prompt_subst


declare -Ag TBROOK_PROMPT_VCS_MARK_BG_COLOR

TBROOK_PROMPT_VCS_MARK_BG_COLOR['+']='red'
TBROOK_PROMPT_VCS_MARK_BG_COLOR['-']='green'
TBROOK_PROMPT_VCS_MARK_BG_COLOR['?']='cyan'
TBROOK_PROMPT_VCS_MARK_BG_COLOR['S']='yellow'



function __tbrook::prompt::str::first_line_mark() {
    printf "\e[38;5;8m:\e[0m"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::shell_name() {
#    echo -n "%{\e[38;5;8m%}-zsh%{\e[0m%}ee"
    printf "\e[38;5;8m-zsh\e[0m"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::shell_level() {
    printf "\e[38;5;8mSHLVL:$(echo $SHLVL)\e[0m"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::current_dir() {
#    echo -n "\e[33;1m%1~\e[0m"
    echo -n "%F{yellow}%B%1~%b%f"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::network_info() {
    printf "\e[38;5;8m[\e[0m"

    # user
    echo -n "%F{magenta}%n%f"

    printf "\e[38;5;8m@\e[0m"


    if [[ -n "${SSH_CONNECTION}" ]]; then
	local ary=(`echo $SSH_CONNECTION`)
	echo -n "%F{yellow}${ary[3]}%f"
    fi

    printf "\e[38;5;8m:\e[0m"

    # host
    echo -n "%F{green}%m%f"

    printf "\e[38;5;8m:\e[0m"

    # tty
    echo -n "%F{blue}%l%f"

    printf "\e[38;5;8m]\e[0m"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::time() {
    echo -n "%F{cyan}%D{%Y-%m-%d} %*%f"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::return_code() {
    if [[ -n "$1" ]]; then
	echo -n "%(?..%F{red}%B%?%b%f )"
    else
	echo -n "%(?..%F{red}%B%?%b%f)"
    fi
}


function __tbrook::prompt::str::command_line_mark() {
    echo -n "%F{cyan}%B%(!.#.$)%b%f"

    if [[ -n "$1" ]]; then
	printf ' '
    fi
}


function __tbrook::prompt::str::vcs_info() {
    local prompt=""

    if [[ -n "$vcs_info_msg_0_" ]]; then
	prompt+="[%F{green}%B${vcs_info_msg_0_#*\-}%b%f]"
    fi


    # echo '-' は 空白が表示されるので printf を使う
    # 連想配列だと key の順番が変わるので ${(k)連想配列} は使わない
    for mark in '+' '-' '?' 'S'; do
    	if printf "${vcs_info_msg_1_}" | grep -F "${mark}" > /dev/null 2>&1 ; then
    	    prompt+="%K{${TBROOK_PROMPT_VCS_MARK_BG_COLOR['${mark}']}}${mark}%k"
    	fi
    done


    if [[ -n "$vcs_info_msg_2_" ]]; then
	prompt+="<%F{red}${vcs_info_msg_2_}%f>"
    fi


    if [[ -n "${prompt}" ]]; then
	echo -n "${prompt}"

	if [[ -n "$1" ]]; then
	    printf ' '
	fi
    else
	printf ''
    fi
}



zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' enable git # svn hg bzr

# %s: git とかといった vcs の種類
# %b: branch name


# 標準のフォーマット(git 以外で使用)
# misc(%m) は通常は空文字列に置き換えられる
# 本当は formats を '%s' '%b' '%m' '%c' '%u' の様に分けたいがかなり重くなる
zstyle ':vcs_info:*' formats       '%s-%b'
zstyle ':vcs_info:*' actionformats '%s-%b' '%m' '%a'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true


if is-at-least 4.3.10; then
    # git 用のフォーマット
    # git のときはステージしているかどうかを表示
    zstyle ':vcs_info:git:*' formats       '%s-%b' '%c%u%m'
    zstyle ':vcs_info:git:*' actionformats '%s-%b' '%c%u%m' '%a'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c で表示する文字列
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u で表示する文字列
fi


# hooks 設定
if is-at-least 4.3.11; then
    # git のときはフック関数を設定する

    # formats       '%s-%b' '%c%u%m'
    # actionformats '%s-%b' '%c%u%m' '%a'
    # のメッセージを設定する直前のフック関数
    # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
    # 各関数が最大3回呼び出される。
    # zstyle ':vcs_info:git+set-message:*' hooks \
    #                                         git-hook-begin \
    #                                         git-untracked \
    #                                         git-push-status \
    #                                         git-nomerge-branch \
    #                                         git-stash-count

    zstyle ':vcs_info:git+set-message:*' hooks \
        git-hook-begin \
	git-hooks

    # フックの最初の関数
    # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
    # (.git ディレクトリ内にいるときは呼び出さない)
    # .git ディレクトリ内では git status --porcelain などがエラーになるため
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
            # 0以外を返すとそれ以降のフック関数は呼び出されない
            return 1
        fi

        return 0
    }


    function +vi-git-hooks() {
        # zstyle formats, actionformats の2番目(%c%u%m)(だから  != "1" )のメッセージのみ対象にする
        if [[ "$1" != "1" ]]; then
            return 0
        fi


	# untracked ファイル表示
	#
	# untracked ファイル(バージョン管理されていないファイル)がある場合は
	# unstaged (%u) に ? を表示

	if command git status --porcelain 2> /dev/null |command grep -E '^\?\?' > /dev/null 2>&1; then
            # unstaged (%u) に追加
            hook_com[unstaged]+='?'
        fi


	# stash 表示
	#
	# stash している場合は S という形式で misc (%m) に表示

        if [[ -n $(command git stash list 2>/dev/null) ]]; then
            # misc (%m) に追加
            hook_com[misc]+="S"
        fi
    }
fi



function __tbrook::prompt::update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
}


add-zsh-hook precmd __tbrook::prompt::update_vcs_info_msg



PROMPT=""
PROMPT+='$(__tbrook::prompt::str::first_line_mark)'
PROMPT+='$(__tbrook::prompt::str::shell_name 1)'
PROMPT+='$(__tbrook::prompt::str::return_code 1)'
PROMPT+='$(__tbrook::prompt::str::current_dir 1)'
PROMPT+='$(__tbrook::prompt::str::vcs_info 1)'
PROMPT+='$(__tbrook::prompt::str::shell_level 1)'
PROMPT+='$(__tbrook::prompt::str::network_info 1)'
PROMPT+='$(__tbrook::prompt::str::time)'
PROMPT+='
'
PROMPT+='$(__tbrook::prompt::str::command_line_mark 1)'



# Local variables:
# mode: shell-script
# End:
