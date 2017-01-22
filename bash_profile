export GOROOT=~/dev/opt/go/goroot
export GOPATH=~/dev/home/projects
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:~/dev/opt/hub"

# http://apple.stackexchange.com/questions/59154/ "How do I stop the play/pause keyboard buttons from launching iTunes"
launchctl list | grep -q rcd && launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist

gs() {
	for i in *; do [ -d $i ] || continue;echo "repo:$i"; cd "$i"; eval git ${*:0};cd ..;done
}

gps() {
	GIT_TOKEN=$(cat ~/.boost/git_token)
	GIT_ORG="$(basename $(pwd))"
	for i in *; do [ -d $i ] || continue;echo "repo:$i"; cd "$i"; REPO="$(basename $(pwd))"; curl --silent "https://api.github.com/repos/$GIT_ORG/$REPO/pulls?access_token=$GIT_TOKEN"|grep head -A1|grep label|cut -d'"' -f4|cat -n ;cd ..;done
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
    [ "$1" != "" ] && cd $(echo $1|sed 's/\//*\//g'|sed 's/$/*/')
}

cdp() {
    cd ~/dev/home/projects/src
    [ "$1" != "" ] && cd $(echo $1|sed 's/\//*\//g'|sed 's/$/*/')
}

alias ts="perl -e 'use Time::HiRes; while(<>) { print sprintf(\"%-17s \", Time::HiRes::time),"'" "'".\$_;}'"
alias cdd='cd ~/dev/'
alias ff="find .| grep -i"

alias gg="git grep -in"
alias g=git
alias git=hub
alias sa='eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa'
#an alias to show the latest commit for each file. This also shows which files are in git
alias gl='for i in $(ls -A);do printf "%-32s %s\n" "$i" "$(git log -n1 --oneline $i)";done'

alias gob="go build"
alias gor="go run"
alias got="go test"

alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dim='docker images'
alias dcls='docker ps -a |tail -n +2|tr -s " "|cut -d" " -f 1|xargs docker rm -f'
alias dclsi='docker images|tail -n +2|tr -s " "|cut -d" " -f 3|xargs docker rmi -f'
alias dbuild='cd ~/dev/docker;docker build -t dev:latest --rm .'
alias dev='docker run -v ~/dev/home:/home -v ~/dev/root:/root -it dev /bin/bash --login'
alias drun='docker run -v ~/dev/home:/home -v ~/dev/root:/root -it dev'

source ~/dev/home/projects/src/github.com/kavehmz/boost/git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

. ~/dev/home/projects/src/github.com/kavehmz/boost/git-completion.bash

complete -o default -o nospace -F _git g

#touch ~/.bash_sessions_disable
# on mac this tends to accumulate and is make bash load slower
find ~/.bash_sessions/ -mtime +3 -type f -delete

shopt -s cdspell
