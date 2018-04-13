FROM alpine:latest


RUN apk update && apk add inotify-tools rsync && \
    mkdir -p /content/src && mkdir -p /content/dst

COPY sync.sh /usr/bin

RUN chmod +x /usr/bin/sync.sh

CMD ["/usr/bin/sync.sh"]