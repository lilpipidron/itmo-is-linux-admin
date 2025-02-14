#!/usr/bin/env bash

#1
while IFS=: read -r username _ uid _; do 
  echo "user $username has ud $uid" >> work3.log
done < /etc/passwd

#2
chage -l root | head -1 >> work3.log

#3
groups=""  

while IFS=: read -r groupname _; do
  groups+="$groupname,"  
done < /etc/group

groups=${groups%,}

echo groups >> work3.log

#4
echo "Be careful!" > /etc/skel/readme.txt

#5
useradd -m -p $(openssl passwd -salt xx 12345678) u1

#6
groupadd g1

#7
usermod -aG g1 u1

#8
id u1 >> work3.log

#9
usermod -aG g1 myuser

#10
getent group g1 | cut -d: -f4 >> work3.log

#11
usermod -s /usr/bin/mc u1

#12
useradd -m -p $(openssl passwd -salt xx 87654321) u2

#13
mkdir /home/test13
cp work3.log /home/test13/work3-1.log
cp work3.log /home/test13/work3-2.log

#14
groupadd test13_group
usermod -aG test13_group u1
usermod -aG test13_group u2
chown u1:test13_group /home/test13
chmod 750 /home/test13
chown u1:test13_group /home/test13/*
chmod 640 /home/test13/*
chmod a-x /home/test13/*

#15
mkdir /home/test14
chown u1:u1 /home/test14
chmod 1777 /home/test14

#16
cp /bin/nano /home/test14/nano
chmod u+s /home/test14/nano

#17
mkdir /home/test15
echo "123" >> /home/test15/secret_file
chmod 700 /home/test15
chmod 644 /home/test15/secret_file

#18
echo "u1 ALL=(ALL) NOPASSWD: /usr/bin/passwd [A-Za-z0-9_-]*" > /etc/sudoers.d/u1
