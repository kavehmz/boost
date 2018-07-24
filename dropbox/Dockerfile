# this can help you to avoid installing unknow app as dropbox locally in your system
# docker run -d --rm --name dropbox -v /opt/dropbox:/home/kaveh dropbox
FROM debian

RUN apt-get update
RUN apt-get install -y wget sudo procps
RUN useradd -u 1000 kaveh
RUN mkdir /home/kaveh
RUN chown kaveh:kaveh /home/kaveh

RUN cd /home/kaveh && sudo -u kaveh /bin/bash -c 'wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -'
RUN mv /home/kaveh/.dropbox-dist /opt/dropbox-dist

ENTRYPOINT [ "/bin/bash" ]
CMD [ "-c",  "sudo -u kaveh /opt/dropbox-dist/dropbox-lnx.x86_64-53.4.67/dropbox;sleep infinity" ]
