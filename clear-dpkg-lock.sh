#!/bin/bash
list="/var/lib/apt/lists/lock \
	/var/cache/apt/archives/lock \
	/var/lib/dpkg/lock \
	/var/lib/dpkg/lock-frontend"

for file in $list
do
if [ -e $file ] 
then
  echo "$file ::cache exist"
else
  echo "$file ::empty"
fi 
done
echo "..."

echo "delete lock-cache? (yes)"

read answ

if [ $answ == "yes" ]
then sudo rm /var/lib/apt/lists/lock && \
	sudo rm /var/cache/apt/archives/lock && \
	sudo rm /var/lib/dpkg/lock && \
	sudo rm /var/lib/dpkg/lock-frontend

count=0
total=34
pstr="[=======================================================================]"

while [ $count -lt $total ]; do
  sleep 0.025
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
  
done
echo "::done"

else
echo "canceled"
fi
