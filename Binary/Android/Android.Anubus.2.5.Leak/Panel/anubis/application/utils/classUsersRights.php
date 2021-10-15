<?php
class users_right{
	
	function getPrivateTags()
	{
		$textThisTag="";
		$privateTag="";
		$connection = new PDO('mysql:host='.SERVER.';dbname='.DB, USER, PASSWORD);
        $connection->exec('SET NAMES utf8');      
		$sql2 = "SELECT * FROM t_users";
		foreach($connection->query($sql2) as $row)
		{
			$login = $row['login'];
			$right = $row['right_'];
			$tag = $row['tag'];
			
			if($_SESSION['panel_user'] == $login)
			{
				$tag=str_replace(", ",",",$tag);
				$tag=str_replace(",  ",",",$tag);
				$textThisTag="$textThisTag,$tag";
			}else{
				if($tag!="")$privateTag="$privateTag,$tag";
			}
		}
		$privateTag=str_replace(", ",",",$privateTag);
		$privateTag=str_replace(",  ",",",$privateTag);
		return "$textThisTag|$privateTag";
	}
	
	
}
