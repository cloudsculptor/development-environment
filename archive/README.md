Why
For people who don't remember things.

Cmder cmd.exe Aliases
These are Cmder aliases.

Notes on creating aliases:

Aliases in Cmder are created with alias a=stuff.
You can use variables $1 - $9
You separate commands with $t
# General
alias aliases=cat c:\Users\RicThomas\bin\cmder\config\user_aliases.cmd    # List all aliases
 
# Git
alias gclean=git stash $t git stash drop $t git status    # Remove working copy changes
alias gca=git commit --amend
alias gl2=git log --pretty=format:"%h%x09%an%x09%ad%x09%s"
alias gl3=git log --all --decorate --oneline --graph
alias gl4=git log --graph --oneline
alias gl5=git log --name-only
alias grb=git rebase -i HEAD~$1    #Usage: $1=number of commits back to rebase
alias gsave=git add --all $t git commit -m "WIP"
 
# Docker
alias dr=docker run -it $1 /bin/bash    # Launch a Docker image as a container. Usage: $1=sample_image
alias de=docker exec -it $1 /bin/bash   # Interact with a running container.  Usage: $1=05b9e1cd9728
 
# AWS
alias awsl=aws-azure-login --profile $1 --no-prompt    # Login to AWS CLI with using Azure. Usage: $1=titles-preprod
alias awsc=aws --profile $1 s3 ls    # Check you are logged into AWS CLI. Usage: $1=titles-preprod
Cmder bash.exe Aliases
Using Bash under Cmder
https://gist.github.com/nickautomatic/02ccb76292f7f8d9767e

Aliases
