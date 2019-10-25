#!/usr/bin/env bash
docker run -ti --rm -v $HOME:$HOME -v $HOME/.helm:/root/.helm -v $HOME/.kube:/root/.kube -v $HOME/.bash_history:/root/.bash_history --workdir $PWD --entrypoint /bin/bash local-helm:2.13.1 "$@"
