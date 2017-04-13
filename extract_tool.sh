#!/bin/bash
#Mon Apr 10 16:14:31 IST 2017
#Author ##Vishal Patil##

#########################################################################################################
#  		Before run/execute this script copy this script and your file in same directory		#
#		Warning : Kindly don't change below code						#
#########################################################################################################

whiptail --title "Extract tool" --msgbox "Welcome to extract tool. Press enter to continue"  10 60
while true ; do
#whiptail --title "Extract tool" --msgbox "Welcome to extract tool. Press enter to continue"  10 60

ftype=`whiptail --title "Compression Type" --radiolist "Choose compression type" 20 50 5 "tar" "to extract tar file" ON "tgz" "to extract tar.gz file" OFF "zip" "to extract zip file" OFF "gzip" "to extract gzip file" OFF "bzip2" "to extract bzip2 file" OFF 3>&1 1>&2 2>&3`
if [[ $? -ne 0 ]]; then
	echo "Thanks for using extract tool" && break 
else 
fname=`whiptail --inputbox "Enter file name" 8 78 "eg. abc.tgz" --title "File Name" 3>&1 1>&2 2>&3`
	if [[ $? -ne 0  ]]; then
	 echo "Thanks for using extract tool" && break
	else
	if [[ -z $fname ]]; then
	whiptail --title "Warning!" --msgbox "There is some problem in file name/type. Please enter valid file $ftype type"  10 60 && continue
	else
	fname1=`ls $fname | awk -F. '{ print $NF }'` 
	fi
if [[ $ftype = $fname1 ]]; then 
			case $fname in
			
				*.tgz)
					tar -zxvf  $fname
					;;
				*.tgz.gz)
					tar -zxvf  $fname
					;;
				*.tar)
					tar -xvf  $fname
					;;
				*.gz)
					gunzip $fname
					;;
				*.bz2)
					bunzip2 $fname
					;;
				*.zip) 
					unzip  $fname
					;;
			esac
			break
else
     whiptail --title "Warning!" --msgbox "There is some problem in file name/type. Please enter valid file $ftype type"  10 60 &&  continue
		fi
	fi
fi
done
