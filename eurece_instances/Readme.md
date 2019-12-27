#Eureca instances 

сюда ложим jar ки bp eureka-service (после того как настроили несколько инстансов)

# запуск 

java -jar eappl.jar
java -jar -Dspring.profiles.active=france eappl.jar
java -jar -Dspring.profiles.active=united-states eappl.jar

Теперь можем в браузере

<i> http://my-eureka-server-us.com:9001 </i>
<i> http://my-eureka-server-fr.com:9002 </i>

Вы увидите Eureka dashboard, и заметьте, что каждая из этих реплик видит друг друга и основной Eureka Server.
