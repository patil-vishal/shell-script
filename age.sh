#!/bin/bash
#Wed Apr  5 11:46:44 IST 2017
#author ##vishal Patil##
#purpose : this script will tacke input from user and print their age ##

ddate=`date +%Y`
mdate=`date +%m`
read -p "Hi, Please enter your birth year  eg. YYYY/1990 : " byear
read -p "Hi, Please enter your birth month  eg. MM/01 : " bmnth

if [[ -z $byear ]];then ##check empty input or not ###
	echo " Invalide argument " && exit
elif [[ -z $bmnth ]];then ##check empty input or not ###
	echo " Invalide argument " && exit
elif [[ ! $byear =~ ^-?[0-9]+$ ]];then ##check input is integer or not ###
	echo " Invalide argument, please endter proper number eg. 1990" && exit
elif [[ ! $bmnth =~ ^-?[0-9]+$ ]];then ##check input is integer or not ###
	echo " Invalide argument, please endter proper number eg. 01" && exit
fi
yage=`expr $ddate - $byear`
mage=`expr $mdate - $bmnth`
if [[ $mage -le 0 ]]; then
month=`expr 12 - $bmnth + $mdate`
year=`expr $yage - 1`
else
month=$mage
year=$yage
fi
echo " hi your totale age is $year years and $month months"
