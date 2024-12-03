#!bin/bash 

cd wordcount-mapreduce
mvn clean package
mv target/wordcount-mapreduce-1.0-SNAPSHOT.jar ../mapreduce.jar

cd ../wordcount-spark
mvn clean package
mv target/wordcount-spark-1.0-SNAPSHOT.jar ../spark.jar


docker compose up -d
docker compose stop 
docker cp input.txt namenode:/input.txt
docker exec namenode hdfs dfs -mkdir -p /user/hadoop/input
docker exec namenode hdfs dfs -put /input.txt /user/hadoop/input


