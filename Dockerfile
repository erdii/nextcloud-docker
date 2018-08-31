FROM nextcloud:13.0.6-rc-apache

RUN echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
  apt-get update && apt-get install -y \
    supervisor \
    ffmpeg \
    libmagickwand-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install bz2 \
  && pecl install apcu imagick \
  && docker-php-ext-enable apcu imagick \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord"]
