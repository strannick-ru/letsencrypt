#! /bin/bash

/usr/bin/letsencrypt \
    --agree-tos --renew-by-default --standalone --standalone-supported-challenges http-01 \
    --http-01-port 9999 --server https://acme-v01.api.letsencrypt.org/directory certonly \
    --email admin@domail.tld --text \
    -d domail.tld -d www.domail.tld