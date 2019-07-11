#!/bin/bash
 
# Change these value for your site
cert_name=dongport.ml
domain_values=dongport.ml,www.dongport.ml
email=dongnguyenvie@gmail.com
 
# Run as './get-cert.sh production' to get a valid certificate
staging=$([[ $1 = "production" ]] && echo "" || echo "--staging")
 
# -n: Run non-interactively
# --staging: Get test (invalid) cert
# --no-eff-email: Don't share your e-mail address with EFF
 
# Run get cert container
docker run \
  --rm \
  --volume $(pwd)/letsencrypt:/etc/letsencrypt \
  --volume $(pwd)/logs/letsencrypt:/var/log/letsencrypt \
  --volume $(pwd)/nginx/webroot:/usr/share/nginx/html \
  certbot/certbot \
    certonly \
    -n \
    --agree-tos \
    --email ${email} \
    --no-eff-email \
    ${staging} \
    --webroot \
    --webroot-path /usr/share/nginx/html \
    --cert-name ${cert_name} \
    --domains ${domain_values}