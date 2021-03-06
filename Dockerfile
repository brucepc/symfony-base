FROM php:7.1-fpm

RUN apt-get update -yqq \
    && apt-get install -yqq \
	git \
	libmcrypt-dev \
        libpq-dev \
  	libcurl4-gnutls-dev \
	libicu-dev \
 	libvpx-dev \
	libjpeg-dev \
	libpng-dev \
	libxpm-dev \
	zlib1g-dev \
	libfreetype6-dev \
	libxml2-dev \
	libexpat1-dev \
	libbz2-dev \
	libgmp3-dev \
	libldap2-dev \
	unixodbc-dev \
	libsqlite3-dev \
	libaspell-dev \
	libsnmp-dev \
	libpcre3-dev \
	libtidy-dev \
        && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
	mbstring \
        mcrypt \
	pdo_pgsql \
	pdo_mysql \
	curl \
	json \
	intl \
	exif \
	gd \
	xml \
	zip \
	bz2 \
	opcache

RUN pecl install xdebug \
	 docker-php-ext-enable \
	 xdebug 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


