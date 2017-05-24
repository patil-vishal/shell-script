#!/bin/sh
#Wed May 24 12:15:27 IST 2017


################################################################
#							       #
#    Author :- vishal patil				       #
#    Purpose :-  devops assignment			       #
#   							       #
################################################################


read -p "Enter Derectory path eg. /tmp :-  "  dfile   ##User Input Derectory###
ls  -l $dfile | grep ^- | awk '{if ($5 != 0) print $9}' > /tmp/regular_file ##to fine regular files only##
cd $dfile
while read i ; do
	while read j; do
		diff $i $j &> /dev/null  ##to compare files###
			if [[ $? -eq 0 ]]; then
			echo "$j" >> /tmp/duplicate_file
			fi
	done < /tmp/regular_file
        main_file=`sort /tmp/duplicate_file | head -1` ##Find file in alphabetical order##
	grep -v $main_file /tmp/duplicate_file > /tmp/duplicate_file1
	while read line;do
		rm -rf $line && ln $main_file $line ## to remove duplicate file and create hardlink of that file##
	done < /tmp/duplicate_file1
	rm -rf /tmp/duplicate_file && rm -rf /tmp/duplicate_file1
done < /tmp/regular_file
rm -rf /tmp/regular_file
