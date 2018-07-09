#!/bin/bash

. scripts/utils/colors.sh
. scripts/utils/simbols.sh
. scripts/utils/messages.sh

msg_task_gen "Launching maven install archetypes"
mvn -v

## THIS CODE IS FOR FAST TESTING THE RIGHT CODE IS THE CODE BELOW
#cd archetype-config-server && mvn clean install && cd ..
#cd archetype-eureka && mvn clean install && cd ..
#cd archetype-spring-boot-admin && mvn clean install && cd ..
#cd archetype-swagger-catalog && mvn clean install && cd ..
#cd archetype-zuul && mvn clean install && cd ..
#cd archetype-zipkin && mvn clean install && cd ..
#cd archetype-microservice-spring && mvn clean install && cd ..
#cd archetype-microservice-node && mvn clean install && cd ..

archetypes[0]=""

if [ -z "$1" ]; then
	archetypes[0]=archetype-config-server
	archetypes[1]=archetype-eureka
	archetypes[2]=archetype-spring-boot-admin
	archetypes[3]=archetype-zuul
	#archetypes[4]=archetype-zipkin
	#archetypes[5]=archetype-swagger-catalog
	#archetypes[6]=archetype-microservice-node
	#archetypes[7]=archetype-microservice-spring
else 
	arc="archetype-$1"
	echo "$arc"
	archetypes[0]="$arc"
fi

	

##NEXT CODE IS AND AUTOMATIC VERSION OF INSTALLATION
for arch in ${archetypes[*]} ; do
	
	if [[ ( $arch == *"archetype-"* ) ]]; then
		
		cd $arch
		msg_task "Runing mvn install archetype $arch"
		mvn clean install
		STATUS=$?
		if [ $STATUS -eq 0 ]; then
			msg_ok "archetype $arch installed correctly"
		else
			msg_ko "failed installing archetype $arch"
			exit 1
		fi
		
		msg_task "Updating maven catalog for $arch"
		mvn clean install archetype:update-local-catalog
		STATUS=$?
		if [ $STATUS -eq 0 ]; then
			msg_ok "catalog updated correctly for $arch"
		else
			msg_ko "failed updating catalog for $arch"
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
