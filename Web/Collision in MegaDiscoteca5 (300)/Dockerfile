FROM php:7.1-apache

COPY app/ /var/www/html/app

ENV APACHE_DOCUMENT_ROOT /var/www/html/app

WORKDIR /var/www/html/app

RUN rm -rf /var/www/html/index.* && \
    export APACHE_DOCUMENT_ROOT=/var/www/html/app && \
    sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf && \
    sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf && \
    find /var/www -exec chown www-data:www-data {} \;
