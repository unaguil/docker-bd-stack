FROM ubuntu

RUN apt-get update && apt-get install -y wget openjdk-8-jdk postgresql-client
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-2.7.3/hadoop-2.7.3.tar.gz && \
    tar xvzf hadoop-2.7.3.tar.gz && \
    rm hadoop-2.7.3.tar.gz

RUN wget http://apache.rediris.es/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz && \
    tar xvzf apache-hive-1.2.2-bin.tar.gz && \
    rm apache-hive-1.2.2-bin.tar.gz

RUN wget https://archive.apache.org/dist/spark/spark-2.3.0/spark-2.3.0-bin-hadoop2.7.tgz  && \
    tar xvzf spark-2.3.0-bin-hadoop2.7.tgz && \
    rm spark-2.3.0-bin-hadoop2.7.tgz

RUN wget http://mirrors.up.pt/pub/apache/zeppelin/zeppelin-0.8.0/zeppelin-0.8.0-bin-all.tgz && \
    tar xvfz zeppelin-0.8.0-bin-all.tgz && \
    rm zeppelin-0.8.0-bin-all.tgz

RUN wget http://apache.rediris.es/nifi/1.8.0/nifi-1.8.0-bin.tar.gz && \
    tar xvzf nifi-1.8.0-bin.tar.gz && \
    rm nifi-1.8.0-bin.tar.gz && \
    nifi-1.8.0/bin/nifi.sh install

RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.2.jar
RUN cp /postgresql-42.2.2.jar /apache-hive-1.2.2-bin/lib
RUN cp /postgresql-42.2.2.jar /spark-2.3.0-bin-hadoop2.7/jars

COPY files/launch.sh /
COPY files/init.sh /
COPY files/create_metastore.sh /

COPY files/hive-site.xml /apache-hive-1.2.2-bin/conf
COPY files/hive-site.xml /spark-2.3.0-bin-hadoop2.7/conf

COPY files/zeppelin-env.sh /zeppelin-0.8.0-bin-all/conf
COPY files/hive-site.xml /zeppelin-0.8.0-bin-all/conf

COPY files/nifi.properties /nifi-1.8.0/conf/

COPY files/hive-txn-schema-0.14.0.postgres.sql /

ENTRYPOINT ["./launch.sh"]
CMD ["./init.sh"]
