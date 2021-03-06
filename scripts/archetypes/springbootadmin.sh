#!/bin/bash


function create_spring_boot_admin() {

	msg_task "CREATING PROJECT SPRING BOOT ADMIN"
	mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID \
								-DarchetypeVersion=$ARCHETYPES_VERSION \
								-DarchetypeArtifactId=archetype-springbootadmin \
								-DgroupId=$SERVICES_GROUPID \
								-Dconfig-server-host=$CONFIG_SERVER_HOST \
								-DartifactId=$SPRING_BOOT_ADMIN_ID \
								-Dversion=$SPRING_BOOT_ADMIN_VERSION \
								-Dspring-boot-admin-port=$SPRING_BOOT_ADMIN_PORT

	check_result $? "Spring Boot Admin"

	cd $SPRING_BOOT_ADMIN_ID
	msg_task "Running mvn install for Spring Boot Admin"
	mvn clean install
	check_mvn_install $? "Spring Boot Admin"
	cd ..

}