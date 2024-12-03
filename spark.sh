#!bin/bash 

docker cp spark.jar spark-master:/spark.jar

docker exec spark-master spark-submit \
  --master spark://spark-master:7077 \
  --class com.example.WordCount \
  /spark.jar hdfs://namenode:9000/user/hadoop/input hdfs://namenode:9000/user/hadoop/spark-output