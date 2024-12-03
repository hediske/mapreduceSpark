#!bin/bash 

FILE=$1
docker cp $FILE namenode:/input
docker exec namenode hdfs dfs -mkdir -p /user/hadoop/input
docker exec namenode hdfs dfs -put /$FILE /user/hadoop/input
