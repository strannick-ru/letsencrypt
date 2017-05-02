# letsencrypt
скрипты для получения, проверки и обновления сертификатов Let's Encrypt

сначально нужно установить certbot:
`apt install letsencrypt`

`generate-cert.sh` &mdash; скрипт для получения нового сертификата для домена domain.tld. На каждый сертификат возможны пять доменных имён (например, domain.tld и www.domain.tld)

`letsencrypt-update.sh` &mdash; скрипт, проверяющий валиден ли ещё сертификат и, при необходимости, обновляющий его и перезапускающий сервисы с помощью `--post-hook`. В примере перезапускается только nginx, при необходимости можно дописать примерно такую строку:
```--post-hook \
  "service nginx reload && service apache2 reload && service postfix reload && service dovecot reload && date | mail -s \"SSL certificate on domain.tld renewed\" admin@domain.tld"```

После размещения скриптов в /usr/local/ нужно прописать в кронтаб следующую строку:
`01  00  *   *   *   /usr/local/letsencrypt-update.sh > /dev/null 2>&1`
