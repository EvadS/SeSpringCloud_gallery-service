#Spring Boot Cloud CLI

## Installation
To install, make sure you have **Spring Boot CLI**:
```
 spring version
``` 
>>>
Spring CLI v2.1.0.RELEASE
<<<


## SDKMan users
```
echo "Install SDKMan"
sudo apt-get update
sudo apt-get install unzip zip -y
sudo curl -s get.sdkman.io | bash
sudo source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version
```
--------------------
```
echo "Install Spring Dependencies"
sudo sdk install groovy
sudo sdk install java
sudo sdk install maven
```
--------------------------

### available 
sdk list springboot

```  sdk install springboot 2.1.0.RELEASE  ``` 
```  sdk use springboot 2.1.0.RELEASE ```

and install the Spring Cloud plugin

``` 
spring install org.springframework.cloud:spring-cloud-cli:2.1.0.BUILD-SNAPSHOT 
```

Available Servers to Launch(Доступно)
```  spring cloud --list ```

## Remove 
``` spring install org.springframework.cloud:spring-cloud-cli:2.1.0.BUILD-SNAPSHOT```

## Замечания 
у меня все поехало после:
- java8 
- удалил .m2


| Service          	| Name              	| Address                                                              	|                                                                                                                                                                                                                   	|
|------------------	|-------------------	|----------------------------------------------------------------------	|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	|
| eureka           	| Eureka Server     	| http://localhost:8761                                                	| Eureka server for service registration and discovery.  All the other services show up in its catalog by  default.                                                                                                 	|
| configserver     	| Config Server     	| http://localhost:8888                                                	| Spring Cloud Config Server running in the "native"  profile and serving configuration from the local  directory ./launcher                                                                                        	|
| h2               	| H2 Database       	| http://localhost:9095 (console), jdbc:h2:tcp://localhost:9096/{data} 	| Relation database service. Use a file path for  {data}  (e.g.  ./target/test) when you connect. Remember  that you can add  ;MODE=MYSQL or  ;MODE=POSTGRESQL to connect with compatibility to other server types. 	|
| kafka            	| Kafka Broker      	| http://localhost:9091 (actuator endpoints), localhost:9092           	|                                                                                                                                                                                                                   	|
| hystrixdashboard 	| Hystrix Dashboard 	| http://localhost:7979                                                	| Any Spring Cloud app that declares Hystrix circuit  breakers publishes metrics on /hystrix.stream.   that address into the dashboard to visualize  all the metrics,                                               	|
| dataflow         	| Dataflow Server   	| http://localhost:9393                                                	| Spring Cloud Dataflow server with UI at /admin-ui.  Connect the Dataflow shell to target at root path.                                                                                                            	|
| zipkin           	| Zipkin Server     	| http://localhost:9411                                                	| Zipkin Server with UI for visualizing traces.  Stores span data in memory and accepts them  via HTTP POST of JSON data.                                                                                           	|
| stubrunner       	| tub Runner Boot   	| http://localhost:8750                                                	| Downloads WireMock stubs, starts WireMock and  feeds the started servers with stored stubs. Pass stubrunner.ids to pass stub coordinates and  then go to http://localhost:8750/stubs.                             	|
|                  	|                   	|                                                                      	|                                                                                                                                                                                                                   	|