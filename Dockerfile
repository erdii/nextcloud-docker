FROM nextcloud:17.0-apache

RUN apt-get update && apt-get install -y \
    supervisor \
    ffmpeg \
    libmagickwand-dev \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install bz2 \
  && pecl install apcu imagick \
  && docker-php-ext-enable apcu imagick \
  && mkdir /var/log/supervisord /var/run/supervisord

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY cron-override.sh /cron-override.sh
COPY entrypoint-override.sh /entrypoint-override.sh

CMD ["/entrypoint-override.sh"]
