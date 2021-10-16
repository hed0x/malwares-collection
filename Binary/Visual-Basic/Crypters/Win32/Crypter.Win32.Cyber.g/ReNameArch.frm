VERSION 5.00
Begin VB.Form ReNameArch 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Rename Archive (<Archive>)"
   ClientHeight    =   2205
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4695
   Icon            =   "ReNameArch.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2205
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   1215
      Left            =   240
      TabIndex        =   4
      Top             =   240
      Width           =   4215
      Begin VB.TextBox CurName 
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
      Begin VB.TextBox NewName 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   1440
         TabIndex        =   1
         Top             =   600
         Width           =   2655
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Current Name:"
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   1020
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "New Name:"
         Height          =   195
         Left            =   120
         TabIndex        =   5
         Top             =   600
         Width           =   840
      End
   End
   Begin VB.CommandButton OKCmd 
      Caption         =   "&OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   3600
      TabIndex        =   3
      Top             =   1680
      Width           =   855
   End
   Begin VB.CommandButton CloseCmd 
      Caption         =   "&Cancel"
      Height          =   375
      Left            =   2640
      TabIndex        =   2
      Top             =   1680
      Width           =   855
   End
End
Attribute VB_Name = "ReNameArch"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CloseCmd_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    For H = 1 To Len(ArchiveName)
        GetChr0 = Left(ArchiveName, H)
        GetChr1 = Right(GetChr0, 1)
        If GetChr1 = "." Then
            Me.Caption = "Rename Archive (" & ArchiveName & ")"
            CurName.Text = Left(GetChr0, H - 1)
            Exit For
        End If
    Next H
End Sub

Private Sub NBrowse_Click()
    SelectOption = 6
    FrmDir.Show 1, Me
End Sub

Private Sub NewName_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then OKCmd_Click
End Sub

Private Sub OKCmd_Click()

    On Error GoTo FinliseError
    
    Close

    Dim ExtentArchive As String

    If CurName.Text = NewName.Text Then Unload Me: Exit Sub
    
    If NewName.Text = "" Then MessageBox "You must enter a new name for the archive before clicking OK.", OKOnly, Critical: Exit Sub
   
    For H = 1 To Len(ArchiveName)
        GetChr0 = Right(ArchiveName, H)
        GetChr1 = Left(GetChr0, 1)
        If GetChr1 = "." Then
            Me.Caption = "Rename Archive (" & ArchiveName & ")"
            ExtentArchive = Right(GetChr0, H - 1)
            Exit For
        End If
    Next H
    
    For T = 1 To Len(NewName.Text)
        GetChr0 = Left(NewName.Text, T)
        GetChr1 = Right(GetChr0, 1)
        If InStr(1, "\/:*?<>|" & Chr(34), GetChr1) Then
            MessageBox "Error, invalid new archive name. Found invalid characters.", OKOnly, Critical
            Exit Sub
        End If
    Next T
    
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
                PathName = Right(GetChr0, M - J): Exit For
            End If
        End If
    Next M
    
    If Right(PathName, 1) = "\" Or Right(PathName, 1) = "/" Then
        FileCopy CyTFile, PathName & NewName.Text & "." & ExtentArchive
    ElseIf Right(PathName, 1) <> "\" And Right(PathName, 1) <> "/" Then
        FileCopy CyTFile, PathName & "\" & NewName.Text & "." & ExtentArchive
    End If
    KillArchive CyTFile
    
    If Right(PathName, 1) = "\" Or Right(PathName, 1) = "/" Then
        CyTFile = PathName & NewName.Text & "." & ExtentArchive
        frmMain.CommonDialog.FileName = PathName & NewName.Text & "." & ExtentArchive
    ElseIf Right(PathName, 1) <> "\" And Right(PathName, 1) <> "/" Then
        CyTFile = PathName & "\" & NewName.Text & "." & ExtentArchive
        frmMain.CommonDialog.FileName = PathName & "\" & NewName.Text & "." & ExtentArchive
    End If
    
    ArchiveName = NewName & "." & ExtentArchive
    GetListData
    
    Unload Me
    Exit Sub
   
FinliseError:
   
    MessageBox "Error, could not Rename file.", OKOnly, Critical
    Unload Me
   
End Sub
