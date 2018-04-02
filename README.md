microservices-maven-archetypes
======================================

Summary
-------
Catalog of maven archetypes for microservices to simplify its creation




Prerequisites
-------------

- JDK 8
- Maven 3

Create a project Spring Cloud Config Server
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-config-server \
        -DarchetypeVersion=0.0.1 \
        -DgroupId=com.micro \
        -DartifactId=configserver \
        -Dversion=1.0-SNAPSHOT \
```
	 

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-config-server
    mvn clean install
```

Create a project Eureka
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-eureka \
        -DarchetypeVersion=0.0.1 \
        -DgroupId=com.micro \
        -DartifactId=eureka \
        -Dversion=1.0-SNAPSHOT \
```
	
`If you have clone the repository before you can ommit the clone step`

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-eureka
    mvn clean install
```

Create a project Spring Boot Admin
----------------

```bash
    mvn archetype:generate \
        -DarchetypeGroupId=com.archetypes \
        -DarchetypeArtifactId=archetype-springbootadmin \
        -DarchetypeVersion=5.0.0 \
        -DgroupId=com.micro \
        -DartifactId=springbootadmin \
        -Dversion=1.0-SNAPSHOT \
```
	 

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-springbootadmin
    mvn clean install
```


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
```
	 

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-zuul
    mvn clean install
```

And now create a project microservices
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
	 

To install the archetype in local execute the following commands:

```bash
    git clone https://github.com/rafabc/microservices-maven-archetypes.git
    cd microservices-maven-archetypes/archetype-microservices
    mvn clean install
```