# RHEL 8: Configure FTP Repository
![redhat](https://img.shields.io/badge/-RHEL%208-black?style=flat&logo=redhat&logoColor=EE0000)
[![playbook](https://img.shields.io/badge/Ansible%20Playbook-grey?stype=flat&logo=ansible&logoColor=EE0000)](site.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/rhel_config_ftp_repo)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/rhel_config_ftp_repo)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/rhel_config_ftp_repo)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/rhel_config_ftp_repo)](LICENSE)
## Purpose

Creates a package repository from a RHEL installation .iso and makes the repository accessible to clients via ftp.

## Requirements

None

## Role Variables

Available variables are listed below, along with default values (see ```defaults/main.yml```)
```shell
iso_device: /dev/sr0
```
## Dependencies

None

## Example Playbook
```yaml
    - hosts: localhost
      vars:
        - iso_device: /dev/sr0
      roles:
        - ftp_repo
```

## Author Information

This role was created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/)
