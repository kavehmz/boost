#!/bin/bash

# find SOURCE_DIR: https://stackoverflow.com/questions/59895
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done

export GOROOT=~/dev/opt/go/goroot
export GOPATH=~/dev/home/projects
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# (cdg k/bo) => (cdg; cd k*/bo*)
cdg() {
    cd ~/dev/home/projects/src/
    local WDIR=$(echo $1|sed 's/\//*\/*/g'|sed 's/-/*/g'|sed 's/$/*/')
    [ "$1" != "" ] && cd $(ls -d git*/$WDIR|head -n1)
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

alias dcls='docker ps -a |tail -n +2|tr -s " "|cut -d" " -f 1|xargs docker rm -f'
alias dclsi='docker images|tail -n +2|tr -s " "|cut -d" " -f 3|xargs docker rmi -f'

alias k8s="cat ~/.kube/config|grep current-context|cut -d' ' -f2|sed -e 's/^.*_//g'"

# touch test; q && ls -l test
alias q='read -p "Are you sure(y/N)? " -n 1 -r && [[ "${REPLY}" =~ ^[Yy]$ ]] || (echo "cancelled";exit 1)'

mkdir -p ~/.kmz

[ ! -f  ~/.kmz/git-prompt.sh ] && curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh' -o ~/.kmz/git-prompt.sh
source ~/.kmz/git-prompt.sh
PS1='[\u@kmz \W $(__git_ps1 " (%s)")]\$ '


[ ! -f  ~/.kmz/git-completion.bash ] && curl 'https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash' -o ~/.kmz/git-completion.bash
source ~/.kmz/git-completion.bash

#touch ~/.bash_sessions_disable
# on mac this tends to accumulate and is make bash load slower
find ~/.bash_sessions/ -mtime +1 -type f -delete

shopt -s cdspell

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/dev/opt/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/dev/opt/google-cloud-sdk/path.bash.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/dev/opt/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/dev/opt/google-cloud-sdk/completion.bash.inc"; fi

[ -f "$HOME/.local/completion.kubectl.inc" ] || ( command -v kubectl && kubectl completion bash > "$HOME/.local/completion.kubectl.inc" )
[ -f "$HOME/.local/completion.kubectl.inc" ] && source "$HOME/.local/completion.kubectl.inc"

[ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ] && source /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
[ -f /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion ] && source /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion

export HISTCONTROL=ignorespace
export BASH_SILENCE_DEPRECATION_WARNING=1
