#!/bin/sh

domain_id="${DOMAIN?Need to provide Domain}"
subdomain="${SUBDOMAIN:-@}"
record_id="${RECORD?Need to provide Record}"
ipchecker="${CHECKER_URL:-https://ipecho.net/plain}"
api_key="${APIKEY?Need to provide Api Key}"
ip="${IP:-}"

if [[ -z $ip ]]; then
	ip="$(curl -S -s $ipchecker)"
fi
echo $ip > /dev/stderr
echo content="$(curl -S -s -H "Authorization: Bearer $api_key" -H "Content-Type: application/json" \
              -d '{"name": "'"$subdomain"'", "data": "'"$ip"'"}' \
              -X PUT "https://api.digitalocean.com/v2/domains/$domain_id/records/$record_id")"
