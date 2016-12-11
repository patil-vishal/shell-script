#!/bin/bash
#Sat Dec 10 22:51:00 PST 2016
#author vishal patil#
#backup purpose#

ddate=`date +%F`
logs=/var/log/backup.log
lock_file=/tmp/$0.lock

read -p "Enter path of file for backup eg. /var/www :-" backup_path
read -p "Enter backup file name eg. abc-bkp or apache-bkp " backup_name

trap '{rm -rf $lock_file; exit 1;}' INT TERM

cleanup () {
echo "cleanup process is started" >> $logs
rm -rf $lock_file
echo "cleanup process is complited" >> $logs
}

backup () {
echo " backup proccess is going to start" >> $logs
tar -zcvf /tmp/$backup_name-$ddate.tgz  $backup_path >> $logs
echo "backup proccess is comlited" >> $logs
}

if [[ ! -f $lock_file ]]; then 
	backup
	   if [[ $? -eq 0 ]];then
          	cleanup
	   else 
		echo "backup is fialed" >> $logs
		cleanup
	   fi
else
	echo "backup is already running" >> $logs
fi

