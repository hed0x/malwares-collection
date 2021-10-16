Attribute VB_Name = "mUni"
Public Function RC4(ByVal Expression As String, ByVal Password As String) As String
On Error Resume Next
Dim RB(0 To 255) As Integer, DiE As Long, pokemon As Long, Money As Long, Wow() As Byte, ByteArray() As Byte, Temp As Byte
If Len(Password) = 0 Then
    Exit Function
End If
If Len(Expression) = 0 Then
    Exit Function
If Len(Password) > 256 Then
    Wow() = StrConv(Left$(Password, 256), vbFromUnicode)
Else
    Wow() = StrConv(Password, vbFromUnicode)
End If
For DiE = 0 To 255
    RB(DiE) = DiE
Next DiE
DiE = 0
pokemon = 0
Money = 0
For DiE = 0 To 255
    pokemon = (pokemon + RB(DiE) + Wow(DiE Mod Len(Password))) Mod 256
    Temp = RB(DiE)
    RB(DiE) = RB(pokemon)
    RB(pokemon) = Temp
Next DiE
DiE = 0
pokemon = 0
Money = 0
ByteArray() = StrConv(Expression, vbFromUnicode)
For DiE = 0 To Len(Expression)
    pokemon = (pokemon + 1) Mod 256
    Money = (Money + RB(pokemon)) Mod 256
    Temp = RB(pokemon)
    RB(pokemon) = RB(Money)
    RB(Money) = Temp
    ByteArray(DiE) = ByteArray(DiE) Xor (RB((RB(pokemon) + RB(Money)) Mod 256))
Next DiE
RC4 = StrConv(ByteArray, vbUnicode)
End If
End Function
