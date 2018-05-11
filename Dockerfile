FROM ubuntu

RUN apt-get update && apt-get install -y wget openjdk-8-jdk postgresql-client
RUN wget http://apache.rediris.es/hadoop/common/hadoop-2.7.6/hadoop-2.7.6.tar.gz && \
    tar xvzf hadoop-2.7.6.tar.gz && \
    rm hadoop-2.7.6.tar.gz

RUN wget http://apache.rediris.es/hive/hive-2.3.3/apache-hive-2.3.3-bin.tar.gz && \
    tar xvzf apache-hive-2.3.3-bin.tar.gz && \
    rm apache-hive-2.3.3-bin.tar.gz

RUN wget http://apache.rediris.es/spark/spark-2.0.2/spark-2.0.2-bin-hadoop2.7.tgz  && \
    tar xvzf spark-2.0.2-bin-hadoop2.7.tgz && \
    rm spark-2.0.2-bin-hadoop2.7.tgz

RUN wget http://mirrors.up.pt/pub/apache/zeppelin/zeppelin-0.7.3/zeppelin-0.7.3-bin-all.tgz && \
    tar xvfz zeppelin-0.7.3-bin-all.tgz && \
    rm zeppelin-0.7.3-bin-all.tgz

RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.2.jar
RUN cp /postgresql-42.2.2.jar /apache-hive-2.3.3-bin/lib
RUN cp /postgresql-42.2.2.jar /spark-2.0.2-bin-hadoop2.7/jars

RUN wget http://apache.rediris.es/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz && \
    tar xvzf apache-flume-1.8.0-bin.tar.gz && \
    rm apache-flume-1.8.0-bin.tar.gz

ADD files/ /

COPY files/hive-site.xml /apache-hive-2.3.3-bin/conf
COPY files/hive-site.xml /spark-2.0.2-bin-hadoop2.7/conf

COPY files/zeppelin-env.sh /zeppelin-0.7.3-bin-all/conf
COPY files/hive-site.xml /zeppelin-0.7.3-bin-all/conf
COPY files/flume.conf /apache-flume-1.8.0-bin/conf
COPY files/flume-env.sh /apache-flume-1.8.0-bin/conf

ENTRYPOINT ["./launch.sh"]
CMD ["./init.sh"]
