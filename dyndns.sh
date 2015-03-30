#!/bin/bash

set -e

#########################################################################
#	This script updates the dyndns entry and saves a small log	#
#	----------------------------------------------------------	#
#	usage:	see README.md						#
#	----------------------------------------------------------	#
#	this work is licensed under a cc by nc sa 4.0 license		#
#	more informations: https://github.com/sedrubal/dyndns-refresh	#
#########################################################################

#########################
#	config:		#
#########################

configfile='config.cfg'

source "$(dirname $0)/$configfile"

#########################
#	update state	#
#########################

status="$(curl -s -L ${url})"

# log results and exit

if [[ ! -z $1 && "$1" -eq "-v" ]] ; then
	echo "${status}"
fi

exec "${loggerpath}" -f "${logfile}" "dyndns-refresh: $status"

exit 0
