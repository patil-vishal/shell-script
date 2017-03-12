#!/bin/bash
#Wed Dec 21 15:02:37 IST 2016#
#purpose packages installation#

if [[ -z /tmp/packages ]]; then
	echo "kindly mention packages in /tmp/packages file eg. libexec-*"
	exit 1
else
	while read line
	     do 
		yum install $line -y
	     done < /tmp/pack
	echo 
fi
