#!/usr/bin/env bash

sudo rm work3.log

sudo rm /etc/skel/readme.txt

sudo groupdel g1 

sudo usermod -s /bin/bash u1

sudo userdel u1

sudo userdel u2

sudo rm -rf /home/test13

sudo groupdel test13_group

sudo rm -f /etc/sudoers.d/u1

sudo rm -rf /home/test13

sudo rm -rf /home/test14

sudo rm -rf /home/test15
