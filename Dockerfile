FROM ubuntu:18.04
MAINTAINER JY

VOLUME ["/var/www"]
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update

RUN apt-get install -y \
  apache2 \
  php5.6 \
  php5.6-cli \
  libapache2-mod-php5.6 \
  php5.6-gd \
  php5.6-ldap \
  php5.6-mysql \
  php5.6-curl \
  vim

COPY apache_default /etc/apache2/sites-available/default
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]
