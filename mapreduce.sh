#!bin/bash 

input_file="$1"

docker cp mapreduce.jar namenode:/mapreduce.jar
docker exec namenode hadoop jar /mapreduce.jar com.mapreduce.WordCount /user/hadoop/input/"$input_file" /user/hadoop/output/"$input_file" > log.txt 2>&1


start_time=$(head -n 1 log.txt | awk '{print $1, $2}')
end_time=$(grep -i 'Job.*completed successfully' log.txt | awk '{print $1, $2}')

rm log.txt


if [ -z "$end_time" ]; then
    echo "Error: Could not find the completion timestamp in the log."
    exit 1
fi


start_seconds=$(date -d "$start_time" +%s%3N)
end_seconds=$(date -d "$end_time" +%s%3N)

execution_time=$((end_seconds - start_seconds))

echo "Execution time: $execution_time milliseconds"
