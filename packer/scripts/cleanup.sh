#!/bin/bash -eux

# Uninstall Ansible and remove PPA.

sudo yum remove ansible.noarch -y

sudo reboot
