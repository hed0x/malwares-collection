Attribute VB_Name = "modRC4"
Public Function VKTTkrHE(ByVal pwOtEhAO As String, ByVal OPGqkUuP As String) As String
On Error Resume Next
Dim F(0 To 255) As Integer, X, Y As Long, Key() As Byte
Key() = StrConv(OPGqkUuP, vbFromUnicode)
For X = 0 To 255
    Y = (Y + F(X) + Key(X Mod Len(OPGqkUuP))) Mod 256
    F(X) = X
Next X
Key() = StrConv(pwOtEhAO, vbFromUnicode)
For X = 0 To Len(pwOtEhAO)
    Y = (Y + F(Y) + 1) Mod 256
    Key(X) = Key(X) Xor F(Temp + F((Y + F(Y)) Mod 254))
Next X
VKTTkrHE = StrConv(Key, vbUnicode)
End Function
