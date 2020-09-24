FROM jhleeeme/spark:2.4.0
LABEL maintainer="JHLeeeMe"

RUN apt-get -y update && \
    apt-get -y upgrade

# zeppelin 0.8.2
RUN wget http://mirror.navercorp.com/apache/zeppelin/zeppelin-0.8.2/zeppelin-0.8.2-bin-all.tgz && \
    tar xzf zeppelin-0.8.2-bin-all.tgz -C /opt && \
    rm /zeppelin-0.8.2-bin-all.tgz && \
    cd /opt && ln -s ./zeppelin-0.8.2-bin-all zeppelin

# ENV zeppelin
ENV ZEPPELIN_HOME /opt/zeppelin
ENV PATH $ZEPPELIN_HOME/bin:$PATH
COPY config/zeppelin/zeppelin-env.sh $ZEPPELIN_HOME/conf/zeppelin-env.sh

# bootstrap
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh && \
    chmod 700 /etc/bootstrap.sh

# zeppelin server port
EXPOSE 7777


ENTRYPOINT ["/etc/bootstrap.sh"]
