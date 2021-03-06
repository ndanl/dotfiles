# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    # kill current ssh-agent
    . ~/.ssh_agent.sh

    # remove our key
    if [[ -e .ssh/id_rsa.pub ]]; then
        ssh-add -d .ssh/id_rsa.pub
    fi

    # if we started an agent kill it
    if [[ $SSH_AGENT_PID ]]; then
        ssh-agent -k
    fi

    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi


#vim: ft=sh
