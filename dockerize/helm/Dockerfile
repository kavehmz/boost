FROM alpine/helm:2.13.1 as base

FROM debian
COPY --from=base /usr/bin/helm /usr/bin/helm
RUN apt-get update &&  apt-get install -y ca-certificates git curl bash-completion && \
    helm init --client-only && \
    helm plugin install https://github.com/databus23/helm-diff --version master && \
    echo 'source /etc/profile.d/bash_completion.sh' >> ~/.bashrc && \
    echo 'source <(helm completion bash)' >> ~/.bashrc
