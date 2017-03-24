#!/bin/bash
#Fri Mar 24 15:58:17 IST 2017#
#author Vishal Patil #
## puprose check servser is alive or not ##


fline="========================================================="

#below command for input host file from user#
read -p "Enter host file path eg. /tmp/file :- " hfile

#below command for comma seperate#
sed 's/,/\n/g' $hfile > /tmp/hfile

echo $fline
#below command read each host from file
for line in $( cat /tmp/hfile )
do 
ping -c 2 $line  > /dev/null # this for check server is alive or not
if [[ $? -eq 0 ]]
	then
##below command will ssh in host and run argument and print output##
	ssh $line '( echo -e " \nbelow is server details\nhostname : `hostname`\nIP : `hostname -i` ")'	
	echo $fline
 	else
	echo " There is some issue in connection with $line. pls check network, dns or hostname of server"
	echo $fline
fi 
done 	

#below cmd for delete file#
rm -rf /tmp/hfile
