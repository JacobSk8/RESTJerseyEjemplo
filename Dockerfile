#FROM openjdk:8
#WORKDIR /var/lib/docker/volumes/jenkins_home/_data/workspace
#COPY /var/lib/docker/volumes/jenkins_home/_data/workspace/RESTJerseyEjemplo@tmp
#ENTRYPOINT ["java", "-jar", "/app.jar"]

# ARG JAR_FILE
# COPY ${JAR_FILE} RESTJerseyEjemplo.jar\


FROM openjdk:8
WORKDIR /var/lib/docker/volumes/jenkins_home/_data/workspace
COPY ./RESTJerseyEjemplo .
EXPOSE 81
