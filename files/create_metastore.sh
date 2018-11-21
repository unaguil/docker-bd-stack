#!/bin/sh
PGPASSWORD=hivepassword psql -U hiveuser -h metastore -d metastore -f /hive-txn-schema-0.14.0.postgres.sql
