# Change ExpressVPN Connection Location in OpenVPN client
![openvpn](https://img.shields.io/badge/-OpenVPN-EA7E20?style=flat&logo=openvpn&logoColor=white)
![expressvpn](https://img.shields.io/badge/-ExpressVPN-DA3940?style=flat&logo=expressvpn&logoColor=white)
[![playbook](https://img.shields.io/badge/Ansible%20Playbook-grey?stype=flat&logo=ansible&logoColor=EE0000)](site.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/openvpn_switch_location)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/openvpn_switch_location)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/openvpn_switch_location)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/openvpn_switch_location)](LICENSE)
## Purpose

This play is for switching ExpressVPN connection locations configured on the linux openvpn client

## Requirements

None

## Role Variables

Available variables are listed below, along with default values (see ```defaults/main.yml```)
```shell
service: openvpn-client@client #openvpn@client on debian based distros
config_file: /etc/openvpn/client/client.conf #/etc/openvpn/client.conf on debian based distros

location: <expressvpn_connection_location>
# location examples include: usa-sanfrancisco, usa-washingtondc, usa-denver, canada-montreal, uk-london, switzerland, hongkong-1, india-sg, malaysia
```
## Dependencies

None

## Example Playbook
```yaml
    - hosts: all
      roles:
        - switch_location
```

## Author Information

This playbook was created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/)
