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

alias gcls="git clean -df"
alias gd="git diff"
alias gs="git status"
alias gdw="git diff --word-diff"
alias gp="git push origin HEAD"
alias gf="git fetch"
alias gfm="git fetch;git merge --no-ff origin/master"
alias gr="git rebase -p origin/HEAD"
alias gc="git commit -a -m"


if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

