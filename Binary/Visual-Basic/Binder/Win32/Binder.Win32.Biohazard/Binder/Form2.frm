VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.0#0"; "Codejock.Controls.v12.0.1.ocx"
Begin VB.Form Form2 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "Biohazard Binder [Public Beta 2]"
   ClientHeight    =   4740
   ClientLeft      =   150
   ClientTop       =   720
   ClientWidth     =   9975
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4740
   ScaleWidth      =   9975
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   960
      TabIndex        =   5
      Text            =   "bind.exe"
      Top             =   4800
      Width           =   855
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   120
      TabIndex        =   4
      Text            =   "Password"
      Top             =   4800
      Width           =   735
   End
   Begin XtremeSuiteControls.TabControl TabControl1 
      Height          =   3615
      Left            =   0
      TabIndex        =   0
      Top             =   1080
      Width           =   9975
      _Version        =   786432
      _ExtentX        =   17595
      _ExtentY        =   6376
      _StockProps     =   68
      Color           =   8
      PaintManager.ShowIcons=   -1  'True
      ItemCount       =   2
      Item(0).Caption =   "Binder"
      Item(0).ImageIndex=   75
      Item(0).ControlCount=   1
      Item(0).Control(0)=   "TabControlPage1"
      Item(1).Caption =   "Icon Changer"
      Item(1).ControlCount=   1
      Item(1).Control(0)=   "TabControlPage2"
      Begin XtremeSuiteControls.TabControlPage TabControlPage2 
         Height          =   3195
         Left            =   -69970
         TabIndex        =   2
         Top             =   360
         Visible         =   0   'False
         Width           =   9885
         _Version        =   786432
         _ExtentX        =   17436
         _ExtentY        =   5636
         _StockProps     =   1
         Page            =   1
      End
      Begin XtremeSuiteControls.TabControlPage TabControlPage1 
         Height          =   3195
         Left            =   30
         TabIndex        =   1
         Top             =   360
         Width           =   9885
         _Version        =   786432
         _ExtentX        =   17436
         _ExtentY        =   5636
         _StockProps     =   1
         Page            =   0
         Begin XtremeSuiteControls.ListView lstFile 
            Height          =   3135
            Left            =   0
            TabIndex        =   3
            Top             =   0
            Width           =   9975
            _Version        =   786432
            _ExtentX        =   17595
            _ExtentY        =   5530
            _StockProps     =   77
            BackColor       =   -2147483643
            View            =   3
            FullRowSelect   =   -1  'True
            UseVisualStyle  =   -1  'True
            IconSize        =   16
         End
      End
   End
   Begin VB.Image Image1 
      Height          =   1140
      Left            =   0
      Picture         =   "Form2.frx":23D2
      Top             =   0
      Width           =   9930
   End
   Begin VB.Menu mnuBio 
      Caption         =   "Biohazard"
      Begin VB.Menu mnuSettings 
         Caption         =   "Settings"
      End
      Begin VB.Menu mnuad 
         Caption         =   "-"
      End
      Begin VB.Menu mnuabout 
         Caption         =   "About"
      End
      Begin VB.Menu asdsad 
         Caption         =   "-"
      End
      Begin VB.Menu mnuexit 
         Caption         =   "Exit"
      End
   End
   Begin VB.Menu mnubuy 
      Caption         =   "Buy this Software"
   End
   Begin VB.Menu mnuslayer 
      Caption         =   "Coded by Slayer616"
      Enabled         =   0   'False
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
TabControl1.Icons = Form1.ImageManager1.Icons

lstFile.ColumnHeaders.Add , , "Filename", 1700
lstFile.ColumnHeaders.Add , , "Filepath", 3500
lstFile.ColumnHeaders.Add , , "Filesize", 1200
lstFile.ColumnHeaders.Add , , "Execution", 1400
lstFile.ColumnHeaders.Add , , "Inject/Drop", 1600
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
Unload Form1
Unload Form3
Unload Form4
End Sub

Private Sub lstFile_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
If Button = 2 Then
Dim Popup As CommandBar
Dim Control As CommandBarControl

Set Popup = Form1.CommandBars1.Add("Popup", xtpBarPopup)

With Popup.Controls
.Add xtpControlLabel, ID_Bio, "Biohazard Binder"
Set Control = .Add(xtpControlButton, ID_Add, "Add File")
If lstFile.ListItems.Count = 0 Then
Else
Set Control = .Add(xtpControlButton, ID_Delete, "Delete File")
End If
Set Control = .Add(xtpControlPopup, ID_ExecutionOptions, "Execution Options")
Control.BeginGroup = True
Control.CommandBar.Controls.Add xtpControlLabel, ID_ExecutionOptions, "Execution Options"
Control.CommandBar.Controls.Add xtpControlButton, ID_Dropper, "Dropper"
Control.CommandBar.Controls.Add xtpControlButton, ID_Injecter, "Injecter"
If lstFile.ListItems.Count = 0 Then
Else
If lstFile.SelectedItem.ListSubItems(3).Text = "-" Then
Else
If lstFile.SelectedItem.ListSubItems(3).Text = "Injecter" Then
Set Control = .Add(xtpControlPopup, ID_ExecutionPath, "Execution Path")
Control.CommandBar.Controls.Add xtpControlLabel, ID_ExecutionPath, "Execution Path"
Control.CommandBar.Controls.Add xtpControlButton, ID_InjectStub, "Inject in to Stub"
Control.CommandBar.Controls.Add xtpControlButton, ID_InjectExplorer, "Inject into Explorer"
Control.CommandBar.Controls.Add xtpControlButton, ID_InjectBrowser, "Inject into Default Browser"
Else
Set Control = .Add(xtpControlPopup, ID_Drop, "Drop Files")
Control.CommandBar.Controls.Add xtpControlLabel, ID_Drop, "Drop Files"
Control.CommandBar.Controls.Add xtpControlButton, ID_NoDrop, "No Dropping"
Control.CommandBar.Controls.Add xtpControlButton, ID_DropSystem32, "System32"
Control.CommandBar.Controls.Add xtpControlButton, ID_DropApp, "Application Dir"
End If
End If
End If
If lstFile.ListItems.Count = 0 Then
Else
Set Control = .Add(xtpControlButtonPopup, ID_Bind, "Bind")
Control.BeginGroup = True
Control.CommandBar.Controls.Add xtpControlLabel, ID_Bind, "Bind"
Control.CommandBar.Controls.Add xtpControlButton, ID_XOR, "XOR"
Control.CommandBar.Controls.Add xtpControlButton, ID_RC4, "RC4"
End If

Popup.ShowPopup
        
End With
End If
End Sub

Private Sub lstFiles_KeyDown(KeyCode As Integer, Shift As Integer)

End Sub

Private Sub mnuabout_Click()
Form4.Show
End Sub

Private Sub mnubuy_Click()
MsgBox "Send an email to: aydin.tekin.66@hotmail.de/ ICQnumber: 6924512"
End Sub

Private Sub mnuexit_Click()
Unload Form4
Unload Form3
Unload Form1
Unload Me
End Sub

Private Sub mnuSettings_Click()
Form3.Show
End Sub
