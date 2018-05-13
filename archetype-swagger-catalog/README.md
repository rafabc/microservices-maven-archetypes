Swagger catalog archetypes
======================================

Summary
-------
With this archetype its posible to create a Swagger Catalog project pre-configured for integrate with Spring-Cloud-Config and Eureka.
Swagger Catalog offer a central point where consult all Swagger services.

Install the archetype
-------------
To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-swagger-catalog
    mvn clean install
```

Create a project Swagger Catalog
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-swagger-catalog \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=yourid \
        -Dversion=0.0.1-SNAPSHOT \
```