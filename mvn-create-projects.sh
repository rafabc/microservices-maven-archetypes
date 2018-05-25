
RED="\e[0;31m"
GREEN="\e[0;32m"
RESET="\e[0m"

printf "%s$GREEN%s-------------------------------------------------------------------------------\n"
printf "%s$GREEN%s \u2713 ";
printf "%s$GREEN%sRunning maven create projects from archetypes\n"
printf "%s$GREEN%s-------------------------------------------------------------------------------%s$RESET%s\n"
mvn -v

printf "%s$GREEN%sCREATING PROJECT CONFIG SERVER%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-config-server -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=configserver -Dversion=0.0.1-SNAPSHOT -Dconfig-server-port=1111 -Deureka-port=2222 -Dspring-boot-admin-port=3333 -Dzipkin-port=4444 -Dzuul-port=8082
printf "%s$GREEN%sCREATING PROJECT EUREKA%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-eureka -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=eureka -Dversion=0.0.1-SNAPSHOT
printf "%s$GREEN%sCREATING PROJECT SPRING BOOT ADMIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-springbootadmin -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=springbootadmin -Dversion=0.0.1-SNAPSHOT
printf "%s$GREEN%sCREATING PROJECT ZUUL%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-zuul -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=zuul -Dversion=0.0.1-SNAPSHOT
printf "%s$GREEN%sCREATING PROJECT ZIPKIN%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-zipkin -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=zipkin -Dversion=0.0.1-SNAPSHOT
printf "%s$GREEN%sCREATING PROJECT SWAGGER CATALOG%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-swagger-catalog -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=yourswaggerid -Dversion=0.0.1-SNAPSHOT -Dswagger-catalog-port=5555
printf "%s$GREEN%sCREATING PROJECT MICROSERVICE SPRING%s$RESET%s\n"
mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-microservice-spring -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=yourmicrospringid -Dversion=0.0.1-SNAPSHOT -Dmicroservice-mapping=yourmapping -Dmicroservice-name=Yourmicroname
#mvn archetype:generate -B -DarchetypeGroupId=com.archetypes -DarchetypeArtifactId=archetype-microservices-nodejs -DarchetypeVersion=0.0.1-SNAPSHOT -DgroupId=com.micro -DartifactId=yourmicronodeid -Dversion=0.0.1-SNAPSHOT -Dmicroservice-mapping=yourmapping -Dmicroservice-name=yourmicroname

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