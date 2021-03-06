#!/bin/sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export HADOOP_HOME=/hadoop-2.7.3
export HIVE_HOME=/apache-hive-1.2.2-bin
export HCAT_HOME=$HIVE_HOME/hcatalog/
export SPARK_HOME=/spark-2.3.0-bin-hadoop2.7
export PATH=$HADOOP_HOME/bin:$HIVE_HOME/bin:$SPARK_HOME/bin:$PATH

bash -c "$1"
