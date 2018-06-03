#!/bin/bash


function create_config_server() {

	msg_task "CREATING PROJECT CONFIG SERVER"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-config-server -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=$CONFIG_SERVER_ID -Dversion=$CONFIG_SERVER_VERSION -Dconfig-server-port=$CONFIG_SERVER_PORT -Deureka-port=$EUREKA_PORT -Deureka-host=$EUREKA_HOST -Dspring-boot-admin-port=$SPRING_BOOT_ADMIN_PORT -Dzipkin-port=$ZIPKIN_PORT -Dzuul-port=$ZUUL_PORT -Dzuul-admin-port=$ZUUL_ADMIN_PORT -Dswagger-catalog-port=$SWAGGER_CATALOG_PORT
	check_result $? "Config Server"

}
