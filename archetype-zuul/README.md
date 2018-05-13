Zuul rchetype
======================================

Summary
-------
With this archetype its posible to create a Zuul Edge Service project pre-configured for integrate with Spring-Cloud-Config and Eureka.

Install the archetype
-------------
To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-zuul
    mvn clean install
	mvn install archetype:update-local-catalog
```


Create a project zuul
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-zuul \
        -DarchetypeVersion=0.0.1-SNAPSHOT \
        -DgroupId=com.micro \
        -DartifactId=zuul \
        -Dversion=0.0.1-SNAPSHOT
```
	 



You can use the next url to see what service are available to comunicate with Zuul Service:
<http://localhost:9094/routes>