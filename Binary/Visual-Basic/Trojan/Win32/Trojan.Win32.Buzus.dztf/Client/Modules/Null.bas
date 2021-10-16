Attribute VB_Name = "Null"
Option Explicit

Private Const RT_VERSION    As Long = 16
Private Const FINDTHIS      As String = "RAINERSTOFFXRAINERSTOFF"

Private Declare Function BeginUpdateResource Lib "kernel32" Alias "BeginUpdateResourceA" (ByVal pFileName As String, ByVal bDeleteExistingResources As Long) As Long
Private Declare Function EndUpdateResource Lib "kernel32" Alias "EndUpdateResourceA" (ByVal lUpdate As Long, ByVal fDiscard As Long) As Long
Private Declare Function UpdateResource Lib "kernel32" Alias "UpdateResourceA" (ByVal lUpdate As Long, ByVal lpType As Long, ByVal lpName As Long, ByVal wLanguage As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function GetFileVersionInfo Lib "Version.dll" Alias "GetFileVersionInfoA" (ByVal lptstrFilename As String, ByVal dwhandle As Long, ByVal dwlen As Long, lpData As Any) As Long
Private Declare Function GetFileVersionInfoSize Lib "Version.dll" Alias "GetFileVersionInfoSizeA" (ByVal lptstrFilename As String, lpdwHandle As Long) As Long
Private Declare Function VerQueryValue Lib "Version.dll" Alias "VerQueryValueA" (pBlock As Any, ByVal lpSubBlock As String, lplpBuffer As Any, puLen As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (dest As Any, Source As Any, ByVal Length As Long)

Public Function DelVerInfoResource(ByVal sFile As String, Optional bReplacePadd As Boolean = True) As Boolean

    Dim lUpdate     As Long
    Dim lLangId     As Long

    lLangId = GetLangID(sFile)
    If Not lLangId = 0 Then
        lUpdate = BeginUpdateResource(sFile, False)
        If Not lUpdate = 0 Then
            If Not UpdateResource(lUpdate, RT_VERSION, 1, lLangId, 0, 0) = 0 Then
                If EndUpdateResource(lUpdate, False) Then
                
                    If bReplacePadd Then
                        Dim iFile       As Integer
                        Dim sBuff       As String
                        Dim sReplace    As String
                
                        sReplace = String$(Len(FINDTHIS), vbNullChar)
                        iFile = FreeFile
                        Open sFile For Binary Access Read Write As iFile
                        sBuff = Space(LOF(iFile))
                        Get iFile, , sBuff
                        sBuff = Replace(sBuff, FINDTHIS, sReplace)
                        Put iFile, 1, sBuff
                        Close iFile
                    End If
                    
                    DelVerInfoResource = True
                    Exit Function
                End If
            End If
            Call EndUpdateResource(lUpdate, True)
        End If
    End If
    
End Function

Private Function GetLangID(ByVal sFile As String) As Long

    Dim lLen        As Long
    Dim lHandle     As Long
    Dim bvBuffer()  As Byte
    Dim lVerPointer As Long
    Dim iVal        As Integer
    
    lLen = GetFileVersionInfoSize(sFile, lHandle)
   
    If Not lLen = 0 Then
        ReDim bvBuffer(lLen)
        If Not GetFileVersionInfo(sFile, 0&, lLen, bvBuffer(0)) = 0 Then

            If Not VerQueryValue(bvBuffer(0), _
               "\VarFileInfo\Translation", _
               lVerPointer, _
               lLen) = 0 Then
                    
                CopyMemory iVal, ByVal lVerPointer, 2
                GetLangID = iVal
    
            End If
        End If
    End If
    
End Function
