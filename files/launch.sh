#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/hadoop-2.7.6
export HIVE_HOME=/apache-hive-2.3.3-bin
export HCAT_HOME=$HIVE_HOME/hcatalog/
export SPARK_HOME=/spark-2.3.2-bin-hadoop2.7
export PATH=$HADOOP_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$PATH

bash -c "$1"
