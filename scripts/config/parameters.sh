#!/bin/bash

export LOCALHOST="localhost"

export CONFIG_SERVER_HOST=$LOCALHOST
export CONFIG_SERVER_PORT=1111
export CONFIG_SERVER_VERSION="0.0.1-SNAPSHOT"
export CONFIG_SERVER_ID="config-server"

export EUREKA_HOST=$LOCALHOST
export EUREKA_PORT=2222
export EUREKA_VERSION="0.0.1-SNAPSHOT"
export EUREKA_ID="eureka"

export SPRING_BOOT_ADMIN_PORT=3333
export SPRING_BOOT_ADMIN_VERSION="0.0.1-SNAPSHOT"
export SPRING_BOOT_ADMIN_ID="spring-boot-admin"

export ZIPKIN_PORT=4444
export ZIPKIN_VERSION="0.0.1-SNAPSHOT"
export ZIPKIN_ID="zipkin"

export ZUUL_PORT=8082
export ZUUL_ADMIN_PORT=9094
export ZUUL_VERSION="0.0.1-SNAPSHOT"
export ZUUL_ID="zuul"

export MICRO_SPRING_NAME="MicroService"
export MICRO_SPRING_MAPPING="test-mapping"
export MICRO_SPRING_VERSION="0.0.1-SNAPSHOT"
export MICRO_SPRING_ID="microspring"

export MICRO_NODE_NAME="micro-node"
export MICRO_NODE_MAPPING="node-mapping"
export MICRO_NODE_VERSION="0.0.1-SNAPSHOT"
export MICRO_NODE_ID="micronode"

export SWAGGER_CATALOG_VERSION="0.0.1-SNAPSHOT"
export SWAGGER_CATALOG_PORT=5555
export SWAGGER_CATALOG_ID="swagger"

export SERVICES_GROUPID="com.micro"

export ARCHETYPES_GROUPID="com.archetypes"
export ARCHETYPES_VERSION="0.0.1-SNAPSHOT"