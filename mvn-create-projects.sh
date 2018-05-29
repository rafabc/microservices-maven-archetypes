#!/bin/bash

. scripts/colors.sh
. scripts/parameters.sh
. scripts/simbols.sh
. scripts/messages.sh
. scripts/functions.sh


msg_task_gen "Launching maven create projects from archetypes"
mvn -v

mkdir projects
cd projects


msg_task "CREATING PROJECT CONFIG SERVER"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-config-server -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=configserver -Dversion=$CONFIG_SERVER_VERSION -Dconfig-server-port=$CONFIG_SERVER_PORT -Deureka-port=$EUREKA_PORT -Deureka-host=$EUREKA_HOST -Dspring-boot-admin-port=$SPRING_BOOT_ADMIN_PORT -Dzipkin-port=$ZIPKIN_PORT -Dzuul-port=$ZUUL_PORT
check_result $? "Config Server"

msg_task "CREATING PROJECT EUREKA"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-eureka -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=eureka -Dversion=$EUREKA_VERSION
check_result $? "Eureka"

msg_task "CREATING PROJECT SPRING BOOT ADMIN"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-springbootadmin -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=springbootadmin -Dversion=$SPRING_BOOT_ADMIN_VERSION
check_result $? "Spring Boot Admin"

msg_task "CREATING PROJECT ZUUL"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zuul -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=zuul -Dversion=$ZUUL_VERSION
check_result $? "Zuul"

msg_task "CREATING PROJECT ZIPKIN"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zipkin -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=zipkin -Dversion=$ZIPKIN_VERSION
check_result $? "Zipkin"

msg_task "CREATING PROJECT SWAGGER CATALOG"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-swagger-catalog -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=swagger -Dversion=$SWAGGER_CATALOG_VERSION -Dswagger-catalog-port=$SWAGGER_CATALOG_PORT
check_result $? "Swagger Catalog"

msg_task "CREATING PROJECT MICROSERVICE SPRING"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservice-spring -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=microspring -Dversion=$MICRO_SPRING_VERSION -Dmicroservice-mapping=$MICRO_SPRING_MAPPING -Dmicroservice-name=$MICRO_SPRING_NAME
check_result $? "Microservice Spring"

msg_task "CREATING PROJECT MICROSERVICE NODEJS"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservices-nodejs -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=micronode -Dversion=$MICRO_NODE_VERSION -Dmicroservice-mapping=$MICRO_NODE_MAPPING -Dmicroservice-name=$MICRO_NODE_NAME
check_result $? "Microservice Nodejs"


for d in * ; do
	
	file_config_spring="$MICRO_SPRING_NAME.yml"
	file_config_node="$MICRO_NODE_NAME.yml"

	if [ -f "./$d/src/main/resources/$file_config_spring" ]
	then
		mv $PWD/$d/src/main/resources/$file_config_spring $PWD/configserver/src/main/resources/config/$file_config_spring
		check_mv $? "Microservice Spring"
	fi
	if [ -f "./$d/$file_config_node" ]
	then
		mv $PWD/$d/$file_config_node $PWD/configserver/src/main/resources/config/$file_config_node
		check_mv $? "Microservice Nodejs"
	fi
done

		

for d in */ ; do
	#if [[ ( $d == *"archetype-"* ) && ( -d $d ) ]]; then
	if [ -d $d ] && [ $d != *"docs"* ] && [ $d != *"archetype"* ] && [ $d != *"scripts"* ]; then
		cd $d
		msg_task "Running mvn install for $d"
		mvn clean install
		check_mvn_install $? $d
		cd ..
	fi
done