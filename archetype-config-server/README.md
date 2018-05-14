Sprign Cloud Config Server Archetype
======================================

Summary
-------
With this archetype its posible to create a config-server project pre-configured for integrate with Eureka and ready to work with native profile config.
Also its posible config the server to work with a hosted config path.

Prerequisites
-------------

- JDK 8
- Maven 3

Install the archetype
-------------

To install the archetype in local execute the following commands:

```bash
git clone https://github.com/rafabc/microservices-maven-archetypes.git
cd microservices-maven-archetypes/archetype-config-server
mvn clean install
mvn install archetype:update-local-catalog
```

Create a project Spring Cloud Config Server
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-config-server \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=configserver \
        -Dversion=0.0.1-SNAPSHOT \
		-Dconfig-server-port=1111 \
		-Deureka-port=2222 \
		-Dspring-boot-admin-port=3333 \
		-Dzipkin-port=4444 \
		-Dzuul-port=8082
```
	 


