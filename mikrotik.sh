#! /bin/bash

#
# Устанавливает на микротик сертификаты Let's encrypt
#

scp /etc/letsencrypt/live/mikrotik.domain.tld/cert.pem admin@mikrotik.domain.tld:/
scp /etc/letsencrypt/live/mikrotik.domain.tld/privkey.pem admin@mikrotik.domain.tld:/

ssh admin@mikrotik.domain.tld '/certificate remove cert.pem_0'

ssh admin@mikrotik.domain.tld '/certificate import file-name=cert.pem passphrase=""'
ssh admin@mikrotik.domain.tld '/certificate import file-name=privkey.pem passphrase=""'
