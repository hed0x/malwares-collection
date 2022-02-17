Attribute VB_Name = "Module9"
Option Explicit

'NTDLL
Private Declare Function LdrLoadDll Lib "NTDLL" (ByVal pWPathToFile As Long, ByVal Flags As Long, ByRef pwModuleFileName As UNICODE_STRING, ByRef ModuleHandle As Long) As Long
Private Declare Function LdrGetProcedureAddress Lib "NTDLL" (ByVal ModuleHandle As Long, ByRef paFunctionName As Long, ByVal Ordinal As Integer, ByRef FunctionAddress As Long) As Long
Private Declare Sub RtlInitUnicodeString Lib "NTDLL" (DestinationString As Any, ByVal SourceString As Long)

Private Type UNICODE_STRING
    uLength         As Integer
    uMaximumLength  As Integer
    pBuffer         As Long
End Type

Public Function NtLoadLibrary(ByVal sName As String) As Long
    Dim US          As UNICODE_STRING
   
    Call RtlInitUnicodeString(US, StrPtr(sName))
    Call LdrLoadDll(ByVal 0&, ByVal 0&, US, NtLoadLibrary)
End Function

Public Function NtGetProcAddr(ByVal lModuleHandle As Long, ByVal sProc As String) As Long
    Dim i           As Long
    Dim ANSI()      As Byte
   
    ReDim ANSI(0 To Len(sProc))
    For i = 1 To Len(sProc)
        ANSI(i - 1) = Asc(Mid$(sProc, i, 1))
    Next i
   
    Call LdrGetProcedureAddress(lModuleHandle, VarPtr(ANSI(0)), ByVal 0&, NtGetProcAddr)
End Function

