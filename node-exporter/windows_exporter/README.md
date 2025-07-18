# **Ansible Role:** Windows Exporter
[![Ansible Role](https://img.shields.io/badge/ansible%20role-lpwoodhouse.windows_exporter-blue.svg)](https://galaxy.ansible.com/lpwoodhouse/windows_exporter/)
[![GitHub tag](https://img.shields.io/github/tag/lpwoodhouse/windows-exporter.svg)](https://github.com/lpwoodhouse/windows-exporter/tags)
[![License](https://img.shields.io/badge/License-MIT-green?sytle=flat)](LICENSE)

## Description

Downloads, installs and configures [Windows Exporter](https://github.com/prometheus-community/windows_exporter) for Windows.<br>
Similar to node_exporter for Linux machines, windows-exporter exposes hardware and OS metrics on Windows machines for scraping by Prometheus.<br>
This role configures windows-exporter for use with the Grafana [Windows-Exporter-Dashboard](https://grafana.com/grafana/dashboards/14694-windows-exporter-dashboard/) (ID: 14694)

## Requirements

Ansible modules from the collections below are utilized. Ensure there is a requirements file if they are not already available.

```yaml
# Example /roles/requirements.yml
---
collections:
  - community.windows
  - ansible.windows
```

## Role Variables

The values for default variables are listed below (see [`defaults/main.yml`](defaults/main.yml)). Ensure they are overwritten with the values you require. See [here](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable) for guidence on variable placement.

```yaml
# The release version of windows_exporter to download (e.g. latest, 0.19.0, 0.16.0)
# Not required if installing from an existing installer on either local or remote host
_windows_exporter_version: latest

# The path (on local or remote host) to an existing .msi installer for installing windows_exporter
# Must be blank quotes "" if the file is to be downloaded
_windows_exporter_msi_path: ""
# Must be true if the windows exporter .msi path is on the remote host and false is the path is on localhost
_windows_exporter_msi_remote_src: true

# The directory on the remote host to where the windows exporter .msi installer will be downloaded or copied to
_windows_exporter_download_dir: 'C:\Windows\Temp'
```

## Dependencies

None

## Example Playbook

```yaml
- hosts: all
  roles:
   - lpwoodhouse.windows_exporter
```

## Author Information

Created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/).

[![Linkedin Badge](https://img.shields.io/badge/-LeeWoodhouse-0A66C2?style=flat&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/lee-woodhouse-58056118b/)](https://www.linkedin.com/in/lee-woodhouse-58056118b/)
[![Reddit Badge](https://img.shields.io/badge/-lpwoodhouse-FF4500?style=flat&logo=Reddit&logoColor=white&link=https://www.reddit.com/user/lpwoodhouse)](https://www.reddit.com/user/lpwoodhouse)
[![Twitter Follow](https://img.shields.io/twitter/follow/babswoodhouse?style=social)](https://twitter.com/intent/follow?screen_name=babswoodhouse/)
