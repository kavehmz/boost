FROM debian

RUN apt-get update
RUN apt install -y libcurl4-openssl-dev procps libsqlite3-dev wget git build-essential

RUN wget http://master.dl.sourceforge.net/project/d-apt/files/d-apt.list -O /etc/apt/sources.list.d/d-apt.list
RUN apt-get update && apt-get -y --allow-unauthenticated install --reinstall d-apt-keyring
RUN apt-get update && apt-get install  -y dmd-compiler dub

RUN git clone https://github.com/abraunegg/onedrive.git
RUN cd onedrive && make
RUN cd onedrive && make install

RUN apt-get clean && rm onedrive -rf