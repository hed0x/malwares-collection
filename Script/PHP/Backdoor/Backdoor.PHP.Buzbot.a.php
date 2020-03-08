   <?php
   //$tok = strtok($read,"\n\t");
   //$tok = strtok("\n\t");
   //if(!$handle = fopen($filename,"a+")){ exit; }
   //$read = fread($handle,filesize($filename));
   //fclose($handle);
   //if($write = str_replace("$count $cnick\n","$newcount $nick\n",$read)){ echo "yes<br>"; $nickfound = "yes"; }
   //if($read = preg_replace("/$count $cnick\n/","$newcount $nick\n",$read)){ echo "yes<br>"; $nickfound = "yes"; }
   //echo str_replace("\n","<br>\n",$write);
   //function lols($string) { foreach(explode("->",$string) as $t) echo "$t<br>"; }
   //lols("a -> b -> c");
   //include('sockets.php');
   //$cmd="!lol";
   //if(preg_match("/(.*)!lol(.*)/",$cmd,$x)){ echo "yes"; };
   //$line=eregi_replace("^[^#]+#","",$line);
   //$line=explode(" ",$line);
   //$line=substr($line[3],1);
   //echo $buz;
   //exit;
   require_once("functions.php");
   set_time_limit(0);
   $set[server] = "irc.redesul.net";
   $set[nick] = "buzbot";
   $set[pass] = "crueldade";
   $set[channels] = "#crueis,#blumenau,#brusque";
   $set[ident] = "botino";
   $set[name] = "PHP bot";
   $set[owner] = "MH";

   $con=fsockopen($set[server],6667,$errno,$errstr);
   if (!$con) { echo "Erro ao conectar em ".$set[server]."\n<br>"; echo "Número do erro: $errno\n<br>Mensagem: $errstr"; exit; }
   $time_start = time();
   scmd("USER $set[ident] 8 *: :$set[name]");
   scmd("NICK ".$set[nick]);
   //if($set[pass]!=""){ scmd("NICKSERV IDENTIFY ".$set[pass]); }
   scmd("JOIN $set[channels]");
   while(!feof($con)){
   $buffer = fgets($con,513);
   echo "<font face=fixedsys size=1>".$buffer."<br>";
   $linha = explode(' ',$buffer);
   $text=preg_match("/ $linha[1] (.*) [:](.*)/",$buffer,$match); $text=$match[2];
   $host=substr($linha[0],1);
   $nick=explode("!",$host); $nick=$nick[0];
   if($linha[1]=="PRIVMSG") {
   $cmd=substr($linha[3],1); $cmd=strtolower($cmd); $cmd=trim($cmd);
   if(substr($linha[2],0,1)=="#"){ $onde=$linha[2]; } else{ $onde="PVT"; }
   rprivmsg($con,$onde,$text);
   if($cmd=="!cmd"){ $line=str_replace("$cmd ","",trim($text)); eval ("\$line = \"$line\";"); scmd($line); }
   if($cmd=="!cmdx"){ $x=4; while($t=$linha[$x]){ $line.=$t; } eval ("\$line = \"$line\";"); scmd($line); }
   if($onde!="PVT"){
   if($cmd=="!uptime"){ $time=gmdate("z\d G\h i\m",time() - $time_start); scmd("NOTICE $nick :Uptime Server: $time"); }
   if($onde=="#crueis"){
   if($cmd=="!kb"){ $kbnick=$linha[4]; $kbchan=$onde; scmd("who $onde"); }
   if($cmd=="!deop"){ scmd("MODE $onde -o $nick"); }
   if($cmd=="!op"){ scmd("MODE $onde +o $nick"); }
   if($cmd=="!voice"){ scmd("MODE $onde +v $nick"); }
   if($cmd=="!devoice"){ scmd("MODE $onde -v $nick"); }
   if($cmd=="!k" || $cmd=="!kick"){ scmd("KICK $onde $linha[4]"); }
   }
   if($cmd=="!lines"){ line($con,$onde,$nick,"show"); } else{ line($con,$onde,$nick,"onlycount"); }
   if($cmd=="!charada"){ scmd("PRIVMSG $onde :".charada()); }
   }
   if($onde=="PVT"){
   if($cmd=="!msg"){ scmd("PRIVMSG $linha[4]"); }
   if($cmd=="log" && strtolower($linha[4])=="x8"){ scmd("NOTICE $nick :Senha aceita. Voce esta logado."); }
   }
   }
   if($linha[1]=="NOTICE"){
   if(strtolower($nick)=="nickserv" && preg_match("/nickserv identify/",strtolower($text))){ scmd("NICKSERV IDENTIFY ".$set[pass]); }
   }
   if($linha[1]=="KICK" && $linha[3]==$set[nick]){ scmd("JOIN $linha[2]"); }
   if($linha[1]=="352"){
   //&& $kbchan==$linha[3]
   scmd("PRIVMSG #crueis :WHO $linha[7]");
   if(strtolower($linha[7])==strtolower($kbnick)){
   scmd("PRIVMSG #crueis :BANINDO $kbnick em $kbchan");
   scmd("MODE $kbchan +b *!*@$linha[5]");
   scmd("KICK $kbchan $kbnick requested");
   }
   }
   if($linha[0]=="PING"){ scmd("PONG $linha[1]"); }
   }
   ?>
