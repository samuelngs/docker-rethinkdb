FROM alpine:latest
MAINTAINER infinitely <sam@infinitely.io>

# Expose ports.
#  - 8080: web UI
#  - 28015: process
#  - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015

WORKDIR /rethinkdb_data

# Install RethinkDB Latest
RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories &&\
    apk --update add rethinkdb &&\
# Cleanup
    rm -rf /var/cache/apk/* \
           /tmp/*

VOLUME ["/rethinkdb_data"]

# Entry Point
ENTRYPOINT ["/usr/bin/rethinkdb"]

# Default Command
CMD ["--bind", "all"]


