# Portefaix Grafana

![logo](http://pkgs.alpinelinux.org/assets/alpinelinux-logo.svg)

[Alpine Linux][] is a Linux distribution built around musl libc and BusyBox.
This image is based on the official Alpine Linux.

[InfluxDB][] is an open-source distributed time series database.

Ports exported are : `8083`, `8086`, `8090` and `8099`.

Volumes exported are : `/var/lib/influxdb`.

## Usage

    $ docker run --rm=true -it -p 3000:3000 portefaix/influxdb

## Supported tags

- `0.9.3`

## License

See [LICENSE](LICENSE) for the complete license.


## Changelog

A [ChangeLog.md](ChangeLog.md) is available.


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>


[Alpine Linux]: http://www.alpinelinux.org

[InfluxDB]: http://influxdb.com
