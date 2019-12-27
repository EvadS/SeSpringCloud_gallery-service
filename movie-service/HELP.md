# Getting Started

Запуск MongoDB на порту 27018

```  docker run mongo --port 27018 ```


Делаем jar файл для movie-service

mvn install

и запускаем ее на другом порту 8086 (сам movie-service на 8085 порту).
``` java -jar -Dserver.port=8086 movie-service-0.0.1-SNAPSHOT.jar ```