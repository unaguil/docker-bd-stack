cd /zeppelin-0.8.0-bin-all
./bin/zeppelin-daemon.sh start

cd /apache-flume-1.8.0-bin
bin/flume-ng agent --conf conf --conf-file conf/flume.conf --name a1 & 

hiveserver2
