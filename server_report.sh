#!/bin/bash
#Sat Oct  8 12:08:53 UTC 2016
#author : Vishal  Patil

line="======================================"
system_load=$(w | awk ' /up /{print $9  }')
system_up=$(w | awk ' /up/ {print $3 }')
today=`date`
curr_memory=$(free -m | awk '/Mem/ {print $3 }')
count_user=$(w | awk '/up/ {print $4}')


echo " $today "
echo $line

echo " current system load is $system_load "
echo $line

echo " system up form  $system_up"
echo $line

echo " current available memory is $curr_memory MB "
echo $line

echo " currunt disk status"
echo "$(df -hT | column -t) "
echo $line

echo "currunt number of login  user $count_user"
echo $line
