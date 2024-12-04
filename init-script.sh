#!bin/bash 

cd wordcount-mapreduce
mvn clean package
mv target/wordcount-1.0-SNAPSHOT.jar ../mapreduce.jar

cd ../wordcount-spark
mvn clean package
mv target/spark-wordcount-1.0-SNAPSHOT.jar ../spark.jar


docker compose up -d


