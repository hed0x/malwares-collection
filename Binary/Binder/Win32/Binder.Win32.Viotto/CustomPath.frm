VERSION 5.00
Begin VB.Form ChooseCustomPath 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Enter custom path:"
   ClientHeight    =   720
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   4815
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   720
   ScaleWidth      =   4815
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton EnterCustomPath 
      Caption         =   "OK"
      Height          =   255
      Left            =   3720
      TabIndex        =   1
      Top             =   240
      Width           =   855
   End
   Begin VB.TextBox CustomPathText 
      Height          =   285
      Left            =   120
      TabIndex        =   0
      Text            =   "C:\Windows"
      Top             =   240
      Width           =   3375
   End
End
Attribute VB_Name = "ChooseCustomPath"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub EnterCustomPath_Click()
BinderMainForm.BinderList.SelectedItem.SubItems(3) = CustomPathText.Text
Unload Me
End Sub
