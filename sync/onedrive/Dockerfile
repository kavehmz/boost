FROM debian

RUN apt-get update
RUN apt install -y libcurl4-openssl-dev procps libsqlite3-dev wget git build-essential sudo && apt-get clean

RUN cd /tmp; wget http://downloads.dlang.org/releases/2.x/2.081.1/dmd_2.081.1-0_amd64.deb && dpkg -i dmd_2.081.1-0_amd64.deb

RUN git clone --branch v2.0.2 https://github.com/abraunegg/onedrive.git
RUN cd onedrive && make
RUN cd onedrive && make install

RUN useradd -u 1000 kaveh
RUN mkdir /home/kaveh
RUN chown kaveh:kaveh /home/kaveh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "-c",  "sudo -u kaveh onedrive --syncdir /home/kaveh/OneDrive --synchronize --monitor" ]
