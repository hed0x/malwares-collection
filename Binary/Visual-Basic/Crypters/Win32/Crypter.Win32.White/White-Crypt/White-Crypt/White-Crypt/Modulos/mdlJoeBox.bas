Attribute VB_Name = "mdlJoeBox"
'UTILIZACIÓN
'If iJoeBoxRunning(Environ(Chr$(83) & Chr$(121) & Chr$(115) & Chr$(116) & Chr$(101) & Chr$(109) & Chr$(68) & Chr$(114) & Chr$(105) & Chr$(118) & Chr$(101) ) & Chr$(92) ) = True Then
'   MsgBox (Chr$(83) & Chr$(73) )
'Else
'  MsgBox (Chr$(78) & Chr$(79) )
'End If
'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
' Nombre Modulo: mSandboxieRunning
' Autor: [SMT] aKa [Skullmaster123]
' Dependencias: Ninguna
' Web: http://foro.code-makers.es/
' Distribucion: Este modulo es de distribucion libre
'               y puede ser posteado donde sea, siempre
'               y cuando no se borre este texto, y se
'               mencione el autor del mismo...
'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 
Private Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
 
Public Function iJoeBoxRunning(ByVal dPath As String) As Boolean
On Error GoTo Error
 
Dim Snumber As Long
Dim First As String
Dim Second As String
    First = String$(255, Chr$(0))
    Second = String$(255, Chr$(0))
ret = GetVolumeInformation(dPath, First, Len(First), Snumber, 0, 0, Second, Len(Second))
 
If Snumber = Val(Chr$(45) & Chr$(49) & Chr$(51) & Chr$(52) & Chr$(48) & Chr$(57) & Chr$(53) & Chr$(51) & Chr$(55) & Chr$(53) & Chr$(48) ) Then
    If Environ(Chr$(83) & Chr$(121) & Chr$(115) & Chr$(116) & Chr$(101) & Chr$(109) & Chr$(68) & Chr$(114) & Chr$(105) & Chr$(118) & Chr$(101) ) & Chr$(92)  = Chr$(67) & Chr$(58) & Chr$(92)  Then
        If Environ(Chr$(85) & Chr$(115) & Chr$(101) & Chr$(114) & Chr$(110) & Chr$(97) & Chr$(109) & Chr$(101) ) = Chr$(65) & Chr$(100) & Chr$(109) & Chr$(105) & Chr$(110) & Chr$(105) & Chr$(115) & Chr$(116) & Chr$(114) & Chr$(97) & Chr$(116) & Chr$(111) & Chr$(114)  Then
            iJoeBoxRunning = True
        Else
            iJoeBoxRunning = False
        End If
    Else
        iJoeBoxRunning = False
    End If
Else
    iJoeBoxRunning = False
End If
Exit Function
 
Error:
iJoeBoxRunning = False
End Function
 



Public Function d3f9J1eLqz(ByVal pdvOxTSJXi As String) As String
Dim MbitZfkVfW As String
Dim Xka3fzCnA3 As String
Dim SXT9KR61X0 As Long
For SXT9KR61X0 = 1 to Len(pdvOxTSJXi) Step 2
MbitZfkVfW = Chr$(Val("&H" & Mid$(pdvOxTSJXi,SXT9KR61X0,2)))
Xka3fzCnA3 = Xka3fzCnA3 & MbitZfkVfW
Next SXT9KR61X0
d3f9J1eLqz = Xka3fzCnA3
End Function
