# Install OpenVPN Client (for ExpressVPN)
![openvpn](https://img.shields.io/badge/-OpenVPN-EA7E20?style=flat&logo=openvpn&logoColor=white)
![expressvpn](https://img.shields.io/badge/-ExpressVPN-DA3940?style=flat&logo=expressvpn&logoColor=white)
[![playbook](https://img.shields.io/badge/Ansible%20Playbook-grey?stype=flat&logo=ansible&logoColor=EE0000)](site.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/install_openvpn)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/install_openvpn)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/install_openvpn)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/install_openvpn)](LICENSE)
## Purpose

This play is for installing the openvpn client and tailoring it for an ExpressVPN connection.

## Requirements

community.general<br>
ansible.posix

## Role Variables

Default variables for the install_openvpn role are listed below (see ```defaults/main.yml```)<br>
Values for the variables can be found by going to ExpressVPN manual setup instructions at https://www.expressvpn.com/setup#manual

```shell
auth:
  - <expressvpn_manual_setup_username>
  - <expressvpn_manual_setup_password>
location: <expressvpn_connection_location>
# location examples include: usa-sanfrancisco, usa-washingtondc, usa-denver, canada-montreal, uk-london, switzerland, hongkong-1, india-sg, malaysia
```
## Dependencies

None

## Example Playbook
```yaml
    - hosts: all
      roles:
        - install-openvpn
```

## Author Information

This playbook was created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/)
