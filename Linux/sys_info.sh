#!/bin/bash

output=$HOME/my_script/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type f -perm 777 2> /dev/null)

if [ ! -d $HOME/my_script ]
then
mkdir $HOME/my_script
fi

if [ -f $output ]
then
rm $output
fi

echo "A Quick System Audit Script" >> $output
date >> $output
echo "Machine Type Info: " >> $output
echo - "$MACHTYPE \n" >> $output
echo -e "$ip \n" >> $output
lscpu | grep CPU >> $output

for exex in ${execs[@]}:
do
echo $exec
done

files=('/etc/passwd' '/etc/shadow')

for file in ${file[@]};
do 
ls -l $file >> $output
done

echo -e "\nThe permissions for sensitive /etc file: \n" >> $output
for file in ${files[@]}
do
ls -l $file >> output
done
