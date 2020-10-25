FROM jhleeeme/hadoop:3.2.1
LABEL maintainer="JHLeeeMe"


# scala
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install scala

# python
RUN apt-get -y install python3

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

ENV SLAVE_NUM
COPY config/spark/create-slaves.sh /etc/
RUN chown root.root /etc/create-slaves.sh && \
    chmod 700 /etc/create-slaves.sh && \
    /etc/create-slaves.sh ${SLAVE_NUM} && \
    cp $HADOOP_CONF_DIR/workers $SPARK_HOME/conf/slaves

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh && \
    chmod 700 /etc/bootstrap.sh

# Spark Web UI, History Server Port
EXPOSE 8080 18080

EXPOSE 7077

# sbt
RUN apt-get -y install apt-transport-https
RUN echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
RUN apt-get -y update
RUN apt-get -y install sbt


ENTRYPOINT ["/etc/bootstrap.sh"]
