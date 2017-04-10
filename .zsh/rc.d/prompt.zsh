
PROMPT="%{[01;35m%}${USER}@${HOST%%.*}%{[m%}:%{[01;34m%}%1~%{[m%}%{[01;36m%}%(!.#.$)%{[m%} "


#	PROMPT="%{[31m%}%/%%%{[m%} "
PROMPT2="%{[01;34m%}%_%%%{[m%} "
SPROMPT="%{[01;34m%}%r is correct? [n,y,a,e]:%{[m%} "
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#PROMPT="%{[01;37m%}${HOST%%.*} ${PROMPT}"
