# ELK Stack
* <i>Elasticsearch</i> используется для хранения, анализа, поиска по логам.
* <i>Kibana</i> представляет удобную и красивую web панель для работы с логами.
* <i>Logstash</i> сервис для сбора логов и отправки их в Elasticsearch. В самой простой конфигурации можно обойтись без него и отправлять логи напрямую в еластик. Но с logstash это делать удобнее.

### Reference Documentation
For further reference, please consider the following sections:
export SDKMAN_DIR="$HOME/bin/sdkman"
curl -s "https://get.sdkman.io" | bash
exec $SHELL

Идем в браузере на
http://localhost:9200/
и видим что elasticsearch работает

elastik 
Проверяем, запустилась ли служба:

``` systemctl status elasticsearch.service ```

По-умолчанию, Kibana слушает порт 5601. 
``` systemctl status kibana.service ```


https://howtodoinjava.com/microservices/elk-stack-tutorial-example/
https://www.javainuse.com/spring/springboot-microservice-elk
https://xakep.ru/2017/04/06/elk-logs/