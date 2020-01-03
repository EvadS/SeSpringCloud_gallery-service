#ELK (ElasticSearch + Logstash + Kibana)

## Запуск (быстрый обзор, чтобы не и скать по всему файлу )
-------sudo journalctl -f
sudo -i service elasticsearch start
sudo -i service elasticsearch stop
sudo -i service elasticsearch status
sudo journalctl -f
-------

sudo -i service kibana start
sudo -i service kibana stop

------
sudo -i service logstash  status 

$ chown -R logstash.logstash /usr/share/logstash
$ chmod 777 /usr/share/logstash/data

bin/logstash -f logstash.conf

## Установите по очереди

* elasticsearch
https://www.elastic.co/downloads/elasticsearch

* logstash
https://www.elastic.co/downloads/logstash

* kibana
https://www.elastic.co/downloads/kibana

# Инструкции по установке 
## Elasticsearch
------------------------------------------------------------------------
этот блок добавляется один раз для всех троих (A)

### Download and install the public signing key:
https://www.elastic.co/guide/en/elasticsearch/reference/7.5/deb.html#deb-repo

### Import the Elasticsearch PGP Key
``` wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - ```

### Installing from the APT repository
``` sudo apt-get install apt-transport-https ```

#### Save the repository definition to /etc/apt/sources.list.d/elastic-7.x.list:

``` echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list ```

---------------------------------------------------------------------------
первая проблема - SDKMAN 
Если он установлен выполнем (смлтрим жто блок, иначе пропускаем )
при установленном sdkman javahome тянется из его настроек 
----
В базовом варианте пути прописываются в 
здесь какое-то настроки system variables (откуда берутся переменные окружения )
#### 1 
profile 
``` /etc/profile ```

#### 2 
system variable (по умолчанию если ничего нету в ~/.bashrc)
``` /etc/environment ``` (B)
для того чтобы подменить на время сессии в и терминале 

если выполнить
``` source /etc/environment ```
то в текущем терминале java home будет тянуться из system variable ((B))
можем проверить 
``` echo $JAVA_HOME ``` 

java home берется из  /etc/environment/ (3)
``` reset   ``` применить измененения из PATH если таковы были (я меня поскольку java хом из SDK MAN)

я записал в (3) java 11, затем выполнил (2),  
----------------------------------------------------------------------------

``` sudo apt-get update (1)```
``` sudo apt-get install elasticsearch (2) ```
-------------------------------------------
для последней версии необходимо JAVA 11 
установка 
/etc/environment - сюда дописываем путь к 11 - ке 
``` source /etc/environment ```
``` reset ``` 

---------------------------

### Configure Elasticsearch to start automatically
убрать из автозагрузки можно аеналогичной коммандой
``` sudo /bin/systemctl enable elasticsearch.service ``` (4)

### Enable Elasticsearch service
``` sudo systemctl enable elasticsearch.service ``` (5)

### Start the Elastic service using below command:
``` sudo systemctl start elasticsearch.service ``` (6)

### stop 
``` sudo systemctl stop elasticsearch.service  ``` (7)

### status  
``` sudo systemctl status elasticsearch.service  ``` (8)

### install curl 
``` sudo apt-get install curl ```

### Now test the Elasticsearch 
``` curl -X GET "localhost:9200/" ```

### Uninstall Elasticsearch on Ubuntu (optional)
```  sudo apt-get --purge autoremove elasticsearch ```

```  sudo rm -rf /var/lib/elasticsearch/ ```
```  sudo rm -rf /etc/elasticsearch ```

### Elasticsearch logs
``` sudo journalctl -u elasticsearch ```
------------------------------------------

## logstash
предполагается что блок (A) был выполнен 
``` sudo apt-get install apt-transport-https ```
 
``` echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list ``` 

``` sudo apt-get update && sudo apt-get install logstash ``` 

