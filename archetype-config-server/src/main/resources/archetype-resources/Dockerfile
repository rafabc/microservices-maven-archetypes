FROM java:8-jre
MAINTAINER Rafael Blanco Cordero <rafabc1979@gmail.com>

ADD ./target/config.jar /app/
CMD ["java", "-Xmx200m", "-jar", "/app/config.jar"]

HEALTHCHECK --interval=10s --timeout=3s CMD curl -f http://localhost:${config-server-port}/health || exit 1

EXPOSE ${config-server-port}