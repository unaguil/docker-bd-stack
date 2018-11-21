cd /zeppelin-0.8.0-bin-all
./bin/zeppelin-daemon.sh start

service nifi start

hive --service metastore &
hiveserver2
