VERSION 5.00
Begin VB.Form FrmLicense 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "License Agreement"
   ClientHeight    =   4290
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6495
   Icon            =   "FrmLicense.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4290
   ScaleWidth      =   6495
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton OKCmd 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   5400
      TabIndex        =   1
      Top             =   3840
      Width           =   975
   End
   Begin VB.TextBox LicenseText 
      ForeColor       =   &H00000000&
      Height          =   3615
      Left            =   120
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      Text            =   "FrmLicense.frx":030A
      Top             =   120
      Width           =   6255
   End
End
Attribute VB_Name = "FrmLicense"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub OKCmd_Click()
    Unload Me
End Sub
