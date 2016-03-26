# Portefaix InfluxDB

* Master :
[![Circle CI](https://circleci.com/gh/portefaix/docker-influxdb/tree/master.svg?style=svg)](https://circleci.com/gh/portefaix/docker-influxdb/tree/master)

* Develop :
[![Circle CI](https://circleci.com/gh/portefaix/docker-influxdb/tree/develop.svg?style=svg)](https://circleci.com/gh/portefaix/docker-influxdb/tree/develop)

![logo](https://raw.githubusercontent.com/1science/docker-alpine/latest/logo.png)

[Alpine Linux][] is a Linux distribution built around musl libc and BusyBox.
This image is based on the official Alpine Linux.

[InfluxDB][] is an open-source distributed time series database.

Ports exported are : `8083` and `8086`.

Volume exported is : `/var/lib/influxdb`.

## Usage

    $ docker run --rm=true -it -p 8083:8083 -p 8086:8086 portefaix/influxdb:0.9.6.1

## Supported tags

- `0.11.0.1` [![](https://badge.imagelayers.io/portefaix/influxdb:0.11.0.svg)](https://imagelayers.io/?images=portefaix/influxdb:0.11.0.1 'imagelayers.io')
- `0.10.3.1` [![](https://badge.imagelayers.io/portefaix/influxdb:0.10.3.1.svg)](https://imagelayers.io/?images=portefaix/influxdb:0.10.3.1 'imagelayers.io')
- `0.9.6.1` [![](https://badge.imagelayers.io/portefaix/influxdb:0.9.6.1.svg)](https://imagelayers.io/?images=portefaix/influxdb:0.9.6.1 'imagelayers.io')

## License

See [LICENSE](LICENSE) for the complete license.


## Changelog

A [ChangeLog.md](ChangeLog.md) is available.


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[Alpine Linux]: http://www.alpinelinux.org

[InfluxDB]: http://influxdb.com
