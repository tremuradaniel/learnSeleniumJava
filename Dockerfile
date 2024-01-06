# Use an official OpenJDK runtime as a base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the local JAR file to the container
COPY . .

# Install any dependencies your Java code needs (e.g., Maven)
RUN apt-get update && apt-get install -y maven

# Build your Java code
RUN mvn clean install

# Specify the command to run on container startup

# in a Maven project, the JAR file is usually named after your artifactId and version,
# and it would look something like your-artifactId-1.0-SNAPSHOT.jar. You need to replace "your-artifactId-1.0-SNAPSHOT.jar"
# with the actual name of your generated JAR file
CMD ["java", "-jar", "target/selenium-1.0-SNAPSHOT.jar"]
