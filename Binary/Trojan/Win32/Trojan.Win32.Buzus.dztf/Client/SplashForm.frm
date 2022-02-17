VERSION 5.00
Begin VB.Form SplashForm 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   2850
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7785
   LinkTopic       =   "Form1"
   ScaleHeight     =   2850
   ScaleWidth      =   7785
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer SplashTimer 
      Interval        =   3500
      Left            =   120
      Top             =   240
   End
   Begin VB.Image Image1 
      Height          =   2850
      Left            =   0
      Picture         =   "SplashForm.frx":0000
      Top             =   0
      Width           =   7785
   End
End
Attribute VB_Name = "SplashForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private ReadyToUnload As Boolean
Private TimerExpired As Boolean
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const HWND_TOPMOST = -1

Private Sub HideSplash()
frmMain.Show
Unload Me
End Sub

Public Sub ReadyToWork()
ReadyToUnload = True
If TimerExpired Then HideSplash
End Sub

Public Sub ShowSplash()
SplashTimer.Interval = 3000
    
Left = (Screen.Width - Width) / 2
Top = (Screen.Height - Height) / 2

SetWindowPos hwnd, HWND_TOPMOST, 0, 0, 0, 0, _
SWP_NOMOVE + SWP_NOSIZE
Me.Show
End Sub

Private Sub Form_Load()

SplashForm.Top = (Screen.Height * 0.85) / 2 - SplashForm.Height / 2
SplashForm.Left = Screen.Width / 2 - SplashForm.Width / 2
SplashForm.ReadyToWork

End Sub

' The minimum time has expired.
Private Sub SplashTimer_Timer()
TimerExpired = True
SplashTimer.Enabled = False
If ReadyToUnload Then HideSplash
End Sub

