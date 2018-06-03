#!/bin/bash


function create_micro_node() {

	msg_task "CREATING PROJECT MICROSERVICE NODEJS"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID \
								-DarchetypeVersion=$ARCHETYPES_VERSION \
								-DarchetypeArtifactId=archetype-microservices-nodejs \
								-DgroupId=$SERVICES_GROUPID \
								-Dconfig-server-host=$CONFIG_SERVER_HOST \
								-DartifactId=$MICRO_NODE_ID \
								-Dversion=$MICRO_NODE_VERSION \
								-Dmicroservice-mapping=$MICRO_NODE_MAPPING \
								-Dmicroservice-name=$MICRO_NODE_NAME

	check_result $? "Microservice Nodejs"


	file_config_node="$MICRO_NODE_NAME.yml"

	if [ -f "./$MICRO_NODE_ID/$file_config_node" ]
	then
		msg_task "Moving config files to config service"
		mv $PWD/$MICRO_NODE_ID/$file_config_node $PWD/$CONFIG_SERVER_ID/src/main/resources/config/$file_config_node
		check_mv $? "Microservice Nodejs"
	fi

	cd $MICRO_NODE_ID
	msg_task "Running mvn install for $MICRO_NODE_NAME"
	mvn clean install
	check_mvn_install $? "$MICRO_NODE_NAME"
	cd ..

}