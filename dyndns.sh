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

source "$configfile"

#########################
#	update state	#
#########################

status="$(curl -s -L ${url})"

# log results and exit

exec "${loggerpath}" -f "${logfile}" "dyndns refresh: $status"

exit 0
