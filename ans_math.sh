#!/bin/bash

i=0;
p_c_sum=""
p_c_sum_a=""
date > out.txt
date > out_ans.txt

if [ "$1" == "STOP" ]
then
	echo "Stoped"
else
	for num in $(shuf -i 0-1999 -n $1)
	do
		c_sum=""
		c_sum_a=""
		i=$((i + 1))
		operator="-"
                if [ "$2" == "X" ] && [ $(($i % 4)) == 0 ]
                then
			arr=(10 12 14 15 16 18 20 22 24 24 26 27 28 30 32 34 36 38 48)
                        num_pos=$(shuf -i 0-18 -n 1)
			num=${arr[num_pos]}
                        operator="/"
                elif [ "$2" == "X" ] && [ $(($i % 2)) == 0 ]
		then
			num=$(shuf -i 3-12 -n 1)
			operator="X"
		elif [ $(($i % 6)) == 0 ] || [ $num -ge 500 ]
		then
			operator="+"
		fi

                if [ $operator == "+" ]
		then
			num2=$(shuf -i 0-499 -n 1)
			c_sum="$i) $num + $num2=_____";
			let ans=$num+$num2
			c_sum_a="$i) $num + $num2=$ans";
		elif [ $operator == "-" ];
		then
			num2=$(shuf -i 0-599 -n 1) 
			if [ "$num2" -gt "$num"  ]
        		then
				c_sum="$i) $num2 - $num=_____";
				let ans=$num2-$num
				c_sum_a="$i) $num2 - $num=$ans";
			else
				c_sum="$i) $num - $num2=_____";
				let ans=$num-$num2
				c_sum_a="$i) $num - $num2=$ans";
			fi
		elif [ $operator == "X" ]
		then
			num2=$(shuf -i 0-10 -n 1) 
			c_sum="$i) $num X $num2=_____";
			let ans=$num*$num2
			c_sum_a="$i) $num X $num2=$ans";

                elif [ $operator == "/" ]
                then
	               num2=2 
		        if [[ $(($num % 6)) == 0 ]] 
                        then
 				num2=6
			elif [ $(($num % 4)) == 0 ]
			then
				num2=4
			elif [ $(($num % 3)) == 0 ]
			then
				num2=3

			else
 				num2=2
			fi
			c_sum="$i) $num / $num2=_____";
			#echo let ans=$num/$num2
			let ans=$num/$num2
			c_sum_a="$i) $num / $num2=$ans";
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

fi
