#!/bin/bash

i=0;
p_c_sum=""
p_c_sum_a=""
date > out.txt
date > out_ans.txt

for num in $(shuf -i 0-99 -n $1) 
do
	c_sum=""
	c_sum_a=""

	i=$((i + 1))
	operator="-"
	if [ $(($i % 4)) == 0 ] || [ $(($i % 4)) == 5 ]
	then
		operator="+"
	fi
	num2=$(shuf -i 0-30 -n 1) 

	if [ $operator == "+" ]
	then
		c_sum="$num+$num2=___";
		let ans=$num+$num2
		c_sum_a="$num+$num2=$ans";
	elif [ $operator == "-" ];
	then
		if [ "$num2" -gt "$num"  ]
        	then
			c_sum="$num2-$num=___";
			let ans=$num2-$num
			c_sum_a="$num2-$num=$ans";
		else
			c_sum="$num-$num2=___";
			let ans=$num-$num2
			c_sum_a="$num-$num2=$ans";
		fi

	else
		echo "error"; 
	fi
	p_c_sum="$p_c_sum\t$c_sum"
	p_c_sum_a="$p_c_sum_a\t$c_sum_a"
	if [ $(($i % 3)) == 0 ]
	then
		echo -e $p_c_sum >> out.txt
		echo -e $p_c_sum_a >> out_ans.txt
		p_c_sum=""
		p_c_sum_a=""
	fi
done


