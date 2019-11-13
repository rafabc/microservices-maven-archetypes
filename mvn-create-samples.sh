#!/bin/bash

. scripts/utils/colors.sh
. scripts/utils/simbols.sh
. scripts/utils/messages.sh
. scripts/utils/functions.sh
. scripts/config/parameters.sh
. scripts/archetypes/configserver.sh
. scripts/archetypes/eureka.sh
. scripts/archetypes/springbootadmin.sh
. scripts/archetypes/zuul.sh
. scripts/archetypes/zipkin.sh
. scripts/archetypes/swaggercatalog.sh
. scripts/archetypes/microspring.sh
. scripts/archetypes/micronode.sh


msg_task_gen "Launching maven create projects from archetypes"
mvn -v

mkdir samples
cd samples


	archetypes[0]=archetype-config-server
	archetypes[1]=archetype-eureka
	archetypes[2]=archetype-spring-boot-admin
	archetypes[3]=archetype-zuul
	archetypes[4]=archetype-zipkin
	archetypes[5]=archetype-swagger-catalog
	archetypes[6]=archetype-microservice-node
	archetypes[7]=archetype-microservice-spring

if [ -z "$1" ]; then #used in local for full installation
	#######RUNNING FUNCTIONS FOR PROJECTS CREATION#####
	create_config_server
	create_eureka
	create_spring_boot_admin
	create_zuul
	create_zipkin
	create_swagger_catalog
	create_micro_spring
	create_micro_node

	#AT THE END WHEN ALL PROJECT ARE CREATED IS NECESARY RUN MVN INSTALL FOR CONFIG SERVER
	#LIKE THAT ALL CONFIG FILES HAVE BEEN MOVED TO CONFIG SERVER AND ITS READY TO MVN INSTALL
	cd $CONFIG_SERVER_ID
	msg_task "Running mvn install for Config Sever"
	mvn clean install
	check_mvn_install $? "Config Server"
	cd ..
else

	arc="archetype-$1"
	if [ "$1" == "config-server" ]; then
		create_config_server
		cd $CONFIG_SERVER_ID
		msg_task "Running mvn install for Config Sever"
		mvn clean install
		check_mvn_install $? "Config Server"
		cd ..
	fi 
	if [ "$1" == "eureka" ]; then
		create_eureka
	fi
	if [ "$1" == "spring-boot-admin" ]; then
		create_spring_boot_admin
	fi
	if [ "$1" == "zuul" ]; then
		create_zuul
	fi
	if [ "$1" == "zipkin" ]; then
		create_zipkin
	fi	
	if [ "$1" == "swagger-catalog" ]; then
		create_swagger_catalog
	fi	
	if [ "$1" == "micro-node" ]; then
		create_micro_node
	fi	
fi


		

