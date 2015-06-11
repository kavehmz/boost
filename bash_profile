export PATH="$PATH:/Users/kaveh/perl5/perlbrew/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/Users/kaveh/perl5/bin"
export PERL5LIB=~/perl5/lib/perl5

export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/'
export PATH="$JAVA_HOME/bin:$PATH"

alias c="perl /Users/kaveh/archive/boost/cmd.pl"
alias bom='cd ~/Office/devbox/home/git/bom'
alias cdb='cd ~/Office/devbox/home/git/bom'
alias cdd='cd ~/Office/devbox'
alias cdg='cd ~/Office/devbox/home/git/regentmarkets'
alias cdh='cd ~/Office/chef'
alias cda='cd ~/archive'

gs() {
	for i in $(ls -d */); do echo $i; cd $i; eval git ${*:0};cd ..;done
}

alias gg="c gg"
alias ff="c ff"
alias ec="c ec"
alias shr="c shr"
alias sh="c sh"
alias sb="c bsync"
alias bs="c bsync"
alias kv="c kv"
alias sf="c syncfile"
alias g=git
alias sa='eval "$(ssh-agent -s)";ssh-add ~/.ssh/id_rsa'
alias ts="perl -e 'use Time::HiRes; while(<>) { print Time::HiRes::time."'" "'".\$_;}'"

source ~/archive/boost/git-prompt.sh
PS1='[\D{%F %T} \u@\h \W$(__git_ps1 " (%s)")]\$ '


. ~/archive/boost/git-completion.bash
. ~/archive/boost/knife_autocomplete.sh

complete -o default -o nospace -F _git g

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s cdspell

source ~/perl5/perlbrew/etc/bashrc
export GOROOT=~/archive/go
export PATH="$PATH:$GOROOT/bin"
