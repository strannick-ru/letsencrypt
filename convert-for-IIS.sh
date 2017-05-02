#! /bin/bash

rm *.pfx

openssl pkcs12 -export -out domain.tld.pfx -inkey /etc/letsencrypt/live/domain.tld/privkey.pem \
        -in /etc/letsencrypt/live/domain.tld/cert.pem -certfile /etc/letsencrypt/live/domain.tld/chain.pem \
        -passout pass:

mpack -s "Domain.tld pfx cert" domain.tld.pfx iis-admin@domain.tld