#!/bin/bash
i=0;
for num in $(shuf -i 0-99 -n 10) 
do
	i=$((i + 1))
	operator="-"
	if [ $(($i % 4)) == 0 ] || [ $(($i % 4)) == 5 ]
	then
		operator="+"
	fi

	outtxt=""
	num2=$(shuf -i 0-30 -n 1)
	if [ "$num2" -gt "$num"  ]
	then
		if [ "$num2" -lt 10 ]
		then
			num2="0$num2"	
		fi
		if [ "$num" -lt 10 ]
		then
			num="0$num"	
		fi
		printf "$i)  $num2 $operator $num = _____\t"

	else
		if [ "$num2" -lt 10 ]
		then
			num2="0$num2"	
		fi
		if [ "$num" -lt 10 ]
		then
			num="0$num"	
		fi
		printf "$i)  $num $operator $num2 = _____\t"

	fi
	if [ $(($i % 3)) == 0 ]
	then
		echo ""
		echo ""
	fi
done

#echo "$ # column out.txt > out3.txt ./math.sh > out.txt "
