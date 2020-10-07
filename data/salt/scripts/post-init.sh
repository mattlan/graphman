#!/bin/sh
# could also be done via `apt install prometheus-node-exporter` for apt systems?
wget -P /tmp https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
mkdir /opt/node_exporter
tar -C /opt/node_exporter --strip-components=1 -zxvf /tmp/node_exporter-1.0.1.linux-amd64.tar.gz
nohup /opt/node_exporter/node_exporter &
nohup /usr/local/bin/salt-minion &
nohup sleep 5 && salt-key -Ay &
/usr/bin/dumb-init /usr/local/bin/saltinit
