#!/bin/sh
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts elastic_setup.yml
