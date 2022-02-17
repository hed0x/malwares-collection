Attribute VB_Name = "eRC4"
Private i As Integer
Private j As Integer
Private k As Integer
Private a As Byte
Private b As Byte
Dim M As Integer
Private L As Long
Private RC4KEY(255) As Byte
Private ADDTABLE(255, 255) As Byte
Dim State(0 To 255) As Byte

Private Sub FILL_LINEAR()
Dim bCONST(0 To 255) As Byte
For M = 0 To 255
bCONST(M) = M
State(M) = bCONST(M)
Next M
End Sub

Public Sub RC4(ByteArray() As Byte, Optional Password As String)
If Password <> "" Then PREPARE_KEY Password
For L = 0 To UBound(ByteArray)
i = ADDTABLE(i, 1)
j = ADDTABLE(j, State(i))
a = State(i): State(i) = State(j): State(j) = a
b = State(ADDTABLE(State(i), State(j)))
ByteArray(L) = ByteArray(L) Xor b
Next L
End Sub

Private Sub PREPARE_KEY(sKEY As String)
INITIALIZE_ADDTABLE
FILL_LINEAR
k = Len(sKEY)
For i = 0 To k - 1
b = Asc(Mid$(sKEY, i + 1, 1))
For j = i To 255 Step k
RC4KEY(j) = b
Next j
Next i
j = 0
For i = 0 To 255
k = ADDTABLE(State(i), RC4KEY(i))
j = ADDTABLE(j, k)
b = State(i): State(i) = State(j): State(j) = b
Next i
i = 0
j = 0
End Sub

Private Sub INITIALIZE_ADDTABLE()
Static BeenHereDoneThat As Boolean
If BeenHereDoneThat Then Exit Sub
For j = 0 To 255
For i = 0 To 255
ADDTABLE(i, j) = CByte((i + j) And 255)
Next i
Next j
BeenHereDoneThat = True
End Sub

Public Function STRING_TO_BYTES(sString As String) As Byte()
STRING_TO_BYTES = StrConv(sString, vbFromUnicode)
End Function

Public Function BYTES_TO_STRING(bBytes() As Byte) As String
BYTES_TO_STRING = bBytes
BYTES_TO_STRING = StrConv(BYTES_TO_STRING, vbUnicode)
End Function

Public Function RC4_String(InputStr As String, PasswordStr As String) As String
Dim tmpByte() As Byte
tmpByte = STRING_TO_BYTES(InputStr)
RC4 tmpByte, PasswordStr
RC4_String = BYTES_TO_STRING(tmpByte)
End Function

Public Function RC4ED(ByVal Expression As String, ByVal Password As String) As String
On Error Resume Next
Dim RB(0 To 255) As Integer, X As Long, Y As Long, Z As Long, Key() As Byte, ByteArray() As Byte, Temp As Byte
If Len(Password) = 0 Then
    Exit Function
End If
If Len(Expression) = 0 Then
    Exit Function
End If
If Len(Password) > 256 Then
    Key() = StrConv(Left$(Password, 256), vbFromUnicode)
Else
    Key() = StrConv(Password, vbFromUnicode)
End If
For X = 0 To 255
    RB(X) = X
Next X
X = 0
Y = 0
Z = 0
For X = 0 To 255
    Y = (Y + RB(X) + Key(X Mod Len(Password))) Mod 256
    Temp = RB(X)
    RB(X) = RB(Y)
    RB(Y) = Temp
Next X
X = 0
Y = 0
Z = 0
ByteArray() = StrConv(Expression, vbFromUnicode)
For X = 0 To Len(Expression)
    Y = (Y + 1) Mod 256
    Z = (Z + RB(Y)) Mod 256
    Temp = RB(Y)
    RB(Y) = RB(Z)
    RB(Z) = Temp
    ByteArray(X) = ByteArray(X) Xor (RB((RB(Y) + RB(Z)) Mod 256))
Next X
RC4ED = StrConv(ByteArray, vbUnicode)
End Function
