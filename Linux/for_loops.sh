#!/bin/bash

states=('Hawaii' 'Virginia' 'Alaska' 'Idaho' 'Florida')
num=$(echo {0..9})

for state in ${states[@]}
do
if [ $state == 'Hawaii' ];
then
echo "Hawaii is the best!"
else
echo "I'm not a fan of Hawaii."
fi
done

for num in ${nums[@]};
do
if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
then
echo $num
fi
done