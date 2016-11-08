#!/bin/bash
##Sun Nov  6 08:33:33 PST 2016
#author ##Vishal Patil##
#purpose #to prynt line in pyramid##
n=5
 #outer loop is for printing number of rows in the pyramid
  for((i=0;i<=n;i++))
  do
	for ((k=i;k<=n;k++))
	  do
	   	echo -ne " "
	  done
	for ((j=0;j<=i;j++))
	  do
		printf "*"
	  done
	for ((l=0;l<=i;l++))
	  do
	  printf "*"
	  done
    echo ""
  done
