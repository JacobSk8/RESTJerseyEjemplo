FROM openjdk:8
ARG JAR_FILE
COPY ${JAR_FILE} RESTJerseyEjemplo11.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
