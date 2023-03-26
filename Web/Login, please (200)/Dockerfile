FROM php:7.1-apache

RUN apt-get update && apt-get -yq install wget nano

COPY app /var/www/html/

WORKDIR /var/ww/html/app
