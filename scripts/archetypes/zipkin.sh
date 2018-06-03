#!/bin/bash


function create_zipkin() {

	msg_task "CREATING PROJECT ZIPKIN"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID \
								-DarchetypeVersion=$ARCHETYPES_VERSION \
								-DarchetypeArtifactId=archetype-zipkin \
								-DgroupId=$SERVICES_GROUPID \
								-Dconfig-server-host=$CONFIG_SERVER_HOST \
								-DartifactId=$ZIPKIN_ID \
								-Dversion=$ZIPKIN_VERSION
	check_result $? "Zipkin"

	cd $ZIPKIN_ID
	msg_task "Running mvn install for Zipkin"
	mvn clean install
	check_mvn_install $? "Zipkin"
	cd ..

}