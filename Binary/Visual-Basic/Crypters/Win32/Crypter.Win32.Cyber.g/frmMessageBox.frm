VERSION 5.00
Begin VB.Form frmMessageBox 
   Appearance      =   0  'Flat
   AutoRedraw      =   -1  'True
   BorderStyle     =   1  'Fixed Single
   Caption         =   "CyberCrypt"
   ClientHeight    =   1995
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4650
   ControlBox      =   0   'False
   Icon            =   "frmMessageBox.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1995
   ScaleWidth      =   4650
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton PctButton 
      Caption         =   "Retry"
      Height          =   375
      Index           =   2
      Left            =   1200
      TabIndex        =   0
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton PctButton 
      Caption         =   "Cancel"
      Height          =   375
      Index           =   1
      Left            =   2520
      TabIndex        =   1
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton PctButton 
      Caption         =   "OK"
      Height          =   375
      Index           =   0
      Left            =   3600
      TabIndex        =   2
      Top             =   1560
      Width           =   975
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00000000&
      Height          =   615
      Left            =   180
      Top             =   480
      Width           =   495
   End
   Begin VB.Label lblMessage 
      BackStyle       =   0  'Transparent
      Caption         =   "<Unknown Message>"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1275
      Left            =   840
      TabIndex        =   3
      Top             =   120
      Width           =   3645
      WordWrap        =   -1  'True
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   3
      Left            =   225
      Picture         =   "frmMessageBox.frx":030A
      Top             =   540
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   0
      Left            =   135
      Picture         =   "frmMessageBox.frx":0BD4
      Top             =   540
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   1
      Left            =   225
      Picture         =   "frmMessageBox.frx":149E
      Top             =   540
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.Image imgIcon 
      Height          =   480
      Index           =   2
      Left            =   225
      Picture         =   "frmMessageBox.frx":1D68
      Top             =   540
      Visible         =   0   'False
      Width           =   480
   End
End
Attribute VB_Name = "frmMessageBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
End Sub

Private Sub Pctbutton_Click(Index As Integer)
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    PctbuttonSelect (Index)
End Sub

Private Sub PctbuttonSelect(Index As Integer)
    If PctButton(Index).Caption = "OK" Then
        Result = 0
    ElseIf PctButton(Index).Caption = "Yes" Then
        Result = 1
    ElseIf PctButton(Index).Caption = "No" Then
        Result = 2
    ElseIf PctButton(Index).Caption = "Cancel" Then
        Result = 3
    ElseIf PctButton(Index).Caption = "Retry" Then
        Result = 4
    ElseIf PctButton(Index).Caption = "Ignore" Then
        Result = 5
    ElseIf PctButton(Index).Caption = "Abort" Then
        Result = 6
    Else
        Result = 7
    End If
    
    Unload Me
End Sub
