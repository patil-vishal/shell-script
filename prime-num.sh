#!/bin/bash
#date 19th Oct 2016#
#Author #Vishal Patil##
# purpose : for verify number is prime or not #

i=2
no=1

read -p "Press number :- " num

if [[ -z $num ]] ## check empty input or not ##
then
        echo " Invalide argument "
        exit 1
elif [[ ! $num =~ [0-9] ]] ## check input is integer or not ##
then    
        echo "Invalide argument, please enter porper number"
        exit 1
elif [[ $num -lt 0 ]] ## check input is less than zero or not ##
then 
        echo "Invalide Input"
        exit 1
fi
while [ $i -le `expr $num / 2` -a $no -ne 0 ];
 do
        no=`expr $num % $i`
        i=`expr $i + 1`
 done
if [ $num -ne 0 ] ## check output is not equals to zero ##
then 
        echo "$num is prime"
else
        echo "$num in not prime"
fi
