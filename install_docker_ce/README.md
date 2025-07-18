# Install Docker CE and Portainer
![Docker](https://img.shields.io/badge/-Docker-2496ED?style=flat&logo=docker&logoColor=white)
![Portainer](https://img.shields.io/badge/-Portainer-13BEF9?style=flat&logo=portainer&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-black?style=flat&logo=linux)
[![playbook](https://img.shields.io/badge/Ansible%20Playbook-grey?stype=flat&logo=ansible&logoColor=EE0000)](site.yml)
![GitHub last commit](https://img.shields.io/github/last-commit/lpwoodhouse/install_docker_ce)
![GitHub repo file count](https://img.shields.io/github/directory-file-count/lpwoodhouse/install_docker_ce)
![GitHub top language](https://img.shields.io/github/languages/top/lpwoodhouse/install_docker_ce)
[![GitHub](https://img.shields.io/github/license/lpwoodhouse/install_docker_ce)](LICENSE)
## Purpose

This play is for installing docker (community edition) and portainer on a linux hosts<br>

## Requirements

collections:<br>
  - community.docker

## Role Variables

Default role variables for the install_portainer role are listed below (see ```defaults/main.yml```)
```shell
centos_baseurl: https://download.docker.com/linux/centos/docker-ce.repo
docker_packages:
  - docker-ce
  - docker-ce-cli
  - containerd.io
  - docker-compose-plugin
docker_users:
  - ansible
```
Default role variables for the install_portainer role are listed below (see ```defaults/main.yml```)
```shell
dockerhub_user: <value>
dockerhub_pass: <value>
```
## Dependencies

None

## Example Playbook
```yaml
    - hosts: all
      become: true
      roles:
        - install_docker
        - install_portainer
```

## Author Information

This playbook was created in 2022 by [Lee Woodhouse](https://www.leewoodhouse.com/)
