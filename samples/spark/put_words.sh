#!/bin/bash
hdfs dfs -mkdir -p /spark/input/wordcount
hdfs dfs -put words /spark/input/wordcount/words
