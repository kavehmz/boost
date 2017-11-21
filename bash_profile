export GOROOT=~/dev/opt/go/goroot
export GOPATH=~/dev/home/projects
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:~/dev/opt/hub"

gs() {
	for i in *; do [ -d $i ] || continue;echo "repo:$i"; (cd "$i"; bash -c "git ${*:1}");done
}

#parallel
gsp() {
    echo "Running 'git ${*:1}' on all directories in current path"
    ls -d */|xargs -L1 -I{} -P40  bash -c "cd {} && git ${*:1};echo '{} done'"
}

# gapi forks kavehmz/prime
# gapi rate_limit
gapi() {
	local GIT_TOKEN=$(cat ~/dev/home/share/secret/github_token)
    local CMD="$1"
    local GIT_ORG_REPO=''
    [ "$2" != "" ] && GIT_ORG_REPO="/repos/$2"
	curl --silent "https://api.github.com$GIT_ORG_REPO/$CMD?access_token=$GIT_TOKEN"
}

glint() {
    go tool vet -all -shadow $1
    golint $1
    gotype -a $1
    [ "$(which gosimple)" != "" ] && gosimple $1
}

# (cdg k/bo) => (cdg; cd k*/bo*)
cdg() {
    cd ~/dev/home/projects/src/github.com
    local WDIR=$(echo $1|sed 's/\//*\/*/g'|sed 's/-/*/g'|sed 's/$/*/')
    [ "$1" != "" ] && cd $(ls -d $WDIR|head -n1)
}

cdp() {
    cd ~/dev/home/projects/src
    [ "$1" != "" ] && cd $(echo $1|sed 's/\//*\//g'|sed 's/$/*/')
}

proxy_p8s() {
    local PROMETHEUS_POD=$(kubectl get pods --all-namespaces -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}")
    local NAMESPACE=$(kubectl get pods --all-namespaces -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.namespace}")
    kubectl --namespace $NAMESPACE port-forward $PROMETHEUS_POD 9090
}

proxy_k8s() {
    kubectl proxy
}
# k8s: get pod will add -n namespace in output for shorter usage
# kubectl logs $(getpod dev dbs)
function getpod {
    local NS=$1
    local NAME=$2
    local ID=$(kubectl  -n $NS get pods|grep $NAME|tail -1|cut -d' ' -f 1)
    echo -n "-n $1 $ID"
}

alias ts="perl -e 'use Time::HiRes; while(<>) { print sprintf(\"%-17s \", Time::HiRes::time),"'" "'".\$_;}'"
alias cdd='cd ~/dev/'
alias ff="find .| grep -i"
alias e=code
alias ec='code -r'

alias gg="git grep -in"
alias gm="git fetch origin;git merge --no-ff origin/master"
alias g=git
alias git=hub
alias sa='eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa'
#an alias to show the latest commit for each file. This also shows which files are in git
alias gl='for i in $(ls -A);do printf "%-32s %s\n" "$i" "$(git log -n1 --oneline $i)";done'

alias gob="go build -x"
alias gor="go run"
alias got="go test"

alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dim='docker images'
alias dcls='docker ps -a |tail -n +2|tr -s " "|cut -d" " -f 1|xargs docker rm -f'
alias dclsi='docker images|tail -n +2|tr -s " "|cut -d" " -f 3|xargs docker rmi -f'
alias dbuild='cd ~/dev/docker;docker build -t dev:latest --rm .'
alias dev='docker run --rm -v ~/dev/home:/home -v ~/dev/root:/root -v ~/dev/home/projects/bin-linux:/home/projects/bin -it dev /bin/bash --login'
alias drun='docker run --rm -v ~/dev/home:/home -v ~/dev/root:/root -it dev'
alias stime='docker run --rm --privileged dev date -s "@`date +%s`"'
alias remote='ssh remote'
mkdir -p ~/.kmz

# alias gc="source $(dirname $(readlink -f $0))/gc.sh"
alias gc="source ~/dev/home/projects/src/github.com/kavehmz/boost/gc.sh"
alias k8s="kubectl config view -o template --template='{{ index . "'"current-context"'" }}'|sed -e 's/^.*_//g';echo"
alias vpn='(gc sel 5;gcloud beta compute firewall-rules delete  kmz-tmp;gcloud beta compute firewall-rules create kmz-tmp --network core --allow 22 --source-ranges "$(dig +short myip.opendns.com @resolver1.opendns.com)";ssh "$(cat ~/.vpn_server)";gcloud beta compute firewall-rules delete  kmz-tmp)'
alias openvpn="sudo openvpn ~/Office/openvpn.config"

[ ! -f  ~/.kmz/git-prompt.sh ] && curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' -o ~/.kmz/git-prompt.sh
source ~/.kmz/git-prompt.sh
PS1='[\u@kmz \W$(__git_ps1 " (%s)")]\$ '

[ ! -f  ~/.kmz/git-completion.bash ] && curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' -o ~/.kmz/git-completion.bash
source ~/.kmz/git-completion.bash
complete -o default -o nospace -F _git g

[ ! -f  ~/.kmz/docker.sh ] && curl 'https://raw.githubusercontent.com/docker/docker/master/contrib/completion/bash/docker' -o ~/.kmz/docker.sh
source ~/.kmz/docker.sh

[ ! -f  ~/.kmz/docker-compose.sh ] && curl 'https://raw.githubusercontent.com/docker/compose/master/contrib/completion/bash/docker-compose' -o ~/.kmz/docker-compose.sh
source ~/.kmz/docker-compose.sh

shopt -s cdspell
