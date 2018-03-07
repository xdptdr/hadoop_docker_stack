students = LOAD 'hdfs://localhost:9000/pig_data/students.txt' USING PigStorage(',') as (id:int,name:chararray,city:chararray);

Dump students;
