#!/bin/bash


function create_swagger_catalog() {

	msg_task "CREATING PROJECT SWAGGER CATALOG"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-swagger-catalog -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=$SWAGGER_CATALOG_ID -Dversion=$SWAGGER_CATALOG_VERSION -Dswagger-catalog-port=$SWAGGER_CATALOG_PORT
	check_result $? "Swagger Catalog"


	file_config_swaager="swagger-catalog.yml"

	if [ -f "./$MICRO_NODE_ID/$file_config_swaager" ]
	then
		msg_task "Moving config files to config service"
		mv $PWD/$SWAGGER_CATALOG_ID/$file_config_swaager $PWD/$CONFIG_SERVER_ID/src/main/resources/config/$file_config_swaager
		check_mv $? "Swagger Catalog"
	fi


	cd $SWAGGER_CATALOG_ID
	msg_task "Running mvn install for Swagger Catalog"
	mvn clean install
	check_mvn_install $? "Swagger Catalog"
	cd ..

}