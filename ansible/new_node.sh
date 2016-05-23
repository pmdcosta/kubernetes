#!/usr/bin/env bash

# Manual
echo '>> Dont forget to set new node addresses on inventory file, and master addresses on group_vars'
sleep 5

# Get CA
ssh core@kube-master.qold.co 'cat ~/ssl/ca/ca.pem' > roles/node/files/ca.pem
ssh core@kube-master.qold.co 'cat ~/ssl/ca/ca-key.pem' > roles/node/files/ca-key.pem

# Provision node
ansible-playbook -i inventory node.yml
