FROM java:8
ADD eureka-server-0.0.1-SNAPSHOT.jar teureka.jar
RUN sh -c 'touch /teureka.jar'
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /teureka.jar" ]
