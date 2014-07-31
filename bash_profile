export PATH="$PATH:/Users/kaveh/perl5/perlbrew/bin:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/Users/kaveh/perl5/bin"

export PERL5LIB=~/perl5/lib/perl5

alias c="perl /Users/kaveh/archive/boost/cmd.pl"
alias bom='cd ~/Office/bom'
alias cb='cd ~/Office/bom'
alias ch='cd ~/Office/chef'
alias ca='cd ~/archive/boost'

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

git config --global alias.c checkout
git config --global alias.cam commit -am
git config --global alias.cm commit -m
git config --global alias.d diff
git config --global alias.dw diff --word-diff
git config --global alias.a add
git config --global alias.b branch
git config --global alias.dw "diff --word-diff"
git config --global alias.cls "clean -df"
git config --global alias.s "status"
git config --global alias.f "fetch"
git config --global alias.m "merge --no-ff"
git config --global alias.p "push origin HEAD"
git config --global alias.r "rebase -p origin/ORIG_HEAD"
git config --global alias.rst "reset --hard origin/ORIG_HEAD"

source ~/archive/boost/git-prompt.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

. ~/archive/boost/git-completion.bash

complete -o default -o nospace -F _git g

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

shopt -s cdspell

