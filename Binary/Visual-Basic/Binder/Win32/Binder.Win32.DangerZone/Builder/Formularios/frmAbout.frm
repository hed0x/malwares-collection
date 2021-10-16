VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   5865
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4035
   LinkTopic       =   "Form1"
   Picture         =   "frmAbout.frx":0000
   ScaleHeight     =   5865
   ScaleWidth      =   4035
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer2 
      Left            =   2520
      Top             =   2880
   End
   Begin VB.Timer Timer1 
      Left            =   1440
      Top             =   2640
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim Cuenta As Long, Direccion As Byte

Private Sub Form_Load()

    Me.Top = 4000
    Me.Left = 5500
    Me.Height = Me.Height
    Me.Width = Me.Width
    Timer1.Interval = 20
    Direccion = 1
    Cuenta = 0
    
End Sub

Private Sub Timer1_Timer()

If Direccion = 1 Then
    Me.Top = Me.Top - 33
    Cuenta = Cuenta + 1
If Cuenta = 50 Then
    Direccion = 2
    Cuenta = 0
End If
End If

If Direccion = 2 Then
    Cuenta = Cuenta + 1
If Cuenta = 100 Then
    Direccion = 3
    Cuenta = 0
End If
End If

End Sub

Private Sub form_Click()

Unload Me

frmMain.Show

End Sub
