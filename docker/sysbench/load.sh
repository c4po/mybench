#!/bin/bash

table_size=25000
table_count=250
run_time=60
rds_db=test

rds_host='mysql'
rds_port='3306'
rds_user='root'
rds_pass='1234'


thread=2

sysbench --db-driver=mysql --mysql-user=${rds_user} --mysql-password=${rds_pass} --mysql-host=${rds_host} --mysql-port=${rds_port} --mysql-db=${rds_db} --table_size=${table_size} --tables=${table_count} /test/oltp_read_write.lua prepare

sysbench --db-driver=mysql --mysql-user=${rds_user} --mysql-password=${rds_pass} --mysql-host=${rds_host} --mysql-port=${rds_port} --mysql-db=${rds_db} --mysql-ignore-errors=1062,1213 --rand-type=uniform --table_size=${table_size} --tables=${table_count} --threads=${thread} --time=${run_time} /test/oltp_read_write.lua run > /report/MYSQL-RW-${thread}T
