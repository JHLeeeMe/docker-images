FROM jhleeeme/ubuntu:18.04
LABEL maintainer="JHLeeeMe"


ARG SCALA_VERSION=2.11 
ARG KAFKA_VERSION=2.4.1

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y net-tools wget

# java-8u131
RUN mkdir -p /opt/java && \
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz && \
    tar xvf jdk-8u131-linux-x64.tar.gz -C /opt/java --strip-components=1 && \
    rm jdk-8u131-linux-x64.tar.gz

# scala-2.11.12
RUN wget "https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.tgz" && \
    tar xzf scala-2.11.12.tgz -C /opt && \
    rm /scala-2.11.12.tgz && \
    cd /opt && ln -s ./scala-2.11.12 scala-2.11
    
# kafka_2.11-2.4.1
RUN wget "https://downloads.apache.org/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz" && \
    tar xzf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt && \
    rm /kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz && \
    cd /opt && ln -s ./kafka_${SCALA_VERSION}-${KAFKA_VERSION} kafka

# ENV
ENV JAVA_HOME=/opt/java
ENV SCALA_HOME=/opt/scala-2.11
ENV KAFKA_HOME=/opt/kafka
ENV PATH=${PATH}:${JAVA_HOME}/bin:${SCALA_HOME}/bin:${KAFKA_HOME}/bin

# COPY scripts
COPY bootstrap.sh scripts/create-topics.sh /tmp/
RUN chown root.root /tmp/*.sh && \
    chmod 700 /tmp/*.sh && \
    mv /tmp/*.sh /etc/

# kafka server port
EXPOSE 9092


ENTRYPOINT ["/etc/bootstrap.sh"]
