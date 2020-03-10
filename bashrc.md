# Alias et config pour le fichier .bashrc
```shell
# basique
#### ALIAS COMMANDE SYS ####
alias ls="ls --color"
alias ll="ls -la"
alias lh="ls -lh"
alias la="ls -a"
alias lisa='ls -lisa'
alias igrep="grep -i"
alias grep="grep --color"
##### ALIAS PERSOS ######
alias refresh='source ~/.bashrc'
alias galias='git config --list | findstr "alias"'
alias gbd='git branch --merged | grep -Ev "\*|master|develop" | xargs -r git branch -D'
##### ALIAS ROOT ######
alias www='cd /var/www'
alias blog='cd /var/www/blog'


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
    PS1+=" \[\033[00;32m\][\t]" # Heure
    PS1+=" \[\033[1;36m\]\u\[\033[1;30m\]@\[\033[01;34m\]\h" # username@computerName
    PS1+=" \[\033[01;32m\]\w" # ~
    PS1+="\[\033[1;33m\]${gitBranch}" # branch name
    PS1+="\[\033[1;37m\]\n\$ " # $
}

PROMPT_COMMAND='setPromptValue'
