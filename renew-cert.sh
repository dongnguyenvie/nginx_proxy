#!/bin/bash
 
# Run as './renew-cert.sh production' to get a valid certificate
it_arg=$([[ $1 = "production" ]] && echo "" || echo "-it")
staging_arg=$([[ $1 = "production" ]] && echo "" || echo "--staging")
force_arg=$([[ $1 = "production" ]] && echo "" || echo "--force-renewal")
email_arg=me@toancaro.com
 
# --staging: Get test (invalid) cert
 
# Run get cert container
docker run \
  ${it_arg} \
  --rm \
  --volume $(pwd)/letsencrypt:/etc/letsencrypt \
  --volume $(pwd)/logs/letsencrypt:/var/log/letsencrypt \
  --volume $(pwd)/nginx/webroot:/usr/share/nginx/html \
  certbot/certbot \
    renew \
    ${staging_arg} \
    ${force_arg} \
    --agree-tos \
    --email ${email_arg} \
    --no-eff-email