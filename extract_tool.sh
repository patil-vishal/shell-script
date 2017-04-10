#!/bin/bash
#Mon Apr 10 16:14:31 IST 2017
#Author ##Vishal Patil##

#########################################################################################################
#  		Before run/execute this script copy this script and your file in same directory		#
#		Warning : Kindly don't change below code						#
#########################################################################################################


tar_extract () {
tar -xvf $fname
}

tar_gz () {
tar -zxvf $fname
}

gz_file () {
gunzip $fname
}

bz_file () {
bunzip2 $fname
}

zip_file () {
unzip $fname 
}

read -p " Enter your file name or " fname

if [[ -z $fname ]]; then
echo "Enter valid file name " && exit
else 
	ls $fname | egrep '{.tar|.bz2|.gz|.tgz|.zip}'  &> /dev/null
	if [[ $? -eq 0 ]]; then
	case $fname in
	
		*.tgz)
			tar_gz
			;;
		*.tar)
			tar_extract
			;;
		*.gz)
			gz_file
			;;
		*.bz2)
			bz_file
			;;
		*.zip) 
			zip_file
			;;
	esac
	else 
	echo "Please enter valid file with valid format/extention eg. .tar,.bz2,.zip,.gz,.tgz"
	fi
fi
