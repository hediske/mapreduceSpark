#!bin/bash 

docker cp mapreduce.jar namenode:/mapreduce.jar
docker exec namenode hadoop jar /mapreduce.jar com.mapreduce.WordCount /user/hadoop/input /user/hadoop/output

#docker exec namenode hdfs dfs -rm -r /user/hadoop/output
