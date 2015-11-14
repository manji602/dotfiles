#########################################
#prompt settings
#########################################
export PS1='\[\033[0;35m\]\u@\h\[\033[0m\] \[\033[0;36m\]\W\[\033[0m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\] \$ '

function git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}

#########################################
#other settings
#########################################
# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# git branch completion
source ~/.git-completion.bash

# setup ssh-agent
if [ -f ~/.ssh-agent ]; then
    . ~/.ssh-agent
fi
if [ -z "$SSH_AGENT_PID" ] || ! kill -0 $SSH_AGENT_PID; then
    ssh-agent > ~/.ssh-agent
    . ~/.ssh-agent
fi

ssh_agent_keys=`ssh-add -l | wc -l`
if [ $ssh_agent_keys -eq 0 ]; then
    find ~/.ssh | egrep -v '.pub|known_hosts|config' | xargs sudo ssh-add
fi

# auto load tmux
if [ -z "$TMUX" -a -z "$STY" ]; then
    if type tmuxx >/dev/null 2>&1; then
        tmuxx
    elif type tmux >/dev/null 2>&1; then
        if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
            tmux attach && echo "tmux attached session "
        else
            tmux new-session && echo "tmux created new session"
        fi
    elif type screen >/dev/null 2>&1; then
        screen -rx || screen -D -RR
    fi
fi

# ==============================================================================
# load config with OS type
# ==============================================================================
if [ "$(uname)" == 'Darwin' ]; then
    [ -f ~/.bashrc.osx ] && source ~/.bashrc.osx
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    [ -f ~/.bashrc.linux ] && source ~/.bashrc.linux
else
  exit 1
fi
