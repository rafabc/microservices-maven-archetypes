#!/bin/bash

. scripts/utils/colors.sh
. scripts/utils/simbols.sh
. scripts/utils/messages.sh

msg_task_gen "Launching maven install archetypes"
mvn -v

cd archetype-config-server && mvn clean install
cd archetype-eureka && mvn clean install
#cd archetype-spring-boot-admin && mvn clean install
#cd archetype-swagger-catalog && mvn clean install
#cd archetype-zuul && mvn clean install
#cd archetype-zipkin && mvn clean install
#cd archetype-microservice-spring && mvn clean install
#cd archetype-microservice-node && mvn clean install


##NEXT CODE IS AND AUTOMATIC VERSION OF INSTALLATION
#for d in * ; do
#	if [[ ( $d == *"archetype-"* ) && ( -d $d ) ]]; then  #second if check if is a directory
		
#		cd $d
#		msg_task "Runing mvn install archetype $d"
#		mvn clean install
#		STATUS=$?
#		if [ $STATUS -eq 0 ]; then
#			msg_ok "archetype $d installed correctly"
#		else
#			msg_ko "failed installing archetype $d"
#			exit 1
#		fi
#		
#		msg_task "Updating maven catalog for $d"
#		mvn install archetype:update-local-catalog
#		STATUS=$?
#		if [ $STATUS -eq 0 ]; then
#			msg_ok "catalog updated correctly for $d"
#		else
#			msg_ko "failed updating catalog for $d"
#			exit 1
#		fi
#		cd ..
#	fi
#done


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
