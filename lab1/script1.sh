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

