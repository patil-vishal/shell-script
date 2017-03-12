#!/bin/bash
#Wed Dec 21 12:17:41 IST 2016#
#purpose yum repo creation and package installation#

logfile=/tmp/scrip.log
repofile=/etc/yum.repos.d/base.repo

check_version () {

grep 7 /etc/redhat-release
}

yum_file () {

mkdir /packages
echo '[base]' >> $repofile
echo 'name=base' >> $repofile
echo 'baseurl="file:///packages/"' >> $repofile
echo 'gpgcheck=0' >> $repofile
}

packages_copy () {
mkdir /mnt2
mount  /mnt2
cp -r /mnt2/*.rpm /packages
}

repo_config () {
cd /packages
rpm -ivh python-deltarpm-3.6-3.el7.x86_64.rpm
rpm -ivh deltarpm-3.6-3.el7.x86_64.rpm
rpm -ivh createrepo-0.9.9-23.el7.noarch.rpm
createrepo .
}

iptables -F
echo "yum repo configuration is started" >> $logfile
check_version >> $logfile
if [[ $? -eq 0 ]]; then
yum_file >> $logfile
  if [[ $? -eq 0 ]]; then
	packages_copy >> $logfile
	if [[ $? -eq 0 ]]; then
		repo_config  >> $logfile
	fi
  fi
else 
echo "script was not successful" >> $logfile
fi
