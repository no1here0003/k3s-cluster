#!/bin/sh +vx
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i hosts prepare.yml
