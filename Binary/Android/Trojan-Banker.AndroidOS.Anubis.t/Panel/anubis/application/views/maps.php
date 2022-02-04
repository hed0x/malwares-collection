<div class="content" style="height:80%; color: #000; padding: 10px;">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-- Если вы используете API локально, то в URL ресурса необходимо указывать протокол в стандартном виде (http://...)-->
    <script src="//api-maps.yandex.ru/2.1/?lang=en_US" type="text/javascript"></script>
    <script src="icon_customImage.js" type="text/javascript"></script>
	<style>
        html, body, #map {
            width: 100%; height: 100%; padding: 0; margin: 0;
        }
    </style>
</head>

<div id="map"></div>


<?php
if (!(isset($_SESSION['panel_user'])))
{
	session_destroy();
	header("Location: /login.php");
}else{

	if ($_SESSION['panel_status']!="Action"){
		session_destroy();
		header("Location: /login.php");
	}

	if (($_SESSION['panel_right']!="admin")&&($_SESSION['panel_right']!="user")){
		header("Location: /index.php");
	}
}

$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
$connection->exec('SET NAMES utf8');
$query = ("SELECT * FROM markers");
$query2 = ("SELECT * FROM kliets");

$IMEI ="";
$lat = "";
$lng = "";
$type = "";
$provayder = "";
$icon = "";


		/****Ограничение по тегам****/
		$userRights = new users_right;
		$tags = explode("|", $userRights->getPrivateTags());
		$thisTag = explode(",", $tags[0]);
		$privateTag = explode(",", $tags[1]);
		/****************************/


foreach($connection->query($query) as $row)
	{
	  $IMEIx = $row['name'];
	  $latx = $row['lat'];
	  $lngx = $row['lng'];
	  $typex = $row['type'];

	  if($_SESSION['panel_right']!="admin")//Ограничение по тегам
		{
			$version_apk="||";
			foreach($connection->query($query2) as $row2)
			{
				if($row2['IMEI']==$IMEIx)
				{

					$version_apk = $row2['version_apk'];

					break;
				}
			}

			if($version_apk!="||")
			{
					$boolContinue=true;
					if($tags[0]!=",")
					{
						foreach($thisTag as $tag)
						{

							if($version_apk == $tag)
							{
								if($tag!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if($boolContinue){
							echo "$version_apk-$tag";

							continue;}

					}
					else
					{
						foreach($privateTag as $tag)
						{

							if($version_apk == $tag)
							{
								if($tag!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if(!$boolContinue)continue;
					}
			}
		}

	  $IMEI = "$IMEI|$IMEIx";
	  $lat = "$lat|$latx";
	  $lng = "$lng|$lngx";
	  $type = "$type|$typex";




	  //******Получаем иконку состояния бота, вычисляем дату****
		$arr_data_from = explode(" ", $row['time']);
		$arr_data_till = explode(" ", date('Y-m-d H:i'));

		$date_from = $arr_data_from[0];
		$date_till = $arr_data_till[0];

		$date_from = explode('-', $date_from);
		$date_till = explode('-', $date_till);

		$time_from = mktime(0, 0, 0, $date_from[1], $date_from[2], $date_from[0]);
		$time_till = mktime(0, 0, 0, $date_till[1], $date_till[2], $date_till[0]);

		$day = ($time_till - $time_from)/60/60/24; //получаем разницу кол-во дней!
		//----------Секунды!-------/
		$date1 = new \DateTime($row['time']);
		$date2 = new \DateTime(date('Y-m-d H:i'));
		$diff = $date2->diff($date1);
		// разница в секундах
		$seconds = ($diff->y * 365 * 24 * 60 * 60) + //получаем разницу в секундах!
		($diff->m * 30 * 24 * 60 * 60) +
		($diff->d * 24 * 60 * 60) +
		($diff->h * 60 * 60) +
		($diff->i * 60) +
		$diff->s;
		//----------обработка состояние иконки on/off-------/
		if($day>=1)//Дни!
		{
			$icon="$icon|images/icons/market_off.png";
		}
		else
		{
			if($seconds<=240)
			{
				$icon="$icon|images/icons/market_on.png";
			}
			else
			{
				$icon="$icon|images/icons/market_off.png";
			}
		}
	}
?>



 <script>

ymaps.ready(function () {
    var myMap = new ymaps.Map('map', {
            center: [0, 0],
            zoom: 2
        }, {
            searchControlProvider: 'yandex#search'
        });

var IMEIs = '<?php echo $IMEI;?>'.split('|');
var lats = '<?php echo $lat;?>'.split('|');
var lngs = '<?php echo $lng;?>'.split('|');
var types = '<?php echo $type;?>'.split('|');
var icons = '<?php echo $icon;?>'.split('|');

for(var i=1;i<IMEIs.length;i++)
{
		 // Создаём макет содержимого.
        MyIconContentLayout = ymaps.templateLayoutFactory.createClass(
            '<div style="color: #2F4F4F; text-shadow: 0.7px 0 0.7px #fff, 0 0.7px 0.7px #fff, -0.7px 0 0.7px #fff, 0 -0.7px 0.7px #fff; font-weight: bold;">$[properties.iconContent]</div>'
        ),
        myPlacemarkWithContent = new ymaps.Placemark([lats[i], lngs[i]], {
                iconContent: "["+types[i]+"]"+IMEIs[i],
        }, {
            // Опции.
            // Необходимо указать данный тип макета.
            iconLayout: 'default#imageWithContent',
            // Своё изображение иконки метки.
            iconImageHref: icons[i],
            // Размеры метки.
            iconImageSize: [24, 24],
            // Смещение левого верхнего угла иконки относительно
            // её "ножки" (точки привязки).
            iconImageOffset: [-24, -24],
            // Смещение слоя с содержимым относительно слоя с картинкой.
            iconContentOffset: [-45, 25],
            // Макет содержимого.
            iconContentLayout: MyIconContentLayout
        });

    myMap.geoObjects
        .add(myPlacemarkWithContent);

}


});


</script>



</div>
