FROM openjdk:8
# ARG JAR_FILE
WORKDIR /var/lib/docker/volumes/jenkins_home/_data/workspace
# COPY ${JAR_FILE} RESTJerseyEjemplo.jar\
COPY /var/lib/docker/volumes/jenkins_home/_data/workspace/RESTJerseyEjemplo@tmp
ENTRYPOINT ["java", "-jar", "/app.jar"]
