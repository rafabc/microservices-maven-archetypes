LOCALHOST="localhost"

CONFIG_SERVER_HOST=$LOCALHOST
CONFIG_SERVER_PORT=1111
CONFIG_SERVER_VERSION="0.0.1-SNAPSHOT"
EUREKA_HOST=$LOCALHOST
EUREKA_PORT=2222
EUREKA_VERSION="0.0.1-SNAPSHOT"
SPRING_BOOT_ADMIN_HOST=$LOCALHOST
SPRING_BOOT_ADMIN_PORT=3333
SPRING_BOOT_ADMIN_VERSION="0.0.1-SNAPSHOT"
ZIPKIN_HOST=$LOCALHOST
ZIPKIN_PORT=4444
ZIPKIN_VERSION="0.0.1-SNAPSHOT"
ZUUL_HOST=$LOCALHOST
ZUUL_PORT=8082
ZUUL_VERSION="0.0.1-SNAPSHOT"
MICRO_SPRING_HOST=$LOCALHOST
MICRO_SPRING_NAME="test-micro-spring"
MICRO_SPRING_MAPPING="test-mapping"
MICRO_SPRING_VERSION="0.0.1-SNAPSHOT"

SWAGGER_CATALOG_VERSION="0.0.1-SNAPSHOT"
SWAGGER_CATALOG_PORT=5555



SERVICES_GROUPID="com.micro"

ARCHETYPES_GROUPID="com.archetypes"
ARCHETYPES_VERSION="0.0.1-SNAPSHOT"



RED="\e[0;31m"
GREEN="\e[0;32m"
RESET="\e[0m"




printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
printf "%s$GREEN%s \u2713 ";
printf "%s$GREEN%sRunning maven create projects from archetypes\n"
printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn -v



printf "%s$GREEN%sCREATING PROJECT CONFIG SERVER%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-config-server -DgroupId=$SERVICES_GROUPID -DartifactId=configserver -Dversion=$CONFIG_SERVER_VERSION -Dconfig-server-port=$CONFIG_SERVER_PORT -Deureka-port=$EUREKA_PORT -Dspring-boot-admin-port=$SPRING_BOOT_ADMIN_PORT -Dzipkin-port=$ZIPKIN_PORT -Dzuul-port=$ZUUL_PORT
printf "%s$GREEN%sCREATING PROJECT EUREKA%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-eureka -DgroupId=$SERVICES_GROUPID -DartifactId=eureka -Dversion=$EUREKA_VERSION
printf "%s$GREEN%sCREATING PROJECT SPRING BOOT ADMIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-springbootadmin -DgroupId=$SERVICES_GROUPID -DartifactId=springbootadmin -Dversion=$SPRING_BOOT_ADMIN_VERSION
printf "%s$GREEN%sCREATING PROJECT ZUUL%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zuul -DgroupId=$SERVICES_GROUPID -DartifactId=zuul -Dversion=$ZUUL_VERSION
printf "%s$GREEN%sCREATING PROJECT ZIPKIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-zipkin -DgroupId=$SERVICES_GROUPID -DartifactId=zipkin -Dversion=$ZIPKIN_VERSION
printf "%s$GREEN%sCREATING PROJECT SWAGGER CATALOG%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-swagger-catalog -DgroupId=$SERVICES_GROUPID -DartifactId=yourswaggerid -Dversion=$SWAGGER_CATALOG_VERSION -Dswagger-catalog-port=5555
printf "%s$GREEN%sCREATING PROJECT MICROSERVICE SPRING%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservice-spring -DgroupId=$SERVICES_GROUPID -DartifactId=yourmicrospringid -Dversion=$MICRO_SPRING_VERSION -Dmicroservice-mapping=$MICRO_SPRING_MAPPING -Dmicroservice-name=$MICRO_SPRING_NAME
#mvn archetype:generate -B -DarchetypeGroupId=$ARCHETYPES_GROUPID -DarchetypeVersion=$ARCHETYPES_VERSION -DarchetypeArtifactId=archetype-microservices-nodejs -DgroupId=$SERVICES_GROUPID -DartifactId=yourmicronodeid -Dversion=0.0.1-SNAPSHOT -Dmicroservice-mapping=yourmapping -Dmicroservice-name=yourmicroname

#mvn install
for d in */ ; do
	cd $d
	printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
	printf "%s$GREEN%s \u2713 ";
	printf "%s$GREEN%s %s %s %s %s %s %s %s %s %s\n" "Running mvn install for "$d
	printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
	mvn clean install
	cd ..
done