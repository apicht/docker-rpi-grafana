FROM resin/rpi-raspbian:jessie
MAINTAINER Aaron Picht <https://github.com/apicht/docker-rpi-grafana>

ENV GRAFANA_VERSION 3.0.0-beta61461091401

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y wget libsqlite3-0 libfreetype6 ttf-mscorefonts-installer fontconfig openssl libicu52 libfontconfig1 ca-certificates

RUN wget "https://github.com/apicht/docker-rpi-grafana/raw/master/dist/grafana_${GRAFANA_VERSION}_armhf.deb" && \
    dpkg -i grafana_${GRAFANA_VERSION}_armhf.deb && \
    rm grafana_${GRAFANA_VERSION}_armhf.deb

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/grafana-server", "-homepath", "/usr/share/grafana/", "-config", "/etc/grafana/grafana.ini"]
