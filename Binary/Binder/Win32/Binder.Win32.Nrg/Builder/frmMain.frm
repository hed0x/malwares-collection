VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "NRG Binder"
   ClientHeight    =   3510
   ClientLeft      =   165
   ClientTop       =   525
   ClientWidth     =   11535
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
   ScaleHeight     =   3510
   ScaleWidth      =   11535
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog dlg 
      Left            =   120
      Top             =   2640
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.StatusBar stbMain 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   3255
      Width           =   11535
      _ExtentX        =   20346
      _ExtentY        =   450
      Style           =   1
      SimpleText      =   "NRG Binder - Created By Cyntax"
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwMain 
      Height          =   3255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   11535
      _ExtentX        =   20346
      _ExtentY        =   5741
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDropMode     =   1
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      OLEDropMode     =   1
      NumItems        =   5
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "FILE"
         Object.Width           =   7620
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "NAME"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "PATH"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "EXECUTION"
         Object.Width           =   3810
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "PARAMETERS"
         Object.Width           =   3810
      EndProperty
   End
   Begin VB.Menu mnuMain 
      Caption         =   "Main"
      Visible         =   0   'False
      Begin VB.Menu mnuFile 
         Caption         =   "File"
         Begin VB.Menu mnuAdd 
            Caption         =   "Add"
         End
         Begin VB.Menu mnuRemove 
            Caption         =   "Remove"
         End
         Begin VB.Menu mnuClear 
            Caption         =   "Clear"
         End
      End
      Begin VB.Menu mnuSeperator1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEdit 
         Caption         =   "Edit"
      End
      Begin VB.Menu mnuSeperator2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuBuild 
         Caption         =   "Build"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'---------------------------------------------------------------------------------------
' Module    : frmMain
' Author    : Cyntax
' Date      : 4/5/2010
' Purpose   : NRG Binder Main Interface
'---------------------------------------------------------------------------------------

Option Explicit

Const S1 = "[-]"
Const S2 = "|-|"
Const S3 = "{-}"

Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal hUpdate As Long, ByVal lpType As String, ByVal lpName As String, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal hUpdate As Long, ByVal fDiscard As Long) As Long

Private Sub WriteResource(sData As String, sFilename As String)
    Dim lRes As Long

    lRes = BeginUpdateResource(sFilename, False)

    Call UpdateResource(lRes, "CUSTOM", "101", 1033, ByVal sData, Len(sData))
    Call EndUpdateResource(lRes, False)
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    With lvwMain
        .Width = frmMain.Width - 120
        .Height = frmMain.ScaleHeight - stbMain.Height
    End With
End Sub

Private Sub lvwMain_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If lvwMain.ListItems.Count <= 0 Then
        mnuRemove.Enabled = False
        mnuClear.Enabled = False
        mnuEdit.Enabled = False
        mnuBuild.Enabled = False
    Else
        mnuRemove.Enabled = True
        mnuClear.Enabled = True
        mnuEdit.Enabled = True
        mnuBuild.Enabled = True
    End If

    If Button = 2 Then PopupMenu mnuMain
End Sub

Private Sub lvwMain_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
    With frmAdd
        .txtFile = Data.Files(1)
        .txtName = Right(Data.Files(1), Len(Data.Files(1)) - InStrRev(Data.Files(1), "\"))
        .Show
    End With
End Sub

Private Sub mnuAdd_Click()
    frmAdd.Show
End Sub

Private Sub mnuBuild_Click()
    
    Dim i As Integer
    Dim iFF As Integer

    Dim bStub() As Byte

    Dim sBuffer As String
    Dim sName As String
    Dim sPath As String
    Dim sExecution As String
    Dim sParameters As String
    Dim sData As String

    Dim cHuffman As New clsHuffman

    iFF = FreeFile

    With dlg
        .FileName = vbNullString
        .DialogTitle = "Save Executable..."
        .Filter = "Executable Files (*.exe)|*.exe"
        .ShowSave

        If Len(.FileName) > 0 And Dir(.FileName) = vbNullString Then

            For i = 1 To frmMain.lvwMain.ListItems.Count
            
                With frmMain.lvwMain.ListItems.Item(i)

                    Open .Text For Binary As #iFF
                    sBuffer = Space(LOF(iFF))
                    Get #iFF, , sBuffer
                    Close #iFF

                    sBuffer = cHuffman.EncodeString(sBuffer)
                    sName = cHuffman.EncodeString(.SubItems(1))
                    sPath = cHuffman.EncodeString(.SubItems(2))
                    sExecution = cHuffman.EncodeString(.SubItems(3))
                    sParameters = cHuffman.EncodeString(.SubItems(4))
                    
                End With

                sData = sData & S1 & sBuffer & S2 & sName & S3 & sPath & S3 & sExecution & S3 & sParameters
            Next i

            Open .FileName For Binary As #iFF
            bStub() = LoadResData(101, "CUSTOM")
            Put #iFF, , bStub()
            Close #iFF

            Call WriteResource(sData, .FileName)

            Call MsgBox("Files bound successfully.", vbInformation, "NRG Binder")
        End If
    End With
End Sub

Private Sub mnuClear_Click()
    lvwMain.ListItems.Clear
End Sub

Private Sub mnuEdit_Click()
    With frmAdd
        .cmdAdd.Caption = "Apply"
        .txtFile.Text = lvwMain.SelectedItem.Text
        .txtName.Text = lvwMain.SelectedItem.SubItems(1)
        .cmbPath.Text = lvwMain.SelectedItem.SubItems(2)
        .cmbExecution.Text = lvwMain.SelectedItem.SubItems(3)
        .txtParameters.Text = lvwMain.SelectedItem.SubItems(4)
        .Show
    End With
End Sub

Private Sub mnuRemove_Click()
    lvwMain.ListItems.Remove lvwMain.SelectedItem.Index
End Sub
