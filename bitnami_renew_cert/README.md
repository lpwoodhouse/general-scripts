# Renew SSL Cert on AWS Lightsail Bitnami Host
![Amazon AWS](https://img.shields.io/badge/Amazon%20AWS-232F3E?style=flat&logo=amazon-aws)
![LetsEncrypt](https://img.shields.io/badge/Let's%20Encrypt-122e58?style=flat&logo=letsencrypt&logoColor=orange)
[![playbook](https://img.shields.io/badge/Ansible%20Playbook-grey?stype=flat&logo=ansible&logoColor=EE0000)](site.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/playbook_bitnami_renew_cert)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/playbook_bitnami_renew_cert)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/playbook_bitnami_renew_cert)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/playbook_bitnami_renew_cert)](LICENSE)
## Purpose

This play is for renewing a Let's Encrypt certificate installed using the bncert-tool or Lego tool.<br>
Reference: https://aws.amazon.com/premiumsupport/knowledge-center/lightsail-bitnami-renew-ssl-certificate/<br>
Tailored to my requirments for renewing the SSL certificate on my AWS Lightsail instance hosting wordpress.

## Requirements

community.general<br>
community.crypto

## Group Variables
Group variables defined in group_vars/all/cert_vars.yml
```shell
cert_email: <email> # The email used to register the certificate with LetsEncrypt
cert_domain: <domain> # The certificate domain registered with LetsEncrypt
cert_path: /opt/bitnami/letsencrypt/certificates/<domain>.crt
```

## Role Variables

Default role variables for the check_cert role are listed below (see ```defaults/main.yml```)
```shell
max_validity: 7 # maximum number of days of current certificate validity before renewal will be carried out
skip_check: no # carry out renewal regardless of current validity
```
## Dependencies

None

## Example Playbook
```yaml
    - hosts: all
      become: true
      roles:
        - check_cert
        - renew_cert
```

## Author Information

This playbook was created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/)
