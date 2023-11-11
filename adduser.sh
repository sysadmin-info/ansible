#!/bin/bash
servers=$(cat servers)
echo -n "Enter the username: "
read userName
echo -n "Enter the user uid: "
read userUID
echo -n "Enter the password: "
read -s passwd
clear
for i in $servers; do
  sshpass -f pass_file ssh -q -t $USER@$i "hostname; sudo useradd -m -u $userUID $userName -d /home/$userName -s /bin/bash && echo '$userName:$passwd' | sudo chpasswd"
  if [ $? -eq 0 ]; then
    echo "User '$userName' added on '$i'" || echo "User '$userName' already exists on '$i'"
  else
    echo "Error on $i"
  fi
done
echo
read -n1 -s -p "Checking? (y)es or (n)o " ans
echo
if [ $ans == 'y' ] ;then
  for i in $servers; do 
    sshpass -f pass_file ssh -q -t $USER@$i "hostname; id $userName"
  done
fi
