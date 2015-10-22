# VERSION 0.9.3
# AUTHOR:         Nicolas Lamirault <nicolas.lamirault@gmail.com>
# DESCRIPTION:    portefaix/grafana

FROM portefaix/base:3.2
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

ENV INFLUXDB_VERSION 0.9.3
ENV GOPATH /go

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

RUN apk add --update build-base curl go git mercurial ca-certificates

RUN mkdir -p ${GOPATH}/src/github.com/influxdb && cd ${GOPATH}/src/github.com/influxdb && \
    git clone https://github.com/influxdb/influxdb.git -b ${INFLUXDB_VERSION} && \
    cd influxdb && \
    go get -u -f -t ./... && \
    go build ./... && \
    cp -r -a ${GOPATH}/src/github.com/influxdb/influxdb/* /usr/share/influxdb && \
    go clean -i -r && \
    apk del --purge build-base go git mercurial && \
    rm -rf ${GOPATH} /tmp/* /var/cache/apk/* /root/.n*

ADD ./config.toml /usr/share/influxdb/config.toml
# ADD ./influxdb.sh /usr/share/influxdb/influxdb.sh

VOLUME ["/var/lib/influxdb"]
VOLUME ["/var/log/influxdb"]

EXPOSE 8083
EXPOSE 8086
# Raft port (for clustering, don't expose)
# EXPOSE 8090
# Protobuf port (flor clustering, don't expose)
# EXPOSE 8099

CMD ["/usr/share/influxdb/influxd", "-config", "/usr/share/influxdb/config.toml"]
