export PATH="$PATH:/Users/kaveh/perl5/perlbrew/bin/:/Applications/Sublime Text.app/Contents/SharedSupport/bin:/Users/kaveh/perl5/bin/"

export PERL5LIB=~/perl5/lib/perl5

alias c="perl /Users/kaveh/archive/boost/cmd.pl"
alias bom='cd ~/Office/bom'
alias gg="c gg"
alias ff="c ff"
alias ec="c ec"
alias shr="c shr"
alias sh="c sh"
alias bs="c bsync"
alias kv="c kv"

alias g=git

git config --global alias.co checkout
git config --global alias.c commit
git config --global alias.d diff
git config --global alias.dw "diff --word-diff"
git config --global alias.cls "clean -df"
git config --global alias.s "status"
git config --global alias.f "fetch"
git config --global alias.m "merge --no-ff origin/master"
git config --global alias.p "push origin HEAD"
git config --global alias.r "rebase -p origin/HEAD"


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
  PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
fi

complete -o default -o nospace -F _git g