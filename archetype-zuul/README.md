microservices-maven-archetypes
======================================

Summary
-------
Catalog of maven archetypes for microservices to simplify its creation

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


You can use the next url to see what service are available:
http://localhost:9094/routes