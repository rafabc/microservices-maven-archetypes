#!/bin/sh

. scripts/colors.sh

LOCALHOST="localhost"

CONFIG_SERVER_HOST=$LOCALHOST
CONFIG_SERVER_PORT=1111
CONFIG_SERVER_VERSION="0.0.1-SNAPSHOT"
EUREKA_HOST=$LOCALHOST
EUREKA_PORT=2222
EUREKA_VERSION="0.0.1-SNAPSHOT"
SPRING_BOOT_ADMIN_PORT=3333
SPRING_BOOT_ADMIN_VERSION="0.0.1-SNAPSHOT"
ZIPKIN_PORT=4444
ZIPKIN_VERSION="0.0.1-SNAPSHOT"
ZUUL_PORT=8082
ZUUL_VERSION="0.0.1-SNAPSHOT"

MICRO_SPRING_NAME="MicroService"
MICRO_SPRING_MAPPING="test-mapping"
MICRO_SPRING_VERSION="0.0.1-SNAPSHOT"

MICRO_NODE_NAME="micro-node"
MICRO_NODE_MAPPING="node-mapping"
MICRO_NODE_VERSION="0.0.1-SNAPSHOT"

SWAGGER_CATALOG_VERSION="0.0.1-SNAPSHOT"
SWAGGER_CATALOG_PORT=5555

SERVICES_GROUPID="com.micro"

ARCHETYPES_GROUPID="com.archetypes"
ARCHETYPES_VERSION="0.0.1-SNAPSHOT"



printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
printf "%s$GREEN%s \u2713 ";
printf "%s$GREEN%sRunning maven create projects from archetypes\n"
printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn -v

mkdir projects && cd $_

printf "%s$GREEN%sCREATING PROJECT CONFIG SERVER%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-config-server -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=configserver -Dversion=$CONFIG_SERVER_VERSION -Dconfig-server-port=$CONFIG_SERVER_PORT -Deureka-port=$EUREKA_PORT -Deureka-host=$EUREKA_HOST -Dspring-boot-admin-port=$SPRING_BOOT_ADMIN_PORT -Dzipkin-port=$ZIPKIN_PORT -Dzuul-port=$ZUUL_PORT
printf "%s$GREEN%sCREATING PROJECT EUREKA%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-eureka -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=eureka -Dversion=$EUREKA_VERSION
printf "%s$GREEN%sCREATING PROJECT SPRING BOOT ADMIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-springbootadmin -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=springbootadmin -Dversion=$SPRING_BOOT_ADMIN_VERSION
printf "%s$GREEN%sCREATING PROJECT ZUUL%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zuul -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=zuul -Dversion=$ZUUL_VERSION
printf "%s$GREEN%sCREATING PROJECT ZIPKIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zipkin -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=zipkin -Dversion=$ZIPKIN_VERSION
printf "%s$GREEN%sCREATING PROJECT SWAGGER CATALOG%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-swagger-catalog -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=swagger -Dversion=$SWAGGER_CATALOG_VERSION -Dswagger-catalog-port=$SWAGGER_CATALOG_PORT
printf "%s$GREEN%sCREATING PROJECT MICROSERVICE SPRING%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservice-spring -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=microspring -Dversion=$MICRO_SPRING_VERSION -Dmicroservice-mapping=$MICRO_SPRING_MAPPING -Dmicroservice-name=$MICRO_SPRING_NAME
printf "%s$GREEN%sCREATING PROJECT MICROSERVICE NODEJS%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservices-nodejs -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=micronode -Dversion=$MICRO_NODE_VERSION -Dmicroservice-mapping=$MICRO_NODE_MAPPING -Dmicroservice-name=$MICRO_NODE_NAME

#mvn install
for d in */projects/ ; do
	if [[ $d != *"docs"* ]] && [[$d != *"archetype"*]]; then
		cd $d
		printf "%s$YELLOW%s-------------------------------------------------------------------------------\n"
		printf "%s$YELLOW%s \u2713 ";
		printf "%s$YELLOW%s %s %s %s %s %s %s %s %s %s\n" "Running mvn install for "$d
		printf "%s$YELLOW%s-------------------------------------------------------------------------------%s$RESET%s\n"
		mvn clean install
		cd ..
	fi
done