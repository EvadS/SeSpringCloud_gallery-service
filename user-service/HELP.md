# Getting Started


* Feign Client

 здесь мы указываем имя сервиса, к которому хотим обратиться (в аннотации), затем указываем, что в случае ошибки (недоступноcти сервиса gallery-service или базы данных) у нас отработает наш кастомный Fallback класс с какой-то нашей кастомной логикой.
 
 В самой реализации Feign мы должны использовать GsonEncoder
 
 Во всей этой неразберихе у нас вызывается в итоге метод getAllEmployeesList
 @RequestLine("GET /show")
 List<Bucket> getAllEmployeesList();
 
 Внимание!
 Метод должен иметь возвращаемое значение и по сигнатуре быть точно таким же как и метод на gallery-service, который мы вызываем, а именно метод по пути
 ``` /show ```
  Сам путь также должен быть идентичным.
  
  
 * RestTemplate
 * WebClient (неблокирующим клиентом с поддержкой Reactive Stream)


You want to use backtick not regular tick:

sudo kill -9 `sudo lsof -t -i:9001`
If that doesn't work you could also use $() for command interpolation:

sudo kill -9 $(sudo lsof -t -i:8761)

fuser -n tcp -k 8761
