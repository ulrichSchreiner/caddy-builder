FROM golang:1.9-alpine as builder
LABEL maintainer="ulrich.schreiner@gmail.com"

RUN apk update \
    && apk add git 

ENV CADDY_VERSION v0.10.9

WORKDIR /go/src
RUN mkdir -p github.com/mholt \
    && cd github.com/mholt \
    && git clone https://github.com/mholt/caddy.git \
    && go get -u github.com/caddyserver/builds 
ONBUILD COPY plugins.go /go/src/github.com/mholt/caddy/caddy/caddymain/plugins.go

ONBUILD RUN cd github.com/mholt/caddy/caddy \
    && go get -u ./... \
    && git checkout -q ${CADDY_VERSION} \
    && go run build.go goos=linux 

