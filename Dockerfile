FROM resin/rpi-raspbian

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apt-transport-https -y --force-yes
RUN apt-get install wget
RUN apt-get install mediainfo
RUN apt-get install libmono-cil-dev -y
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian raspbianjessie main" | sudo tee /etc/apt/sources.list.d/mono-official.list
RUN apt-get update
RUN apt-get install mono-devel
RUN apt-get install libcurl4-openssl-dev
RUN mkdir -p /volumes/config /volumes/media
RUN wget https://github.com/Jackett/Jackett/releases/download/v0.8.527/Jackett.Binaries.Mono.tar.gz
RUN tar -xvzf Jackett.Binaries.Mono.tar.gz
RUN rm Jackett.Binaries.Mono.tar.gz

COPY root/ /

# ports and volumes
VOLUME /config /downloads

EXPOSE 9117

## Entrypoint to launch Radarr
ENTRYPOINT ["mono","JackettConsole.exe", "-data=/config"]
