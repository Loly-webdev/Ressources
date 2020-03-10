# Alias et config pour le fichier .bashrc (sudo vim ~/.bashrc)
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
```

## Voici une liste de caractères spéciaux :

- \u : le nom d'utilisateur courant (exemple : « kazenojiyu »)
- \h : affiche le nom d'hôte jusqu'au premier point "." (exemple : « kazenojiyu-Laptop » )
- \H : affiche le nom d'hôte en entier ( exemple : « kazenojiyu-Laptop.localhost » )
- \w : le répertoire courant ( exemple : « ~/Documents/articles/article_terminal » )
- \W : basename du répertoire courant ( exemple : « article_terminal » )
- \$ : « # » si l'utilisateur courant est super-utilisateur, « $ » sinon
- \j : le nombre de processus gérés par le terminal courant ( exemple : « 0 » )
- ! : le nombre de commande dans l'historique ( exemple : « 452 » )
- '#' : le nombre de commande dans l'historique de la session courante ( exemple : « 5 » )
- \s : le nom du shell ( exemple : « bash » )
- \v : la version du bash ( exemple : « 4.3 » )
- \V : numéro de version en entier : majeur.mineure.patchlevel ( exemple : « 4.3.43 » )
- \T : l'heure au format 12h HH:MM:SS ( exemple : « 09:45:50 » )
- \t : l'heure au format 24h HH:MM:SS ( exemple : « 21:45:50 » )
- \@ : l'heure au format 12h am/pm HH:MM ( exemple : « 09:45 » )
- \A : l'heure au format 24h am/pm HH:MM ( exemple : « 21:45 » )
- \d : la date au format « jour mois date » ( exemple : « jeu. juil. 21 » )
- \D : date au format spécifié (plus d'info sur le format : man strftime) ( exemple pour « \D{%d/%m/%Y %H:%M:%S} » : « 21/07/2016 21:43:54 »)
- \n : saut de ligne
- \r : retour chariot
- \ : antislash
- \e : caractère d'échappement ASCII, équivalent à \033 (utile pour ajouter les couleurs)
- [ : début de chaîne contenant des caractères non imprimable
-  ] : fin de chaîne contenant des caractères non imprimable

## La couleur :

Pour cela, il faut utiliser les caractères spéciaux \e, \[, \].
Les codes couleurs utilisés comportent 2 éléments, le premier indique si le texte doit être en gras (0 ou 1) et le second le code couleur (30 à 37 sans couleur de fond et 40 à 47 avec couleur de fond).
Le code couleur s'utilise ainsi
\[\033[00;31m\] pour le rouge et \[\033[01;31m\] pour le rouge clair
et fermer ta  zone" couleur par  \[\033[00m\]

   - Noir 0;30   
   - Gris foncé 1;30
   - Bleu 0;34
   - Bleu clair 1;34
   - Vert 0;32
   - Vert clair 1;32
   - Cyan 0;36
   - Cyan clair 1;36
   - Rouge 0;31
   - Rouge clair 1;31
   - Violet 0;35
   - Violet clair 1;35
   - Brun 0;33
   - Jaune 1;33
   - Gris clair 0;37
   - Blanc 1;37
