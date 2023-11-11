#!/bin/bash
servers=$(cat servers)
echo -n "Enter the username: "
read userName
clear
for i in $servers; do
  sshpass -f pass_file ssh -q -t $USER@$i "hostname; sudo usermod -aG admins $userName"
done
echo
read -n1 -s -p "Checking? (y)es or (n)o " ans
echo
if [ $ans == 'y' ] ;then
  for i in $servers; do
    sshpass -f pass_file ssh -q -t $USER@$i "hostname; id $userName"
  done
fi
