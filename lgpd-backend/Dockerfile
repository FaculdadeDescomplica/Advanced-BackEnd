# Usa a plataforma do JDK 17 para compilar
FROM openjdk:17-jdk-alpine
# Copia o arquivo lgpd-0.0.1-SNAPSHOT.jar para a imagem
ADD target/lgpd-0.0.1-SNAPSHOT.jar lgpd-0.0.1-SNAPSHOT.jar
# Expõem a porta 8080 para a aplicação
expose 8080
# Inicia o processo do contêiner usando o comando "java -jar target/lgpd-0.0.1-SNAPSHOT.jar"
ENTRYPOINT ["java","-jar","/lgpd-0.0.1-SNAPSHOT.jar"]