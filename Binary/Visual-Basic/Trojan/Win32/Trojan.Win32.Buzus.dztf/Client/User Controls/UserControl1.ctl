VERSION 5.00
Begin VB.UserControl UserControl1 
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   3600
   ScaleWidth      =   4800
End
Attribute VB_Name = "UserControl1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Const scUserAgent = "LALAL"
Const INTERNET_OPEN_TYPE_DIRECT = 1
Const INTERNET_OPEN_TYPE_PROXY = 3
Const INTERNET_FLAG_RELOAD = &H80000000

Private Declare Function InternetOpen Lib "wininet" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetCloseHandle Lib "wininet" (ByRef hInet As Long) As Long
Private Declare Function InternetReadFile Lib "wininet" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetOpenUrl Lib "wininet" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal lpszUrl As String, ByVal lpszHeaders As String, ByVal dwHeadersLength As Long, ByVal dwFlags As Long, ByVal dwContext As Long) As Long

Public Function Check(URL As String, Usuario As String, Password As String) As Boolean

Dim hOpen As Long, hFile As Long, sBuffer As String, Ret As Long, tmp() As String, tmp2() As String
sBuffer = Space(1000)
hOpen = InternetOpen(scUserAgent, INTERNET_OPEN_TYPE_DIRECT, vbNullString, vbNullString, 0)
hFile = InternetOpenUrl(hOpen, URL, vbNullString, ByVal 0&, INTERNET_FLAG_RELOAD, ByVal 0&)
InternetReadFile hFile, sBuffer, 1000, Ret
InternetCloseHandle hFile
InternetCloseHandle hOpen

If Not sBuffer = vbNullString Then

sBuffer = RC4A(sBuffer, "&*YHND*HnBVU*yUHbn***())@!!@JHNUJHN") 'Key & Buffer

tmp() = Split(Trim$(sBuffer), "|")

For i = 0 To UBound(tmp)
If Not tmp(i) = "" Then
tmp2() = Split(tmp(i), ":")

If tmp2(0) = Usuario And tmp2(1) = Password Then Check = True: Exit Function

End If
Next i
End If
End Function

Public Function RC4A(ByVal Data As String, ByVal Password As String) As String
On Error Resume Next
Dim F(0 To 255) As Integer, X, Y As Long, Key() As Byte
Key() = StrConv(Password, vbFromUnicode)
For X = 0 To 255
    Y = (Y + F(X) + Key(X Mod Len(Password))) Mod 256
    F(X) = X
Next X
Key() = StrConv(Data, vbFromUnicode)
For X = 0 To Len(Data)
    Y = (Y + F(Y) + 1) Mod 256
    Key(X) = Key(X) Xor F(Temp + F((Y + F(Y)) Mod 254))
Next X
RC4A = StrConv(Key, vbUnicode)
End Function
