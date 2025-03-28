# SSH Agent should be running, once
runcount=$(ps -ef | grep "ssh-agent" | grep -v "grep" | wc -l)
if [ $runcount -eq 0 ]; then
    echo Starting SSH Agent
    eval $(ssh-agent -s)
fi
ssh-add -l &>/dev/null
if ! [ "$?" == 0 ]; then
     echo Adding keys...
     ssh-add -t 1d
fi

. $HOME/.cargo/env

alias cq-editor='(cd $HOME/cq-editor/ && ./run.sh)'
alias ..='cd ..'
