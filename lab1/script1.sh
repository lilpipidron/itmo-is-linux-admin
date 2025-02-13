#!/usr/bin/env bash

> work3.log

#1
while IFS=: read -r username _ uid _; do 
  echo "user $username has ud $uid" >> work3.log
done < /etc/passwd

#2
sudo chage -l root | head -1 >> work3.log

#3
groups=""  

while IFS=: read -r groupname _; do
  groups+="$groupname,"  
done < /etc/group

groups=${groups%,}

echo groups >> work3.log

#4
sudo echo "Be careful!" > /etc/skel/readme.txt

#5
sudo useradd u1 -p $(openssl passwd -salt xx 12345678)

#6
groupadd g1

#7
sudo usermod -a -G g1 u1

#8
id u1 >> work3.log

#9
sudo usermod -a -G g1 myuser

#10
getent group g1 | cut -d: -f4 >> work3.log

#11
sudo usermod -s /usr/bin/mc u1

#12
sudo useradd u2 -p $(openssl passwd -salt xx 87654321)

#13
sudo mkdir /home/test13
sudo cp work3.log /home/test13/work3-1.log
sudo cp work3.log /home/test13/work3-2.log

#14
sudo groupadd test13_group
sudo usermod -aG test13_group u1
sudo usermod -aG test13_group u2
sudo chown u1:test13_group /home/test13
sudo chmod 750 /home/test13
sudo chown u1:test13_group /home/test13/*
sudo chmod 640 /home/test13/*
sudo chmod a-x /home/test13/*

#15
sudo mkdir /home/test14
sudo chown u1:u1 /home/test14
sudo chmod 1777 /home/test14

#16
sudo cp /bin/nano /home/test14/nano
sudo chmod a+rx /home/test14/nano
sudo chmod a+rw /home/test13/work3-1.log
sudo chmod a+rw /home/test13/work3-2.log

#17
sudo mkdir /home/test15
echo "123" >> /home/test15/secret_file
sudo chmod 700 /home/test15
sudo chmod 644 /home/test15/secret_file

#18
echo "u1 ALL=(ALL) NOPASSWD: /usr/bin/passwd [A-Za-z0-9_-]*" | sudo EDITOR='tee -a' visudo
