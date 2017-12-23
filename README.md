# docker-rpi-jackett
This is a raspberry pi compatible Jackett DockerFile.

To build it :

    docker build -t rpi-jackett .

To run it (with image on docker hub) :

    docker run -d -p 9117:9117 \
    -v /path_to_your_config_folder:/volumes/config \
    --restart unless-stopped \
    --name jackett \
    rafaelncarvalho/rpi-jackett
