# Use OpenJDK as the base image
FROM openjdk:21-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file into the container
COPY target/*.jar app.jar

# Expose the port on which Spring Boot runs
EXPOSE 5004

# Command to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
