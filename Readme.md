### Cтандартные возможности Spring Cloud (Netflix OSS).
Netflix OSS
Used: Eureka, Config Server, Config Client, Zuul Api Gateway, Feign Client, RestTemplate, WebClient, Hystrix, Ribbon, Security (JWT) + MongoDB + Docker + Reactive (Spring WebFlux).

#Используемые технологии 
* Eureka Server(User-Service)
* Feign Client (User-Service,RestTemplate, Feign Client,  WebClient)
* Hystrix
* MongoDB 
----------------
* Zuul API Gateway 
* Ribbon
* Load Balancer
* Config Service 
* Config Сlient
* JWT Security
-------------------
* Elastic Search Kibana


### уточнения 

### Компоненты системы 
Eureka Server - Discovery server 
User-Service  - Discovery client 


## Запуск всего этого 
1. Eureka Server      http://localhost:8761 
2. gallery-service    http://localhost:8766
3. user-service       http://localhost:8082
4. zuul-service       http://localhost:8766
5. security-service.  http://localhost:9100

##Mongo DB 
изначально я предполагаю использование установленного монго 
####статус 
``` sudo service mongod status ```

####страрт 
``` sudo service mongod start ```

####стопнуть
``` sudo service mongod stop ```

в gallery service есть инструкия по использованию <b>doker</b> 
#Тестируем:

-------------------------------------
POST
localhost:8766/auth
{
	"username":"admin",
	"password":"admin"
}

При условии что у вас установлено
Content-Type — application/json Accept — application/json

В ответе в Headers вы получите сгенерированный токен.
Скопируйте и вставьте его в Authorization — и выберите там Bearer token

localhost:8766/my-gallery-path/show






##Дополнительные материалы 

* [Spring Cloud Netflix: Hystrix по-русски + Feign Client](https://medium.com/@kirill.sereda/spring-cloud-netflix-hystrix-%D0%BF%D0%BE-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8-e60e91a6770f)

* [статья Reactive](https://medium.com/@kirill.sereda/reactive-programming-reactor-%D0%B8-spring-webflux-3f779953ed45)

* [статья Feign Client](https://medium.com/@kirill.sereda/spring-cloud-netflix-feign-%D0%BF%D0%BE-%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8-7b8272e8e110)




запросы на Gallery service 
RestTemplate, Feign Clientи WebClient
user-service будет получать данные из БД через gallery-service. В случае выхода из строя БД или gallery-service мы будем использовать библиотеку Hystrix

Gallery-Service
http://localhost:8081/

https://medium.com/@kirill.sereda/spring-cloud-netflix-microservices-start-project-%D1%81%D0%B5%D1%80%D0%B8%D1%8F-%D1%81%D1%82%D0%B0%D1%82%D0%B5%D0%B9-%D1%87%D0%B0%D1%81%D1%82%D1%8C-1-7a892ad5f16

Запуск проекта.
без докера
 
``` make run ```

очистка портов 
fuser -n tcp -k 8761
kill -9 PID


## Замечания 

Ribbon
user-service/src/main/resources/application.yml


movie-service:
  ribbon:
    eureka:
      enabled: true
    ServerListRefreshInterval: 1000

#movie-service:
#  ribbon:
#    listOfServers: localhost:8085,localhost:8086
#    eureka:
#      enabled: true


в дополнение (серверы для балансировки ) мы коментируем первую расскоментим вторую настройку
собираем майвеном 
java -jar -Dserver.port=8086 uappl.jar\

смотрим : localhost:8082/get

Если мы попробуем несколько раз обновить страницу по этому запросу, то увидим как меняется порт, т.к. Ribbon определяет сам, какому сервису (movie-service либо его реплике запущенной на другом порту необходимо обратиться, в зависимости от нагрузки).



