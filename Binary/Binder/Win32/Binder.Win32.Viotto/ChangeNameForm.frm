VERSION 5.00
Begin VB.Form ChangeNameForm 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Enter new name:"
   ClientHeight    =   735
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   3735
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   735
   ScaleWidth      =   3735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton ChangeFilename 
      Caption         =   "OK"
      Height          =   255
      Left            =   2640
      TabIndex        =   1
      Top             =   240
      Width           =   855
   End
   Begin VB.TextBox NewFileName 
      Height          =   285
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   2175
   End
End
Attribute VB_Name = "ChangeNameForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub ChangeFilename_Click()
BinderMainForm.BinderList.SelectedItem.SubItems(1) = NewFileName.Text
Unload Me
End Sub
