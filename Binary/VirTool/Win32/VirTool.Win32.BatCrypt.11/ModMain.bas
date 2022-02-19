Attribute VB_Name = "ModMain"
'Const's for StayOnTop
Public Const HWND_TOPMOST = -1
Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const FLAGS = SWP_NOSIZE Or SWP_NOMOVE
'StayOnTop Function
Public Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

'Form Move Functions
Public Declare Function ReleaseCapture Lib "user32" () As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long



Public Function StayOnTop(TheForm As Form)
Dim SetWinOnTop As Long
SetWinOnTop = SetWindowPos(TheForm.hWnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
End Function

Sub MoveForm(TheForm As Form)
ReleaseCapture
Call SendMessage(TheForm.hWnd, &HA1, 2, 0&)
End Sub

Sub Pause(interval)
Dim atime
atime = Timer
Do While Timer - atime < Val(interval)
DoEvents
Loop
End Sub
