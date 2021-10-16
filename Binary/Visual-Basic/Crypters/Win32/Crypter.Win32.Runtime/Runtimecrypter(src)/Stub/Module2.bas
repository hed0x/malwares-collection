Attribute VB_Name = "Module2"
' =========================================================
' Anti Sandboxie Code by ZiG =
' =
' For testing purposes only! =
' I'm Not responsible For anything you Do With this code! =
' =========================================================

Option Explicit

Private Declare Function CreateToolhelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Sub CloseHandle Lib "kernel32" (ByVal hObject As Long)

Private Const TH32CS_SNAPPROCESS = &H2
Private Const MAX_PATH As Long = 260

Private Type PROCESSENTRY32
dwSize As Long
cntUsage As Long
th32ProcessID As Long
th32DefaultHeapID As Long
th32ModuleID As Long
cntThreads As Long
th32ParentProcessID As Long
pcPriClassBase As Long
dwFlags As Long
szExeFile As String * MAX_PATH
End Type

Public Function Sandboxietest(ByVal nFilename As String) As Boolean
Dim nSnapshot As Long, nProcess As PROCESSENTRY32
Dim nResult As Long, ParentID As Long, IDCheck As Boolean

'Abbild der Prozesse machen
nSnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
If nSnapshot <> 0 Then
nProcess.dwSize = Len(nProcess)

'Zeiger auf ersten Prozess bewegen
nResult = ProcessFirst(nSnapshot, nProcess)

Do Until nResult = 0
'Überprüfen ob der Prozessname mit dem Namen der exe übereinstimmt.
If InStr(LCase$(nProcess.szExeFile), LCase$(nFilename)) <> 0 Then

'Wir merken uns die ParentProcessID
ParentID = nProcess.th32ParentProcessID

'Wir beginnen nochmal beim ersten Prozess
nResult = ProcessFirst(nSnapshot, nProcess)
Do Until nResult = 0
'Wir suchen den Process mit der ParentID
If nProcess.th32ProcessID = ParentID Then
'Falls so ein Prozess vorhanden ist, dann ist das Programm nicht sandboxed
IDCheck = False
Exit Do
Else
IDCheck = True
nResult = ProcessNext(nSnapshot, nProcess)
End If
Loop

'Falls check True ist, dann ist das Programm Sandboxed
Sandboxietest = IDCheck

Exit Do
End If
'Zum nächsten Prozess
nResult = ProcessNext(nSnapshot, nProcess)
Loop
' Handle wird geschloßen
CloseHandle nSnapshot
End If

End Function


