FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apt-transport-https -y --force-yes
RUN apt-get install wget
RUN apt-get install mediainfo
RUN apt-get install libmono-cil-dev -y
RUN wget http://sourceforge.net/projects/bananapi/files/mono_3.10-armhf.deb
RUN dpkg -i mono_3.10-armhf.deb
RUN rm mono_3.10-armhf.deb
RUN apt-get install libcurl4-openssl-dev
RUN mkdir -p /volumes/config /volumes/media
RUN wget https://github.com/Jackett/Jackett/releases/download/v0.8.527/Jackett.Binaries.Mono.tar.gz
RUN tar -xvzf Jackett.Binaries.Mono.tar.gz
RUN rm Jackett.Binaries.Mono.tar.gz

# ports and volumes
VOLUME /config /downloads

EXPOSE 9117

## Entrypoint to launch Radarr
ENTRYPOINT ["mono","JackettConsole.exe", "-data=/config"]
