# Use a base image with Maven + JDK
FROM maven:3.9.6-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies (cache step)
COPY AnswerSaverApp/backend/pom.xml .
RUN mvn dependency:go-offline

# Copy source code
COPY AnswerSaverApp/backend/src ./src

# Build the app
RUN mvn clean package -DskipTests

# Use a smaller JDK image for runtime
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the built jar from previous stage
COPY --from=build /app/target/*.jar app.jar

# Expose port 8080
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "-Dspring.profiles.active=prod", "app.jar"]