#
# --------------------------------------------------------
#
#   CLOUDSCULPTOR'S BASH ALIASES
#   https://github.com/cloudsculptor/development-environment/blob/master/shared/.bash_aliases
#
# --------------------------------------------------------
#

export HOME=/c/Users/RicThomas

# alias management

alias uda="cp ~/cloudsculptor/development-environment/shared/.bash_aliases ~/;source ~/.bash_aliases"    # Update Aliases
alias al='cat ~/.bash_aliases'

# change directory
alias cdt='cd ~/code/landonline-titles'
alias cds='cd ~/code/landonline-search'
alias cdde='cd ~/cloudsculptor/development-environment'

# general

alias cls='printf "\033c"'
alias lo='libreoffice'
alias pdf='xdg-open'
alias l='ls -la'
alias b='./build.sh'
alias d='./deploy.sh'
alias e='./execute.sh'
alias r='./run.sh'
alias t='./test.sh'
alias s='./serve.sh'

function j7() { export JAVA_HOME=/usr/lib/jvm/java-7-oracle; java -version; echo $JAVA_HOME; }
function j8() { export JAVA_HOME=/usr/lib/jvm/java-8-oracle; java -version; echo $JAVA_HOME; }
function ptime() { echo `date '+%Y.%m.%d-%H.%M.%S'`; }

alias a="asciidoctor *.adoc"
alias ad="asciidoctor -r asciidoctor-diagram *.adoc"  # See: https://asciidoctor.org/docs/asciidoctor-diagram/
alias ap="asciidoctor-pdf *.adoc"

# find

alias f='find . -name'
alias fd='find . -type d -name'

function f() { find . -name "$1" ; }

# grep

function eg() { egrep -rn "$1" .; }
function gj() { grep -rn --include='*.java' --include='*.groovy' "$1" . ; }
function gft() { grep -rn --include="$1" "$2" . ; }
function egft() { egrep -rn --include="$1" "$2" . ; }

# git

alias gpcb='git push origin HEAD'
alias gpfcb='git push --force origin HEAD'
alias gca='git commit --amend'
alias gl2='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias gl3='git log --all --decorate --oneline --graph'
alias gl4='git log --graph --oneline'
alias gl5='git log --name-only'
alias r-git-amend='git commit -u --amend .'
alias r-git-log='git log --oneline'
alias r-s='git status'
alias gl='git log --oneline'
alias gb='git branch'
alias gbr='git branch -r'
alias gs='git status'
alias gsh='git show'
alias gp='git pull'
alias gd='git diff'
alias ga='git add -u .'
alias gclean='git stash;git stash drop;git status'
alias gwip='git add --all;git commit -m "WIP"'
alias gaa='git add --all'
alias gfh='git log -p'

function gdl() { git branch -d "$1"; }
function gdr() { git push origin --delete "$1"; }
function gdf() { git diff --name-only HEAD HEAD~1 ; }
function gcm() { git commit -m "$1"; }
function gc() { git checkout "$1"; }
function gcr() { git checkout "release-$1"; }
function gpsh() { git push origin "$1"; }
function gcl() { git clone "git@bitbucket.org:$1/$2.git"; }
function g() { grep -rn "$1" .; }
function gpshm() { git push origin master; }
function gsf() { git diff-tree --no-commit-id --name-only -r "$1"; }
function grb() { git rebase -i HEAD~"$1"; }
function gfco() { git fetch origin "$1"; git checkout "$1"; git pull; }
function gfcor() { git fetch origin "release-$1"; git checkout "release-$1"; git pull; }
function gfc() { git add --all;git commit -m "$1"; }
function gsave() { gaa; MSG=$1;gcm "${MSG:-WIP}";}
function gpush() { gsave $1 && gpcb ; }

# Angular & NPM

#alias ngs='ng serve --proxy-config proxy.conf.json --open'
alias ngs='ng serve --open'
alias nwts='npm run watch-ts'
alias nwn='npm run watch-node'

# Spring & Gradle

alias gwbc='./gradlew build --continuous'
alias gwbr='./gradlew bootRun'
alias gw='./gradlew'
alias gwc='./gradlew clean'

# Docker
function dr() { docker run -it "$1" /bin/bash ; }
function de() { docker exec -it "$1" /bin/bash ; }

# Coding

alias ut='gradle ut'
alias it='gradle it'
alias st='gradle st'
alias idea='idea . &'

# Kubernetes

alias k=kubectl
complete -F __start_kubectl k

alias kc='kubectl config get-contexts'
alias kcc='kubectl config current-context'
alias kuc='kubectl config use-context'
alias k1='kubectl config use-context minikube'
alias mkst='unset KUBECONFIG && minikube start && source ~/.bashrc && k1'
alias mksp='minikube stop'
alias mkd='minikube dashboard'
alias krbb='kubectl run -i --tty busybox --image=busybox --restart=Never -- sh'
function ke() { kubectl exec --namespace=${2:-default} -it $1 -- /bin/bash ; }
function ke2() { kubectl exec --namespace=${3:-default} -it $1 --container $2 -- /bin/bash ; }
function ke3() { kubectl exec --namespace=${2:-default} -it $1 -- /bin/sh ; }
function ke4() { kubectl exec --namespace=${3:-default} -it $1 --container $2 -- /bin/sh ; }
function kdp() { kubectl describe pod $1 --namespace ${2:-default} ; }
function kpf() { kubectl port-forward $1 $2:$3 --namespace ${4:-default}; }  # $1 = <pod/service etc name>, $2 = <local port>, $3 = <remote port>, $4 = namespace
function kdsp() { kubectl describe pod $1 --namespace ${2:-default} ; }  # $1 = <pod name>, $2 = <namespace>
function klg() { kubectl logs $1 --namespace ${2:-default} ; }  # $1 = <pod name>, $2 = <namespace>
function klgf() { kubectl logs --follow $1 --namespace ${2:-default} ; }  # $1 = <pod name>, $2 = <namespace>
function klgi() { kubectl logs $1 -c $2 --namespace ${3:-default} ; }    # $1 = <pod name>, $2 = <container name>, $3 = <namespace>
function klgif() { kubectl logs --follow $1 -c $2 --namespace ${3:-default} ; }    # $1 = <pod name>, $2 = <container name>, $3 = <namespace>
function kpd() { kubectl delete pods $1 --force --grace-period 0 --namespace $2 ; }    # $1 = <pod name>, $2 = <namespace>
function kcp() { kubectl cp $1 $2/$3:$4 ; }    # $1 = <local path>, $2 = <namespace>, $3 = <pod name>, $4 = <remote path>

# Kubernetes / Istio dashboard proxies
alias kubedash="kubectl proxy"

# Helm

function hdr() { helm install --dry-run --debug $1 ; } # $1 = helm chart directory name eg 'jenkins'
