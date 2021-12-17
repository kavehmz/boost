export GOROOT=$HOME/dev/opt/go/goroot
export GOPATH=$HOME/dev/home/projects
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/Office/bin"
export PAGER=''

# (cdg k/bo) => (cd github.com/kavehmz/boost)
cdg() {
    cd ~/dev/home/projects/src/
    if [ -n "$1" ]
    then
      local WDIR=$(echo $1|sed 's/\//**\/**/g'|sed 's/-/**/g'|sed 's/$/**/')
      [ -n "$BASH_VERSION" ] && cd g**/**$WDIR
      [ -n "$ZSH_VERSION" ] && cd g**/**$~WDIR
    fi
}

kc() {
  [ "$1" = "c" -o "$1" = ""  ] && kubectl config current-context
  [ "$1" = "g" ] && kubectl config get-contexts --no-headers -o name|cat -n
  if [ "$1" = "s" ]
  then
    local LINE=$2
    kubectl config use-context $(kubectl config get-contexts --no-headers -o name|head -n $LINE|tail -1)
  fi
}

clonegh() {
  # kavehmz/boost or https://github.com/kavehmz/boost
  # or  git@github.com:kavehmz/boost.git
  local REPO_URL=$(echo $1|sed -e 's/http\(s\)*\(:\)*\(\/\/\)//g')
  REPO_URL=$(echo $REPO_URL|sed -e 's/git\@//g')
  REPO_URL=$(echo $REPO_URL|sed -e 's/.git$//g')
  REPO_URL=$(echo $REPO_URL|sed -e 's/:/\//g')

  local REPO_HOST=$(echo "$REPO_URL"|cut -d'/' -f 1)
  local REPO_OWNER=$(echo "$REPO_URL"|cut -d'/' -f 2)
  local REPO_NAME=$(echo "$REPO_URL"|cut -d'/' -f 3)

  echo "Cloning [$REPO_URL] in [~/dev/home/projects/src/$REPO_HOST/$REPO_OWNER/$REPO_NAME]"
  local YESNO="n"
  vared -p 'Are you sure(y/N)?  ' -c YESNO
  if [[ "${YESNO}" =~ ^[Yy]$ ]]
  then
    cd ~/dev/home/projects/src/$REPO_HOST
    mkdir -p $REPO_OWNER
    cd $REPO_OWNER
    git clone git@$REPO_HOST:$REPO_OWNER/$REPO_NAME.git
    cd $REPO_NAME
  fi

}

watch() {
  local L="$@"
  [ -z "$L" ] && read L
  while true
  do
    eval $L
  done
}

alias ts="perl -e 'use Time::HiRes; while(<>) { print sprintf(\"%-17s \", Time::HiRes::time),"'" "'".\$_;}'"
alias cdd='cd ~/dev/'
alias ff="find .| grep -i"
alias gr='go run'
alias e=code
alias ec='code -r'
alias gg="git grep -in"
alias g=git
  #an alias to show the latest commit for each file. This also shows which files are in git
alias gl='for i in $(ls -A);do printf "%-32s %s\n" "$i" "$(git log -n1 --oneline $i)";done'
alias dcls='docker ps -a |tail -n +2|tr -s " "|cut -d" " -f 1|xargs docker rm -f'
alias dclsi='docker images|tail -n +2|tr -s " "|cut -d" " -f 3|xargs docker rmi -f'
alias psync='rsync --delete -rva ./ admin@dev0:~/remote/'
alias z='zsh'
alias q='read -p "Are you sure(y/N)? " -n 1 -r && [[ "${REPLY}" =~ ^[Yy]$ ]] || (echo "cancelled";exit 1)'
alias gsync='(cd "/Volumes/Data/Google Drive/" && cd ~/Google\ Drive && for i in */;do echo $i;rsync -av --delete "$i" "/Volumes/Data/Google Drive/$i" ;done)'
alias kubens='kubectl get ns'
alias h=history

if [ -n "$BASH_VERSION" ]
then
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

  export HISTCONTROL=ignorespace
  export BASH_SILENCE_DEPRECATION_WARNING=1
else
  source <(kubectl completion zsh)
fi

source ~/Office/profile.sh
