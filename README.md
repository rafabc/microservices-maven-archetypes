[![Build Status](https://travis-ci.org/rafabc/microservices-maven-archetypes.svg?branch=master)](https://travis-ci.org/rafabc/microservices-maven-archetypes)

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/91ca599b594547b793a8e082a6786f87)](https://www.codacy.com/app/rafabc1979/microservices-maven-archetypes?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=rafabc/microservices-maven-archetypes&amp;utm_campaign=Badge_Grade)


microservices-maven-archetypes
======================================

Summary
-------
Catalog of maven archetypes to develop microservices simplifying their creation and preconfigured to integrate directly with the tools Zuul, 
Eureka, Spring Boot Admin, Swagger, Zipkin and Spring Cloud Config.

Prerequisites
-------------

- JDK 8
- Maven 3

Ecosystem result
-------
![Alt text](docs/archetypes.jpg?raw=true "Ecosystem")


General installation instructions
-------------
Two installation ways:

### Local


1. Clone repository
```bash
git clone https://github.com/rafabc/microservices-maven-archetypes.git
```

After clone this project contain a shell script "mvn-install-archetypes.sh" that run all the nexts steps, but its posible run it manually if you want one by one:


2. In console go to each archetype path
```bash
cd microservices-maven-archetypes/[archetype-path]
```
3. run next mvn install for each archetype
```bash
mvn install 	#for each archetype
```
4. After install all archetypes update the catalog
```bash
mvn install archetype:update-local-catalog
mvn archetype:crawl
```

### Hosted

1. Clone repository
```bash
git clone https://github.com/rafabc/microservices-maven-archetypes.git
```
2. Install the archetypes in your maven repository
3. This repository provide a catalog file, with it you can update your hosted catalog and then use it where you want.


Instructions for creating projects
------
- [Spring Cloud Config Server](./archetype-config-server/)
- [Eureka](./archetype-eureka/)
- [Spring Boot Admin](./archetype-springbootadmin/)
- [Zuul](./archetype-zuul/)
- [Swagger Catalog](./archetype-swagger-catalog/)
- [Zipkin](./archetype-zipkin/)
- [Spring microservice](./archetype-microservice-spring/)
- [Nodejs microservice](./archetype-microservice-nodejs/)


Automation
-------
If all archetypes are installed, its posible use mvn-create-projects.sh to create fast all environmet projects whit default value parameters and test it.

After the projects are ready its posible execute the script "run-projects.sh" that launch each project.