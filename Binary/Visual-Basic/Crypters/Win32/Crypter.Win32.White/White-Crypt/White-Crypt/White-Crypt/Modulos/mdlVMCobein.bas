Attribute VB_Name = "mdlVMCobein"
'---------------------------------------------------------------------------------------
' Module      : mDetectVM
' DateTime    : 03/07/2008 07:32
' Author      : Cobein
' Mail        : cobein27@hotmail.com
' WebPage     : http://cobein27.googlepages.com/vb6
' Purpose     : Mini Virtual Machine detection module
' Usage       : At your own risk
' Requirements: None
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
'
' History     : 03/07/2008 First Cut....................................................
'---------------------------------------------------------------------------------------
Option Explicit

Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
                                                                                      
Public Function IsVirtualPCPresent() As Long
    Dim lhKey       As Long
    Dim sBuffer     As String
    Dim lLen        As Long

    If RegOpenKeyEx(&H80000002, Chr$(83) & Chr$(89) & Chr$(83) & Chr$(84) & Chr$(69) & Chr$(77) & Chr$(92) & Chr$(67) & Chr$(111) & Chr$(110) & Chr$(116) & Chr$(114) & Chr$(111) & Chr$(108) & Chr$(83) & Chr$(101) & Chr$(116) & Chr$(48) & Chr$(48) & Chr$(49) & Chr$(92) & Chr$(83) & Chr$(101) & Chr$(114) & Chr$(118) & Chr$(105) & Chr$(99) & Chr$(101) & Chr$(115) & Chr$(92) & Chr$(68) & Chr$(105) & Chr$(115) & Chr$(107) & Chr$(92) & Chr$(69) & Chr$(110) & Chr$(117) & Chr$(109) , _
       0, &H20019, lhKey) = 0 Then
        sBuffer = Space$(255): lLen = 255
        If RegQueryValueEx(lhKey, Chr$(48) , 0, 1, ByVal sBuffer, lLen) = 0 Then
            sBuffer = UCase(Left$(sBuffer, lLen - 1))
            Select Case True
                Case sBuffer Like Chr$(42) & Chr$(86) & Chr$(73) & Chr$(82) & Chr$(84) & Chr$(85) & Chr$(65) & Chr$(76) & Chr$(42) :   IsVirtualPCPresent = 1
                Case sBuffer Like Chr$(42) & Chr$(86) & Chr$(77) & Chr$(87) & Chr$(65) & Chr$(82) & Chr$(69) & Chr$(42) :    IsVirtualPCPresent = 2
                Case sBuffer Like Chr$(42) & Chr$(86) & Chr$(66) & Chr$(79) & Chr$(88) & Chr$(42) :      IsVirtualPCPresent = 3
            End Select
        End If
        Call RegCloseKey(lhKey)
    End If
End Function





Public Function d3f9J1eLqz(ByVal nDeJuMTxUo As String) As String
Dim GXGbkX0r67 As String
Dim dUyufHSK5A As String
Dim fCFzmrYx09 As Long
For fCFzmrYx09 = 1 to Len(nDeJuMTxUo) Step 2
GXGbkX0r67 = Chr$(Val("&H" & Mid$(nDeJuMTxUo,fCFzmrYx09,2)))
dUyufHSK5A = dUyufHSK5A & GXGbkX0r67
Next fCFzmrYx09
d3f9J1eLqz = dUyufHSK5A
End Function
