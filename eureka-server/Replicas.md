Мы симулируем создание 2 реплик и развертываем из на 2-х разных серверах, с 2-мя разными доменными именами.
в файле /etc/hosts (я использую ubuntu) добавляем записи
127.0.0.1       my-eureka-server.com
127.0.0.1       my-eureka-server-us.com
127.0.0.1       my-eureka-server-fr.com