export PATH="$PATH:/Users/kaveh/perl5/perlbrew/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/Users/kaveh/perl5/bin"

export PERL5LIB=~/perl5/lib/perl5

alias c="perl /Users/kaveh/archive/boost/cmd.pl"
alias bom='cd ~/Office/bom'
alias cb='cd ~/Office/bom'
alias ch='cd ~/Office/chef'
alias ca='cd ~/archive'

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
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

. ~/archive/boost/git-completion.bash
. ~/archive/boost/knife_autocomplete.sh

complete -o default -o nospace -F _git g

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s cdspell


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

source ~/.profile
