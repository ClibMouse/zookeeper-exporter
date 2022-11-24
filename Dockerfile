FROM        golang:1.19-alpine as builder
WORKDIR     /usr/src/zookeeper-exporter
COPY        . /usr/src/zookeeper-exporter
RUN         go build -v 

FROM        alpine:3.17.0
COPY        --from=builder /usr/src/zookeeper-exporter/zookeeper-exporter /usr/local/bin/zookeeper-exporter
ENTRYPOINT  ["/usr/local/bin/zookeeper-exporter"]
