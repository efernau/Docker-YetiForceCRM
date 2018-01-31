FROM php:7.1-apache

# YetiForce CRM
ENV DOWNLOAD_URL https://github.com/YetiForceCompany/YetiForceCRM/releases/download/4.3.0/YetiForceCRM-4.3.0-complete.zip
ENV DOWNLOAD_FILE YetiForceCRM-4.3.0-complete.zip
ENV EXTRACT_FOLDER YetiForceCRM
ENV WWW_FOLDER /var/www/html
ENV WWW_USER www-data
ENV WWW_GROUP www-data

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y wget libfreetype6-dev libxml2-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev libcurl4-gnutls-dev libpng-dev libssl-dev libc-client2007e-dev libkrb5-dev unzip cron re2c python tree memcached mysql-client php5-mysqlnd

RUN docker-php-ext-configure imap --with-imap-ssl --with-kerberos && \
    docker-php-ext-install mysqli  soap curl gd zip mbstring imap pdo_mysql gd iconv mcrypt opcache  && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget ${DOWNLOAD_URL} && \
    unzip YetiForceCRM-4.3.0-complete.zip -d $EXTRACT_FOLDER && \
    rm $DOWNLOAD_FILE && \
    rm -rf ${WWW_FOLDER}/* && \
    cp -R ${EXTRACT_FOLDER}/* ${WWW_FOLDER}/ && \
    chown -R ${WWW_USER}:${WWW_GROUP} ${WWW_FOLDER}/* && \
    chown -R ${WWW_USER}:${WWW_GROUP} ${WWW_FOLDER}

ADD php.ini /usr/local/etc/php/php.ini
ADD config_override.php.pyt /usr/local/src/config_override.php.pyt
ADD envtemplate.py /usr/local/bin/envtemplate.py
ADD init.sh /usr/local/bin/init.sh

RUN chmod u+x /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/envtemplate.py

ADD crons.conf /root/crons.conf
RUN crontab /root/crons.conf

EXPOSE 80
ENTRYPOINT ["/usr/local/bin/init.sh"]
