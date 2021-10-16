Attribute VB_Name = "Module1"

Public Function RC4ED(ByVal Data As String, ByVal Password As String) As String
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
RC4ED = StrConv(Key, vbUnicode)
End Function

