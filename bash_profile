
PATH=~/bin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export MANPATH=/usr/share/man:/usr/local/share/man
export TZ=America/New_York
LANG=C
umask 0037

shopt -s extglob

PS1='\h:\w \u\$ '
[ "$TERM" = "linux" -a ${SSH_AGENT_PID:-0} -eq 0 ] && eval "$(ssh-agent)"

export BASH_ENV=~/.bashrc
. $BASH_ENV
