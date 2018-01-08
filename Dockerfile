#
# Dockerfile for openconnect and dante
#

FROM alpine:edge
MAINTAINER kev <noreply@easypi.pro>

RUN set -xe \
    && apk add --no-cache \
               --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
               openconnect dante-server tini\
    && mkdir -p /etc/openconnect \
    && touch /etc/openconnect/openconnect.conf

VOLUME /etc/openconnect

COPY entrypoint.sh /usr/local/bin

#ENTRYPOINT ["openconnect", "--config=/etc/openconnect/openconnect.conf"]
#CMD ["--help"]
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
