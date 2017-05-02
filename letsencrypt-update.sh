#! /bin/bash

if openssl x509 -checkend 86400 -noout -in /etc/letsencrypt/live/domain.tld/cert.pem
then
  echo "Certificate is good for another day!"
else
  echo "Certificate has expired or will do so within 24 hours!"
  /usr/bin/letsencrypt renew --post-hook "service nginx reload"
fi