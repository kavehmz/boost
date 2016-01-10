export GOROOT=~/dev/opt/go
export SCALA_HOME=~/dev/opt/scala
export GOROOT=~/dev/opt/go
export GOPATH=~/dev/opt/gopath
export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/'
export PATH="$PATH:$SCALA_HOME/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:$JAVA_HOME/bin:$GOROOT/bin:$GOPATH/bin:~/dev/opt/hub"

gs() {
	for i in *; do [ -d $i ] || continue;echo "repo:$i"; cd "$i"; eval git ${*:0};cd ..;done
}

gps() {
	GIT_TOKEN=$(cat ~/.boost/git_token)
	GIT_ORG=$(cat ~/.boost/git_org)
	for i in *; do [ -d $i ] || continue;echo "repo:$i"; cd "$i"; REPO="$(basename $(pwd))"; curl --silent "https://api.github.com/repos/$GIT_ORG/$REPO/pulls?access_token=$GIT_TOKEN"|grep head -A1|grep label|cut -d'"' -f4 ;cd ..;done
}

alias cdd='cd ~/dev/'
alias c="perl ~/dev/home/git/kavehmz/boost/cmd.pl"
alias cdg='cd ~/dev/home/git'

alias gg="c gg"
alias ff="c ff"
alias ec="c ec"
alias shr="c shr"
alias sh="c sh"
alias dev="ssh dev"
alias g=git
alias sa='eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa'
alias ts="perl -e 'use Time::HiRes; while(<>) { print Time::HiRes::time."'" "'".\$_;}'"
alias git=hub
alias bstat='for i in `ls`; do printf "$i: "; branch_status -t $(cat ~/.boost/git_token) -o $(cat ~/.boost/git_org) -r $i; done'
alias gr="go run"
alias gt="go test"
#an alias to show the latest commit for each file. This also shows which files are in git
alias gl='for i in $(ls -A);do printf "%-32s %s\n" "$i" "$(git log -n1 --oneline $i)";done'


source ~/dev/home/git/kavehmz/boost/git-prompt.sh
PS1='\u@\h \W$(__git_ps1 " (%s)")]\$ '


. ~/dev/home/git/kavehmz/boost/git-completion.bash
. ~/dev/home/git/kavehmz/boost/knife_autocomplete.sh

complete -o default -o nospace -F _git g

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s cdspell
