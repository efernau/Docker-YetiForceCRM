FROM php:7.2-apache

# YetiForce CRM
ENV DOWNLOAD_URL https://github.com/YetiForceCompany/YetiForceCRM/releases/download/5.1.0/YetiForceCRM-5.1.0-complete.zip
ENV DOWNLOAD_FILE YetiForceCRM-5.1.0-complete.zip
ENV EXTRACT_FOLDER YetiForceCRM
ENV WWW_FOLDER /var/www/html
ENV WWW_USER www-data
ENV WWW_GROUP www-data

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install -y wget libfreetype6-dev libxml2-dev libjpeg62-turbo-dev libpng-dev libmcrypt-dev libcurl4-gnutls-dev \
    libssl-dev libc-client2007e-dev libkrb5-dev unzip cron re2c python tree memcached 

RUN docker-php-ext-configure imap --with-imap-ssl --with-kerberos && \
    docker-php-ext-configure intl && \
    docker-php-ext-install soap curl gd zip mbstring imap mysqli pdo pdo_mysql gd iconv opcache intl bcmath && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget ${DOWNLOAD_URL}
RUN ls 
RUN unzip $DOWNLOAD_FILE -d $EXTRACT_FOLDER && \
    rm $DOWNLOAD_FILE && \
    rm -rf ${WWW_FOLDER}/* && \
    cp -R ${EXTRACT_FOLDER}/* ${WWW_FOLDER}/ && \
    chown -R ${WWW_USER}:${WWW_GROUP} ${WWW_FOLDER}/* && \
    chown -R ${WWW_USER}:${WWW_GROUP} ${WWW_FOLDER}

ADD php.ini /usr/local/etc/php/php.ini

ADD init.sh /usr/local/bin/init.sh

RUN chmod u+x /usr/local/bin/init.sh

ADD crons.conf /root/crons.conf
RUN crontab /root/crons.conf

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/init.sh"]