-------------------------------------------
## Настройка logstash
В ubuntu по умолчанию ставится в/usr/share/logstash/ и etc/logstash/

В /etc/logstash/ создайте файл logstash.conf

``` sudo touch  /etc/logstash/logstash.conf ``` 

ОБРАЩАЕМ внимание на  path => "/home/ks/logs/application.log"
-----------
input {
  file {
    type => "java"
    # Logstash insists on absolute paths...
    path => "/home/ks/logs/application.log"
    codec => multiline {
      pattern => "^%{YEAR}-%{MONTHNUM}-%{MONTHDAY} %{TIME}.*"
      negate => "true"
      what => "previous"
    }
  }
}
filter {
  #If log line contains tab character followed by 'at' then we will tag that entry as stacktrace
  if [message] =~ "\tat" {
    grok {
      match => ["message", "^(\tat)"]
      add_tag => ["stacktrace"]
    }
  }
  #Grokking Spring Boot's default log format
  grok {
    match => [ "message",
               "(?<timestamp>%{YEAR}-%{MONTHNUM}-%{MONTHDAY} %{TIME})  %{LOGLEVEL:level} %{NUMBER:pid} --- \[(?<thread>[A-Za-z0-9-]+)\] [A-Za-z0-9.]*\.(?<class>[A-Za-z0-9#_]+)\s*:\s+(?<logmessage>.*)",
               "message",
               "(?<timestamp>%{YEAR}-%{MONTHNUM}-%{MONTHDAY} %{TIME})  %{LOGLEVEL:level} %{NUMBER:pid} --- .+? :\s+(?<logmessage>.*)"
             ]
  }
  #Parsing out timestamps which are in timestamp field thanks to previous grok section
  date {
    match => [ "timestamp" , "yyyy-MM-dd HH:mm:ss.SSS" ]
  }
}
output {
    stdout {
        codec => rubydebug
    }
    elasticsearch{
        hosts=>["localhost:9200"]
        index=>"todo-logstash-%{+YYYY.MM.dd}"
    }
}


-----------
Ваш индекс называется todo-logstash.
Точно такой же файл создайте в корне проекта в IDEA. Только укажите свой путь к сохраняемому файлу с логами

-----------------------
# Как все это запустить  
1. elasticsearch
``` sudo service elasticsearch start ```

http://localhost:9200/
и видим что elasticsearch работает


меняем уровни доступа 
``` $ chown -R logstash.logstash /usr/share/logstash ```
``` $ chmod 777 /usr/share/logstash/data ```

`` bin/logstash -f logstash.conf ``

## kibana  
is an open source data visualization dashboard for Elasticsearch.

``` sudo apt-get update && sudo apt-get install kibana ```

``` sudo -i service kibana start ```
``` sudo -i service kibana stop  ``` 

http://localhost:5601

------------------------------------------
#№ Запуск
1. elasticsearch
``` sudo service elasticsearch start ```

2.  logstash 
переходим в папку
``` cd /usr/share/logstash```

и там в консоли пишем
```bin/logstash --verbose -f /etc/logstash/logstash.conf ```

т.е. запускаем logstash с нашими новыми настройками, которые мы создали (logstash.conf)

3. kibana
``` service kibana start ```

проверка kibana
http://localhost:5601


Здесь
http://localhost:9200/_cat/indices
видим все наши индексы.

в админке kibana 
Слева в меню (самая последняя) — Management — там выбираем Index Patterns — и там Create index pattern.
Пишите имя нашего индекса
todo-logstash
и он должен увидеть его. Жмем Next step — выбираем в списке timestamp — Ok.
Индекс создан.

Идем слева в меню в Discover (самый верхний пункт в меню слева) — там выбираем слева в окошке этот индекс.
Отправляем любым удобным способом запрос (браузер, Postman, консоль) и жмякаем на кнопку Refresh.
Мы увидим все наши запросы. Они будут попадать сюда посредством логера, который мы указали в классах в коде.



