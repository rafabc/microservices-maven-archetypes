#!/bin/bash


function create_zuul() {

	msg_task "CREATING PROJECT ZUUL"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zuul -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=$ZUUL_ID -Dversion=$ZUUL_VERSION
	check_result $? "Zuul"

	cd $ZUUL_ID
	msg_task "Running mvn install for Zuul"
	mvn clean install
	check_mvn_install $? "Zuul"
	cd ..

}