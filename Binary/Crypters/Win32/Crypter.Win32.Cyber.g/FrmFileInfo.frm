VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmFileInfo 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "File information"
   ClientHeight    =   6570
   ClientLeft      =   4215
   ClientTop       =   450
   ClientWidth     =   5790
   Icon            =   "FrmFileInfo.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6570
   ScaleWidth      =   5790
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton OK 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   4440
      TabIndex        =   27
      Top             =   6120
      Width           =   1215
   End
   Begin VB.Frame Frame3 
      Caption         =   "General"
      Height          =   5175
      Left            =   360
      TabIndex        =   33
      Top             =   720
      Width           =   5055
      Begin VB.TextBox SavedSpace 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   6
         Top             =   2160
         Width           =   3015
      End
      Begin VB.TextBox AddDateToArch 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   8
         Top             =   2880
         Width           =   3015
      End
      Begin VB.TextBox RatioS 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   4
         Top             =   1440
         Width           =   3015
      End
      Begin VB.TextBox DateCreated 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   9
         Top             =   3240
         Width           =   3015
      End
      Begin VB.PictureBox PictImage 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   615
         Left            =   240
         ScaleHeight     =   615
         ScaleWidth      =   615
         TabIndex        =   53
         TabStop         =   0   'False
         Top             =   360
         Width           =   615
      End
      Begin VB.TextBox Info04 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   3600
         Width           =   3015
      End
      Begin VB.TextBox Info01 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   360
         Width           =   3015
      End
      Begin VB.TextBox Info02 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   5
         Top             =   1800
         Width           =   3015
      End
      Begin VB.TextBox Info05 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   11
         Top             =   3960
         Width           =   3015
      End
      Begin VB.TextBox Info02a 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   3
         Top             =   1080
         Width           =   3015
      End
      Begin VB.TextBox FileType 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   2
         Top             =   720
         Width           =   3015
      End
      Begin VB.TextBox ArchNum 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   13
         Top             =   4680
         Width           =   3015
      End
      Begin VB.TextBox ImageType 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   7
         Top             =   2520
         Width           =   3015
      End
      Begin VB.TextBox PercentFile 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   12
         Top             =   4320
         Width           =   3015
      End
      Begin VB.Label Label22 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Saved Space:"
         Height          =   195
         Left            =   240
         TabIndex        =   64
         Top             =   2160
         Width           =   1020
      End
      Begin VB.Label Label15 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Added to archive:"
         Height          =   195
         Left            =   240
         TabIndex        =   59
         Top             =   2880
         Width           =   1260
      End
      Begin VB.Label Label21 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Ratio:"
         Height          =   195
         Left            =   240
         TabIndex        =   58
         Top             =   1440
         Width           =   420
      End
      Begin VB.Label Label19 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Date created:"
         Height          =   195
         Left            =   240
         TabIndex        =   57
         Top             =   3240
         Width           =   975
      End
      Begin VB.Label lblFileExtract0 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "File extracted from:"
         Height          =   195
         Left            =   240
         TabIndex        =   46
         Top             =   3600
         Width           =   1335
      End
      Begin VB.Label LblSize0 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Packed Size:"
         Height          =   195
         Left            =   240
         TabIndex        =   41
         Top             =   1800
         Width           =   945
      End
      Begin VB.Label lblName0 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "File name:"
         Height          =   195
         Left            =   1080
         TabIndex        =   40
         Top             =   360
         Width           =   720
      End
      Begin VB.Label Label20 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Offset:"
         Height          =   195
         Left            =   240
         TabIndex        =   39
         Top             =   3960
         Width           =   465
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Size:"
         Height          =   195
         Left            =   240
         TabIndex        =   38
         Top             =   1080
         Width           =   345
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "File type:"
         Height          =   195
         Left            =   1080
         TabIndex        =   37
         Top             =   720
         Width           =   630
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Sel file number:"
         Height          =   195
         Left            =   240
         TabIndex        =   36
         Top             =   4680
         Width           =   1080
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "File extension:"
         Height          =   195
         Left            =   240
         TabIndex        =   35
         Top             =   2520
         Width           =   1005
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Percent of archive:"
         Height          =   195
         Left            =   240
         TabIndex        =   34
         Top             =   4320
         Width           =   1350
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Archive properties"
      Height          =   5175
      Left            =   360
      TabIndex        =   42
      Top             =   720
      Visible         =   0   'False
      Width           =   5055
      Begin VB.TextBox ArchDataSpace 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   19
         Top             =   2400
         Width           =   3015
      End
      Begin VB.TextBox ExtractionSize 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   20
         Top             =   3000
         Width           =   3015
      End
      Begin VB.PictureBox PicArchiveOpt 
         AutoRedraw      =   -1  'True
         AutoSize        =   -1  'True
         BorderStyle     =   0  'None
         Height          =   495
         Left            =   240
         ScaleHeight     =   495
         ScaleWidth      =   615
         TabIndex        =   55
         Top             =   360
         Width           =   615
      End
      Begin VB.TextBox FileNums 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   1320
         Width           =   3015
      End
      Begin VB.Frame Frame4 
         Caption         =   "Dates"
         Height          =   1335
         Left            =   120
         TabIndex        =   49
         Top             =   3720
         Width           =   4815
         Begin VB.Label Label14 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Archive accessed:"
            Height          =   195
            Left            =   240
            TabIndex        =   52
            Top             =   960
            Width           =   1320
         End
         Begin VB.Label Label13 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Archive last modified:"
            Height          =   195
            Left            =   240
            TabIndex        =   51
            Top             =   600
            Width           =   1500
         End
         Begin VB.Label Label12 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Archive created:"
            Height          =   195
            Left            =   240
            TabIndex        =   50
            Top             =   240
            Width           =   1170
         End
         Begin VB.Label lblDate 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Caption         =   "00/00/0000 00:00:00"
            Height          =   255
            Index           =   2
            Left            =   1800
            TabIndex        =   24
            Top             =   960
            Width           =   2895
         End
         Begin VB.Label lblDate 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Caption         =   "00/00/0000 00:00:00"
            Height          =   255
            Index           =   1
            Left            =   1800
            TabIndex        =   23
            Top             =   600
            Width           =   2895
         End
         Begin VB.Label lblDate 
            Appearance      =   0  'Flat
            BackColor       =   &H80000005&
            BackStyle       =   0  'Transparent
            BorderStyle     =   1  'Fixed Single
            Caption         =   "00/00/0000 00:00:00"
            Height          =   255
            Index           =   0
            Left            =   1800
            TabIndex        =   22
            Top             =   240
            Width           =   2895
         End
      End
      Begin VB.TextBox ArchiveType 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   2400
         Locked          =   -1  'True
         TabIndex        =   14
         Top             =   600
         Width           =   2535
      End
      Begin VB.TextBox ArchName 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   15
         Top             =   960
         Width           =   3015
      End
      Begin VB.TextBox Info03 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   17
         Top             =   1680
         Width           =   3015
      End
      Begin VB.TextBox AppLocation 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   21
         Top             =   3360
         Width           =   3015
      End
      Begin VB.TextBox ArchiveSize 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   1920
         Locked          =   -1  'True
         TabIndex        =   18
         Top             =   2040
         Width           =   3015
      End
      Begin VB.Label Label16 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Archive Data space:"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   240
         TabIndex        =   60
         Top             =   2400
         Width           =   1455
      End
      Begin VB.Label Label18 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Space requried for all file(s) to be extracted:"
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   240
         TabIndex        =   56
         Top             =   2760
         Width           =   3060
      End
      Begin VB.Label Label17 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Files in archive:"
         Height          =   195
         Left            =   240
         TabIndex        =   54
         Top             =   1320
         Width           =   1095
      End
      Begin VB.Label Label11 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Archive type:"
         Height          =   195
         Left            =   1200
         TabIndex        =   48
         Top             =   600
         Width           =   930
      End
      Begin VB.Label labelarch 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Archive name:"
         Height          =   195
         Left            =   240
         TabIndex        =   47
         Top             =   960
         Width           =   1020
      End
      Begin VB.Label lblPath0 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Temp path:"
         Height          =   195
         Left            =   240
         TabIndex        =   45
         Top             =   1680
         Width           =   810
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Application path:"
         Height          =   195
         Left            =   240
         TabIndex        =   44
         Top             =   3360
         Width           =   1185
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Archive size (Format):"
         Height          =   195
         Left            =   240
         TabIndex        =   43
         Top             =   2040
         Width           =   1515
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Icon and picture properties"
      Height          =   5175
      Left            =   360
      TabIndex        =   29
      Top             =   720
      Visible         =   0   'False
      Width           =   5055
      Begin VB.TextBox PicHeight 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   2880
         Locked          =   -1  'True
         TabIndex        =   26
         Top             =   1800
         Width           =   1215
      End
      Begin VB.TextBox PicWidth 
         Appearance      =   0  'Flat
         BackColor       =   &H8000000F&
         ForeColor       =   &H80000012&
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   25
         Top             =   1800
         Width           =   1215
      End
      Begin VB.Frame Frame1 
         Caption         =   "Picture preview / properties"
         Height          =   2775
         Left            =   240
         TabIndex        =   32
         Top             =   2280
         Width           =   4575
         Begin VB.PictureBox PreviewImage 
            AutoRedraw      =   -1  'True
            BackColor       =   &H80000005&
            Height          =   2415
            Left            =   120
            ScaleHeight     =   2355
            ScaleWidth      =   4275
            TabIndex        =   61
            TabStop         =   0   'False
            Top             =   240
            Width           =   4335
         End
      End
      Begin VB.Frame Frame30 
         Caption         =   "Preview"
         Height          =   1095
         Left            =   240
         TabIndex        =   30
         Top             =   360
         Width           =   855
         Begin VB.PictureBox pctIcon 
            AutoRedraw      =   -1  'True
            AutoSize        =   -1  'True
            BackColor       =   &H80000005&
            Height          =   540
            Left            =   120
            ScaleHeight     =   480
            ScaleWidth      =   480
            TabIndex        =   28
            TabStop         =   0   'False
            Top             =   240
            Width           =   540
         End
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Hight:"
         Height          =   195
         Left            =   2280
         TabIndex        =   63
         Top             =   1800
         Width           =   420
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Width:"
         Height          =   195
         Left            =   240
         TabIndex        =   62
         Top             =   1800
         Width           =   465
      End
      Begin VB.Label Label1 
         Caption         =   $"FrmFileInfo.frx":030A
         Height          =   1335
         Left            =   1320
         TabIndex        =   31
         Top             =   360
         Width           =   3495
         WordWrap        =   -1  'True
      End
   End
   Begin MSComctlLib.TabStrip TabStrip 
      Height          =   5775
      Left            =   120
      TabIndex        =   0
      Top             =   240
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   10186
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   3
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "General"
            Object.ToolTipText     =   "General"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Archive"
            Object.ToolTipText     =   "Archive"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Other..."
            Object.ToolTipText     =   "Other..."
            ImageVarType    =   2
         EndProperty
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
End
Attribute VB_Name = "FrmFileInfo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function FileTimeToSystemTime Lib "kernel32" (lpFileTime As FILETIME, lpSystemTime As SystemTime) As Long

