docker exec namenode hadoop fs -rm -r /user/hadoop/output > /dev/null 2>&1
docker exec namenode hadoop fs -rm -r /user/hadoop/spark-output > /dev/null 2>&1
docker exec namenode hadoop dfs -rm -r /user/root/output > /dev/null 2>&1