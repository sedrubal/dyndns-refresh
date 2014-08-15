#!/bin/bash

#########################################################################
#	This script updates the dyndns entry and saves a small log	#
#	----------------------------------------------------------	#
#	usage:	see README.md						#
#	----------------------------------------------------------	#
#	this work is licensed under a cc by nc sa 4.0 license		#
#	more informations: https://github.com/sedrubal/dyndns-refresh	#
#########################################################################

#########################
#	settings:	#
#########################

updateurl="http://svc.joker.com/nic/update?username=johndoe&password=1234&hostname=foobar.com"
logfile="/var/log/dyndns-refresh.log"

tmpfile="/tmp/dyndns"
logfilelength=100

#########################
#			#
#########################

# update dyndns

wget -O $tmpfile $updateurl

# add date and append to logfile

echo "["$(date)"]:   "$(cat $tmpfile) >> $logfile

# clean up

rm $tmpfile

#  shorten logfile

line=$(awk 'END {print NR}' $logfile)
re='^[0-9]+$'
if ! [[ $line =~ $re ]] ; then
	echo "[error] line is not a number" >&2; exit 1
elif [ $line -gt $logfilelength ] ; then
#	echo "[i] logfile is too larg and will be shorten. Number of lines: " $line
#	awk '{i += (length() + 1); if (i <= 10) print $ALL}' $logfile > $logfile # TODO
	echo "[info] logfile is large now. Please shorten it"
fi
