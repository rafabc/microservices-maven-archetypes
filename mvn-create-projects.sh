#!/bin/bash

. scripts/colors.sh
. scripts/parameters.sh



printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
printf "%s$GREEN%s \u2713 ";
printf "%s$GREEN%sRunning maven create projects from archetypes\n"
printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn -v

mkdir projects
cd projects

printf "%s$GREEN%s\nCREATING PROJECT CONFIG SERVER%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-config-server -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=configserver -Dversion=$CONFIG_SERVER_VERSION -Dconfig-server-port=$CONFIG_SERVER_PORT -Deureka-port=$EUREKA_PORT -Deureka-host=$EUREKA_HOST -Dspring-boot-admin-port=$SPRING_BOOT_ADMIN_PORT -Dzipkin-port=$ZIPKIN_PORT -Dzuul-port=$ZUUL_PORT
printf "%s$GREEN%s\nCREATING PROJECT EUREKA%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-eureka -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=eureka -Dversion=$EUREKA_VERSION
printf "%s$GREEN%s\nCREATING PROJECT SPRING BOOT ADMIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-springbootadmin -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=springbootadmin -Dversion=$SPRING_BOOT_ADMIN_VERSION
printf "%s$GREEN%s\nCREATING PROJECT ZUUL%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zuul -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=zuul -Dversion=$ZUUL_VERSION
printf "%s$GREEN%s\nCREATING PROJECT ZIPKIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zipkin -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=zipkin -Dversion=$ZIPKIN_VERSION
printf "%s$GREEN%s\nCREATING PROJECT SWAGGER CATALOG%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-swagger-catalog -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=swagger -Dversion=$SWAGGER_CATALOG_VERSION -Dswagger-catalog-port=$SWAGGER_CATALOG_PORT
printf "%s$GREEN%s\nCREATING PROJECT MICROSERVICE SPRING%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservice-spring -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=microspring -Dversion=$MICRO_SPRING_VERSION -Dmicroservice-mapping=$MICRO_SPRING_MAPPING -Dmicroservice-name=$MICRO_SPRING_NAME
printf "%s$GREEN%s\nCREATING PROJECT MICROSERVICE NODEJS%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservices-nodejs -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=micronode -Dversion=$MICRO_NODE_VERSION -Dmicroservice-mapping=$MICRO_NODE_MAPPING -Dmicroservice-name=$MICRO_NODE_NAME


for d in * ; do
	echo $d
	file_config_spring="$MICRO_SPRING_NAME.yml"
	file_config_node="$MICRO_NODE_NAME.yml"

	if [ -f "./$d/src/main/resources/$file_config_spring" ]
	then
		mv $PWD/$d/src/main/resources/$file_config_spring $PWD/configserver/src/main/resources/config/$file_config_spring
	fi
	if [ -f "./$d/$file_config_node" ]
	then
		mv $PWD/$d/$file_config_node $PWD/configserver/src/main/resources/config/$file_config_node
	fi
done

		

echo $PWD
for d in */ ; do
	if [ $d != *"docs"* ] && [ $d != *"archetype"* ] && [ $d != *"scripts"* ]; then
		cd $d
		printf "%s$YELLOW%s-------------------------------------------------------------------------------\n"
		printf "%s$YELLOW%s \u2713 ";
		printf "%s$YELLOW%s %s %s %s %s %s %s %s %s %s\n" "Running mvn install for "$d
		printf "%s$YELLOW%s-------------------------------------------------------------------------------%s$RESET%s\n"
		mvn clean install
		cd ..
	fi
done