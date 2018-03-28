# microservices-maven-archetypes
======================================

Summary
-------
Catalog of maven microservices archetypes to simplify its creation




Prerequisites
-------------

- JDK 8
- Maven 3

Create a project zuul
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-zuul \
        -DarchetypeVersion=5.0.0 \
        -DgroupId=com.micro \
        -DartifactId=zuul \
        -Dversion=1.0-SNAPSHOT \
     
	 

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes
    mvn clean install
```