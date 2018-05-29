#!/bin/bash



function check_result() {
	STATUS=$1
	if [ $STATUS -eq 0 ]; then
		msg_ok "Project $2 created correctly"
	else
		msg_ko "failed creating project $2"
		exit 1
	fi
}

function check_mv() {
	STATUS=$1
	if [ $STATUS -eq 0 ]; then
		msg_ok "Config file $2 moved correctly to config server"
	else
		msg_ko "failed moving config file $2 to config server"
		exit 1
	fi
}

function check_mvn_install() {
	STATUS=$1
	if [ $STATUS -eq 0 ]; then
		msg_ok "Project $2 installed correctly "
	else
		msg_ko "failed installing project $2"
		exit 1
	fi
}