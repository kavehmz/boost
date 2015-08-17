export PATH="$PATH:~/perl5/perlbrew/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:~/perl5/bin:$JAVA_HOME/bin:$GOROOT/bin:~/archive/hub"
export PERL5LIB=~/perl5/lib/perl5
export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/'
export GOROOT=~/archive/go

gs() {
	for i in *; do [ -d $i ] || continue;echo "$i"; cd "$i"; eval git ${*:0};cd ..;done
}

alias c="perl ~/archive/boost/cmd.pl"
alias cda='cd ~/archive'
alias cdk='cd ~/archive/Dady'
alias cdd='cd ~/Office/devbox'
alias cdg='cd ~/Office/repos'
alias cdh='cd ~/Office/chef'

alias gg="c gg"
alias ff="c ff"
alias ec="c ec"
alias shr="c shr"
alias sh="c sh"
alias g=git
alias sa='eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa'
alias ts="perl -e 'use Time::HiRes; while(<>) { print Time::HiRes::time."'" "'".\$_;}'"
alias git=hub

source ~/archive/boost/git-prompt.sh
PS1='[\D{%F %T} \u@\h \W$(__git_ps1 " (%s)")]\$ '


. ~/archive/boost/git-completion.bash
. ~/archive/boost/knife_autocomplete.sh

complete -o default -o nospace -F _git g

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s cdspell
