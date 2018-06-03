#!/bin/bash

. scripts/utils/colors.sh
. scripts/utils/simbols.sh
. scripts/utils/messages.sh
. scripts/utils/functions.sh
. scripts/config/parameters.sh
. scripts/archetypes/configserver.sh
. scripts/archetypes/eureka.sh
. scripts/archetypes/springbootadmin.sh
. scripts/archetypes/zuul.sh
. scripts/archetypes/zipkin.sh
. scripts/archetypes/swaggercatalog.sh
. scripts/archetypes/microspring.sh
. scripts/archetypes/micronode.sh


msg_task_gen "Launching maven create projects from archetypes"
mvn -v

mkdir projects
cd projects


create_config_server
create_eureka
create_spring_boot_admin
create_zuul
create_zipkin
#create_swagger_catalog
#create_micro_spring
#create_micro_node
		

#AT THE END WHEN ALL PROJECT ARE CREATED IS NECESARY RUN MVN INSTALL FOR CONFIG SERVER
#LIKE THAT ALL CONFIG FILES HAVE BEEN MOVED TO CONFIG SERVER AND ITS READY TO MVN INSTALL
cd $CONFIG_SERVER_ID
msg_task "Running mvn install for Config Sever"
mvn clean install
check_mvn_install $? "Config Server"
cd ..