FROM maven:3.5-jdk-11 as KARAF-BUILD
  
RUN mkdir /tmp/src;
WORKDIR /tmp/src/
ADD . .
ARG KARAF_VERSION=${KARAF_VERSION}
ARG CAMEL_VERSION=${CAMEL_VERSION}
RUN mvn clean install

FROM openjdk:11-jdk

VOLUME "~/.m2"

#ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
RUN apt-get update \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN mkdir /opt/karaf;
COPY --from=KARAF-BUILD /tmp/src/target/karaf-distribution-1.0.0.tar.gz /opt/karaf-distribution-1.0.0.tar.gz
RUN tar --strip-components=1 -C /opt/karaf -xzf /opt/karaf-distribution-1.0.0.tar.gz; \
    rm /opt/karaf-distribution-1.0.0.tar.gz
RUN mkdir -p /opt/karaf/data/log && touch /opt/karaf/data/log/karaf.log
EXPOSE 1099 8101 44444 8181
CMD ["/opt/karaf/bin/karaf","run"]
