case "$1" in
  "ls")
    cat ~/.kube/config | grep 'current-context:'
    ;;
  "sel")
    export KUBECTL_NAMESPACE="$2"
    echo "set KUBECTL_NAMESPACE to [$KUBECTL_NAMESPACE]"
    ;;

  *)
    echo "Usage:"
    echo "k8s sel [Identifier] # select the default namespace for k alias"
    echo "k8s ls # current k8s context"
   ;;
esac
