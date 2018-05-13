Nodejs microservice archetype
======================================

Summary
-------
With this archetype its posible to create a Nodejs Microservice project pre-configured for integrate with Spring-Cloud-Config, Eureka, Zipkin and Swagger.

Install the archetype
-------------
To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-microservices
    mvn clean install
```

Create a project microservices
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-microservices \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=yourid \
        -Dversion=0.0.1-SNAPSHOT \
```

The generated project contain and yml config file, this file is necesary to put in config-server to get the configuration from config-server

After run the microservice you can view integration with Swagger in:
- <http:[microservice-host]:[microservice-port]/api/swagger-ui.html>

Microservice archetype contain one example get method:
- <http:[microservice-host]:[microservice-port]/[service-name]/[mapping-name]/id/[number]>

if you execute the method you can see the latency data in zipkin:
- <http:[zipkin-host]:[zipkin-port]>
