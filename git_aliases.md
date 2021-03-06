# Alias de git

### A mettre dans : vim ~/.gitconfig
```shell
#git config core.autocrlf true 
#git config --list | findstr "alias"
#git branch --merged | grep -Ev "\*|master|develop" | xargs -r git branch -D

[alias]

        ###### Basic ######
        adda = add --all
        diffs = diff --staged
        st = status
        co = checkout
        ci = commit

        ###### Branche ######
        br = branch
        bra = branch --all

        ###### Log ######
        #Show commit from all branches
        lga = log --graph --pretty=format:'%Cgreen%h%Creset -%C(yellow)%d%C(cyan) %s %Creset(%cr) %Cred<%an>%Creset' --abbrev-commit --date=relative --all
        
        #Show commit from current branch
        lg = log --graph --pretty=format:'%Cgreen%h%Creset -%C(yellow)%d%C(cyan) %s %Creset(%cr) %Cred<%an>%Creset' --abbrev-commit --date=relative
        
        #Show commit from current branch without merge request
        lgn = lg --no-merges

        #Show commit from current branch and display full message
        lgf= lg --pretty=full

        ###### Remote ######
        #Show remote info
        info = remote show origin

        ###### Config ######
        #Show git config info
        confa = config --global --list
        conf = config --list

        ###### Commit info ######
        #Show history's commit for file
        history = log --follow -- 
        detail = log --follow -p -- 

        #Show commit's files
        files = show --name-only 

        #Search in commit message
        #git log --grep="731" --no-merges

        ###### Tag ######
        #Show tags with version and date, order by version asc
        tagd = tag --format='%(creatordate:short)%09%(refname:strip=2)' --sort version:refname

        #Show log with tag
        tagl = log --tags --decorate --simplify-by-decoration --oneline
