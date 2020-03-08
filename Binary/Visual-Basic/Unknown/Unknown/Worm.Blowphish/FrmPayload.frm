   VERSION 5.00
   Begin VB.Form frmPayload
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ClientHeight    =   1395
      ClientLeft      =   0
      ClientTop       =   0
      ClientWidth     =   2265
      ForeColor       =   &H00FFFFFF&
      LinkTopic       =   "Form1"
      MaxButton       =   0   'False
      MinButton       =   0   'False
      ScaleHeight     =   93
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   151
      ShowInTaskbar   =   0   'False
      StartUpPosition =   3  'Windows Default
      WindowState     =   2  'Maximized
      Begin VB.PictureBox Picture1
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         FillColor       =   &H00FFFFFF&
         ForeColor       =   &H00FFFFFF&
         Height          =   855
         Left            =   120
         Picture         =   "FrmPayload.frx":0000
         ScaleHeight     =   825
         ScaleWidth      =   2025
         TabIndex        =   0
         Top             =   120
         Width           =   2055
      End
      Begin VB.Label Label1
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "* Feeling Dizzy?"
         BeginProperty Font
            Name            =   "Terminal"
            Size            =   6
            Charset         =   255
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   135
         Left            =   120
         TabIndex        =   1
         Top             =   1080
         Width           =   1575
      End
   End
   Attribute VB_Name = "frmPayload"
   Attribute VB_GlobalNameSpace = False
   Attribute VB_Creatable = False
   Attribute VB_PredeclaredId = True
   Attribute VB_Exposed = False
   Private Declare Function GetDC Lib "USER32" (ByVal hwnd As Long) As Long
   Private Declare Function ReleaseDC Lib "USER32" (ByVal hwnd As Long, ByVal hDC As Long) As Long
   Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
   Private lngDC As Long
   Private blnLoop As Boolean
   Dim m1 As Integer, m2 As Integer, z1 As Integer, z2 As Integer
   Dim k1 As Integer, k2 As Integer

   Sub doeffect()
   Dim intX As Integer, intY As Integer
   Dim intI As Integer, intJ As Integer
   Dim intWidth As Integer, intHeight As Integer
   intWidth = Screen.Width / Screen.TwipsPerPixelX
   intHeight = Screen.Height / Screen.TwipsPerPixelY
   frmPayload.Width = Screen.Width
   frmPayload.Height = Screen.Height
   lngDC = GetDC(0)
   Call BitBlt(hDC, 0, 0, intWidth, intHeight, lngDC, 0, 0, vbSrcCopy)
   frmPayload.Visible = vbTrue
   frmPayload.AutoRedraw = vbFalse
   Randomize
   blnLoop = vbTrue
   Do While blnLoop = vbTrue
   intX = (intWidth) * Rnd
   intY = (intHeight) * Rnd
   intI = m1 * Rnd - z1
   intJ = m2 * Rnd - z2
   Call BitBlt(frmPayload.hDC, intX + intI, intY + intJ, k1, k2, frmPayload.hDC, intX, intY, vbSrcCopy)
   DoEvents
   Loop
   Set frmPayload = Nothing
   Call ReleaseDC(0, lngDC)
   Unload Me
   End Sub

   Private Sub Form_Load()
   Dim ef As Integer
   ef = Form1.Tag
   z1 = 1: z2 = 1: k1 = 128: k2 = 128
   Select Case ef
   Case 0
   m1 = 2: m2 = 2

   Case 1
   m1 = 2: m2 = 2
   k1 = 100: k2 = 10

   Case 2
   m1 = 1: m2 = 1
   k1 = 1: k2 = 1
   z1 = -2: z2 = 10

   End Select
   End Sub
