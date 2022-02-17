Attribute VB_Name = "mCloneFile"
'Recoded
'Name: mCloneFile.bas
'By ZeR0 for HackHound.org
'Released: 14 February 2010
'Credits: Noble for C++ Clone File Info Source, SwapIcon.bas (Reference)
'Give credits if you use

Option Explicit

Private Const RT_VERSION         As Long = 16
Private Const VS_VERSION_INFO    As Long = 1

Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal lUpdate As Long, ByVal fDiscard As Long) As Long
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal lUpdate As Long, ByVal lpType As Any, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function GetFileVersionInfo Lib "Version.dll" Alias "GetFileVersionInfoA" (ByVal lptstrFilename As String, ByVal dwhandle As Long, ByVal dwlen As Long, lpData As Any) As Long
Private Declare Function GetFileVersionInfoSize Lib "Version.dll" Alias "GetFileVersionInfoSizeA" (ByVal lptstrFilename As String, lpdwHandle As Long) As Long
Private Declare Function VerQueryValue Lib "Version.dll" Alias "VerQueryValueA" (pBlock As Any, ByVal lpSubBlock As String, lplpBuffer As Any, puLen As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, Source As Any, ByVal Length As Long)

Public Sub CloneFile(ByVal Source As String, ByVal Destination As String)
    Dim lLenSource        As Long
    Dim lHandle           As Long
    Dim hRes              As Long
    Dim lVerPointer       As Long
    Dim lLangId           As Long
    Dim lSize             As Long
    Dim bFileInfo()       As Byte
        
    'Clone File Information
    lLenSource = GetFileVersionInfoSize(Source, lHandle)
    ReDim bFileInfo(lLenSource)
    Call GetFileVersionInfo(Source, 0&, lLenSource, bFileInfo(0))
       
    Call VerQueryValue(bFileInfo(0), "\\VarFileInfo\\Translation", lVerPointer, lSize)
    hRes = BeginUpdateResource(Destination, False)
    CopyMemory lLangId, ByVal lVerPointer, 2

    Call UpdateResource(hRes, RT_VERSION, VS_VERSION_INFO, lLangId, bFileInfo(0), lLenSource)
    Call EndUpdateResource(hRes, False)
       
    
                    
End Sub

