#!bin/bash 

docker cp input.txt namenode:/input.txt
docker exec namenode hdfs dfs -mkdir -p /user/hadoop/input
docker exec namenode hadoop dfs -rm -r /user/hadoop/input > /dev/null 2>&1
docker exec namenode hdfs dfs -put /input.txt /user/hadoop/input
