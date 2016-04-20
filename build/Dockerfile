FROM apicht/rpi-golang
MAINTAINER Aaron Picht <https://github.com/apicht/docker-rpi-grafana>

ENV DEBIAN_FRONTEND noninteractive
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y wget g++ flex bison-doc bison gperf ruby ruby-dev perl libsqlite3-dev libfontconfig1-dev icu-doc libicu-dev libfreetype6 libssl-dev libpng12-dev libjpeg8-dev ttf-mscorefonts-installer fontconfig build-essential chrpath git-core openssl libicu52 libfontconfig1 nodejs

RUN git clone https://github.com/grafana/grafana $GOPATH/src/github.com/grafana/grafana
RUN cd $GOPATH/src/github.com/grafana/grafana && go run build.go setup && $GOPATH/bin/godep restore
RUN wget https://github.com/timstanley1985/phantomjs-linux-armv6l/raw/master/phantomjs-2.1.1-linux-armv6l.tar.gz && \
    tar -xzf phantomjs-2.1.1-linux-armv6l.tar.gz && \
    chmod +x phantomjs-2.1.1-linux-armv6l/bin/phantomjs && \
    cp phantomjs-2.1.1-linux-armv6l/bin/phantomjs $GOPATH/src/github.com/grafana/grafana/vendor/phantomjs && \
    cp phantomjs-2.1.1-linux-armv6l/bin/phantomjs /usr/local/bin && \
    rm -rf phantomjs-2.1.1-linux-armv6l phantomjs-2.1.1-linux-armv6l.tar.gz
RUN cd $GOPATH/src/github.com/grafana/grafana && \
    go run build.go build
RUN cd $GOPATH/src/github.com/grafana/grafana && \
    npm install && \
    npm install -g grunt-cli && \
    grunt

WORKDIR $GOPATH/src/github.com/grafana/grafana

#RUN go run build.go build package
#docker cp build-grafana:/gopath/src/github.com/grafana/grafana/dist/grafana_*.deb ./

CMD ["bash"]
