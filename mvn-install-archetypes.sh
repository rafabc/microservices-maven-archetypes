#!/bin/bash

. scripts/utils/colors.sh
. scripts/utils/simbols.sh
. scripts/utils/messages.sh

msg_task_gen "Launching maven install archetypes"
mvn -v

for d in * ; do
	if [[ ( $d == *"archetype-"* ) && ( -d $d ) ]]; then  #second if check if is a directory
		
		cd $d
		msg_task "Runing mvn install archetype $d"
		mvn clean install
		STATUS=$?
		if [ $STATUS -eq 0 ]; then
			msg_ok "archetype $d installed correctly"
		else
			msg_ko "failed installing archetype $d"
			exit 1
		fi
		
		msg_task "Updating maven catalog"
		mvn install archetype:update-local-catalog
		STATUS=$?
		if [ $STATUS -eq 0 ]; then
			msg_ok "catalog updated correctly"
		else
			msg_ko "failed updating catalog"
			exit 1
		fi
		cd ..
	fi
done


#DISABLED FOR FAST EXECUTION AND TESTING
#msg_task_gen "Runing crawl to build catalog"
#mvn archetype:crawl
#STATUS=$?
#if [ $STATUS -eq 0 ]; then
#	msg_ok "craw catalog builded correctly"
#else
#	msg_ko "craw failed building catalog"
#	exit 1
#fi
