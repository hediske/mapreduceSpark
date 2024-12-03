#!bin/bash 

docker cp spark.jar spark-master:/spark.jar

docker exec spark-master spark-submit \
  --master spark://spark-master:7077 \
  --class com.example.WordCount \
  --conf "spark.hadoop.fs.defaultFS=hdfs://namenode:9000" \
  /spark.jar \
  hdfs://namenode:9000/user/hadoop/input \
  hdfs://namenode:9000/user/hadoop/spark-output >> log.txt 2>&1

FINISHED_TIME=$(grep -o 'Job completed in : [0-9]*\.[0-9]* ms' log.txt)


rm log.txt

if [[ -n "$FINISHED_TIME" ]]; then
    echo "$FINISHED_TIME"
else
    echo "error in execution"
fi