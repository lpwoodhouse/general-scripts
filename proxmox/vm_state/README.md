# Proxmox Change VM Guest Power State
![proxmox](https://img.shields.io/badge/-ProxmoxVE-black?style=flat&logo=proxmox)
[![playbook](https://img.shields.io/badge/Ansible%20Playbook-grey?stype=flat&logo=ansible&logoColor=EE0000)](site.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/proxmox_vm_state)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/proxmox_vm_state)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/proxmox_vm_state)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/proxmox_vm_state)](LICENSE)
## Purpose

This play is for changing the power state of a pve hosted virtual machine guest
(eg stopped, restarted)

## Requirements

community.general

## Role Variables

Default role variables for the pve_vm_state role are listed below (see ```defaults/main.yml```)
```shell
proxmox_host: 192.168.0.1
proxmox_user: root@pam
proxmox_password: password
vm_guest:
  - name: vm01
    state: started # options: present,stopped,started,absent,restarted,current
  - ...etc...
```
## Dependencies

None

## Example Playbook
```yaml
    - hosts: localhost
      roles:
        - pve_vm_state
```

## Author Information

This playbook was created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/)
