# basique
alias www='cd C:/wamp/www/projets'
alias oc='cd C:/wamp/www/projets_oc'
alias lisa='ls -lisa'
alias refresh='source ~/.bashrc'
alias galias='git config --list | findstr "alias"'
alias gbd='git branch --merged | grep -Ev "\*|master|develop" | xargs -r git branch -D'
alias refresh='source ~/.bashrc'

# Affichage du prompt
function setPromptValue {
    local last_command=$?  # Must come first!
    gitBranch=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'`
    PS1=''

    # Add a bright white exit status for the last command
    PS1+='\[\e[01;37m\]'

    # If it was successful, print a green check mark. Otherwise, print
    # a red X.
    if [[ $last_command == 0 ]]; then
        PS1+='\[\e[01;32m\]\342\234\223'
    else
        PS1+='\[\e[01;31m\]\342\234\227'
    fi

    # Print the working directory and prompt marker in blue, and reset
    # the text color to the default.
    PS1+=" \[\033[01;32m\][\t]" # Heure
    PS1+=" \[\033[0;32m\]\u\[\033[00m\]@\[\033[01;31m\]\h" # username@computerName
    PS1+=" \[\033[01;34m\]\w" # ~
    PS1+="\[\033[33m\]${gitBranch}" # branch name
    PS1+="\[\033[00m\]\n\$ " # $
}

PROMPT_COMMAND='setPromptValue'
