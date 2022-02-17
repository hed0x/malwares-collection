VERSION 5.00
Object = "{A8E5842E-102B-4289-9D57-3B3F5B5E15D3}#12.0#0"; "Codejock.Controls.v12.0.1.ocx"
Begin VB.Form Form3 
   Caption         =   "Biohazard Binder Settings"
   ClientHeight    =   3660
   ClientLeft      =   120
   ClientTop       =   375
   ClientWidth     =   4845
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Form3.frx":0000
   LinkTopic       =   "Form3"
   ScaleHeight     =   3660
   ScaleWidth      =   4845
   StartUpPosition =   3  'Windows-Standard
   Begin XtremeSuiteControls.GroupBox GroupBox1 
      Height          =   3615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4695
      _Version        =   786432
      _ExtentX        =   8281
      _ExtentY        =   6376
      _StockProps     =   79
      Caption         =   "Settings"
      Transparent     =   -1  'True
      Appearance      =   6
      Begin XtremeSuiteControls.ListView ListView1 
         Height          =   2175
         Left            =   120
         TabIndex        =   3
         Top             =   840
         Width           =   4455
         _Version        =   786432
         _ExtentX        =   7858
         _ExtentY        =   3836
         _StockProps     =   77
         BackColor       =   -2147483643
         Enabled         =   0   'False
         View            =   3
         Appearance      =   6
         UseVisualStyle  =   -1  'True
      End
      Begin XtremeSuiteControls.FlatEdit FlatEdit2 
         Height          =   255
         Left            =   1920
         TabIndex        =   8
         Top             =   3240
         Width           =   1455
         _Version        =   786432
         _ExtentX        =   2566
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
         Text            =   "bind.exe"
         Appearance      =   6
         UseVisualStyle  =   -1  'True
      End
      Begin XtremeSuiteControls.CheckBox CheckBox3 
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   3240
         Width           =   3135
         _Version        =   786432
         _ExtentX        =   5530
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Specific Filename:"
         UseVisualStyle  =   -1  'True
         Appearance      =   6
      End
      Begin XtremeSuiteControls.PushButton PushButton2 
         Height          =   375
         Left            =   3240
         TabIndex        =   6
         Top             =   240
         Width           =   1095
         _Version        =   786432
         _ExtentX        =   1931
         _ExtentY        =   661
         _StockProps     =   79
         Caption         =   "Generate"
         UseVisualStyle  =   -1  'True
         Appearance      =   6
         DrawFocusRect   =   0   'False
         Picture         =   "Form3.frx":23D2
      End
      Begin XtremeSuiteControls.FlatEdit FlatEdit1 
         Height          =   255
         Left            =   1800
         TabIndex        =   5
         Top             =   240
         Width           =   1335
         _Version        =   786432
         _ExtentX        =   2355
         _ExtentY        =   450
         _StockProps     =   77
         BackColor       =   -2147483643
         Enabled         =   0   'False
         Text            =   "FlatEdit1"
         Appearance      =   6
         UseVisualStyle  =   -1  'True
      End
      Begin XtremeSuiteControls.PushButton PushButton1 
         Height          =   375
         Left            =   3480
         TabIndex        =   4
         Top             =   3120
         Width           =   1095
         _Version        =   786432
         _ExtentX        =   1931
         _ExtentY        =   661
         _StockProps     =   79
         Caption         =   "Save"
         UseVisualStyle  =   -1  'True
         Appearance      =   6
         DrawFocusRect   =   0   'False
         Picture         =   "Form3.frx":27AA
      End
      Begin XtremeSuiteControls.CheckBox CheckBox2 
         Height          =   375
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   1695
         _Version        =   786432
         _ExtentX        =   2990
         _ExtentY        =   661
         _StockProps     =   79
         Caption         =   "Specific Details:"
         UseVisualStyle  =   -1  'True
         Appearance      =   6
      End
      Begin XtremeSuiteControls.CheckBox CheckBox1 
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   2535
         _Version        =   786432
         _ExtentX        =   4471
         _ExtentY        =   450
         _StockProps     =   79
         Caption         =   "Specific Password:"
         UseVisualStyle  =   -1  'True
         Appearance      =   6
      End
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CheckBox1_Click()
If CheckBox1.Value = xtpChecked Then
FlatEdit1.Enabled = True
Else
FlatEdit1.Enabled = False
End If
End Sub

Private Sub CheckBox2_Click()
If CheckBox2.Value = xtpChecked Then
ListView1.Enabled = True
Else
ListView1.Enabled = False
End If
End Sub

Private Sub PushButton1_Click()
Form2.Text1.Text = FlatEdit1.Text
Form2.Text2.Text = FlatEdit2.Text
End Sub

Private Sub PushButton2_Click()
FlatEdit1.Text = GenerateKey(8)
End Sub
Private Function GenerateKey(KeyLaenge As Byte) As String
Dim i As Integer
Dim j As Integer
Dim vData As Integer
 Randomize (Second(Now))
 For j = 1 To KeyLaenge
  i = Int((3 * Rnd) + 1)
  Select Case i
   Case 1 'Zahlen
     vData = Int((10 * Rnd) + 1)
     GenerateKey = GenerateKey & CStr(vData)
   Case 2 'KleinBuchstaben
     vData = Int((26 * Rnd) + 1)
     GenerateKey = GenerateKey & Chr(96 + vData)
   Case 3 'GrossBuchstaben
     vData = Int((26 * Rnd) + 1)
     GenerateKey = GenerateKey & Chr(64 + vData)
  End Select
 Next j
End Function
