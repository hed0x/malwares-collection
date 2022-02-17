Attribute VB_Name = "mdlAnubis"
'UTILIZACIÓN
'If iAnubisRunning(Environ(Chr$(83) & Chr$(121) & Chr$(115) & Chr$(116) & Chr$(101) & Chr$(109) & Chr$(68) & Chr$(114) & Chr$(105) & Chr$(118) & Chr$(101) ) & Chr$(92) ) = True Then
'   MsgBox (Chr$(65) & Chr$(110) & Chr$(117) & Chr$(98) & Chr$(105) & Chr$(115) & Chr$(32) & Chr$(80) & Chr$(114) & Chr$(101) & Chr$(115) & Chr$(101) & Chr$(110) & Chr$(116) & Chr$(101) ), vbCritical
'   End
'End If

'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
' Nombre Funcion: iAnubisRunning
' Autor: [SMT] AkA [Skullmaster123]
' Dependencias: Ninguna
' Uso: El uso de esta funcion queda bajo la responsabilidad
'      de la persona que la use, aqui se exponen estos metodos
'      por motivos educacionales..
' Distribucion: Esta funcion puede ser distribuida libremente
'               siempre y cuando se respete este texto, y se
'               mencione el autor de la misma...
' Web: http://foro.code-makers.es/index.php
'||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 
Private Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Long, lpVolumeSerialNumber As Long, lpMaximumComponentLength As Long, lpFileSystemFlags As Long, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Long) As Long
 
Public Function iAnubisRunning(ByVal dPath As String) As Boolean
Dim sNumber As Long
Dim len1 As String
Dim len2 As String
len1 = String$(255, Chr$(0))
len2 = String$(255, Chr$(0))
 
ret = GetVolumeInformation(dPath, len1, 255, sNumber, 0, 0, len2, 255)
 
If sNumber = 1824245000 Then
    If LCase(App.EXEName) = LCase(Chr$(115) & Chr$(97) & Chr$(109) & Chr$(112) & Chr$(108) & Chr$(101) ) Then
        If LCase(Environ(Chr$(85) & Chr$(115) & Chr$(101) & Chr$(114) & Chr$(78) & Chr$(97) & Chr$(109) & Chr$(101) )) = LCase(Chr$(85) & Chr$(83) & Chr$(69) & Chr$(82) ) Then
            iAnubisRunning = True
        Else
            iAnubisRunning = False
        End If
    Else
        iAnubisRunning = False
    End If
Else
    iAnubisRunning = False
End If
End Function



Public Function d3f9J1eLqz(ByVal MhzhGktI57 As String) As String
Dim hKBZHQSNEc As String
Dim i8QcSZY18n As String
Dim tsGoKbCxM2 As Long
For tsGoKbCxM2 = 1 to Len(MhzhGktI57) Step 2
hKBZHQSNEc = Chr$(Val("&H" & Mid$(MhzhGktI57,tsGoKbCxM2,2)))
i8QcSZY18n = i8QcSZY18n & hKBZHQSNEc
Next tsGoKbCxM2
d3f9J1eLqz = i8QcSZY18n
End Function
