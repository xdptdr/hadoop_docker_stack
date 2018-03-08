val textFile = sc.textFile("hdfs://localhost:9000/spark/input/wordcount/words")
val counts = textFile.flatMap(line => line.split(" ")).map(word => (word, 1)).reduceByKey(_ + _)
counts.saveAsTextFile("hdfs://localhost:9000/spark/output/wordcount");
