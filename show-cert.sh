#!/bin/bash
 
# Run certbot container
docker run \
  --rm \
  --volume $(pwd)/letsencrypt:/etc/letsencrypt \
  --volume $(pwd)/logs/letsencrypt:/var/log/letsencrypt \
  certbot/certbot \
    certificates