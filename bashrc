
[[ $- =~ i ]] || return 0
trap "date >> $HISTFILE; history -a" HUP INT QUIT KILL TERM

set -C -b -o vi

HISTFILE=~/.history
export ENV=
export ENVDIR=~/Git/ENV

#VERBOSE=1
for dir in ${ENVDIR}/{misc,functions}; do
    echo checking $dir
    for n in $(grep -l TAG:use $dir/*); do
	[[ -v VERBOSE ]] && echo $n || echo -n .
	. $n
    done
    echo finished $dir
    ENV+=:$dir
done

echo $STATE 

# less filling, tastes great!
export ENV=$(vpurge $ENV)

. ~/.mkpaths
PATH=$(vpurge $PATH)

# had to move these here because of path and function issues.
export PAGER=$(type -p less more | head -n 1)
[[ $PAGER =~ less ]] && export LESS='-RCMqsu~' || :
export EDITOR=$(type -p vim vi | head -n 1)
export VISUAL=$EDITOR

[[ $UID -eq 0 ]] && pc[prmt]=red || :

# because LXDE has vte?
[[ $PROMPT_COMMAND =~ __vte ]] && PROMPT_COMMAND=${PROMPT_COMMAND#* } || :
declare la=~/.ssh/loadagent-$HOSTNAME
declare sa=~/.ssh/socket-$HOSTNAME
export la sa
agent+
mkpc
