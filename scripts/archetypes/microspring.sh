#!/bin/bash


function create_micro_spring() {

	msg_task "CREATING PROJECT MICROSERVICE SPRING"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservice-spring -DgroupId=$SERVICES_GROUPID -Dconfig-server-host=$CONFIG_SERVER_HOST -DartifactId=$MICRO_SPRING_ID -Dversion=$MICRO_SPRING_VERSION -Dmicroservice-mapping=$MICRO_SPRING_MAPPING -Dmicroservice-name=$MICRO_SPRING_NAME
	check_result $? "Microservice Spring"


	file_config_spring="$MICRO_SPRING_NAME.yml"

	if [ -f "./$MICRO_SPRING_ID/src/main/resources/$file_config_spring" ]
	then
		msg_task "Moving config files to config service"
		mv $PWD/$MICRO_SPRING_ID/src/main/resources/$file_config_spring $PWD/$CONFIG_SERVER_ID/src/main/resources/config/$file_config_spring
		check_mv $? "Microservice Spring"
	fi

	cd $MICRO_SPRING_ID
	msg_task "Running mvn install for $MICRO_SPRING_NAME"
	mvn clean install
	check_mvn_install $? $MICRO_SPRING_NAME
	cd ..

}