Private FILETIME As SystemTime
Private FileData As WIN32_FIND_DATA

Private Type FILETIME
        dwLowDateTime As Long
        dwHighDateTime As Long
End Type

Private Type WIN32_FIND_DATA
        dwFilechkattrib As Long
        ftCreationTime As FILETIME
        ftLastAccessTime As FILETIME
        ftLastWriteTime As FILETIME
        nFileSizeHigh As Long
        nFileSizeLow As Long
        dwReserved0 As Long
        dwReserved1 As Long
        cFileName As String * MAX_PATH
        cAlternate As String * 14
End Type

Private Type SystemTime
        wYear As Integer
        wMonth As Integer
        wDayOfWeek As Integer
        wDay As Integer
        wHour As Integer
        wMinute As Integer
        wSecond As Integer
        wMilliseconds As Integer
End Type

'In form load it checks if the Temp folder in the Windows directory
'exists and if the file exists in the Temp folder
Private Sub Form_Load()
    
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(1).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(4).Picture
    
    If FileExist(TempRootS & "\" & frmMain.ListFiles.SelectedItem) = True Then
        
        On Error GoTo FinaliseError
        
        lngIcon = ExtractIcon(App.hInstance, (TempRootS & "\" & frmMain.ListFiles.SelectedItem), 0)
        If lngIcon = 0 Then
           dFileName = TempRootS & "\" & frmMain.ListFiles.SelectedItem
            If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
                GetIcon TempRootS & frmMain.ListFiles.SelectedItem, PictImage
            ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
                GetIcon TempRootS & "\" & frmMain.ListFiles.SelectedItem, PictImage
            End If
            GetFileInfo
            Exit Sub
        Else
            dFileName = TempRootS & "\" & frmMain.ListFiles.SelectedItem
            If Right(TempRootS, 1) = "\" Or Right(TempRootS, 1) = "/" Then
                GetIcon TempRootS & frmMain.ListFiles.SelectedItem, PictImage
            ElseIf Right(TempRootS, 1) <> "\" And Right(TempRootS, 1) <> "/" Then
                GetIcon TempRootS & "\" & frmMain.ListFiles.SelectedItem, PictImage
            End If
            GetFileInfo
            pctIcon.Cls
            pctIcon.AutoSize = True
            pctIcon.AutoRedraw = True
            DrawIcon pctIcon.hdc, 0, 0, lngIcon
            pctIcon.Refresh
            DestroyIcon lngIcon
            End If
        Exit Sub
        
FinaliseError:
        MessageBox "Sorry the file info could not be found.", OKOnly, Critical
        Unload Me
        ClearTempFile
            Else
        MessageBox "Sorry the file info could not be found.", OKOnly, Critical
        Unload Me
    End If
    
End Sub

Private Sub OK_Click()
    Unload Me
    ClearTempFile
End Sub

Private Function FindFile(sFileName As String) As WIN32_FIND_DATA
    Dim Win32Data As WIN32_FIND_DATA
    Dim plngFirstFileHwnd As Long
    Dim plngRtn As Long
    
    ' Find file and get file data
    plngFirstFileHwnd = FindFirstFile(sFileName, Win32Data)
    If plngFirstFileHwnd = 0 Then
        FindFile.cFileName = "Error"
    Else
        FindFile = Win32Data
    End If
    plngRtn = FindClose(plngFirstFileHwnd)
End Function

'This function gets the file information and other information like
'the Offset and file type
Private Function GetFileInfo()
    
    On Error GoTo FinaliseError
    
    FileData = FindFile(CyTFile)
    
    Me.Caption = "File information (" & frmMain.ListFiles.SelectedItem.Text & ")"
    
    Info01.Text = frmMain.ListFiles.SelectedItem
    RatioS.Text = frmMain.ListFiles.SelectedItem.SubItems(3)
    Info02.Text = frmMain.ListFiles.SelectedItem.SubItems(4)
    Info02a.Text = FormatKB(FileLen(TempRootS & "\" & frmMain.ListFiles.SelectedItem)) & "  (" & FileLen(TempRootS & "\" & frmMain.ListFiles.SelectedItem) & ") bytes"
    
    DateCreated.Text = frmMain.ListFiles.SelectedItem.SubItems(7)
    
    If Len(TempRootS) > 30 Then
        Info03.Text = GetShortName(TempRootS)
    ElseIf Len(TempRootS) <= 30 Then
        Info03.Text = TempRootS
    End If
       
    If Len(CyTFile) > 30 Then
        Info04.Text = GetShortName(CyTFile)
    ElseIf Len(CyTFile) <= 30 Then
        Info04.Text = CyTFile
    End If
    
    If Len(App.Path) > 30 Then
        AppLocation.Text = GetShortName(App.Path)
    ElseIf Len(App.Path) <= 30 Then
        AppLocation.Text = App.Path
    End If
    
    Info05.Text = frmMain.ListFiles.SelectedItem.ListSubItems(9)
    ArchNum.Text = frmMain.ListFiles.SelectedItem.Index
    PercentFile.Text = frmMain.ListFiles.SelectedItem.SubItems(6)
    AddDateToArch.Text = frmMain.ListFiles.SelectedItem.SubItems(8)
    SavedSpace.Text = frmMain.ListFiles.SelectedItem.SubItems(5)
    ArchiveSize.Text = FormatKB(FileLen(CyTFile))
    ArchDataSpace.Text = CStr(FormatKB(FileLen(CyTFile) - AllSize) & "  (" & FileLen(CyTFile) - AllSize) & ") bytes"
    ExtractionSize.Text = CStr(FormatKB(ExtractSize) & "  (" & ExtractSize) & ") bytes"
    
    FileNums.Text = frmMain.ListFiles.ListItems.Count
    ArchName.Text = ArchiveName
    
    If CompressionAgent = False And EncryptionAgent = False And SwapAgent = False Then PicArchiveOpt.Picture = frmMain.ImageList.ListImages.Item(8).Picture: ArchiveType.Text = "Non-Compression archive"
    If CompressionAgent = True Then PicArchiveOpt.Picture = frmMain.ImageList.ListImages.Item(9).Picture: ArchiveType.Text = "Compression archive"
    If EncryptionAgent = True Then PicArchiveOpt.Picture = frmMain.ImageList.ListImages.Item(13).Picture: ArchiveType.Text = "Algorithm encryption archive"
    If SwapAgent = True Then PicArchiveOpt.Picture = frmMain.ImageList.ListImages.Item(14).Picture: ArchiveType.Text = "Swap archive"
    
    FileTimeToSystemTime FileData.ftCreationTime, FILETIME
    lblDate(0) = FILETIME.wDay & "/" & FILETIME.wMonth & "/" & FILETIME.wYear & " " & FILETIME.wHour & ":" & FILETIME.wMinute & ":" & FILETIME.wSecond
    FileTimeToSystemTime FileData.ftLastWriteTime, FILETIME
    lblDate(1) = FILETIME.wDay & "/" & FILETIME.wMonth & "/" & FILETIME.wYear & " " & FILETIME.wHour & ":" & FILETIME.wMinute & ":" & FILETIME.wSecond
    FileTimeToSystemTime FileData.ftLastAccessTime, FILETIME
    lblDate(2) = FILETIME.wDay & "/" & FILETIME.wMonth & "/" & FILETIME.wYear
    
    For s = 1 To Len(frmMain.ListFiles.SelectedItem.Text)
        GetChr1 = Right(frmMain.ListFiles.SelectedItem.Text, s)
        GetChr2 = Left(GetChr1, 1)
        If GetChr2 = "." Then
            NameTemp = LCase$(Right(GetChr1, Len(GetChr1) - 1))
        End If
    Next s

    'Gets the file type and puts it into the correct text box
    If NameTemp <> "" Then
        If GetFileTypeName(NameTemp & "file") = LCase$("<Unknown file type>") Or Len(GetFileTypeName(NameTemp & "file")) >= 88 Then
            If GetFileTypeName("." & NameTemp) = LCase$("<Unknown file type>") Or Len(GetFileTypeName("." & NameTemp)) >= 88 Then
                FileType.Text = UCase$(NameTemp) & " file"
                    Else
                FileType.Text = GetFileTypeName("." & NameTemp)
            End If
                Else
            FileType.Text = GetFileTypeName(NameTemp & "file")
        End If
    Else
        NameTemp = "No extension"
    End If
    
    ImageType.Text = NameTemp
       
    PreviewImage.AutoRedraw = True
    CentrePic PreviewImage, LoadPicture(TempRootS & "\" & frmMain.ListFiles.SelectedItem.Text)
    PicWidth.Text = LoadPicture(TempRootS & "\" & frmMain.ListFiles.SelectedItem.Text).Width
    PicHeight.Text = LoadPicture(TempRootS & "\" & frmMain.ListFiles.SelectedItem.Text).Height
    
FinaliseError:
    
    frmMain.StatusBar.Panels.Item(2).Picture = frmMain.Lights.ListImages.Item(2).Picture
    frmMain.StatusBar.Panels.Item(3).Picture = frmMain.Lights.ListImages.Item(1).Picture
    
    ClearTempFile

End Function

Private Sub chkAttrib_GotFocus(Index As Integer)
    OK.SetFocus
End Sub

Private Sub TabStrip_Click()
    If TabStrip.SelectedItem = "General" Then
        Frame5.Visible = False
        Frame2.Visible = False
        Frame3.Visible = True
    ElseIf TabStrip.SelectedItem = "Other..." Then
        Frame3.Visible = False
        Frame2.Visible = False
        Frame5.Visible = True
    ElseIf TabStrip.SelectedItem = "Archive" Then
        Frame3.Visible = False
        Frame5.Visible = False
        Frame2.Visible = True
    End If
End Sub

'This sub selects through the basic tabbed menu
Private Sub TabStrip_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If TabStrip.SelectedItem = "General" Then
        Frame5.Visible = False
        Frame2.Visible = False
        Frame3.Visible = True
    ElseIf TabStrip.SelectedItem = "Other..." Then
        Frame3.Visible = False
        Frame2.Visible = False
        Frame5.Visible = True
    ElseIf TabStrip.SelectedItem = "Archive" Then
        Frame3.Visible = False
        Frame5.Visible = False
        Frame2.Visible = True
    End If
End Sub
