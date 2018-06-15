java $JAVA_OPTS -jar ./samples/configserver/target/*.jar
sleep 40
java $JAVA_OPTS -jar ./samples/eureka/target/*.jar