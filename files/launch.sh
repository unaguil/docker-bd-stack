#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/hadoop-2.9.0
export HIVE_HOME=/apache-hive-2.3.3-bin
export SPARK_HOME=/spark-2.3.0-bin-hadoop2.7
export PATH=$HADOOP_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$PATH

bash -c "$1"
