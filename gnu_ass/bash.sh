#!/bin/bash

infile1='params.txt'
infile2='threads.txt'

numelements=`cat $infile1`
threads=`cat $infile2`
sum=0
sum1=0
avg=0
var=0
for element in $numelements
do 
	for thread in $threads
	do
		sum=0
		sum1=0	
		for i in {1..100}
		do	
			
			read store <<< $(./cs251.ex1 $element $thread)
			tim=`echo $store | cut -d " " -f4`
			echo $element $thread $tim >> result.txt
			sum=$(($sum + $tim))
			sum1=$(($sum1 +($tim * $tim)))
			
		done 
		avg=$(($sum/100))
         	var=$((($sum1/100)-($avg * $avg)))
		
		sd=$(echo "sqrt ($var)" | bc -l)
		echo $element $thread $avg $var $sd >> avg.txt
		echo -n $element $thread $avg $var $sd >> avg1.txt
	done
	echo >> avg1.txt
done
