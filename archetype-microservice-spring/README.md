microservices-maven-archetypes
======================================

Summary
-------
With this archetype its posible to create a Zuul Edge Service project pre-configured for integrate with Spring-Cloud-Config and Eureka.

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
        -DarchetypeVersion=5.0.0 \
        -DgroupId=com.micro \
        -DartifactId=yourid \
        -Dversion=1.0-SNAPSHOT \
```

After run the microservice you can view integration with Swagger in:
<http:[microservice-host]:[microservice-port]/api/swagger-ui.html>

Microservice archetype contain one example get method:
<http:[microservice-host]:[microservice-port]/[service-name]/[mapping-name]/id/[number]>

if you execute the method you can see the latency data in zipkin:
<http:[zipkin-host]:[zipkin-port]>
