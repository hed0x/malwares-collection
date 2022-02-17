VERSION 5.00
Begin VB.Form FrmMoveArch 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Move Archive (<Archive>)"
   ClientHeight    =   2205
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4695
   Icon            =   "FrmMoveArch.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CloseCmd 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2640
      TabIndex        =   3
      Top             =   1680
      Width           =   855
   End
   Begin VB.CommandButton OKCmd 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   4
      Top             =   1680
      Width           =   855
   End
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   240
      TabIndex        =   5
      Top             =   240
      Width           =   4215
      Begin VB.CommandButton NBrowse 
         Caption         =   "..."
         Height          =   375
         Left            =   3720
         TabIndex        =   2
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox NewArchLoc 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   600
         Width           =   2175
      End
      Begin VB.TextBox CurArchPath 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1440
         Locked          =   -1  'True
         TabIndex        =   0
         Top             =   240
         Width           =   2655
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "New location:"
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   975
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Current location:"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   1155
      End
   End
End
Attribute VB_Name = "FrmMoveArch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FileNameS As String

Private Sub CloseCmd_Click()
    Unload Me
End Sub

Private Sub Form_Load()

    c = 0
    s = 0
    J = 0
    
    For M = 1 To Len(CyTFile)
        GetChr0 = Right(CyTFile, M)
        GetChr1 = Left(GetChr0, 1)
        If GetChr1 = "\" Or GetChr1 = "/" Then
            c = c + 1
        End If
    Next M
    For M = 1 To Len(CyTFile)
        GetChr0 = Left(CyTFile, M)
        GetChr1 = Right(GetChr0, 1)
        J = J + 1
        If GetChr1 = "\" Or GetChr1 = "/" Then
            J = 0
            s = s + 1
            If s = c Then
                CurArchPath.Text = Right(GetChr0, M - J): Exit For
            End If
        End If
    Next M
    For E = 1 To Len(CyTFile)
        GetChr0 = Right(CyTFile, E)
        GetChr1 = Left(GetChr0, 1)
        If GetChr1 = "\" Or GetChr1 = "/" Then
            FileNameS = Right(GetChr0, E - 1): Exit For
        End If
    Next E
    
    Me.Caption = "Move Archive (" & FileNameS & ")"
    
End Sub

Private Sub NBrowse_Click()
    SelectOption = 6
    FrmDir.Show 1, Me
End Sub

Private Sub OKCmd_Click()
    Close 'Closes all file buffers for newer ones
    If NewArchLoc = "" Then MessageBox "You must enter a path to move the archive to.", OKOnly, Information: Exit Sub
    If CyTFile = NewArchLoc Then Unload Me: Exit Sub
    If Right(NewArchLoc, 1) = "\" Or Right(NewArchLoc, 1) = "/" Then
        FileCopy CyTFile, NewArchLoc & FileNameS
            KillArchive CyTFile
        CyTFile = NewArchLoc & FileNameS
        frmMain.CommonDialog.FileName = NewArchLoc & FileNameS
    ElseIf Right(NewArchLoc, 1) <> "\" And Right(NewArchLoc, 1) <> "/" Then
        FileCopy CyTFile, NewArchLoc & "\" & FileNameS
            KillArchive CyTFile
        CyTFile = NewArchLoc & "\" & FileNameS
        frmMain.CommonDialog.FileName = NewArchLoc & "\" & FileNameS
    End If
    Unload Me
End Sub
