Attribute VB_Name = "modcomputername"
Option Explicit
Private Declare Function GetComputerName Lib "kernel32" _
Alias "GetComputerNameA" (ByVal lpBuffer As String, _
nSize As Long) As Long

Public Function ComputerName() As String
Dim lsBuffer                   As String
Dim llReturn                   As Long
Dim lsName                     As String
 
lsName = ""
lsBuffer = Space$(255)
llReturn = GetComputerName(lsBuffer, 255)
  
If llReturn Then
lsName = Left$(lsBuffer, InStr(lsBuffer, Chr(0)) - 1)
End If
  
ComputerName = lsName
End Function

