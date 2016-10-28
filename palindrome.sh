#!/bin/bash
#Tue Oct 25 12:47:59 IST 2016
#purpose : check number is palindrome or not

read -p "Enter a Number : - " i
n=$(echo $i|rev)

if [[ -z $i ]] ## check input is empty or not ##
then 
	echo "Input is not valid, Please enter valid number"
	exit 1
elif [[ ! $i =~ ^-?[0-9]+$ ]] ## check input is integer or not ##
then    
        echo "Invalide Input, please enter porper number"
        exit 1
elif [[ $i = $n ]]
then 
	echo "$i is palindrome number"
else 
	echo "$i is not palindrome number"
fi


