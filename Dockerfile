FROM  dockerpirate/roundcube:latest-apache

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        git \
    ; \
    \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer; \
    mv /usr/src/roundcubemail/composer.json-dist /usr/src/roundcubemail/composer.json; \
    \
    
    pear install Net_Sieve; \
     
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist --prefer-stable \
        --no-update --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        require \
            johndoh/contextmenu \
            johndoh/sauserprefs \
            
    ; \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist --no-dev \
        --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        update;
        
    
