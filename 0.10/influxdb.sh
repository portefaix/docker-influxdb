#!/usr/bin/env bash

echo "Starting InfluxDB"
/usr/share/influxdb/influxd -config=/usr/share/influxdb/config.toml
