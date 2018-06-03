#!/bin/bash


function create_eureka() {

	msg_task "CREATING PROJECT EUREKA"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID \
								-DarchetypeVersion=$ARCHETYPES_VERSION \
								-DarchetypeArtifactId=archetype-eureka \
								-DgroupId=$SERVICES_GROUPID \
								-Dconfig-server-host=$CONFIG_SERVER_HOST \
								-DartifactId=$EUREKA_ID \
								-Dversion=$EUREKA_VERSION
	check_result $? "Eureka"


	cd $EUREKA_ID
	msg_task "Running mvn install for Eureka"
	mvn clean install
	check_mvn_install $? "Eureka"
	cd ..

}