VERSION 5.00
Begin VB.Form FrmDir 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "<Command>"
   ClientHeight    =   4290
   ClientLeft      =   1950
   ClientTop       =   1155
   ClientWidth     =   4215
   Icon            =   "FrmDir.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4290
   ScaleWidth      =   4215
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.FileListBox FileAdd 
      Height          =   1455
      Left            =   120
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   4320
      Visible         =   0   'False
      Width           =   3975
   End
   Begin VB.DirListBox DirS 
      Height          =   3240
      Left            =   120
      TabIndex        =   1
      ToolTipText     =   "Select a directory"
      Top             =   480
      Width           =   3975
   End
   Begin VB.DriveListBox DriveDir 
      Appearance      =   0  'Flat
      Height          =   315
      Left            =   120
      TabIndex        =   0
      ToolTipText     =   "Drive"
      Top             =   120
      Width           =   3975
   End
   Begin VB.CommandButton ExitCmd 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   3120
      TabIndex        =   3
      Top             =   3840
      Width           =   975
   End
   Begin VB.CommandButton OK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   2040
      TabIndex        =   2
      Top             =   3840
      Width           =   975
   End
End
Attribute VB_Name = "FrmDir"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub DirS_Change()
    On Error GoTo FinaliseError
    FileAdd.Path = DirS.Path
    Exit Sub
FinaliseError:
    MessageBox "Error, directory not responding.", OKOnly, Critical
End Sub

'Changes the drive, if the drive doesn't open the sub returns
'an error and sets the drive back to the lastdrive used
Private Sub DriveDir_Change()

    On Error GoTo FinaliseError
    
    DirS.Path = DriveDir
    Exit Sub
FinaliseError:
    MessageBox "Current drive not avialable.", OKOnly, Critical
    DriveDir = LastDrive
    
End Sub

Private Sub ExitCmd_Click()
    Unload Me
End Sub

Private Sub Form_Load()
    LastDrive = DriveDir.Drive
    If SelectOption = 1 Then
        Me.Caption = "Save to Directory"
    ElseIf SelectOption = 2 Then
        Me.Caption = "Add directory"
    ElseIf SelectOption = 3 Then
        Me.Caption = "Browse folder"
    ElseIf SelectOption = 4 Then
        Me.Caption = "Browse folder"
    ElseIf SelectOption = 5 Then
        Me.Caption = "Browse folder"
    ElseIf SelectOption = 6 Then
        Me.Caption = "Move archive to folder"
    ElseIf SelectOption = 7 Then
        Me.Caption = "Copy archive to folder"
    End If
End Sub

