#!/bin/bash
ssh-keygen -t ed25519 -C "ansible@rancher.local"
servers=$(cat servers)
for i in $servers; do
  sshpass -f pass_file_ansible ssh-copy-id -i ~/.ssh/id_ed25519.pub ansible@$i
done
