#!/bin/bash

i=0;
for num in $(shuf -i 0-99 -n $1) 
do
	i=$((i + 1))
	operator="-"
	if [ $(($i % 4)) == 0 ] || [ $(($i % 4)) == 5 ]
	then
		operator="+"
	fi
	num2=$(shuf -i 0-30 -n 1) 

	if [ $operator == "+" ]
	then
		echo $num "+" $num2;
	elif [ $operator == "-" ];
	then
		if [ "$num2" -gt "$num"  ]
        	then
			echo $num2 "-" $num;
		else
			echo $num "-" $num2;
		fi

	else
		echo "error"; 
	fi

done


