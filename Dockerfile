FROM composer:1.7.2
FROM php:fpm-alpine

COPY --from=composer /usr/bin/composer /usr/local/bin/composer

RUN apk add git

RUN apk add gosu --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    addgroup local-group && \
    adduser -D -h /home -s /bin/bash -G local-group local-user

USER local-user