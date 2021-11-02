#!/bin/bash

months=("jan" 'feb' 'mar' 'apr' 'may')
days=('mon' 'tue' 'wed' 'thu' 'fri')

for month in ${months[@]};
do echo $month
done

for day in ${days[@]};
do
if [ $day = 'wed' ]
then
echo "midweek"
else
echo "not wed"
fi
done

for num in {0..5};
do
if [ $num = 1 ] || [ $num = 4 ]
then
echo $num
fi
done
