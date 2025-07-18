# **Ansible Role:** Zabbix Agent (Linux)
[![Ansible Role](https://img.shields.io/badge/ansible%20role-lpwoodhouse.zabbix_agent_linux-blue.svg)](https://galaxy.ansible.com/lpwoodhouse/zabbix_agent_linux/)
[![GitHub tag](https://img.shields.io/github/tag/lpwoodhouse/zabbix-agent-linux.svg)](https://github.com/lpwoodhouse/zabbix-agent-linux/tags)
[![License](https://img.shields.io/badge/license-MIT-green?sytle=flat)](LICENSE)

## Description

This role downloads, installs and configures the Zabbix Agent on RHEL, Debian, Ubuntu, SLES and ARM-based distros (Raspbian, Ubuntu-arm64)
After installation the zabbix-agent service will be enabled and started. To view the status (or disable/stop):

```shell
systemctl status zabbix-agent.service
```

The role will open the assigned Zabbix agent passive port on hosts running firewalld or ufw.<br>
To confirm firewall status after install use these commands:

```shell
#firewalld
sudo firewall-cmd --list-all

#ufw
sudo ufw status verbose
```

## Requirements

Ansible modules from the collections below are utilized. Ensure there is a requirements file if they are not already available.

```yaml
# Example /roles/requirements.yml
---
collections:
  - community.general
  - ansible.posix
```

## Role Variables

The values for default variables are listed below (see [`defaults/main.yml`](defaults/main.yml)). Ensure they are overwritten with the values you require. See [here](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable) for guidence on variable placement.

```yaml
zbx_version: 6.2 # Used to configure the Zabbix download repository, at time of writing the latest version is 6.2
zbx_server: 192.168.1.1 # IP Addr or FQDN of your Zabbix server
zbx_passive_port: 10050 # Zabbix server will request agent on this port
zbx_active_port: 10051 # Active agent will request Zabbix server on this port
```

## Dependencies

None

## Example Playbook

```yaml
- hosts: all
  roles:
   - lpwoodhouse.zabbix_agent_linux
```

## Author Information

Created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/).

[![Linkedin Badge](https://img.shields.io/badge/-LeeWoodhouse-0A66C2?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/lee-woodhouse-58056118b/)](https://www.linkedin.com/in/lee-woodhouse-58056118b/)
[![Reddit Badge](https://img.shields.io/badge/-lpwoodhouse-FF4500?style=flat&logo=Reddit&logoColor=white&link=https://www.reddit.com/user/lpwoodhouse)](https://www.reddit.com/user/lpwoodhouse)
[![Twitter Follow](https://img.shields.io/twitter/follow/babswoodhouse?style=social)](https://twitter.com/intent/follow?screen_name=babswoodhouse/)
