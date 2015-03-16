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

# update dyndns # TODO: curl

wget -O $tmpfile $updateurl

# add date and append to logfile

echo "["$(date)"]:   "$(cat $tmpfile) >> $logfile

# clean up

rm $tmpfile
