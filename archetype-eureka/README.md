Eureka Archetype
======================================

Summary
-------
With this archetype its posible to create a Eureka Server project pre-configured for integrate with Spring-Cloud-Config.

Prerequisites
-------------

- JDK 8
- Maven 3

Install the archetype
-------------

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-eureka
    mvn clean install
	mvn install archetype:update-local-catalog
```

Create a project Eureka
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-eureka \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=eureka \
        -Dversion=0.0.1-SNAPSHOT
```
	 