Private Sub OK_Click()

    If frmMain.ChkFile(CyTFile) = False Then Unload Me: Exit Sub

    On Error GoTo FinaliseError

    If SelectOption = 1 Then
        Me.Hide
        frmMain.Enabled = False
        frmMain.MousePointer = 11
        
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
        
        frmBusy.Show
        
        For Z = 1 To frmMain.ListFiles.ListItems.Count
            If Right(DirS.Path, 1) = "\" Or Right(DirS.Path, 1) = "/" Then
                frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracting to (" & DirS.Path & ") from (" & ArchiveName & ") file (" & frmMain.ListFiles.ListItems(Z) & ")"
                If FileExist(DirS.Path & frmMain.ListFiles.ListItems(Z)) = True Then KillFile CStr(DirS.Path & frmMain.ListFiles.ListItems(Z).Text)
                If frmMain.CyTExtract(CyTFile, frmMain.ListFiles.ListItems(Z), DirS.Path & frmMain.ListFiles.ListItems(Z)) = False Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & frmMain.ListFiles.ListItems(Z) & " -  - Error extracting (Data could of been lost or extraction folder could be missing or corrupt)": GoTo RegetFile
            ElseIf Right(DirS.Path, 1) <> "\" And Right(DirS.Path, 1) <> "/" Then
                frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Extracting to (" & DirS.Path & ") from (" & ArchiveName & ") file (" & frmMain.ListFiles.ListItems(Z) & ")"
                If FileExist(DirS.Path & "\" & frmMain.ListFiles.ListItems(Z)) = True Then KillFile CStr(DirS.Path & "\" & frmMain.ListFiles.ListItems(Z).Text)
                If frmMain.CyTExtract(CyTFile, frmMain.ListFiles.ListItems(Z), DirS.Path & "\" & frmMain.ListFiles.ListItems(Z)) = False Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & frmMain.ListFiles.ListItems(Z) & " - Error extracting (Data could of been lost or extraction folder could be missing or corrupt)": GoTo RegetFile
            End If
RegetFile:
            DoEvents
        Next
        Unload frmBusy
        frmMain.Enabled = True
        frmMain.MousePointer = 0
        
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
        
        Unload Me
        frmMain.SetFocus
        If FrmErrors.ErrorMessages.Text <> "" Then FrmErrors.Show 1, frmMain
        Exit Sub
    End If
    
    If SelectOption = 2 Then
        If FileAdd.List(0) = "" Then
            MessageBox "Error, it seems that theirs no files to add in selected directory.", OKOnly, Critical
            Exit Sub
        End If
        Me.Hide
        frmMain.Enabled = False
        frmMain.MousePointer = 11
        
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
        
        frmBusy.Show
        For Z = 0 To FileAdd.ListCount - 1
            If Right(DirS.Path, 1) = "\" Or Right(DirS.Path, 1) = "/" Then
                'If GetAttr(DirS.Path & FileAdd.List(Z)) = vbReadOnly Then MessageBox "File (" & DirS.Path & FileAdd.List(Z) & ") selected for adding to archive appears if it's read-only and cannot be accessed. This file will not be included into the archive.", OKOnly, Critical: GoTo ReGetFiles
                If DirS.Path & FileAdd.List(Z) = CyTFile Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & FileAdd.List(Z) & " - Could not add to archive (Current archive opened)": GoTo ReGetFiles
                If FileLen(DirS.Path & FileAdd.List(Z)) = 0 Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & FileAdd.List(Z) & " - Could not add to archive (Containts no data)": GoTo ReGetFiles
                
                For D = 1 To Len(DirS.Path & FileAdd.List(Z))
                    GetChr0 = Left(DirS.Path & FileAdd.List(Z), D)
                    GetChr1 = Right(GetChr0, 1)
                    If GetChr1 = "." Then Exit For
                    'If Len(GetChr0) = Len(DirS.Path & FileAdd.List(Z)) Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & FileAdd.List(Z) & " - Could not add to archive (No file extension)": GoTo ReGetFiles
                Next D
                
                frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Adding (" & FileAdd.List(Z) & ") to (" & ArchiveName & ")"
                If frmMain.CyTAdd(CyTFile, DirS.Path & FileAdd.List(Z), FileAdd.List(Z)) = False Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & FileAdd.List(Z) & " - Could not add to archive (File access error)": GoTo ReGetFiles
            ElseIf Right(DirS.Path, 1) <> "\" And Right(DirS.Path, 1) <> "/" Then
                'If GetAttr(DirS.Path & "\" & FileAdd.List(Z)) = vbReadOnly Then MessageBox "File (" & DirS.Path & "\" & FileAdd.List(Z) & ") selected for adding to archive appears if it's read-only and cannot be accessed. This file will not be included into the archive.", OKOnly, Critical: GoTo ReGetFiles
                If DirS.Path & "\" & FileAdd.List(Z) = CyTFile Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & "\" & FileAdd.List(Z) & " - Could not add to archive (Current archive opened)": GoTo ReGetFiles
                If FileLen(DirS.Path & "\" & FileAdd.List(Z)) = 0 Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & "\" & FileAdd.List(Z) & " - Could not add to archive (Containts no data)": GoTo ReGetFiles
                
                For D = 1 To Len(DirS.Path & "\" & FileAdd.List(Z))
                    GetChr0 = Left(DirS.Path & "\" & FileAdd.List(Z), D)
                    GetChr1 = Right(GetChr0, 1)
                    If GetChr1 = "." Then Exit For
                    'If Len(GetChr0) = Len(DirS.Path & FileAdd.List(Z)) Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & "\" & FileAdd.List(Z) & " - Could not add to archive (No file extension)": GoTo ReGetFiles
                Next D
                
                frmMain.StatusBar.Panels.Item(1).Text = "CyberCrypt Adding (" & FileAdd.List(Z) & ") to (" & ArchiveName & ")"
                If frmMain.CyTAdd(CyTFile, DirS.Path & "\" & FileAdd.List(Z), FileAdd.List(Z)) = False Then FrmErrors.ErrorMessages.Text = FrmErrors.ErrorMessages.Text & vbNewLine & DirS.Path & "\" & FileAdd.List(Z) & " - Could not add to archive (File access error)": GoTo ReGetFiles
            End If
ReGetFiles:
            DoEvents
        Next
        frmBusy.lblFile.Caption = "Updating archive..."
        DoEvents
        frmMain.CyTOpen CyTFile
        Unload frmBusy
        frmMain.Enabled = True
        frmMain.MousePointer = 0
        
        frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
        frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
        
        Unload Me
        SetAddMenu
        frmMain.SetFocus
        
        If FrmErrors.ErrorMessages.Text <> "" Then FrmErrors.Show 1, frmMain
        Exit Sub
    End If
    
    If SelectOption = 3 Then
        FrmOptions.ExPath.Text = DirS.Path
        Unload Me
        Exit Sub
    End If
    
    If SelectOption = 4 Then
        FrmQuickViewOpt.WorkingFolder.Text = DirS.Path
        Unload Me
        Exit Sub
    End If
    
    If SelectOption = 5 Then
        FrmVirusScanOpt.WorkingFolder.Text = DirS.Path
        Unload Me
        Exit Sub
    End If
    
    If SelectOption = 6 Then
        FrmMoveArch.NewArchLoc.Text = DirS.Path
        Unload Me
        Exit Sub
    End If
    
    If SelectOption = 7 Then
        FrmCopyArch.NewArchLoc.Text = DirS.Path
        Unload Me
        Exit Sub
    End If
    
FinaliseError:
    MessageBox "An unknown error occured.", OKOnly, Critical
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.Enabled = True
    frmMain.MousePointer = 0
    Unload frmBusy
    Exit Sub
End Sub
