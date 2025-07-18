# Cloudflare DDNS Update Scripts
[![Cloudflare](https://img.shields.io/badge/-Cloudflare-F38020?style=flat&logo=cloudflare&logoColor=white)](https://dash.cloudflare.com/)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/cloudflare_ddns_updater)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/cloudflare_ddns_updater)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/cloudflare_ddns_updater)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/cloudflare_ddns_updater)](LICENSE)
## Purpose

These scripts are used to update the Dynamic DNS (DDNS) service base on Cloudflare.

## Installation

```shell
git clone https://github.com/lpwoodhouse/cloudflare_ddns_updater.git
```

## Usage

Should be used in conjuction with crontab or similar scheduled task solution to execute [01_cloudflare_dns_update.sh](01_cloudflare_dns_update.sh) at the desired frequency.
All other scripts will be processed in turn and new scripts for additional sub-domains can be created using an existing script as a template.

```shell
# this crontab example executes script every 15 minutes
*/15 * * * * /bin/bash <path/to/01_cloudflare_dns_update.sh>
```

## Reference

These scripts were developed with reference to the script [K0p1-Git/cloudflare-ddns-updater](https://github.com/K0p1-Git/cloudflare-ddns-updater).
