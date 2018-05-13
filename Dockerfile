FROM alpine:3.7
MAINTAINER Dan Itsara <dan@glazziq.com>

RUN apk --update --no-cache add \
    bash \
    curl \
    ruby \
    ruby-json

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
ENV DOCTL_VERSION=1.8.0
WORKDIR /app

RUN curl -L https://github.com/digitalocean/doctl/releases/download/v${DOCTL_VERSION}/doctl-${DOCTL_VERSION}-linux-amd64.tar.gz  | tar xzv && \
  mv doctl /usr/local/bin

ADD ./scripts /app
