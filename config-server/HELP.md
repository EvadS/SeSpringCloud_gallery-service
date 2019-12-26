# Getting Started

http://localhost:8888/config-server-client/development


http://localhost:8888/client-config/gallery-service/development

http://localhost:8888/client-config/gallery-service/development


http://localhost:8888/gallery-service/default



 Dockerfile to build the image. We can use this:


# requires Docker version 17.05.0-ce-rc1, build 2878a85
FROM maven:3.5-jdk-8 as BUILDCONFIGSERVER
COPY src /usr/src/myapp/src
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package -DskipTests
FROM openjdk:alpine
COPY --from=BUILDCONFIGSERVER /usr/src/myapp/target/*.jar /maven/
CMD java $JAVA_OPTS -jar maven/*.jar
