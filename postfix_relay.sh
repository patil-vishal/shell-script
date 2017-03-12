#!/bin/bash
##Mon Feb 27 13:10:32 IST 2017
##purpose ## configure relay server##
##author Vishal Patil ###

postfix_file=/etc/postfix/main.cf

read -p "Enter relay server IP address  :-  " realay_ip

##for package installation##
package_install () {
yum install postfix-* -y
}

##postfix configuration#
postfix_conf () {
cp $postfix_file $postfix_file-bkp 
echo 'transport_maps = hash:/etc/postfix/transport' >> $postfix_file
}

##for smtp relay server define#
postfix_transport () {
cp /etc/postfix/transport /etc/postfix/transport_bkp
echo "*  smtp:$realay_ip" >> /etc/postfix/transport
postmap hash:/etc/postfix/transport
postfix reload
}

rpm -qa | grep  -i postfix
        if [[ $? -eq 0 ]]; then
                postfix_conf
		postfix_transport
	else
 		package_install
        fi
