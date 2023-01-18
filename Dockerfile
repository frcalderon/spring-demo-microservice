FROM openjdk:11
ADD https://api.github.com/repos/frcalderon/spring-demo-microservice/git/refs/heads/main version.json
RUN mkdir -p /app
WORKDIR /app
RUN git clone -b main https://github.com/frcalderon/spring-demo-microservice.git .
RUN chmod +x mvnw
RUN ./mvnw clean install -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/demo-0.0.1-SNAPSHOT.jar"]