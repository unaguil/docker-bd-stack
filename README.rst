Hadoop-Hive-Spark in standalone mode
====================================

This docker application contains the following tools in standalone mode:

* Hadoop 2.7.3
* Hive 1.2.2
* Spark 2.0.2
* Zeppelin 0.8.0
* Nifi 1.8.0

.. warning::

Set the DATA_DIR environment variable to a directory where the Hive data
(metastore and warehouse) prior executing any of the following commands.

.. code-block:: console

  export DATA_DIR=<dir>


Create Hive metastore database
------------------------------

.. code-block:: console

   docker run --rm --network=dockerbdstack_default -it docker-bd-stack ./create_metastore.sh
   docker-compose restart


Launch
------

.. code-block:: console

  docker-compose up -d


Connecting remotely
-------------------

Once everything is started you can test the database using Beeline

.. code-block:: console

   docker run --rm --network=dockerbdstack_default -it docker-bd-stack "beeline -u jdbc:hive2://stack:10000"

Add some data using Beeline console

.. code-block:: sql

   CREATE TABLE test (id INT, name STRING) CLUSTERED BY (id) INTO 2 BUCKETS STORED AS ORC TBLPROPERTIES ("transactional"="true");
   INSERT INTO test VALUES (0, 'somedata-0');
   INSERT INTO test VALUES (1, 'somedata-1');
   INSERT INTO test VALUES (2, 'somedata-2');


Using Zeppelin
--------------

Open the following URL in your browser `<http://localhost:8080>`_.
Connect to the Hive context from Spark

.. code-block:: scala

  import org.apache.spark.sql.SparkSession

  val spark = SparkSession.builder().enableHiveSupport().getOrCreate()

  import spark.implicits._
  import spark.sql

  sql("SELECT * FROM test").show()


Accessing Nifi
--------------

The running instance of Nifi can be accesed at `<http://localhost:8090/nifi>`_.
Load the example workflow located at files/HTTPtoHive.xml into Nifi and execute
the workflow. It will create an HTTP server listening at port 9080 and waiting
for incoming JSON data.

Run the provided example script to insert new data:

.. code-block: console

    python3 scripts/insert_data.py


Stopping
--------

.. code-block:: console

   docker-compose stop


Stopping and remove containers
------------------------------

.. code-block:: console

   docker-compose down
