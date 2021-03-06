FROM jhleeeme/hadoop:3.2.1
LABEL maintainer="JHLeeeMe"


RUN apt-get -y update && \
    apt-get -y upgrade

# scala-2.11.12
RUN wget "https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.tgz" && \
    tar xzf scala-2.11.12.tgz -C /opt && \
    rm /scala-2.11.12.tgz && \
    cd /opt && ln -s ./scala-2.11.12 scala-2.11

# sbt
RUN apt-get -y install apt-transport-https && \
    echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get -y update && \
    apt-get -y install sbt

# python
RUN apt-get -y install python3 python3-pip && \
    ln -s python3 python && \
    mv python /usr/bin/

# spark 2.4.0 without hadoop
RUN wget https://archive.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-bin-without-hadoop.tgz && \
    tar xzf spark-2.4.0-bin-without-hadoop.tgz -C /opt && \
    rm /spark-2.4.0-bin-without-hadoop.tgz && \
    cd /opt && ln -s ./spark-2.4.0-bin-without-hadoop spark

# ENV hadoop
ENV LD_LIBRARY_PATH=/opt/hadoop/lib/native/:$LD_LIBRARY_PATH

# ENV spark
ENV SPARK_HOME /opt/spark
ENV PATH $SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

COPY config/spark/spark-env.sh $SPARK_HOME/conf/spark-env.sh
COPY config/spark/spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf
COPY config/spark/create-slaves.sh /etc/create-slaves.sh
COPY bootstrap.sh  /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh /etc/create-slaves.sh && \
    chmod 700 /etc/bootstrap.sh /etc/create-slaves.sh

# Spark Web UI, History Server Port
EXPOSE 8080 18080
EXPOSE 7077

ENTRYPOINT ["/etc/bootstrap.sh"]
