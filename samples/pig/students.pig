students = LOAD 'hdfs://localhost:9000/pig_data/students.txt' USING PigStorage(',') as (firname:chararray,lastname:chararray,age:int,subject:chararray);

Dump students;
