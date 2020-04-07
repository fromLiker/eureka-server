FROM java:8
WORKDIR /teureka
COPY target/eureka-server-0.0.1-SNAPSHOT.jar /teureka/teureka.jar
EXPOSE 8761
ENTRYPOINT ["java","-Xms200m","-Xmx300m","-jar","/teureka/teureka.jar"]
