# VERSION 0.9.5
# AUTHOR:         Nicolas Lamirault <nicolas.lamirault@gmail.com>
# DESCRIPTION:    portefaix/grafana

FROM portefaix/base:3.2
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

ENV INFLUXDB_VERSION 0.9.5
ENV GOPATH /go

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

RUN apk add --update build-base curl go git mercurial ca-certificates

RUN mkdir -p ${GOPATH}/src/github.com/influxdb && cd ${GOPATH}/src/github.com/influxdb && \
    git clone https://github.com/influxdb/influxdb.git && \
    go get -u -f -t ./... && \
    go build -ldflags="-X main.version=v${INFLUXDB_VERSION} -X main.branch=master -X main.commit=`cd influxdb && git rev-parse HEAD`" ./... && \
    go install ./... && \
    cp $GOPATH/bin/* /usr/local/bin && \
    go clean -i -r && \
    apk del --purge build-base go git mercurial && \
    rm -rf ${GOPATH} /tmp/* /var/cache/apk/* /root/.n*

ADD ./config.toml /usr/share/influxdb/config.toml
# ADD ./influxdb.sh /usr/share/influxdb/influxdb.sh

VOLUME ["/data"]

EXPOSE 8083
EXPOSE 8086
# Raft port (for clustering, don't expose)
# EXPOSE 8090
# Protobuf port (flor clustering, don't expose)
# EXPOSE 8099

CMD ["/usr/local/bin/influxd", "-config", "/usr/share/influxdb/config.toml"]
