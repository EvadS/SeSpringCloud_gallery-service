# Getting Started

на 3- м шаге (когда пытаемся запустить несмколько реплик )

maven install

java -jar -Dspring.profiles.active=gallery-service-replica01 target/gappl.jar

Идем на Eureka Server replica, ведь на ней сейчас наш gallery-service зарегистрирован

http://my-eureka-server-us.com:9001

и увидим там уже не один запущенный gallery-service, а 2 (т.к. у нас вторая - это реплика).
Идем на сам gallery-service
localhost:8081
видим что он видит Eureka Server replica и видит свою реплику (gallery-service replica).

