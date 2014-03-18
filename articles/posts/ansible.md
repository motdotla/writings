# Getting started w/ Ansible

Ansible is a great way to manage your servers. In this post I will show you how to get started.

Let's begin by installing ansible.

```
cd /tmp
git clone git://github.com/ansible/ansible.git
cd ./ansible
git checkout v1.4.3
sudo make install
sudo easy_install jinja2 
sudo easy_install pyyaml
sudo easy_install paramiko
```

Create a new droplet on Digital Ocean.

```
mkdir ansible-dogecoind
cd ansible-dogecoind
vim hosts
```

Inside hosts paste the following. Replace `101.101.101.101` with the IP address of the droplet you just created.

```
[webservers]
101.101.101.101
```

Save that.

```
vim playbook.yml
```

Paste the following into playbook.yml.

```
---

- name: Ansible Playbook for installing dogecoind on Digital Ocean

  hosts: webservers
  roles:
    - dogcoind
  user: root
  sudo: true
```

Save that.

```
mkdir roles
cd roles
mkdir dogcoind
cd dogcoind
mkdir tasks
cd tasks
vim main.yml
```

Inside that file paste the following.

```

```



