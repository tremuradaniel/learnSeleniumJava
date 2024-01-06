# Use an official OpenJDK runtime as a base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy only the necessary files for Maven build (pom.xml)
COPY pom.xml .

# Install any dependencies your Java code needs (e.g., Maven)
RUN apt-get update && apt-get install -y maven

# Copy the local JAR file to the container
COPY . .

# Specify the command to run on container startup

# Expose the debugging port
EXPOSE 5005

# Specify the command to run on container startup with debugging options
# With suspend=y, the JVM will wait for a debugger to attach before proceeding with the execution of the application.
CMD ["sh", "-c", "mvn clean install && java -agentlib:jdwp=transport=dt_socket,address=*:5005,server=y,suspend=y -jar target/selenium-1.0-SNAPSHOT.jar"]
