export GOROOT=~/dev/opt/go/goroot
export GOPATH=~/dev/home/projects
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:~/.local/bin"

# (cdg k/bo) => (cdg; cd k*/bo*)
cdg() {
    cd ~/dev/home/projects/src/github.com
    local WDIR=$(echo $1|sed 's/\//*\/*/g'|sed 's/-/*/g'|sed 's/$/*/')
    [ "$1" != "" ] && cd $(ls -d $WDIR|head -n1)
}

alias ts="perl -e 'use Time::HiRes; while(<>) { print sprintf(\"%-17s \", Time::HiRes::time),"'" "'".\$_;}'"
alias cdd='cd ~/dev/'
alias ff="find .| grep -i"

alias e=code
alias ec='code -r'

alias gg="git grep -in"
alias g=git
#an alias to show the latest commit for each file. This also shows which files are in git
alias gl='for i in $(ls -A);do printf "%-32s %s\n" "$i" "$(git log -n1 --oneline $i)";done'

alias gor="go run"

alias dcls='docker ps -a |tail -n +2|tr -s " "|cut -d" " -f 1|xargs docker rm -f'
alias dclsi='docker images|tail -n +2|tr -s " "|grep "<none>"|cut -d" " -f 3|xargs docker rmi -f'
alias dbuild='cd ~/dev/docker;docker build -t dev:latest --rm .'
alias dev='docker run --rm -v ~/dev/home:/home -v ~/dev/root:/root -v ~/dev/home/projects/bin-linux:/home/projects/bin -it dev /bin/bash --login'
alias stime='docker run --rm --privileged dev date -s "@`date +%s`"'

alias gc="source ~/dev/home/projects/src/github.com/kavehmz/boost/gc.sh"

alias k8s="cat ~/.kube/config|grep current-context|cut -d' ' -f2|sed -e 's/^.*_//g'"
alias k8s-slow="kubectl config view -o template --template='{{ index . "'"current-context"'" }}'|sed -e 's/^.*_//g';echo"

# google drive: it is easier if I go to the dir and use make
alias gddir='cd /opt/gdrive/kavehmz/'
# for custom runs
alias gdpush='docker run --rm -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- push -hidden -verbose '
alias gdpull='docker run --rm -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- pull -hidden -verbose -desktop-links=false '
alias gdrun='docker run --rm -ti -v /opt/gdrive/kavehmz/:/gdrive kavehmz/drive -- '

# touch test; q && ls -l test
alias q='read -p "Are you sure(y/N)? " -n 1 -r && [[ "${REPLY}" =~ ^[Yy]$ ]] || (echo "cancelled";exit 1)'

mkdir -p ~/.kmz

[ ! -f  ~/.kmz/git-prompt.sh ] && curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' -o ~/.kmz/git-prompt.sh
source ~/.kmz/git-prompt.sh
PS1='[\u@kmz \W$(__git_ps1 " (%s)")]\$ '

[ ! -f  ~/.kmz/git-completion.bash ] && curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' -o ~/.kmz/git-completion.bash
source ~/.kmz/git-completion.bash
complete -o default -o nospace -F _git g

#touch ~/.bash_sessions_disable
# on mac this tends to accumulate and is make bash load slower
find ~/.bash_sessions/ -mtime +3 -type f -delete

shopt -s cdspell

# https://developer.github.com/guides/using-ssh-agent-forwarding/
/usr/bin/ssh-add -K  ~/.ssh/id_rsa
