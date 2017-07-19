case "$1" in
  "ls")
    echo "list of projects"
    gcloud projects list |cat -n
    ;;
  "sel")
    export CLOUDSDK_CORE_PROJECT=$(gcloud projects list |cat -n|egrep "^\s+$2\s"|perl -e '$l=<>;chomp $l;$l=~ s/^\s+\d+\s(.*?)\s+.*/$1/g;print $l,"\n"')
    echo "set CLOUDSDK_CORE_PROJECT to [$CLOUDSDK_CORE_PROJECT]"
    ;;
  "ils")
    echo "list of instnaces in [$CLOUDSDK_CORE_PROJECT]"
    gcloud compute instances list|cat -n
    ;;
  "ssh")
    find_and_ssh $2
    ;;
  *)
    echo "Usage:"
    echo "gc ls # list projects"
    echo "gc sel [Identifier] # select a project name/number"
    echo "gc ils # list instances"
    echo "gc ssh [Identifier] # name or number"
    ;;
esac


function find_and_ssh {
    local SERVER=$(gcloud compute instances list|cat -n|egrep "\s+$1\s"|perl -e '$l=<>;chomp $l;$l=~ s/^\s+\d+\s(.*?)\s+(.*?)\s+.*/$1 --zone $2/g;print $l,"\n"')
    echo "ssh into [kmousavizamani@$SERVER]"
    gcloud compute ssh kmousavizamani@$SERVER
}