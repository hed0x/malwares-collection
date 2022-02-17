VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FrmConvert 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Archive Conversion"
   ClientHeight    =   3495
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6135
   ControlBox      =   0   'False
   Icon            =   "FrmConvert.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3495
   ScaleWidth      =   6135
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog Dlg 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.FileListBox FileList 
      Height          =   1260
      Left            =   120
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   3720
      Visible         =   0   'False
      Width           =   4095
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "C&ancel"
      Height          =   375
      Left            =   3480
      TabIndex        =   1
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton OKCmd 
      Caption         =   "&Convert"
      Default         =   -1  'True
      Height          =   375
      Left            =   4800
      TabIndex        =   2
      Top             =   3000
      Width           =   1215
   End
   Begin MSComctlLib.ListView ListFiles 
      Height          =   2055
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5895
      _ExtentX        =   10398
      _ExtentY        =   3625
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   $"FrmConvert.frx":030A
      Height          =   585
      Left            =   120
      TabIndex        =   3
      Top             =   2280
      Width           =   5895
      WordWrap        =   -1  'True
   End
End
Attribute VB_Name = "FrmConvert"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FolderName As String

Private Sub CmdCancel_Click()
    Unload Me
    frmMain.Visible = True
End Sub

Private Sub Form_Load()

    On Error GoTo FinaliseError
    
    'frmMain.Visible = False

    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture

    Dlg.ShowOpen

    If Dlg.FileName = "" Then Unload Me: frmMain.Visible = True: Exit Sub
    
    ArchName = Dlg.FileName

    For M = 1 To Len(GetTemporaryFilename)
        GetChr1 = Left(GetTemporaryFilename, M)
        GetChr2 = Right(GetChr1, 1)
        If GetChr2 = "\" Or GetChr2 = "/" Then
            TempRootS = GetChr1
        End If
    Next M

    EncryptionAgentA = False
    CompressionAgentA = False
    SwapAgentA = False
    
    ListFiles.ColumnHeaders.Add , , "Filename", 2400
    ListFiles.ColumnHeaders.Add , , "Size", 2100
    ListFiles.ColumnHeaders.Add , , "Offset", 1300
    
    If CyTConvertOpen(ArchName, ListFiles) = False Then MessageBox "The archive you are trying to convert might be corrupt, if the problem continues then please read the help documents, which you can find in the menu.", OKOnly, Critical: Unload Me
    
    frmMain.Visible = True
    
FinaliseError:

    If Erro = 5 Then
    
        Unload Me
        frmMain.Visible = True
        Exit Sub
    
    End If

End Sub

Private Function CreateDirectory(FolderNameS As String)

    On Error Resume Next

    If Dir$(FolderNameS) <> "" Then Exit Function
        
    If Dir$(FolderNameS) = "" Then
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            MkDir TempRootS & FolderNameS
                Else
            MkDir TempRootS & "\" & FolderNameS
        End If
    End If
    
End Function


Private Sub Form_Unload(Cancel As Integer)
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
End Sub

Private Sub OKCmd_Click()

    On Error GoTo FinaliseError

    'In the following command, the conversion takes place using the main
    'functions in the conversion module.

    Dim CreatedFileN As String

    Randomize Timer

    CreatedFileN = CStr("Conv" & Int(Rnd * 1000))

    FolderName = CreatedFileN
    
    CreateDirectory CreatedFileN
     
    Me.Hide
    FrmConvertLoader.Show
    
    FrmConvertLoader.ProgressBar.Max = FileList.ListCount
    
    FrmConvertLoader.ProgressBar.Value = 0
    
    DoEvents
     
    For T = 1 To ListFiles.ListItems.Count
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            If CyTConvertExtract(ArchName, ListFiles.ListItems.Item(T).Text, TempRootS & CreatedFileN & "\" & ListFiles.ListItems.Item(T).Text) = False Then MessageBox "This archive seems to be corrupt and cannot extract old file data.", OKOnly, Critical: Me.Visible = True: Unload FrmConvertLoader: Exit Sub
                Else
            If CyTConvertExtract(ArchName, ListFiles.ListItems.Item(T).Text, TempRootS & "\" & CreatedFileN & "\" & ListFiles.ListItems.Item(T).Text) = False Then MessageBox "This archive seems to be corrupt and cannot extract old file data.", OKOnly, Critical: Me.Visible = True: Unload FrmConvertLoader: Exit Sub
        End If
        If FrmConvertLoader.ProgressBar.Value < FileList.ListCount Then FrmConvertLoader.ProgressBar.Value = FrmConvertLoader.ProgressBar.Value + 1: FrmConvertLoader.lblPr.Caption = "Checking files...This may take a while."
        DoEvents
    Next T
    
    FrmConvertLoader.ProgressBar.Value = FileList.ListCount
    
    FrmConvertLoader.Visible = False
    
    FrmConvertTo.Show 1
    
    If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
        FileList.Path = TempRootS & FolderName
        CyTConvertCreate TempRootS & FolderName & "\" & FolderName & ".con"
            Else
        FileList.Path = TempRootS & "\" & FolderName
        CyTConvertCreate TempRootS & "\" & FolderName & "\" & FolderName & ".con"
    End If
    
    FrmConvertLoader.Visible = True
    
    DoEvents
    
    FrmConvertLoader.ProgressBar.Max = FileList.ListCount
    
    FrmConvertLoader.ProgressBar.Value = 0
    
    For W = 0 To FileList.ListCount
        If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
            CyTConvertAdd TempRootS & FolderName & "\" & FolderName & ".con", TempRootS & FolderName & "\" & FileList.List(W), FileList.List(W)
                Else
            CyTConvertAdd TempRootS & "\" & FolderName & "\" & FolderName & ".con", TempRootS & "\" & FolderName & "\" & FileList.List(W), FileList.List(W)
        End If
        If FrmConvertLoader.ProgressBar.Value < FileList.ListCount Then FrmConvertLoader.ProgressBar.Value = FrmConvertLoader.ProgressBar.Value + 1
        DoEvents
    Next W
    
    KillFile ArchName
    
    FrmConvertLoader.lblPr.Caption = "Copying data to new location..."
    
    Close
    
    If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
        FileCopy TempRootS & FolderName & "\" & FolderName & ".con", ArchName
            Else
        FileCopy TempRootS & "\" & FolderName & "\" & FolderName & ".con", ArchName
    End If
    
    FrmConvertLoader.lblPr.Caption = "File conversion complete"
    
    FrmConvertLoader.ProgressBar.Value = FileList.ListCount
    
    Unload Me
    
    FrmConvertLoader.OKCmd.Enabled = True
    
    Exit Sub
    
FinaliseError:

    MessageBox "Error, no archive to convert.", OKOnly, Critical
    Unload Me

End Sub
