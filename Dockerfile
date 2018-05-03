FROM ubuntu

RUN apt-get update && apt-get install -y wget openjdk-8-jdk postgresql-client
RUN wget http://apache.rediris.es/hadoop/common/hadoop-2.9.0/hadoop-2.9.0.tar.gz && \
    tar xvzf hadoop-2.9.0.tar.gz && \
    rm hadoop-2.9.0.tar.gz

RUN wget http://apache.rediris.es/hive/hive-2.3.3/apache-hive-2.3.3-bin.tar.gz && \
    tar xvzf apache-hive-2.3.3-bin.tar.gz && \
    rm apache-hive-2.3.3-bin.tar.gz

RUN wget http://apache.rediris.es/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz  && \
    tar xvzf spark-2.3.0-bin-hadoop2.7.tgz && \
    rm spark-2.3.0-bin-hadoop2.7.tgz

RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.2.jar -P /apache-hive-2.3.3-bin/lib

COPY files/hive-site.xml /apache-hive-2.3.3-bin/conf
COPY files/hive-site.xml /spark-2.3.0-bin-hadoop2.7/conf

ADD files /

ENTRYPOINT ["./launch.sh"]
CMD ["hiveserver2"]
