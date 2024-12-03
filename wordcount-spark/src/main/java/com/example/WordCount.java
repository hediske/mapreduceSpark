package com.example;

import org.apache.spark.api.java.JavaPairRDD;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;
import org.apache.spark.api.java.function.PairFunction;
import org.apache.spark.SparkConf;
import scala.Tuple2;

import java.util.Arrays;

public class WordCount {
    public static void main(String[] args) {
        // Check if file path is passed
        if (args.length < 1) {
            System.err.println("Usage: WordCount <file>");
            System.exit(1);
        }

        // Initialize Spark
        SparkConf conf = new SparkConf().setAppName("WordCount").setMaster("local");
        JavaSparkContext sc = new JavaSparkContext(conf);

        long start = System.nanoTime();
        // Read input file
        JavaRDD<String> textFile = sc.textFile(args[0]);

        // Split lines into words and count them
        JavaRDD<String> words = textFile.flatMap(line -> Arrays.asList(line.split(" ")).iterator());

        // Convert words to pairs (word, 1)
        JavaPairRDD<String, Integer> wordPairs = words.mapToPair((PairFunction<String, String, Integer>) word -> new Tuple2<>(word, 1));

        // Reduce by key (sum up the counts for each word)
        JavaPairRDD<String, Integer> wordCounts = wordPairs.reduceByKey(Integer::sum);
        
        long end = System.nanoTime();
        
        // Save the output
        wordCounts.saveAsTextFile("output");

        // Print the result
        System.out.println("Job completed in : " + (end - start) / 1000000.0 + " ms");
        
        // Stop the SparkContext
        sc.stop();


    }
}
