# Use an official OpenJDK 17 runtime as the parent image
FROM eclipse-temurin:17-jdk-alpine

# Expose the port your Spring Boot application will run on (change this if needed)
EXPOSE 8081

ADD target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]