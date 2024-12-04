#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <file_path>"
  exit 1
fi

file_path="$1"
file_name=$(basename "$file_path")

docker cp "$file_path" namenode:/"$file_name"

docker exec namenode hdfs dfs -mkdir -p /user/hadoop/input

docker exec namenode hadoop dfs -rm /user/hadoop/input/"$file_name" > /dev/null 2>&1

docker exec namenode hdfs dfs -put /"$file_name" /user/hadoop/input/"$file_name"

echo "File '$file_name' has been copied to HDFS under '/user/hadoop/input/'."
