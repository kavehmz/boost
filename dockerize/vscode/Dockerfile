FROM google/cloud-sdk:latest

RUN apt-get update
RUN apt-get install -y curl gpg sudo x11-apps xterm libasound2 git build-essential bash-completion apt-transport-https

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && \
    install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    bash -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-get update && apt-get install -y code

RUN export uid=1000 gid=1000 && \
    mkdir -p /home/dockerman && \
    echo "dockerman:x:${uid}:${gid}:dockerman,,,:/home/kaveh:/bin/bash" >> /etc/passwd && \
    echo "dockerman:x:${uid}:" >> /etc/group && \
    echo "dockerman ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dockerman && \
    chmod 0440 /etc/sudoers.d/dockerman && \
    chown ${uid}:${gid} /home/dockerman

ADD init.sh /usr/bin/
RUN chmod +x /usr/bin/init.sh

ENTRYPOINT [ "/usr/bin/init.sh" ]
