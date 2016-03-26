# VERSION 0.11.0.1
# AUTHOR:         Nicolas Lamirault <nicolas.lamirault@gmail.com>
# DESCRIPTION:    portefaix/influxdb

FROM portefaix/base:3.3
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

ENV INFLUXDB_VERSION=0.11.0-1
ENV GLIBC_VERSION=2.23-r1
ENV INFLUXDB_FILE=influxdb-${INFLUXDB_VERSION}_linux_amd64
ENV GLIBC_FILE=glibc-${GLIBC_VERSION}.apk

WORKDIR /tmp

RUN addgroup -S influxdb && adduser -S -G influxdb influxdb \
    && apk add --update curl openssl \
    && curl -Ls https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${GLIBC_FILE} > /tmp/${GLIBC_FILE} \
    && apk add --allow-untrusted /tmp/${GLIBC_FILE} \
    && curl -Ls https://influxdb.s3.amazonaws.com/$INFLUXDB_FILE.tar.gz > /tmp/$INFLUXDB_FILE.tar.gz \
    && tar xvfz $INFLUXDB_FILE.tar.gz \
    && rm /tmp/$INFLUXDB_FILE.tar.gz \
    && cp /tmp/influxdb-$INFLUXDB_VERSION/usr/bin/* /usr/bin \
    && cp -r /tmp/influxdb-$INFLUXDB_VERSION/etc/influxdb /etc \
    && echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf \
    && mkdir /var/lib/influxdb/ \
    && chown influxdb.influxdb /var/lib/influxdb/ \
    && apk del curl \
    && rm -rf /tmp/* /var/cache/apk/*

ADD config.toml /etc/influxdb.toml

USER influxdb

WORKDIR /var/lib/influxdb

EXPOSE 8088 8091 8083 8086

CMD ["/usr/bin/influxd", "-config", "/etc/influxdb.toml"]
