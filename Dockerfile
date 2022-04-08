FROM alpine:3.15.4
LABEL Maintainer Akash K Roy <akash@akashkroy.com>

ENV PORT="9999"
ENV DOMAIN="localhost"
ENV SLUG="8"

VOLUME [ "/data" ]
RUN mkdir /build
ADD . /build
RUN apk update && apk add build-base && cd /build && make && make install && apk del build-base && rm -rf /build 
WORKDIR /data

EXPOSE ${PORT}

CMD /usr/local/bin/fiche -d ${DOMAIN} -o /data -l /dev/stdout -p ${PORT} -s ${SLUG}
