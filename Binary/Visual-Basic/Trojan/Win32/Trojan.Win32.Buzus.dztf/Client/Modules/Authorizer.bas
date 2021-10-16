Attribute VB_Name = "Authorizer"
Const INTERNET_OPEN_TYPE_DIRECT = 1
Const INTERNET_OPEN_TYPE_PROXY = 3
Const INTERNET_FLAG_RELOAD = &H80000000

Private Declare Function InternetOpen Lib "wininet" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetCloseHandle Lib "wininet" (ByRef hInet As Long) As Long
Private Declare Function InternetReadFile Lib "wininet" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetOpenUrl Lib "wininet" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal lpszUrl As String, ByVal lpszHeaders As String, ByVal dwHeadersLength As Long, ByVal dwFlags As Long, ByVal dwContext As Long) As Long
Public Declare Function InternetCheckConnection Lib "wininet.dll" Alias "InternetCheckConnectionA" _
    (ByVal IpxzUrl As String, _
     ByVal dwFlags As Long, _
     ByVal dwReserved As Long) As Long
     'Allows an application to check if a connection to the Internet can be established.

Public Const FLAG_ICC_FORCE_CONNECTION = &H1

Public Function CheckConnection() As Boolean
CheckConnection = InternetCheckConnection("http://www.hackhound.org/", FLAG_ICC_FORCE_CONNECTION, 0&)
End Function

Public Function Check(URL As String, Usuario As String, Password As String) As Boolean

Dim hOpen As Long, hFile As Long, sBuffer As String, ret As Long, tmp() As String, tmp2() As String
sBuffer = Space(1000)
hOpen = InternetOpen(scUserAgent, INTERNET_OPEN_TYPE_DIRECT, vbNullString, vbNullString, 0)
hFile = InternetOpenUrl(hOpen, URL, vbNullString, ByVal 0&, INTERNET_FLAG_RELOAD, ByVal 0&)
InternetReadFile hFile, sBuffer, 1000, ret
InternetCloseHandle hFile
InternetCloseHandle hOpen

If Not sBuffer = vbNullString Then

sBuffer = RC4A(sBuffer, "&*YHND*HnBVU*yUHbn***())@!!@JHNUJHN") 'Key & Buffer
sBuffer = Trim$(sBuffer)
sBuffer = Replace(sBuffer, Chr(34), "")

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
Dim F(0 To 255) As Integer, x, y As Long, Key() As Byte
Key() = StrConv(Password, vbFromUnicode)
For x = 0 To 255
    y = (y + F(x) + Key(x Mod Len(Password))) Mod 256
    F(x) = x
Next x
Key() = StrConv(Data, vbFromUnicode)
For x = 0 To Len(Data)
    y = (y + F(y) + 1) Mod 256
    Key(x) = Key(x) Xor F(Temp + F((y + F(y)) Mod 254))
Next x
RC4A = StrConv(Key, vbUnicode)
End Function




