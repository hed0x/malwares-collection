VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmAdd 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "NRG Binder"
   ClientHeight    =   3615
   ClientLeft      =   45
   ClientTop       =   405
   ClientWidth     =   6855
   BeginProperty Font 
      Name            =   "Calibri"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3615
   ScaleWidth      =   6855
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog dlg 
      Left            =   120
      Top             =   3000
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "Cancel"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5040
      TabIndex        =   12
      Top             =   3120
      Width           =   1695
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Add"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3240
      TabIndex        =   11
      Top             =   3120
      Width           =   1695
   End
   Begin VB.Frame fraExecution 
      Caption         =   "Execution"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   9
      Top             =   2040
      Width           =   3255
      Begin VB.ComboBox cmbExecution 
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   10
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.Frame fraFile 
      Caption         =   "File"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6615
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "Browse"
         BeginProperty Font 
            Name            =   "Calibri"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   -1  'True
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Left            =   5280
         TabIndex        =   2
         Top             =   360
         Width           =   1215
      End
      Begin VB.TextBox txtFile 
         Height          =   315
         Left            =   120
         TabIndex        =   1
         Top             =   360
         Width           =   5055
      End
   End
   Begin VB.Frame fraPath 
      Caption         =   "Path"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      TabIndex        =   7
      Top             =   2040
      Width           =   3255
      Begin VB.ComboBox cmbPath 
         Height          =   315
         Left            =   120
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.Frame fraParameters 
      Caption         =   "Parameters"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3480
      TabIndex        =   5
      Top             =   1080
      Width           =   3255
      Begin VB.TextBox txtParameters 
         Height          =   285
         Left            =   120
         TabIndex        =   6
         Text            =   "N/A"
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.Frame fraName 
      Caption         =   "Name"
      BeginProperty Font 
         Name            =   "Calibri"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   3255
      Begin VB.TextBox txtName 
         Height          =   285
         Left            =   120
         TabIndex        =   4
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.Line linMain 
      BorderColor     =   &H00808080&
      X1              =   -360
      X2              =   6840
      Y1              =   3000
      Y2              =   3000
   End
End
Attribute VB_Name = "frmAdd"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module    : frmAdd
' Author    : Cyntax
' Date      : 4/5/2010
' Purpose   : NRG Binder Add File Interface
'---------------------------------------------------------------------------------------

Private Sub cmdAdd_Click()
    If Len(txtName.Text) > 0 And Len(txtFile.Text) > 0 And Len(cmbPath.Text) > 0 And Len(cmbExecution.Text) > 0 And Len(txtParameters.Text) > 0 Then
        If cmdAdd.Caption = "Apply" Then
            frmMain.lvwMain.ListItems.Remove frmMain.lvwMain.SelectedItem.Index
        End If

        With frmMain.lvwMain.ListItems.Add
            .Text = txtFile.Text
            .SubItems(1) = txtName.Text
            .SubItems(2) = cmbPath.Text
            .SubItems(3) = cmbExecution.Text
            .SubItems(4) = txtParameters.Text
        End With
    End If
    Unload Me
End Sub

Private Sub cmdBrowse_Click()
    With dlg
        .FileName = vbNullString
        .DialogTitle = "Select File..."
        .Filter = "All Files (*.*)|*.*"
        .ShowOpen

        If Len(.FileName) > 0 And Dir(.FileName) <> vbNullString Then
            txtFile.Text = .FileName
            txtName.Text = .FileTitle
        End If
    End With
End Sub

Private Sub cmdCancel_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    With cmbExecution
        .AddItem "No Execution"
        .AddItem "Shell Execute (Normal)"
        .AddItem "Shell Execute (Hidden)"
        .AddItem "Process Injection (Stub)"
        .AddItem "Process Injection (Browser)"
        .AddItem "Process Injection (Explorer)"
    End With

    With cmbPath
        .AddItem "%HOMEDRIVE%"
        .AddItem "%WINDIR%"
        .AddItem "%APPDATA%"
        .AddItem "%TEMP%"
        .AddItem "%STUBPATH%"
    End With
End Sub
