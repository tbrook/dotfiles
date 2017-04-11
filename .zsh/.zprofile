
xbsh_profile="$HOME/.xbsh/.xbshprofile"

if [[ -f $xbsh_profile ]]; then
    . $xbsh_profile
else
    echo "'$xbsh_profile' is not exist." 1>&2
fi


# Local variables:
# mode: shell-script
# End:
