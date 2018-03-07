#!/bin/bash
hdfs dfs -mkdir /pig_data
hdfs dfs -put students.txt /pig_data
