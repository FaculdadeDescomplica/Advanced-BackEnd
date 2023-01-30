#!/bin/sh

# Iniciando o SSH
/etc/init.d/ssh start

# Configurando Diretórios JAVA para facilitar a instalação
mkdir /usr/java
ln -s /usr/lib/jvm/java-1.8.0-openjdk-amd64 /usr/java/latest

# Linkando o hadoop para facilidade em configurações
ln -s /root/hadoop-3.1.1 /root/hadoop

# Passando alguns parâmetros iniciais para o start do serviço
echo 'export JAVA_HOME="/usr/java/latest"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_NAMENODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_NAMENODE_GROUP="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_DATANODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export HDFS_SECONDARYNAMENODE_USER="root"' >> /root/hadoop/etc/hadoop/hadoop-env.sh
echo 'export YARN_NODEMANAGER_USER="root"' >> /root/hadoop/etc/hadoop/yarn-env.sh
echo 'export YARN_RESOURCEMANAGER_USER="root"' >> /root/hadoop/etc/hadoop/yarn-env.sh

# Copiando os arquivos para os serviços
cp /root/conf/core-site.xml /root/hadoop/etc/hadoop/
cp /root/conf/hdfs-site.xml /root/hadoop/etc/hadoop/
cp /root/conf/mapred-site.xml /root/hadoop/etc/hadoop/
cp /root/conf/yarn-site.xml /root/hadoop/etc/hadoop/
cp /root/example/wordcount.java /root/hadoop/etc/hadoop/
cp /root/example/criptomoedas.txt /root/hadoop/etc/hadoop/

# Formatando o NameNode e iniciando o serviço HDFS e YARN
/root/hadoop/bin/hdfs namenode -format
/root/hadoop/sbin/start-dfs.sh
/root/hadoop/sbin/start-yarn.sh

# Iniciando sessão (ao iniciar a imagem, o último comando é para deixar você dentro do servidor, aonde você poderá começar a brincadeira)
/bin/bash