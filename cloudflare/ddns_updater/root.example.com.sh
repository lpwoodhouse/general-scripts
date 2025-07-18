#!/bin/bash

# This script only updates the root record name
# By specifing the record_identifier it prevents the script from attempting to alter the MX/TXT records

auth_email="<EMAIL>"
auth_method="global"
auth_key="<AUTH_KEY>"
zone_identifier="<ZONE_ID>"
record_name="example.com"
proxy=false
record_identifier="<RECORD_ID>"
auth_header="X-Auth-Key:"
ip=$(curl -s https://api.ipify.org || curl -s https://ipv4.icanhazip.com/)

update=$(curl -s -X PUT "https://api.cloudflare.com/client/v4/zones/$zone_identifier/dns_records/$record_identifier" \
                     -H "X-Auth-Email: $auth_email" \
                     -H "$auth_header $auth_key" \
                     -H "Content-Type: application/json" \
              --data "{\"id\":\"$zone_identifier\",\"type\":\"A\",\"proxied\":${proxy},\"name\":\"$record_name\",\"content\":\"$ip\"}")
