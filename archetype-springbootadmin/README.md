Spring Boot Admin Archetype
======================================

Summary
-------
With this archetype its posible to create a Spring Boot Admin Server project pre-configured for integrate with Spring-Cloud-Config and Eureka.

Prerequisites
-------------

- JDK 8
- Maven 3

Install the archetype
-------------
To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-springbootadmin
    mvn clean install
	mvn install archetype:update-local-catalog
```


Create a project Spring Boot Admin
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-springbootadmin \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=springbootadmin \
        -Dversion=0.0.1-SNAPSHOT
```


