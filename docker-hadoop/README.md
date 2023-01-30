# docker-hadoop
A standalone single-node Hadoop image for Docker

1. Build the Docker image and run it

	1. Inside the root directory, run this command to create the image:

	`docker build . -t hadoop:1`

	2. Inside the root directory, run this command to initiate the container:

	`docker run -it --name hadoop --rm -p 50070:50070 -p 8088:8088 hadoop:1`

	3. Check web interfaces of Hadoop:
	
	`http://localhost:50070/explorer.html#/example`
	
	`http://localhost:8088/cluster`

2. Compile the MapReduce program and run it inside Hadoop prompt

	1. You can run this to start the PI Calculation example:

	`$ /root/hadoop/bin/hadoop jar /root/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-3.1.1.jar pi 1 10`

	2. Copy sample file into HDFS input directory:

	`$ /root/hadoop/bin/hadoop fs -mkdir -p /example`
	
	`$ /root/hadoop/bin/hadoop fs -put /root/example/criptomoedas.txt /example`

	3. Setup Java environment variables:

	`$ export JAVA_HOME=/usr/java/latest`
	
	`$ export PATH=${JAVA_HOME}/bin:${PATH}`
	
	`$ export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar`

	4. Compile MapReduce Java job into a .jar file:
	
	`$ /root/hadoop/bin/hadoop com.sun.tools.javac.Main /root/example/WordCount.java`
	
	`$ cd root/example`
	
	`$ jar cf wc.jar WordCount*.class`
	
	`$ cd ..`
	
	`$ cd ..`
	
	`$ jar tvf /root/example/wc.jar`

	5. Run the job:
	
	`$ /root/hadoop/bin/hadoop jar /root/example/wc.jar WordCount /example/criptomoedas.txt /example/criptomoedas_mapreduce_result`

	6. Show the results:
	
	`$ /root/hadoop/bin/hadoop fs -cat /example/criptomoedas_mapreduce_result/part-00000`
