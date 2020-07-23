#!/bin/bash
#for Ubuntu 18 and latest
adr=$(ip addr | grep 192.168 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
name=$(hostname)
echo $adr $name
