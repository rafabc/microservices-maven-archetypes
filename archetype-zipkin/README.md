Zipkin archetype
======================================

Summary
-------
With this archetype its posible to create a Zipkin server project pre-configured for integrate with Spring-Cloud-Config and Eureka.
Zuul archetype and microservices (Spring and Node) are integrated with zipkin, so you can see the traces directly in zipkin server.

Install the archetype
-------------
To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-zipkin
    mvn clean install
```

Create a project Zipkin
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-zipkin \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=yourid \
        -Dversion=0.0.1-SNAPSHOT \
```

Once you have ready your microservices its posible to see the traces in next url:
- <http://[zipkin-host]:[zipkin-port]>