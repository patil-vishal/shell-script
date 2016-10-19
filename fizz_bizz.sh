#!/bin/bash
##Wed Oct 19 10:36:46 PDT 2016##

num=1
while [[ $num -le 100 ]]
do
#i=$(($num%3)) 
   if [[ $(($num%3)) -eq 0 ]];then
	echo "$num is Fizz "

   elif [[ $(($num%5)) -eq 0 ]];then
	echo "$num is Buzz"

   elif [[ $(($num%3)) -eq 0 ]] && [[ $(($num%5)) -eq 0 ]];then
	echo "$num is FizzBuzz"

   else 
	echo $num
    fi
 let num=$num+1
done
